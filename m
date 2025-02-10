Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE63E1CEAC2;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=Iqzw5D+FXPC/mfsKDbS4KSpDqx4c5g7TLnCBhBnypr5XpAhsERCWsgRMErZ2EA0Q99tmmtWSbxwQ2wtLKXiyTmps8D8Ibfn6TxTZwNDjrSeXvfESdvkLzxZN4pvPtLTNuMa/q8t9uiXfqCcOZ1J0gIK73iV8ffD2Rf9ja3d/ixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=OOogPGxX0Vy45ilzrAOiFUxIeadBVZaAODgzfVd0odE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foj42lwohdugF6xNR3y2T5ykkTvvCb5Jxb5LOuMS1Wi9G17jcTGGSIpKfltqvvHcHyfkR2WKZ0LVEmV9uDEQ6b73Eu/W7/Kt93e784NnPXQ9aR4psA2EFXQyj/7TYIiisfFcQsyQyKweNkS4hnBcCJgrg2m/VspMIbSZp79GKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8Wy/PkA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8Wy/PkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8674C4CEEA;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=OOogPGxX0Vy45ilzrAOiFUxIeadBVZaAODgzfVd0odE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A8Wy/PkAHP/k8BbDb5bQfCIvpGdY5p2jY5xoOOWUcr68VKkuTR3cb4ZrG4YFzcrBP
	 vud0ifkjZrfTjy3owbJCbH1UcrbNMTQ3xxKC9jnswIIxIVUj6L7I1h89TS76DCjD5M
	 HbTCS05K+sg+U2op1e/fWjX41ojFn9208asnrcaEfBUwTFGDoztkgehdY0RM8caInV
	 oBr0Fr+e2crZ4byU8oFCXWARin8b2GHbelObSXcEgBhLBJY+085XSWchgJ6f1em7PX
	 bBeiWpc25gkJvVYSGpqBqmuPYhitAXrhqQvFMDPw0GLWNNYM5Aa4qJIMKEqvRvW/VM
	 sWVsOZRgMCCxw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQrt-00000006CiC-3i8A;
	Mon, 10 Feb 2025 11:18:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/27] docs: sphinx: remove kernellog.py file
Date: Mon, 10 Feb 2025 11:17:50 +0100
Message-ID: <48bf16f199250d7048ca164d1b90773861915157.1739182025.git.mchehab+huawei@kernel.org>
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

In the past, there was a need for a wrapper due to different
Sphinx versions support (before Sphinx 1.6). This is long gone,
and now it is just a wrapper. Get rig of it to simplify
the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py |  5 +-
 Documentation/sphinx/kerneldoc.py  | 14 +++---
 Documentation/sphinx/kernellog.py  | 22 --------
 Documentation/sphinx/kfigure.py    | 81 ++++++++++++++++--------------
 4 files changed, 53 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/sphinx/kernellog.py

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 5911bd0d7965..8401562cb5d9 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -37,13 +37,13 @@ import os
 import subprocess
 import sys
 import re
-import kernellog
 
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 from docutils.utils.error_reporting import ErrorString
 from sphinx.util.docutils import switch_source_input
+from sphinx.util import logging
 
 __version__  = '1.0'
 
@@ -64,6 +64,7 @@ class KernelCmd(Directive):
     optional_arguments = 2
     has_content = False
     final_argument_whitespace = True
+    logger = logging.getLogger('kernel_abi')
 
     option_spec = {
         "debug"     : directives.flag,
@@ -129,7 +130,7 @@ class KernelCmd(Directive):
             else:
                 content.append(line, f, ln)
 
-        kernellog.info(self.state.document.settings.env.app, "%s: parsed %i lines" % (fname, n))
+        self.logger.info("%s: parsed %i lines" % (fname, n))
 
         if content:
             self.do_parse(content, node)
diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index ec1ddfff1863..be5b8fbf373f 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -39,7 +39,7 @@ from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 import sphinx
 from sphinx.util.docutils import switch_source_input
-import kernellog
+from sphinx.util import logging
 
 __version__  = '1.0'
 
@@ -56,6 +56,7 @@ class KernelDocDirective(Directive):
         'functions': directives.unchanged,
     }
     has_content = False
