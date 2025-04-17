Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA5720C497
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887190; cv=none; b=QVSTf3STpxzTCVTVh9bznWtNE+hMSD1aaugMa3YfXrf7vbJAo1X81tFQjbPGbSgB2DZSYMls1U6iGnm1hAn/jd2Ih2uXeeQVM7ufLKCI7uiBtMGexxABXaJyG6l0X2paVrFFfm+kqI0ko8v/wsZaMx2uMWmtIImHJ7WlTjCdcrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887190; c=relaxed/simple;
	bh=DEOh/xDigK1NByOK61g6Wl8Mz/oDKd0FkZ/D+PwhbIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0m5dyGeNJPIIZYBBgdUTCJdhnpomkoXetqSCpN55L6Nrucr4KlR6LDMrEv3F6M6qYUS5MYvDGwEwtNCRcI7WQHbBC29Waf5XXIDYvxuzSio5Fy9o+yYS8IN1niZamurH0cJ5hkLZ1rA7atdU2lbxP95Jbs8xd/su02mxVG7S40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nw6iYQxw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nw6iYQxw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F92CC4CEE4;
	Thu, 17 Apr 2025 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744887189;
	bh=DEOh/xDigK1NByOK61g6Wl8Mz/oDKd0FkZ/D+PwhbIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Nw6iYQxwYtNuZltKjS92K89pKZeAhf/kvap0qdjys+Df8PXk9eD1Uu5ugpZxaeRSv
	 HRPGjTMn9w3aowEuOW9xtHOfV+DPinue3nD+4ymR8Jr5SMdsE2pDmd+5fpAQfhv5gf
	 nqh7sjsPnM1f4oaEqxJjb7lEmXJKElOiJgu/BG1nviXvfab1elMzqPE6ryB75D9KJ5
	 6Ihn21t4UPUWFS6RIXx6TpBw07OhcwmMUU3IlkLHKGAuXENq6TWNhTLQzLPwbyqx+1
	 BSLA1hB6WXHfsKBZRXPJnyj8ApJCMvgG/HXnomnrcbZDuK0YuncedtIKjjEbGBNHTz
	 GL+Y68nhfAKQA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: maddy@linux.ibm.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: do not build ppc_save_regs.o always
Date: Thu, 17 Apr 2025 12:53:05 +0200
Message-ID: <20250417105305.397128-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fixes commit below tried to add CONFIG_PPC_BOOK3S to one of the
conditions to enable the build of ppc_save_regs.o. But it failed to do
so, in fact. The commit omitted to add a dollar sign.

Therefore, ppc_save_regs.o is built always these days (as
"(CONFIG_PPC_BOOK3S)" is never an empty string).

Fix this by adding the missing dollar sign.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Fixes: fc2a5a6161a2 ("powerpc/64s: ppc_save_regs is now needed for all 64s builds")
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 6ac621155ec3..0c26b2412d17 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -160,7 +160,7 @@ endif
 
 obj64-$(CONFIG_PPC_TRANSACTIONAL_MEM)	+= tm.o
 
-ifneq ($(CONFIG_XMON)$(CONFIG_KEXEC_CORE)(CONFIG_PPC_BOOK3S),)
+ifneq ($(CONFIG_XMON)$(CONFIG_KEXEC_CORE)$(CONFIG_PPC_BOOK3S),)
 obj-y				+= ppc_save_regs.o
 endif
 
-- 
2.49.0

