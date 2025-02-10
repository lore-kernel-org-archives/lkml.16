Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCC11CAA7A;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=mBK3zLTuSYvSjw7SlD8yfNMLiYRfyI+k8JhirAF3GJMKitbQS7ETKf58MOKLXG9/IUMt9pD6Ap8PAWDY2ZdboebTLU5lLrs4wjTzkwyLV+dqHMgj+F2ocbUtaoHnJDNhgYsEp/iZCAzcr9lHA9vrKqfhkcfKDd/afDfYwuDHajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=8ojMHW8Q6tiPmLZTDPQndwgQBu/KcQi5oueWVj1yJmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyhacLhuoTtoI9HKL9agKDE7HWzm48G1soP/PTCe98y6Tejo6jbnZrgv3rILY+dOuXm8PAB+be54cQ8kKmfW8k1pCOeR999DRIn4IngGWJhGbggeHPMT4cJvLupkcC/sj+IUXA3bQ61IIW87HAC5DkE8kPBaEEWzFaztwkVShls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdlPgqRS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdlPgqRS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1975BC4AF09;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=8ojMHW8Q6tiPmLZTDPQndwgQBu/KcQi5oueWVj1yJmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cdlPgqRS2id7zpcwaBSWHXeaD0qIJ0MTg7rNdzs6+DKFpXua/tOaQlswCNe5gB39D
	 7wJ9ninW1zRhv+g8U0Tmdri1ZhcB93Pr7/pD3+A29a/+Dsz2DGfLLhGxx1Ljov9dWY
	 bFvBTNedR1VG44yDdGI/cOfSxuGkcfs+iLV2Znzkf0L/wHpcJCnXaDjLLU2CYQTdsC
	 MsPLlZRlAtka42AG3jf/QBFF0f3cGdRfjdpKzPvxyfGL17EBWfDZAsyYdutnWFXDDm
	 stbw5C8incz8xsYxEpqBLkNYClrrMNCojejdAXvzHSHEPC2ZFYf2FmgGhtXnAdPJ3W
	 KaiYSD9Nx7eCQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cj6-15I6;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/27] docs: sphinx/kernel_abi: use AbiParser directly
Date: Mon, 10 Feb 2025 11:18:04 +0100
Message-ID: <8dbc244dcda97112c1b694e2512a5d600e62873b.1739182025.git.mchehab+huawei@kernel.org>
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

Instead of running get_abi.py script, import AbiParser class and
handle messages directly there using an interactor. This shold save some
memory, as there's no need to exec python inside the Sphinx python
extension.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 29 ++++++++++++++++-------------
 scripts/lib/abi/abi_parser.py      |  2 +-
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index f314b888d3de..f7b22abebcf4 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -34,7 +34,6 @@ u"""
 
 import os
 import re
-import subprocess
 import sys
 
 from docutils import nodes
@@ -43,6 +42,11 @@ from docutils.parsers.rst import directives, Directive
 from sphinx.util.docutils import switch_source_input
 from sphinx.util import logging
 
+srctree = os.path.abspath(os.environ["srctree"])
+sys.path.insert(0, os.path.join(srctree, "scripts/lib/abi"))
+
+from abi_parser import AbiParser
+
 __version__ = "1.0"
 
 
@@ -66,7 +70,7 @@ class KernelCmd(Directive):
     logger = logging.getLogger('kernel_abi')
 
     option_spec = {
-        "debug"     : directives.flag,
+        "debug": directives.flag,
     }
 
     def run(self):
@@ -74,20 +78,19 @@ class KernelCmd(Directive):
         if not doc.settings.file_insertion_enabled:
             raise self.warning("docutils: file insertion disabled")
 
-        srctree = os.path.abspath(os.environ["srctree"])
+        path = os.path.join(srctree, "Documentation", self.arguments[0])
+        parser = AbiParser(path, logger=self.logger)
+        parser.parse_abi()
+        parser.check_issues()
 
-        args = [
-            os.path.join(srctree, 'scripts/get_abi.py'),
-            '-D', os.path.join(srctree, 'Documentation', self.arguments[0]),
-            'rest',
-            '--enable-lineno',
-        ]
+        msg = ""
+        for m in parser.doc(enable_lineno=True, show_file=True):
+            msg += m
 
-        lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
-        nodeList = self.nestedParse(lines, self.arguments[0])
-        return nodeList
+        node = self.nested_parse(msg, self.arguments[0])
+        return node
 
-    def nestedParse(self, lines, fname):
+    def nested_parse(self, lines, fname):
         env = self.state.document.settings.env
         content = ViewList()
         node = nodes.section()
diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index 960e27161c26..57c125fd40a5 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -427,7 +427,7 @@ class AbiParser:
 
         return new_desc + "\n\n"
 
-    def doc(self, enable_lineno, output_in_txt, show_file=False):
+    def doc(self, enable_lineno, output_in_txt=False, show_file=False):
         """Print ABI at stdout"""
 
         part = None
-- 
2.48.1

