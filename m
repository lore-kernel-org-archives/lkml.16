Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB4207A2A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443406; cv=none; b=eavK6dcep+ZNA+mEFnsYvJCWUhT6MNVdFBPplsfklWCFrYdq+Z5YNtm3BTXRDxxha5CnqRDXlaAB5ocok8MSTjaPK6YfwUVyGvVRofmSI+4YjLQaYyaktWoqN2c145VumyGIrLF2EvOAcpS29QVn+5PI1W7HiexRNP7Hax8jj+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443406; c=relaxed/simple;
	bh=JOLQBLpPiaepcEm/EFr3IeBQdfN0H9wF5InampQemhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ofj6N1dq/xxVcXDL1kYZTJezlAr1T92TXFb1agGM4iSga2p9DpGySH0pWtGy6b+enOqfozm5TrxVZZllklhAwOc76Si79q7k5gRiVCUbpaRg+ODR8p9YbuDx/94yd5g5NM+8N2qH+WZU+bjIXVOga1waNCmVIv6Bf1Qe3k5+bWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3PAN3n/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3PAN3n/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0E2C4CEE4;
	Mon,  5 May 2025 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443406;
	bh=JOLQBLpPiaepcEm/EFr3IeBQdfN0H9wF5InampQemhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M3PAN3n/fuyYpYuSgdG40juaPbONi0O97rGWCRSbkRw/OoX26YE5JrmMOxCqs4+n4
	 4AE09BBcF2bWnJWjqUuLBjhGni6YzDLcH2CbpnCWFOzCMZlv5H6s/CLKI5gXwynKHz
	 cvjkKT4ndxrEm4bJKfoJDbjtsw1VTk4kVxegpXW8Ew5Grw9GdRz/9LGBkmRbZRvKLR
	 vc79Yn1WTW+sGRSc13z+CHP4EKvYcmXGQZY8pgElOhDAOBuj12bF6W+0lnUum17GDF
	 6XS21TuQKBjNB5+ZxCE2RfGdwfHN8ptASQ9Z7uSQouBwDfrvJ/+o0A907D3rEkBovz
	 DKZxUyctv7U2g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 05/15] x86/kbuild: Remove ancient 'arch/i386/' and 'arch/x86_64/' directory removal 'archclean' target
Date: Mon,  5 May 2025 13:09:36 +0200
Message-ID: <20250505110946.1095363-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
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

