Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBD1A8F82;
	Wed, 16 Apr 2025 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809261; cv=none; b=emm38Lt4Poi/Q/NHkGssDdgsi0ko5+ybycblsMXhPdOTt/ur76hIkHFn8vSb0K5dK37sFP5JYSomnYuftwpYXZ1OqSBFx8x4qltfkNoR0SW/RlDsBFqcsSPOWrZnD6xE6isBALqdZ4w8Vdlb4FgHVlx1Cd0bmrPimWfTBz+rxUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809261; c=relaxed/simple;
	bh=fYYFwDScJXGw6yU/AHUCMM0dwr4zXlROhw4USUxTCn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6mVTnldvpoTDXxk858Ptw3XSIPGOFsKMnbl289+4dt5trAvH2sMdPoGgaoz9lrnGQUCe1olOCeho/cxy9iZmUCSSznSxh3v8foQ5WKLFjGkc4b9abjA6NN20IBRgWd7FMccDSi8MONmmY8SatgmF5ZMYheDpNQCtTVfYvCj2fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJiWwwqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJiWwwqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFB4C4CEE2;
	Wed, 16 Apr 2025 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809260;
	bh=fYYFwDScJXGw6yU/AHUCMM0dwr4zXlROhw4USUxTCn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJiWwwqxd2EgwNP+KiQE9OATMoidWl7aexsupQy4R0novmYGCABo56YgqAYdrEmed
	 2TpBavIBpKSBXF0E/dSoo2m+PvayFevfO26h+HlUyvUysbBIfhITL9dI/sDdjMbQ15
	 wogPwPKhVotmTsbr9S3PKoECFAEVqvpuz/w+sLFLOq6mIpgdYo//LlW/YC/J3H2SvL
	 gCIir1I3TTxl2NLJZyknMu9aBDXw3NcjHxiLRCvIlVSl7/irBdXoI9unNGJ6eJ1kh3
	 Zpj+GcYf/hA6DMGlaeYO5cyjIewTlGA+zSBOGDS8wqQKBWkFJ+wT8Et2hPX9EBAwfL
	 XDMwrrnrUGz+Q==
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
Subject: [PATCH 12/31] ALSA: fm801: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:22 +0200
Message-ID: <20250416131241.107903-13-phasta@kernel.org>
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
 sound/pci/fm801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 7f4834c2d5e6..f283256eda0d 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1191,7 +1191,7 @@ static int snd_fm801_create(struct snd_card *card,
 	chip->dev = &pci->dev;
 	chip->irq = -1;
 	chip->tea575x_tuner = tea575x_tuner;
-	err = pci_request_regions(pci, "FM801");
+	err = pcim_request_all_regions(pci, "FM801");
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
-- 
2.48.1

