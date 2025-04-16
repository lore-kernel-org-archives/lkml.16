Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0361A5BAE;
	Wed, 16 Apr 2025 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809254; cv=none; b=TCoy3DUZDwUIE9bUlHMNDHP1neJj8NwIhMm2caaMOc2L/vOxQNflFUGvX47s5RhHOqK9/sIH842xVD5J3mNqw2IQNfnjwn6C3ouCSb+fU9UsH38gLfzfSF+E4WHdeVWscGmqGLuvIpKYIrA+iKkel1A6b2XBOjolQzK8MiIsx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809254; c=relaxed/simple;
	bh=cxYne9JSEduD2Q5BZf4yS/eDboABDwHJZ4lHD4ShPxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTOQySosDonulihsuzQxh9lO0xMY+zRf6CoT/Ty0JejTdn5MkHy4RIba8i2ePCCmTGnCqEcZOgsHHSvrdICuH5IMIW96KYiKkEJqkWpE3QYJhw2/WqONBBCBhbTmR5BvEKhKN7e56M6gVPGe49dubRNWE1L9oT7a/ax1lKwwVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATn+8Fg8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATn+8Fg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709D6C4CEED;
	Wed, 16 Apr 2025 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809253;
	bh=cxYne9JSEduD2Q5BZf4yS/eDboABDwHJZ4lHD4ShPxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATn+8Fg8J46kwJIQPjYnwFLIYDPc30fvngwWczobcZ7BuKcY8g9ha3DAt+GgfR3vi
	 +5jd3K8VMDgu82Bkh9TbC3Y8EkbFnidvLRM0jxDTJyjazate1P9mntdCFD/R0UqEbl
	 Jf0o81qJcFgGIAW0eDeGoB4Id9FbQRdNA1Ews9GzOnka2/jjlmA87OC/oH+1804BDF
	 FUEGflNG7AiPu8jyBX/+WS9qriSqb6dPi6ckifHHYrLg1IxiKfg1z1YrxbEM4C5bX6
	 FwJIi/Zdcs1uphupLpYxG4nzsyBz2gmJK09Osv7vwhTy2wZjoJhY/P5/TqSdVyfykW
	 jkeqapx+YBLuQ==
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
Subject: [PATCH 11/31] ALSA: intel8x: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:21 +0200
Message-ID: <20250416131241.107903-12-phasta@kernel.org>
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
 sound/pci/intel8x0.c  | 2 +-
 sound/pci/intel8x0m.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index e4bb99f71c2c..51e7f1f1a48e 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2926,7 +2926,7 @@ static int snd_intel8x0_init(struct snd_card *card,
 	    pci->device == PCI_DEVICE_ID_INTEL_440MX)
 		chip->fix_nocache = 1; /* enable workaround */
 
-	err = pci_request_regions(pci, card->shortname);
+	err = pcim_request_all_regions(pci, card->shortname);
 	if (err < 0)
 		return err;
 
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 38f8de51d641..1ce775fe8a70 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -1060,7 +1060,7 @@ static int snd_intel8x0m_init(struct snd_card *card,
 	chip->pci = pci;
 	chip->irq = -1;
 
-	err = pci_request_regions(pci, card->shortname);
+	err = pcim_request_all_regions(pci, card->shortname);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

