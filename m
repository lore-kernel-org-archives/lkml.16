Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926C81AAC9
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751186801; cv=none; b=XjJ2zpQNRTJHCwpRqidmFC5qDQIJ/k/pJPQrVWcmoQkeF+R9QPaNdYRVAYp8JgTxJS9foxJXgYZNAwbqiUZHrpljCkeJFqwmuU79bbZijXCgo6T+l46qAQfr/zzXHiagMyD+Pu30PGh6BCyYF93ssWGbV6dHcY47/CTSbvuKBPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751186801; c=relaxed/simple;
	bh=NQMqcqKMHKSu/+DtiWDlp30Am/GNBYN9QQn17N45SBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nP76fTyyTKSmhgJKbCwU7U8H2hmfCrjQ+hUqyssXPNEWOEiLozPQLiho2YeLQGhc/LIXGpc+wtUqHmpcOkSD4YuDulBnUqbYkAZB5nZo+svbFYBrAoVzmWOI2J0rg9t5UfQ4J/4qhMDVe0ksYwzXVbZnLB6KnAGLxJwMRsLxdCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kKQwRgzX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kKQwRgzX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AF4F540E0198;
	Sun, 29 Jun 2025 08:46:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 36onRKkodAGk; Sun, 29 Jun 2025 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751186794; bh=Dogwmhzaiebz3x7VShBgkGKE7kh9vwh1xWAKJckucAs=;
	h=Date:From:To:Cc:Subject:From;
	b=kKQwRgzXg+fKLR7givV+juZguY1W8o5UTqOPkMC3uUmmdlaLpgL47k5VwJFUbUZeV
	 bvHhHzfZpmsc3nBJ+SZj1K5TpeZrNZetPXbglp+RwJU4Y0VSU+whxTkVbRENtoA1hM
	 o1GQsrPGo9II9NIxb0BOVLVtkkBuJAsodYxqm6pdOB7WQl27n3jyWjm/4a6ApVR+SV
	 tP+HOhpDlebYjBCOxhOUqgAw/OAcQgmk5f6wNDSQlnX4jBu4U+XY3IvleTezCywCVU
	 KDyCJqNKqU65Y1UH9NFylCtxD1zd7TRY4wAqzAyKWGqN1AFe9t6zrTpFvhEM6xvsrq
	 qpIZKmrCYawXFhdBb1TL54WOpjrOvxVWeWRmeQlGlmZBljjt3S1C1PAYX212pIlfMR
	 FqiznilnSH8HfXAWpxg7cs8VVml0h+Bju52l8PJQnk0EK8wtoYyO442SIvprT9OjlO
	 ItkIG/cCUZr5goCOn20qPSsS04hI9fVXUL3JZf5zpJSZwU2TK/jx9teHbY8EHIkDI7
	 mOMXo0kDlfZMUNH3/0IdWWJg1+pxXDgCt848ZytFUamQImCswzWC3+A6JBP0wPFQxF
	 yTR25FEaMDgu1WVLwqHQqDwe0nSEeh/Nf3VxrGM2K6rSdnaPCAVluNiT/9tLKJjOit
	 pue47teVTaeJ0ENfiwq2/kzA=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3142240E00DC;
	Sun, 29 Jun 2025 08:46:31 +0000 (UTC)
Date: Sun, 29 Jun 2025 10:46:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/urgent for v6.16-rc4
Message-ID: <20250629084630.GAaGD9ZoXfbOG272mA@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the x86/urgent lineup for v6.16-rc4.

Thx.

---

The following changes since commit 2aebf5ee43bf0ed225a09a30cf515d9f2813b759:

  x86/alternatives: Fix int3 handling failure from broken text_poke array (2025-06-18 13:59:56 +0200)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc4

for you to fetch changes up to fa7d0f83c5c4223a01598876352473cb3d3bd4d7:

  x86/traps: Initialize DR7 by writing its architectural reset value (2025-06-24 13:15:52 -0700)

----------------------------------------------------------------
- Make sure DR6 and DR7 are initialized to their architectural values and not
  accidentally cleared, leading to misconfigurations

----------------------------------------------------------------
Xin Li (Intel) (2):
      x86/traps: Initialize DR6 by writing its architectural reset value
      x86/traps: Initialize DR7 by writing its architectural reset value

 arch/x86/include/asm/debugreg.h      | 19 +++++++++++++++----
 arch/x86/include/asm/kvm_host.h      |  2 +-
 arch/x86/include/uapi/asm/debugreg.h | 21 ++++++++++++++++++++-
 arch/x86/kernel/cpu/common.c         | 24 ++++++++++--------------
 arch/x86/kernel/kgdb.c               |  2 +-
 arch/x86/kernel/process_32.c         |  2 +-
 arch/x86/kernel/process_64.c         |  2 +-
 arch/x86/kernel/traps.c              | 34 +++++++++++++++++++++-------------
 arch/x86/kvm/x86.c                   |  4 ++--
 9 files changed, 72 insertions(+), 38 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
