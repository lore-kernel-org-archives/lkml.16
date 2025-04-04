Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C21A1E5208;
	Fri,  4 Apr 2025 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769196; cv=none; b=lacn9eLW3RsWJ4nEGtWRFC/Wc0S87CtbGenWFmZkCyAIFB/VSnNkdO+3prNooN+wdyHlkMdWIl9hgzqhcNwf/x8YJv6Mv3iXCmAytIqFXOLwUyw8NcsxsvUzQvRBFNVpJyyz/M3nDuO187Os9ZxRHEHKyP7YROY2/lwZumEmWkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769196; c=relaxed/simple;
	bh=5MtsGFO1uLYdoKplUaByypeIPvxuioAjCAgT39QIDJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtlDBvZm1MXA+A/IOvtluwIlBce9YawsTcIiV/sj+r3tkbcZTeGttRxLaYeY8w0hKuRua3wMAoCgpntuFlMOyQv4wIkHT+FCCfosWzVwFlIOlOyi6T0+6p/QlO/7pJ8a0Tpr5u1Ega8J2W6k1lt1zFCDF0mJktM5yO/P59nT5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXUTh9WY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXUTh9WY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73163C4CEDD;
	Fri,  4 Apr 2025 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769196;
	bh=5MtsGFO1uLYdoKplUaByypeIPvxuioAjCAgT39QIDJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CXUTh9WYJifgQXv7zWNhKpI3sFIMk/uyhAXiMegQnEzYeuS/f1MpzWHwfx0MWs38C
	 nm5bAF/l1vO8D3x/16Hv/sEpNvYKzKnQAEfllV5OeEzYT9zTeuIvoETuutN/GRHGMv
	 hUdyktg/xb/2G0YVtfH+S+v3r3s720/5P9QOvTVeN0Hx6e5eP7uUwW0jcNkVWhGhx0
	 GafMrSb39ijZO3fPWTK5Lok/hB+S7XyQTTcsXUpHoG9rTLZp5Z1KmHljEBgWdjJKy8
	 /GfDnWfXO+fRs+S28Kridzqbg49NIC3KrmAORXoVQsdI75egDkNSFKXhsbt4ljbEC1
	 EqCMYl6mefWFA==
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
Subject: [PATCH 04/11] ALSA: aw2: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:05 +0200
Message-ID: <20250404121911.85277-6-phasta@kernel.org>
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
 sound/pci/aw2/aw2-alsa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index 29a4bcdec237..7b4b8f785517 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -225,11 +225,10 @@ static int snd_aw2_create(struct snd_card *card,
 	chip->irq = -1;
 
 	/* (1) PCI resource allocation */
-	err = pcim_iomap_regions(pci, 1 << 0, "Audiowerk2");
-	if (err < 0)
-		return err;
+	chip->iobase_virt = pcim_iomap_region(pci, 0, "Audiowerk2");
+	if (IS_ERR(chip->iobase_virt))
+		return PTR_ERR(chip->iobase_virt);
 	chip->iobase_phys = pci_resource_start(pci, 0);
-	chip->iobase_virt = pcim_iomap_table(pci)[0];
 
 	/* (2) initialization of the chip hardware */
 	snd_aw2_saa7146_setup(&chip->saa7146, chip->iobase_virt);
-- 
2.48.1

