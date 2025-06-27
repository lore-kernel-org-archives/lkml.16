Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F2C2ED15B;
	Fri, 27 Jun 2025 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049618; cv=none; b=h8CZnLSx9zZaxDFZVfue6gRQ1NmIvWGs3SrL8jFjxuVGQ54tQeQOvEYw+v4FeN7ppCZsfJY9eYSxzNP26hClHQujoDZEFSP7fjr3v1nhK87/WLpRbbzZ9iAHKNIxAaHD1hOXH5gDgFMwFZ4ruIlamNxCNuhBCLIfrvaDWLywXWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049618; c=relaxed/simple;
	bh=xZ1AjPAb5peoQ2/5X0OBEamGLpA0DWBnUXtAprtIgNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYZPbxXS0TMBLKtoNuIacynuvsqVgcZh2BB6reYEwy5kpPZ0nwOfziOIlWmEi3JqLDIChRYTwlLN00j0T5tKSH97AkmTPTN12MVLtttznhcMfCZ1gm4k1Lprm557qIim9eNb5YFTLi0tqdDzj1wBA0OHYpO05jG3KXEfzD68YdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rL7pGfkM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rL7pGfkM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5CEBF40AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049616; bh=cU1j40zTmEy13wFVQwU6r+Xhna53bFvCfqjstVBxj9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rL7pGfkML2l9C57A9KH/jD3e78kvdmBwezH7Dxd3cMIwkivrLOyvO9jEQQZ2lgSYG
	 3IBWpdZV8VOzIR7ztrp3adC9q8Kt0YjiJBNtQgSmpW7JfvIjR7kAuxh98Ofe+Vj6Ne
	 c1ODpYxDqU3WriH01f1kaeuI3x2aq78kFbaFMcZQdDaWd6wrFd92FYNSPJnv92r+hM
	 vE223z43DilqJEfYBHRNiO1zRMjkEMlI3VhdXcLQpibLQEH+ufQKQlaFIrugT+s1ZS
	 zVZP5KNO7zvHWfZpkvgqDX3/DPJV1zDx8v9WECyWw7WmkqxQN0erNCUNb3sbW2s+3O
	 W19FMSJTgdU+w==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id 5CEBF40AD6;
	Fri, 27 Jun 2025 18:40:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 5/8] docs: kdoc: rework process_export() slightly
Date: Fri, 27 Jun 2025 12:39:57 -0600
Message-ID: <20250627184000.132291-6-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627184000.132291-1-corbet@lwn.net>
References: <20250627184000.132291-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize process_export() to eliminate duplicated code, don't look for
exports in states where we don't expect them, and don't bother with normal
state-machine processing if an export declaration has been found.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 224dea5f7c2e..734b908579c3 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1211,16 +1211,17 @@ class KernelDoc:
 
         if export_symbol.search(line):
             symbol = export_symbol.group(2)
-            for suffix in suffixes:
-                symbol = symbol.removesuffix(suffix)
-            function_set.add(symbol)
-            return
-
-        if export_symbol_ns.search(line):
+        elif export_symbol_ns.search(line):
             symbol = export_symbol_ns.group(2)
-            for suffix in suffixes:
-                symbol = symbol.removesuffix(suffix)
-            function_set.add(symbol)
+        else:
+            return False
+        #
+        # Found an export, trim out any special suffixes
+        #
+        for suffix in suffixes:
+            symbol = symbol.removesuffix(suffix)
+        function_set.add(symbol)
+        return True
 
     def process_normal(self, ln, line):
         """
@@ -1767,13 +1768,10 @@ class KernelDoc:
                     # it was read twice. Here, we use the already-existing
                     # loop to parse exported symbols as well.
                     #
-                    # TODO: It should be noticed that not all states are
-                    # needed here. On a future cleanup, process export only
-                    # at the states that aren't handling comment markups.
-                    self.process_export(export_table, line)
-
-                    # Hand this line to the appropriate state handler
-                    self.state_actions[self.state](self, ln, line)
+                    if (self.state != state.NORMAL) or \
+                       not self.process_export(export_table, line):
+                        # Hand this line to the appropriate state handler
+                        self.state_actions[self.state](self, ln, line)
 
         except OSError:
             self.config.log.error(f"Error: Cannot open file {self.fname}")
-- 
2.49.0

