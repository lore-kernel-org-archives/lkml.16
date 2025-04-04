Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B411EEA33;
	Fri,  4 Apr 2025 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769231; cv=none; b=fEdzHXmIl50bMQjH44tXP/OQw5B5j3uGLqLAs6MOYA0Eq+PUtDRbOB4JGNiE4dwtVF8WYsX6klBzwh34k5xLgyCXW7SVKoeCtrFLCA0h7+wTrjKxLYeuHMGL4iQcHHQeHJbfkTiktmhFxXTLQfbfJWlYX38vLgNjFrSygQ8Wq+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769231; c=relaxed/simple;
	bh=hB8g06LHusju5aaSslcMI2Vmp9YyRR3BB0OcFs0BMkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lX8s78g51Z3xUjNL3/NRnRjZ67XzepsRCEIjVCeB6AWLNEeOw0faznx3oYBXWcoTj8gNs85Cvisb15XMoLCB1N2N43gD/OqZLpzkKTd3QT0AoIOzebj59mABtreqL/e6u9aqVze0Yj1dNCZK0jOpDLfYjyOCyRBnJW411ZRcCv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjbdX148; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjbdX148"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC5EC4CEDD;
	Fri,  4 Apr 2025 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769230;
	bh=hB8g06LHusju5aaSslcMI2Vmp9YyRR3BB0OcFs0BMkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DjbdX148Bl2eCI6bf9kX4v8EgXT2tJ/yA43dmcUsRp2j2MTp0ZWsbT81X8KknAZG6
	 KgQrvt3K5im/Dtygesji+p5dRphOhfSkQDCjpHO3ou4DjKa0AL8N6OurJIr2jJgzNJ
	 yAakodZl6QDHLqn1x6RfwV34+1Pc0eV8/Wri5haHvowd+zf1kg0Q4x/Aojs390SffF
	 pSM9AeR6ljvsk/0DQZ/TkkrX6s8BwWwWj3L8+WaUNxTK1TD1kYG2V2jrsIYEStKhp+
	 qixweR2Kxz9Q+eSArQ6h7kaStsTSKPHtkbhB8DgtngEtGuMe0hIHpslFghf5B4t60l
	 bYGEiugosak/Q==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Philipp Stanner <phasta@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	He Lugang <helugang@uniontech.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] ASoC: loongson: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:12 +0200
Message-ID: <20250404121911.85277-13-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250404121911.85277-2-phasta@kernel.org>
References: <20250404121911.85277-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions() have been deprecated.
Replace them with pcim_iomap_region().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/soc/loongson/loongson_i2s_pci.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index d2d0e5d8cac9..1ea5501a97f8 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -16,6 +16,8 @@
 #include "loongson_i2s.h"
 #include "loongson_dma.h"
 
+#define DRIVER_NAME "loongson-i2s-pci"
+
 static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -92,13 +94,12 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 	i2s->dev = dev;
 	pci_set_drvdata(pdev, i2s);
 
-	ret = pcim_iomap_regions(pdev, 1 << 0, dev_name(dev));
-	if (ret < 0) {
-		dev_err(dev, "iomap_regions failed\n");
-		return ret;
+	i2s->reg_base = pcim_iomap_region(pdev, 0, DRIVER_NAME);
+	if (IS_ERR(i2s->reg_base)) {
+		dev_err(dev, "iomap_region failed\n");
+		return PTR_ERR(i2s->reg_base);
 	}
 
-	i2s->reg_base = pcim_iomap_table(pdev)[0];
 	i2s->regmap = devm_regmap_init_mmio(dev, i2s->reg_base,
 					    &loongson_i2s_regmap_config);
 	if (IS_ERR(i2s->regmap))
@@ -147,7 +148,7 @@ static const struct pci_device_id loongson_i2s_ids[] = {
 MODULE_DEVICE_TABLE(pci, loongson_i2s_ids);
 
 static struct pci_driver loongson_i2s_driver = {
-	.name = "loongson-i2s-pci",
+	.name = DRIVER_NAME,
 	.id_table = loongson_i2s_ids,
 	.probe = loongson_i2s_pci_probe,
 	.driver = {
-- 
2.48.1