+    logger = logging.getLogger('kerneldoc')
 
     def run(self):
         env = self.state.document.settings.env
@@ -109,8 +110,7 @@ class KernelDocDirective(Directive):
         cmd += [filename]
 
         try:
-            kernellog.verbose(env.app,
-                              'calling kernel-doc \'%s\'' % (" ".join(cmd)))
+            self.logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
 
             p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             out, err = p.communicate()
@@ -120,8 +120,8 @@ class KernelDocDirective(Directive):
             if p.returncode != 0:
                 sys.stderr.write(err)
 
-                kernellog.warn(env.app,
-                               'kernel-doc \'%s\' failed with return code %d' % (" ".join(cmd), p.returncode))
+                self.logger.warning("kernel-doc '%s' failed with return code %d"
+                                    % (" ".join(cmd), p.returncode))
                 return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
             elif env.config.kerneldoc_verbosity > 0:
                 sys.stderr.write(err)
@@ -148,8 +148,8 @@ class KernelDocDirective(Directive):
             return node.children
 
         except Exception as e:  # pylint: disable=W0703
-            kernellog.warn(env.app, 'kernel-doc \'%s\' processing failed with: %s' %
-                           (" ".join(cmd), str(e)))
+            self.logger.warning("kernel-doc '%s' processing failed with: %s" %
+                                (" ".join(cmd), str(e)))
             return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
 
     def do_parse(self, result, node):
diff --git a/Documentation/sphinx/kernellog.py b/Documentation/sphinx/kernellog.py
deleted file mode 100644
index 0bc00c138cad..000000000000
--- a/Documentation/sphinx/kernellog.py
+++ /dev/null
@@ -1,22 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Sphinx has deprecated its older logging interface, but the replacement
-# only goes back to 1.6.  So here's a wrapper layer to keep around for
-# as long as we support 1.4.
-#
-# We don't support 1.4 anymore, but we'll keep the wrappers around until
-# we change all the code to not use them anymore :)
-#
-import sphinx
-from sphinx.util import logging
-
-logger = logging.getLogger('kerneldoc')
-
-def warn(app, message):
-    logger.warning(message)
-
-def verbose(app, message):
-    logger.verbose(message)
-
-def info(app, message):
-    logger.info(message)
diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
index 97166333b727..383f9a695b08 100644
--- a/Documentation/sphinx/kfigure.py
+++ b/Documentation/sphinx/kfigure.py
@@ -59,12 +59,14 @@ from docutils.parsers.rst import directives
 from docutils.parsers.rst.directives import images
 import sphinx
 from sphinx.util.nodes import clean_astext
-import kernellog
+from sphinx.util import logging
 
 Figure = images.Figure
 
 __version__  = '1.0.0'
 
+logger = logging.getLogger('kfigure')
+
 # simple helper
 # -------------
 
