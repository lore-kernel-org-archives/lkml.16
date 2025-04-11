Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E665429AAF9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350154; cv=none; b=OtLjbxECkKirPNRX1NpCuL3QuZvUeDI9i3QIwqjALQg9mWuyw0mYBO3bGQbGAoWmf6d20E25UUpjEJAAZ4Tu8Lf0lcZSkpFTaxIt3ZykieENHLanZE/lzidKHSNL+p+RgVu98IKFUEvqdfPojfn4nOjDr8SzX8N8JC5TLFxFsro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350154; c=relaxed/simple;
	bh=q1y1UU8TtQ+UI5bgfeVUW4m4YLJuEiZphDRwAd5ABZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3lIIqu9Wwqm5vnQnkcsXiWmecFXehyMTGyaRs/kvKVR62lB5sLSFa6ACPl8TthufwNrzBYKiiL/zS06v46jakJ2U1ltcqxcM6i3BqCI8cgdBKzdIuxEJfSV2ZgkdeHzcBYOSIW/UN129PbkGenWp/uVA36y9qoj4L1MmA93r9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyrgE0Qx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyrgE0Qx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D33EC4CEE2;
	Fri, 11 Apr 2025 05:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350153;
	bh=q1y1UU8TtQ+UI5bgfeVUW4m4YLJuEiZphDRwAd5ABZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyrgE0QxM/V0Wh0hopGfOI7aKzNm5tumHlayL8UPp7LxaMdkbF+8W6vNng/PntyX6
	 ZhPujfX0C/8zH0jJVM31VMMjWXpUrZfDXsMEX945uazMtp9oJlIHvpMREy3v7R4XMh
	 O+r1UYgrJAJdN9VfjKuNBR7Q/cY0tNqKPh4mN0BrD3CGRdINFlZAWyV4m6bh5kX+U4
	 Wx+CeuxbX/S175YqOdgyJAN7J0KHWMnreswpeoXSkHcU3vezZlWcllNR84mreUbVHU
	 YIm9TKJ1325TXg828WmstJQ9JUrq12Gk4+YDw3SzXJWUHMZXZVnqFAX8zQaGXDyIYy
	 7YyABrCDAUMmQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 34/53] x86/alternatives: Rename 'int3_refs' to 'text_poke_array_refs'
Date: Fri, 11 Apr 2025 07:40:46 +0200
Message-ID: <20250411054105.2341982-35-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it clear that these reference counts lock access
to text_poke_array.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index f5db49434020..08ac3c7ad6f8 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2473,11 +2473,11 @@ static struct smp_text_poke_array {
 	struct smp_text_poke_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
 } text_poke_array;
 
-static DEFINE_PER_CPU(atomic_t, int3_refs);
+static DEFINE_PER_CPU(atomic_t, text_poke_array_refs);
 
 static __always_inline bool try_get_text_poke_array(void)
 {
-	atomic_t *refs = this_cpu_ptr(&int3_refs);
+	atomic_t *refs = this_cpu_ptr(&text_poke_array_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
 		return false;
@@ -2487,7 +2487,7 @@ static __always_inline bool try_get_text_poke_array(void)
 
 static __always_inline void put_text_poke_array(void)
 {
-	atomic_t *refs = this_cpu_ptr(&int3_refs);
+	atomic_t *refs = this_cpu_ptr(&text_poke_array_refs);
 
 	smp_mb__before_atomic();
 	raw_atomic_dec(refs);
@@ -2522,9 +2522,9 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	 * Having observed our INT3 instruction, we now must observe
 	 * text_poke_array with non-zero refcount:
 	 *
-	 *	int3_refs = 1		INT3
+	 *	text_poke_array_refs = 1		INT3
 	 *	WMB			RMB
-	 *	write INT3		if (int3_refs != 0)
+	 *	write INT3		if (text_poke_array_refs != 0)
 	 */
 	smp_rmb();
 
@@ -2623,7 +2623,7 @@ static void smp_text_poke_batch_process(void)
 	 * ensure reading a non-zero refcount provides up to date text_poke_array data.
 	 */
 	for_each_possible_cpu(i)
-		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
+		atomic_set_release(per_cpu_ptr(&text_poke_array_refs, i), 1);
 
 	/*
 	 * Function tracing can enable thousands of places that need to be
@@ -2745,7 +2745,7 @@ static void smp_text_poke_batch_process(void)
 	 * unused.
 	 */
 	for_each_possible_cpu(i) {
-		atomic_t *refs = per_cpu_ptr(&int3_refs, i);
+		atomic_t *refs = per_cpu_ptr(&text_poke_array_refs, i);
 
 		if (unlikely(!atomic_dec_and_test(refs)))
 			atomic_cond_read_acquire(refs, !VAL);
-- 
2.45.2

