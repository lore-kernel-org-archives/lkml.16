Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C802C325C;
	Fri, 27 Jun 2025 15:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037160; cv=none; b=RDHBZ4Y7UkLsOg7naZqXSniCGbViJLfWWhZEu8p9cSp/a4zHLFUuKnSEigEERifX4grRA6kL7lpdC7UbcZXnQf2MI2/jVuN356g2UlP77Icew847RgFbbcmbaTbcEJGxMYR3wkXtEEy6ZOI+wEkVtIDmtHSEtLerVawmeO87C5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037160; c=relaxed/simple;
	bh=aw8tzCQQc+krKH99gpFkFexJS04v8WHD7GAdJzrOt4M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sq5i/2EHSqMtmOWga0waghdsjLMLMt1VTfchu8pinZyHb8rGrD+1rqcLyhRZkdvdefWLr6vy6tj5xqvGbSsjpb3cFoFC6jINDGcZk+gsCyfBGzZsy9m62IC8xvx+Ir7tFeIdf6sb8engJkPs2BX+Z3lQsP2caeVra9DADHpweWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIsZy1SU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIsZy1SU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AD4C4CEE3;
	Fri, 27 Jun 2025 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751037160;
	bh=aw8tzCQQc+krKH99gpFkFexJS04v8WHD7GAdJzrOt4M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GIsZy1SUSqn3OB8D1XsNDwwhL0n1X/xx4nSjI1/JLjINqJjqvcA9N2/p7XbSDZC06
	 6L9Qysv45Tp/NxPYxkfSTOfKn3VdkVVlnLhKHM517GmuUYW4YvBP/oCRTyDw1yT+2A
	 k/f2zntvZeak1jrBmvbwBkrii1xrVx+55S+xLmhQUy1W8l/tM1Bp3Rk+ksBu7M0wbD
	 bhBLbIraEmnZcWee0pAJWvWnubbbS3s3Evo95BY4K8J+6DFCtR0ceka3fqLYs+KOQH
	 J5IatS9wMMCyCla0CNPBwvNaebzG0L9qcf6TdkmN2sp2yJ+VnpA7fkpscZeuDvTy4S
	 ZDrnO6/3cHOYA==
Date: Fri, 27 Jun 2025 17:12:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Sai
 Vishnu M <saivishnu725@gmail.com>
Subject: Re: [PATCH 0/3] Translate sphinx-pre-install to Python
Message-ID: <20250627171233.66c825ca@sal.lan>
In-Reply-To: <cover.1750924501.git.mchehab+huawei@kernel.org>
References: <cover.1750924501.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 26 Jun 2025 10:06:28 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> As part of my efforts to make the doc build system more modern, it
> follows a patch series converting sphinx-pre-install to python.
> 
> The first patch contains a small fix to the Perl version. It is
> interesting to have, as otherwise regression tests fail.
> 
> The conversion itself was not hard. Most of the time I spent writing
> scripts to test it.

Hi Jon,

Please see this as a RFC. There is a trivial bug here when sphinx-build
is found (m1 and m2 variables were renamed to match). Easy to fix,
but I'm doing other cleanups, and I'm planning to improve the regression
test coverage.

I'll be sending you a new version next week.

