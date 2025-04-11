Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0266829C358
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350173; cv=none; b=M2DIeECBixyQrotg+Xd5FuP9NHvqW9JN9pd1+4DFEgvXpF0Cm44+551M+V/+lIimDnfzPW3ZVu1iug++D10CPvWDPQWONcd/7w8PSelmEI+m7bZL6TOORujEk2T6nvO6WR39I8OWaGdkAJ7p8cV35dovkD2jLauPJsTjYtEkjAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350173; c=relaxed/simple;
	bh=O2zkaR2kW2P6AgmlTPYVLnVaHIZDOoTZSfQFD0K2MAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sl2DX0JmRxRhZv31zCSE8gSKJzE8Br07v/U3OCtZy+q+L5maRJOZg7XNt+oL3nzmeZWNdNVrgIQr3EPKqPsZaFTe+2TcbD1lGwFfLof3cfGURJx1AGflRV3QlveklQaubd4fXQc0+Fug5LjmE9W+urU0u0sACUzEOkKBEocCzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzeuMb3o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzeuMb3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C20C4CEE2;
	Fri, 11 Apr 2025 05:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350172;
	bh=O2zkaR2kW2P6AgmlTPYVLnVaHIZDOoTZSfQFD0K2MAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzeuMb3ofgXIUCY4TZLT0C6hYH0wIMi6zEt3ZlBsWEvfr4GaMuYfsz1Vv4cM20o81
	 FMT19HLaFjBengRs+oE9W9+23f34KuTjcti/qNa3VbBtc+1k7FfNVT9BQs5P1tYMR3
	 NzmYDNxsqgzq4ZbR8Wg4t3Hogkqw3IZIe/cyu0Nb0OfaSgWliihdnvsipIfDHzZ4ra
	 p2SK+30TqCLFtqQhHLLuVr3nDwgkWQnVLWDUgXXs2GUkg0TBnPXLb0DvDkKUibRhZQ
	 P1VDmmJiHfpq38+w9LkY0v9oA70923lwyc/KRHJTCb53y2BCdN1TgyndKtAiNGTkoP
	 az6AOmYImeoCQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 42/53] x86/alternatives: Constify text_poke_addr()
Date: Fri, 11 Apr 2025 07:40:54 +0200
Message-ID: <20250411054105.2341982-43-mingo@kernel.org>
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

This will also allow the simplification of patch_cmp().

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index a747b0885f9a..14ca17dc36e8 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2493,7 +2493,7 @@ static __always_inline void put_text_poke_array(void)
 	raw_atomic_dec(refs);
 }
 
-static __always_inline void *text_poke_addr(struct smp_text_poke_loc *tp)
+static __always_inline void *text_poke_addr(const struct smp_text_poke_loc *tp)
 {
 	return _stext + tp->rel_addr;
 }
-- 
2.45.2

