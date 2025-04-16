Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819A1A5BAE;
	Wed, 16 Apr 2025 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809247; cv=none; b=DPpcS14QFdTNeqCwKAhwumlxJH3m5q0ASQ29S8xzPGv++5WX5w1iqDCLEwvUC/u1rjxyD2p8eEG2eIBSRumlTgnyrzwb4eb3reXDhgfzq5PE+kAIFardd0pNR21+mizH3Co68/TFel7yRaDSONLJMLXe3iUbkrzvKNbiKa5Ow+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809247; c=relaxed/simple;
	bh=3cmHumiHw6fXZ0Oze9GFkcaAxfO5QqdPmk+djYT2JO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMK/lFBr2sh2uAKKZxV1YCg/WsSz2d/py6ujou2QJXe4qjgzWJzGSJaTrh58HE/0W6ByX1NYxLa+q5kNdSLyHxgiXe+KCagP46xysf7Iq6oKNhsddgOE2uL5r6M1MOSblsLm6mH/2WWEzUR8AE1FrEiMKidzpnKmnXyt7t3g5Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VckyFLbJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VckyFLbJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB9DC4CEE2;
	Wed, 16 Apr 2025 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809247;
	bh=3cmHumiHw6fXZ0Oze9GFkcaAxfO5QqdPmk+djYT2JO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VckyFLbJ+7mlk6+3tJiViN5suSsxs0wvJFXt/sWkSA01JqFBR763FknXU5wgxtFY8
	 Yr36m1yLINpz9dkAz69428LqnvJ77nx1RNKDwsdL0do3rv9P8GHvaPk/DqEjpXOdhP
	 azixMfnC3MB8bkGETwfjBV8h3Y5c3KphSUaFEil8XJkCiM5eZ4jh+uBD4K/I9Sf3kg
	 9T+FROPy9m2yNARnJXziztjX8K1LnuFc5fuC8i+9TvYIn8hwWIRTjbPQKgLvTfWCkN
	 J5f4KeRa58wYuQAvJZBFZ4vfWLqpun4xoszws4TKtfXlBSxBfqpuShg0Jdw5CPHjsR
	 J7OcGxHVh+QCQ==
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
Subject: [PATCH 10/31] ALSA: sis7019: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:20 +0200
Message-ID: <20250416131241.107903-11-phasta@kernel.org>
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
 sound/pci/sis7019.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 53206beb2cb5..42b22f123fa7 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1273,7 +1273,7 @@ static int sis_chip_create(struct snd_card *card,
 	sis->irq = -1;
 	sis->ioport = pci_resource_start(pci, 0);
 
-	rc = pci_request_regions(pci, "SiS7019");
+	rc = pcim_request_all_regions(pci, "SiS7019");
 	if (rc) {
 		dev_err(&pci->dev, "unable request regions\n");
 		return rc;
-- 
2.48.1

