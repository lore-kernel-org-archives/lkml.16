Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9070157E99
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315657; cv=none; b=iVo3kTbjK/N54Sh0uHhOdpO00bPN+Wpge7vH2VgorgLI3V18zKi1AiF1UhWFTYXB2BpoBTvJkFZaKxwcf9TcUDRMUX+/fGX0EwHFbDZm3JJ/O67+tK+/1nOWO0AmJZbgR5TxWzlszUA6AtJcvQbnM2KqgPcYBDIMd+ejj55cPFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315657; c=relaxed/simple;
	bh=bvY2pJuD+ToT5fXtSA9H/P8V1HXEqRDyX9cagVT6o6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGNxkhQXPIBpqcrQTYQqLDg0Jr3CikUU3H9o2eT2a/GkozIi1Lf8K9of+4q/qfRoMLlo7Rrmcj7kYxySaRuwUYq6fdWLIo0q23bD3NzTPZbM6IVbs8pS9PT8i4CLU4u5RRvFl3U5j3pWwszCHqWAEcbnTDLHD12XMklnFQdHKuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7FaBROM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7FaBROM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D81C4CEE7;
	Thu, 15 May 2025 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315655;
	bh=bvY2pJuD+ToT5fXtSA9H/P8V1HXEqRDyX9cagVT6o6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e7FaBROMbiz3VgFVB1zpVYZzoYSCvmfE5emy1a/LYJe6y0pyw7/1kZVR19QWy3Ztu
	 Zekn+7uxu8ZOseabcyB5TjfyuhDMSk561mScT6/AIcfLUFOajMGyZc2dtv/lpW5TST
	 Jp8eQIvHsMuM3YDdX1qBt6vjeitxDI1cqsHXTOLH1Qx5VXOuo515fx7R1wUR/ntvG/
	 nO93q/04WHZXueMansIDN/Bgn4kzCoHbbzLLIyg7oHT/KLNzLmv45pQ3eQ/wov/ZNp
	 qYzZNEn18r91nSzfin3tOW6tBmzj3MtbRyj8oFmRp/R+F8g2ERD+j2rv5URyEZ9L68
	 Til8fuvoDOT0g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 03/13] x86/kbuild: Remove ancient 'arch/i386/' and 'arch/x86_64/' directory removal 'archclean' target
Date: Thu, 15 May 2025 15:27:09 +0200
Message-ID: <20250515132719.31868-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515132719.31868-1-mingo@kernel.org>
References: <20250515132719.31868-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have to go back 17 years into Git history, to kernels that won't
even build or boot with modern build environments, to come across
the obsolete arch/i386/ and arch/x86_64/ directories.

Remove some of their last functional residuals in the 'archclean' target.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 594723005d95..4e7ac5e4b537 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -348,10 +348,6 @@ $(orc_hash_h): $(srctree)/arch/x86/include/asm/orc_types.h $(orc_hash_sh) FORCE
 archprepare: $(orc_hash_h)
 endif
 
-archclean:
-	$(Q)rm -rf $(objtree)/arch/i386
-	$(Q)rm -rf $(objtree)/arch/x86_64
-
 define archhelp
   echo  '* bzImage		- Compressed kernel image (arch/x86/boot/bzImage)'
   echo  '  install		- Install kernel using (your) ~/bin/$(INSTALLKERNEL) or'
-- 
2.45.2

