Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8C1DB363;
	Fri,  4 Apr 2025 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769221; cv=none; b=fycUoyCJpF4h6Pkf27vccImw8YVCUtOZh4UI35KE5gj7697E9H9eOC/SNs42VCeUOk0AXFx/VqcOrW4BkMFemYlbKnCja2isnZ5In+G3ukr3OuPyzVacjffcrjzD7F07jYjGvowZ2dvChcFnLlOE53ohJxaw4keDmZaaV5VcOSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769221; c=relaxed/simple;
	bh=U3zc9rq5pOtG91hVcTj9KfcFGn45wA/PUYfioMJ8Z5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JesB393t+PMKkHGcMU4cRbWxFgmG/OqBaYN0Q7wpXgU1Nu4H9a7eXbhAWFY7g9ovgCLkXa/z84b8FvdVTxYQYFZEgO3MK93SKPk2HX45jHvp2atUzkfld+0ObtDtzWt2DZbe/wAfoJANANa7E4pQJkzYFJeieXQVbV2O3sEh3rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzzw0M1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzzw0M1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654E3C4CEDD;
	Fri,  4 Apr 2025 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769220;
	bh=U3zc9rq5pOtG91hVcTj9KfcFGn45wA/PUYfioMJ8Z5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uzzw0M1NUKuYFC2zKR28bX/AUW4T9+8vnjzHkRNBj585r+lkrU4x+pxl+InrCuMTn
	 b03wVpREaaYZDZnDySvijkGxyS9hpekq3lCUSbXdFVHXB8QUEv0CmevA8JC1QU6pTr
	 MpUZ7k9r8BSkYWZGRBrkF7bPvLsIak9+RfIClp8hLv33OSioJTjwwU5o0g5UkLRk+z
	 MadOvH3pI1FpiL9KuKjJlCS5N8kNZlRPmClPvq2gXEEa9+qIPliROqDoFI9NMOMUe0
	 /UvE7vpzKumbed/ATZV4URqMdsnCUGqjUHDVWS2+aGPqMmzo0mRsNHVpT6ev1S9MlG
	 xHSCBFHdIUD8Q==
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
Subject: [PATCH 09/11] ALSA: lola: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:10 +0200
Message-ID: <20250404121911.85277-11-phasta@kernel.org>
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
 sound/pci/lola/lola.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index 1aa30e90b86a..fb8bd54e4c2d 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -541,6 +541,7 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
 	struct lola *chip = card->private_data;
 	int err;
 	unsigned int dever;
+	void __iomem *iomem;
 
 	err = pcim_enable_device(pci);
 	if (err < 0)
@@ -580,14 +581,19 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
 		chip->sample_rate_min = 16000;
 	}
 
-	err = pcim_iomap_regions(pci, (1 << 0) | (1 << 2), DRVNAME);
-	if (err < 0)
-		return err;
+	iomem = pcim_iomap_region(pci, 0, DRVNAME);
+	if (IS_ERR(iomem))
+		return PTR_ERR(iomem);
 
+	chip->bar[0].remap_addr = iomem;
 	chip->bar[0].addr = pci_resource_start(pci, 0);
-	chip->bar[0].remap_addr = pcim_iomap_table(pci)[0];
+
+	iomem = pcim_iomap_region(pci, 2, DRVNAME);
+	if (IS_ERR(iomem))
+		return PTR_ERR(iomem);
+
+	chip->bar[1].remap_addr = iomem;
 	chip->bar[1].addr = pci_resource_start(pci, 2);
-	chip->bar[1].remap_addr = pcim_iomap_table(pci)[2];
 
 	pci_set_master(pci);
 
-- 
2.48.1

