Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD381F4C89
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108895; cv=none; b=r2hY4JgO85Dm3uJnvIG6eiV6uqYW2h1zEfLmSJwEkycMD4LrMPL5gHzZY3CJBGIZAbfOeljCb3XkfdfSSoGu8k78RV1jyjD5jJg3VYmPtnQS2Pu8zGFmMnU4snVD4coPQ+MNntLuOD5wcEjSjwI8KTNic+iM/sn9xSBoKZ1nWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108895; c=relaxed/simple;
	bh=8u0r22WAfYVwDqds3fWK7E47NzAdr3UN05v7fNA7zFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9yBthZeWItHkKsSNcjeeGYHJqXlQM6j026SIlfJar7xoH9yXzLgSyFFoNvBUSzraHDRffUY6nOaG0O1ae8qteXa4A4UrULgoBLJBb3WXF0/0dlWv6f+yOF82az0c2p5vK7/QW9hfMHtcfGTf8dTVXnfaTDtjPUJmm9XC12BhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ev95ktBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ev95ktBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33AAC4CEDD;
	Thu, 27 Mar 2025 20:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108895;
	bh=8u0r22WAfYVwDqds3fWK7E47NzAdr3UN05v7fNA7zFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ev95ktBbyRQIvMgep4vrl8HRXE1UMzTeYtjd/CPPwloZz4tOCksU+KseN5q1KMD64
	 EwjEM8OsQYM6ce8nY/5V7cfwDvHpfxTDoMH2AXDeL3/zuptjfjWwM0zJ4y7AYVli8U
	 /dHKEZduYeNHjdF6W9X9tcB4Sgv356+2ysvRBlYiSI7xkMUzIPHzF1mQ2FiRozPstP
	 J9XWr0pYYszgsEbk1yxRiUGlyMepC1U2xVMBx/lB1xvORaXfUJo/MojAx/w+oGS4Dx
	 LZG3cisj4ihYxbfWn3qQmtrjksO29opAK3Ah1Q9BShdcMVrtsi6zqM8VuJIx8RxdU/
	 ve3nvtiY0LGIA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 23/41] x86/alternatives: Remove the 'addr == NULL means forced-flush' hack from text_poke_int3_finish()/text_poke_int3_flush()/tp_addr_ordered()
Date: Thu, 27 Mar 2025 21:53:36 +0100
Message-ID: <20250327205355.378659-24-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's this weird hack used by text_poke_int3_finish() to indicate
a 'forced flush':

	text_poke_int3_flush(NULL);

Just open-code the vector-flush in a straightforward fashion:

	text_poke_int3_batch(tp_vec, tp_vec_nr);
	tp_vec_nr = 0;

And get rid of !addr hack from tp_addr_ordered().

Leave a WARN_ON_ONCE(), just in case some external code learned
to rely on this behavior.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 938e8e70a379..906fb45b9e65 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2847,12 +2847,11 @@ static bool tp_addr_ordered(void *addr)
 {
 	struct text_poke_int3_loc *tp;
 
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
@@ -2866,6 +2865,14 @@ static bool tp_addr_ordered(void *addr)
 	return true;
 }
 
+void text_poke_int3_finish(void)
+{
+	if (tp_vec_nr) {
+		text_poke_int3_batch(tp_vec, tp_vec_nr);
+		tp_vec_nr = 0;
+	}
+}
+
 static void text_poke_int3_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
@@ -2876,11 +2883,6 @@ static void text_poke_int3_flush(void *addr)
 	}
 }
 
-void text_poke_int3_finish(void)
-{
-	text_poke_int3_flush(NULL);
-}
-
 void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	struct text_poke_int3_loc *tp;
-- 
2.45.2

