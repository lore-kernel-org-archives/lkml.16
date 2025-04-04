Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F71E1DE2;
	Fri,  4 Apr 2025 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769206; cv=none; b=lKOy21HeIMXZRqWzD/stwAlYs07pKDoBlkhsra8sB1IkpPTT/1jGEUkG87OpIRh+sc8JNnFngGY/p0A+IKszL9UdtrMcZslFfkeYp1NBdYOpHGmfD0+QXDotklBRFrY0p+XsMjrHA+DPhreCb+Y5GIfaQnJFeZdpcDVlpN9ZNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769206; c=relaxed/simple;
	bh=ndrksRo2ox0HIaNBeEqWGrf6BJJ+FtpPlqysCXniRm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6lViCo6CRL7gLURVi/MTI5cYCjNBLyv8urLNSNlz00si0HLOTzvV56k792eVaLL+PuHe6kn/RsLhj2rjtWb/0+3WRxOduOvTIL/XLaIyJHzHbruTFSL6PDr+oFMRN+EU4q6KL9GBuVEf5CP+PyXo2BMT711f/Q1CbD/MiSOoFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2LdLJOt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2LdLJOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A3CC4CEE9;
	Fri,  4 Apr 2025 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769205;
	bh=ndrksRo2ox0HIaNBeEqWGrf6BJJ+FtpPlqysCXniRm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2LdLJOtuE/yG6JZukzaOejnSfSeFdlVTsF0lMWkSoGYivNhxs5a4bVXY1/VabsBJ
	 69gX8Rz/KDGBZK7t31tOP79WTVcObwB88lSXNulIeAlDcVTVjTYu/ONWbbmxOAhM2i
	 LrZXIdXbIZLHidbUyq8PIepxZpnnBqWRHalaeqn9nrc+/anvIIqBQ7tsrp+1+lAwty
	 27hVl18JoLbRMgC3ybGWNX3IHbyEFUHcZspWjRJ7hz5TBd/QPtFMZ/bDOkEl78/ekF
	 qIBAJdcogeOhUYv8LYmUHoQMKnb8YtAWOXNCWWGqhulINjQDQyD+3zdeVBVxvQrrw1
	 KIDrz06DZTUmA==
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
Subject: [PATCH 06/11] ALSA: cs4281: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:07 +0200
Message-ID: <20250404121911.85277-8-phasta@kernel.org>
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
 sound/pci/cs4281.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 0cc86e73cc62..90958a422b75 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1302,14 +1302,15 @@ static int snd_cs4281_create(struct snd_card *card,
 	}
 	chip->dual_codec = dual_codec;
 
-	err = pcim_iomap_regions(pci, 0x03, "CS4281"); /* 2 BARs */
-	if (err < 0)
-		return err;
+	chip->ba0 = pcim_iomap_region(pci, 0, "CS4281");
+	if (IS_ERR(chip->ba0))
+		return PTR_ERR(chip->ba0);
 	chip->ba0_addr = pci_resource_start(pci, 0);
-	chip->ba1_addr = pci_resource_start(pci, 1);
 
-	chip->ba0 = pcim_iomap_table(pci)[0];
-	chip->ba1 = pcim_iomap_table(pci)[1];
+	chip->ba1 = pcim_iomap_region(pci, 1, "CS4281");
+	if (IS_ERR(chip->ba1))
+		return PTR_ERR(chip->ba1);
+	chip->ba1_addr = pci_resource_start(pci, 1);
 	
 	if (devm_request_irq(&pci->dev, pci->irq, snd_cs4281_interrupt,
 			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
-- 
2.48.1

