Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B7270EC3;
	Sat, 21 Jun 2025 20:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538132; cv=none; b=LzJH6Sef7Xi2spfZLEBLDk6BMP7qz46y8MAjyFEownVQdEZgp1GFAEdmz48zH43pUc0Igw2VO+NVNyccuQKexUiex2ASWQI7t7nIE1sYTmRDmqQHAQ0ytJnQk8kwjoF40uhgCOv/01aKQMyTg7GdeaWfoSOfndFEIWwPxBosN2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538132; c=relaxed/simple;
	bh=+tg+/selIsk1K4SgMwFprCsk6T3OcPFBih5+vmWXiG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YYr/7EQ0d0/4ghGTAK0M818g+TUiY82g+skfL9ajO6HPhBNjA8ms5hPLrBS6KZRYSD+5oDmqcDMURPVsigKuQpU1ellINRbMMbOUUCvTAVZo7MVsR99uaOhUl+SbV5ry57w9xU48sA+rL/KK2u0R3NrCZ629XR3J/6is8ZkmiSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Uktu6SBA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Uktu6SBA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E6C8F41AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538130; bh=JVMKs6c/9IMxrm7+AbKDFaW9ihwnMSixkjpZKCTY79I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uktu6SBAGTvlkdfQEahylKALHjr49IeEiEB6ooqSFtcmR8DomUdc0AK+jiE1u/EtY
	 0TCLIcRFlgJf6V4RMss2HvNBWgjXbi8ucUZSgTQQwepUDwGlx3jixjzjlI3EpRNrPe
	 5pal/FpGpkLxhDB27qH8Z5xlFb+N58tj7Uzdmz1ulZOPvdFmnG3zMrGel11pew1RXc
	 FFUBBKSLrf+MM2kkHCy27QrJ20I/GA076SOF6eHWLxT3Dh0Vge13zzVf/EIdFsvRL/
	 U6RPnSmWpsoqU2S8jxvAL4PoGP2ogk8uZq6UdrM0JmrGjn3RH9jbxyyUhatfEfqhTW
	 N9VnwfBcRuZsA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id E6C8F41AD8;
	Sat, 21 Jun 2025 20:35:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 5/9] docs: kdoc: coalesce the new-section handling
Date: Sat, 21 Jun 2025 14:35:08 -0600
Message-ID: <20250621203512.223189-6-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250621203512.223189-1-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the duplicated code back into a single implementation.  Code movement
only, no logic changes.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 49 +++++++++------------------------
 1 file changed, 13 insertions(+), 36 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 185ffe4e1469..a336d543e72b 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1310,10 +1310,10 @@ class KernelDoc:
         else:
             self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
 
-    def process_decl(self, ln, line):
-        """
-        STATE_DECLARATION: We've seen the beginning of a declaration
-        """
+    #
+    # Helper function to determine if a new section is being started.
+    #
+    def is_new_section(self, ln, line):
         if doc_sect.search(line):
             self.entry.in_doc_sect = True
             newsection = doc_sect.group(1)
@@ -1346,6 +1346,14 @@ class KernelDoc:
                 self.entry.contents += "\n"
 
             self.state = state.BODY
+            return True
+        return False
+
+    def process_decl(self, ln, line):
+        """
+        STATE_DECLARATION: We've seen the beginning of a declaration
+        """
+        if self.is_new_section(ln, line):
             return
 
         if doc_end.search(line):
@@ -1395,38 +1403,7 @@ class KernelDoc:
         """
         STATE_BODY: the bulk of a kerneldoc comment.
         """
-        if doc_sect.search(line):
-            self.entry.in_doc_sect = True
-            newsection = doc_sect.group(1)
-
-            if newsection.lower() in ["description", "context"]:
-                newsection = newsection.title()
-
-            # Special case: @return is a section, not a param description
-            if newsection.lower() in ["@return", "@returns",
-                                      "return", "returns"]:
-                newsection = "Return"
-
-            # Perl kernel-doc has a check here for contents before sections.
-            # the logic there is always false, as in_doc_sect variable is
-            # always true. So, just don't implement Wcontents_before_sections
-
-            # .title()
-            newcontents = doc_sect.group(2)
-            if not newcontents:
-                newcontents = ""
-
-            if self.entry.contents.strip("\n"):
-                self.dump_section()
-
-            self.entry.begin_section(ln, newsection)
-            self.entry.leading_space = None
-
-            self.entry.contents = newcontents.lstrip()
-            if self.entry.contents:
-                self.entry.contents += "\n"
-
-            self.state = state.BODY
+        if self.is_new_section(ln, line):
             return
 
         if doc_end.search(line):
-- 
2.49.0

