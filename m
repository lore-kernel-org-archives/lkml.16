Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C818FC91;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572172; cv=none; b=Wc3SsWVjDGalomAp3XX/a0WTBGvzvQ0SWDH0SRPIwGnXb8Q+WUBO6CWNXRZixXBoCaqHWMnRSkELMTK6639jFhI+8kDrnaTehQLXZWFBBe0mCW1Zmg7d+Znrn6lECAr/Rir0NJmxNF5Tnctm60ZowyAeK18xmoVFKLDrRHrVBgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572172; c=relaxed/simple;
	bh=Md1fJUprA8k5FhxpqjtZ0V+UUyFkBLNA2WvebeFh5mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjyrwV2mow2qiAycbhB/ZZnYxeiOYhb+PJl5zcgYlMWZTAg29Q+PzewwvPd7tm/zA1CWcSATPcBOxI0JAjHJpaM0F9hJ30ikxvbRH7WzNnHtMta1uSMaJz8EURHB7SnVjIH2+QHpRvz4mwCBSuZX6BN/2vESOOUq1BSZ/Pfg56c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQArGjLa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQArGjLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D315C4AF0D;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=Md1fJUprA8k5FhxpqjtZ0V+UUyFkBLNA2WvebeFh5mE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mQArGjLaaejKQ7qkesr4qR8Ntss0yynvV7KNysq22XhBGiaUrW8GUnps+QHkQ05hU
	 /8LyM0iRdS/9RT1lFY3ERLbn56CZga5AmkkeBlEhqXZcvMesY7mOEJYgDX1cRICTKS
	 Ii//iMqcYP1OvIWbqREDZG1I+xM2sAoG5mFHmrrljlBBSqW/tz7wAxtdBK4Sxi44qi
	 Fy3Q113CqWiH4/i4XpMZkjjPBV4g1OvRC1wd2TU9fFT99u3naLzeqaLC1GJA8KkR8s
	 dS4EZNFMfFVxCxOh6VOXbvcFhMgr6qKImCf8rGW/dmn7zu6uFKJZumggw0dIS33XUZ
	 5tA/k7v9VVdww==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o2y-2rAM;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/15] docs: conf.py: Check Sphinx and docutils version
Date: Sun, 22 Jun 2025 08:02:44 +0200
Message-ID: <972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
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
index 700516238d3f..df99a4d96b58 100644
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

