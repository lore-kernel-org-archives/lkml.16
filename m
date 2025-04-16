Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883E1B87E9;
	Wed, 16 Apr 2025 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809348; cv=none; b=JOA0MoARlFHcMjp2dAYaY5KlYm9NW/Jfm8SG8m0RJUQ/MM0wSBt4fk4kzdmMRUE0WW5KWuK/z9xP5yZHfk4yLedRJ8PEmBLEFIoYDCqd3KSkm+AGHD+Ims0cm+RSiyXPSOnJ0F+m8qbqB8ru7eX68FcFPjB9DITHCQ0QUhn5GVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809348; c=relaxed/simple;
	bh=iXdTAtJQtpcN9zUld6JFKxksCs/qSYpviliT5HIKv6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nh6E1/0jDZ/1Mr1P/S6MSzkJs2JqQJj25qggAmr62fu6S1c7vTRR38EYN7mbkFn8Z3r2KsJEc8wgEB1QT1ROGwVlxn+m6W+WQdKcxCtW16h6D4Jno8CHCueXE8hfVIHJtC/PPizFI5gjVOCGJE9+F4kb4jZQelIVV0YWN9v8GNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/Hy/XDJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/Hy/XDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EE1C4CEE2;
	Wed, 16 Apr 2025 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809347;
	bh=iXdTAtJQtpcN9zUld6JFKxksCs/qSYpviliT5HIKv6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W/Hy/XDJS2qvbCHELBFoQo/BiHs5RDm2KnvM6nOvGL2icDNVi5GEycKVUEOFyBjHZ
	 nILT+K5dKV8WBbXzj+eHP/yt9E6aaWE2LQUlI67conZKnAyx80tHCAOetq/lem8fBy
	 EP9fhDNeZZv3JAPVDhr2Juc7GXYBVkl1xHcUKA+fINqkz8aEAgVOtqUHiLZGQjW3PX
	 G0kXX6YtuaJSGiHLbsZ6dWE5oKc3E0vjKRW26a5w54czbzz7cSU+sXGQGv8w2MYs/y
	 oMhz4OdQBzC44oBDg0YanmVxgo3XfcpJXEs12rZ1Vvv/81NyvEOFje6rxnZDlLmDhQ
	 asJ8u6s8TrFZw==
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
Subject: [PATCH 25/31] ALSA: emu10k1: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:35 +0200
Message-ID: <20250416131241.107903-26-phasta@kernel.org>
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
 sound/pci/emu10k1/emu10k1_main.c | 2 +-
 sound/pci/emu10k1/emu10k1x.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 5b8a5ba825bd..bbe252b8916c 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1563,7 +1563,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	else
 		emu->gpr_base = FXGPREGBASE;
 
-	err = pci_request_regions(pci, "EMU10K1");
+	err = pcim_request_all_regions(pci, "EMU10K1");
 	if (err < 0)
 		return err;
 	emu->port = pci_resource_start(pci, 0);
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 89043392f3ec..30ac37b5a214 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -884,7 +884,7 @@ static int snd_emu10k1x_create(struct snd_card *card,
 	spin_lock_init(&chip->emu_lock);
 	spin_lock_init(&chip->voice_lock);
   
-	err = pci_request_regions(pci, "EMU10K1X");
+	err = pcim_request_all_regions(pci, "EMU10K1X");
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
-- 
2.48.1

