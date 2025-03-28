Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BA6230BC6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168548; cv=none; b=ugRwu2e/gm0dO2gTqXzfTH2+lgkv5Ai4ZjsF3FY1zhglvZ34FP2cIP0hlBUm0YEBdIKpBJx/BHvthpd/GEWkTvtobJp7P2NPhVTu4eqdtqQA3QaUAZMWMmaaUHgDj06lSPLPebU/2cLScmS8RVSWE4sClkyBKw3A0pv5Ty5LQog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168548; c=relaxed/simple;
	bh=Tw3+yQ7n3S2FF8XCTvEh5x8oO8/o/42rPxJyFoMdDQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eASqbAUFCduucNHUAk2QYTx8C45YPePTm1Fn5DGDCMUjY2L51prNXDKtja/m/D5wyI8/uH8w3oWwWeF6tu26T7z1wod953nt+ZRK9vg693wF2A4d+ssVgE6h/d6UdTXiGF1JFi7rTV72++zGq70RO2w08QhBRJS3vJ/4THBaK1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyIWI5QJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyIWI5QJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A416AC4CEEA;
	Fri, 28 Mar 2025 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168548;
	bh=Tw3+yQ7n3S2FF8XCTvEh5x8oO8/o/42rPxJyFoMdDQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oyIWI5QJNPBzIo4vb6tFbl8GA1Ukku7bS+RZuQG7RjguOTSUfUmDYVkFfLYBUukxz
	 JUkv1MUVPoO1UI1VNA6xbWs2TYddU7/ze9noLoA2nin6XBwqmQNA3I225ZelaxZfsb
	 LZ/dI084vKUXVlb7ywphb6cdyK5+HfenyMBB5kvzvkkmB+B9M5DxafjTJCVXDB0aTv
	 09PktVvdBgsr8T3UH35qmG4glPfF8DXBKZ522wu42GnpMtXjIV0pSl6TBPcJ3xpbSg
	 pEm4guSPuhWDNXo68p7DXVCCJQ5PgwQMYMdxF4XUXdxHdBRSXDouNDUmLkoMBca5+s
	 VOHRk5xkpML3A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 43/49] x86/alternatives: Rename 'TP_ARRAY_NR_ENTRIES_MAX' to 'TEXT_POKE_ARRAY_MAX'
Date: Fri, 28 Mar 2025 14:26:58 +0100
Message-ID: <20250328132704.1901674-44-mingo@kernel.org>
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

Standardize on TEXT_POKE_ namespace for CPP constants too.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 62a6c69184c9..04c536d36765 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2466,10 +2466,10 @@ struct smp_text_poke_loc {
 	u8 old;
 };
 
-#define TP_ARRAY_NR_ENTRIES_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
+#define TEXT_POKE_ARRAY_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
 
 static struct smp_text_poke_array {
-	struct smp_text_poke_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
+	struct smp_text_poke_loc vec[TEXT_POKE_ARRAY_MAX];
 	int nr_entries;
 } text_poke_array;
 
@@ -2863,7 +2863,7 @@ static void smp_text_poke_batch_flush(void *addr)
 {
 	lockdep_assert_held(&text_mutex);
 
-	if (text_poke_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !text_poke_addr_ordered(addr))
+	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || !text_poke_addr_ordered(addr))
 		smp_text_poke_batch_process();
 }
 
-- 
2.45.2

