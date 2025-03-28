Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F82D21E096
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168500; cv=none; b=A0ul5Md31qwZ0RnLoJuH5JDGQlsb11lyzEOBfDCOd1WrFl1oSYXVJnjgDWkymLWc2KapmRpxgSNTqqexwp3Z57Mgb84Q0otgEvcfXBwsI2fQeTnMoCQMEueYtRsrB2zwheqkcpOrX0oGk/KFILAX8Zys9vf3cXbFEV3avIR7qn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168500; c=relaxed/simple;
	bh=C4QxJVYUpLSEmHPMwaR93U0zu+QPPz4nEkMxWVyEGbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIZ/q+TycJV3KJkB9i0GnSUzGMKMtpqhu5thCediwRqlkAWx82ohtDP5vLqfaZz7NyoB763zvROobx+lK81pdSkJkG4FmcTHcub2lj+OW8a6ADZAP6iASqzQdrpxMwUF2rYrrcDq4IIIVVd1Fm+n4ltJC30CZavkMseANpEADUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJXbrO1e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJXbrO1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAA2C4CEE5;
	Fri, 28 Mar 2025 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168497;
	bh=C4QxJVYUpLSEmHPMwaR93U0zu+QPPz4nEkMxWVyEGbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GJXbrO1eJ8h5kvqaCyJa4ug7JXs03iYFNwsIwySr7BOT6Ea1Qv5hLB/fe/kKAdIqb
	 L1BzaSAd7ZXZBYY7TNFQ6mkVFFdLDdQICFzHMsVv/+zMSiqLElnsg4LmgYuQYctJF1
	 os8YkPXe8p7VYzVpo5mcksdWVuIVB4O7OWcc7PaQ0IJkqCSD82hF3JuBf+xRuUkY34
	 HMUmPnLvPb3Nk9Upd4ek9KHBPaeGrM8FGJBpjU7B/ulElrlbZMvjN7tXg3xDG24v6z
	 g7ksY2Pn84UQ4M8BYiCPMT4r44/dJqSvtwqIA1EObt2HhpTmuer3YZ+YBN3HvvRkMg
	 FyMjAhlvoHv4g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 22/49] x86/alternatives: Remove the 'addr == NULL means forced-flush' hack from smp_text_poke_batch_finish()/smp_text_poke_batch_flush()/text_poke_addr_ordered()
Date: Fri, 28 Mar 2025 14:26:37 +0100
Message-ID: <20250328132704.1901674-23-mingo@kernel.org>
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
index 66778dac257f..ffffec4597b7 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2847,12 +2847,11 @@ static bool text_poke_addr_ordered(void *addr)
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
@@ -2866,6 +2865,14 @@ static bool text_poke_addr_ordered(void *addr)
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
@@ -2876,11 +2883,6 @@ static void smp_text_poke_batch_flush(void *addr)
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

