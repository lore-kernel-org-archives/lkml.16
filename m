Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3830624677B;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320365; cv=none; b=WoMcEdKThPN9/B8BhyAS5/7c9Tr3zrG1ZkNW75r+I9f6etLFTCUJbORZVrY/7LtbBU7IKpCVN20+/k4D2+AjSVxicI7WxM3R3TOGrkpqbkVY0axCO2iXTfilcdwttEZ5qBUO6c+fyqZe9KX0MuRS3S/3Bu/22jmztrzCfgIBqWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320365; c=relaxed/simple;
	bh=nm/MOABnlL9MNVwqwrrw0H7SIIDrR6b8+mGPh5LEKzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtdE3juahWBqZd8xZGpFRKWp5WTSPKFXoPl3LuUBMEdlXHEOacyQwpgkUQYrt06Ti3pDfvCLLEOf43g2RbLb/SePLnQUesqGrBkCZBpCP0xbOLgoN8mlWaR5IINRidvuO52BUReBOSj3P+MXhqT/7npxtNub7Hos4S3n3J04GKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHMrOtrt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHMrOtrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51770C4CEF3;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=nm/MOABnlL9MNVwqwrrw0H7SIIDrR6b8+mGPh5LEKzU=;
	h=From:To:Cc:Subject:Date:From;
	b=XHMrOtrt5NNxYkIxv7OYrmKHPkdrOLmzvnaFBSFtVuEJMPp2GBEbIbcVA1i2O3N8J
	 XgDAKsc2U017t9ug7RvP0unWl0gouusji22kFOv6Db6rfMoIRDUY3vdsAWlFB7OqJV
	 Ds6dPWifH4By0Jt3uYQufq0CF4cxjn4b/ZQAcn9qNcBxR1CNrfH4vawJxVkRNHqYk5
	 0nWfBGKDaOD5VMH81Opr/Gl0oi48vI/68jDCjDg62xDWP4YJKHYsC+ZE/Rxcv6OtNr
	 PhmG/hYB10lBdMPk5VHdz1iNlJmUsVVNxWbOaYfyVYKS/YYZ00CF8oBIsYVf6miFO4
	 riNFSbTENXBJQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWG-1QqA;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH 00/15] Translate sphinx-pre-install to Python
Date: Mon, 30 Jun 2025 23:34:48 +0200
Message-ID: <cover.1751318230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This series port scripts/sphinx-pre-install to Python. It started as
a bug-compatible version with the old logic.

Yet, while testing it with lxc and some Docker images, I opted
to also drop legacy logic from it and to add support for some
additional variants compatible with existing detection logic.

It also fixes some issues that were present at the proposed
install procedures that don't work anymore with new distro
versions.

I ended writing some scripts I used internally to test it.
Such scripts compare the diff output of both the .pl and
.py version. The differences were only blank lines for
gentoo and some  warning reorder.

The test script also ran the install procedure for system,
venv and native Sphinx install.

Since there are distros which has a default Python 3.6
(like openSuse and RHEL8), I opted to make the script
compatible with it. Yet, internally it requires at least
Python 3.7(*) to support the build.

The tests were done with those containers, obtained from
lxc download templates or via podman run:

+--------------------|------------------------------|----------------+
| Name               | release                      | container type |
+--------------------+------------------------------+----------------+
| debian             | bookworm                     | lxc            |
| ubuntu             | plucky                       | lxc            |
| ubuntu-lts         | noble                        | lxc            |
| almalinux          | 9                            | lxc            |
| archlinux          | current                      | lxc            |
| gentoo             | current                      | lxc            |
| opensuse           | tumbleweed                   | lxc            |
| devuan             | daedalus                     | lxc            |
| kali               | current                      | lxc            |
| mint               | wilma                        | lxc            |
| fedora             | 42                           | lxc            |
| centos             | 9-Stream                     | lxc            |
| rockylinux         | 9                            | lxc            |
| oracle             | 9                            | lxc            |
| amazonlinux        | 2023                         | lxc            |
| openeuler          | 25.03                        | lxc            |
| springdalelinux    | 9                            | lxc            |
+--------------------+------------------------------+----------------+
| mageia             | mageia:latest                | docker         |
| openmandriva       | openmandriva/4.0             | docker         |
| scientificlinux    | eurolinux/scientific-linux-7 | docker         |
| rhel               | redhat/ubi8                  | docker         |
| opensuse-leap      | opensuse/leap:15.6           | docker         |
+--------------------+------------------------------+----------------+
 
It succeeded to install either with venv or system package (most
for both) for all those OSes:

