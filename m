Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8421BA2E;
	Wed,  2 Jul 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495767; cv=none; b=BO2awDS2yqOJluLQ8djjqGx+Tq4tpq4ruIlE4KoZrQ5xmP5Q+ofF849cOsLHUlv/aqUo/Ag4v6Z71H9OEopTOYSW+PGJwJushLPbw4VOnJdihUhNwcjGuoE+zvA9uLtBHI9Vu+ldvh/p9CAMJ2JhgYteVrt1ishJCRVAhh/kIW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495767; c=relaxed/simple;
	bh=oZuV8TXB0zmFmNtykCVMbeVWfcnuP0A42EsvLKTwol8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfGzdiOQ1RXB7BfUdCdfa5SkEcMSdkWjsEHuvLb+LcLP7lQw2ZxKFDE3meQdZykg5XlbQsCUtsOnnmne5bEegdxijaJfcsSfgdmkHQVD+INhpxWlM1tutro4ZFpKdjS5U2ZVs15b+zEb6PW+2Y4Vd1fPzkmiEEYFkdcN0JYyYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZKCmdI9a; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZKCmdI9a"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69B8E40AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495761; bh=atGQI8ciMQaBSgY8/Pnz9IPDBgayT8RIht1YuEDa/kE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZKCmdI9a6ouhaRpb0abiFSNJ9NxywoLe4apaimyq4aR8hb7vV43HkMkyvFXlYsslw
	 1+w/zDtnCkTT23Hv+t+UFPwwRBD0jk0XYStbPY2jkzVD9yUb9fFwx9sATBNSuV/J1i
	 PvbU5OIxM5pndAqeSDBaRIu0TamqyYncsZhuvALzIYdA6k8QKBtWDGuS5GYpAG5YOG
	 knun8egBwzPDlPrOMPg418ZrsvJMDUgjI99DPkbb1L3oPEBbmTx9HSBlA8efEK3QkX
	 qKVV5QEeZG+vKaAExLO8dMdQFde88nDq66fHQsc2LrE27rhgGt6oVLbmZTGg1FeAli
	 GlHO4akNXYHYQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 69B8E40AD7;
	Wed,  2 Jul 2025 22:36:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 05/12] docs: kdoc: remove the "struct_actual" machinery
Date: Wed,  2 Jul 2025 16:35:17 -0600
Message-ID: <20250702223524.231794-6-corbet@lwn.net>
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

The code goes out of its way to create a special list of parameters in
entry.struct_actual that is just like entry.parameterlist, but with extra
junk.  The only use of that information, in check_sections(), promptly
strips all the extra junk back out.  Drop all that extra work and just use
parameterlist.

No output changes.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 608f3a1045dc..b28f056365cb 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -116,7 +116,6 @@ class KernelEntry:
 
         self._contents = []
         self.sectcheck = ""
-        self.struct_actual = ""
         self.prototype = ""
 
         self.warnings = []
@@ -366,15 +365,6 @@ class KernelDoc:
         org_arg = KernRe(r'\s\s+').sub(' ', org_arg)
         self.entry.parametertypes[param] = org_arg
 
-    def save_struct_actual(self, actual):
-        """
-        Strip all spaces from the actual param so that it looks like
-        one string item.
-        """
-
-        actual = KernRe(r'\s*').sub("", actual, count=1)
-
-        self.entry.struct_actual += actual + " "
 
     def create_parameter_list(self, ln, decl_type, args,
                               splitter, declaration_name):
@@ -420,7 +410,6 @@ class KernelDoc:
                     param = arg
 
                 dtype = KernRe(r'([^\(]+\(\*?)\s*' + re.escape(param)).sub(r'\1', arg)
-                self.save_struct_actual(param)
                 self.push_parameter(ln, decl_type, param, dtype,
                                     arg, declaration_name)
 
@@ -437,7 +426,6 @@ class KernelDoc:
 
                 dtype = KernRe(r'([^\(]+\(\*?)\s*' + re.escape(param)).sub(r'\1', arg)
 
-                self.save_struct_actual(param)
                 self.push_parameter(ln, decl_type, param, dtype,
                                     arg, declaration_name)
 
@@ -470,7 +458,6 @@ class KernelDoc:
 
                         param = r.group(1)
 
-                        self.save_struct_actual(r.group(2))
                         self.push_parameter(ln, decl_type, r.group(2),
                                             f"{dtype} {r.group(1)}",
                                             arg, declaration_name)
@@ -482,12 +469,10 @@ class KernelDoc:
                             continue
 
                         if dtype != "":  # Skip unnamed bit-fields
-                            self.save_struct_actual(r.group(1))
                             self.push_parameter(ln, decl_type, r.group(1),
                                                 f"{dtype}:{r.group(2)}",
                                                 arg, declaration_name)
                     else:
-                        self.save_struct_actual(param)
                         self.push_parameter(ln, decl_type, param, dtype,
                                             arg, declaration_name)
 
@@ -499,24 +484,11 @@ class KernelDoc:
 
         sects = sectcheck.split()
         prms = prmscheck.split()
-        err = False
 
         for sx in range(len(sects)):                  # pylint: disable=C0200
             err = True
             for px in range(len(prms)):               # pylint: disable=C0200
-                prm_clean = prms[px]
-                prm_clean = KernRe(r'\[.*\]').sub('', prm_clean)
-                prm_clean = attribute.sub('', prm_clean)
-
-                # ignore array size in a parameter string;
-                # however, the original param string may contain
-                # spaces, e.g.:  addr[6 + 2]
-                # and this appears in @prms as "addr[6" since the
-                # parameter list is split at spaces;
-                # hence just ignore "[..." for the sections check;
-                prm_clean = KernRe(r'\[.*').sub('', prm_clean)
-
-                if prm_clean == sects[sx]:
+                if prms[px] == sects[sx]:
                     err = False
                     break
 
@@ -782,7 +754,7 @@ class KernelDoc:
         self.create_parameter_list(ln, decl_type, members, ';',
                                    declaration_name)
         self.check_sections(ln, declaration_name, decl_type,
-                            self.entry.sectcheck, self.entry.struct_actual)
+                            self.entry.sectcheck, ' '.join(self.entry.parameterlist))
 
         # Adjust declaration for better display
         declaration = KernRe(r'([\{;])').sub(r'\1\n', declaration)
-- 
2.49.0

