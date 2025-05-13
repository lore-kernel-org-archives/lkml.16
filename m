Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B149295DA6
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153912; cv=none; b=O1UzdkkSgZS3SfaNgliUj3MI+pvwBb7vK1c0cLmCXUhY621bAu44XNpnuoxO5CejrIg1llWNpY9W4ShTkh+0XPX+LpzV1x5Y927NpIlAswTbD4OnaE/0840+1hmBdhLz2Wftupyt6IPV/LhujE9EViYqAxUcVqyKJLtXQqV0X34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153912; c=relaxed/simple;
	bh=66WBrZsbl2quOzJoVWNQg2OqyNcya0h5+RaekBq6n4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J+cRpB6IKKCt0t5V6kCi4X3EkoUOII8vFNQhQfRgxLISPvfpjN/Q7GMt5uGBkphvdyRh3Wgomea3JcLv1EKL9WghNzveL514nFrPYpE+EM+ouR/72pDOiZ9ugRXxrRaurarO6nqA0ptqb501CH+E3zM5JdliuT33BCiI2Vh/TZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dalVYDVc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dalVYDVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0040DC4CEE9;
	Tue, 13 May 2025 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=66WBrZsbl2quOzJoVWNQg2OqyNcya0h5+RaekBq6n4U=;
	h=From:To:Cc:Subject:Date:From;
	b=dalVYDVczDf1XKT+irltMhMfburNDL6TddYufjf502HYTz7lpUxhKGCf+8RxBennc
	 ga7dNhsUJBPr6yUEsRiWw2GR2wtN+q+pucpIlHfMxOqsEXzd7rJf9+6woDIlH0oogc
	 PByi85xQZkKoh2XhqToehNYYLJs/neTTy6kATuqKuNWOvXk8Q2isSSjIYYyvi0R6Bt
	 adNX0gshaaw79Crbg96Z0YR4XiRRldSwGFV/nJENciOn/I7qLtgVUkfjShOa0V8S51
	 kOpcOt4zpx1Wc1wTX0a3Epm6LXdx1seCJAZah/0ztmxKEBLDLyvGS5VVybfytzw340
	 p3wAWJCrmqyow==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXl-00EaLc-Mm;
	Tue, 13 May 2025 17:31:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 0/5] genirq/msi: Fix device MSI prepare/alloc sequencing
Date: Tue, 13 May 2025 17:31:39 +0100
Message-Id: <20250513163144.2215824-1-maz@kernel.org>
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

While reviewing (and debugging) the GICv5 code, it became obvious that there
was something pretty fishy about the way MSI allocation was taking place in
respect to the msi_prepare() callback.

There is a strong (though not 100% explicit) requirement that the
.msi_prepare() callback must take place exactly once during the lifetime of
an MSI domain, before any MSI is allocated. Sadly, that's not how the core
code behaves, leading to all sorts of "interesting" issues with MBIGEN or
the GICv5 IWB.

The fix is both simple and surprisingly convoluted. The first course of
action would be to hoist the "prepare" action before we allocate any MSI,
adding new tracking for the msi_alloc_info_t structure.

But this unveils another issue that the core code has been papering over,
which is that there is no pendant to the .msi_prepare() callback that would
be called on irqdomain destruction, and that at least the ITS code has been
using some crap heuristics to work around it.

So this needs to be addressed first, and that's the point of the first two
patches, introducing and implementing the .msi_teardown() callback.  The
.msi_prepare() call is then moved is the specific case of device-MSI, and
the .msi_teardown() callback wired up.

The last patch remove a gross hack in the ITS msi-parent code, which
was papering over the broken use of the "prepare" callback.

This has been tested on a GICv4 system with MBIGEN, patches on top of
tip/irq/msi (a1d8a83093675).

* From v1 [1]:

  - Fixed blunder in the ITS .msi_teardown()

  - Fixed spelling, grammar, and other use of unclear terms

  - Fixed line splitting, disgraceful underscores

  - Split the calling of .msi_teardown() into its own patch

  - Rebased on top of tip/irq/msi

[1] https://lore.kernel.org/r/20250511163520.1307654-1-maz@kernel.org

Marc Zyngier (5):
  genirq/msi: Add .msi_teardown() callback as the reverse of
    .msi_prepare()
  irqchip/gic-v3-its: Implement .msi_teardown() callback
  genirq/msi: Move prepare() call to per-device allocation
  genirq/msi: Engage the .msi_teardown() callback on domain removal
  irqchip/gic-v3-its: Use allocation size from the prepare call

 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 29 +++++--------
 drivers/irqchip/irq-gic-v3-its.c            | 46 +++++++++++----------
 include/linux/msi.h                         | 12 +++++-
 kernel/irq/msi.c                            | 45 ++++++++++++++++++--
 4 files changed, 86 insertions(+), 46 deletions(-)

-- 
2.39.2

