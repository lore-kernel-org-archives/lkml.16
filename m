Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630BE1C549F;
	Wed, 16 Apr 2025 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809293; cv=none; b=SkTqfXN41IlRPCh/iDoJrGpLnDU8AWEq/Kt6Uvc911lNU2vZagP9eCJtp/KQmayKwUI2j1R8yCSL6loOe+K/XzJswlJBWLAGBmjo7LCIcHCI/yyTBBzU30RFo5SiiXmN6JoiKiDFvc65Gwr/SKzqRqR5IX8NL9ZKS54MEF45bfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809293; c=relaxed/simple;
	bh=jfh/rgkyYgLYVYpSLU74ZhMjevVqoFS/OLY4TIg9dHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NI0I7egclBMlytjZhx4S/iwmjthF+5sEhh8ZaV2yc2IQp+O0exVwmeN61YxJHdJx7Ad+v532mz6BJxPozO7QMVA+RK/Iy3S68L1Vfl2Qu71IN5TlfO3DlXMSFgecaG8ROm/iAqxxP9VQkrt33fhF9CLQDb9VxMz+WKKOtQyhVek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nB9k44Ab; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nB9k44Ab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FBBC4CEEA;
	Wed, 16 Apr 2025 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809293;
	bh=jfh/rgkyYgLYVYpSLU74ZhMjevVqoFS/OLY4TIg9dHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nB9k44Abz/2fsCJUKrABhKrcAla02GVJvVI/zjtdi6L3RAPuJz3fX93pwsfulL+1c
	 NtZbq/ksg0i5KqH9Nh2KWPyDeLZZW9wpCKi05W8wREySKnFOMFFZAGHhiB2Zwpp1Wd
	 77u5WWwMhLxRqSLle6k4zWEIWQDFVtDwZOLKOvxL3lezxF4+Uy4bZnEHtO353xHY2j
	 qao7p+CuBeSprOH++PUHgNOC05ctL3+Q443s5TRx7CHKondg6Sdgb34ScJmAoCbjSE
	 chgOxJEi+51muZXNQtG45FZCIfAtNP23RvmCtV8dwl8Jk60Y8a10ggoyRA1LVIbxm9
	 BdgqgEoghUEAQ==
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
Subject: [PATCH 17/31] ALSA: lx6464es: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:27 +0200
Message-ID: <20250416131241.107903-18-phasta@kernel.org>
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
 sound/pci/lx6464es/lx6464es.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index bd9b6148dd6f..63ebf9803ea8 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -944,7 +944,7 @@ static int snd_lx6464es_create(struct snd_card *card,
 	mutex_init(&chip->setup_mutex);
 
 	/* request resources */
-	err = pci_request_regions(pci, card_name);
+	err = pcim_request_all_regions(pci, card_name);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

