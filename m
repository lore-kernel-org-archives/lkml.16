Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B94A23816C;
	Wed,  2 Jul 2025 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496361; cv=none; b=QW/PvrVi30wVwIfLcFp/OnBTJMGVvsw/5ioHsJH9st8YRBhprsneXs8xbuC4xFx2xA1RosvQe4ch5qH6HmGjvNHCV/JmmuIh3JPf3f0hN49GuJ23s5kHfHPaREa+f+nxBzsPBG0jRmufgpkDOTx+LzbPVY3nebQ+7J/evYiAvk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496361; c=relaxed/simple;
	bh=tuDS38+GKl5NVHGmUoBUyqbu3jZh3liAY+AHjAkbge4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDcTC5uP0kphsS7aNz7vQH+aXHgbvW0ROsy/mZ+9xw+Ee8nemmZkL6AXIbTP6/uyhgKZy0zFyDNmBttY6IyM6vuKKzhtaulwRwfyhZVySYAPPmiw8RvH7bsEkVi0K5y2ss8BLJgTHA6FJNHiuWOeLBGIvFy1UevT/OvDf+p/JB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZdnpZRA/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZdnpZRA/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3009E40AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495759; bh=Iq2JARkM+RTDRXRbavedGNDVAipMfDGwc1dnxtU86WA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZdnpZRA/bAj/Df5gdwTgA2fjeDTEGW3GnjAhHzXVo/mfH1/j9vt8zDndoSgc1Lymc
	 zUT9bUIsRbD5Pcghb8Fnsxt4m+j/xDxn1oqkFYCIv8WJCBEijpz4MJrVkVcfpFhXtT
	 ObdKVTA/bpnB4c1llnp/UBvghTv0jDIY0Y2dnFIj4LRvJk+tMlnzIuCoe2sow87gJ6
	 9wbbsqYIL6Mr8sKs9667jrnz6++s//qfljm4v+H83gTvPRpCf13cNLc1QKVUjJR6FJ
	 qJRhNTlsd48+skhbxGwg7WSHhNwMGdXaKXqkF6jJU2yAOTWxK9OYgd9G+sGAbG/kAP
	 gTQ2/SpkiHY9A==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 3009E40AAB;
	Wed,  2 Jul 2025 22:35:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 01/12] docs: kdoc; Add a rudimentary class to represent output items
Date: Wed,  2 Jul 2025 16:35:13 -0600
Message-ID: <20250702223524.231794-2-corbet@lwn.net>
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

This class is intended to replace the unstructured dict used to accumulate
an entry to pass to an output module.  For now, it remains unstructured,
but it works well enough that the output classes don't notice the
difference.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_item.py   | 26 ++++++++++++++++++++++++++
 scripts/lib/kdoc/kdoc_parser.py | 30 +++++++++---------------------
 2 files changed, 35 insertions(+), 21 deletions(-)
 create mode 100644 scripts/lib/kdoc/kdoc_item.py

diff --git a/scripts/lib/kdoc/kdoc_item.py b/scripts/lib/kdoc/kdoc_item.py
new file mode 100644
index 000000000000..add2cc772fec
--- /dev/null
+++ b/scripts/lib/kdoc/kdoc_item.py
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# A class that will, eventually, encapsulate all of the parsed data that we
+# then pass into the output modules.
+#
+
+class KdocItem:
+    def __init__(self, name, type, start_line, **other_stuff):
+        self.name = name
+        self.type = type
+        self.declaration_start_line = start_line
+        #
+        # Just save everything else into our own dict so that the output
+        # side can grab it directly as before.  As we move things into more
+        # structured data, this will, hopefully, fade away.
+        #
+        self.other_stuff = other_stuff
+
+    def get(self, key, default = None):
+        ret = self.other_stuff.get(key, default)
+        if ret == default:
+            return self.__dict__.get(key, default)
+        return ret
+
+    def __getitem__(self, key):
+        return self.get(key)
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 831f061f61b8..a5a59b97a444 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -16,7 +16,7 @@ import re
 from pprint import pformat
 
 from kdoc_re import NestedMatch, KernRe
-
+from kdoc_item import KdocItem
 
 #
 # Regular expressions used to parse kernel-doc markups at KernelDoc class.
@@ -271,32 +271,20 @@ class KernelDoc:
         The actual output and output filters will be handled elsewhere
         """
 
-        # The implementation here is different than the original kernel-doc:
-        # instead of checking for output filters or actually output anything,
-        # it just stores the declaration content at self.entries, as the
-        # output will happen on a separate class.
-        #
-        # For now, we're keeping the same name of the function just to make
-        # easier to compare the source code of both scripts
-
-        args["declaration_start_line"] = self.entry.declaration_start_line
-        args["type"] = dtype
-        args["warnings"] = self.entry.warnings
-
-        # TODO: use colletions.OrderedDict to remove sectionlist
+        item = KdocItem(name, dtype, self.entry.declaration_start_line, **args)
+        item.warnings = self.entry.warnings
 
-        sections = args.get('sections', {})
-        sectionlist = args.get('sectionlist', [])
+        sections = item.get('sections', {})
+        sectionlist = item.get('sectionlist', [])
 
         # Drop empty sections
         # TODO: improve empty sections logic to emit warnings
         for section in ["Description", "Return"]:
-            if section in sectionlist:
-                if not sections[section].rstrip():
-                    del sections[section]
-                    sectionlist.remove(section)
+            if section in sectionlist and not sections[section].rstrip():
+                del sections[section]
+                sectionlist.remove(section)
 
-        self.entries.append((name, args))
+        self.entries.append((name, item))
 
         self.config.log.debug("Output: %s:%s = %s", dtype, name, pformat(args))
 
-- 
2.49.0

