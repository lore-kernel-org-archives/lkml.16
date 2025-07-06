Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963620ED
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790009; cv=none; b=exOU0PSRDIrw3l7/TxSpGxahSucJi46bMr/QJTw1UaI1+dvPFSn2hSIutAGWuBuJoCvM+AOSD2STKi+K7ewr8zP+MGXKlyxiGmOkhnccNSxJV4OvAzcrBY1lPAbvwPSzxP7Rjuz2/hmTaPZtSxo3FCSvQtiDx2WFofTtncdLwPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790009; c=relaxed/simple;
	bh=7mQFa2epO1Lr3t5Kg1jb6YAZhvGSyXfTZjggEtF/25A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqrU6duWYGMwf4+p8N6KHe6CGflayE7vlb6MY36jM9LzWvMaM+C63Nkco8KkKXAXTPwbgEVgKDS9g+NxeteiM4loszeLkSnkeBzeLKGsJhh58R2Mtgpa6FpYtBc3ghNQTL+d3lQ95pdTEMpryZ6UHo94k9v0NlESE2z0A5rRUA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Nt6Q7cz3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Nt6Q7cz3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BC0D640E01CF;
	Sun,  6 Jul 2025 08:19:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id De4V83fzgJi0; Sun,  6 Jul 2025 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751789986; bh=CPXADirzo2UF4Gk9djv6Ep6uUtSBEmqvpnVj2NW3U/4=;
	h=Date:From:To:Cc:Subject:From;
	b=Nt6Q7cz3YDFCDAR4SB5aF8qgTLr1YCOaVrgwqSAhnHUK7yCZ7iAqqVyPSluF4VcMs
	 niyZsDpCbR0rLMSj44BM+VDMqpomHKLQVHZWwHeCzydIgFRCpK2a8XM1flksMnXIL5
	 vD0ZUctUhmnsSBA+med2DTB7rxGfUD2ELN1UiUxILUO5cch5aQosyMpilw/IenqXcb
	 KMR3q8bacK8BLHELaRfEBermbbPiSTFTlB+AM/Jbi7AbtYqB9VJiVxVi4S7ar0IWT1
	 AV3GC/MONeLJ2IXEX+GnN2XUxISZE5xXO14lk8Js0JOMK6x3PrBARSRpCB727vjuPA
	 mTFIeIcI/m4DAii081381Me01ePVIB3xAralrb0GtL8KFGqpTJnSUCNahUOW0voKcb
	 cK7p/OE4IxiapAHhpQJPNNyQluGauTHHL+2vtv04b33itvfAH0tKoiSQOWtjNOv/lX
	 92x21MbxgUpGjaeGiwQECVzWORYGeRYxDQF7rC3TxYNEHAzbP7xjBooi8YbWOUVDek
	 PUY2qN62vRiQzDLFC3feMTxAFeisuTxHjEhcZCt/HgwZc0n+g4vo6HOogLvcBSb+Fm
	 hTHM4iH34yd42t4GxUWM6pv9E6P8Gh3uudtnPjmwbsOVpaCuoS3htyWgsa65ZEGqpI
	 SpcYmQtj7ETvFhnf+f1MNFBE=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4170C40E0184;
	Sun,  6 Jul 2025 08:19:43 +0000 (UTC)
Date: Sun, 6 Jul 2025 10:19:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] perf/urgent for v6.16-rc5
Message-ID: <20250706081941.GAaGoxndcnnCKQBCEq@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the perf/urgent lineup for v6.16-rc5.

Thx.

---

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc5

for you to fetch changes up to ba677dbe77af5ffe6204e0f3f547f3ba059c6302:

  perf: Revert to requiring CAP_SYS_ADMIN for uprobes (2025-07-03 10:33:55 +0200)

----------------------------------------------------------------
- Revert uprobes to using CAP_SYS_ADMIN again as currently they can
  destructively modify kernel code from an unprivileged process

- Move a warning to where it belongs

----------------------------------------------------------------
Luo Gengkun (1):
      perf/core: Fix the WARN_ON_ONCE is out of lock protected region

Peter Zijlstra (1):
      perf: Revert to requiring CAP_SYS_ADMIN for uprobes

 kernel/events/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
