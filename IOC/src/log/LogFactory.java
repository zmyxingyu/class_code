package log;


import java.lang.reflect.Constructor;

import log.loggers.JDKLog;


@SuppressWarnings({ "unchecked", "rawtypes" })
public class LogFactory {
	private static Class<?> logClass;
	private static Constructor<?> logConstructor;
	private static String levelName = "debug";

	public static Log getLog(String name) {
		try {

			if (logConstructor == null) {
				synchronized (LogFactory.class) {
					if (logConstructor == null)
						logConstructor = logClass.getConstructor(String.class);
				}
			}

			Log log = (Log) logConstructor.newInstance(name);
			log.setLevel(levelName);
			return log;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static Log getLog(Class<?> clazz) {
		return getLog(clazz.getName());
	}

	public static Log getLog() {
		return new JDKLog("JDKLog");
	}
}
