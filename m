Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0D29B760
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310822; cv=none; b=P1HQdWgH0gGLQL/67ma9IXX56olTLVWoho4wz7y2gM4sCcUdIHJcfU+KhfTaLeRHM8pFeRc5PTuCKsn6/0wyX/tQj/mbHj/wB7vrvJIbhn+sJfaHm2tkhkaAsoq7uS43OCnrBTzzoluI8x1sxHokaw3Tfxdj3AQinwXnzPigUnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310822; c=relaxed/simple;
	bh=Byaj85c16GdgkFY1HUTUudSVyNy63/4LKMI9cvomcnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTRpYh1XeMTmHkmmulz2DP61zd0FggIkC+RP+mMcBRZLT76b0C341qtpYQD4Ee32HPpEpt48yiu7KN0hdElYKgrrP9WcppdDWZZqeN45CzdBpMitrCYvaJJj0Sim1CPUaR+EYgJdraF3B67V78n47Ydgjj/5LIMa41Hd+HGqq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpObGgcw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpObGgcw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BA0C4CEE7;
	Thu, 15 May 2025 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310822;
	bh=Byaj85c16GdgkFY1HUTUudSVyNy63/4LKMI9cvomcnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hpObGgcw7Mx2/TW6pBopbiplas/yFkJ9uzisA6RY2F3NjnCDqqpwjVdG0yGM0ykjW
	 bFGIkrptS1fo0XVv6pbv5zU+Jw8iqctW+vQq1poGADDBZBYKPPuFZmd0U1laVeQN4m
	 PBfQ+ImeK772sLpsvCvLYfLjufRgjqYb+eEs9pT9k0I0foEZNWcVPC1kOf4EAehpmy
	 R/5NgMoWSoitL07XHrF74OIQPHghp/Y46ndAi5Tp1ZTd9idfU790uWdd0i8UaR3rdr
	 TjUtZp8K/kQSpPAvtrJvDaAUqi3in8hy2PCqAUDoXVCfP7xVIeC396TAn+8OPmEPP2
	 zxcnlcV4WUMyA==
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
Subject: [PATCH 19/32] x86/boot/e820: Change struct e820_table::nr_entries type from __u32 to u32
Date: Thu, 15 May 2025 14:05:35 +0200
Message-ID: <20250515120549.2820541-20-mingo@kernel.org>
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

__u32 is for UAPI headers, and this definition is the only place
in the kernel-internal E820 code that uses __u32. Change it to u32.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/e820/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/e820/types.h b/arch/x86/include/asm/e820/types.h
index 80c4a7266629..df12f7ee75d3 100644
--- a/arch/x86/include/asm/e820/types.h
+++ b/arch/x86/include/asm/e820/types.h
@@ -83,7 +83,7 @@ struct e820_entry {
  * The whole array of E820 entries:
  */
 struct e820_table {
-	__u32 nr_entries;
+	u32 nr_entries;
 	struct e820_entry entries[E820_MAX_ENTRIES];
 };
 
-- 
2.45.2

