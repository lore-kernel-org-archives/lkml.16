Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647426A0CC;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=lOJC1islj9cVcbRdxtDpNEFRxgts/vKcHpcBG2sE5V3pyosAiCgoz1+FERWUJ78AsKghRzPwZ/JaZdzHijvwJIcmtKA+qD4Ryaz9l5tNOMS0/hLSCNYb+6mD3lH0iwJUum3rkkCyF9xaTWonhwyrs80yvBwqfUZClJ68FezHIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=Lm2GbQXi2MDPtReRJtKjFssuSmR16KjyGO35t6oh8GM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZW1N0ptWA+Dkd0SbTbLLH1dpEi2yH4taIuRLxHWP7AiqHJmAZY66/6gmNhNBs+pt8wym3Li2BkbcNSL2pBVMt5uD16YU8zGzIlcrw/L/4gWDxeTp8Z69ZvrhYbOEns4Ynq1YwMTsPccBE3Jh2SHA9N8Ys42PGd8VxHdEGKs9NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIuib2Mb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIuib2Mb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942CFC4CEE7;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=Lm2GbQXi2MDPtReRJtKjFssuSmR16KjyGO35t6oh8GM=;
	h=From:To:Cc:Subject:Date:From;
	b=CIuib2MbAM4r8LI2VYiWhty8KZ7owAAGSUQcdOihZX6CA0p3+IYZjwTF8WE++oy1s
	 lKmNnpxm+aevgp1BbHxjpjHnR7X0pYN5IbQHOIRBbz6SY21KlugtpDx3o/WWuYzq4l
	 BrEp/JRXYVB1R08c00qrZzUNZGDQ/7JU1npYXBKy+Ea7ZTud9Y/sT09zVxGeIDczeI
	 0PCLAv+Ab8V4uXXcM7w41AWa3346F3Fhp4Q8uFZhElf3qro4rAonDhARgAGBBnhZ8E
	 9GSwqdAi72WFdfduwBvPSIPLOOBHHEcGnW51lX78spPDST5bwIJ+OwALYFVEJ927ji
	 WaO4LCOT1kBnw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e3Z-2GEC;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2 00/15] Some improvements and fixes for the doc build system
Date: Sat, 21 Jun 2025 21:55:39 +0200
Message-ID: <cover.1750535171.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This series contain patches I made while working at the parser-yaml.
They aren't directly related to it. Instead, they address some issues
at the build system and provide test tools for building docs.
 
Most of the series is related to the new  test_doc_build.py.
This is a tool I wrote from scratch to help identifying regressions
for changes affecting the build system.

As described on its help page, it allows creating Python virtual
environments for different Sphinx versions that are supported 
by the Linux Kernel build system.

Besides creating the virtual environment, it can also test building
the documentation using "make htmldocs" (and/or other doc targets).

If called without "--versions" argument, it covers the versions shipped
on major distros, plus the lowest supported version.

A typical usage is to run:

$ time ./scripts/test_doc_build.py -m -a "SPHINXOPTS=-j8" -l distros.log
...
Summary:
        Sphinx 3.4.3 elapsed time: 00:07:22
        Sphinx 5.3.0 elapsed time: 00:07:30
        Sphinx 6.1.1 elapsed time: 00:23:43
        Sphinx 7.2.1 elapsed time: 00:07:34
        Sphinx 7.2.6 elapsed time: 00:07:43
        Sphinx 7.3.0 elapsed time: 00:07:54
        Sphinx 7.4.7 elapsed time: 00:04:04
        Sphinx 8.1.3 elapsed time: 00:03:14
        Sphinx 8.2.3 elapsed time: 00:03:12

real    72m30.037s
user    116m45.360s
sys     7m44.09

This should check the main backward-compatibility issues.

A more comprehensive test can be done with:

$ time ./scripts/test_doc_build.py -b -a "SPHINXOPTS=-j8" -l full.log --full

Summary:
        Sphinx 3.4.3 elapsed time: 00:07:15
        Sphinx 3.5.0 elapsed time: 00:07:05
        Sphinx 4.0.0 elapsed time: 00:07:10
        Sphinx 4.1.0 elapsed time: 00:07:20
        Sphinx 4.3.0 elapsed time: 00:07:22
        Sphinx 4.4.0 elapsed time: 00:07:24
        Sphinx 4.5.0 elapsed time: 00:07:13
        Sphinx 5.0.0 elapsed time: 00:07:34
        Sphinx 5.1.0 elapsed time: 00:07:32
        Sphinx 5.2.0 elapsed time: 00:07:29
        Sphinx 5.3.0 elapsed time: 00:07:35
        Sphinx 6.0.0 elapsed time: 00:22:34
        Sphinx 6.1.0 elapsed time: 00:23:57
        Sphinx 6.1.1 elapsed time: 00:23:41
        Sphinx 6.2.0 elapsed time: 00:07:26
        Sphinx 7.0.0 elapsed time: 00:07:29
        Sphinx 7.1.0 elapsed time: 00:07:22
        Sphinx 7.2.0 elapsed time: 00:07:24
        Sphinx 7.2.1 elapsed time: 00:07:31
        Sphinx 7.2.6 elapsed time: 00:07:47
        Sphinx 7.3.0 elapsed time: 00:07:44
        Sphinx 7.4.0 elapsed time: 00:04:16
        Sphinx 7.4.7 elapsed time: 00:04:12
        Sphinx 8.0.0 elapsed time: 00:03:11
        Sphinx 8.1.0 elapsed time: 00:03:17
        Sphinx 8.1.3 elapsed time: 00:03:17
        Sphinx 8.2.0 elapsed time: 00:03:12
        Sphinx 8.2.3 elapsed time: 00:03:14

real    229m13.749s
user    377m26.666s
sys     24m32.544s

Some notes:

1) on my machine, "-j8" is usually faster than "-jauto";
2) 6.x.x is problematic: Sphinx uses a lot of memory, being a friend
   of systemd-oomd killer, specially with -jauto. -j8 is a little better,
   but it still caused crashes on other apps, probably due to memory
   consumption.

Regards,
Mauro

- v2: Added patches 7 to 15.

Mauro Carvalho Chehab (15):
  docs: conf.py: properly handle include and exclude patterns
  docs: Makefile: disable check rules on make cleandocs
  scripts: scripts/test_doc_build.py: add script to test doc build
  scripts:y: make capture assynchronous
  scripts: test_doc_build.py: better control its output
  scripts: test_doc_build.py: better adjust to python version
  scripts: test_doc_build.py: improve dependency list
  scripts: test_doc_build.py: improve cmd.log logic
  scripts: test_doc_build.py: make the script smarter
  scripts: sphinx-pre-install: properly handle SPHINXBUILD
  scripts: sphinx-pre-install: fix release detection for Fedora
  scripts: test_doc_build.py: regroup and rename arguments
  docs: sphinx: add a file with the requirements for lowest version
  docs: conf.py: several coding style fixes
  docs: conf.py: Check Sphinx and docutils version

 Documentation/Makefile                    |   2 +
 Documentation/conf.py                     | 463 +++++++++++--------
 Documentation/doc-guide/sphinx.rst        |  23 +
 Documentation/sphinx/min_requirements.txt |  10 +
 scripts/sphinx-pre-install                |   6 +-
 scripts/test_doc_build.py                 | 513 ++++++++++++++++++++++
 6 files changed, 843 insertions(+), 174 deletions(-)
 create mode 100644 Documentation/sphinx/min_requirements.txt
 create mode 100755 scripts/test_doc_build.py

-- 
2.49.0


