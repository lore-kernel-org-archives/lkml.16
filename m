Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C211B1E9B06;
	Tue, 11 Feb 2025 06:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254777; cv=none; b=nrgRgr28HdgpsyDzWFkEER8UEvuhNdxi0Xp3RyytPQPL4gSQPFltJDabD1bnsbRPL5mDCVrseJtPup0HMZJXOYtmnJtKdR59oe21cIOtE8Ojhsw6fz/+jWeQe1tXR2XEjxKlN8afPfMY2FAu8N5suKLwUdcZIw+OXE6TMa6o3lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254777; c=relaxed/simple;
	bh=p/Z2Ab/2lyYQoWXm0SaYttyW5aZICXXJG85lswoPWzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELyfpNd0ltzRxZJGWp1cEhH2ypCx9ygjG7FLAPGmwQW5Yyw266BNUiJNF5IE3NOmlbO0i16SY/yuZIVxtJPJwLr1Emzg8F2Afw4f4+LD9ZmgUEjIYR/Hg5bAIU+Dck/lTkl0r4UkS2TEphR3N4hWx94SqHP3wYxN+ZKySzy13r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DD9772i5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DD9772i5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC26C4AF09;
	Tue, 11 Feb 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254777;
	bh=p/Z2Ab/2lyYQoWXm0SaYttyW5aZICXXJG85lswoPWzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DD9772i5e81KhyKNMc8XBSZXjBl5TVAk2U6RhD491ygXQaApAvsZq8rhla9j/ihRD
	 6JR4wlt5HhMn/STVYnD0ozwhKIkvjBiaziFpI2athuEsEpv+NKn8QoQJxIFfmUasYU
	 /P9+L3iGfOBxbt92bggXDWVxE1tNNuFsWljdw3P3fQ/l8GEjDX1vocE885P/BQXeR/
	 m9GyWIxy+PihOKuEX0NZ1QGOMHz6ZYtchyToPw7XZi66cnfrNoSMA3j/EOOF8tb0ei
	 N1FBmN8oO0fe0xbEcY2ailwmdv+prnHRK3zmCOkql1Tj6+mHeDLA+0SBuuBrxYEaRW
	 Me6E76P0iE3XQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjcN-00000008Y6e-1KMf;
	Tue, 11 Feb 2025 07:19:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] docs: extensions: don't use utf-8 syntax for descriptions
Date: Tue, 11 Feb 2025 07:19:03 +0100
Message-ID: <8a42f6be53464af4b866492a7e9ddf29c0429997.1739254187.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739254187.git.mchehab+huawei@kernel.org>
References: <cover.1739254187.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

None of the descriptions at the Sphinx extensions are using
non-ascii characters, so no need to place them under u"""
notation.

Also, according with:
	https://docs.python.org/3/deprecations/pending-removal-in-3.16.html

the 'u' format code is scheduled to be removed in Python 3.16.

So, let's just use """.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/cdomain.py             |  4 ++--
 Documentation/sphinx/kernel_abi.py          |  6 +++---
 Documentation/sphinx/kernel_feat.py         |  4 ++--
 Documentation/sphinx/kernel_include.py      |  4 ++--
 Documentation/sphinx/kfigure.py             | 10 +++++-----
 Documentation/sphinx/load_config.py         |  2 +-
 Documentation/sphinx/maintainers_include.py |  4 ++--
 Documentation/sphinx/rstFlatTable.py        | 10 +++++-----
 8 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index e6959af25402..6596fd00663f 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -1,6 +1,6 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=W0141,C0113,C0103,C0325
-u"""
+"""
     cdomain
     ~~~~~~~
 
@@ -145,7 +145,7 @@ class CObject(Base_CObject):
     }
 
     def handle_func_like_macro(self, sig, signode):
-        u"""Handles signatures of function-like macros.
+        """Handles signatures of function-like macros.
 
         If the objtype is 'function' and the signature ``sig`` is a
         function-like macro, the name of the macro is returned. Otherwise
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index e017b0299953..db6f0380de94 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -2,7 +2,7 @@
 # coding=utf-8
 # SPDX-License-Identifier: GPL-2.0
 #
-u"""
+"""
     kernel-abi
     ~~~~~~~~~~
 
@@ -55,7 +55,7 @@ path = os.path.join(srctree, "Documentation/ABI")
 _kernel_abi = None
 
 def get_kernel_abi():
-    u"""
+    """
     Initialize kernel_abi global var, if not initialized yet.
 
     This is needed to avoid warnings during Sphinx module initialization.
@@ -81,7 +81,7 @@ def setup(app):
 
 
 class KernelCmd(Directive):
-    u"""KernelABI (``kernel-abi``) directive"""
+    """KernelABI (``kernel-abi``) directive"""
 
     required_arguments = 1
     optional_arguments = 3
diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index 03ace5f01b5c..e3a51867f27b 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -1,7 +1,7 @@
 # coding=utf-8
 # SPDX-License-Identifier: GPL-2.0
 #
-u"""
+"""
     kernel-feat
     ~~~~~~~~~~~
 
@@ -56,7 +56,7 @@ def setup(app):
 
 class KernelFeat(Directive):
 
