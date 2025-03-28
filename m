Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8250F23371C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168557; cv=none; b=KqXxjdFSD6Bn1i6GUnx5RUGr/yjWXX1oZ7mJiKCJT2Ues7GMC8kNlV0iqHcQw5g9tQcd516MXjSWJl+He+MjYJPuk7sx1DWiQSIkXfWlP7fj6MFZWuI6dSxyqzywv8OmM0OgKH2Ib+FSJAfDAh4byI1+QF02AkOmhaqtZer6N7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168557; c=relaxed/simple;
	bh=2gDW9IOQ/NyyYQR/FZrQrYxoqLiDM7Is5aunFcwYsTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CImf93FuO95bJ/5mvtCzmTLEYKcSctA4WGAygwiHWieWfOS7jOi4Lg7ZV+LNFzEjGWBV4Owh/s3ExOxt2XO01maqwQdsqsDOR0Dntwx71YsrVv5EkVHe0kLpOWW2/bUdUroMg+HHMrn1qg9qcwWRx1KIjpGHwpkIgOBifUb2rR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g68LkZ7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g68LkZ7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FD9C4CEE5;
	Fri, 28 Mar 2025 13:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168556;
	bh=2gDW9IOQ/NyyYQR/FZrQrYxoqLiDM7Is5aunFcwYsTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g68LkZ7uXLHD0O04PausL6EMIIkjWGiKWCJ2xJsnDU88uAFBye57h/jFDGW3zxNZr
	 tXV6wpzAx+7NnH1A+tNkpwBxw9cJP3aeQHgkF9EgI2l9naW1X7fic8J4ELl2NkSM+0
	 QalDe/kgopmX942rH828bQyM5J/GUAQYaH7kOJUk6KjbK7IePWRtIbSUA9g8nN0LBw
	 uGPow0UqgkEaFE4ssVlm7gdHbrCzbLcoqgVwJHRSWSTVXfjIjs6L9bPO2DiuJp7/Uw
	 xBF0Z/x264HtKbzqVAyXXTpK468BsE9IaBQZMiWNYKHvm7pAmRgu+1+ElerGtIk5qb
	 svqRPD9sehTOA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 46/49] x86/alternatives: Move declarations of vmlinux.lds.S defined section symbols to <asm/alternative.h>
Date: Fri, 28 Mar 2025 14:27:01 +0100
Message-ID: <20250328132704.1901674-47-mingo@kernel.org>
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

Move it from the middle of a .c file next to the similar declarations
of __alt_instructions[] et al.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/alternative.h | 6 ++++++
 arch/x86/kernel/alternative.c      | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 4a37a8bd87fd..ef84739a77f5 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -82,6 +82,12 @@ struct alt_instr {
 
 extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
 
+extern s32 __retpoline_sites[], __retpoline_sites_end[];
+extern s32 __return_sites[],	__return_sites_end[];
+extern s32 __cfi_sites[],	__cfi_sites_end[];
+extern s32 __ibt_endbr_seal[],	__ibt_endbr_seal_end[];
+extern s32 __smp_locks[],	__smp_locks_end[];
+
 /*
  * Debug flag that can be tested to see whether alternative
  * instructions were patched in already:
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 242c0b1f7e40..df718a4e88c2 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -149,12 +149,6 @@ static void add_nop(u8 *buf, unsigned int len)
 		*buf = INT3_INSN_OPCODE;
 }
 
-extern s32 __retpoline_sites[], __retpoline_sites_end[];
-extern s32 __return_sites[], __return_sites_end[];
-extern s32 __cfi_sites[], __cfi_sites_end[];
-extern s32 __ibt_endbr_seal[], __ibt_endbr_seal_end[];
-extern s32 __smp_locks[], __smp_locks_end[];
-
 /*
  * Matches NOP and NOPL, not any of the other possible NOPs.
  */
-- 
2.45.2