Detected OS                : AlmaLinux release 9.6 (Sage Margay).
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 7.4.7
Installing package_install : PASSED: Sphinx 3.4.3

Detected OS                : Amazon Linux release 2023 (Amazon Linux).
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 7.4.7
Installing package_install : PASSED: Sphinx 3.4.3

Detected OS                : Arch Linux.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 8.2.3

Detected OS                : CentOS Stream release 9.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 7.4.7
Installing package_install : PASSED: Sphinx 3.4.3

Detected OS                : Debian GNU/Linux 12.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 5.3.0

Detected OS                : Devuan GNU/Linux 5.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 5.3.0

Detected OS                : Fedora release 42 (Adams).
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 8.1.3

Detected OS                : Gentoo Base System release 2.17.
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 8.2.3

Detected OS                : Kali GNU/Linux 2025.2.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 8.1.3

Detected OS                : Mageia 9.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.1.3
Installing package_install : PASSED: Sphinx 6.1.3

Detected OS                : Linux Mint 22.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.1.3
Installing package_install : PASSED: Sphinx 4.3.2

Detected OS                : openEuler release 25.03.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 8.1.3

Detected OS                : OpenMandriva Lx 4.0.
Installing venv            : WARNING: No such file or directory: 'sphinx-build'
Installing package_install : PASSED: Sphinx 8.2.3

Detected OS                : openSUSE Leap 15.6.
Installing venv            : WARNING: No such file or directory: 'sphinx-build'
Installing package_install : PASSED: Sphinx 7.2.6

Detected OS                : openSUSE Tumbleweed.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 8.2.3

Detected OS                : Oracle Linux Server release 9.6.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 7.4.7
Installing package_install : WARNING: No such file or directory: 'sphinx-build'

Detected OS                : Rocky Linux release 9.6 (Blue Onyx).
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 7.4.7
Installing package_install : PASSED: Sphinx 3.4.3

Detected OS                : Springdale Open Enterprise Linux release 9.2 (Parma).
Installing venv            : PASSED: Sphinx 7.4.7
Installing package_install : PASSED: Sphinx 3.4.3

Detected OS                : Ubuntu 24.04.2 LTS.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 7.2.6

Detected OS                : Ubuntu 25.04.
Installing system_install  : PASSED
Installing venv            : PASSED: Sphinx 8.2.3
Installing package_install : PASSED: Sphinx 8.1.3

It also properly detected RHEL 8 string:

Detected OS                : Red Hat Enterprise Linux release 8.10 (Ootpa).
Installing venv            : WARNING: No such file or directory: 'sphinx-build'
Installing package_install : WARNING: No such file or directory: 'sphinx-build'

But, at this particular docker container, no repositories had
python3-sphinx nor python3-virtualenv, but I suspect that this
is a problem on this particular image, as I'm almost sure we
tested RHEL 8 in the past, so, I have hopes that this could
still work with real RHEL, if it has Python >= 3.7.

Yet, our goal is to support the latest LTS version, so
RHEL 8 is out of scope.

(*) Officially, the minimal Python version we endorse is
3.9, as several Python scripts at the Kernel won't run
with previous releases, but what we have for doc builds
is currently compatible with 3.7. We may later increase
it if you think it is a good idea. Yet, if you see the
Sphinx version above, you'll notice that some venv installed
7.4.7 as the latest version. It means that such distros
still have Python <= 3.9.

Mauro Carvalho Chehab (15):
  scripts: sphinx-pre-install: fix version check for Fedora
  scripts: sphinx-pre-install: rename it to
    scripts/sphinx-pre-install.pl
  scripts: sphinx-pre-install: Convert script to Python
  scripts: sphinx-pre-install: Make it compatible with Python 3.6
  scripts: sphinx-pre-install: run on a supported version
  scripts: sphinx-pre-install: drop obsolete routines
  scripts: sphinx-pre-install: drop support for old virtualenv
  scripts: sphinx-pre-install: Address issues with OpenSUSE Leap 15.x
  scripts: sphinx-pre-install.py fix opensuse hints
  scripts: sphinx-pre-install.py: fix support for gentoo
  scripts: sphinx-pre-install: Address issues with OpenSUSE Tumbleweed
  scripts: sphinx-pre-install.py: only show portage hints once
  scripts: sphinx-pre-install.py: cleanup rhel support
  docs: Makefile: switch to the new scripts/sphinx-pre-install.py
  scripts: sphinx-pre-install.pl: get rid of the old script

 scripts/sphinx-pre-install | 2218 +++++++++++++++++++-----------------
 1 file changed, 1164 insertions(+), 1054 deletions(-)

-- 
2.50.0


