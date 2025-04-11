Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFA227F4C0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350163; cv=none; b=kf1mbGkFIiJsu3b6l4SxaPxReiRXl+QSZtj5A+3u3nd1ggjv9N5SFIv2IYwBJPVifMH5f+Dyl4HfN4GfpMEcE8LGM0bbjj47bayBFNoCH+NeoibZz53XbuW0lishtPTaLz9mtTBhJdEo7k2lv7KkjddKtUc6JiV4xmPNx6UBCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350163; c=relaxed/simple;
	bh=ToLj5zu3BJSFtDe7BjL5JSTUEqkeAeZC5sBV0v/uvzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/asb9xURfGMnSWdUxx4tPZ1JtYO+JwjRIyb9Jw6ML/ULK9WX5c1ihepbTBO92b3ceoWGmu34StnIaTlgUSX/wu4zTDz1Pq2F0Sb6nz1XJBiGi8iZ/0j1GGZbLSpOBFcDu85VOPSo8j9PigtBDiatyel4H5tj7YuDuWCsZD0THw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZ0p0cd6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZ0p0cd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137D1C4CEE9;
	Fri, 11 Apr 2025 05:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350163;
	bh=ToLj5zu3BJSFtDe7BjL5JSTUEqkeAeZC5sBV0v/uvzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rZ0p0cd69yZl1br6CmP6K2aCUzASnXg8SR1U1hBanpwz5Fdfhur0ycT4gNL4kqvY+
	 sl0U/eo1hvjmv1xpvtcKKgx9X4PnqZwUp4GphARIGbKIeS0gKO/0cbWIG9HqdoxcP3
	 F9uJeQhcZhXFPE1o+EGI3Oz+jNFhxj/SDUmIUPtXwOZHoFeIV081YJV78hCL6BYsvs
	 g/McyurU4/nZ5kRxDo4R0Q41cz5fTz1wVj51d89WEbAWEfynBtjsLTWgWLf3ObFHkX
	 pOIKnXcrB6Nq52e3TWsgsR8dHsP+jyetFypISYIgQAtNJTkDvuS1Ee67/PydsoWV6k
	 5G86uL9v4S6aQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 38/53] x86/alternatives: Add documentation for smp_text_poke_batch_add()
Date: Fri, 11 Apr 2025 07:40:50 +0200
Message-ID: <20250411054105.2341982-39-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index a9726cc96972..b47ad0853589 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2873,6 +2873,19 @@ static void smp_text_poke_batch_flush(void *addr)
 	}
 }
 
+/**
+ * smp_text_poke_batch_add() -- update instruction on live kernel on SMP, batched
+ * @addr:	address to patch
+ * @opcode:	opcode of new instruction
+ * @len:	length to copy
+ * @emulate:	instruction to be emulated
+ *
+ * Add a new instruction to the current queue of to-be-patched instructions
+ * the kernel maintains. The patching request will not be executed immediately,
+ * but becomes part of an array of patching requests, optimized for batched
+ * execution. All pending patching requests will be executed on the next
+ * smp_text_poke_batch_finish() call.
+ */
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	smp_text_poke_batch_flush(addr);
-- 
2.45.2

