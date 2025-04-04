Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF101D63C6;
	Fri,  4 Apr 2025 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769191; cv=none; b=h2KP6LS8ZCrZMzcSgL9TkhXyVimVmlSMhN0pq33/guF2bU46TxUej+t9Wqt1Bpdzb8RYhmeNBgTSDyK81NxXOc2yx7SKpCBGTqg206aaQJpDy6gFoluJ4K8FdrQcIFM4pG0gK9gqGMdwCAvSB5GNj9VK1hTguEmSYJDgXJBkPeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769191; c=relaxed/simple;
	bh=UR3ylbPrlD4cM/qSwpFRclhvsbIYwavOMBZoW3VPel4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJjlmreCzujSYar3vgC5DYaldANVBGdnrTxINRILUi6dgOpGC9Mk01dCwGBt99BQRtYErvbXPv6wOE73zR5ClTnylibHZTvRIYLP03UC+M1BzeicQJPsDxrDh8hgFRDKn6XYdduYiDkV4iimJoNLUsf6XUXdYjWvt46zgJh0/GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fE4wENMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fE4wENMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE49C4CEE8;
	Fri,  4 Apr 2025 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769191;
	bh=UR3ylbPrlD4cM/qSwpFRclhvsbIYwavOMBZoW3VPel4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fE4wENMcITVzxCH75HC/qLpduG1fCJWwgUga+WxnK112Nbj5RfNoA+aXxOXjx2uSq
	 N+LMD//9RfrL6ddt3Da5k76Y/OIc0IgoZeXyhhgWh4Vkf2PRO/dSpbQfzGWUby/Kpi
	 v4+ETEbuDHeQI/Dw7FERe4UEego/iMUr/YPETAFR6p8KfGPoitZNCPT14D188LYprV
	 bqNh733zvfXMOmiO8tZemYf0OOBol8sDTOm+jU7i6EvDkf3ilUke72tjrzZzz21RnI
	 DLpxBH4R0TNAdaIRWMia2WWXnI5+zv2ar/JuAyraRqHEkPdJop7b9mfBna4LNSj60/
	 CGYh4p66LGw+Q==
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
Subject: [PATCH 03/11] ALSA: au88x0: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:04 +0200
Message-ID: <20250404121911.85277-5-phasta@kernel.org>
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

Additionally, the "name" parameter of pcim_iomap_region() should reflect
the driver's, not the hardware's, name. Pass the correct parameter.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/pci/au88x0/au88x0.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index 62b10b0e07b1..fd986247331a 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -160,12 +160,11 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci)
 	// (1) PCI resource allocation
 	// Get MMIO area
 	//
-	err = pcim_iomap_regions(pci, 1 << 0, CARD_NAME_SHORT);
-	if (err)
-		return err;
+	chip->mmio = pcim_iomap_region(pci, 0, KBUILD_MODNAME);
+	if (IS_ERR(chip->mmio))
+		return PTR_ERR(chip->mmio);
 
 	chip->io = pci_resource_start(pci, 0);
-	chip->mmio = pcim_iomap_table(pci)[0];
 
 	/* Init audio core.
 	 * This must be done before we do request_irq otherwise we can get spurious
-- 
2.48.1

