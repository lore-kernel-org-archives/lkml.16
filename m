Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC151DA21
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488719; cv=none; b=cr3qnNAuldW4BU7orlyIGMXQmY5cJpBNZtet79xsN5CRslvVqmWVaBd+MZm2nlgl3VLLycDHXh98XksfXzOtEdV+HJQWhjB01lQn3M5TZq3jjzdSx4TvisiQVxfc/7WwsnLxuRnmhXwFaZwsCs2a9d5mMiPHcQUtkO4IGLSqDZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488719; c=relaxed/simple;
	bh=yjBRrjyxfu5k4hz6hrIs+7z8xGLIZYJxXwqkY64jPfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVcdgivdlj4M0zwouDktUPmy9q1PCW4U+BHMrtpWBS3XcAT/ZitEgBvnTfPmMBHzo1BPs18S/QpAswxLgzsNSFQRqHTnSDJPU8WrrDI4ObSvk3FWRIm3C8/9oQgzcCTgpCwCPas6eEENidRduLVjv2K0guyiWXSKTd4r0B0Tve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtzTCZF9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtzTCZF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B055C4CEE3;
	Sat, 17 May 2025 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747488719;
	bh=yjBRrjyxfu5k4hz6hrIs+7z8xGLIZYJxXwqkY64jPfo=;
	h=Date:From:To:Cc:Subject:From;
	b=gtzTCZF9lhy3gJHEeB2gCVeDwKf5RXCXMrdDIPFn8hP9+Fosk2Z+I2uVgcWd8ImO1
	 QvJcq9Zs8MUtJ1C9jaXoIl1Jl6yo0rDwecNjE8Nw99Qd5YH/c875LWQLGYUJu5sft8
	 rEKNHLw1n77AfnTmVJNyfqVJKYOx4XPp4x6DDCUBTHJBmM3Cf7PYuV4kKfwvyLPy9N
	 VGe1ioPRawQmf1r6J0f7uXefqHCh16L41hkH8jS7ymLxtbSNgd6sUKjfdsLgB6Claw
	 sbvrr1VB7zsvqW6QWB9YQL8F44Euh0eDTjn3s9wWNqAiT82cLFENKzRduhQnFkuZ/4
	 y/gmon2qJhMpQ==
Date: Sat, 17 May 2025 15:31:54 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Subject: [GIT PULL] x86 fixes
Message-ID: <aCiPyvlZPJFTRcle@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-17

   # HEAD: 03680913744de17fa49e62b1d8f71bab42b0b721 x86/mm: Remove duplicated word in warning message

Misc x86 fixes:

 - Fix SEV-SNP kdump bugs
 - Update the email address of Alexey Makhalov in MAINTAINERS
 - Add the CPU feature flag for the Zen6 microarchitecture
 - Fix typo in system message

 Thanks,

	Ingo

------------------>
Alexey Makhalov (1):
      MAINTAINERS: Update Alexey Makhalov's email address

Ashish Kalra (2):
      x86/sev: Do not touch VMSA pages during SNP guest memory kdump
      x86/sev: Make sure pages are not skipped during kdump

Lukas Bulwahn (1):
      x86/mm: Remove duplicated word in warning message

Seongman Lee (1):
      x86/sev: Fix operator precedence in GHCB_MSR_VMPL_REQ_LEVEL macro

Yazen Ghannam (1):
      x86/CPU/AMD: Add X86_FEATURE_ZEN6


 MAINTAINERS                        |   6 +-
 arch/x86/coco/sev/core.c           | 255 ++++++++++++++++++++++++-------------
 arch/x86/include/asm/cpufeatures.h |   2 +-
 arch/x86/include/asm/sev-common.h  |   2 +-
 arch/x86/kernel/cpu/amd.c          |   5 +
 arch/x86/mm/init_32.c              |   2 +-
 6 files changed, 176 insertions(+), 96 deletions(-)
