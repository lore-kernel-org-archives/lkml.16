Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0591E8348
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747477821; cv=none; b=hNFny4Sy3wOvDxAMqRbNpPgJP2F5ScsGj/N+MfQ3u5aVlel36GbELRiFDkehgR1MmNumo0fU2k7FHCq1ifgkV0LOV5lqhF02x8G/tgYjW9EKfLjlhIV3sbj6qoMEP2PnEFQf7H1KWVElTpcPx3Jom+j7Cc77J6FriK72reRKBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747477821; c=relaxed/simple;
	bh=NBLuObZypd7FUQ4RdXCGShJPwkbjl+7jqVZyIFp1z0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q1CrGY06aneXOtDGsaOmru4HaT0fdlBUPgESZguAenySV+nZ1L7Zuk64fmnGgeZ9Z8dutKSDX3CttZ9tI8ywT4gpuifHURN50bhKu2fMObfW0xwoQ57CoB9gjCQEmvySieChtkerGdP3UGP86L1x3NVIcEVCpv/pxtJrIvXru1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkRCu/h7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkRCu/h7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E04C4CEE3;
	Sat, 17 May 2025 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747477821;
	bh=NBLuObZypd7FUQ4RdXCGShJPwkbjl+7jqVZyIFp1z0E=;
	h=From:To:Cc:Subject:Date:From;
	b=DkRCu/h7I2WHU4dS2WlSghrYRvnB8JHkuQX9J8+7/4WFH/BhP3xPEBUAgGWe6Uj/5
	 rvnmEBORJY/Uriw0QRh3c9YErEer/VlibqrQoBQHMzyvNGXYbcJe1MfuFMcXmxDtWh
	 ecqi48zUxZXkDm/ROMIvoKbGhU4mEjE4TqlpqYo1eDwx0Gw7kVfPAHdc4CVu72gNEb
	 YuQhM6E+2yBuFpPhvybz3fOrlGY3psq3MIhTO/yyyHMHvkC+JaFKQTRzvsTkt5zgUb
	 pl0eCI64BsBYAmXhU6mSvzZvv/Uczwlxdgri/FWfSEsdZzEym+BPjobnKw7iH+VV3x
	 QnfQJHyYYwZkg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uGEo6-00Fmrq-MV;
	Sat, 17 May 2025 11:30:19 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] irqchip/msi-lib: Honor the MSI_FLAG_PCI_MSI_MASK_PARENT flag
Date: Sat, 17 May 2025 11:30:11 +0100
Message-Id: <20250517103011.2573288-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

For systems that implement interrupt masking at the interrupt
controller level, the MSI library offers MSI_FLAG_PCI_MSI_MASK_PARENT.
It indicates that it isn't enough to only unmask the interrupt at the PCI
device level, but that the interrupt controller must also be involved.

However, the way this is currently done is less than optimal, as the
masking/unmasking is done on both side, always. It would be far cheaper
to unmask both at the start of times, and then only deal with the
interrupt controller mask, which is likely to be cheaper than a round-trip
to the endpoint.

Implement this by patching up the irq_chip structure associated with
the MSIs to perform the full unmask on .irq_enable(), and the full mask
on .irq_shutdown(). This asymmetry allows the preservation of the
"lazy disable" feature, which relies on the top-level irq_chip not
implementing the .irq_disable() callback. Yes, this is a terrible hack.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-msi-lib.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 246c30205af40..8c62034ab8d92 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -112,6 +112,21 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	 */
 	if (!chip->irq_set_affinity && !(info->flags & MSI_FLAG_NO_AFFINITY))
 		chip->irq_set_affinity = msi_domain_set_affinity;
+
+	/*
+	 * If the parent domain insists on being in charge of masking, obey
+	 * blindly. The default mask/unmask become the shutdown/enable
+	 * callbacks, ensuring that we correctly start/stop the interrupt.
+ 	 * We make a point in not using the irq_disable() in order to
+	 * preserve the "lazy disable" behaviour.
+	 */
+	if (info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT) {
+		chip->irq_shutdown	= chip->irq_mask;
+		chip->irq_enable	= chip->irq_unmask;
+		chip->irq_mask		= irq_chip_mask_parent;
+		chip->irq_unmask	= irq_chip_unmask_parent;
+	}
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(msi_lib_init_dev_msi_info);
-- 
2.39.2

