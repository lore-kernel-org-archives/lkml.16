Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8633597E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750581713; cv=none; b=CsXy6csCYLiM1+I1bnzSn/FbAGyMgYN8HZ/RHQ0Ysp9tyGa0EEyNvXLRRIdZ2EA3fsGkjGGKtV2j0g+pOjmAr3VxKjzfb/ON2c7KUsQQlggUU9J9bSinfbAqqmy/PtgEkKBdD6Che+ttSf95mUHkKY0J7ROUF8TU/GTT1yBEFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750581713; c=relaxed/simple;
	bh=f+pZAgvSHM5ty2elyfv0XQznFSFM224bvAgYcjL8CPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rndAcW2sDALyMO3U6G3sbEu7QSSQEsfXN1F7IMZVoDv68pBvduM9n8pZ/j2kZmJPNeWLA3WWz82Xk7C6xkyxqjnm2HujyQma37msA3GJuMGW6hjzaCUW+QIA/GWvSjYLzWFm/fSTwTnxksf2t8W9N6k8NMFjKIi2z1mMINm2xMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=f8Cwx2Wb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="f8Cwx2Wb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D980A40E016E;
	Sun, 22 Jun 2025 08:41:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YBjn2mLEh3zz; Sun, 22 Jun 2025 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750581706; bh=PjP8JJ94ZC2xsboy60q4WseN7XkRNV8+WKP/i+0DV9c=;
	h=Date:From:To:Cc:Subject:From;
	b=f8Cwx2WbRi/jDtc8lXQMX5ss/BJFWTOT+nVwqwy4UKw0yI7Huu2RVepbaBaWXGiBj
	 3FbnQ0+Skjnsmb+3xJKxcYvqEUY8SnBdL7UhxsN+jobih6OVyWNMnuKfDeTEucAwvg
	 4eV30VEfNZA/0POnVHJf/32WcCncud7NJJWfC5FpzrnXTg7zrPA+QasfcrnwwqR9vv
	 vXTHCa3BqlhsLmUILMSeyigiGzVQ4Vd8G5UYdSK8nkhCCWS92euq/H+RcgoEkDYMNy
	 +7yjG/PpAVrlCEpPLrltQluowSHf7m9zLijyzbyAX9s8UH/rAUBf3IVOmhk2/ye3PY
	 vsIUMIEGiNsdlMMKzCwv4+F2VZkg/Q4g9XoykuV0gHGvEd/hbC9yVTahuFWFEShfpz
	 waDU3nDjjgcF2UQ7UXgfRwfpUSxM+q6prI5q8ND/phj7zXYWLEuwsd1VEFeujKXnfH
	 8OeX1HE37Z4p5eddDSERfTgQGTOLjoCvzMsYbG+P6oGZ/CVjBzEK7IkKeWTQgWSszm
	 liHwnrOoJOZd8A67RRVQxEfigwbyU2K5ddMRWSghQBybwOj8e5lTV5SQ4Nu3lgOXFC
	 RgT4uY3fBnadYCq66B+dZQXlwbts0zCdOHnjcWIQgI/N+NfUr8t3tDekFrzmVhFQYj
	 cPeWfs0S0evG+mZmw6vL/EuU=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 123EA40E015D;
	Sun, 22 Jun 2025 08:41:43 +0000 (UTC)
Date: Sun, 22 Jun 2025 10:41:37 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/urgent for v6.16-rc3
Message-ID: <20250622084137.GAaFfBwdb_Ei3zCHN_@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the x86/urgent lineup for v6.16-rc3.

Thx.

---

The following changes since commit 9afe652958c3ee88f24df1e4a97f298afce89407:

  Merge tag 'x86_urgent_for_6.16-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2025-06-16 11:36:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc3

for you to fetch changes up to 2aebf5ee43bf0ed225a09a30cf515d9f2813b759:

  x86/alternatives: Fix int3 handling failure from broken text_poke array (2025-06-18 13:59:56 +0200)

----------------------------------------------------------------
- Make sure the array tracking which kernel text positions need to be
  alternatives-patched doesn't get mishandled by out-of-order modifications,
  leading to it overflowing and causing page faults when patching

- Avoid an infinite loop when early code does a ranged TLB invalidation before
  the broadcast TLB invalidation count of how many pages it can flush, has
  been read from CPUID

- Fix a CONFIG_MODULES typo

- Disable broadcast TLB invalidation when PTI is enabled to avoid an overflow
  of the bitmap tracking dynamic ASIDs which need to be flushed when the
  kernel switches between the user and kernel address space

- Handle the case of a CPU going offline and thus reporting zeroes when
  reading top-level events in the resctrl code

----------------------------------------------------------------
Dave Hansen (1):
      x86/mm: Disable INVLPGB when PTI is enabled

Lukas Bulwahn (1):
      x86/its: Fix an ifdef typo in its_alloc()

Masami Hiramatsu (Google) (1):
      x86/alternatives: Fix int3 handling failure from broken text_poke array

Qinyun Tan (1):
      x86,fs/resctrl: Remove inappropriate references to cacheinfo in the resctrl subsystem

Rik van Riel (1):
      x86/mm: Fix early boot use of INVPLGB

 arch/x86/kernel/alternative.c      |  4 ++--
 arch/x86/kernel/cpu/amd.c          |  2 +-
 arch/x86/kernel/cpu/resctrl/core.c |  6 ++++--
 arch/x86/mm/pti.c                  |  5 +++++
 fs/resctrl/ctrlmondata.c           | 13 +++++++++----
 fs/resctrl/internal.h              |  4 ++--
 fs/resctrl/monitor.c               |  6 ++++--
 fs/resctrl/rdtgroup.c              |  6 +++---
 include/linux/resctrl.h            |  4 ++--
 9 files changed, 32 insertions(+), 18 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
