Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB891FBE83;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320364; cv=none; b=NBHr+tkDUxQmXg4TmBD3v7iy44HdgHj3SdXDePeZ/pF+yHuVHLT1OBQveaSyc8/qDCgHT9dYPQTkJ/ZNt+IMS23CIUrkPoBpCEZ81ZX6thhPBRsDW5SqFacxk/xrZ7SxyvEHOIJSwTA1wP1F0nQYroR+d8e58QWKYEBM1jZ135Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320364; c=relaxed/simple;
	bh=hGjOw2r0fOgFBqLa5A9OTo5yzmBwEcGTq2ZPy2TyjdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lufe+70U36DUrpUvH5dnDwIAxWzIVdLMHFMvwEe+o/E/ggf2BNGLqhdF1Z+vwByLfJmhteZu1LEoYoSJ3Xo5B30YqS4Adf2Tq9ORzWRKgTemqlqsIUeylRMNypgjmcJ5KMNMzQCovoJShQx8d8cMxV9NNL+5fcg9Awt1TGUEguQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1G3VxJN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1G3VxJN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E36CC4CEF1;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=hGjOw2r0fOgFBqLa5A9OTo5yzmBwEcGTq2ZPy2TyjdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g1G3VxJN533RDbP4dLNVHVsi24d7OYwtKtnoGYqxfH43RyuM8xqeOUjs9GUP4r1R3
	 WMmuzn1K6r4wwnqTi8sspoUdWmxbyhWGvPQkvioQ5KW99f+/hRmm3UzPORb5+NyRtL
	 HV1NwJ5FWEkD/c07ZMofY82y7cMnUG+BsNOx4TqDV8P9uy53VdJIj6e1vAeHf8P1vD
	 AaG1ebHP3WIi5gbwLMJkHZC7comuBJ8H53pnXWNawDhNPhddHVzUwX1kIC8orFJMi6
	 atTc1um0Yl61svVC0sDhQ8Bjg6k4XbcN6RoP1HgFW62bRCwxjZQWA0zz1UMOuse+26
	 2qOSC2hvHNbNg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWV-1vbc;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/15] scripts: sphinx-pre-install: Make it compatible with Python 3.6
Date: Mon, 30 Jun 2025 23:34:52 +0200
Message-ID: <95f7be22f5bd0f3eafc8406bc0e1ba4da0203880.1751318230.git.mchehab+huawei@kernel.org>
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

The minimal version requirements we have is 3.9. Yet, the
script which detects it is this one. So, let's try supporting
an old version here, as we may want to suggest to upgrade
Python version to build the docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index dcee2181b72f..71d86b230b22 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -115,7 +115,8 @@ class SphinxDependencyChecker:
     def find_python_no_venv():
         # FIXME: does it makes sense now that this script is in Python?
 
-        result = subprocess.run(["pwd"], capture_output=True, text=True)
+        result = SphinxDependencyChecker.run(["pwd"], capture_output=True,
+                                             text=True)
         cur_dir = result.stdout.strip()
 
         python_names = ["python3", "python"]
@@ -135,12 +136,23 @@ class SphinxDependencyChecker:
     def run(*args, **kwargs):
         """Excecute a command, hiding its output by default"""
 
-        if not kwargs.get('capture_output', False):
+        capture_output = kwargs.pop('capture_output', False)
+
+        if capture_output:
+            if 'stdout' not in kwargs:
+                kwargs['stdout'] = subprocess.PIPE
+            if 'stderr' not in kwargs:
+                kwargs['stderr'] = subprocess.PIPE
+        else:
             if 'stdout' not in kwargs:
                 kwargs['stdout'] = subprocess.DEVNULL
             if 'stderr' not in kwargs:
                 kwargs['stderr'] = subprocess.DEVNULL
 
+        # Don't break with older Python versions
+        if 'text' in kwargs and sys.version_info < (3, 7):
+            kwargs['universal_newlines'] = kwargs.pop('text')
+
         return subprocess.run(*args, **kwargs)
 
     #
-- 
2.50.0

