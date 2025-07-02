Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897142472A6;
	Wed,  2 Jul 2025 22:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495769; cv=none; b=eNyBBtJ0TKsX9ftFSg4u9lKwrVCqoZkf62tGQCkV9Ww5xlbkL0SiyQ1cxlny7R+53ZPmjMfAEdqXpi7kSXlSADv1GbdH2e7LUItuwEnUuFQ1asjgrQynLT6HYdpu/3PzCASCbUYBIaVNCwAVIl8uzRleyBBDFry2fZ45jcSKpaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495769; c=relaxed/simple;
	bh=gydrlw3jSIF8YBncgRSZIy922KgoW02e3WJd1Tq6HDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FszpIEpr2B61dT8Akz0YpZFTPdNSBLZgrA0zgyunMR1IracBuLM9HjCEjDPlXt/ynXHY+CRbTznruE+nOvdBVY+sGZmlKjhXSxi1xdE32SL2V2gDY0QHXAsIcAvznBvryayYJBCcw0JnqgGM1yKTyb1Ezhs2mi5IUyf0k0hxrSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Lsh8jnTA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Lsh8jnTA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4EDB40ADD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495765; bh=lVh5lPm+56xQ1oIpXv6wt5iACADHmHN49eSQAKWz0FA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lsh8jnTAVTKu1akXjIUfevRG0Um/hO57sMsNrHG9D2oBxPU43gpuIayCOsrk4f8SD
	 HTOf3K+4JixahtUGX4XX8SYZgnoeTJrjgTnOQGvLqbu/+YCB15VRh+/cBC4faVb5yL
	 Q2VYl7B8flEhCBxoO6ls6x3foeOmCYpAq8viRX7ALW9DGXugKRlZxx4UyDT9A9ZKjU
	 qYcnfVk0E00bCz1538wjXNKpxqlwBQfsDdfbCsZ6TW6fpgpQJWDcjQebsu9BiR67bu
	 baOHDEf/6TWB3GlniW1EqjK5dWxdQgR6zu/iD7MZN0gKDpzmB93bs48aVeei7gGGfY
	 RePL8I0g4NWVA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id B4EDB40ADD;
	Wed,  2 Jul 2025 22:36:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 11/12] docs: kdoc: clean up check_sections()
Date: Wed,  2 Jul 2025 16:35:23 -0600
Message-ID: <20250702223524.231794-12-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702223524.231794-1-corbet@lwn.net>
References: <20250702223524.231794-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

entry.sectcheck is just a duplicate of our list of sections that is only
passed to check_sections(); its main purpose seems to be to avoid checking
the special named sections.  Rework check_sections() to not use that field
(which is then deleted), tocheck for the known sections directly, and
tighten up the logic in general.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 7191fa94e17a..fdde14b045fe 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -42,9 +42,11 @@ doc_decl = doc_com + KernRe(r'(\w+)', cache=False)
 #         @{section-name}:
 # while trying to not match literal block starts like "example::"
 #
+known_section_names = 'description|context|returns?|notes?|examples?'
+known_sections = KernRe(known_section_names, flags = re.I)
 doc_sect = doc_com + \
-            KernRe(r'\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:([^:].*)?$',
-                flags=re.I, cache=False)
+    KernRe(r'\s*(\@[.\w]+|\@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
+           flags=re.I, cache=False)
 
 doc_content = doc_com_body + KernRe(r'(.*)', cache=False)
 doc_inline_start = KernRe(r'^\s*/\*\*\s*$', cache=False)
@@ -115,7 +117,6 @@ class KernelEntry:
         self.config = config
 
         self._contents = []
-        self.sectcheck = ""
         self.prototype = ""
 
         self.warnings = []
@@ -187,7 +188,6 @@ class KernelEntry:
             self.parameterdescs[name] = contents
             self.parameterdesc_start_lines[name] = self.new_start_line
 
-            self.sectcheck += name + " "
             self.new_start_line = 0
 
         else:
@@ -478,29 +478,20 @@ class KernelDoc:
                         self.push_parameter(ln, decl_type, param, dtype,
                                             arg, declaration_name)
 
-    def check_sections(self, ln, decl_name, decl_type, sectcheck):
+    def check_sections(self, ln, decl_name, decl_type):
         """
         Check for errors inside sections, emitting warnings if not found
         parameters are described.
         """
-
-        sects = sectcheck.split()
-
-        for sx in range(len(sects)):                  # pylint: disable=C0200
-            err = True
-            for param in self.entry.parameterlist:
-                if param == sects[sx]:
-                    err = False
-                    break
-
-            if err:
+        for section in self.entry.sections:
+            if section not in self.entry.parameterlist and \
+               not known_sections.search(section):
                 if decl_type == 'function':
                     dname = f"{decl_type} parameter"
                 else:
                     dname = f"{decl_type} member"
-
                 self.emit_msg(ln,
-                              f"Excess {dname} '{sects[sx]}' description in '{decl_name}'")
+                              f"Excess {dname} '{section}' description in '{decl_name}'")
 
     def check_return_section(self, ln, declaration_name, return_type):
         """
@@ -754,7 +745,7 @@ class KernelDoc:
 
         self.create_parameter_list(ln, decl_type, members, ';',
                                    declaration_name)
-        self.check_sections(ln, declaration_name, decl_type, self.entry.sectcheck)
+        self.check_sections(ln, declaration_name, decl_type)
 
         # Adjust declaration for better display
         declaration = KernRe(r'([\{;])').sub(r'\1\n', declaration)
@@ -1018,7 +1009,7 @@ class KernelDoc:
                           f"expecting prototype for {self.entry.identifier}(). Prototype was for {declaration_name}() instead")
             return
 
-        self.check_sections(ln, declaration_name, "function", self.entry.sectcheck)
+        self.check_sections(ln, declaration_name, "function")
 
         self.check_return_section(ln, declaration_name, return_type)
 
-- 
2.49.0

