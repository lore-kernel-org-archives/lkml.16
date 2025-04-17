Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9DE1B87D7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882498; cv=none; b=m6r3Z2/3FblmWchr0fsa9V6IX3njVvV406pcHXyGmUtczCNMh9gd4JBlwxQdsYz4WrGD0ipuI1rjg94uKq74nHyKCCC9/S7L9ky/7tpSjs5uey9aaw36jM6pf4ai01Z8wFfxFzCl/DXup2bptwIZbvUTXzO+spxPbIQrtnnharE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882498; c=relaxed/simple;
	bh=SLuUfDIO7cZe92f/PvJjXwcgVz9jB9iB3ae1mxy5siQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cISN19fOCYpYbF6FnDD4UGR1Kh/LO0vPYp2UrKwHKlz6r3pJRnLmQggE5Ta1clmy2BuRhoUET36GZLioZv81TIqUOoR18pUiKFBHPCZP8NoHaZBr0YG/nF1vXpyAR5CUIYyGFyZMIuQy3B9heQ8OsX8BnfRabIPOSzyKDLExwGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2OdS8bS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2OdS8bS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6F3C4CEE4;
	Thu, 17 Apr 2025 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744882496;
	bh=SLuUfDIO7cZe92f/PvJjXwcgVz9jB9iB3ae1mxy5siQ=;
	h=From:To:Cc:Subject:Date:From;
	b=E2OdS8bSDxd5VSj9ScQQOgsRSBzc2FyB1mUrToGDK9cXd8p7EPd3vMQEITpnJCEiJ
	 87GzxIneRIS8LrLmhspkNF4Uim1sv6No7eLB053OS5y5pbQWVYELeJHODRx9zIm6la
	 SF7Mwg84GQkPhGTrurAQM0ntEusher9uOjBy31JDDoUfu/5gujv6WOeNIhoVDoKiyX
	 1yU0jOiE8jxCtqpawqMQnyN7vPjdGIBf+HdoDhsNzWvqVkIHlqnndfevspYbZH//29
	 gNw+bRJanl+P8HroROu8fFwGvfg5QG7R82RNbi+9/d48NvgNE8fei7Xyj1pGQVKyrn
	 hmeaZAf0HQg1g==
From: Philipp Stanner <phasta@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Philipp Stanner <phasta@kernel.org>,
	Chen Ridong <chenridong@huawei.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Use non-hybrid PCI devres API
Date: Thu, 17 Apr 2025 11:34:29 +0200
Message-ID: <20250417093428.28571-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

denali_pci.c enables a PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Moreover, since both functions are already managed in this driver, the
calls to pci_release_regions() are unnecessary.

Remove the calls to pci_release_regions().

Replace the call to sometimes-managed pci_request_regions() with one to
the always-managed pcim_request_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/mtd/nand/raw/denali_pci.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index e22094e39546..97fa32d73441 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -68,7 +68,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->clk_rate = 50000000;		/* 50 MHz */
 	denali->clk_x_rate = 200000000;		/* 200 MHz */
 
-	ret = pci_request_regions(dev, DENALI_NAND_NAME);
+	ret = pcim_request_all_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
 		dev_err(&dev->dev, "Spectra: Unable to request memory regions\n");
 		return ret;
@@ -77,20 +77,18 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->reg = devm_ioremap(denali->dev, csr_base, csr_len);
 	if (!denali->reg) {
 		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
-		ret = -ENOMEM;
-		goto regions_release;
+		return -ENOMEM;
 	}
 
 	denali->host = devm_ioremap(denali->dev, mem_base, mem_len);
 	if (!denali->host) {
 		dev_err(&dev->dev, "Spectra: ioremap failed!");
-		ret = -ENOMEM;
-		goto regions_release;
+		return -ENOMEM;
 	}
 
 	ret = denali_init(denali);
 	if (ret)
-		goto regions_release;
+		return ret;
 
 	nsels = denali->nbanks;
 
@@ -118,8 +116,6 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 out_remove_denali:
 	denali_remove(denali);
-regions_release:
-	pci_release_regions(dev);
 	return ret;
 }
 
@@ -127,7 +123,6 @@ static void denali_pci_remove(struct pci_dev *dev)
 {
 	struct denali_controller *denali = pci_get_drvdata(dev);
 
-	pci_release_regions(dev);
 	denali_remove(denali);
 }
 
-- 
2.48.1

