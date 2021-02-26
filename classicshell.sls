classicshell:
  {% for (version, hash, guid_64, guid_32) in [
      ('4.3.1', 'd5llbbm8wu92jg8', '{CABCE573-0A86-42FA-A52A-C7EA61D5BE08}', '{8A99142D-5D6E-40B6-AF88-8BD46F0C5CB4}'),
      ('4.2.4', 'wl5nbjaki7zbssn', '{E289B7DD-6732-4333-A47A-75A145D23EE3}', '{B9EFC38D-E52A-4BBE-8421-58FCFFDE19E2}')
  ] %}
  '{{ version }}':
    full_name: 'Classic Shell'
    installer: 'https://www.fosshub.com/Classic-Shell.html?dwl=ClassicShellSetup_{{ version | replace(".", "_") }}.exe'
    install_flags: '/passive'
    uninstaller: 'msiexec.exe'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstall_flags: '/qn /x {{ guid_64 }} /norestart'
    {% else %}
    uninstall_flags: '/qn /x {{ guid_32 }} /norestart'
    {% endif %}
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
