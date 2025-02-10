Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1E91C5F36;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=HQGm/nJ6g1Oc+tSdZD5k6DEUMbetZ6YrByU5TJlVa4o+wjP4a1VzH+HlW9RHhuY1dR7LRCJZLcO9ZzDn6tup9JC8U1yH7n2jvJsSK7J467tJSq1ZthubWbzJmc7bk36Vc+KU61Fze2/URApFLh8pAFHZ3ZxHPujkQZlozxouxyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=Y/6DtB75n/8IACU5oUa83ZoIRDQNO5zVfF736uCoidc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHavOLiluzi7i5eXJTujD7K7YyFrnF4HBWs62nhdO2tR5lHVjCoMbKzQrQUwjoEEHQF9+bxj5kKCf3mEA9MSh5paFHejsSpX4ejGm2zirGaJkYz6N4sSCVeumJSBFB7Opoka1hQTNY+BvMoNceieZh7c6PbrY41CW3v+G5zxvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1HSStpA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1HSStpA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D304EC4CEE9;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182703;
	bh=Y/6DtB75n/8IACU5oUa83ZoIRDQNO5zVfF736uCoidc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I1HSStpAtk4WlHpVXY8ZdwGC4LK6ZafR37XI7tcVAEbHNDEH8xsWqZVb9iKXj84iy
	 uXs3MiHsr5pS7WWY0/070X+e6CBPWcGM74V3ufLHT6S0IqMSpISwF/U0kSxWqPBljV
	 iwmsfbGxv0hDbfOZTKbs7QIROlMPh9FkDI+v3xGvPU08qqlqNEeunnjq9u+bYJVmyU
	 GmsP61o3zSD2IURCCsKL7+gbK8Hg7b7MqqlNvt4l8maSVxNEc4SRTvCyoXBV5X7lU3
	 896Xl9reJRYq3+usvLE3X/XvnHLQ4es/Hkbcdsh84txoXRJ63Iw08ZWHb6UGXxvmlO
	 ++7Vyw/mTDOxg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQrt-00000006CiG-3pT6;
	Mon, 10 Feb 2025 11:18:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/27] docs: sphinx/kernel_abi: adjust coding style
Date: Mon, 10 Feb 2025 11:17:51 +0100
Message-ID: <02a9ec0fab61e4c94b9c2ff555bc0e9d93f59100.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Make pylint and flake8 happier with this module's coding style

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 8401562cb5d9..38653f5706c0 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -32,32 +32,31 @@ u"""
 
 """
 
-import codecs
 import os
+import re
 import subprocess
 import sys
-import re
 
-from docutils import nodes, statemachine
+from docutils import nodes
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
-from docutils.utils.error_reporting import ErrorString
 from sphinx.util.docutils import switch_source_input
 from sphinx.util import logging
 
-__version__  = '1.0'
+__version__ = "1.0"
+
 
 def setup(app):
 
     app.add_directive("kernel-abi", KernelCmd)
-    return dict(
-        version = __version__
-        , parallel_read_safe = True
-        , parallel_write_safe = True
-    )
+    return {
+        "version": __version__,
+        "parallel_read_safe": True,
+        "parallel_write_safe": True
+    }
+
 
 class KernelCmd(Directive):
-
     u"""KernelABI (``kernel-abi``) directive"""
 
     required_arguments = 1
@@ -99,8 +98,8 @@ class KernelCmd(Directive):
 
         if "debug" in self.options:
             code_block = "\n\n.. code-block:: rst\n    :linenos:\n"
-            for l in lines.split("\n"):
-                code_block += "\n    " + l
+            for line in lines.split("\n"):
+                code_block += "\n    " + line
             lines = code_block + "\n\n"
 
         line_regex = re.compile(r"^\.\. LINENO (\S+)\#([0-9]+)$")
-- 
2.48.1

