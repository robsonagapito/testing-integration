/**
 * Created by robson on 30/08/2017.
 */

import cucumber.api.cli.Main;
import reports.JsonReport;

public class RunnerTest {
    public RunnerTest() {
    }

    public static void main(String[] args) throws Exception {
        String reportDirName = "CucumberReport";
        String reportDirLast = "target/reports/";
        String execFeaturesFolder = "src/main/java/features/";
        String glue = "steps";
        String[] plugins = new String[]{"pretty", "json:" + reportDirLast + reportDirName + ".json"};
        String[] arguments = new String[]{"-m", "-p", plugins[0], "-p", plugins[1], "-g", glue, execFeaturesFolder};
        int i = Main.run(arguments, Thread.currentThread().getContextClassLoader());
        JsonReport.generateFinalReport(reportDirLast, reportDirLast, "CucumberLastReport");
    }
}