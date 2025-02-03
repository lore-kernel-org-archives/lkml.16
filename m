Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814A1D63D3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605819; cv=none; b=LyaRzl97yVGzvoSey4QhAzmKR9Z5hvhXjuZzmZB2MJRHqhfZwT+8tMg4s/tYFqN06CY80mrsfggd+4LOdA1d1914kuIjoRUsi/hIAvJ4T7ZpQAO9DfOS0S6Oy8EecKFILLJrQaCp6kT0KErsBnwUSPyjbGxcGEiCrUVjnYZzv5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605819; c=relaxed/simple;
	bh=0MI9pbNls+YiNRBrqeKBl3OVVzCqesoD+DJSYuIIrRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EFwHWPZ8gGQnn47HX8rpdj76g1wS2EAp/4PRgd3pKGJVoXw3je1QTaRaLA6FWCUBqEPNcRqbIQsaSwrEx/kfuqJXk13JV2P+wuzNv2pUqZqLaphN2xkUa1Q5iUDGuFv14P4o9ryO0qSNmZvXMfS3u218nONJ0AmiIDCkxzDkp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Ll8LoNM6; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Ll8LoNM6"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YmvQn48w6zlgTx5;
	Mon,  3 Feb 2025 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1738605583; x=1741197584; bh=bjbouzEGhq4gpZvgK9FvUZYgRr4FQvc1Ajf
	Nfl/45HA=; b=Ll8LoNM6dNUtUeVo9Qlj4kt+Y49wHIJKaXRDw9h0JK9FAb9lN1a
	uZeRx8p5+KwIrBMhztuBC4XT+Z7eHd4/G/wfoUgnSaB+xq6uWY14WckRURaLDh96
	1LKKup8WPAAe2YhYsLhxWjwNSENvLRy9ph/qKvMFHHcjNuZSLktaZZp7dNAEdE5/
	RizRC8j1is7T8SFma2+dzOyIvhe0I82ESQvnkL74bjY834OuenGXN7uRHTvTEAxu
	dVLryI0UfwcRAo/MZZsGoAt43Wf6G4oe4dB4BvTDaWqkK3Vk5vCBQNK+sEVAQCbV
	jFHC6WvBKbK5MBQ/1Hy0/03jrFJD8IsOMrA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ib7qy9QN7S4u; Mon,  3 Feb 2025 17:59:43 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YmvQk2NR6zlgTvy;
	Mon,  3 Feb 2025 17:59:42 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH 0/5] Make it easier to use nested locking for interrupt descriptors
Date: Mon,  3 Feb 2025 09:59:34 -0800
Message-ID: <20250203175939.3133477-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

The number of irq_set_lockdep_class() calls and IRQ_GC_INIT_NESTED_LOCK
occurrences in the kernel tree shows that nested locking is common for
interrupt descriptors. This patch series makes it easier to use nested
locking by removing the function irq_set_lockdep_class() and also the
IRQ_GC_INIT_NESTED_LOCK flag.

As one can tell from the diffstat, this patch series removes more code
than it adds.

Please consider this patch series for the next merge window.

Thanks,

Bart.

Bart Van Assche (5):
  lockdep: Introduce lockdep_unregister_key_nosync()
  irqdesc: Use dynamic lockdep keys for interrupt descriptors
  irq: Remove irq_set_lockdep_class() and __irq_set_lockdep_class()
  irq: Remove the IRQ_GC_INIT_NESTED_LOCK flag
  irq: Simplify gpiochip_add_data()

 arch/powerpc/sysdev/fsl_msi.c             |  5 ---
 drivers/base/regmap/regmap-irq.c          |  4 ---
 drivers/gpio/gpio-bcm-kona.c              |  8 -----
 drivers/gpio/gpio-brcmstb.c               | 10 ------
 drivers/gpio/gpio-mxc.c                   |  3 +-
 drivers/gpio/gpio-mxs.c                   |  3 +-
 drivers/gpio/gpiolib-devres.c             | 12 +++----
 drivers/gpio/gpiolib.c                    | 30 ++++-------------
 drivers/gpu/drm/msm/msm_mdss.c            |  3 --
 drivers/irqchip/irq-imgpdc.c              |  3 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c | 11 ------
 drivers/irqchip/irq-renesas-irqc.c        |  2 +-
 drivers/mfd/arizona-irq.c                 |  5 ---
 drivers/net/dsa/mv88e6xxx/chip.c          |  8 -----
 drivers/pinctrl/pinctrl-at91-pio4.c       |  8 -----
 drivers/pinctrl/pinctrl-single.c          | 11 ------
 drivers/pinctrl/sunxi/pinctrl-sunxi.c     |  9 -----
 drivers/spmi/spmi-pmic-arb.c              |  5 ---
 drivers/thermal/qcom/lmh.c                |  7 ----
 include/linux/gpio/driver.h               | 41 ++---------------------
 include/linux/irq.h                       |  4 ---
 include/linux/irqdesc.h                   | 14 +++-----
 include/linux/lockdep.h                   |  5 +++
 kernel/irq/generic-chip.c                 | 15 ---------
 kernel/irq/irqdesc.c                      | 30 +++++------------
 kernel/locking/lockdep.c                  | 22 ++++++++++--
 26 files changed, 54 insertions(+), 224 deletions(-)

