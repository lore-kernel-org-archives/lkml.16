Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF67261F;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572171; cv=none; b=Zx+/WuVRYbVQFxbMi5D51za03p4FmqDe6wAwA0m9mUSDwKSLNBanm/wNt+2odOKw9u7HGOKXCz1wBbhW5Ztr3QzhNW4WF0+5nkrGJ/K3m/jlIfaIqAOFaHQ9PPC5ujBH8mo87iXdC+mNSFSvU6NVoMJru4bqEhv7Zr5cJoCKs9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572171; c=relaxed/simple;
	bh=XYACLriiJLRgjgNmojKmyTGCkYgpJcwpU+eU2NamY1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxXPBrdGWO3Ab/CkUlA05V/ScczGgJ4oNfkOaf9FnF0jcgqnCMGwKv9CjUrs5s9PI23LQwzovyBruW+8Sy+H7KgQPxAHD11Gw0ODQKt5Hj3P+iCvfrx0limWGm4w42N7hLbrIs+gjyeJhPHQHVkllfwWSfDPdJZFElPNt3pSySQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNbuyRdh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNbuyRdh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401C0C4CEF7;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=XYACLriiJLRgjgNmojKmyTGCkYgpJcwpU+eU2NamY1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vNbuyRdhoLRNLBa2ogwke77FpfYi10NMj4WYonoZs8xLPZzs28inpwVkjzcY2I3Uh
	 26Do9uye9/jKoLcMGTlFcfhRN66tVlXtcau20oDz1tge6B2zIJw9N8dk4yI40SHzbs
	 qGHdnRGdgyCccnst7bybKFGFybijwOCwqufRf5aeeCLHP/YFKPENRTNieGLoNFRvD3
	 5XZ3ke1Hra2uxo44CEAhhYac81pV6KFo1xXw3EmWOJW7LOk4utnAFWKg6o3JRjwoyA
	 f6DUTB3MLXQGgjQETF7fCDNzwASBnUtaRibxi66eohkULdIWgFhrqT98g1uFpVhy9W
	 5cow6zXUFyxfQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o2O-1oQ0;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/15] scripts: test_doc_build.py: better adjust to python version
Date: Sun, 22 Jun 2025 08:02:35 +0200
Message-ID: <32cb41c543293bbbab5fcb15f8a0aefac040e3a9.1750571906.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750571906.git.mchehab+huawei@kernel.org>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
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

