Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0711917FB;
	Wed, 16 Apr 2025 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809240; cv=none; b=FZtim66VpC1MLGzBOy2IL+XTFIWiuhL1kpV9mWigSdNjCPMj9Rpm9MRqLWGLGmsny3gwR7MmTohFLVomULUe7P6pnXxIs/KPNie+2we2zkU8Lcf5CChHCleJBTfv5K1LETCp3enF3f7N9a1wkv3tDiOCx+XtvFJ3KdWOZlETVQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809240; c=relaxed/simple;
	bh=FnEMqRYiFMAV1GdMr3wF6FFhwxAv75Otz/xx5cRosXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKBevOKp4hazQJz7WRaehAc1aT5WXem+/shFQId/XX0WOiTmW3W/scvNepvCeuLinROKKeInff6ChguTRh8zV+VvpiaydirwUAb/0j93+MPafhQXao4Xaj1TMZkGpJKHOkrleJ660+zY+urff+Z6LLcKNll579HThAMa4ZXbPZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8RlYyxJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8RlYyxJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A94C4CEE2;
	Wed, 16 Apr 2025 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809240;
	bh=FnEMqRYiFMAV1GdMr3wF6FFhwxAv75Otz/xx5cRosXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J8RlYyxJxHyNEvdVYh/ReBTGkdlWaJ4JHdooH/2M06/fiYbuuCGee9ZQZBbg6Hlpi
	 Yg1ja5L36Km/yOqra2dt1bHo+Oiak1UlRp61I2nq2gXRUcH3TpaTLeyAOVqGY8y3+F
	 vzd/Ln8Gdc01iQ4Ew9J+GEAnC5ttYn61dPurYFAgQQuXwJBJdH9ssU2tBRuT4rEzCy
	 62dE9maw/aPFH1igZogy/7X3DdIwBNpIqzmTP2jBoUNkX35dGRE1lsrTuvzLjYpa14
	 UiSrCUZu2y5XlocpwUqnt2PKpfaLwh7R73x2GVs5xEYNpeFxgc/kAgzZRMPj1ztkkL
	 OIQlRCTtg21ow==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Stanner <phasta@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	liujing <liujing@cmss.chinamobile.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH 09/31] ALSA: via82: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:19 +0200
Message-ID: <20250416131241.107903-10-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416131241.107903-1-phasta@kernel.org>
References: <20250416131241.107903-1-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_request_regions() is a hybrid function which becomes managed if
pcim_enable_device() was called before. This hybrid nature is deprecated
and should not be used anymore.

Replace pci_request_regions() with the always-managed function
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/pci/via82xx.c       | 2 +-
 sound/pci/via82xx_modem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 89838b4fb118..a04dbc0a420f 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2326,7 +2326,7 @@ static int snd_via82xx_create(struct snd_card *card,
 	pci_write_config_byte(chip->pci, VIA_FUNC_ENABLE,
 			      chip->old_legacy & ~(VIA_FUNC_ENABLE_SB|VIA_FUNC_ENABLE_FM));
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index a0a49b8d1511..eef0f9ddaae0 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1071,7 +1071,7 @@ static int snd_via82xx_create(struct snd_card *card,
 	chip->pci = pci;
 	chip->irq = -1;
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
-- 
2.48.1

