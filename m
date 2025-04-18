Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF2A1B6CE0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009078; cv=none; b=jgTlCSZRtv78QiwA+BY0h7LAPzV7JX/cBCnn9WFPHVrxZEMXnB67YKt41ySYEXzCDtyupK+Uo1w8MCGol7t/aiNUKnqZBgX10Gl6ptlGyZqD+KfrcXSfmQqE6rG5QkbyCC6b8kCUYeBHhQ6GUa8VlADNIARgnIINKg+PRrYdSJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009078; c=relaxed/simple;
	bh=li/bcUhL1DnvyzoE2SU6HKoByto/9ksr45TAEfyfSh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Li3693Wa/4V1vT45guSvhc/wpLdG86B/y5oOOF84ZyxeXxUuubG9h20fp60/Obo/ZLeN7XGBQcCzES1J05i02CqEDfyjJXf2hJlFJGFBAoWAIuINLYrMU1RAj54mptNJW3vT4pmRsnsqzmdjadahsFRdxlr4FSJonDc8BM2kHdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1T3f0vQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1T3f0vQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55580C4CEE2;
	Fri, 18 Apr 2025 20:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745009077;
	bh=li/bcUhL1DnvyzoE2SU6HKoByto/9ksr45TAEfyfSh0=;
	h=Date:From:To:Cc:Subject:From;
	b=A1T3f0vQ+rv8dVAEs/fst0AbG6Oo1vFlkuShSBeSTl72otGL2qF5mbFJTb3GV+nGx
	 LpIYKTv/DfO+4RIM/bojvzQl0XLfPBnauRDGJXHWj9j4z54YEXL5swnLe7MY3OGp9/
	 9D1Y+fJ2Rjl8FEQOHH6kyTsAJfI4F+xQrLfZbU/lAPX0rkP680q9c3TFYbd4QS4aWi
	 oqQ7sYcqZKbZNuX3HHLpcXh3TaZHy5qtYwhAIgNaUxTZNbMKHaGhnO3Pz+x03BMYFp
	 5xb1FlZCKp1Z1W1qJ3g2GVYFRSvK+F4oxfGeMAGKDIoJgZv5aXg0FfkieaH4L+iX2z
	 Vny3w8ROYP4YQ==
Date: Fri, 18 Apr 2025 22:44:32 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Subject: [GIT PULL] x86 fixes
Message-ID: <aAK5sDBMS8jYcsiz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-18

   # HEAD: d54d610243a4508183978871e5faff5502786cd4 x86/boot/sev: Avoid shared GHCB page for early memory acceptance

Miscellaneous x86 fixes:

 - Fix hypercall detection on Xen guests

 - Extend the AMD microcode loader SHA check to Zen5,
   to block loading of any unreleased standalone
   Zen5 microcode patches

 - Add new Intel CPU model number for Bartlett Lake

 - Fix the workaround for AMD erratum 1054

 - Fix buggy early memory acceptance between
   SEV-SNP guests and the EFI stub

 Thanks,

	Ingo

------------------>
Ard Biesheuvel (1):
      x86/boot/sev: Avoid shared GHCB page for early memory acceptance

Borislav Petkov (AMD) (1):
      x86/microcode/AMD: Extend the SHA check to Zen5, block loading of any unreleased standalone Zen5 microcode patches

Jason Andryuk (1):
      x86/xen: Fix __xen_hypercall_setfunc()

Pi Xiange (1):
      x86/cpu: Add CPU model number for Bartlett Lake CPUs with Raptor Cove cores

Sandipan Das (1):
      x86/cpu/amd: Fix workaround for erratum 1054


 arch/x86/boot/compressed/mem.c      |  5 ++-
 arch/x86/boot/compressed/sev.c      | 67 +++++++++----------------------------
 arch/x86/boot/compressed/sev.h      |  2 ++
 arch/x86/include/asm/intel-family.h |  2 ++
 arch/x86/kernel/cpu/amd.c           | 19 +++++++----
 arch/x86/kernel/cpu/microcode/amd.c |  9 +++--
 arch/x86/xen/enlighten.c            |  7 +---
 7 files changed, 43 insertions(+), 68 deletions(-)
