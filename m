Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B4E29CB51
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350179; cv=none; b=u3/xI6LT8GmndS4k30Yxo3vsJMX5HPlKAHLg7xXZ0apz2vVsrdr5RBVyKqIXSL/vv3YGNTc+O7Or//fStSEB2hUxDzalQ10v1C73lt0794Va8If7bik4wR1POMZpqkyPyQpfcWoGZIMxS+9SonrjcJmLMdcwVsEweB8UHAqMtyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350179; c=relaxed/simple;
	bh=BMmunbnNc/HgIVTVEnaV2JEkO23hN5JxPbS53pz9BFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHRqhzdGbPOyajKjZu7Y3Od+d9J2km+RbB4vWJjIQrofkCibQRQBYrPb0Cmcdg0Jue7yQ8eNX2CJVMJ11lhrMQXTSjFQyqV2wrSHZguHDGDCIjYNzns/sYHYm1M1jisFHRUZActWobcEBuAw4vIeE4ugSbcwr9aSvRY2kQHpli4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OofR8iPT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OofR8iPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB67C4CEE9;
	Fri, 11 Apr 2025 05:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350179;
	bh=BMmunbnNc/HgIVTVEnaV2JEkO23hN5JxPbS53pz9BFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OofR8iPTEwY5Zplb+A5/HHxoVsj9tatZ0OKWvHJw3g+lkyMqjfDtPFAI+ZlrF5zSH
	 NbFePhaxCHKglHBYWiDGNWadI6I67flnFB3N/LILOOa9AG8cNGjjnEKo6loeCrkttL
	 A2rcrC9xPg2hrrvULUJQgF0BLNZUeo0z/E9XmwlSGuHc7RPCjTXElixCv1FnOtXryb
	 XzqsIWKbB80cvwI20m3SbRMizxR2b1WgjSQ/YtXe2+ge+Vnq9M9xd/icM8qU8O910F
	 wgHwcDh8JxUooYcBcgPWGUwoGXwwpX6jiUu9RXevLBn0nuKt6xRKjJ/zyxRrr3HAAC
	 cpdAvy155tUCw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 45/53] x86/alternatives: Rename 'TP_ARRAY_NR_ENTRIES_MAX' to 'TEXT_POKE_ARRAY_MAX'
Date: Fri, 11 Apr 2025 07:40:57 +0200
Message-ID: <20250411054105.2341982-46-mingo@kernel.org>
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

Standardize on TEXT_POKE_ namespace for CPP constants too.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index c5abcf95daea..4b460dea4f4e 100644
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

