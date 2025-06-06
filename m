Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEBE1AF0BB;
	Fri,  6 Jun 2025 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227705; cv=none; b=CgFmMNb3eTU3hUX0MIiraB+T15i7H/8IAcr0GYrf5QYo754lp6npGa8/xRjFptOF59yFkIdTR6PPC9Voffu9skMe+0M1D9E0kGPORZPRCDe+/kvpbI4l80UndXLtuYstFpXggdxb+PgdhvdB1UNOBOgn3iwPEUfEpHuvJfqpCew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227705; c=relaxed/simple;
	bh=Um9pM2nXDiSXswpE90hcGGnYUVXZYH1viBvOkrbdVA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzWuq8X7aK+0KQIREJ674frF6OQ7BZPmeqOlAerNKuESI2rOiuJ/P3efxp2f/L7kFUAkCuYaxIEDtLv6/6TC/lu7cVkqH+WCQkLuvew/KpL7Zq0EbuHMW90s17Ii0OjvM9hwdd+3ldDGSmwZsgFSI4/BllpTLAM4x++udnQO9JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sCODYiV0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sCODYiV0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A26FA41F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227699; bh=4khnDW8MrCmFNE79Kpf84iddwLSk1w/z1mOKhjlwzco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sCODYiV0TS26n2wdWWkhBUPfuYD8NibjvkKpPLYgFVhwlkRojEUylj04MYg/FkO6h
	 eyakvAPALUt4paOcKAteTYc1TmKrupJEZwm9ofBtu4eXELgd3greKwK1JUYmCy2SoO
	 ZjfqpSojLMqOq0HZJMq9q0+W7pjS4mJ+2qwhV/RXpcgw9/edu0Qd54UgThHMLhHmjD
	 TpII050409HXOgZlnJdA69XJPzT6NY1Fkl4QZTqRvjz82DUQ5+rHwMZqIwqcDpgh0V
	 ir1H8N5P4WEMfafIzrE9ULQncd/eedvaJklPmgsAZ+Zh6qjfnmibwmsskITDZU+YSV
	 c0Y+wWjVynopg==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id A26FA41F31;
	Fri,  6 Jun 2025 16:34:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 7/9] docs: kdoc: remove some ineffective code
Date: Fri,  6 Jun 2025 10:34:36 -0600
Message-ID: <20250606163438.229916-8-corbet@lwn.net>
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

The code testing for a pointer declaration in process_name() has no actual
effect on subsequent actions; remove it.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 7c635000f3de..4e1ab28ff7cc 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1229,11 +1229,6 @@ class KernelDoc:
             parenthesis = r"(?:\(\w*\))?"   # optional parenthesis on function
             decl_end = r"(?:[-:].*)"         # end of the name part
 
-            # test for pointer declaration type, foo * bar() - desc
-            r = KernRe(fr"^{decl_start}([\w\s]+?){parenthesis}?\s*{decl_end}?$")
-            if r.search(line):
-                self.entry.identifier = r.group(1)
-
             # Test for data declaration
             r = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)")
             r2 = KernRe(fr"^{decl_start}{fn_type}(?:define\s+)?(\w+)\s*{parenthesis}\s*{decl_end}?$")
-- 
2.49.0

