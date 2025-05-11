Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CF525CC5F
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981327; cv=none; b=DYowFWSBd+/vSH1Lc14p2ovEFmdzSKzzjoS6EFb/uZKwcFrqs0cro2T8wnm10RBobqWDha7oTzPX/AXGMw6UDelwApNAfxxwDLFrJw2ntvMe/6Z8z5+/QK+0rvSRMlCMnQk5zQET78dENHKLiOVMlNd8al+gjn5of2uXyhqGlOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981327; c=relaxed/simple;
	bh=yXnSYyP1mrYQ+gK1si8iEF8hympcNOwuZnqV8CQOOhY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gclO79ntSfP1VTbP6i1ONRMJLSP8Jk3Eaq5Qdpr3JD6GmdO18SGxcZPJlAZ17pJypvus3LASuulqLL1tkF6bmedwreE07r3r2PzwgMi/mCBwej9WDkFDGsZysQRj6MwwR6ZXE64jNRLIIOb7J895aLy3OE8w6Osl3iAFZ1BZRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jK4tUp/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jK4tUp/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473BCC4CEF2;
	Sun, 11 May 2025 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981327;
	bh=yXnSYyP1mrYQ+gK1si8iEF8hympcNOwuZnqV8CQOOhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jK4tUp/NSPxJvfCScx7PH5tKDO238/6DSRZQRi8XZu9ooqolUp9JcE8LJHSxtjwE+
	 cH1wzPQhXz0Ri6NTnlZ4s/XgE38wdrYbW6PYjfDcN9urOIdLKMQcMLx74eJw/D/Dla
	 wbFvvec2kmuu6qOcnJLTRkMDmm+SKg2LawB3W9p9wZ4ufRIBye+shDoMA9czT7wuSt
	 lHKjSsC8ek3ORgoy9pcfVqoM4DSgtG+OFFviSRWLXJZD8nkL04raTRU87ARMhzQoCw
	 h5ZOPITzuUt1wmw9FLCeGEG0tv1m1aEb/Ad91FZWfsHjtqNgJt6sDGXkUtcydsLIbK
	 UOa/92k7HHVqg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uE9e9-00Dt22-AG;
	Sun, 11 May 2025 17:35:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH 4/4] irqchip/gic-v3-its: Use allocation size from the prepare call
Date: Sun, 11 May 2025 17:35:20 +0100
Message-Id: <20250511163520.1307654-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250511163520.1307654-1-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
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
index 76b94f55b00e2..2df75a758c104 100644
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
@@ -143,14 +132,6 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
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

