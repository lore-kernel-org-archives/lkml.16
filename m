Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3647242D8C;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320365; cv=none; b=SgrWBnUuMAgNna7dA7PY0t4wSUAdh1gnD2R9/88cgOHFjkjUJr7jlzQSAvE2G/5fWNeY62L8X/n+DExez9BDHD4F7XIBfa5B91mOj2yw/Cz4cazSwObTAiYYiRwIXKj6XKc5I50QMc3oCknZpNPtItAAPOu77PXu430s8nRTmDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320365; c=relaxed/simple;
	bh=ibyDFfdHR/o/ZTsMrzSIxlRYX/epHuKw1deAOw9XBLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9qw/YWbFqw/qZsVoN6cSLcAx4x2Ms89CWCac0/XjSkQ/Jzc9j2K49B75M66ZXfc9adItFf5v/hKnODWgxNuJ7KoMMHnQaoVINiu77w5pn8c+YUdUKi1fbhq76w5y3xWCaR3dNh5sY7FW68PZF6/+MqalKZmTyT4USINOljd9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCX2LGTo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCX2LGTo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D89DC4CEF4;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=ibyDFfdHR/o/ZTsMrzSIxlRYX/epHuKw1deAOw9XBLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qCX2LGToglU5BugwCVGf5Qs1+e+NMWM/TLBRHrZ6XAbNQP8H0oYf+Hw2YwtACSYSH
	 OgyBewFq9JxtcOK7+S6kCVbReDT+mpZWIRwW7gZQJA3wWr+U09OkRN/ZhEeu6W67/b
	 j/HSPpnHEmVzArJptDWsydOgbodTLD3eJP08rLGpuB9nByrjTzOl2T6ZxCOSz93+ns
	 SJyGXTqihl9gdvniRXYaLwFUjHIUqw/N5FYnhqZwZK1PitLtp7L7L5FVgLwsfs1hhD
	 qlJqYaDvGFAkLLeaGpXAjfGpQYnwd1+aGymPn6oaFBjbLQPi8ECfMRp1I/+PEvBxjd
	 qSp6JLW+EIbjA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWl-2Mrh;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/15] scripts: sphinx-pre-install: Address issues with OpenSUSE Leap 15.x
Date: Mon, 30 Jun 2025 23:34:56 +0200
Message-ID: <c8dbcb0d7151e1604ad4a594f844787af2fa3b76.1751318230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751318230.git.mchehab+huawei@kernel.org>
References: <cover.1751318230.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On openSUSE Leap 15.6, which is the current LTS version, has two
Sphinx packages. The normal one requires Python 3.6, which we
don't support anymore. However, it also has Python 3.11 with a
newer Sphinx version (7.2.6).

Suggest the newer version:

        Detected OS: openSUSE Leap 15.6.
        ERROR: at least python 3.7 is required to build the kernel docs
        Warning: python version is not supported.
        Warning: better to also install "convert".
        Warning: better to also install "dot".
        ERROR: please install "yaml", otherwise, build won't work.
        You should run:

                sudo zypper install --no-recommends ImageMagick graphviz python311-pyyaml

        Sphinx needs to be installed either:
        1) via pip/pypi with:

           Currently not possible.

           Please upgrade Python to a newer version and run this script again

        2) As a package with:

                sudo zypper install --no-recommends python311-Sphinx

            Please note that Sphinx >= 3.0 will currently produce false-positive
           warning when the same name is used for more than one type (functions,
           structs, enums,...). This is known Sphinx bug. For more details, see:
                https://github.com/sphinx-doc/sphinx/pull/8313

        Can't build as 2 mandatory dependencies are missing

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index 0a73b1b33842..eca42d90ed01 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -556,6 +556,22 @@ class SphinxDependencyChecker:
 
         progs["latexmk"] = "texlive-latexmk-bin"
 
+        match = re.search(r"(Leap)\s+(\d+).(\d)", self.system_release)
+        if match:
+            rel = int(match.group(2))
+
+            # Leap 15.x uses Python 3.6, which is not compatible with
+            # the build system anymore. Suggest Python 3.11
+            if rel == 15:
+                if not self.which(self.python_cmd):
+                    self.add_package(self.python_cmd, 0)
+
+                progs.update({
+                    "python-sphinx": "python311-Sphinx",
+                    "virtualenv":    "python311-virtualenv",
+                    "yaml":          "python311-pyyaml",
+                })
+
         # FIXME: add support for installing CJK fonts
         #
         # I tried hard, but was unable to find a way to install
-- 
2.50.0

