Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4E176AA1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168463; cv=none; b=aBwCCsDlIwQwwO6JfHaakmbjL5EUDQ5Tw9LZzofMjsLsWssZpaYPB0txPuIpozKvjuhPpTe3zV78F3m1uLihk/Yyr8b0sGlPmIaxb15uNO0MgbbL7OUnUWyBBMLMiSivXPBoK4iOID6B17UHUzrw20JakZ7M3ur6jPpm5wK4xik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168463; c=relaxed/simple;
	bh=GE8HeLZucU92UNsXstVw9MZxxtj1Yl1kqraUQSeAw60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRNDbwPYxsW+X7iu3SVh6HFl1ZO58xTcMmNSST4K3yHGb/umkaHfoDbKHM5OGy3xbSmlYecfoGg+Pg8GBAqRM/adFt27c+4/793YQ4HXnk+BCjai+Q3kYYsuD9+5cOQ12RLrExy/qVUaxxxMguq2rZk+YWzfX3b9Ig7sG9AcWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9ybskcl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9ybskcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE69C4CEEB;
	Fri, 28 Mar 2025 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168462;
	bh=GE8HeLZucU92UNsXstVw9MZxxtj1Yl1kqraUQSeAw60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C9ybskclZ7nuDJVEH9lzo5+5sZDBuhUkjBO2DFVWVMPH9ht5rfuwkzCsfdIyhQUE5
	 9B4YYo/QofLy1myGdQItfygmqh3Se6tQ1F0pn471BpKAJmXboiHkTFOVBPtiWKllYf
	 85LYbkQumqb19FDYd1BYSNIUt4xHS/XqdqwcGnN8A2V+EeQPXwaI+Tba9n8o0Aku6A
	 tu2R8jMGoMx/3SRa8le43aTaGY8mburu63NLE0dDLOZHpuhOAisrgpsLB9qBw18Ntd
	 HvtJPmR9qOvaQKkbpY7+5Y2Tj808AqFzwJOEQslR46cQZREJ+cg0U4tIgqFnNB0ju3
	 DXokTCfcEWx8g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 08/49] x86/alternatives: Rename 'bp_desc' to 'int3_desc'
Date: Fri, 28 Mar 2025 14:26:23 +0100
Message-ID: <20250328132704.1901674-9-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index e26fa6d9f133..4aa407af8648 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2478,7 +2478,7 @@ struct int3_patching_desc {
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static struct int3_patching_desc bp_desc;
+static struct int3_patching_desc int3_desc;
 
 static __always_inline
 struct int3_patching_desc *try_get_desc(void)
@@ -2488,7 +2488,7 @@ struct int3_patching_desc *try_get_desc(void)
 	if (!raw_atomic_inc_not_zero(refs))
 		return NULL;
 
-	return &bp_desc;
+	return &int3_desc;
 }
 
 static __always_inline void put_desc(void)
@@ -2527,7 +2527,7 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 
 	/*
 	 * Having observed our INT3 instruction, we now must observe
-	 * bp_desc with non-zero refcount:
+	 * int3_desc with non-zero refcount:
 	 *
 	 *	int3_refs = 1		INT3
 	 *	WMB			RMB
@@ -2630,12 +2630,12 @@ static void smp_text_poke_batch_process(struct text_poke_loc *tp, unsigned int n
 
 	lockdep_assert_held(&text_mutex);
 
-	bp_desc.vec = tp;
-	bp_desc.nr_entries = nr_entries;
+	int3_desc.vec = tp;
+	int3_desc.nr_entries = nr_entries;
 
 	/*
 	 * Corresponds to the implicit memory barrier in try_get_desc() to
-	 * ensure reading a non-zero refcount provides up to date bp_desc data.
+	 * ensure reading a non-zero refcount provides up to date int3_desc data.
 	 */
 	for_each_possible_cpu(i)
 		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
-- 
2.45.2