@@ -170,7 +172,7 @@ def setupTools(app):
     """
     global dot_cmd, dot_Tpdf, convert_cmd, rsvg_convert_cmd   # pylint: disable=W0603
     global inkscape_cmd, inkscape_ver_one  # pylint: disable=W0603
-    kernellog.verbose(app, "kfigure: check installed tools ...")
+    logger.verbose("kfigure: check installed tools ...")
 
     dot_cmd = which('dot')
     convert_cmd = which('convert')
@@ -178,7 +180,7 @@ def setupTools(app):
     inkscape_cmd = which('inkscape')
 
     if dot_cmd:
-        kernellog.verbose(app, "use dot(1) from: " + dot_cmd)
+        logger.verbose("use dot(1) from: " + dot_cmd)
 
         try:
             dot_Thelp_list = subprocess.check_output([dot_cmd, '-Thelp'],
@@ -190,10 +192,11 @@ def setupTools(app):
         dot_Tpdf_ptn = b'pdf'
         dot_Tpdf = re.search(dot_Tpdf_ptn, dot_Thelp_list)
     else:
-        kernellog.warn(app, "dot(1) not found, for better output quality install "
-                       "graphviz from https://www.graphviz.org")
+        logger.warning(
+            "dot(1) not found, for better output quality install graphviz from https://www.graphviz.org"
+        )
     if inkscape_cmd:
-        kernellog.verbose(app, "use inkscape(1) from: " + inkscape_cmd)
+        logger.verbose("use inkscape(1) from: " + inkscape_cmd)
         inkscape_ver = subprocess.check_output([inkscape_cmd, '--version'],
                                                stderr=subprocess.DEVNULL)
         ver_one_ptn = b'Inkscape 1'
@@ -204,26 +207,27 @@ def setupTools(app):
 
     else:
         if convert_cmd:
-            kernellog.verbose(app, "use convert(1) from: " + convert_cmd)
+            logger.verbose("use convert(1) from: " + convert_cmd)
         else:
-            kernellog.verbose(app,
+            logger.verbose(
                 "Neither inkscape(1) nor convert(1) found.\n"
-                "For SVG to PDF conversion, "
-                "install either Inkscape (https://inkscape.org/) (preferred) or\n"
-                "ImageMagick (https://www.imagemagick.org)")
+                "For SVG to PDF conversion, install either Inkscape (https://inkscape.org/) (preferred) or\n"
+                "ImageMagick (https://www.imagemagick.org)"
+            )
 
         if rsvg_convert_cmd:
-            kernellog.verbose(app, "use rsvg-convert(1) from: " + rsvg_convert_cmd)
-            kernellog.verbose(app, "use 'dot -Tsvg' and rsvg-convert(1) for DOT -> PDF conversion")
+            logger.verbose("use rsvg-convert(1) from: " + rsvg_convert_cmd)
+            logger.verbose("use 'dot -Tsvg' and rsvg-convert(1) for DOT -> PDF conversion")
             dot_Tpdf = False
         else:
-            kernellog.verbose(app,
+            logger.verbose(
                 "rsvg-convert(1) not found.\n"
-                "  SVG rendering of convert(1) is done by ImageMagick-native renderer.")
+                "  SVG rendering of convert(1) is done by ImageMagick-native renderer."
+            )
             if dot_Tpdf:
-                kernellog.verbose(app, "use 'dot -Tpdf' for DOT -> PDF conversion")
+                logger.verbose("use 'dot -Tpdf' for DOT -> PDF conversion")
             else:
-                kernellog.verbose(app, "use 'dot -Tsvg' and convert(1) for DOT -> PDF conversion")
+                logger.verbose("use 'dot -Tsvg' and convert(1) for DOT -> PDF conversion")
 
 
 # integrate conversion tools
@@ -257,13 +261,12 @@ def convert_image(img_node, translator, src_fname=None):
 
     # in kernel builds, use 'make SPHINXOPTS=-v' to see verbose messages
 
-    kernellog.verbose(app, 'assert best format for: ' + img_node['uri'])
+    logger.verbose('assert best format for: ' + img_node['uri'])
 
     if in_ext == '.dot':
 
         if not dot_cmd:
-            kernellog.verbose(app,
-                              "dot from graphviz not available / include DOT raw.")
+            logger.verbose("dot from graphviz not available / include DOT raw.")
             img_node.replace_self(file2literal(src_fname))
 
         elif translator.builder.format == 'latex':
@@ -290,10 +293,11 @@ def convert_image(img_node, translator, src_fname=None):
 
         if translator.builder.format == 'latex':
             if not inkscape_cmd and convert_cmd is None:
-                kernellog.warn(app,
-                                  "no SVG to PDF conversion available / include SVG raw."
-                                  "\nIncluding large raw SVGs can cause xelatex error."
-                                  "\nInstall Inkscape (preferred) or ImageMagick.")
+                logger.warning(
+                    "no SVG to PDF conversion available / include SVG raw.\n"
+                    "Including large raw SVGs can cause xelatex error.\n"
+                    "Install Inkscape (preferred) or ImageMagick."
+                )
                 img_node.replace_self(file2literal(src_fname))
             else:
                 dst_fname = path.join(translator.builder.outdir, fname + '.pdf')
@@ -306,15 +310,14 @@ def convert_image(img_node, translator, src_fname=None):
         _name = dst_fname[len(str(translator.builder.outdir)) + 1:]
 
         if isNewer(dst_fname, src_fname):
-            kernellog.verbose(app,
-                              "convert: {out}/%s already exists and is newer" % _name)
+            logger.verbose("convert: {out}/%s already exists and is newer" % _name)
 
         else:
             ok = False
             mkdir(path.dirname(dst_fname))
 
             if in_ext == '.dot':
-                kernellog.verbose(app, 'convert DOT to: {out}/' + _name)
+                logger.verbose('convert DOT to: {out}/' + _name)
                 if translator.builder.format == 'latex' and not dot_Tpdf:
                     svg_fname = path.join(translator.builder.outdir, fname + '.svg')
                     ok1 = dot2format(app, src_fname, svg_fname)
@@ -325,7 +328,7 @@ def convert_image(img_node, translator, src_fname=None):
                     ok = dot2format(app, src_fname, dst_fname)
 
             elif in_ext == '.svg':
-                kernellog.verbose(app, 'convert SVG to: {out}/' + _name)
+                logger.verbose('convert SVG to: {out}/' + _name)
                 ok = svg2pdf(app, src_fname, dst_fname)
 
             if not ok:
@@ -354,7 +357,7 @@ def dot2format(app, dot_fname, out_fname):
     with open(out_fname, "w") as out:
         exit_code = subprocess.call(cmd, stdout = out)
         if exit_code != 0:
-            kernellog.warn(app,
+            logger.warning(
                           "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
     return bool(exit_code == 0)
 
@@ -388,13 +391,14 @@ def svg2pdf(app, svg_fname, pdf_fname):
         pass
 
     if exit_code != 0:
-        kernellog.warn(app, "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
+        logger.warning("Error #%d when calling: %s" %
+                            (exit_code, " ".join(cmd)))
         if warning_msg:
-            kernellog.warn(app, "Warning msg from %s: %s"
-                           % (cmd_name, str(warning_msg, 'utf-8')))
+            logger.warning( "Warning msg from %s: %s" %
+                                (cmd_name, str(warning_msg, 'utf-8')))
     elif warning_msg:
-        kernellog.verbose(app, "Warning msg from %s (likely harmless):\n%s"
-                          % (cmd_name, str(warning_msg, 'utf-8')))
+        logger.verbose("Warning msg from %s (likely harmless):\n%s" %
+                            (cmd_name, str(warning_msg, 'utf-8')))
 
     return bool(exit_code == 0)
 
@@ -418,7 +422,8 @@ def svg2pdf_by_rsvg(app, svg_fname, pdf_fname):
         # use stdout and stderr from parent
         exit_code = subprocess.call(cmd)
         if exit_code != 0:
-            kernellog.warn(app, "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
+            logger.warning("Error #%d when calling: %s" %
+                                (exit_code, " ".join(cmd)))
         ok = bool(exit_code == 0)
 
     return ok
@@ -513,15 +518,15 @@ def visit_kernel_render(self, node):
     app = self.builder.app
     srclang = node.get('srclang')
 
-    kernellog.verbose(app, 'visit kernel-render node lang: "%s"' % (srclang))
+    logger.verbose('visit kernel-render node lang: "%s"' % srclang)
 
     tmp_ext = RENDER_MARKUP_EXT.get(srclang, None)
     if tmp_ext is None:
-        kernellog.warn(app, 'kernel-render: "%s" unknown / include raw.' % (srclang))
+        logger.warning( 'kernel-render: "%s" unknown / include raw.' % srclang)
         return
 
     if not dot_cmd and tmp_ext == '.dot':
-        kernellog.verbose(app, "dot from graphviz not available / include raw.")
+        logger.verbose("dot from graphviz not available / include raw.")
         return
 
     literal_block = node[0]
-- 
2.48.1

