Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BAF28EA52
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350127; cv=none; b=ubxMSwNx81pgJNcys825XPq391OnmbSx1n/rKqAaGO48qG4HJwt+cME/E8btHl9mPnbEO+CPGTbTfLpXQQhFyQ3wdtJKY/DYc3dt6dVDxYKT9VxOJnSuDv0wJgrhCVG1mRUcihmNeDLohm1ZoCjlVoK/BIi0fCZrmjJD9Gd2MpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350127; c=relaxed/simple;
	bh=A4zDuD9kFmef8lAoqWp7mMMwFBvTb+YDoARFkhayZF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGW2FHeKHe+JwFZ6+WUTaEcl6FTWsC9LCar1mw7OOdTGbeTmvVMCcR3AffiGSshOVQYCEZh4LQTx3rSa3TUyoZ2Zlxxag75olHj5hVQPjMVldJUS5BQcdYROTafv/xxl9bHMBvPdMNjlDsMTW2EpDIF5owTR6FLHCuuoq2tThks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBWuqb1L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBWuqb1L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB98C4CEE9;
	Fri, 11 Apr 2025 05:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350127;
	bh=A4zDuD9kFmef8lAoqWp7mMMwFBvTb+YDoARFkhayZF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jBWuqb1LuX6PLdUWfBWcP4aHDS6ER7p1qybbq7IF9L5HdVlepfhxlRL/K/g5Uqnu2
	 NwgpSmM7V7YJgjSxoPfMtHDoKaA66lk+00HFH9lA2ytlxj/gUuOE+YBj8vvPXx+Cyg
	 2f/A2e9qq8Z9IDZE/4lOAuql8UY7PSOcz7cWru5HyBMhOnoPYF/uQ/sH3AZl2vdDja
	 lf9O8EdhTVFnr3R2FA/JQd9c8bQzB3AXWaNW4yn+mvTe6KCAfAYGEDsOU3gp2fMdrl
	 OhL/VaI8kbiib5k0NtDgi7Duz/X95+TIOChJna3TH3RL+HxYP+5nfytDeuVSjlgPEN
	 bwzBhR8BbTrrQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 23/53] x86/alternatives: Remove the 'addr == NULL means forced-flush' hack from smp_text_poke_batch_finish()/smp_text_poke_batch_flush()/text_poke_addr_ordered()
Date: Fri, 11 Apr 2025 07:40:35 +0200
Message-ID: <20250411054105.2341982-24-mingo@kernel.org>
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

There's this weird hack used by smp_text_poke_batch_finish() to indicate
a 'forced flush':

	smp_text_poke_batch_flush(NULL);

Just open-code the vector-flush in a straightforward fashion:

	smp_text_poke_batch_process(tp_vec, tp_vec_nr);
	tp_vec_nr = 0;

And get rid of !addr hack from text_poke_addr_ordered().

Leave a WARN_ON_ONCE(), just in case some external code learned
to rely on this behavior.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index c9fd31d512b0..d4eb20aa8d7c 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2845,12 +2845,11 @@ static bool text_poke_addr_ordered(void *addr)
 {
 	struct smp_text_poke_loc *tp;
 
+	WARN_ON_ONCE(!addr);
+
 	if (!tp_vec_nr)
 		return true;
 
-	if (!addr) /* force */
-		return false;
-
 	/*
 	 * If the last current entry's address is higher than the
 	 * new entry's address we'd like to add, then ordering
@@ -2864,6 +2863,14 @@ static bool text_poke_addr_ordered(void *addr)
 	return true;
 }
 
+void smp_text_poke_batch_finish(void)
+{
+	if (tp_vec_nr) {
+		smp_text_poke_batch_process(tp_vec, tp_vec_nr);
+		tp_vec_nr = 0;
+	}
+}
+
 static void smp_text_poke_batch_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
@@ -2874,11 +2881,6 @@ static void smp_text_poke_batch_flush(void *addr)
 	}
 }
 
-void smp_text_poke_batch_finish(void)
-{
-	smp_text_poke_batch_flush(NULL);
-}
-
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	struct smp_text_poke_loc *tp;
-- 
2.45.2

