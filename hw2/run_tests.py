from robot import run
import os

current_dir = os.path.dirname(os.path.abspath(__file__))
test_file = os.path.join(current_dir, 'login_tests.robot')

browsers = ['Chrome', 'Firefox', 'Safari']

for browser in browsers:
    print(f"\nRunning tests on {browser}")
    run(test_file, 
        variable=f'BROWSER:{browser}',
        outputdir=os.path.join(current_dir, 'results', browser.lower()),
        log=f'{browser.lower()}_log.html',
        report=f'{browser.lower()}_report.html')