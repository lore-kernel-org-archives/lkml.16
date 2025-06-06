Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60E2853F6;
	Fri,  6 Jun 2025 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227705; cv=none; b=sboC7ubwH2OIZrZXejwoyhS3xOsKmroRRmuGJ9PXqJq01TgsvQYDko5UbLoSX6ePTfxzQb7SVWm85QSN9it4fPxEP/vYLIXB/yUFSNhq681dlwxVLRtv3QZGzAVhSjrnakHE4StdxEJs9zk25Gu69GmT5YZbAr2U8dTsSEFI+tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227705; c=relaxed/simple;
	bh=Xk9ajLZGYrjC8GxOtF2H673cXwx3Vc4L5ZswNgZDV3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdAVBbzxqu1EcdiuAhmFuVMIGNlYbfzTzRNcUHzvfT6cOA98mugXNqeguRXhuwjLYN0ge00xhbMxDmVGAV2WyVvNWXXkn0hWwnJLyyeIkw4mlFKWDHfkheYB9/G3pTk47IbQEHrNKeI1eWf25XFHFQ5rQ/QkhshtPj5rjngMoKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=H1xF6vEh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="H1xF6vEh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1433541F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227696; bh=k4wWLzw3KH5+stcNScMYwU5UgcBq+X0OjHCe0oISl2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H1xF6vEhKkve9MVXtJu94HsbQIumFIoSU2FEcFb5iXjDA00SutPir3hSzpQ6ZeRrz
	 535yNLQZSTBMCqiJ2/cWmea/zXQWVIV2hSu7A4Q3UJvYKq/UW3zur2Z/Mh5V3OzFXs
	 04pihMcrB1Ha15T41MbLf76NNeQMPxrPc0QxKf8VBdbwdL09SYw12xbXMK0GVfhhDI
	 dKJv6s22LQPyqnfbQy1LTW5WEtpbhESv+9EfUh5ZujGrFKC0QwoEMDlc9mgasj8+gJ
	 kMd70nrQ1mvtz1RQspFSLiNknjSoOzkrY0QiTZCN4+KaRX+X0NtUzJyeGtbmelvjSC
	 2jobPetci4UIw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 1433541F26;
	Fri,  6 Jun 2025 16:34:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/9] docs: kdoc: move the core dispatch into a state table
Date: Fri,  6 Jun 2025 10:34:31 -0600
Message-ID: <20250606163438.229916-3-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606163438.229916-1-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since all of the handlers already nicely have the same prototype, put them
into a table and call them from there and take out the extended
if-then-else series.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index b193cf9dc0d1..37b7e501af7c 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1670,6 +1670,21 @@ class KernelDoc:
 
         return export_table
 
+    #
+    # The state/action table telling us which function to invoke in
+    # each state.
+    #
+    state_actions = {
+        state.NORMAL:			process_normal,
+        state.NAME:			process_name,
+        state.BODY:			process_body,
+        state.BODY_MAYBE:		process_body,
+        state.BODY_WITH_BLANK_LINE:	process_body,
+        state.INLINE:			process_inline,
+        state.PROTO:			process_proto,
+        state.DOCBLOCK:			process_docblock,
+        }
+
     def parse_kdoc(self):
         """
         Open and process each line of a C source file.
@@ -1721,19 +1736,8 @@ class KernelDoc:
                     self.process_export(export_table, line)
 
                     # Hand this line to the appropriate state handler
-                    if self.state == state.NORMAL:
-                        self.process_normal(ln, line)
-                    elif self.state == state.NAME:
-                        self.process_name(ln, line)
-                    elif self.state in [state.BODY, state.BODY_MAYBE,
-                                        state.BODY_WITH_BLANK_LINE]:
-                        self.process_body(ln, line)
-                    elif self.state == state.INLINE:  # scanning for inline parameters
-                        self.process_inline(ln, line)
-                    elif self.state == state.PROTO:
-                        self.process_proto(ln, line)
-                    elif self.state == state.DOCBLOCK:
-                        self.process_docblock(ln, line)
+                    self.state_actions[self.state](self, ln, line)
+
         except OSError:
             self.config.log.error(f"Error: Cannot open file {self.fname}")
 
-- 
2.49.0

