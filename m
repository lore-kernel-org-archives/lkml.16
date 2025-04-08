Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2D23BCF8;
	Tue,  8 Apr 2025 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135106; cv=none; b=O+zWlBBSax1gEidEDYLz0gTZ+GxgUypw8c7rrKX/ihEY8sQNy+v02PsXMR+jSLBvBwvYvvQiFi83fLGkUqO69EMzECMFWsOncAVRw3LA1cwaOEkkGmMjEJRoxb6i6wx24iI0lgVJxl45sv2utBK37OBClHFAmAgYvpBqHj4/tgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135106; c=relaxed/simple;
	bh=NNDw5/sxr1HoXnUmWxxGP+FjaKE04b9d79DTu1WAxKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pu6t2FsYdC8b6yjGD6IkRXfNiRSMv1sKBZJofzPCq7/lEzz0ORHDb38nDQkkR0x5FgGIhI49UhfF4aobxGONzddZIA6VOMOvo843IkPyQ2UW7KcvZcylQ7q/UoAcaMpiM4yrRa4i1SWV8hRM+V21oM++gzl17MkCkVJyQaAAr/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g1YE85yA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g1YE85yA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744135102;
	bh=NNDw5/sxr1HoXnUmWxxGP+FjaKE04b9d79DTu1WAxKE=;
	h=From:Date:Subject:To:Cc:From;
	b=g1YE85yA7DWju8TaTIS9XjPXT+CD4hI/GYNl7eS+nImNm2PIkDsgg71U79tVlDBJq
	 GcW469V8yzjeA/+B2EKGg9x+uhSmE/mywn5Cy7DXGwWYwuwB1vlhunuR7BmqFnDVCY
	 2+OAvJ612c3iLvPhW6rnNwgeoYGw32SP5yctWiekGyWdq72GeEa23U1+VCvbNXT8Kw
	 26s0naB6B2XLkThz8GaWJH2fmz73ZRWSqP/q+srZfShgHNW9p4IqMJK3wmE4PVqTCE
	 fPMA4qIvgJEVswFY/gnCbTihTw14zQAwFKcXFGD2kEnGD3TG0X14bYB2iUiRelKL1J
	 ek4YSon9fnlgQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C8BF17E07F3;
	Tue,  8 Apr 2025 19:58:21 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 08 Apr 2025 13:57:47 -0400
Subject: [PATCH v2] docs: automarkup: Move common logic to add and resolve
 xref to helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250408-automarkup-resolve-xref-helper-v2-1-e0a9b8fc7fdd@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJpj9WcC/42NQQ6CMBBFr0K6dkxpQMGV9zAs6nSQxkKbKTQYw
 t2tnMDl+z95bxOR2FIUt2ITTMlG66cM6lQIHPT0IrAms1BS1bKSV9DL7EfN7yUAU/QuEaxMPQz
 kAjGY1iChbKteNSJLQv7segQeXebBxtnz5+il8rf+rU4llNCiRnnRpm5kf0fvnH561mf0o+j2f
 f8C8BS6stAAAAA=
X-Change-ID: 20250407-automarkup-resolve-xref-helper-d9dcec094f28
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Several of the markup functions contain the same code, calling into
sphinx's pending_xref and resolve_xref functions to add and resolve a
cross-reference, with only a few of the parameters changed (domain,
reference type, markup content). Move this logic to its own function and
reuse it in the markup functions.

No functional change.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Moved repeated "Go through the dance..." comment to the helper
- Dropped "Return the xref if we got it..." comment as the helper
  returns None in case of failure
- Link to v1: https://lore.kernel.org/r/20250407-automarkup-resolve-xref-helper-v1-1-9cac06ad580f@collabora.com
---
 Documentation/sphinx/automarkup.py | 97 ++++++++++----------------------------
 1 file changed, 24 insertions(+), 73 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index ecf54d22e9dc6ab459a91fde580c1cf161f054ed..fd633f7a0bc30a205cd155d2df65fd5440336e30 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -128,13 +128,8 @@ def note_failure(target):
 # own C role, but both match the same regex, so we try both.
 #
 def markup_func_ref_sphinx3(docname, app, match):
-    cdom = app.env.domains['c']
-    #
-    # Go through the dance of getting an xref out of the C domain
-    #
     base_target = match.group(2)
     target_text = nodes.Text(match.group(0))
-    xref = None
     possible_targets = [base_target]
     # Check if this document has a namespace, and if so, try
     # cross-referencing inside it first.
@@ -146,22 +141,8 @@ def markup_func_ref_sphinx3(docname, app, match):
             if (target not in Skipfuncs) and not failure_seen(target):
                 lit_text = nodes.literal(classes=['xref', 'c', 'c-func'])
                 lit_text += target_text
