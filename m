Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04282BEC5A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153913; cv=none; b=RUl42RqdrH9QPWrnAAlE+Mmg/OJGbPBm6xxGdfgi/Yg6DGpku7Td5BHJ9uHaC/GTJeB3aEdayrXHDQL8ErBgMnMyY0GnmVjFX3Wj7DZffpaeIkEUohTHvTzQIQp0KzyaELR2Yyzel/LoRpr0NJkV53Finv05trBIaX9fZm9zkqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153913; c=relaxed/simple;
	bh=17/pUMQ3E5yHwJFwSxMS9cCKFYZ8IU9JtUyr4n/x9f4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tc37mpFD689NGxYtaWyOuGSawZxnCUwjpVR/UiYgy0l3j8aMOG3mt/DjumX5AyF/VdWyCHl2XPrjIf70AO7q/UxqSq34Ff8MYkJ9ydaOLXg6qPYEwX2uIDZZ8NX92beGi/jA5XSNZO74iWb5gKq+kr2DiB1wDXC2Ox1FTwPnS/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKIAKPyZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKIAKPyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718F3C4CEEF;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=17/pUMQ3E5yHwJFwSxMS9cCKFYZ8IU9JtUyr4n/x9f4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKIAKPyZNE8558Z0epfjFt5ZcJ86ATAzkd0LRVgH/k9K3aQh9Co/nhlK4dMRY6vUn
	 AvZhb5tu72Wio6HMJqBQtu/VVP3dVo9ZFVPXtExMv8Bjem4k/og61Pf/DNGsMuYJ+1
	 8yPxs5+mZGuqu8p3tbL/G9VIcoXr/+xpCPsoXV6D2kLg2LzROHVoSVdWjnYlkFNhEa
	 0c3Czuh+7tsWlcmW0UI0x+MU880Usim2vVLQzpMQnzDB4Lz2Qi6Oot0BOVyQo+uoe6
	 OSWbFcu3WHMCW35JdgExQLCD8jfgNTsAzMd/goD7ku2VilZr3a6FErGGrJYvtWMJHa
	 zBFeoiRdtKvlA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-Mi;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 5/5] irqchip/gic-v3-its: Use allocation size from the prepare call
Date: Tue, 13 May 2025 17:31:44 +0100
Message-Id: <20250513163144.2215824-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513163144.2215824-1-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
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

Now that .msi_prepare() gets called at the right time and not
with semi-random parameters, remove the ugly hack that tried
to fix up the number of allocated vectors.

It is now correct by construction.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
index 958736622fa57..6a5f64f120d4a 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -67,17 +67,6 @@ static int its_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 	/* ITS specific DeviceID, as the core ITS ignores dev. */
 	info->scratchpad[0].ul = pci_msi_domain_get_msi_rid(domain->parent, pdev);
 
-	/*
-	 * @domain->msi_domain_info->hwsize contains the size of the
-	 * MSI[-X] domain, but vector allocation happens one by one. This
-	 * needs some thought when MSI comes into play as the size of MSI
-	 * might be unknown at domain creation time and therefore set to
-	 * MSI_MAX_INDEX.
-	 */
-	msi_info = msi_get_domain_info(domain);
-	if (msi_info->hwsize > nvec)
-		nvec = msi_info->hwsize;
-
 	/*
 	 * Always allocate a power of 2, and special case device 0 for
 	 * broken systems where the DevID is not wired (and all devices
@@ -151,14 +140,6 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
 	/* ITS specific DeviceID, as the core ITS ignores dev. */
 	info->scratchpad[0].ul = dev_id;
 
-	/*
-	 * @domain->msi_domain_info->hwsize contains the size of the device
-	 * domain, but vector allocation happens one by one.
-	 */
-	msi_info = msi_get_domain_info(domain);
-	if (msi_info->hwsize > nvec)
-		nvec = msi_info->hwsize;
-
 	/* Allocate at least 32 MSIs, and always as a power of 2 */
 	nvec = max_t(int, 32, roundup_pow_of_two(nvec));
 
-- 
2.39.2

