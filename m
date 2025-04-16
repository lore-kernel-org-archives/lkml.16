Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04A1ADC97;
	Wed, 16 Apr 2025 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809300; cv=none; b=o+z5yZ0biaWFB+vYTnshLHRC36o+8QPbLtYuxFCMZLqn5sbLFIvn/kaUJApzeATP0rKrEHn9LrbjTvRUIMIOfRKvwSW4i3bXKJOTMkLp9AnZUyZazaZqkomAH5WCHyqJBsF4rnvfsao5URIfTXiZ8KxVIG3ou//TYeJh5mU3vq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809300; c=relaxed/simple;
	bh=VGELUWs8As/TYPeMJFc3J77+Cxloy7yeuDkhnGcmYoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhCvLzcZEJsBUmoINEOsmYUU218KZhJ9hd9wSRAovyKJV3BHMAWMjYFpuH6LoyhCGDTdbwiddoBJi5HP/U0L+Z2C8GBG+7mxuTj97DulgpHfcKK5FFu5Uh/EtoQptYDCXYX6R3QD5L33CSbCe/622xg7CY01/ZRU6MeaWCQbYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ek6/qo47; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ek6/qo47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F43C4CEE2;
	Wed, 16 Apr 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809300;
	bh=VGELUWs8As/TYPeMJFc3J77+Cxloy7yeuDkhnGcmYoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ek6/qo47P73Y+NWfeewFi6ig2o3OCVxxo4GPJWZtjdq4EjxO4Tk3YjcYGR+P0SZ9R
	 H0q+Ek/W6bo0PK2vtRcuGzoaIBrmd1aHDu2ZOfK4//B0feKYgguTVLIsvSECzUjcms
	 LSx4aQ45XDKjFXijLSzkSkzyfs9sN026DitPUF4bU/zSGJFnQMF+3QolfKoY6INGnx
	 BKOXweEYKI8/5BHrjB/yv8HMcLrWxVkPTalKXZ+D1shg+TsjZ1iUhC1oi6k4OcTmQK
	 KLwlAhImtaxnB//SvgXznxlhWhitUpvWOoU69vUSpM8JQrQ6YfqddQF0djvIuGFUQH
	 UH2Ml2qWdslJw==
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
Subject: [PATCH 18/31] ALSA: vx222: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:28 +0200
Message-ID: <20250416131241.107903-19-phasta@kernel.org>
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

Pass the driver's name as the name parameter of
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/pci/vx222/vx222.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index fdb039896205..693a4e471cf7 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -123,7 +123,7 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	vx = to_vx222(chip);
 	vx->pci = pci;
 
-	err = pci_request_regions(pci, CARD_NAME);
+	err = pcim_request_all_regions(pci, KBUILD_MODNAME);
 	if (err < 0)
 		return err;
 	for (i = 0; i < 2; i++)
-- 
2.48.1

