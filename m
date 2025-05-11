Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE311494A8
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746950044; cv=none; b=jo0Z6A3BjZs8YaMOiScReUZIxiPhxUfaLV8pAHsY2dnYsI8k5xw6/+Okfbkyx/DuYcHJjjtR5mKdhRSql/BgJ9KHBLBGGHq4jF+4imFjQuB3IM54tgoXpNxBIEykeWWLFQiH/EQOy1mTH0fMgZ8kM6AQ5FNQGH7a0lKf+Ft2pC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746950044; c=relaxed/simple;
	bh=hufqZl6EC+S6bSmgnw9yy20pcthWWSOQaq+QGENIh3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uE2uQyu/JmIvSyH07riV/iyUajOB7T9rsXWAKyyP5RvYhbWaxgEDHpq2/bzD+ZV3rB4KMu9WYddcb84eLYaXFXE4A4ZKzTrk/65s5Xg+NhU2S8prJ9jiPF+r3wNFD91CpH1vOr3vd18pYEfj5RknvRkt0zsuNlqeCHJfMravvuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbxX4VYA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbxX4VYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC55C4CEE4;
	Sun, 11 May 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746950043;
	bh=hufqZl6EC+S6bSmgnw9yy20pcthWWSOQaq+QGENIh3A=;
	h=Date:From:To:Cc:Subject:From;
	b=cbxX4VYAQidcK+QNKiwfo/QuhVWG+Ts1Y2tQbQTiQkC2PGu1ST9THfSYKM+dFBbAm
	 +ghq1Txa90yDxTcelDD1ja5RUQowKG2Eto5u09OokONVx1gC4RB40gD1a/lUUsF8lQ
	 8ggBcrFXegwmptINuq5Gp2tRLHFlkPr79n98i2hyi17joZp/6mEl0B5QWEi4XsLD/x
	 scCee5isA2Sl73VLQuLM9jM1saKQIZRRx+o41YTpGS3fq1DG6qn7zsb9A09odMw7Sp
	 f9+pooXpSJFdDIKAnzXzIknQicajUtuB7ppG5+Q+MDRjSoHyCi0CN7f6K+cSbfAwPi
	 e5573/NWyAB2A==
Date: Sun, 11 May 2025 09:53:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Subject: [GIT PULL] x86 fix
Message-ID: <aCBXl3x1VSU7fCzu@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-11

   # HEAD: 5214a9f6c0f56644acb9d2cbb58facf1856d322b x86/microcode: Consolidate the loader enablement checking

Fix a boot regression on very old x86 CPUs without CPUID support.

 Thanks,

	Ingo

------------------>
Borislav Petkov (AMD) (1):
      x86/microcode: Consolidate the loader enablement checking


 arch/x86/include/asm/microcode.h         |  2 ++
 arch/x86/kernel/cpu/microcode/amd.c      |  6 ++--
 arch/x86/kernel/cpu/microcode/core.c     | 58 +++++++++++++++++++-------------
 arch/x86/kernel/cpu/microcode/intel.c    |  2 +-
 arch/x86/kernel/cpu/microcode/internal.h |  1 -
 arch/x86/kernel/head32.c                 |  4 ---
 6 files changed, 41 insertions(+), 32 deletions(-)
