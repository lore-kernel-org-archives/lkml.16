Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE32EBB90;
	Fri, 27 Jun 2025 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049616; cv=none; b=PsnJJek/NYZ3pOyWPsydnq+QSNi6DlR6frN4TO1szRT1zrfqRPGIkPm5Aqqhijmi/wRo1/dfU6nIozd6TItMVqHzzcvPeI9jmvk5TfKG4F1DjQod4KrYO8I39lsO0CBZ4RlwnNO0RawDGxqgcvoTqIiJpFcQX9tQ7bvDra5bfq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049616; c=relaxed/simple;
	bh=pbTF8bWpQRIFU6pO/uLF4J0QqHJWJE0ey+E9TAEOZeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Blejh3O2/SNe6cq0yHsurROP6kdsosfvw/9uqHgrDCP88f2HePwILSL57PcBKux8ZL+MR8HH7fbu3HPypfxs/UUvEg7hOH6suTZ1mreWO9zbVQxk+CBS6RbgUqBL2TgiZP5v/OajjuVlKjA1fegpRRQifp3iiPo25phQHUHgLD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=phxri4Q2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="phxri4Q2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1AAE940AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049614; bh=+l9g5bY3dWXc9W6dNNeUJ1deRLttqcB8g4R7VVUZs2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=phxri4Q2D4KbcItlhTI5Q6H93CqoPf7t2m+idY6VQAt0fh/rRIm9bT/4cL9AK2roy
	 7/9ec5+QAv+pJVlSutvs5ASxi+qjFHo9z82RHtjju0vJj+6ydPr05jboxXoILpzX+H
	 Sxc/vwZdbHb1FF0gX7ROkJ+WVVMc7HNIN3HhVHBFWwgFlxtf7fo5nOCr2PhBlZrCKX
	 teF1OlM3ljjbyPPN0jkw1+LKzlEj89Y0UlNQ/o/qtPOYBPFLPNnyBTtLjgmdeQpFa+
	 ufftzP7Ywi9vE9dgJ3TlWo62X6ZKjjnVV6yS6XHG3xb+ahv5HNHA1XWE6T35UiwKOY
	 I7YAHIIhi0Hdw==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id 1AAE940AD2;
	Fri, 27 Jun 2025 18:40:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/8] docs: kdoc: remove KernelEntry::in_doc_sect
Date: Fri, 27 Jun 2025 12:39:53 -0600
Message-ID: <20250627184000.132291-2-corbet@lwn.net>
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

This field is not used for anything, just get rid of it.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 3557c512c85a..f3970ffbf402 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -151,8 +151,6 @@ class KernelEntry:
 
         # State flags
         self.brcount = 0
-
-        self.in_doc_sect = False
         self.declaration_start_line = ln + 1
 
     # TODO: rename to emit_message after removal of kernel-doc.pl
@@ -1227,7 +1225,6 @@ class KernelDoc:
 
         # start a new entry
         self.reset_state(ln)
-        self.entry.in_doc_sect = False
 
         # next line is always the function name
         self.state = state.NAME
@@ -1315,7 +1312,6 @@ class KernelDoc:
     #
     def is_new_section(self, ln, line):
         if doc_sect.search(line):
-            self.entry.in_doc_sect = True
             self.state = state.BODY
             #
             # Pick out the name of our new section, tweaking it if need be.
-- 
2.49.0

