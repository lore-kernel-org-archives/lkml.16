Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592641C6FFB
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981327; cv=none; b=fPuLRhCQ4IuXGZozh6wtJ7fxHLUg5XTZ4NNmQmKU4BHFFXVAZillxf9Bxdb0cYO0ktClsoSaaR+NWgLHQe2OQFdbo9O/T6t4RVmsIRu+3PEsRMUjOC51UlLydTcuhHoOnnMigLmebLU6FKEDw8ZfFYHR9WkHFanqhf1U26xHybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981327; c=relaxed/simple;
	bh=Ly0ycxk5mViKXGJnV6ik8fNXIyzCE67TE4MNRvRYDU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XbdMAvDniN90i1GvtjloSod1SouQTEJkc9ZPlxirT+CUW6ObXi6zo5yVBwmcXLC8bTFfrc4PGmk3rRKDN541aj9EUtVthQdRzYifsAr05fKXvZSquLouiZIvc2fKxlZ8/JIdwekRxMSdw0XTa9Kj1f+dnlsbvmjPWnGy8IOxgQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1W9G37z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1W9G37z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA92C4CEE4;
	Sun, 11 May 2025 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981326;
	bh=Ly0ycxk5mViKXGJnV6ik8fNXIyzCE67TE4MNRvRYDU0=;
	h=From:To:Cc:Subject:Date:From;
	b=d1W9G37zJPqqF4f/mBIHCXsvdjTkI8imS4jliuc8YuPQRmtNxTQw81Qxqx6/ZCgu2
	 TIl+MjJE/s6o10aNnCaGefD8tGR13H6Zt78ZJHNqQbLUfkpC/AKLxNLytcAqVm43dk
	 Arb7dAQhQ6V8ggMJaTl4LEN8kSMQ4Whr4NRat7Xgg0SzI/Qhby4CxgdEIQTZ6x+D9A
	 UdaIQ64NWs8M4ogTKUgbuIP1XgSbNjXfNpJluJD3/qIQFjo4KWiSGdexP8ex3zwHNg
	 jVgxhatzD0m9F5KoztUc5ZQVkEpFSe/DSfML5gYjHFWzqsOIO3kLj5Nm4vm1aLkJWA
	 jyOFENw/AfJpQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uE9e8-00Dt22-En;
	Sun, 11 May 2025 17:35:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH 0/4] genirq/msi: Fix device MSI prepare/alloc sequencing
Date: Sun, 11 May 2025 17:35:16 +0100
Message-Id: <20250511163520.1307654-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

While reviewing (and debugging) the GICv5 code, it became obvious that
there was something pretty fishy about the way MSI allocation was
taking place in respect to the msi_prepare() callback.

There is a strong (though not 100% explicit) requirement that the
.msi_prepare() callback must take place exactly once during the lifetime
of an MSI domain, before any MSI is allocated. Sadly, that's not how the
core code behaves, leading to all sorts of odd bad issues with MBIGEN or
the GICv5 IWB.

The fix is both simple and surprisingly convoluted. The first course
of action would be to hoist the "prepare" action before we allocate
any MSI, adding new tracking for the msi_alloc_info_t structure.

But this unveils another issue that the core code has been papering
over, which is that there is no pendant to the .msi_prepare() callback
that would be called on irqdomain destruction, and that at least the
ITS code has been using some crap heuristics to work around it.

So this needs to be addressed first, and that's the point of the first
two patches, introducing and implementing the .msi_teardown() callback.

The last patch remove a gross hack in the ITS msi-parent code, which
was papering over the broken use of the "prepare" callback.

This has been tested on a GICv4 system with MBIGEN, patches on top of
6.15-rc5.

Marc Zyngier (4):
  genirq/msi: Add .msi_teardown() callback as the reverse of
    .msi_prepare()
  irqchip/gic-v3-its: Implement .msi_teardown() callback
  genirq/msi: Move prepare() call to per-device allocation
  irqchip/gic-v3-its: Use allocation size from the prepare call

 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 29 ++++-------
 drivers/irqchip/irq-gic-v3-its.c            | 56 +++++++++++++--------
 include/linux/msi.h                         | 12 ++++-
 kernel/irq/msi.c                            | 51 +++++++++++++++++--
 4 files changed, 101 insertions(+), 47 deletions(-)

-- 
2.39.2

