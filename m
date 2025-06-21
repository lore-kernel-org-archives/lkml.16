Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45795270EC3;
	Sat, 21 Jun 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=U8m94qyhKF3670dxsU8/BBMWKu99uP+1xHOSXLkd8HHKxb9cCPICUAkhzIKdKsJ3IZWWT3TqXEy3HA1Iu5KadDqMFhgIyQ2yyO6kiPaVOqsxDulVB0RlHdgdKC2Wf6ePlO0rktBJido2CtPn3x27r5C6Ue1ihfMXngPdP1FrdfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=khxESugvHoab7laZWP+H+C5kr4pyhiqASuyv6rTuJKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S10zGW/sOlRYKb2Ei1n0xuIXAh86WeYfyMB+xC/ejGCsRhMgzykT1T7LFUiGz1b36slcdEnJ3B0VdBFAi0TueyPva9bZ1R+k+mogEk33iknCkgKk5H2Oym0p9fsQYfSFlQM5uPMtX3XJKY7OGTcqYigBxPA322Z/DTMxLriOqoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dp1psRkU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dp1psRkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D0DC4CEF6;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=khxESugvHoab7laZWP+H+C5kr4pyhiqASuyv6rTuJKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dp1psRkUmVcMiQ8ujWmHoEzo5n2XUKxwL/FYx3VN94UmuKi0gKMX7VD2KQOAWjnlS
	 GlQXF7Aw3NzLr0OIMOk1GKqGhx4OL29Oww5mbiHVl2OGPsmCGjQza5Br2HQp0EiMgJ
	 LqhGSuh8H2SklXq0jqKmptVSmjD8GNIutM47NBryZ3mu+0myk9oVsUha5rveYVJCMN
	 U1JdfemInq3t11K4Uo6Bc1DHYNovu9mlKsG+hFU2m3k/GVzKmByJqE84B+asy14Os3
	 MenOjloVq/dNnHsVFuY5+lBnzM5ouSGxTsZJvizCgQPCNjfS7y4LPBBMSRRCi1byuK
	 eNvxrnXvkV3Dg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e4W-3w9n;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/15] docs: conf.py: Check Sphinx and docutils version
Date: Sat, 21 Jun 2025 21:55:54 +0200
Message-ID: <52e195e9660e2086bc90da977e7d4e8b9efe53f5.1750535171.git.mchehab+huawei@kernel.org>
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

As reported by Akira, there were incompatibility issues with
Sphinx and docutils with docutils 0.19. There's already
a fix for it, but, as there are incompatibility issues with
different versions, better to add a check to verify if the
combination is supported/tested.

After check Sphinx release notes, it seems that the
version compatibility is given by:

        =======  ============   ============
        Sphinx   Min Docutils   Max Docutils
        Version  Version        Version
        -------  ------------   ------------
        3.4.3    >= 0.12.0      < 0.18.0
        4.0.0    >= 0.12.0      < 0.19.0
        6.0.0    >= 0.18.0      < 0.20.0
        7.0.0    >= 0.18.1      < 0.21.0
        7.2.0    >= 0.18.1      < 0.20.0
        7.4.0    >= 0.18.1      < 0.21.0
        8.0.0    >= 0.20.0      < 0.22.0
        8.2.3    >= 0.20.0      < 0.22.0
        =======  ============   ============

For now, add a logic inside conf.py to check the above
compatibility list, emitting warnings if the docutils
version doesn't match it.

This way, when we discover incompatibility issues, we
can easily adjust the table.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 70 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 3 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index e4dde5aa4559..945198bd1f1f 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -9,7 +9,11 @@ import os
 import shutil
 import sys
 
+import docutils
 import sphinx
+from sphinx.util import logging
+
+logger = logging.getLogger(__name__)
 
 # If extensions (or modules to document with autodoc) are in another directory,
 # add these directories to sys.path here. If the directory is relative to the
@@ -21,11 +25,71 @@ from load_config import loadConfig               # pylint: disable=C0413,E0401
 # Minimal supported version
 needs_sphinx = "3.4.3"
 
-# Get Sphinx version
-major, minor, patch = sphinx.version_info[:3]          # pylint: disable=I1101
+# Get Sphinx and docutils versions
+sphinx_ver = sphinx.version_info[:3]          # pylint: disable=I1101
+docutils_ver = docutils.__version_info__[:3]
+
+sphinx_ver_str = ".".join([str(x) for x in sphinx_ver])
+docutils_ver_str = ".".join([str(x) for x in docutils_ver])
+
+# Docutils min/max versions.
+# The dockutils version check logic is done with:
+#     ver >= min and ver < max
+SPHINX_DOCUTILS_VERS = {
+    (3, 4, 3): {
+        "min": (0, 12, 0),
+        "max": (0, 18, 0)
+    },
+    (4, 0, 0): {
+        "min": (0, 12, 0),
+        "max": (0, 19, 0)
+    },
+    (6, 0, 0): {
+        "min": (0, 18, 0),
+        "max": (0, 20, 0)
+    },
+    (7, 0, 0): {
+        "min": (0, 18, 1),
+        "max": (0, 21, 0)
+    },
+    (7, 2, 0): {
+        "min": (0, 18, 1),
+        "max": (0, 20, 0)
+    },
+    (7, 4, 0): {
+        "min": (0, 18, 1),
+        "max": (0, 21, 0)
+    },
+    (8, 0, 0): {
+        "min": (0, 20, 0),
+        "max": (0, 22, 0)
+    },
+    (8, 2, 3): {
+        "min": (0, 20, 0),
+        "max": (0, 22, 0)
+    },
+}
+
+du_min = None
+du_max = None
+for sp_ver, doc_vers in SPHINX_DOCUTILS_VERS.items():
+    if sp_ver > sphinx_ver:
+        break
+
+    du_min = doc_vers.get("min")
+    du_max = doc_vers.get("max")
+
+if sphinx_ver > sorted(SPHINX_DOCUTILS_VERS.keys())[-1]:
+    logger.warning(f"Sphinx version {sphinx_ver_str} is too new and not tested. Doc generation may fail")
+elif not du_min or not du_max:
+    logger.warning(f"Sphinx version {sphinx_ver_str} is not tested. Doc generation may fail")
+elif docutils_ver < du_min:
+    logger.warning(f"Docutils {docutils_ver_str} is too old for Sphinx {sphinx_ver_str}. Doc generation may fail")
+elif docutils_ver >= du_max:
+    logger.warning(f"Docutils {docutils_ver_str} could be too new for Sphinx {sphinx_ver_str}. Doc generation may fail")
 
 # Include_patterns were added on Sphinx 5.1
-if (major < 5) or (major == 5 and minor < 1):
+if sphinx_ver < (5, 1, 0):
     has_include_patterns = False
 else:
     has_include_patterns = True
-- 
2.49.0

