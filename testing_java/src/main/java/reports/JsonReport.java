package reports;


import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.Reportable;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class JsonReport {
    public static void generateFinalReport(String jsonInputDir, String reportOutputDir, String projectName){

        List<String> jsonFiles = new ArrayList<String>();

        try{
            Path pp = Paths.get(new File(jsonInputDir).getAbsolutePath());
            Files.walk(pp)
                    .filter(path -> !Files.isDirectory(path))
                    .forEach(path -> jsonFiles.add(path.toAbsolutePath().toString()));

        } catch (Exception e) {
            System.err.println(e);
        }


        // GENERATING Report
        Configuration configuration = new Configuration(new File(reportOutputDir), projectName);

        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
        Reportable result = reportBuilder.generateReports();

        // and here validate 'result' to decide what to do
        // if report has failed features, undefined steps etc
    }
}