-                pxref = addnodes.pending_xref('', refdomain = 'c',
-                                              reftype = 'function',
-                                              reftarget = target,
-                                              modname = None,
-                                              classname = None)
-                #
-                # XXX The Latex builder will throw NoUri exceptions here,
-                # work around that by ignoring them.
-                #
-                try:
-                    xref = cdom.resolve_xref(app.env, docname, app.builder,
-                                             'function', target, pxref,
-                                             lit_text)
-                except NoUri:
-                    xref = None
-
+                xref = add_and_resolve_xref(app, docname, 'c', 'function',
+                                            target, contnode=lit_text)
                 if xref:
                     return xref
                 note_failure(target)
@@ -188,13 +169,8 @@ def markup_c_ref(docname, app, match):
                    RE_typedef: 'type',
                    }
 
-    cdom = app.env.domains['c']
-    #
-    # Go through the dance of getting an xref out of the C domain
-    #
     base_target = match.group(2)
     target_text = nodes.Text(match.group(0))
-    xref = None
     possible_targets = [base_target]
     # Check if this document has a namespace, and if so, try
     # cross-referencing inside it first.
@@ -206,21 +182,9 @@ def markup_c_ref(docname, app, match):
             if not (match.re == RE_function and target in Skipfuncs):
                 lit_text = nodes.literal(classes=['xref', 'c', class_str[match.re]])
                 lit_text += target_text
-                pxref = addnodes.pending_xref('', refdomain = 'c',
-                                              reftype = reftype_str[match.re],
-                                              reftarget = target, modname = None,
-                                              classname = None)
-                #
-                # XXX The Latex builder will throw NoUri exceptions here,
-                # work around that by ignoring them.
-                #
-                try:
-                    xref = cdom.resolve_xref(app.env, docname, app.builder,
-                                             reftype_str[match.re], target, pxref,
-                                             lit_text)
-                except NoUri:
-                    xref = None
-
+                xref = add_and_resolve_xref(app, docname, 'c',
+                                            reftype_str[match.re], target,
+                                            contnode=lit_text)
                 if xref:
                     return xref
 
@@ -231,30 +195,12 @@ def markup_c_ref(docname, app, match):
 # cross reference to that page
 #
 def markup_doc_ref(docname, app, match):
-    stddom = app.env.domains['std']
-    #
-    # Go through the dance of getting an xref out of the std domain
-    #
     absolute = match.group(1)
     target = match.group(2)
     if absolute:
        target = "/" + target
-    xref = None
-    pxref = addnodes.pending_xref('', refdomain = 'std', reftype = 'doc',
-                                  reftarget = target, modname = None,
-                                  classname = None, refexplicit = False)
-    #
-    # XXX The Latex builder will throw NoUri exceptions here,
-    # work around that by ignoring them.
-    #
-    try:
-        xref = stddom.resolve_xref(app.env, docname, app.builder, 'doc',
-                                   target, pxref, None)
-    except NoUri:
-        xref = None
-    #
-    # Return the xref if we got it; otherwise just return the plain text.
-    #
+
+    xref = add_and_resolve_xref(app, docname, 'std', 'doc', target)
     if xref:
         return xref
     else:
@@ -265,10 +211,6 @@ def markup_doc_ref(docname, app, match):
 # with a cross reference to that page
 #
 def markup_abi_ref(docname, app, match, warning=False):
-    stddom = app.env.domains['std']
-    #
-    # Go through the dance of getting an xref out of the std domain
-    #
     kernel_abi = get_kernel_abi()
 
     fname = match.group(1)
@@ -280,7 +222,18 @@ def markup_abi_ref(docname, app, match, warning=False):
             kernel_abi.log.warning("%s not found", fname)
         return nodes.Text(match.group(0))
 
-    pxref = addnodes.pending_xref('', refdomain = 'std', reftype = 'ref',
+    xref = add_and_resolve_xref(app, docname, 'std', 'ref', target)
+    if xref:
+        return xref
+    else:
+        return nodes.Text(match.group(0))
+
+def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
+    #
+    # Go through the dance of getting an xref out of the corresponding domain
+    #
+    dom_obj = app.env.domains[domain]
+    pxref = addnodes.pending_xref('', refdomain = domain, reftype = reftype,
                                   reftarget = target, modname = None,
                                   classname = None, refexplicit = False)
 
@@ -289,17 +242,15 @@ def markup_abi_ref(docname, app, match, warning=False):
     # work around that by ignoring them.
     #
     try:
-        xref = stddom.resolve_xref(app.env, docname, app.builder, 'ref',
-                                   target, pxref, None)
+        xref = dom_obj.resolve_xref(app.env, docname, app.builder, reftype,
+                                    target, pxref, contnode)
     except NoUri:
         xref = None
-    #
-    # Return the xref if we got it; otherwise just return the plain text.
-    #
+
     if xref:
         return xref
-    else:
-        return nodes.Text(match.group(0))
+
+    return None
 
 #
 # Variant of markup_abi_ref() that warns whan a reference is not found

---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250407-automarkup-resolve-xref-helper-d9dcec094f28

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