> 
> The new version is meant to be bug-compatible with the previous
> version, with some exceptions:
> 
> - I dropped support for too old Fedora distros. They're OOL;
> - as it runs on Python, the tests for python could be bogus. I 
>   added some FIXME entries to remember about that.;
> - The package lists are now alphabetically sorted, whith alters
>    the warning/eror order.
> - It supports additional variants that I could install via lxc download
>    template.
> - I didn't test a couple of distro variants (OpenMandriva, RHEL,
>   and Scientific Linux.
> 
> I did regression tests. Those are the test results summary:
> 
> +-----------------+---------+-------+-------------+----------------------------------------+
> | distro          | status  | stage | return code | log file                               |
> +-----------------+---------+-------+-------------+----------------------------------------+
> | almalinux       | N/A     | Tests | 0           | ./test_logs/almalinux_report.log       |
> | amazonlinux     | N/A     | Tests | 0           | ./test_logs/amazonlinux_report.log     |
> | archlinux       | SUCCESS | Tests | 0           | ./test_logs/archlinux_report.log       |
> | centos          | SUCCESS | Tests | 0           | ./test_logs/centos_report.log          |
> | debian          | SUCCESS | Tests | 0           | ./test_logs/debian_report.log          |
> | devuan          | N/A     | Tests | 0           | ./test_logs/devuan_report.log          |
> | fedora          | SUCCESS | Tests | 0           | ./test_logs/fedora_report.log          |
> | gentoo          | FAILED  | Tests | 3           | ./test_logs/gentoo_report.log          |
> | kali            | N/A     | Tests | 0           | ./test_logs/kali_report.log            |
> | mageia          | SUCCESS | Tests | 0           | ./test_logs/mageia_report.log          |
> | mint            | N/A     | Tests | 0           | ./test_logs/mint_report.log            |
> | openeuler       | N/A     | Tests | 0           | ./test_logs/openeuler_report.log       |
> | opensuse        | SUCCESS | Tests | 0           | ./test_logs/opensuse_report.log        |
> | oracle          | SUCCESS | Tests | 0           | ./test_logs/oracle_report.log          |
> | rockylinux      | N/A     | Tests | 0           | ./test_logs/rockylinux_report.log      |
> | springdalelinux | N/A     | Tests | 0           | ./test_logs/springdalelinux_report.log |
> | ubuntu          | SUCCESS | Tests | 0           | ./test_logs/ubuntu_report.log          |
> | ubuntu-lts      | SUCCESS | Tests | 0           | ./test_logs/ubuntu-lts_report.log      |
> +-----------------+---------+-------+-------------+----------------------------------------+
> 
> N/A means that the version were not supported originally, so it can't be
> properly compared.
> 
> The only one marked as failed is gentoo. This is actually a false positive.
> That's the test output:
> 
> TEST REPORT: GENTOO
> 
> Generated: 2025-06-26 10:02:57
> Stage: Tests
> 
> ERROR DETAILS:
> 
> CustomError: 6 of 9 validate commands succeeded
>   File "/home/mchehab/bin/container_tests.py", line 1779, in <module>
>     asyncio.run(main())
>   File "/usr/lib64/python3.13/asyncio/runners.py", line 195, in run
>     return runner.run(main)
>   File "/usr/lib64/python3.13/asyncio/runners.py", line 118, in run
>     return self._loop.run_until_complete(task)
>   File "/usr/lib64/python3.13/asyncio/base_events.py", line 706, in run_until_complete
>     self.run_forever()
>   File "/usr/lib64/python3.13/asyncio/base_events.py", line 677, in run_forever
>     self._run_once()
>   File "/usr/lib64/python3.13/asyncio/base_events.py", line 2034, in _run_once
>     handle._run()
>   File "/usr/lib64/python3.13/asyncio/events.py", line 89, in _run
>     self._context.run(self._callback, *self._args)
>   File "/home/mchehab/bin/container_tests.py", line 1773, in main
>     await manager.run()
>   File "/home/mchehab/bin/container_tests.py", line 1625, in run
>     await self.run_distro(distro)
>   File "/home/mchehab/bin/container_tests.py", line 1605, in run_distro
>     await self.run_test(distro)
>   File "/home/mchehab/bin/container_tests.py", line 1434, in run_test
>     self.record_status(
> 
> 
> TEST RESULTS:
> 
> Status: FAILED
> Return Code: 3
> 
> STANDARD OUTPUT:
> 
> $ cd /root && LC_ALL=C ./scripts/sphinx-pre-install.py
> -------------------------------------------------------
> 
> Detected OS: Gentoo Base System release 2.17.
> Warning: better to also install "convert".
> Warning: better to also install "dot".
> Warning: better to also install "latexmk".
> Warning: better to also install "media-fonts/dejavu".
> Warning: better to also install "media-fonts/noto-cjk".
> Warning: better to also install "rsvg-convert".
> Warning: better to also install "xelatex".
> ERROR: please install "yaml", otherwise, build won't work.
> You should run:
> 
> 
> 	sudo su -c 'echo "media-gfx/imagemagick svg png" > /etc/portage/package.use/imagemagick'
> 	sudo su -c 'echo "media-gfx/graphviz cairo pdf" > /etc/portage/package.use/graphviz'
> 	sudo emerge --ask media-gfx/imagemagick media-gfx/graphviz latexmk media-fonts/dejavu media-fonts/noto-cjk gnome-base/librsvg dev-texlive/texlive-xetex media-fonts/dejavu dev-python/pyyaml
> 
> Sphinx needs to be installed either:
> 1) via pip/pypi with:
> 
> 	/usr/sbin/python3 -m venv sphinx_latest
> 	. sphinx_latest/bin/activate
> 	pip install -r ./Documentation/sphinx/requirements.txt
> 
>     If you want to exit the virtualenv, you can use:
> 	deactivate
> 
> 2) As a package with:
> 
> 
> 	sudo su -c 'echo "media-gfx/imagemagick svg png" > /etc/portage/package.use/imagemagick'
> 	sudo su -c 'echo "media-gfx/graphviz cairo pdf" > /etc/portage/package.use/graphviz'
> 	sudo emerge --ask python-sphinx
> 
>     Please note that Sphinx >= 3.0 will currently produce false-positive
>    warning when the same name is used for more than one type (functions,
>    structs, enums,...). This is known Sphinx bug. For more details, see:
> 	https://github.com/sphinx-doc/sphinx/pull/8313
> Can't build as 2 mandatory dependencies are missing
> 
> $ cd /root && LC_ALL=C ./scripts/sphinx-pre-install
> ----------------------------------------------------
> 
> Detected OS: Gentoo Base System release 2.17.
> Warning: better to also install "convert".
> Warning: better to also install "dot".
> Warning: better to also install "latexmk".
> Warning: better to also install "media-fonts/dejavu".
> Warning: better to also install "media-fonts/noto-cjk".
> Warning: better to also install "rsvg-convert".
> Warning: better to also install "xelatex".
> ERROR: please install "yaml", otherwise, build won't work.
> You should run:
> 
> 	sudo su -c 'echo "media-gfx/imagemagick svg png" > /etc/portage/package.use/imagemagick'
> 	sudo su -c 'echo "media-gfx/graphviz cairo pdf" > /etc/portage/package.use/graphviz'
> 	sudo emerge --ask media-gfx/imagemagick media-gfx/graphviz latexmk media-fonts/dejavu media-fonts/noto-cjk gnome-base/librsvg dev-texlive/texlive-xetex media-fonts/dejavu dev-python/pyyaml
> 
> Sphinx needs to be installed either:
> 1) via pip/pypi with:
> 
> 	/usr/sbin/python3 -m venv sphinx_latest
> 	. sphinx_latest/bin/activate
> 	pip install -r ./Documentation/sphinx/requirements.txt
> 
>     If you want to exit the virtualenv, you can use:
> 	deactivate
> 
> 2) As a package with:
> 
> 	sudo su -c 'echo "media-gfx/imagemagick svg png" > /etc/portage/package.use/imagemagick'
> 	sudo su -c 'echo "media-gfx/graphviz cairo pdf" > /etc/portage/package.use/graphviz'
> 	sudo emerge --ask python-sphinx
> 
>     Please note that Sphinx >= 3.0 will currently produce false-positive
>    warning when the same name is used for more than one type (functions,
>    structs, enums,...). This is known Sphinx bug. For more details, see:
> 	https://github.com/sphinx-doc/sphinx/pull/8313
> Can't build as 2 mandatory dependencies are missing at ./scripts/sphinx-pre-install line 990.
> 
> $ cd /root && LC_ALL=C ./scripts/sphinx-pre-install >/tmp/perl_venv
> --------------------------------------------------------------------
> 
> Can't build as 2 mandatory dependencies are missing at ./scripts/sphinx-pre-install line 990.
> 
> $ cd /root && LC_ALL=C ./scripts/sphinx-pre-install.py >/tmp/python_venv
> -------------------------------------------------------------------------
> 
> Can't build as 2 mandatory dependencies are missing
> 
> $ cd /root && LC_ALL=C ./scripts/sphinx-pre-install --no-virtualenv >/tmp/perl_no_venv
> ---------------------------------------------------------------------------------------
> 
> Can't build as 2 mandatory dependencies are missing at ./scripts/sphinx-pre-install line 990.
> 
> $ cd /root && LC_ALL=C ./scripts/sphinx-pre-install.py --no-virtualenv >/tmp/python_no_venv
> --------------------------------------------------------------------------------------------
> 
> Can't build as 2 mandatory dependencies are missing
> 
> $ cd /root && LC_ALL=C ./scripts/sphinx-pre-install --no-pdf >/tmp/perl_no_pdf
> -------------------------------------------------------------------------------
> 
> Can't build as 2 mandatory dependencies are missing at ./scripts/sphinx-pre-install line 990.
> 
> $ cd /root && LC_ALL=C ./scripts/sphinx-pre-install.py --no-pdf >/tmp/python_no_pdf
> ------------------------------------------------------------------------------------
> 
> Can't build as 2 mandatory dependencies are missing
> 
> $ sort /tmp/perl_venv -o /tmp/perl_venv.sorted
> -----------------------------------------------
> 
> 
> $ sort /tmp/python_venv -o /tmp/python_venv.sorted
> ---------------------------------------------------
> 
> 
> $ sort /tmp/perl_no_venv -o /tmp/perl_no_venv.sorted
> -----------------------------------------------------
> 
> 
> $ sort /tmp/python_no_venv -o /tmp/python_no_venv.sorted
> ---------------------------------------------------------
> 
> 
> $ sort /tmp/perl_no_pdf -o /tmp/perl_no_pdf.sorted
> ---------------------------------------------------
> 
> 
> $ sort /tmp/python_no_pdf -o /tmp/python_no_pdf.sorted
> -------------------------------------------------------
> 
> 
> $ diff -q /tmp/perl_venv.sorted /tmp/python_venv.sorted
> --------------------------------------------------------
> 
> Files /tmp/perl_venv.sorted and /tmp/python_venv.sorted differ
> 
> $ diff -q /tmp/perl_no_venv.sorted /tmp/python_no_venv.sorted
> --------------------------------------------------------------
> 
> Files /tmp/perl_no_venv.sorted and /tmp/python_no_venv.sorted differ
> 
> $ diff -q /tmp/perl_no_pdf.sorted /tmp/python_no_pdf.sorted
> ------------------------------------------------------------
> 
> Files /tmp/perl_no_pdf.sorted and /tmp/python_no_pdf.sorted differ
> 
> 
> 
> ERROR OUTPUT:
> 6 of 9 validate commands succeeded
> 
> 
> 
> 
> 
> Mauro Carvalho Chehab (3):
>   scripts: : fix version check for Fedora
>   scripts: : Convert script to Python
>   scripts: sphinx-pre-install: replace it by a Python version
> 
>  scripts/sphinx-pre-install | 2144 ++++++++++++++++++------------------
>  1 file changed, 1095 insertions(+), 1049 deletions(-)
> 
