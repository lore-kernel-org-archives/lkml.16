Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762741E9B2F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261572; cv=none; b=oKIj8zuLV3/jS+RuBgO8xWTuvZZ3wyWPdOLLU/fC/2VC3R8t3JO1A01K8b6Ze6WzKczi7d4NBHKge6IREXL2B1cQoRa14tnJNs+C97rvlDCrhpA1q+4y9GIQshx7duaoWgzA2B0+1TgFoDR4z1kQjyzd/Q4BSzOtPu0Am3kPnmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261572; c=relaxed/simple;
	bh=uDJaQQAXGZBIkVwCOP86cyQW8juas8BcKLCPtMEbZhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=koXUmAwEkx2SRi2QlrKY3FEmy8fXq60y39fOu/SgtheeKUFGcXNcvl+BybAxt98A6uJZTWtjYHUt4zv+uH15EQ7qEz6N10SePjIEqzHj7UaElItU5DQVWQEjmG/XoXkFPjrs3cEOdkYOV68wVYQ0+6cZ0qhLpQ6fyW5G2AbJ2GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1QU7zQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1QU7zQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA101C4CEEA;
	Mon, 21 Apr 2025 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261572;
	bh=uDJaQQAXGZBIkVwCOP86cyQW8juas8BcKLCPtMEbZhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1QU7zQ9ULkFoMJr5s1y9so7lT0iYsTHdcX1LBiZ1AdQ4+eUk0I9btU/QwJJ/R2DE
	 riFx1uZCPa/rDD2SnlEeSIWryjfzMixKRDgVIQu61oXSSEdJxPCPOtrvtVIStUWdeO
	 Jo89yspi0OggXU2R6diFacWStXz1ldRu+gMzxKt/3BGoURs0e2Wc0jQVJj2IM+ILpc
	 6QQmZLYftNU5fGXYlwtItXJH4q7G0hIg5LP/H4Z9OEaydCiFh009pRCqXYNmw4mIIX
	 eiXTkJ21Yvl8SoNJo9BcuHA6++2jSNt7kByHY/qEGi313q3C2zhZbO1m5tPaalcgoa
	 DmwVxP8krhOww==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
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
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 01/29] x86/boot/e820: Remove inverted boolean logic from the e820_nomerge() function name, rename it to e820_type_mergeable()
Date: Mon, 21 Apr 2025 20:51:41 +0200
Message-ID: <20250421185210.3372306-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
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
index 9d8dd8deb2a7..4a81f9e94137 100644
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

