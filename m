Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905B22F169;
	Fri, 25 Apr 2025 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565238; cv=none; b=jH7X5i0Hm8NnCNdxgo4LbygwfUPbtBaBG7u483jqsZU0i19XGClm0JLMsnsfU5yClXumdHllpaXYzmBUzzg+hqXjwhBnQ+wUnEm30LOfChhpVf4rFQ6pgNkzcsVWS/cIBgsQhpTBABbf2A1JrkEUcMMr8LGatkxH5fAgtQvQGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565238; c=relaxed/simple;
	bh=8ht6CFnJ+xOrz1MUeE1fJUbi02R0O8GllLmGzGZXdI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4vAylJ3J123jErK9qj4h/rRX+1/J4rh/fLsEkKVrPXEZC1eGjkVed/t5XVbIYURpiR9ezRuaUvhU8Dfb+/ntDoFuVokaD+TQyhtDaS7W1kfmpdVX976fHTmCtPw+MGsCVDENRQ8DscLVx+19mhS4ZLITrssbq5WaKtjMtDdIrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4xqKXxg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4xqKXxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F75DC4CEEB;
	Fri, 25 Apr 2025 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745565238;
	bh=8ht6CFnJ+xOrz1MUeE1fJUbi02R0O8GllLmGzGZXdI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W4xqKXxgE2kAuh2nQCFC89WDz7OrprgGEjOwuKb1cmBpBV+Jh1XurURM1yEcN4Gst
	 kzrwSA+3t2gB7xZ0RmRP9542aEHFy0nBX+th+LOjKjCEYUtaC5WK4YL2ZXi2ywetRv
	 Dvx5UBm3B4XnYPvokDKqyQVXW1ZQdBvLV+P7yGsum8HsbYrjYBwl0DvhUnMAuZnmm/
	 weIUUioXUeCnQnB+SpkLZYk+Koku4ONi99guaA84qPU76IZwZGRIZe41QT84Xk5xoI
	 xiUQTsVXZ47DK7nOt7ONpTzErVLoqhKJ0ujUmF3XbkcUQ4Af+RwP7ZZ5E0U4vnENoG
	 QqC4qHdf1O54Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u8DFv-00000000TG0-43yQ;
	Fri, 25 Apr 2025 15:13:51 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] docs: Sphinx: kerneldoc: only initialize kernel-doc classes once
Date: Fri, 25 Apr 2025 15:13:38 +0800
Message-ID: <b00788f26e161512858a6e01a673c34743c954df.1745564565.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745564565.git.mchehab+huawei@kernel.org>
References: <cover.1745564565.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Instead of re-creating the objects every time, initialize it
just once.

This allows caching previously parsed objects.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 27baf28fb754..b713a2c4a615 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -48,7 +48,8 @@ from kdoc_files import KernelFiles
 from kdoc_output import RestFormat
 
 __version__  = '1.0'
-use_kfiles = False
+kfiles = None
+logger = logging.getLogger('kerneldoc')
 
 def cmd_str(cmd):
     """
@@ -86,7 +87,6 @@ class KernelDocDirective(Directive):
         'functions': directives.unchanged,
     }
     has_content = False
-    logger = logging.getLogger('kerneldoc')
     verbose = 0
 
     parse_args = {}
@@ -204,7 +204,7 @@ class KernelDocDirective(Directive):
         node = nodes.section()
 
         try:
-            self.logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
+            logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
 
             p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             out, err = p.communicate()
@@ -214,14 +214,14 @@ class KernelDocDirective(Directive):
             if p.returncode != 0:
                 sys.stderr.write(err)
 
-                self.logger.warning("kernel-doc '%s' failed with return code %d"
+                logger.warning("kernel-doc '%s' failed with return code %d"
                                     % (" ".join(cmd), p.returncode))
                 return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
             elif env.config.kerneldoc_verbosity > 0:
                 sys.stderr.write(err)
 
         except Exception as e:  # pylint: disable=W0703
-            self.logger.warning("kernel-doc '%s' processing failed with: %s" %
+            logger.warning("kernel-doc '%s' processing failed with: %s" %
                                 (" ".join(cmd), str(e)))
             return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
 
@@ -261,7 +261,7 @@ class KernelDocDirective(Directive):
             self.do_parse(result, node)
 
         except Exception as e:  # pylint: disable=W0703
-            self.logger.warning("kernel-doc '%s' processing failed with: %s" %
+            logger.warning("kernel-doc '%s' processing failed with: %s" %
                                 (cmd_str(cmd), str(e)))
             return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
 
@@ -292,11 +292,9 @@ class KernelDocDirective(Directive):
         return node.children
 
     def run(self):
-        global use_kfiles
+        global kfiles
 
-        if use_kfiles:
-            out_style = RestFormat()
-            kfiles = KernelFiles(out_style=out_style, logger=self.logger)
+        if kfiles:
             return self.run_kdoc(kfiles)
         else:
             return self.run_cmd()
@@ -306,13 +304,14 @@ class KernelDocDirective(Directive):
             self.state.nested_parse(result, 0, node, match_titles=1)
 
 def setup_kfiles(app):
-    global use_kfiles
+    global kfiles
 
     kerneldoc_bin = app.env.config.kerneldoc_bin
 
     if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
         print("Using Python kernel-doc")
-        use_kfiles = True
+        out_style = RestFormat()
+        kfiles = KernelFiles(out_style=out_style, logger=logger)
     else:
         print(f"Using {kerneldoc_bin}")
 
-- 
2.49.0

