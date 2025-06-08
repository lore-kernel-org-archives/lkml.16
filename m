Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A32F2E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749367692; cv=none; b=oQKqEy7yriJQFFX+plE6SgHSSUlbzMC18n58d1GvPqeIvlmb07hyjKKKoOXybVPhRQlyNMuy5Mq0OSQipTAt9alZc6EBU6dxtkBGp8Pvak3qgtWAv8ciUy+O/0C4Al1J/XmsiYLOwdfMi6SiYjDM+3NIw7zP08B4t/ixavlAyQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749367692; c=relaxed/simple;
	bh=ecGszeWH2ZAkfWxLxfvgLKAyhAObekHBTrqA872cWSY=;
	h=From:To:Cc:Subject:Message-ID:Content-Type:MIME-Version:Date; b=IScmHw7mHX1XPjdLwjWrky49yNmlV0YI7qUeyvt0KnTmSc55Mn/HQQ7vlIoWGCS0QbdlwYcPrXzOLViALlbLJANnXWiTcpeq9j67WkhXsdphC5U1zchK67GZPff1+MFvvCCgeGaWTUv2ZdlPTwdRfPZsCaHIwtCzih7D4HO8R0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NAkYuyvq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z0CjphHX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NAkYuyvq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z0CjphHX"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749367689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JD9TmMe0iznkrkP16LJQZtQsRfpnr52w08OltYc0BqI=;
	b=NAkYuyvqnwaE5PmZFk3BeHjZbEbg6vNvPy4zlUE6hhC458OqJTl4kg3x3wPaah+1A/45Rs
	7yaplWOYj6IepSzdgSDZeu73tH8vo8IVzsKEfgUFq71hENugV5GgOyHpTtFCTqNr5KZlkf
	qtFNWkEjOAgVfO1mSaTN8l3LTEQar4DWXfZD/r9j7by6uz2VmsU2nOtJ/xMVVYcYgVG9f7
	Pq9qc2BOOxFIQdsvKp1OE4s4Letr90BeYOL00gBpz6P1bYwdm8tUV8l/nbV3AfG4MjYsRk
	EfKGMbqmjWuizuO12eNWHhv5wZfLwSYWz0gdLlBtMI77jsr87jK/cBLV6971Fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749367689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JD9TmMe0iznkrkP16LJQZtQsRfpnr52w08OltYc0BqI=;
	b=Z0CjphHX9Ij4Dgceq4/sPgGDmkBCaWEq7nUQY7KlkukBacHCqiJ0/pWW6erjbVegn25ciu
	4SuyXdG+TOAyMpBw==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/urgent for v6.16-rc1
Message-ID: <174936764731.749406.17114868218275391074.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun,  8 Jun 2025 09:28:08 +0200 (CEST)

Linus,

please pull the latest irq/urgent branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-=
06-08

up to:  9cc82d99b13c: PCI/MSI: Size device MSI domain with the maximum number=
 of vectors


A single fix for the PCI/MSI code:

  The conversion to per device MSI domains created a MSI domain with size 1
  instead of sizing it to the maximum possible number of MSI interrupts for
  the device. This "worked" as the subsequent allocations resized the
  domain, but the recent change to move the prepare() call into the domain
  creation path broke this works by chance mechanism. Size the domain
  properly at creation time.


Thanks,

	tglx

------------------>
Marc Zyngier (1):
      PCI/MSI: Size device MSI domain with the maximum number of vectors


 drivers/pci/msi/irqdomain.c | 5 +++--
 drivers/pci/msi/msi.c       | 8 ++++----
 drivers/pci/msi/msi.h       | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
index d7ba8795d60f..c05152733993 100644
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -271,6 +271,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev=
, const struct msi_doma
 /**
  * pci_setup_msi_device_domain - Setup a device MSI interrupt domain
  * @pdev:	The PCI device to create the domain on
+ * @hwsize:	The maximum number of MSI vectors
  *
  * Return:
  *  True when:
@@ -287,7 +288,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev=
, const struct msi_doma
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
=20
-	return pci_create_device_domain(pdev, &pci_msi_template, 1);
+	return pci_create_device_domain(pdev, &pci_msi_template, hwsize);
 }
=20
 /**
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index d6ce04054702..6ede55a7c5e6 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -439,16 +439,16 @@ int __pci_enable_msi_range(struct pci_dev *dev, int min=
vec, int maxvec,
 	if (nvec < minvec)
 		return -ENOSPC;
=20
-	if (nvec > maxvec)
-		nvec =3D maxvec;
-
 	rc =3D pci_setup_msi_context(dev);
 	if (rc)
 		return rc;
=20
-	if (!pci_setup_msi_device_domain(dev))
+	if (!pci_setup_msi_device_domain(dev, nvec))
 		return -ENODEV;
=20
+	if (nvec > maxvec)
+		nvec =3D maxvec;
+
 	for (;;) {
 		if (affd) {
 			nvec =3D irq_calc_affinity_vectors(minvec, nvec, affd);
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index fc70b601e942..0b420b319f50 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -107,7 +107,7 @@ enum support_mode {
 };
=20
 bool pci_msi_domain_supports(struct pci_dev *dev, unsigned int feature_mask,=
 enum support_mode mode);
-bool pci_setup_msi_device_domain(struct pci_dev *pdev);
+bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize);
 bool pci_setup_msix_device_domain(struct pci_dev *pdev, unsigned int hwsize);
=20
 /* Legacy (!IRQDOMAIN) fallbacks */

