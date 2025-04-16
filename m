Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AF51A5BB5;
	Wed, 16 Apr 2025 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809233; cv=none; b=kIFgl+QVdtrqYM4A/bUxOimoAXN1EYGXCWanxwq1ByAWuAnO9ZfjX+zQ1CBd0cthjtoSqYeHrD/C5GaL4bE5tUXU1wTCyahPKtqlcEOJMwcISMGeAJnw5OZiyb547O3CUSbZ6tGbDESKbzFZDXZBf5VwZxWpywpXes72eQqPcbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809233; c=relaxed/simple;
	bh=X9qVrXSQPRjsq0otBmwyVJAoR6mMgIWYnm8Z10Gqjqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zv9R0p5wD/+7pZcDN2js8dY5whgdKqy6p5UtCslzR3NQllrwlAGyseuoXCvNdYiP1IZQfaeg/SJWqvpxdTqFH+dwRFPWP3s1wzG+nsL1lxZIy6bF5K6b8oijcRP31iRaSId+KI8jqvxYzusK1+zuzOoBWD4bRKCGD4OrJj+Ya1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5LPvmex; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5LPvmex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4F6C4CEEE;
	Wed, 16 Apr 2025 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809233;
	bh=X9qVrXSQPRjsq0otBmwyVJAoR6mMgIWYnm8Z10Gqjqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n5LPvmex6vO5wsV3PZ2TIrwkfSbWV5iGsg8VEzBnp4BvQMlG5K/B3GEflLKqIuIfr
	 2DNe9FJE+OJV6d+7PEsDdEKfTrhvkcCh41q5pSzjJWu1AkFx5FbKFJmhC+E0F7STGx
	 rOj5w2ympUwK8G4Td4EJOds3C76AEz63+RlhZeaasIjq5KWs31Sq9siI2tVdQPyZZ8
	 lyW9NCmOaxM5tKvaE2Unq1H/v5/cUahRbUv0VzYpeTnZdPbbxwa0WPFbMdnnsLcQqy
	 +ZC3dzykrs/x56bh+J43y1c6lAaIPfZ2Acax2ePHpHIQ0zIuNwQ7K2crQjC2WtnKsf
	 T9OYgERhpCaiA==
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
Subject: [PATCH 08/31] ALSA: cmipci: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:18 +0200
Message-ID: <20250416131241.107903-9-phasta@kernel.org>
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
 sound/pci/cmipci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index cb8593c376ee..b00df0a60d3f 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2980,7 +2980,7 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	cm->channel[1].ch = 1;
 	cm->channel[0].is_dac = cm->channel[1].is_dac = 1; /* dual DAC mode */
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 	cm->iobase = pci_resource_start(pci, 0);
-- 
2.48.1

