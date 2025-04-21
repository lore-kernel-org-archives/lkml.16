Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9A1F8743
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261634; cv=none; b=IHpKvZdraRxEi0blihenhZ+YJ22FiwpumtolT0bmBylWq4NzpZd0ncvZKZs8pjKCezr82ICtdQ0zIR7rnWYntgzky6XHFJNHSQH6MFXqg4LNWG4S8w2O8M7rs7uvt2o1epWJTlm7cIdWxym39Va0BAxoD2R2hg0f3vt3C+FfMxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261634; c=relaxed/simple;
	bh=B8HMP545YkJOzLe4wuG1fHgGabFH4VxeskR4IeYCpYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/AAdVNyPKJN7ODpRHPC6Oknr0urucjeQgFylb1NS70QltomydzVxrggmX9W9whgdMsNzFs0gJrh2/8J+vdAK7CwnOw5pVWC3jV3T7CIgqIcWK+U9e33CVWZ+BzByQkV80N9mQh9m1bDhc9PGN/F0VR/03b5OkrJfc/YB3Kg13c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6+7ZpVA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6+7ZpVA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D75C4CEEA;
	Mon, 21 Apr 2025 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261634;
	bh=B8HMP545YkJOzLe4wuG1fHgGabFH4VxeskR4IeYCpYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a6+7ZpVAAOMZRFWAhK31lw020B3qDg673F6xVlarCmQUv89TTG0nIkIXEay7VA3dT
	 q+2caj8QrcbQ+mceatw0nWbbKnNBrmdKN6syBKKhh44eiIv9hUbbdi2ZnqvMsVhPcf
	 MTimibYynBrB0cWpOa938Pe7vhp1XB1lKFSqywwhvp2aS4rH/k6TtPbpnKSGna+3uE
	 BY/zfM+0d/Lo4Ht2P3IyrKLarYDZPjt3QGNWW/IeYCpjGetdaeHuAohl3tezKQSV2N
	 8+jzV3YnWGDmCKcRtvEhPQCBNR3wMM1b3JC1k233or1D11LMEvYE3Lq3eSkqKAzG6K
	 d4XBttcZDtM7g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 23/29] x86/boot/e820: Simplify & clarify __e820__range_add() a bit
Date: Mon, 21 Apr 2025 20:52:03 +0200
Message-ID: <20250421185210.3372306-24-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'entry_new' to make clear we are allocating a new entry.

Change the table-full message to say that the table is full.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index d0f9c544a14c..e5a50aadc631 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -164,16 +164,19 @@ int e820__get_entry_type(u64 start, u64 end)
 static void __init __e820__range_add(struct e820_table *table, u64 start, u64 size, enum e820_type type)
 {
 	u32 idx = table->nr_entries;
+	struct e820_entry *entry_new;
 
 	if (idx >= ARRAY_SIZE(table->entries)) {
-		pr_err("too many E820 table entries; ignoring [mem %#010llx-%#010llx]\n",
+		pr_err("E820 table full; ignoring [mem %#010llx-%#010llx]\n",
 		       start, start + size-1);
 		return;
 	}
 
-	table->entries[idx].addr = start;
-	table->entries[idx].size = size;
-	table->entries[idx].type = type;
+	entry_new = table->entries + idx;
+
+	entry_new->addr = start;
+	entry_new->size = size;
+	entry_new->type = type;
 
 	table->nr_entries++;
 }
-- 
2.45.2

