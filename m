Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E39F30205E;
	Tue,  1 Jul 2025 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403480; cv=none; b=tunFXxew9DBNmAO4bSrrqJac+kVX7O0Tm8/aK+KRRvhM9KSyxU7/wkTsnJFF4JMHUYrsGH4ndi++QZ/jV0v9/2LiHEHMt1+c+qPaPfJell6ZdAbG9qNd6n7iG+D0wh25GQ9pF8iFDsLv62AKxg2wzbK4KGn9ajjVZiAhRSP2Vgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403480; c=relaxed/simple;
	bh=hdpGtK68M+XvvOVPSZyN4HZX2pXXmSiwJyQ18ETu3nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkziUQq7vavFdzIrcGe/2OyK1MV+3Ib5RnX0f9cAfeuRrjEALEonQzLTBVn9N3skS1mTQ2XcR09ReltbJjQHjx2Et48aODYJvP3BrvzkD5Z0cm6PAEdNWzrD0/4QkIe9qfrz13bV9xd+A4YhoV/hV/5bVqEU+Ohwgg0EtfCJtEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=s6JvMXDL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="s6JvMXDL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9963640AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751403474; bh=TgRHmnD9p/dcTjvHMT/O3rjBTcvebrZIoBEnST2G+eA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s6JvMXDLKphB81ffbri4jUyYW+0wVO+BNDqKLFdSrpS9dcflyzCA9/yexj9yzRicu
	 YX97yJHC20rKbYRrk9Ia9t3qi/JECcgCbNEtUINxSIVMvs+oZEB0U5SjLa5IZIXfuz
	 ZdcTy1em6hOVB6KcUeWF6E5Rro4BjQIfAk+3G9Ldb47g6UUUlCd4LzzIALnNAtMxgl
	 4DDQ4uVeeR6Ix8rmqckY2Be1GndvtQzJtNZlZqMwfNsGGgQo2Iugxrkw6HCjaPclfQ
	 EjmlLTFVRTXaDbfpw247V2Kcdja0+PCW/apora88+gty0ExG5Tq+RSR7WWndqLezOK
	 5UmehBkje5h0Q==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 9963640AD8;
	Tue,  1 Jul 2025 20:57:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 7/7] docs: kdoc: pretty up dump_enum()
Date: Tue,  1 Jul 2025 14:57:30 -0600
Message-ID: <20250701205730.146687-8-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701205730.146687-1-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some comments to dump_enum to help the next person who has to figure
out what it is actually doing.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 39 +++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index d5ef3ce87438..50e25cf62863 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -860,39 +860,48 @@ class KernelDoc:
         # Strip #define macros inside enums
         proto = KernRe(r'#\s*((define|ifdef|if)\s+|endif)[^;]*;', flags=re.S).sub('', proto)
 
-        members = None
-        declaration_name = None
-
+        #
+        # Parse out the name and members of the enum.  Typedef form first.
+        #
         r = KernRe(r'typedef\s+enum\s*\{(.*)\}\s*(\w*)\s*;')
         if r.search(proto):
             declaration_name = r.group(2)
             members = r.group(1).rstrip()
+        #
+        # Failing that, look for a straight enum
+        #
         else:
             r = KernRe(r'enum\s+(\w*)\s*\{(.*)\}')
             if r.match(proto):
                 declaration_name = r.group(1)
                 members = r.group(2).rstrip()
-
-        if not members:
-            self.emit_msg(ln, f"{proto}: error: Cannot parse enum!")
-            return
-
+        #
+        # OK, this isn't going to work.
+        #
+	    else:
+                self.emit_msg(ln, f"{proto}: error: Cannot parse enum!")
+                return
+        #
+        # Make sure we found what we were expecting.
+        #
         if self.entry.identifier != declaration_name:
             if self.entry.identifier == "":
                 self.emit_msg(ln,
                               f"{proto}: wrong kernel-doc identifier on prototype")
             else:
                 self.emit_msg(ln,
-                              f"expecting prototype for enum {self.entry.identifier}. Prototype was for enum {declaration_name} instead")
+                              f"expecting prototype for enum {self.entry.identifier}. "
+                              f"Prototype was for enum {declaration_name} instead")
             return
 
         if not declaration_name:
             declaration_name = "(anonymous)"
-
+        #
+        # Parse out the name of each enum member, and verify that we
+        # have a description for it.
+        #
         member_set = set()
-
-        members = KernRe(r'\([^;]*?[\)]').sub('', members)
-
+        members = KernRe(r'\([^;)]*\)').sub('', members)
         for arg in members.split(','):
             if not arg:
                 continue
@@ -903,7 +912,9 @@ class KernelDoc:
                 self.emit_msg(ln,
                               f"Enum value '{arg}' not described in enum '{declaration_name}'")
             member_set.add(arg)
-
+        #
+        # Ensure that every described member actually exists in the enum.
+        #
         for k in self.entry.parameterdescs:
             if k not in member_set:
                 self.emit_msg(ln,
-- 
2.49.0

