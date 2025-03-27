Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8BD1EF37E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108879; cv=none; b=AU3L9FGSvC8l7cwZ3CXAtjIzaUD0eYib88K9kHL2uzFqQ4vwJSBcw7dwCc5RezArTD+vaf0H5wcEJ84Q7h8kRrg/12ne0Exxa2wCTXt0gdETx4VOH+J4c0uk0IbZKMroguhe7zFHK5feDiQ1XOX5YmgjufW2l/CWQ37sCBpdz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108879; c=relaxed/simple;
	bh=ZCzaJ1GzYCi9QGyPAJ+YZiVJfInW5nTy7FWebxnvhwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGux09d6K4QsHGePPpaHfEIxUBMSe+1S2uiC5sClgnrc5P54L6keCQyXDKkbn9KIj2qIR4H5sr8sJVB7GskX5TLcfNWhSPuSrb0q4oqgQoN0h3hQDJz0cY6poZFyDF4caM4V6Y+byDQbxa5miVRq8M5Y9PuTMN0Ifeox7dCcz3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FE/LWrR9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FE/LWrR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8565C4CEEA;
	Thu, 27 Mar 2025 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108878;
	bh=ZCzaJ1GzYCi9QGyPAJ+YZiVJfInW5nTy7FWebxnvhwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FE/LWrR9pEHtzm6KkuM8cvjp4k4NwbPJSQsoOF2emmmkSbd1VfiHR7MPNkdPIGkpl
	 YAy+AJU0HIiQpWDR/q7gMS7cwAx91Zttd0KCJU7HJb6UbummiIxySCrUNvcYBOGMVv
	 A5V71dziBgAsMSjfD3QxgPOLDteBZITn6B49pH9RVXIFx6AB6w1JJIckW5BRDibe/4
	 BbQemHr9nCdXNvM+FKs8X9O+bgpuMtT/baVXrzZVHmNIe8I5c8j/tAv6NGWMCBpx6G
	 SDxJHNT3oPk/jDHNAxHkTmiqnV6z49RaFq5EjvLID+3r3oCwx7+v0o+BvASdaWGzwY
	 DC/ocGFS3khUA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 16/41] x86/alternatives: Rename 'text_poke_loc_init()' to 'text_poke_int3_loc_init()'
Date: Thu, 27 Mar 2025 21:53:29 +0100
Message-ID: <20250327205355.378659-17-mingo@kernel.org>
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

This name is actively confusing as well, because the simple text_poke*()
APIs use MM-switching based code patching, while text_poke_loc_init()
is part of the INT3 based text_poke_int3_*() machinery that is an
additional layer of functionality on top of regular text_poke*() functionality.

Rename it to text_poke_int3_loc_init() to make it clear which layer
it belongs to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 89ab3a11f26e..64355aa25402 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2762,7 +2762,7 @@ static void text_poke_int3_batch(struct text_poke_loc *tp, unsigned int nr_entri
 	}
 }
 
-static void text_poke_loc_init(struct text_poke_loc *tp, void *addr,
+static void text_poke_int3_loc_init(struct text_poke_loc *tp, void *addr,
 			       const void *opcode, size_t len, const void *emulate)
 {
 	struct insn insn;
@@ -2878,7 +2878,7 @@ void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, cons
 	text_poke_int3_flush(addr);
 
 	tp = &tp_vec[tp_vec_nr++];
-	text_poke_loc_init(tp, addr, opcode, len, emulate);
+	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 }
 
 /**
@@ -2896,6 +2896,6 @@ void __ref text_poke_int3(void *addr, const void *opcode, size_t len, const void
 {
 	struct text_poke_loc tp;
 
-	text_poke_loc_init(&tp, addr, opcode, len, emulate);
+	text_poke_int3_loc_init(&tp, addr, opcode, len, emulate);
 	text_poke_int3_batch(&tp, 1);
 }
-- 
2.45.2

