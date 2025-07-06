Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725D815E8B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751789660; cv=none; b=RUE70wTKwc85p6he92sjqoJa6ZNII9NL/osWJpo+c8ZxqYsQ49ghWOFzTU5wgZCU25oCdXrMND6sAiO0ZGo0a0c5IHNzQim5WLsUA+qq8vX9ciJ87jyHbUNGl3EtcA38+5PC5QR6lL79qfOw2WRES4SjK2zjfnl5L7y5TvkiCso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751789660; c=relaxed/simple;
	bh=f2rqnfb26Yp5w+SwbuhJZzJoKOXezSir28+7qrDW30Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GsmLBJpJhhmZyXWOHPcrFpRPyuu4kb337uspTrm1ONJRFG+8JWM61WVwp2IUXEDSSgiAu/MmNtEdRrYtBFSrLniByus4Q6Azm+lpamQoazuAW5Q9sIfdq5E99RMAzjtR1UgZAnsB5y92Ls/q2wLKu/wwopnaZB1Zm4IcUqY84nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UNfQ7WNE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UNfQ7WNE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ACD5840E019D;
	Sun,  6 Jul 2025 08:14:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Uqa8qqsdBdsv; Sun,  6 Jul 2025 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751789651; bh=H7q/ecb/JI98QxbFN7MgfLaV6MaXqnKKaw8ZY8m3YRU=;
	h=Date:From:To:Cc:Subject:From;
	b=UNfQ7WNEtMBD9gFNTfGBMvVn6+27a+15mEE003pHXxEUdJxWaC9CW2WMRCeZu/5ci
	 rp3JjrkqGS/HStkSWxHDD2v2VpobxE7N3pCeMCvk8SyG9pA2pRD3YUFdo4JDRh88jk
	 vc49rYd+Ang8Xx/kmfAK4KEYV2Y4SuGd16rz1KlnFjG0N16Kvz1BFnMXCT4QbOP7Ys
	 3nVY8qdtBXdxxY/M9mjcBOhiMg78IpI5h/IX4EtTrARvpabIIzlxw3KjGlFQDlHy2R
	 Yof6rspDCpHsQBJwP2WATqME46JdV0hmoN8ao31Ta6rr9Jk7c69C1d6KMUbhOxx1BM
	 MlO0LOAp5nWD1YGRII6lrYprX7Ri7rx0JbYOOlTfyJV1Mdu7bLkfLXZtIkGWVZABXh
	 f2NWlhsowJtiq1yz4LgqBMqLJWD24L7Eew2zmvet6fh/kP2iWzqBStqHyJjpyjNbm0
	 0oKMBexACEHBbvj60q4HtwPmye7GMjAbqzzcacqkGHIWJBuNis5WrwSXknUzzeGrxM
	 OOKuo0Xv6vSzxrn12yyIvXwnxgQJ3WkQi2nTF/Gj5OG+Wksm00Lcu78j4onf8ej0ZJ
	 ILJ/N1MTdQ//0zqtSOXhlRSFLyRt0tSA1Khq/WdWJgDJT8hpYccmROkcI34tlwX08I
	 kW8gt40bArX8UFgIe47LXVoo=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 44D0C40E0184;
	Sun,  6 Jul 2025 08:14:08 +0000 (UTC)
Date: Sun, 6 Jul 2025 10:14:06 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/urgent for v6.16-rc5
Message-ID: <20250706081406.GAaGowTkzWYi80KpDY@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull a x86/urgent fix for v6.16-rc5.

Thx.

---

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc5

for you to fetch changes up to 52e1a03e6cf61ae165f59f41c44394a653a0a788:

  x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation (2025-07-01 00:29:27 +0200)

----------------------------------------------------------------
- Make sure AMD SEV guests using secure TSC, include a TSC_FACTOR which
  prevents their TSCs from going skewed from the hypervisor's

----------------------------------------------------------------
Nikunj A Dadhania (1):
      x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation

 arch/x86/coco/sev/core.c   | 22 +++++++++++++++++++---
 arch/x86/include/asm/sev.h | 17 ++++++++++++++++-
 2 files changed, 35 insertions(+), 4 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
