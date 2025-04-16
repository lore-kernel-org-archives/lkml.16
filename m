Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D7819ABAB;
	Wed, 16 Apr 2025 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809334; cv=none; b=f5ugCcb/+mX+v40tMKj7l603Uc80+kKFWUh3SKLmCct8VVL3wICusg5m/7HM3zUQgkJYvn5ir5WqaojHuz1Wk/oiY2ozjoXcUwxD6qIHpZKYUOcMn07Xz4FWI16TZTlYgl3VmUTGdTLSN/InrfkPJozhu9QUIyDQh7bN+hEMJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809334; c=relaxed/simple;
	bh=UksMB/TSljPXbwmxfQmIH/846gqV+jBpHPGQhk3lL0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=moCSR3Y1NnO3+BdnvnGT0hiMsxQx5xqM3DTyCNqb6Vs1kzzNPz6t/ME0ivMOCXIe41nTvyrvJn6awI0M9hQMfNZ0tEs3WsOj4BZv+YnXOZBFQ50Vxn6+PxW+X0giPV+uXP3K94tQACJCrMthfwqvZ779YMQ79SZl4KuA4dQVDIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjmCn/v9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjmCn/v9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D5DC4CEE2;
	Wed, 16 Apr 2025 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809334;
	bh=UksMB/TSljPXbwmxfQmIH/846gqV+jBpHPGQhk3lL0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PjmCn/v9d2bED4k86oAyNP4W971WEYhoZkH3JwzixTviMHrSf0yFuy9m6wXBMRvpu
	 +rn2cqV3eL14XASaz4rW/dCFBqCRCVaY11CrxcmCSL5SppCoeZmwNcr2WG1iA9bye6
	 BLiR9T9eKXGx8SyFzz0NnubKsbnXAkGCILRpKfhoeY6tz7rmLtLFDJBR6EiTX25NAW
	 2wPN852aqXkwWAJngECTWnC3Hm8tgPM0WbGMzF+OX2+V8IsHbwZorPU/o21oJ/PI7b
	 4RHC7TZdoXFjrtF+Wt6cAuYFeJa8/4+/ZuAFPPJn5iQB42AEegabelsZbxfOQXFNCj
	 tAbPHexOfT0HA==
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
Subject: [PATCH 23/31] ALSA: nm256: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:33 +0200
Message-ID: <20250416131241.107903-24-phasta@kernel.org>
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
 sound/pci/nm256/nm256.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 44085237fb44..cd4dc43dbff1 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1447,7 +1447,7 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci)
 	chip->buffer_addr = pci_resource_start(pci, 0);
 	chip->cport_addr = pci_resource_start(pci, 1);
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

