Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134A22A1E1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168529; cv=none; b=fsgdxKEAixc2vzBAhAoynWWzPY2QQSpnoWJEXyMI0LpRxA1fVzo73lXJj9nL37vf0b6duKKowlxQyd5JxLF80KL+++AKBGsgTZ8gaQze6NUFH6V/7l3rkV5kFJzKtHftUeWVsJGVXdgdf8TE6IWe4wGVddeQ5UYS6sB9N4KptxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168529; c=relaxed/simple;
	bh=lJU3ODFwidzxqO61R7s5hperFLlPIqDXHOUEM9oA12s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbpU+Mp8g/6Nd19i0kPnOhJ7DGpFet0GCdUpsIUprEVXxZOtj8kz6f5tqanzTZ/Xux4KxkUj8IkIHqS29643xNZLQEPJxpWOitOjAmHsQuUyDjV2QhabsojwIxratAIrF1e2jEpRxBCFvds1MSEh0MXyxktF4KauvYq3Ynu5q8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkySPDNo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkySPDNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9905C4CEE4;
	Fri, 28 Mar 2025 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168528;
	bh=lJU3ODFwidzxqO61R7s5hperFLlPIqDXHOUEM9oA12s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qkySPDNo2sQXsMF7MwEXtg9Y1pq0eMXQPzS6TyWxY8ONDMSzByrbNyMgpz03R7PbN
	 XnH2PbCUwyZ3nZK4qioMVRV8d4gRofRpqq4MDxR2EZssyzK9Wee03crFyc5uDavV7k
	 Y6kKsfrubFxkJUTg9JskyS5TQBAwJlqvaYH47MvSIqt/IZcK1TgLSuK9dDvLyfkp8J
	 8oAFAYdPNSFHmX35PoW+1dOUJ6QBXPtwYSHjz4/bgU8UjofWHAz6PM1bkQfNsxIl5Y
	 4n6NIL/6dr1lH1iVQbnOcWKo1Q6QuOdbXyhDSxQZP7LNf8If9H83eQ0rokXb2g/Qme
	 cdmka5PhNsW2Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 35/49] x86/alternatives: Document 'smp_text_poke_single()'
Date: Fri, 28 Mar 2025 14:26:50 +0100
Message-ID: <20250328132704.1901674-36-mingo@kernel.org>
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

Extend the documentation to better describe its purpose.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4f880a435e98..a32959019589 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2880,7 +2880,7 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
 }
 
 /**
- * smp_text_poke_single() -- update instructions on live kernel on SMP
+ * smp_text_poke_single() -- update instruction on live kernel on SMP immediately
  * @addr:	address to patch
  * @opcode:	opcode of new instruction
  * @len:	length to copy
@@ -2888,7 +2888,8 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
  *
  * Update a single instruction with the vector in the stack, avoiding
  * dynamically allocated memory. This function should be used when it is
- * not possible to allocate memory.
+ * not possible to allocate memory for a vector. The single instruction
+ * is patched in immediately.
  */
 void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-- 
2.45.2

