Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06772610;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572171; cv=none; b=cCYse3maZ9VArEF4hI5aEBJR4kgDCpDTiLTcnK6ha4zU9fLCIZPiBBgp8B53ojNfWJYtGe0OK2+zKb5L74lCgEtFlu3CwKMFUlT0mLo+/p2QcQTqF/ulvplVI/tfJO6qtjBnL8TrL5zascVnR+vmXrENP37G3sArts/f/JbJbn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572171; c=relaxed/simple;
	bh=KpO50QGaalY92jMWbenuvBMfrA8+fzLXvcy//OoRJV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XOQlZN5oaMvn8UQYOdf3yJjsZPPhKDtc32DvBOjzNUC0cvkDYDs691S9irZ4RTPElSkG57KjvP/92lihKHRKNIYByxRfhSVznUKzfWEuA6iCxHtr66e5GcFckF/U7+GQRav4inwYkB8KLxgRKLs+eClILuyFx+Ih8uPkWuPrLu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVo+QMyr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVo+QMyr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A66C4CEF5;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=KpO50QGaalY92jMWbenuvBMfrA8+fzLXvcy//OoRJV4=;
	h=From:To:Cc:Subject:Date:From;
	b=aVo+QMyrYJ7NmfWlqBjAI5JSmwbFeVg1EFSzE3vGAnG6tHfUAAotN0NF+WOUYpYY3
	 pOcz3YH73zX2DLJo6vRGL0nVYDx4DzR1pnHv6f/mfFwB41L5/qk9y3Tsjr5ECjMQbn
	 jYAfHLCCE1Cxwf0L1J3JD1yR4Zl6OuKQ5kQlKHrqUORMzmBQQviFTB55/oXCourI+s
	 5ZFm+PerrSqviB6s+2AQsF9W9BJ9jC5i7e9C0MzBlOrw8zM8jrWj4zCn+8UeHlFeGa
	 VWtXRaYCciJHbDKkghF9R120CQRv1HWgUs7p0Dj6SVTbL+i25gLbV15OaUHRNDpsOr
	 nKm0E/+JWxzQA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o21-15EF;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v3 00/15] Some improvements and fixes for the doc build system
Date: Sun, 22 Jun 2025 08:02:29 +0200
Message-ID: <cover.1750571906.git.mchehab+huawei@kernel.org>
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

On this version, only patch 1 changed to avoid full builds every time.

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

---

- v3: initialize config patterns earlier to avoid full builds.

- v2: Added patches 7 to 15.

Mauro Carvalho Chehab (15):
  docs: conf.py: properly handle include and exclude patterns
  docs: Makefile: disable check rules on make cleandocs
  scripts: scripts/test_doc_build.py: add script to test doc build
  scripts: test_doc_build.py: make capture assynchronous
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
 Documentation/conf.py                     | 462 +++++++++++--------
 Documentation/doc-guide/sphinx.rst        |  23 +
 Documentation/sphinx/min_requirements.txt |  10 +
 scripts/sphinx-pre-install                |   6 +-
 scripts/test_doc_build.py                 | 513 ++++++++++++++++++++++
 6 files changed, 842 insertions(+), 174 deletions(-)
 create mode 100644 Documentation/sphinx/min_requirements.txt
 create mode 100755 scripts/test_doc_build.py

-- 
2.49.0


