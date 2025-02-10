Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B51D47C7;
	Mon, 10 Feb 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=Di5gelxnKprxJGyNpssRRI8l5eT1BeMQw8suDitz0bPklotoP2u9k/xBDQLGF0AQqxI8hOeA2znt63g60MTjFKM+FJ0xiAZwFD2F39O31kN64KhOqN5s/AStHZWkRN7zvjnKXgKToSmSjBJ0tmAhHxmz2eYjdA8GV3DchlkQG80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=46VkCE+flgH9rmSfTBFYALbsFaY062haAmepJLiR/ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUFnP5vxM3rEz12Ej1fSEY0Uf4PI5GFpTrDgnAvQF/jYI2kkO4Q0LnZHR6x012m17IHQaOw5LS1O28g3p+EnUJxsmegKXIE+HjtQCoPLKle0rvsJAXi4FPIH0g8X5iUFKMfxZWmXaNPmxVasR7kL0WWiZUVPzvoi0+sbUlBJkw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQXEyYTB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQXEyYTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D861C113D0;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=46VkCE+flgH9rmSfTBFYALbsFaY062haAmepJLiR/ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQXEyYTBVm07E5TFqOQWVk/sA7lDBI+d2dMnRqxPSs44FDXm8HB7rmuqqdW/KRAwh
	 0so+ZfmZV5dVhcsaJLeDLm/DNC6otcJDns1wq6/jTW2hLsH+dVo5pui5uO7vDHfzw1
	 REVBVF11KxFuA3PRyWaZ3RHQdTxl/ijmUQLBayFZg2jL5ICLLt2zUKxNh3gLN2CVuM
	 kFWDF6UyojZTb5jzodJOji2asu4GpJuyW7iUNjXgBMZnK63VCj6+z15HxESHTULdSq
	 Vj7COfLD6hldbwdwqINNs1swzk27xvJB89QHngd+4YZcCD9Cb7duz8T0vlaSV00bnU
	 IgXgc+SWGug8A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006CjY-1qI5;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/27] docs: sphinx/automarkup: add cross-references for ABI
Date: Mon, 10 Feb 2025 11:18:11 +0100
Message-ID: <0b97a51b68b1c20127ad4a6a55658557fe0848d0.1739182025.git.mchehab+huawei@kernel.org>
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

Now that all ABI files are handled together, we can add a feature
at automarkup for it to generate cross-references for ABI symbols.

The cross-reference logic can produce references for all existing
files, except for README (as this is not parsed).

For symbols, they need to be an exact match of what it is
described at the docs, which is not always true due to wildcards.

If symbols at /sys /proc and /config are identical, a cross-reference
will be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/automarkup.py | 45 ++++++++++++++++++++++++++++++
 scripts/lib/abi/abi_parser.py      | 11 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index a413f8dd5115..7d91c39b4ca6 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -11,6 +11,8 @@ from sphinx.errors import NoUri
 import re
 from itertools import chain
 
+from kernel_abi import kernel_abi
+
 #
 # Python 2 lacks re.ASCII...
 #
@@ -48,6 +50,8 @@ RE_typedef = re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
 # an optional extension
 #
 RE_doc = re.compile(r'(\bDocumentation/)?((\.\./)*[\w\-/]+)\.(rst|txt)')
+RE_abi_file = re.compile(r'(\bDocumentation/ABI/[\w\-/]+)')
+RE_abi_symbol = re.compile(r'(\b/(sys|config|proc)/[\w\-/]+)')
 
 RE_namespace = re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
 
@@ -84,10 +88,14 @@ def markup_refs(docname, app, node):
     # Associate each regex with the function that will markup its matches
     #
     markup_func_sphinx2 = {RE_doc: markup_doc_ref,
+                           RE_abi_file: markup_abi_ref,
+                           RE_abi_symbol: markup_abi_ref,
                            RE_function: markup_c_ref,
                            RE_generic_type: markup_c_ref}
 
     markup_func_sphinx3 = {RE_doc: markup_doc_ref,
+                           RE_abi_file: markup_abi_ref,
+                           RE_abi_symbol: markup_abi_ref,
                            RE_function: markup_func_ref_sphinx3,
                            RE_struct: markup_c_ref,
                            RE_union: markup_c_ref,
@@ -270,6 +278,43 @@ def markup_doc_ref(docname, app, match):
     else:
         return nodes.Text(match.group(0))
 
+#
+# Try to replace a documentation reference of the form Documentation/ABI/...
+# with a cross reference to that page
+#
+def markup_abi_ref(docname, app, match):
+    stddom = app.env.domains['std']
+    #
+    # Go through the dance of getting an xref out of the std domain
+    #
+    fname = match.group(1)
+    target = kernel_abi.xref(fname)
+
+    # Kernel ABI doesn't describe such file or symbol
+    if not target:
+        return nodes.Text(match.group(0))
+
+    pxref = addnodes.pending_xref('', refdomain = 'std', reftype = 'ref',
+                                  reftarget = target, modname = None,
+                                  classname = None, refexplicit = False)
+
+    #
+    # XXX The Latex builder will throw NoUri exceptions here,
+    # work around that by ignoring them.
+    #
+    try:
+        xref = stddom.resolve_xref(app.env, docname, app.builder, 'ref',
+                                   target, pxref, None)
+    except NoUri:
+        xref = None
+    #
+    # Return the xref if we got it; otherwise just return the plain text.
+    #
+    if xref:
+        return xref
+    else:
+        return nodes.Text(match.group(0))
+
 def get_c_namespace(app, docname):
     source = app.env.doc2path(docname)
     with open(source) as f:
diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index 87d1b9e14bb3..3b1ab4c0bdd7 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -391,6 +391,17 @@ class AbiParser:
 
         return desc + "\n\n"
 
+    def xref(self, fname):
+        """
+        Converts a Documentation/ABI + basename into a ReST cross-reference
+        """
+
+        xref = self.file_refs.get(fname)
+        if not xref:
+            return None
+        else:
+            return xref
+
     def desc_rst(self, desc):
         """Enrich ReST output by creating cross-references"""
 
-- 
2.48.1

