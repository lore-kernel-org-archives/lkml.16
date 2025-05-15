Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3672D298C24
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310763; cv=none; b=hP1DxF9Y+XM/N/o6s615vU4EdsvHmDwC/dW3iFeXde/YNOut/Yk25z1NYCU2aOnsvp+oukTtTxKCt8ODqAVXS5pGr1O78IGT565WRioDJAOHoETR2WT6LPUzQbWZK6IRoH4hLuUBTMshBp5WPVET2WSIcED8n1F2GJc05hwyaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310763; c=relaxed/simple;
	bh=Driw6whNzZPzvROzbR0jpYx5SAkwmYkvQXz66nnFPnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEi+Y9jE06qprsfaopmLgKlOX6yc58xHjkI/Yl+opunIIz0bmW/WnP33sn/CYz7cH1T/QTMDQHSImBnGmARN4dPuuQgn6iRaVbmnBjc4fQPNGnZIMijQlqt1Ltovqog3VRul89HYmhxUWe1OF3fTRLxveKeAm13LomrZOIC+L8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfMFQdO4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfMFQdO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14547C4CEE9;
	Thu, 15 May 2025 12:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310763;
	bh=Driw6whNzZPzvROzbR0jpYx5SAkwmYkvQXz66nnFPnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mfMFQdO4zFf1eQco3Vplfu63m7/R6APTfaAQKB1pxC0qeBaBDrp5DKkOPY+W3+//M
	 jVmr0HzfGwt7sbHIqvoMF91/Mf+jXhSHBhEwfu3EAoW8RMgknB9v4MAw2E17asM2Pk
	 DSXgF2P6KCDkvp6aZgUR4XzH4YzNbdc8y5gDobFZke55lxWRqetLRInZc8W4J8ecb6
	 87enNC43O4untweQng35BzHQ1HkjG/LUKTOQBr+cRDUlNx6CN/7LFW9/QyduyIvfon
	 JPcYSHIMqhZEMw9ZFIL/hXfQ8UkxW3jENuDx0a/aY8waPB+eDUl8dteameCjvkdB2u
	 6QbxStdhI2ZwQ==
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
Subject: [PATCH 02/32] x86/boot/e820: Simplify e820__print_table() a bit
Date: Thu, 15 May 2025 14:05:18 +0200
Message-ID: <20250515120549.2820541-3-mingo@kernel.org>
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

Introduce 'entry' for the current table entry and shorten
repetitious use of e820_table->entries[i].

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index b95f0519a877..904925159560 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -204,12 +204,14 @@ void __init e820__print_table(char *who)
 	int i;
 
 	for (i = 0; i < e820_table->nr_entries; i++) {
+		struct e820_entry *entry = e820_table->entries + i;
+
 		pr_info("%s: [mem %#018Lx-%#018Lx] ",
 			who,
-			e820_table->entries[i].addr,
-			e820_table->entries[i].addr + e820_table->entries[i].size - 1);
+			entry->addr,
+			entry->addr + entry->size-1);
 
-		e820_print_type(e820_table->entries[i].type);
+		e820_print_type(entry->type);
 		pr_cont("\n");
 	}
 }
-- 
2.45.2

