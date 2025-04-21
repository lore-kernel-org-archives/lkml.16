Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82AE1EDA06
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261611; cv=none; b=LrLJTT8G/aL5Dg9m0EUCyryXqGOtDV6k2LUNGdD4VGIN+OXIKpcgM2ixLa2tP7mAGdRx0u7SfPoAHCKd2HhScT58Mpuh2lW3I+NofdxxSaL0JSsHemJ6KRFo6ceWOyq09GGh8A5VsZyCcLVxJMu48J/02XuSguZVt1q9lL2s1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261611; c=relaxed/simple;
	bh=HLGOql75xlDf5fthG2gUAwDXCfaXYZ3U8aECs8xCrSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tl00/KO6wByDmyyQzy0U12idj+nS9RYE7zthRsKUBoVWXpHZzR2pvziIyt93Hy2DZDRkqKJ1P4ur/7TIt2DqexfJIwvFW/gunKVvji/a23u/u5lBtkPQ6PzsyFEcEFrbGvWc3IZle8k0LuafBdmPHdJkEIc5QkkL2MiA1MFJZ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3xlt108; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3xlt108"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E4FC4CEEB;
	Mon, 21 Apr 2025 18:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261611;
	bh=HLGOql75xlDf5fthG2gUAwDXCfaXYZ3U8aECs8xCrSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W3xlt108og04TUfGGIZBFLDUGVQEO1zwmPCCsNpuHAiuyjLnC5Zx2COdVlVwOgYEO
	 M6kMZk6E/vRcKyJndu5+I+vZ754FwZ8NK1R/hRHtDfjbpOjAmLceJWmDFyr7Rxz95w
	 zOisHJ8zMvmZ8IJvuQT5dStWNPfHA1OQFVsQoFp21+3Z3Fk1uoE7oOH6SbjGEgvzQR
	 wnmj5YXR5QGVo2hWUwoBY9FJXQjoOtQBlHe3YqosILetwyGu2f0OSbGp0oR/Jzz8+d
	 kdxksQrNxAXnv+f+Q0DTSDX5sCY4T9ew2IAyBqrJ/x9gUnRcCaMUodx8Yy98bYJKW2
	 fDb+azdo7d7RA==
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
Subject: [PATCH 15/29] x86/boot/e820: Clean up __refdata use a bit
Date: Mon, 21 Apr 2025 20:51:55 +0200
Message-ID: <20250421185210.3372306-16-mingo@kernel.org>
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

So __refdata, like __init, is more of a storage class specifier,
so move the attribute in front of the type, not after the variable
name. This also aligns it vertically.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 6e626c4a3817..cb4e5349fd22 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -60,9 +60,9 @@ static struct e820_table e820_table_init		__initdata;
 static struct e820_table e820_table_kexec_init		__initdata;
 static struct e820_table e820_table_firmware_init	__initdata;
 
-struct e820_table *e820_table __refdata			= &e820_table_init;
-struct e820_table *e820_table_kexec __refdata		= &e820_table_kexec_init;
-struct e820_table *e820_table_firmware __refdata	= &e820_table_firmware_init;
+__refdata struct e820_table *e820_table			= &e820_table_init;
+__refdata struct e820_table *e820_table_kexec		= &e820_table_kexec_init;
+__refdata struct e820_table *e820_table_firmware	= &e820_table_firmware_init;
 
 /* For PCI or other memory-mapped resources */
 unsigned long pci_mem_start = 0xaeedbabe;
-- 
2.45.2

