Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6409259C82;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=n00k9+EfRMBuVTL1oCEtX94r2VcBpNEPrwTPlSeboO8Cs8NFl5c/GLpvbTDPvx8RNl5fkP6FcW0oBaCur6de0+2cWsJLa51Rj92aPREgV38okWX79RdjNVnDqLBYBnKoefUyFIZEeLHYDXV0R0IO4aoWoA8Icy9rynXFc/hDYw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=XYACLriiJLRgjgNmojKmyTGCkYgpJcwpU+eU2NamY1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2Ni7NpszKjQYyqM6veerheD52qXmBxBv2/Beu3P+ATvaBu3cWlR3RcklYnR/Y67WG50lKUWk5Mvzc3UT+be582ZH5SQDH3G7P2COd4bsTdc4/FHvBNo9mjnGxrhUBXRTfejD1kU6XHaB+Wb3kzw/4e9jxzllepbpH/B+1x1hBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTl/F1lw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTl/F1lw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949C0C4AF09;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=XYACLriiJLRgjgNmojKmyTGCkYgpJcwpU+eU2NamY1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oTl/F1lw92gn7j6PvN2MD6wP3QD43u1ljkmRhGc2Tugx7354ISiVB+dL2jTrG+ie0
	 SVr0MS61LY/Rx6ShNS1aCaMwLJZd1WifeFWdEehuSBttvfGcvIULZL0O5rkEKlkmCK
	 GMoUxTZndkcFRavc46VgrQCR2Tqx96xN6ANDRqC27Ll6Xu4xPp+/xBQxMCiQdXSKeU
	 Mo1Qk6ldqLTNjq+blvBBFL/j/fyuMYkkJLWU98mUu/RcuBmoeaHGEsri3r4jMvGobv
	 GNGhI7IOq7rCmjjrTtWkJQI0otvMW+8fFKvryZQCs7zubKMp0DMHT5vp8mKlMk1kbj
	 YY/vYIHG2+OBQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e3w-2wSV;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/15] scripts: test_doc_build.py: better adjust to python version
Date: Sat, 21 Jun 2025 21:55:45 +0200
Message-ID: <0d9e86390f0bc443880cafc442466a959c59609f.1750535171.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750535171.git.mchehab+huawei@kernel.org>
References: <cover.1750535171.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Very old versions of Sphinx require older versions of python.
The original script assumes that a python3.9 exec exists,
but this may not be the case.

Relax python requirements.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/test_doc_build.py | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/scripts/test_doc_build.py b/scripts/test_doc_build.py
index 5b9eb2c0bf01..129c2862065c 100755
--- a/scripts/test_doc_build.py
+++ b/scripts/test_doc_build.py
@@ -12,15 +12,28 @@ and optionally test the build.
 import argparse
 import asyncio
 import os.path
+import shutil
 import sys
 import time
 import subprocess
 
-# Minimal python version supported by the building system
-MINIMAL_PYTHON_VERSION = "python3.9"
+# Minimal python version supported by the building system.
 
-# Starting from 8.0.2, Python 3.9 becomes too old
-PYTHON_VER_CHANGES = {(8, 0, 2): "python3"}
+PYTHON = os.path.basename(sys.executable)
+
+min_python_bin = None
+
+for i in range(9, 13):
+    p = f"python3.{i}"
+    if shutil.which(p):
+        min_python_bin = p
+        break
+
+if not min_python_bin:
+    min_python_bin = PYTHON
+
+# Starting from 8.0, Python 3.9 is not supported anymore.
+PYTHON_VER_CHANGES = {(8, 0, 2): PYTHON}
 
 # Sphinx versions to be installed and their incremental requirements
 SPHINX_REQUIREMENTS = {
@@ -290,7 +303,7 @@ class SphinxVenv:
                 args.verbose = True
 
         cur_requirements = {}
-        python_bin = MINIMAL_PYTHON_VERSION
+        python_bin = min_python_bin
 
         for cur_ver, new_reqs in SPHINX_REQUIREMENTS.items():
             cur_requirements.update(new_reqs)
-- 
2.49.0

