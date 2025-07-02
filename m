Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8979B24886A;
	Wed,  2 Jul 2025 22:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495769; cv=none; b=pVoxcJfiDMFtPDLh7/VBOl2jsW819WlHjh6ktlTXoGxgW1DnNkyZZaXrMQ55WiXJIqIz8FctluRHDUxziFZu2QElDNE9xx+4lPm29ef0EiUBTDcPZAqV9vrFZkaRftGaSIJ2CzLcNLaSaKhilW5ISkiYg8WJcujfkdcjeAQUpRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495769; c=relaxed/simple;
	bh=YwQmmM22mJD5uF6bQs9i5TfzwwX4HApOUYGTGeMFVIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oz3XfKHQywN7ok59bMFvB+s/Q4sc+wJbHh3gJtpOP5cV9B6EKwoRj5s22ehq5j7C5iePrvZu6Rb4QMW5FDcs83JMN2UL+bACZvl1Ig0XxUdBaTa2STzCd6E7mhV4Q+6WY28iBlaXmG3EZIAV8dCeAgD9zOoCLvBQNqNsGM8fVWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HNkt6a1e; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HNkt6a1e"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 91B0B40ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495764; bh=RT1pjY34zsbO6cT0rpZcZaAuDKckUPNC0BOielZL+3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HNkt6a1el2p4Cy0/fYnf2kL+gJE4punHq+xo16uU+yLQKR2Q61SqzFKrAwXDGXSBI
	 7/nvFZ5o6ZA86mvbVFpu04bXZU93hzdF8u/mBQ1Lh0vEIknD7b8dpA/seILqH4z+j9
	 bW/Rovu47J++dHUzHg+XoAD2CAsCkGhKo7sflDQB0+r5FEHzAoocWXEBVfENlzmRUQ
	 RhEZ7OOGlBD6WlyAGod7+BSvpeASeo1Hj/QByo+8DjAG8N1YFTcJsZmwGsxeHcXz6q
	 jWus+La1eC/nNVdPDRjZX0QFImytLw5H9bGnW9olVu/6qZX68sW1zWL1FWpHvnt04t
	 I9wmCVJaACVcQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 91B0B40ADB;
	Wed,  2 Jul 2025 22:36:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 09/12] docs: kdoc: straighten up dump_declaration()
Date: Wed,  2 Jul 2025 16:35:21 -0600
Message-ID: <20250702223524.231794-10-corbet@lwn.net>
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

Get rid of the excess "return" statements in dump_declaration(), along with
a line of never-executed dead code.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 6e35e508608b..7191fa94e17a 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -878,18 +878,13 @@ class KernelDoc:
 
         if self.entry.decl_type == "enum":
             self.dump_enum(ln, prototype)
-            return
-
-        if self.entry.decl_type == "typedef":
+        elif self.entry.decl_type == "typedef":
             self.dump_typedef(ln, prototype)
-            return
-
-        if self.entry.decl_type in ["union", "struct"]:
+        elif self.entry.decl_type in ["union", "struct"]:
             self.dump_struct(ln, prototype)
-            return
-
-        self.output_declaration(self.entry.decl_type, prototype,
-                                entry=self.entry)
+        else:
+            # This would be a bug
+            self.emit_message(ln, f'Unknown declaration type: {self.entry.decl_type}')
 
     def dump_function(self, ln, prototype):
         """
-- 
2.49.0

