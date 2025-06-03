Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0186D20C031
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960289; cv=none; b=gwWJgZBG4eGkYnN+ec/bkt5wOVpbLrmMjb0bQnnojcb5PNFZxpokKOt0TwiLA39HTtYjgSLDsY+VkY8RXMH/QrtaQncWJtgbioi6GbBrS6T/v+XpGBKY3ni+/85B3Czt2VALTaBIbCss29x6LktNi7QRqW1Qn9W/8owwdD0QJw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960289; c=relaxed/simple;
	bh=lUFGuC5ycdcnI5caajtZ9t5Zj3/9mRBKp3NDiUwuLWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOlyAB2w9/wKPZkFki89HkXi9mHZA6k8/Rdt01fTQ8uBtiHC/HwT3gqqHDp9p5Qm3Lat88hODwAiRhWGE13X7ziP+aCDlKlHCQEBR3n2Cy3nk7JzxVjYaih16ABdPJCKTRRhcNl0AlBm1Ej40v5ZPd3pXD8up42fru9k1URUSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgipLgso; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgipLgso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62288C4CEED;
	Tue,  3 Jun 2025 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748960288;
	bh=lUFGuC5ycdcnI5caajtZ9t5Zj3/9mRBKp3NDiUwuLWI=;
	h=From:To:Cc:Subject:Date:From;
	b=sgipLgsomXQr5yJk2XUmUkEV51djBPrldROzvsO2rwa6QsBFE6sacVDIZF3IppF2v
	 LKHaqseAjjKnwvNqsokboTlK3NgOc+IbLaeCFNrbq7u+yQTf/jcQ1PyXY3rNnIAYQb
	 Aj6I2ONBI4KmVg+oxkV30PAIfs+zbDtTdzUq4fiH0+nUHeIjBl2FrbGcRs7vheQYVq
	 STsip0Nsljjv7ru2iZiVkYv7SL6Hi7LeDhsBGhWYEzch+dv8vzQcMZy67OpxWMaWMp
	 Ht1dOyY5zie3FXqktEPtZdb+BQsHyGgQL6Agxhe/fdxIIZ46pOPhAaE7dcDqLBAyG7
	 sI4P0V7sOqsYQ==
Received: from [149.88.19.236] (helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uMSSs-002rPF-4s;
	Tue, 03 Jun 2025 15:18:06 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] PCI/MSI: Size device MSI domain with the maximum number of vectors
Date: Tue,  3 Jun 2025 15:18:01 +0100
Message-ID: <20250603141801.915305-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 149.88.19.236
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

Zenghui reports that since 1396e89e09f0 ("genirq/msi: Move prepare()
call to per-device allocation"), his Multi-MSI capable device isn't
working anymore.

This is a consequence of 15c72f824b32 ("PCI/MSI: Add support for
per device MSI[X] domains"), which always creates a MSI domain of
size 1, even in the presence of Multi-MSI.

While this was somehow working until then, moving the .prepare()
call ends up sizing the ITS table with a tiny value for this device,
and making the endpoint driver unhappy.

Instead, always create the domain (and call the .prepare() helper)
with the maximum expected size.

Fixes: 1396e89e09f0 ("genirq/msi: Move prepare() call to per-device allocation")
Fixes: 15c72f824b32 ("PCI/MSI: Add support for per device MSI[X] domains")
Link: https://lore.kernel.org/r/0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com
Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Tested-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/msi/irqdomain.c | 5 +++--
 drivers/pci/msi/msi.c       | 8 ++++----
 drivers/pci/msi/msi.h       | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
index d7ba8795d60f..c05152733993 100644
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -271,6 +271,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
 /**
  * pci_setup_msi_device_domain - Setup a device MSI interrupt domain
  * @pdev:	The PCI device to create the domain on
+ * @hwsize:	The maximum number of MSI vectors
  *
  * Return:
  *  True when:
@@ -287,7 +288,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
  *	- The device is removed
  *	- MSI is disabled and a MSI-X domain is created
  */
-bool pci_setup_msi_device_domain(struct pci_dev *pdev)
+bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize)
 {
 	if (WARN_ON_ONCE(pdev->msix_enabled))
 		return false;
@@ -297,7 +298,7 @@ bool pci_setup_msi_device_domain(struct pci_dev *pdev)
 	if (pci_match_device_domain(pdev, DOMAIN_BUS_PCI_DEVICE_MSIX))
 		msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
 
-	return pci_create_device_domain(pdev, &pci_msi_template, 1);
+	return pci_create_device_domain(pdev, &pci_msi_template, hwsize);
 }
 
 /**
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index d6ce04054702..6ede55a7c5e6 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -439,16 +439,16 @@ int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
 	if (nvec < minvec)
 		return -ENOSPC;
 
-	if (nvec > maxvec)
-		nvec = maxvec;
-
 	rc = pci_setup_msi_context(dev);
 	if (rc)
 		return rc;
 
-	if (!pci_setup_msi_device_domain(dev))
+	if (!pci_setup_msi_device_domain(dev, nvec))
 		return -ENODEV;
 
+	if (nvec > maxvec)
+		nvec = maxvec;
+
 	for (;;) {
 		if (affd) {
 			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index fc70b601e942..0b420b319f50 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -107,7 +107,7 @@ enum support_mode {
 };
 
 bool pci_msi_domain_supports(struct pci_dev *dev, unsigned int feature_mask, enum support_mode mode);
-bool pci_setup_msi_device_domain(struct pci_dev *pdev);
+bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize);
 bool pci_setup_msix_device_domain(struct pci_dev *pdev, unsigned int hwsize);
 
 /* Legacy (!IRQDOMAIN) fallbacks */
-- 
2.47.2

