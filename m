Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E72F3643;
	Thu,  3 Jul 2025 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568260; cv=none; b=IrJAVEEw+pe6EA4+oJZynzgBbKhEb4R4cY4pZbvu8YHaoPOWSkYNUjGD8W4fIdXNTwU+I2mYnLyySR065x21d1YbGs+ovJSvqCKK3q+NgOB3rkhCcDnXF57Iuwz72c03hXOGa04sHPCSEF3qWwBIjgS9mwpLU5LOOiQBpY1tPG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568260; c=relaxed/simple;
	bh=IMZMFq5TKXw6E1r4xYMXLNJHbW8hgZDnfa5GM11GXWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8rsbF2lEpMI2hpAWDL8EgTgUfGjFsIUGH5BVawIyfwqiOkG5myZox/3pfRlZlxWZv8VArRHHa/fx8Kocbh3get+jKvL4lnBONRBQs/WXScfGmxjMXEx/YK/4EiBvVHOBleAruIaaH0osh000y640EUQUHZkB0PG5s/d73sn+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Syq7rXHs; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Syq7rXHs"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 67B5440ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751568258; bh=YznuXaU2A2v6FfBG0rFTUZT8Xvml7SDQcFC8Z4GtlG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Syq7rXHsAiWJFxhJDz1oLOOVxUArpCqXQ0zA9CVbCnzDLgxriT3hDEPGYdyj0+ISm
	 8ALDYuMiMSJdAgKJynx7Kmt8c8sPYQnsAQoCg/y/j+BLvTUogCJcrZio/e4UDiVjGe
	 w1mFvcFA9RpRCGjR4YFRGZLsNBvYtChazH/SUiGBMfo/1gZuujWPEzSFltqaqPKPLK
	 wmiWRn8hjG4LUeFLa/UhIXaR/rOMfhB13RfZREHbT1K7+x+96V7LEOgRs0DathVhUA
	 YBN2IOWvswdrXVQ58oH0sCtXnImNfVOgI9FLSHyQi8JZeFJ3KVuJgevbhGGvBLo/+K
	 vVVFwyHlwvxIA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 67B5440ACB;
	Thu,  3 Jul 2025 18:44:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 7/7] docs: kdoc: pretty up dump_enum()
Date: Thu,  3 Jul 2025 12:44:03 -0600
Message-ID: <20250703184403.274408-8-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703184403.274408-1-corbet@lwn.net>
References: <20250703184403.274408-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some comments to dump_enum to help the next person who has to figure
out what it is actually doing.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 39 +++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index d5ef3ce87438..831f061f61b8 100644
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
+            else:
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

