Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AAA29B79A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310837; cv=none; b=dZBrD2fyqAlG7dM5/Jb2DIo2T12szVVNupDsOQOVnaLeaFDL0kD8CFkFVb07lSudJAPu4lWqXR7VmwzXq6AlgePYOSMOrmzi07BQ99T8dsxYmP8OINcx9ST2GTiCY67YmmDt8VUD6goCa7ZbhCINehJBS4x3dD1kIj/zfJ5jWaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310837; c=relaxed/simple;
	bh=30qS1W/bA7jqRTQTKy+0M1mASu4o7tTdLTRb9GWcrrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqNzk/IETe9VDCm9nyJboU1I4niBDI7SGv47lVTo1eEHbc6mzctaGFC2GngvCUmiSSaYJn+Uw3DTLEax3s4PMRiyFEMOoEqq5YLt2oobRS6dJreY3ZV0Sa19jYyk2yrATxF8pXgiUJ3qcDnFEL6P4eWil0OI7FUicmJGagF9y1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaM9ORjB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaM9ORjB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44966C4CEE7;
	Thu, 15 May 2025 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310836;
	bh=30qS1W/bA7jqRTQTKy+0M1mASu4o7tTdLTRb9GWcrrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaM9ORjBHW8neFghs9VzrnN07mZy4sw0pHNs88XQeD0Dm+bdT5VviOTO8kRJ12zoy
	 mGW35JivDb+0BVVR/rhvAB2dl20MNxDIj3QyQAxv2XEDD0sVgPnG8jA0bstfoa21/P
	 EeLrXMG8N12TaSVt5eQKKWNgvahVJz2JVaREA7ForGWfhldB8pHJGQbXAnWw+7cFgN
	 OL2FL50CywS8j1lKg1nqO5h9Lq2V3bJ1uVxjPo/XmBjsksFHgXCLk3z2Xmqu+tD/Qn
	 2tzL8fOBePeqJa0LuL2uc5TxOcgHCpVt4Szgve3zGEj5MW5TELKkMcmyC41TmOckD4
	 zsdb5Bl9KHhhw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
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
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 23/32] x86/boot/e820: Simplify & clarify __e820__range_add() a bit
Date: Thu, 15 May 2025 14:05:39 +0200
Message-ID: <20250515120549.2820541-24-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
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
index 1eb5afbdd9e6..7c27661d0e41 100644
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

