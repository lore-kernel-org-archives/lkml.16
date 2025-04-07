Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816F22A4FC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010870; cv=none; b=WiHR4/SlpAasskNFolg4iWEDE9y8WiMQPtIAgwF1eYNV6A3QYTI4TL/H1h97mYlYgoK9dSW14Opaw/kfTRmCeI55hBmQZdPzo2+5DihRPg/8zBrjbyfOmWWjk2fVROQXbGoSFJbVq+QZBN6bQJ0QSBS7MT8wA4nCBwXX0Xa+llw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010870; c=relaxed/simple;
	bh=R1GWFoYuoKhtrKRR83vBYR9KoCi0p9VDekqu42J5Cps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sKRlwW2C5T8tbA2NBQLAQ5l1pT7Ega0gzVZvn+AzHfFVdFYcrR73VEhEfX04nN9R6n+6wj06RGEnKLgvjCZ4iooq2itoXKKT6uCzlneUc7FQ2TiAemd4Sqd7PYD/6KG7vKpYoFk9O3CpDiHUL1xmEJYophP6SxZVngHBvD7VCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAqQ7o68; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAqQ7o68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD250C4CEDD;
	Mon,  7 Apr 2025 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744010869;
	bh=R1GWFoYuoKhtrKRR83vBYR9KoCi0p9VDekqu42J5Cps=;
	h=From:To:Cc:Subject:Date:From;
	b=TAqQ7o68O0x+FZ0U221QbKnNfxIVtuJSPMzjCpWCK+2Zk+NF+DcE3985Wnk2rAFfF
	 kZVbxdSq68ljoZyTfUbl3aSUcUj/+Orz6LU3nP9NPU5E75m/nB/MoHbcSfXkvJX4O0
	 r37NmgaaDDI2k0rp2g18TiqsJkFXGlWuh/NjTCBJT6s6MRJ6jLMma4o0HDFG/eZPIZ
	 AhBSNVwLE8WJjlKfArX+/u+85RqEqMCGyOUv0XzFz3NxHPMSg7qAKltOQTWtZZWw5i
	 wmOgXV3N/uyJPf1NRNkfyWHZW0y+RddW9+4dFyPLcmEXjGQGh7bXUgTqAxhC6FXpgv
	 KfVoXAYNNW4pg==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: spi-qpic: fix common module build
Date: Mon,  7 Apr 2025 09:27:14 +0200
Message-Id: <20250407072745.186831-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When the NAND driver is a loadable module, and the SPI driver is
turned off, the common part is not built:

ERROR: modpost: "qcom_nandc_unalloc" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_write_reg_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_read_reg_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_nandc_dev_to_mem" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_nandc_alloc" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_submit_descs" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_clear_read_regs" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_clear_bam_transaction" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_read_data_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_write_data_dma" [drivers/spi/spi-qpic-snand.ko] undefined!

Simplify the Makefile to just build the common bits for either of the two,
so it will be built-in whenever one of them is, or otherwise a loadable
module if needed.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index db516a45f0c5..44913ff1bf12 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -3,11 +3,8 @@
 nandcore-objs := core.o bbt.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 obj-$(CONFIG_MTD_NAND_ECC_MEDIATEK) += ecc-mtk.o
-ifeq ($(CONFIG_SPI_QPIC_SNAND),y)
 obj-$(CONFIG_SPI_QPIC_SNAND) += qpic_common.o
-else
 obj-$(CONFIG_MTD_NAND_QCOM) += qpic_common.o
-endif
 obj-y	+= onenand/
 obj-y	+= raw/
 obj-y	+= spi/
-- 
2.39.5

