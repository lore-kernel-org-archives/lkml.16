Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24AB2494F8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130892; cv=none; b=kFEFZTUsvApYe5iqQGIX35UWzixB4/2kuY2TxB11a76VIvt3JhuWUz3OZE8deAGg5i/xw8HKogJ6zAtjGcCTR5XOaf5cwjNNn6ZgbfNu2Fr8E8IAVeNqAyvXUudtH/EOx4eSyyBKQJOiEdZcKXJmo44ur84+kz62sS+42+oNZVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130892; c=relaxed/simple;
	bh=5H6teBMsrCBmaDMnEFeiUG4tGgR3EfbIwYOznmPuKlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDuy0m4bX8kbmLRrs6cMq43crzgmA8tyIEfSNcIfAJqBSt/OXtms7LKlHMgBEiU7/z0qZg4zxLcsU2x4YoExuaXBh5l56DiY5pR+LtlhKle6MRYbSC0z3dyaOX9shMV19fXs0fcqM7QFWD5Yr51hEZmQZgV6CAaw7p2Lzk+fSQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLeCTbWA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLeCTbWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F758C4CEE7;
	Thu,  5 Jun 2025 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749130891;
	bh=5H6teBMsrCBmaDMnEFeiUG4tGgR3EfbIwYOznmPuKlk=;
	h=Date:From:To:Cc:Subject:From;
	b=KLeCTbWAwXG5/0B716MGFwBy4Ee/kKRG51ei8PI0ABccPj20EVeD+KcNNKiKJ9wTK
	 vJFA8ERcvF2ta6SOid3qMC8foYiGjG3RGeQG3Fe6eJlID7uFRmNb2UcuYDKeDJ0iVU
	 gDBKpkp2HPgoMcOD+OyS+sBAnVFYWTVoqdUX0tmqtxcF525PJH7Jh3k+nIGBLa979N
	 VBJ4pJOf4sPGV1KYnRg9cZdbyf77TzP9jrMDyMtGeMWLHxhzo3U+3IU3OE3NdIKNf9
	 TdHJu6KuoyVlOrboTvinYy8pFw32/n90LOBTt4VpLKuRBVyhVtd8DWfqyAy+MmdSVH
	 sIDaeGWWGsHBQ==
Date: Thu, 5 Jun 2025 14:41:26 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc1
Message-ID: <20250605134126.GA4845@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Linus,

Please pull the following arm64 fixes for -rc1. Usual summary in the
tag, but we've got a couple of build fixes when using LLD, a missing TLB
invalidation and a workaround for broken firmware on SoCs with CPUs that
implement MPAM.

Cheers,

Will

--->8

The following changes since commit 217e3cbba3d6613bee9ac33ddc330f8676eb9eca:

  Merge branch 'for-next/vdso' into for-next/core (2025-05-27 12:26:54 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 10f885d63a0efd50b0d22bf27eb3cf727838e99e:

  arm64: Add override for MPAM (2025-06-02 13:49:09 +0100)

----------------------------------------------------------------
arm64 fixes for -rc1

- Disable problematic linker assertions for broken versions of LLD.

- Work around sporadic link failure with LLD and various randconfig
  builds.

- Fix missing invalidation in the TLB batching code when reclaim races
  with mprotect() and friends.

- Add a command-line override for MPAM to allow booting on systems with
  broken firmware.

----------------------------------------------------------------
Ard Biesheuvel (2):
      arm64: Disable LLD linker ASSERT()s for the time being
      arm64: Work around convergence issue with LLD linker

Ryan Roberts (1):
      arm64/mm: Close theoretical race where stale TLB entry remains valid

Xi Ruoyao (1):
      arm64: Add override for MPAM

 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/arm64/include/asm/el2_setup.h              | 24 ++++++++++--------------
 arch/arm64/include/asm/kernel-pgtable.h         |  2 +-
 arch/arm64/include/asm/tlbflush.h               |  9 +++++----
 arch/arm64/kernel/cpufeature.c                  |  7 +++++--
 arch/arm64/kernel/cpuinfo.c                     |  7 +++++--
 arch/arm64/kernel/image-vars.h                  | 17 +++++++++++++++++
 arch/arm64/kernel/pi/idreg-override.c           |  3 +++
 8 files changed, 49 insertions(+), 23 deletions(-)
