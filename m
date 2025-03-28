Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E001A264A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168539; cv=none; b=E8F+JJgAl99U8wuVkQkSXr1t4k5PnKfdmLo9YfzYhK0nY3d7kG8ek0ZX+EN+CxTCMERVJbD6mxxKTEe9Ch+yIFUXEmOe9EzGEA8L5nvXWey0iWOsYX6ilQ/qiWMRzUQl8ytJJHlI9poXUezwRwhDYSkr73UndIGMsr/uZmnvFvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168539; c=relaxed/simple;
	bh=C3C1rhpZSoOuLxMvz4zWWRzJI/0I8IitC6KQdEtD1BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OcmX36BmVoCA9m1Ae00qFCtYCjUdo4HKkhkiuyz+2fMDAan3NdFS5T4bbcCjxzhhH/iHFTbXtSdLnm/XRHVFCwZUXQvWruyTLfOf5vdDnNYfassfTvjeL8KZcbfvkfkp8VZ1W0+uxGJmm6uK+ib4dbXYeknv6zUsGG2X+fIXRHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swt76V96; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swt76V96"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4521C4CEE4;
	Fri, 28 Mar 2025 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168538;
	bh=C3C1rhpZSoOuLxMvz4zWWRzJI/0I8IitC6KQdEtD1BI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=swt76V96Pqa9xtEflZsHM7fnp87Z/tYNNrwRCcbohhGwBtTEZe07Lw11mzxdEJ6fV
	 5aph8rnBhp0khgFrvHaXFiuSHcrjyObaJ4lGZasLBkRjVxD8rUgrzAAU6YIgraqZZJ
	 pzZkVsXs9mFuf00ufiaoN3v6K6jTNUBAqdMlWEZ4Hd7QQ7A8u1TUGqKJPAsBZPziU4
	 cSTBJUR8PIsOKbRmrUpuINMGvvOh27DiYCXwvEPqdOGSuXinL6SgZzlzOgr4xxXm+E
	 i1eEqgZ00T5DVmpSYPHeA6z4qL5TS6hQRCTNTiYno4As4WPJ0agLz0U6gc8Zyd1l31
	 f0wmYR5ooqGOA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 39/49] x86/alternatives: Simplify text_poke_addr_ordered()
Date: Fri, 28 Mar 2025 14:26:54 +0100
Message-ID: <20250328132704.1901674-40-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - Use direct 'void *' pointer comparison, there's no
   need to force the type to 'unsigned long'.

 - Remove the 'tp' local variable indirection

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index b0bd8cd524c5..27f1c7bdd384 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2838,8 +2838,6 @@ static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len
  */
 static bool text_poke_addr_ordered(void *addr)
 {
-	struct smp_text_poke_loc *tp;
-
 	WARN_ON_ONCE(!addr);
 
 	if (!text_poke_array.nr_entries)
@@ -2851,8 +2849,7 @@ static bool text_poke_addr_ordered(void *addr)
 	 * is violated and we must first flush all pending patching
 	 * requests:
 	 */
-	tp = &text_poke_array.vec[text_poke_array.nr_entries-1];
-	if ((unsigned long)text_poke_addr(tp) > (unsigned long)addr)
+	if (text_poke_addr(text_poke_array.vec + text_poke_array.nr_entries-1) > addr)
 		return false;
 
 	return true;
-- 
2.45.2

