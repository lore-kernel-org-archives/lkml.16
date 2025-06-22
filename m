Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E05CDF1
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750582416; cv=none; b=J5vX1+Fu9nt0UhsRrKDmVmvIHgo8v07N7hiHGAnNO20g2NXQyYLUztqXo0U2m8BOVIS4AtkE4sI6sc9FmNdIuBhQT7IoExL2r/3Ki0WK5YDz0YSsH77Df+cP9sDEPnM3dDg3oLzmEe5+hm9Mz7fXuqdZ8xVnUEMA0dSv1hWKTQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750582416; c=relaxed/simple;
	bh=ny/BC3b6bMax/611t0Sjjg1VCPNO3Yzsd3UH/zXlEdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bn/uZL0uib0AYBPaM0/F6PeZhCQKKJWpdFExMhvdsPfniZiAkzN0wcQCjVZ75krYYyVmi5oPZEPqh6yamEOQvvq5v1vtCXonbVooWhfW0WAz6Zhk8YyHIlRIaRfB8O0/V6w4GzacpIDaJHIR9Pua0cz7dtofIBYng+KLQVCpDK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BmPs3Sgy; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BmPs3Sgy"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A797A40E0184;
	Sun, 22 Jun 2025 08:53:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2rMwyJFjoYCp; Sun, 22 Jun 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750582409; bh=tDds+A7tVMwKPzzhqZeylDBMhtvFlpd+/+Mxd6qUM4A=;
	h=Date:From:To:Cc:Subject:From;
	b=BmPs3SgyfrRRmUEEHa717dAZsO0CeWi1MWbcXquy0NkLbPR+Z33GLufB6YVT4yfls
	 pKK/HB6WnxXRWad4S6vOGg88qJnGH2R8z8nKjfcBgxbLH3xtI3AbRKLKyQcxy4yzZf
	 qDEMNG4I0QOxC8EA3SgHN22A+nLoEfhCTKsXf8/KvNwgfXkI+3aXQLbtp8xt/ctpj0
	 NDirjxJPVweH1UMi9v3gT+OPqDcKyCIl7vnGS2leczAaW+jT6reJovX7dLyoQ+K7rX
	 VXxjmO+ey4f9sSr+/t0wBhHw4GGW8kcpGh//5LqVSAtyRG4i07bC81xO1ZrA7xL7zh
	 56OXmb+KuxknPxNUEaGCdK8mgNYw7QBDdNCuBHmgB0q5+Bz45Y/Cso81HTUUSidTIp
	 qVSSNn7xYwkAEpjM0JnlJyzD49yDUw+oMUwWvK6OM0aRBwjx13WjEjuyPeMfL39O9V
	 NYtaXTfCWZwQddfnjelZ0SlZMBanjNhVu5BvGanMbiIhfSFVKOkEuVJsXKB9xF5HgW
	 xBew1Uv1KFcIOYsGnvvI2isp0FAPE8h22qrviQi7xlJlkgBUqGu4J46Jtx0BN4ei6m
	 3KNQMUb80mCRHkow7pbLekRJrozr9XoPpKG1GdNrGqC8iBIT/jY1jnL2wK4JrWS8YY
	 +LwgE4D4T++XrBDYvkkkww3M=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3914C40E016E;
	Sun, 22 Jun 2025 08:53:26 +0000 (UTC)
Date: Sun, 22 Jun 2025 10:53:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] irq/urgent for v6.16-rc3
Message-ID: <20250622085320.GAaFfEgGlh6MIZ-1Pa@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the irq/urgent lineup for v6.16-rc3.

Thx.

---

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/irq_urgent_for_v6.16_rc3

for you to fetch changes up to 3085ef9d9e7ab5ae4cddbe809e2e3b8dc11cdc75:

  irqchip/ath79-misc: Fix missing prototypes warnings (2025-06-20 21:38:52 +0200)

----------------------------------------------------------------
- Fix missing prototypes warnings

- Properly initialize work context when allocating it

- Remove a method tracking when managed interrupts are suspended during
  hotplug, in favor of the code using a IRQ disable depth tracking now,
  and have interrupts get properly enabled again on restore

- Make sure multiple CPUs getting hotplugged don't cause wrong tracking of the
  managed IRQ disable depth

----------------------------------------------------------------
Brian Norris (2):
      genirq/cpuhotplug: Rebalance managed interrupts across multi-CPU hotplug
      genirq/cpuhotplug: Restore affinity even for suspended IRQ

Gyeyoung Baek (1):
      genirq/irq_sim: Initialize work context pointers properly

Shiji Yang (1):
      irqchip/ath79-misc: Fix missing prototypes warnings

 drivers/irqchip/irq-ath79-misc.c | 20 ++------------------
 kernel/irq/chip.c                |  8 ++++++++
 kernel/irq/cpuhotplug.c          |  7 -------
 kernel/irq/irq_sim.c             |  2 +-
 4 files changed, 11 insertions(+), 26 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
