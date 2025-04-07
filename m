Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDD3202973;
	Mon,  7 Apr 2025 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040555; cv=none; b=QaZk2uHxCXp8onmUM8iASarhRJB8a+oaY+6X+q8Y+7K6xTmH8w6W/fn99xOS6EqHZnh6hMeWEdIC/B0UeaIrvc7bIsCqfZwl5iFfuIRrOOjnDAQQSY0kZLoubUqu5cqKIRX9DNZar2HDjyfToOPBRl0uJvCm8QYR/KD3V9Q9cOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040555; c=relaxed/simple;
	bh=yPfzbYwfYsZAnZVLHNRkMj2YFdxKeiRsoAYHu5QBxh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dbhjG6tZz/cz99gLF1DGaFwX3Y7xamygnKdxGHRWtXEvrwWDYRFC9aHF6vwtH/td6OStGfwaS+wY6egDPkzSH+KTwDEEJu65olGCqhkzd5QEfDv2FHmLAMGOPbKp64kyPXeGenqBvsw6iP8NPRtLlH3PRyhbXm5aOM4ae+wp7sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GjL3OIYe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GjL3OIYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744040550;
	bh=yPfzbYwfYsZAnZVLHNRkMj2YFdxKeiRsoAYHu5QBxh0=;
	h=From:Date:Subject:To:Cc:From;
	b=GjL3OIYekEJ2DhTKuyXPHbGVbffgZt0uVi537TbqYYHRx0JfQOzjXu54/KE4gDqcA
	 NUPOIOYYOe/k6tFZCH42lRHjpkp+sHSmB5x6Qvt8cGuM4p0mzdgR+pvWlWYbUcmXvf
	 Oa8Y73J7jjWqDjvYazTMl+dy6kY69E8PFDeATjjOgCydoVmluP2D1PSvE5dory+7uo
	 6VtrUvc9ro+Y0lpN0czS56rLP+KovFWCrjUsM60HDo+0k+3ISFVcdSxqkpA4nDZGVl
	 xlLHFgtcUDHHUHmJpxW0bmDGmXTmAyt0ZICZTTtohsEYcvUGeXYq9ZVEt76FUqpHcE
	 Sy9BXSiAZB++g==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C5DE17E0EC0;
	Mon,  7 Apr 2025 17:42:29 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 07 Apr 2025 11:42:03 -0400
Subject: [PATCH] docs: automarkup: Move common logic to add and resolve
 xref to helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250407-automarkup-resolve-xref-helper-v1-1-9cac06ad580f@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEry82cC/x2NwQqDMBAFf0X27EIMFmt/RTyE5KlLrQmbKoL47
 w09DgMzF2WoINOrukhxSJa4FWjqivzithksoTBZYx+mNR27/Rs/Tt97YkWO6wE+FRMvWBOUQx8
 8vOnbyT6pRFJxcv4Hw3jfP1l6E4lwAAAA
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
 Documentation/sphinx/automarkup.py | 78 ++++++++++----------------------------
 1 file changed, 20 insertions(+), 58 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index ecf54d22e9dc6ab459a91fde580c1cf161f054ed..8b129835e521428c0bafdc1584c8ce69252a668d 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -128,13 +128,11 @@ def note_failure(target):
 # own C role, but both match the same regex, so we try both.
 #
 def markup_func_ref_sphinx3(docname, app, match):
-    cdom = app.env.domains['c']
     #
     # Go through the dance of getting an xref out of the C domain
     #
     base_target = match.group(2)
     target_text = nodes.Text(match.group(0))
-    xref = None
     possible_targets = [base_target]
     # Check if this document has a namespace, and if so, try
     # cross-referencing inside it first.
@@ -146,22 +144,8 @@ def markup_func_ref_sphinx3(docname, app, match):
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
@@ -188,13 +172,11 @@ def markup_c_ref(docname, app, match):
                    RE_typedef: 'type',
                    }
 
-    cdom = app.env.domains['c']
     #
     # Go through the dance of getting an xref out of the C domain
     #
     base_target = match.group(2)
     target_text = nodes.Text(match.group(0))
-    xref = None
     possible_targets = [base_target]
     # Check if this document has a namespace, and if so, try
     # cross-referencing inside it first.
@@ -206,21 +188,9 @@ def markup_c_ref(docname, app, match):
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
 
@@ -231,7 +201,6 @@ def markup_c_ref(docname, app, match):
 # cross reference to that page
 #
 def markup_doc_ref(docname, app, match):
-    stddom = app.env.domains['std']
     #
     # Go through the dance of getting an xref out of the std domain
     #
@@ -239,22 +208,8 @@ def markup_doc_ref(docname, app, match):
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
@@ -265,7 +220,6 @@ def markup_doc_ref(docname, app, match):
 # with a cross reference to that page
 #
 def markup_abi_ref(docname, app, match, warning=False):
-    stddom = app.env.domains['std']
     #
     # Go through the dance of getting an xref out of the std domain
     #
@@ -280,7 +234,15 @@ def markup_abi_ref(docname, app, match, warning=False):
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
+    dom_obj = app.env.domains[domain]
+    pxref = addnodes.pending_xref('', refdomain = domain, reftype = reftype,
                                   reftarget = target, modname = None,
                                   classname = None, refexplicit = False)
 
@@ -289,8 +251,8 @@ def markup_abi_ref(docname, app, match, warning=False):
     # work around that by ignoring them.
     #
     try:
-        xref = stddom.resolve_xref(app.env, docname, app.builder, 'ref',
-                                   target, pxref, None)
+        xref = dom_obj.resolve_xref(app.env, docname, app.builder, reftype,
+                                    target, pxref, contnode)
     except NoUri:
         xref = None
     #
@@ -298,8 +260,8 @@ def markup_abi_ref(docname, app, match, warning=False):
     #
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

