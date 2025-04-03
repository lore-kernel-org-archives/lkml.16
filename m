Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61BC3C0B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743674606; cv=none; b=N4/eYcRRW8w4w/JMuIfS1V9uWSKjteGq+SDxx94pMeSyUlxGqQrgeKsA5Ig9ExElUUq80K0vVa1qaoBUTqASq6PTzGNif3tLRGrZKGE3numeLl31HJtr53fowG7/ioRP2I1h4EFbChPeKkxion0U0LzpZtZFKB6eObc+HlFoNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743674606; c=relaxed/simple;
	bh=o7gzNeABQTu7OlUf8+Hv1cJWigvJUHCi3CLLd/mdR1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJcUFrzitil7zm3uy6uTGyvriflG52jlu3srHptm6GB46g3Lm/G0Y7tlPndQ0IPpnO866Y/m3oH+9g2hfWrJ+cTirYQ1IfE1ZO6aAn5Socrl6xi9lwKXIyiKi58SsPqcTurbxaRe8JAJEjC+pn95MYAOvzfRBOIR0//66DWWd2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQeCrPCt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQeCrPCt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4357CC4CEE3;
	Thu,  3 Apr 2025 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743674606;
	bh=o7gzNeABQTu7OlUf8+Hv1cJWigvJUHCi3CLLd/mdR1s=;
	h=Date:From:To:Cc:Subject:From;
	b=NQeCrPCtpbjiB4Vq8izbENwfUgsFlt6Mos9L1Gf6iKqkgu70pb05ycku5bB5CjAEZ
	 9uOSE9dmTQnrVxL6Kbr+hBsvfkearDcQdiEQVGN987ORMBwcRvijCaGE1ebLsLpmUf
	 vHZm3uYsCh7CtFmYw6/ZtgebBPLN4rPthTyTqePvsj6dLENZ9sdIyb4sKIAPnB3fUJ
	 KF+QDxCABmnM1eTwKbJ+g1VRoDLUzQtTOG1S/YBD/HozejnR/axaZfpJNEZXP8ygVU
	 kQwLd5Ktozt/3iJXnx5Rq8kMlgPIkK28xuieskdcOGwsDvWJ90w1oLzIUr5yk7BCfE
	 KafUpQPPd3Zog==
Date: Thu, 3 Apr 2025 11:03:22 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.15-rc1
Message-ID: <Z-5c6hCqQb3s5GxI@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull the arm64 fixes below that turned up during or shortly
before the merging window. They are based on top of the previous arm64
updates pull request (6.14-rc3).

(sending with my kernel.org address, hopefully not ending in spam this
time around)

Thanks.

The following changes since commit 64fa6b9322a904198589c0479dca6f2ed7f2eb04:

  Merge branch 'for-next/el2-enable-feat-pmuv3p9' into for-next/core (2025-03-25 19:32:32 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to c28f31deeacda307acfee2f18c0ad904e5123aac:

  arm64: Don't call NULL in do_compat_alignment_fixup() (2025-04-01 14:13:11 +0100)

----------------------------------------------------------------
arm64 fixes:

 - Fix max_pfn calculation when hotplugging memory so that it never
   decreases

 - Fix dereference of unused source register in the MOPS SET operation
   fault handling

 - Fix NULL calling in do_compat_alignment_fixup() when the 32-bit user
   space does an unaligned LDREX/STREX

 - Add the HiSilicon HIP09 processor to the Spectre-BHB affected CPUs

 - Drop unused code pud accessors (special/mkspecial)

----------------------------------------------------------------
Angelos Oikonomopoulos (1):
      arm64: Don't call NULL in do_compat_alignment_fixup()

Jinqian Yang (1):
      arm64: Add support for HIP09 Spectre-BHB mitigation

Keir Fraser (1):
      arm64: mops: Do not dereference src reg for a set operation

Peter Xu (1):
      arm64: mm: Drop dead code for pud special bit handling

Zhenhua Huang (1):
      arm64: mm: Correct the update of max_pfn

 arch/arm64/include/asm/cputype.h     | 2 ++
 arch/arm64/include/asm/pgtable.h     | 5 -----
 arch/arm64/include/asm/traps.h       | 4 ++--
 arch/arm64/kernel/compat_alignment.c | 2 ++
 arch/arm64/kernel/proton-pack.c      | 1 +
 arch/arm64/mm/mmu.c                  | 3 ++-
 6 files changed, 9 insertions(+), 8 deletions(-)

-- 
Catalin
