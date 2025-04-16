Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216A1A0730;
	Wed, 16 Apr 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809361; cv=none; b=thmu7WHL74jQMff3oNIQC+lIItMk/oodhjEDQWPiOlVU3c1OgLDxOJ3C5i4cNlZ2Mb/ZaJQhYZXfehbvfQYumwOm2b6zALOVe604c7MrhF/PV6RWl0wTY4atOiieXG1c+vqCWNeNU0yVKNZOwCa6elde2MWMvpnoRFuVIq+mhTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809361; c=relaxed/simple;
	bh=aAxOlQPoP43gN8xtP0XOUy4bCfF2UDTskd2CFTq7mFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKBSWJf9VWO/DM1iPnG07ORWhJ0A1Cc1Bs124sXgXErs2UB+Mab5pUb6fwVtes74xJRnj+BIBTnJORxde4zaZkqnbWxRAqhDR5lh+Jh2ePtLr+gWuSpIueKD2pJNzlPAyeuec2GGv3lZx2euFR71A1er/L3UD99cESYRUYitr5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFdPxvQy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFdPxvQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE08EC4CEE2;
	Wed, 16 Apr 2025 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809361;
	bh=aAxOlQPoP43gN8xtP0XOUy4bCfF2UDTskd2CFTq7mFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EFdPxvQyI9zVdOMjh6l7yA0pUr//X4cMuRz7+B3/B/44N78yEfao2k5VBJJyV2bG0
	 QwbxPIMjsww7DI6TYS1WXq68FDGfkIVq1Ys/ENP1pkXiPsbLQNssQ+x4orPmUX3BoE
	 BH7P48fR6kMtN6hiSKVls2bdDE6WafddHLnStjs9QNFJO7kqtpEIl4qp0bknDXisGm
	 /b/Y1U44kuPVYjeqZc7dZECvMSSepVOkYDcI5kXWbtmEMRtp8xyHMGPBGmDcuB6snf
	 +b1WmoczjZ85crkhoQ+KMeAZ439BAF69noYVtZgqF6j6Xos+xQe+6d1BTeq8arOjcO
	 cdTUP7ntaMkrg==
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
Subject: [PATCH 27/31] ALSA: cs5535: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:37 +0200
Message-ID: <20250416131241.107903-28-phasta@kernel.org>
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
 sound/pci/cs5535audio/cs5535audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 440b8f9b40c9..0f319013a2a2 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -262,7 +262,7 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	cs5535au->pci = pci;
 	cs5535au->irq = -1;
 
-	err = pci_request_regions(pci, "CS5535 Audio");
+	err = pcim_request_all_regions(pci, "CS5535 Audio");
 	if (err < 0)
 		return err;
 
-- 
2.48.1

