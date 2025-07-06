Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D71A841F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751789498; cv=none; b=dPiOKiIdpCZYP4FWbXmNXN7pP+Af7dm/suhK0c8bcxxC4fHKxoi6VbUicz2rjYh4plXHy8mWaGZG3QzmjpxdtlS3+9/gt6p46uo7UduP0JP+foqCKbcMH/bD1v3LSS+nry68yfxFiIfpcLTfMjACl1hDKJk2ZSz+xz1czJM4YtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751789498; c=relaxed/simple;
	bh=B/nn2I6M8+ocRVTnf1UQUAYD6Gv9Af3FUM1s4aHzOKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y87QPvlF9zBtQ+1wlQSRbHA+oqffWXE/hJGgz8dR82s+QpkkYoQNs71EKb9gHls2ssSj/3Qc27x6OLb6AYDZAErKjFlQxUteb5mrtGeb3P5nUiAfzKHAQtCv/chjf6yjSTJ8EX8wQ/MtYaDHEfjMNRhjXrJSzXSaofGYtBclFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KAWZx0Dn; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KAWZx0Dn"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 36EB940E01CF;
	Sun,  6 Jul 2025 08:11:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rSiSZpNC42se; Sun,  6 Jul 2025 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751789486; bh=cTHdE33k90cEuSwgyWjZniUagOCWbkz0hF/JuUVY5kg=;
	h=Date:From:To:Cc:Subject:From;
	b=KAWZx0Dn3/MMQJO6jZkGd79J2CCiuVYfheYX1e4oGjVgRU4KhuRZl4NdW5GDXUZFK
	 XcSIDdUE8XC45iHlN9UkuBhwHHcslLPuYMlmcsACLAZJGcB6xgR6I7SUo+jaj/aoUd
	 Fw3BvXpHzTaiRziXO75KUuMqWDBT1e4hy1+JnT1/lPde1Wl+ETI1deWCdBOIEkxMo5
	 jiJRNuiNq/ewWyXQhvKpbP7pkcm0sxvWf7bP1TqZWQRfTj18/rW0vKUgz09V2KwvHa
	 HsesKJDOZ7zePBevF0iA2QtXM1vlcxWVFB9TzT9rICKgFRYyuyN43P5smP0pemvPL5
	 XHo5Hfbze2NajEF7KL4Vc05xaDPGJN/fJz3UIHFYoK/OgSDkV9jCzVWiPPbYCRj6qh
	 ztjOAhTpaRPDpgKalz21ZTvB6cRLEvYKB+V39iPZzZ2lv4f0i55erenFLV3pNe7UAH
	 +U4xxhAAzJz7pd7fn4yuHcxx/a1IUzK8SXxFxU4n3HSsD+50l0LmsDR0agqc4zTVuG
	 z4s8G9T+SJn0HoMT9EubmkljNGfIXa/ULB9ABRGPulb49r1YS5vkGcDqJSGMg4QdjP
	 oZmB75HszSDN8dSkizyWnOF4KwLSkSzSwReGc3VB7RKhumZ8djAG8OmJmYy05pKBJK
	 gGP1SWE8xr7/NhOfxfmSKnuE=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E782D40E0184;
	Sun,  6 Jul 2025 08:11:22 +0000 (UTC)
Date: Sun, 6 Jul 2025 10:11:21 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] irq/urgent for v6.16-rc5
Message-ID: <20250706081121.GAaGovqQfWt7K3CIL4@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull an irq/urgent fix for v6.16-rc5.

Thx.

---

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/irq_urgent_for_v6.16_rc5

for you to fetch changes up to eb2c93e7028b4c9fe4761734d65ee40712d1c242:

  irqchip/irq-msi-lib: Select CONFIG_GENERIC_MSI_IRQ (2025-06-30 16:59:12 +0200)

----------------------------------------------------------------
- Have irq-msi-lib select CONFIG_GENERIC_MSI_IRQ explicitly as it uses
  its facilities

----------------------------------------------------------------
Nam Cao (1):
      irqchip/irq-msi-lib: Select CONFIG_GENERIC_MSI_IRQ

 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
