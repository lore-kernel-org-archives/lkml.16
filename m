Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA32868AE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551386; cv=none; b=NvtvId7LxVTHmKpZhfznRPR+J0+Jeh9Ab2kXTlFALlNi2SCQorwdyBBFv+/2EblWtgg+MxNcAs8F1PL8jEOwsctoDsplqwLb+fwbvGfPzVQZeq0Y3Hlk5KSADQ9RUiqMTFjOC0xj5V35WyVmGEeDojElIBBofMLSBP/2KPvMWzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551386; c=relaxed/simple;
	bh=JOLQBLpPiaepcEm/EFr3IeBQdfN0H9wF5InampQemhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unG+3gvFU7+QEvgOZ4+nWj6EJczpqd39wwFxxwTlJ8QpKlqtOYkyZXRv/rv2kk02eblOL/sRERscMnvpPIQ9IdOo7yONIH32UwQeFUryEUaJahumNCl9u++D6bzLcFBZalorpmPzw4H9kKVdH6NMgjzOk+NQPbmaeCTdgKJnOYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPIcaYDh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPIcaYDh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8558FC4CEE4;
	Tue,  6 May 2025 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551385;
	bh=JOLQBLpPiaepcEm/EFr3IeBQdfN0H9wF5InampQemhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PPIcaYDhNBo4YHcLwOYs95g0b5vBOJ2nCI00IdrWUaDVrJEfX2Z5iu53Filla8COy
	 H/XxeaLWCD3FV+Ujs4g88YP9zTAjgnj91nr4W1yUiTjm0E/oluQlLUIphJdmH5SMHQ
	 yx3iBcSkcP/qqZTVkJ/6jAkG0uxgfTNlIXvIB543/iuixxKSfOiXNbpj983WYFCc+E
	 Qe5EMPhuBQiyAEa2QdSDPG3TY1heDzRJr8aOYhpM07oI1fxoPc2y2BB2oY2U5q+ggT
	 eZ0tL/SKF68INJapJAAvCEJV8k87nN2OOXY6SdESHCmUeE+3haMr9RDHBoa12+TiBo
	 8NWXylXMyMVAw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 05/15] x86/kbuild: Remove ancient 'arch/i386/' and 'arch/x86_64/' directory removal 'archclean' target
Date: Tue,  6 May 2025 19:09:14 +0200
Message-ID: <20250506170924.3513161-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506170924.3513161-1-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
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
index fb4f0f15d1df..6348782e1be0 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -352,10 +352,6 @@ $(orc_hash_h): $(srctree)/arch/x86/include/asm/orc_types.h $(orc_hash_sh) FORCE
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