-    u"""KernelFeat (``kernel-feat``) directive"""
+    """KernelFeat (``kernel-feat``) directive"""
 
     required_arguments = 1
     optional_arguments = 2
diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index 638762442336..8db176045bc5 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -2,7 +2,7 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=R0903, C0330, R0914, R0912, E0401
 
-u"""
+"""
     kernel-include
     ~~~~~~~~~~~~~~
 
@@ -56,7 +56,7 @@ def setup(app):
 class KernelInclude(Include):
 # ==============================================================================
 
-    u"""KernelInclude (``kernel-include``) directive"""
+    """KernelInclude (``kernel-include``) directive"""
 
     def run(self):
         env = self.state.document.settings.env
diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
index 383f9a695b08..f1a7f13c9c60 100644
--- a/Documentation/sphinx/kfigure.py
+++ b/Documentation/sphinx/kfigure.py
@@ -1,6 +1,6 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=C0103, R0903, R0912, R0915
-u"""
+"""
     scalable figure and image handling
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -165,7 +165,7 @@ def setup(app):
 
 
 def setupTools(app):
-    u"""
+    """
     Check available build tools and log some *verbose* messages.
 
     This function is called once, when the builder is initiated.
@@ -445,7 +445,7 @@ class kernel_image(nodes.image):
     pass
 
 class KernelImage(images.Image):
-    u"""KernelImage directive
+    """KernelImage directive
 
     Earns everything from ``.. image::`` directive, except *remote URI* and
     *glob* pattern. The KernelImage wraps a image node into a
@@ -481,7 +481,7 @@ class kernel_figure(nodes.figure):
     """Node for ``kernel-figure`` directive."""
 
 class KernelFigure(Figure):
-    u"""KernelImage directive
+    """KernelImage directive
 
     Earns everything from ``.. figure::`` directive, except *remote URI* and
     *glob* pattern.  The KernelFigure wraps a figure node into a kernel_figure
@@ -557,7 +557,7 @@ class kernel_render(nodes.General, nodes.Inline, nodes.Element):
     pass
 
 class KernelRender(Figure):
-    u"""KernelRender directive
+    """KernelRender directive
 
     Render content by external tool.  Has all the options known from the
     *figure*  directive, plus option ``caption``.  If ``caption`` has a
diff --git a/Documentation/sphinx/load_config.py b/Documentation/sphinx/load_config.py
index 8b416bfd75ac..ec50e1ee5223 100644
--- a/Documentation/sphinx/load_config.py
+++ b/Documentation/sphinx/load_config.py
@@ -9,7 +9,7 @@ from sphinx.util.osutil import fs_encoding
 def loadConfig(namespace):
 # ------------------------------------------------------------------------------
 
-    u"""Load an additional configuration file into *namespace*.
+    """Load an additional configuration file into *namespace*.
 
     The name of the configuration file is taken from the environment
     ``SPHINX_CONF``. The external configuration file extends (or overwrites) the
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index dcad0fff4723..d31cff867436 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -3,7 +3,7 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=R0903, C0330, R0914, R0912, E0401
 
-u"""
+"""
     maintainers-include
     ~~~~~~~~~~~~~~~~~~~
 
@@ -37,7 +37,7 @@ def setup(app):
     )
 
 class MaintainersInclude(Include):
-    u"""MaintainersInclude (``maintainers-include``) directive"""
+    """MaintainersInclude (``maintainers-include``) directive"""
     required_arguments = 0
 
     def parse_maintainers(self, path):
diff --git a/Documentation/sphinx/rstFlatTable.py b/Documentation/sphinx/rstFlatTable.py
index 16bea0632555..180fbb50c337 100755
--- a/Documentation/sphinx/rstFlatTable.py
+++ b/Documentation/sphinx/rstFlatTable.py
@@ -2,7 +2,7 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=C0330, R0903, R0912
 
-u"""
+"""
     flat-table
     ~~~~~~~~~~
 
@@ -99,7 +99,7 @@ class colSpan(nodes.General, nodes.Element): pass # pylint: disable=C0103,C0321
 class FlatTable(Table):
 # ==============================================================================
 
-    u"""FlatTable (``flat-table``) directive"""
+    """FlatTable (``flat-table``) directive"""
 
     option_spec = {
         'name': directives.unchanged
@@ -135,7 +135,7 @@ class FlatTable(Table):
 class ListTableBuilder(object):
 # ==============================================================================
 
-    u"""Builds a table from a double-stage list"""
+    """Builds a table from a double-stage list"""
 
     def __init__(self, directive):
         self.directive = directive
@@ -212,7 +212,7 @@ class ListTableBuilder(object):
         raise SystemMessagePropagation(error)
 
     def parseFlatTableNode(self, node):
-        u"""parses the node from a :py:class:`FlatTable` directive's body"""
+        """parses the node from a :py:class:`FlatTable` directive's body"""
 
         if len(node) != 1 or not isinstance(node[0], nodes.bullet_list):
             self.raiseError(
@@ -225,7 +225,7 @@ class ListTableBuilder(object):
         self.roundOffTableDefinition()
 
     def roundOffTableDefinition(self):
-        u"""Round off the table definition.
+        """Round off the table definition.
 
         This method rounds off the table definition in :py:member:`rows`.
 
-- 
2.48.1

