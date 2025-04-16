Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BE519B3EE;
	Wed, 16 Apr 2025 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809193; cv=none; b=HvuLn02jkC8vYbLzm7Vr9Mpp8k8DjOVGht6FE0XcF7vxhpsyxgboysDnVftGp1q4VlgMlGLZffvXdh34fQy/M7X5GiaXzgZH+s2rBJxobZnfSuhKC+tj+He17+8zoBi6M7pK39clAmfsb2ejqkDATPeZqm+3pnk9dcjIot2J6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809193; c=relaxed/simple;
	bh=gpb1Vl3zMc7v2AN2uXCdpJ78JEE37uEZ4vxk3DO8D9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXpuyKzBOITiEEeKumhsgf2ilGyxrWlxBC8CsZu9aFneeYb83/gt6SyhIzsjoFolIaN/nWwgZTH7aItkD4N8Ur0/0BIlbHYZLq8rn2xigw9X0YPTGOTf020C3+wg2lCdzddSEWpiAOxeYZX9nRgvMsjdIIoOHl+8rVLMHuWaGmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P600EFgm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P600EFgm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0432FC4CEE2;
	Wed, 16 Apr 2025 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809193;
	bh=gpb1Vl3zMc7v2AN2uXCdpJ78JEE37uEZ4vxk3DO8D9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P600EFgmXprsNVhs3v+ad9SQQLgijdBDpegkHqU6jSGe47OWeouD2vaqOEL80DnlH
	 h7Jp6uVRilvUldtfZF9WNfzzG9XlNIrYwU5PaDJ4gMWUvhXtjV2zE55V9IMWZjHpqI
	 rFHcD5gkWinoV9vD9PPDOYxpeNat8jvZ3ko/FHKGsBH8Uk59Br5PPso4FRC9Bpzfw2
	 A3/QB9QOEfAbswO90K+XAvxrc5+ha6IujlUPwjv+R+qDBgTb4PituiUxWleAwKY3Et
	 98IzRO27isqPDF5IXyYhHzgbKbyaE/ZtPzGqHAW697oNu0Dk6/ayyaj9iAdTQ8WDnK
	 UBCKPL7kFIASg==
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
Subject: [PATCH 02/31] ASoC: intel/avs: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:12 +0200
Message-ID: <20250416131241.107903-3-phasta@kernel.org>
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

Remove the goto jump to pci_release_regions(), since pcim_ functions
clean up automatically.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/soc/intel/avs/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 8fbf33e30dfc..dafe46973146 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -445,7 +445,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 		return ret;
 	}
 
-	ret = pci_request_regions(pci, "AVS HDAudio");
+	ret = pcim_request_all_regions(pci, "AVS HDAudio");
 	if (ret < 0)
 		return ret;
 
@@ -454,8 +454,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	bus->remap_addr = pci_ioremap_bar(pci, 0);
 	if (!bus->remap_addr) {
 		dev_err(bus->dev, "ioremap error\n");
-		ret = -ENXIO;
-		goto err_remap_bar0;
+		return -ENXIO;
 	}
 
 	adev->dsp_ba = pci_ioremap_bar(pci, 4);
@@ -512,8 +511,6 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	iounmap(adev->dsp_ba);
 err_remap_bar4:
 	iounmap(bus->remap_addr);
-err_remap_bar0:
-	pci_release_regions(pci);
 	return ret;
 }
 
-- 
2.48.1

