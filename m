Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CCE23372C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168558; cv=none; b=jHMjdU0gSSSCUIStOmRIixhc1PBS6rFBIWoEzDlVkM5w9l3vza1beXsvQyrlHLN7fdzvTfmtg12lWuPicDkagZ56SquhheAC/Pn85+MLPT/+nXpa7qlV3KtM2V1nfWYLRdpTo6Z2LgXdsHLorxH+7DMG/R+uGKtouSiTRsJMAv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168558; c=relaxed/simple;
	bh=RtQa43M5Chutv/Mu+hA4RGh+5vaibCz9hJlkWvXMbbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZFJzrscNENqSrNO3HHPKyLlmlYeWFzEkiUe+SYqrJYx0FWc/w1HIxyhjRNH+eVp4ntVaQmMa8OWaZoqWjeTCw3kd3egPk8N0haRc7DJbcc8GstOKKOcy+g8oe+/aL+1yLDV533q1DItSbsOs8BayAqkixAjrrzeVlU6QLAaQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmIp9oyJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmIp9oyJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CE1C4CEE4;
	Fri, 28 Mar 2025 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168558;
	bh=RtQa43M5Chutv/Mu+hA4RGh+5vaibCz9hJlkWvXMbbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tmIp9oyJk2zx71pJu8YFyPqgJ4zd75Yn4/zbn8+P6KBrLf6TamhKXbtYq3aa2TKnk
	 ceiETZTefWh8+rdLMZLVxmTmfE/1wMv3EFIXRqap5Tiablm9Aox/cruHNjWg0PydGi
	 WZD7XPlMbFaPyE5LTjwETqzRESfjGMbskioBAylsTAEHQ/l6RmG3p+zdcOqTFNbzmP
	 MuCPDHzRMP4OYLTi5oRQD6X8eIEu61Wywt0oLmoNzzKesFZii+jUwn5F7bMMrSUc+O
	 S4+ZO0RvcaGNKxHVavcm7JhPA2JLFS4ZZeJwBxQN53LhqEEpZqCJUSpla5gzks3rr4
	 Qq0W3gFV1AmOQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 47/49] x86/alternatives: Remove 'smp_text_poke_batch_flush()'
Date: Fri, 28 Mar 2025 14:27:02 +0100
Message-ID: <20250328132704.1901674-48-mingo@kernel.org>
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

It only has a single user left, merge it into smp_text_poke_batch_add()
and remove the helper function.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index df718a4e88c2..6de97646b4d6 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2831,14 +2831,6 @@ void smp_text_poke_batch_finish(void)
 		smp_text_poke_batch_process();
 }
 
-static void smp_text_poke_batch_flush(void *addr)
-{
-	lockdep_assert_held(&text_mutex);
-
-	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || !text_poke_addr_ordered(addr))
-		smp_text_poke_batch_process();
-}
-
 /**
  * smp_text_poke_batch_add() -- update instruction on live kernel on SMP, batched
  * @addr:	address to patch
@@ -2854,7 +2846,8 @@ static void smp_text_poke_batch_flush(void *addr)
  */
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	smp_text_poke_batch_flush(addr);
+	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || !text_poke_addr_ordered(addr))
+		smp_text_poke_batch_process();
 	__smp_text_poke_batch_add(addr, opcode, len, emulate);
 }
 
-- 
2.45.2

