import matlab.unittest.TestSuite
import matlab.unittest.TestRunner
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat
import matlab.unittest.Verbosity

suite = TestSuite.fromFolder('tests', 'IncludingSubfolders', true);
runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);

top_path = mfilename('fullpath');
top_path(end - length(mfilename):end) =  [];
top_path = fullfile(top_path,'..');
runner.addPlugin(CodeCoveragePlugin.forFolder(top_path,...
                                              'IncludingSubfolders', true,...
                                              'Producing', CoberturaFormat('coverage.xml')))

addpath(fullfile(top_path, 'code'))                                          
result = runner.run(suite);
num_failed = sum(horzcat(result.Failed));
assertSuccess(result)


% %%
% % Copyright 2021 The MathWorks, Inc.
% 
% import matlab.unittest.TestRunner
% import matlab.unittest.Verbosity
% import matlab.unittest.plugins.CodeCoveragePlugin
% import matlab.unittest.plugins.codecoverage.CoberturaFormat
%  
% % Add the source folder to the MATLAB search path 
% addpath('source') 
%  
% % Create a test suite 
% suite = testsuite(pwd,'IncludeSubfolders',true);
% 
% % Create a test runner that displays test run progress at the matlab.unittest.Verbosity.Detailed level
% runner = TestRunner.withTextOutput('OutputDetail',Verbosity.Detailed); 
% 
% % Create a CodeCoveragePlugin instance and add it to the test runner
% sourceFolder = 'source';
% reportFile = 'cobertura.xml';
% reportFormat = CoberturaFormat(reportFile);
% p = CodeCoveragePlugin.forFolder(sourceFolder,'IncludingSubfolders', true,'Producing',reportFormat);
% runner.addPlugin(p)
%  
% % Run the tests and fail the build if any of the tests fails 
% results = runner.run(suite);  
% nfailed = nnz([results.Failed]);
% dir
% % assert(nfailed == 0,[num2str(nfailed) ' test(s) failed.'])