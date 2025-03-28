Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFFD221F0C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168509; cv=none; b=QdBSHa+rPyT9Uz9Kc7it4bKwIUFehe8l2EqmbdszVt7DoWN7yr5CVpZbuqRNrGtAqsz+o+Enp4/KRij9YXizUd30FPA5G6KNwK3S7T7VBhHy+5e1B1EzJn8sh938Nxr4puqhN0tCS5NnzPAaQ3iUOQLUFqi0l3LKpDN5KgmXtWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168509; c=relaxed/simple;
	bh=uAt6f5JWDsg7pV4F65Ak18vYpTNKpRpReb0TSAyEGpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baIQtHtjnxtbGSPuGinV4wwv+EIkmWes3EC/Z1kR8g4JcLwCb3Yzic4KICxTSjp6aEW56fe4b181J5mkeO1k8ht52O4L/j7eIyjfvGKIJokrPjBRApicdf3gFF18uh/OMjhTjieT4VmdVevwQ6u7h+p3wMuwm7kkepUek5eIkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paYM3fPl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paYM3fPl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC57C4CEEA;
	Fri, 28 Mar 2025 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168509;
	bh=uAt6f5JWDsg7pV4F65Ak18vYpTNKpRpReb0TSAyEGpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=paYM3fPlldYQGvV0fTzoQjKuWmPy6MkcYAHxAfpzCADzWQsT+qFRyccDmRqEqZTy/
	 kUf06w1oOM5vwUJ4WPy0QcVCNbfCaMcN7BTQT928KqceSVasY9FVWAQGaR4R3wjlIF
	 HQdivJrBey26vncGHHO2/TfJFBlvq/FvRfK+Qd64ESOPAuYTY6oQKzKnei7sclzSjW
	 bgtwfwNbJ1tYbhCJjFejfZLYhC4F/MHQ8Nk1WP/xLa048K4iIm6mp5eqJd1F1pjN4Q
	 dnm6hnpsRtDsefo3u+auFQM1gM8el7b0IL7YYfd48tzeKAQ95+VmhdMg5j0q5DO+6r
	 0Ek+LNltLsbaw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 27/49] x86/alternatives: Rename 'try_get_desc()' to 'try_get_text_poke_array()'
Date: Fri, 28 Mar 2025 14:26:42 +0100
Message-ID: <20250328132704.1901674-28-mingo@kernel.org>
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

This better reflects what the underlying code is doing,
there's no 'descriptor' indirection anymore.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 82808deb1501..26bb2a731208 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2476,7 +2476,7 @@ static struct smp_text_poke_array {
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
 static __always_inline
-struct smp_text_poke_array *try_get_desc(void)
+struct smp_text_poke_array *try_get_text_poke_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
@@ -2530,7 +2530,7 @@ noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 	 */
 	smp_rmb();
 
-	desc = try_get_desc();
+	desc = try_get_text_poke_array();
 	if (!desc)
 		return 0;
 
@@ -2627,7 +2627,7 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 	WARN_ON_ONCE(nr_entries != text_poke_array.nr_entries);
 
 	/*
-	 * Corresponds to the implicit memory barrier in try_get_desc() to
+	 * Corresponds to the implicit memory barrier in try_get_text_poke_array() to
 	 * ensure reading a non-zero refcount provides up to date text_poke_array data.
 	 */
 	for_each_possible_cpu(i)
-- 
2.45.2

