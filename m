Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6033F33FD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881351; cv=none; b=JP/rbuxx7vWNESSjA1T+GV5mfl8rS5M2xgoqUAREprhu6fVgJOgIs4dRJ70N/x7xMgljWwS/WTJ458aWtivTnh4NbhAw7JDHrj2NyMdkXvWagGlgFE85hymInbarQO1mg5XVBUcLwkZ8QA02/dSfJt8GCqnCR0g6+pf9HlFvdkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881351; c=relaxed/simple;
	bh=Wh1rntBo/7Kj0BaXQsAlsvwKGLep8F7aMQhIyJwLwH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eX5RhFvdun4xhZ+oySDWD5sXCR+rG0ckGv9XzCt6SjWmMA4UmfvGvbSnh0xOQ86ONpvK/c3ySpzsD0uazqfCoiDsWBvtZathUJAmjsKTgdhdaGgDQclhub610NODjAPBnsLenfv1n26OHabPxcNEmtIkI2Kr1mLpHkvT+pn3mEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhojJtsA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhojJtsA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849F2C4CEE4;
	Thu, 17 Apr 2025 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744881350;
	bh=Wh1rntBo/7Kj0BaXQsAlsvwKGLep8F7aMQhIyJwLwH0=;
	h=From:To:Cc:Subject:Date:From;
	b=HhojJtsA2xP33puhQkUFP4pjtN5CcBnanw9BnqAcif6La6UAlCf8teSJ0FbFAHH5S
	 CwT/7wpUUAU2pvuSEOpUPXfrF0Gaj7YiQb+zhqz7q5VGbBpmWe1wCpc0iDDQyIPmfD
	 HcP/jGEEutw4+NQgPX6lrkT3qpTpqG1V/QpLB9MkOikBb99EsF013rRCkJG3U2FOKo
	 vVf+xiZpPViyTSQOkL0dWkxZpmsbYj+PoTTsRpcMMZI/fXEEvAWtTIYYEcdn5nB/t0
	 1DNd2gx+8P3xu4YZauCGMgCYCpQZ5zeaHz/5FYI3Wipm2ltlGphJH9q/B6VdQJfLK7
	 kbfVE4EjVaO4A==
From: Philipp Stanner <phasta@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Stanner <phasta@kernel.org>,
	Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] misc: cardreader: Use non-hybrid PCI devres API
Date: Thu, 17 Apr 2025 11:15:32 +0200
Message-ID: <20250417091532.26520-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cardreader enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Moreover, since both functions are already managed in this driver, the
calls to pci_release_regions() are unnecessary.

Remove the calls to pci_release_regions().

Replace the call to sometimes-managed pci_request_regions() with one to
the always-managed pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/misc/cardreader/alcor_pci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/cardreader/alcor_pci.c b/drivers/misc/cardreader/alcor_pci.c
index a5549eaf52d0..43f08b0db742 100644
--- a/drivers/misc/cardreader/alcor_pci.c
+++ b/drivers/misc/cardreader/alcor_pci.c
@@ -121,7 +121,7 @@ static int alcor_pci_probe(struct pci_dev *pdev,
 	priv->cfg = cfg;
 	priv->irq = pdev->irq;
 
-	ret = pci_request_regions(pdev, DRV_NAME_ALCOR_PCI);
+	ret = pcim_request_all_regions(pdev, DRV_NAME_ALCOR_PCI);
 	if (ret) {
 		dev_err(&pdev->dev, "Cannot request region\n");
 		ret = -ENOMEM;
@@ -131,13 +131,13 @@ static int alcor_pci_probe(struct pci_dev *pdev,
 	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM)) {
 		dev_err(&pdev->dev, "BAR %d is not iomem. Aborting.\n", bar);
 		ret = -ENODEV;
-		goto error_release_regions;
+		goto error_free_ida;
 	}
 
 	priv->iobase = pcim_iomap(pdev, bar, 0);
 	if (!priv->iobase) {
 		ret = -ENOMEM;
-		goto error_release_regions;
+		goto error_free_ida;
 	}
 
 	/* make sure irqs are disabled */
@@ -147,7 +147,7 @@ static int alcor_pci_probe(struct pci_dev *pdev,
 	ret = dma_set_mask_and_coherent(priv->dev, AU6601_SDMA_MASK);
 	if (ret) {
 		dev_err(priv->dev, "Failed to set DMA mask\n");
-		goto error_release_regions;
+		goto error_free_ida;
 	}
 
 	pci_set_master(pdev);
@@ -169,8 +169,6 @@ static int alcor_pci_probe(struct pci_dev *pdev,
 error_clear_drvdata:
 	pci_clear_master(pdev);
 	pci_set_drvdata(pdev, NULL);
-error_release_regions:
-	pci_release_regions(pdev);
 error_free_ida:
 	ida_free(&alcor_pci_idr, priv->id);
 	return ret;
@@ -186,7 +184,6 @@ static void alcor_pci_remove(struct pci_dev *pdev)
 
 	ida_free(&alcor_pci_idr, priv->id);
 
-	pci_release_regions(pdev);
 	pci_clear_master(pdev);
 	pci_set_drvdata(pdev, NULL);
 }
-- 
2.48.1

