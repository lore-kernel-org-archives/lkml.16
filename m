Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21962298C24
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310760; cv=none; b=OfK3B6MjDRIG9NL57hwVAXdc/5oCLajiduow7dMpZGlG1jaETaglPK7TSUWLIo78cx/K4E0WdkGQd3Zrm+ocF81WnR7fIh4/Gc5uksv+LDGQ+GDVikMyYUwTnOcJ04/jiVUxd0k1CSHFvjvX9UjTXeNnJw3SvXsUUitz8pIuqRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310760; c=relaxed/simple;
	bh=PkxFxlS2ufBqBcCmqi1+E4bmWxFN2KmJBbEKLEdB5CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2U5piu/PhPN3ULSS1mPMa5es0dzlAOZFkA/mxdItQ1/JMl9YAVLB14gnja+/Ev8kZaG9DIbcKc3XpepDxsCyvCURI2S3+SINkuLTjEuK2FinQKen1AHhqWeUvqXgvj7HB9XnnD/Ou9VctRZ/cSmGZ+NwyBNEdKU6IKGR77ULvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA6HRVsd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA6HRVsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F28C4CEED;
	Thu, 15 May 2025 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310759;
	bh=PkxFxlS2ufBqBcCmqi1+E4bmWxFN2KmJBbEKLEdB5CE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UA6HRVsdE7xAJH5aNceAFHGRdupWaIU6tBLXi7RyRIf/YlZ4nLhwsRt5rIXYCaZMk
	 Jlda4RtjlU5fLMGU3Xja+5/dGvbhV6F4tvQc/9CSfquTf269kRML7hYGZFffv/wFh3
	 S7tDcHKUfsSHrtFmPsCj0r+iNmCexAAA0N4UQHtiBqcJGJVFIUOw0v8+emWj64RXg9
	 UW//NKUvP/bC65OF5dsAHxQlS0QtFkkywXb6dejFH/rAXzdDCFGzPGWKkGjxmLG9f9
	 EglCnQEBJJYIwV865rPyil/e/PlNR9+JPj6h0bUBBvE44YOIyEra7w+jo1Y1+uho8n
	 2m9X0PLe3L7Ww==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 01/32] x86/boot/e820: Remove inverted boolean logic from the e820_nomerge() function name, rename it to e820_type_mergeable()
Date: Thu, 15 May 2025 14:05:17 +0200
Message-ID: <20250515120549.2820541-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's a bad practice to put inverted logic into function names,
flip it back and rename it to e820_type_mergeable().

Add/update a few comments about this function while at it.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 9920122018a0..b95f0519a877 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -304,18 +304,22 @@ static int __init cpcompare(const void *a, const void *b)
 	return (ap->addr != ap->entry->addr) - (bp->addr != bp->entry->addr);
 }
 
-static bool e820_nomerge(enum e820_type type)
+/*
+ * Can two consecutive E820 entries of this same E820 type be merged?
+ */
+static bool e820_type_mergeable(enum e820_type type)
 {
 	/*
 	 * These types may indicate distinct platform ranges aligned to
-	 * numa node, protection domain, performance domain, or other
+	 * NUMA node, protection domain, performance domain, or other
 	 * boundaries. Do not merge them.
 	 */
 	if (type == E820_TYPE_PRAM)
-		return true;
+		return false;
 	if (type == E820_TYPE_SOFT_RESERVED)
-		return true;
-	return false;
+		return false;
+
+	return true;
 }
 
 int __init e820__update_table(struct e820_table *table)
@@ -393,7 +397,7 @@ int __init e820__update_table(struct e820_table *table)
 		}
 
 		/* Continue building up new map based on this information: */
-		if (current_type != last_type || e820_nomerge(current_type)) {
+		if (current_type != last_type || !e820_type_mergeable(current_type)) {
 			if (last_type) {
 				new_entries[new_nr_entries].size = change_point[chg_idx]->addr - last_addr;
 				/* Move forward only if the new size was non-zero: */
-- 
2.45.2

