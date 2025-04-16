Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43D1B87E9;
	Wed, 16 Apr 2025 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809354; cv=none; b=mNWBzucQEjWz9tX9PsXeN3IEbOdSsq19izAtJwLLbpscdy9tw4FPpPqEm6VwMS/2ftluLUWVjVPqJztwy9TF261dgWdnWjsR49YcUYwIpUM9ZBM85muwAyBNQrrOCr6DrYLXRtmzadn6BthlEPSvAo5H/6rldVxxbH5Vw7mgnpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809354; c=relaxed/simple;
	bh=Yco0CGIujHvcLTakqanKlVDaVYhf9wdeNjDL1giNZwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwxNQHF4fEKfDbsXICWh6wKr7geh1PO0u+cA6QWeeN4GJaGJ+rUa1WYIKOuI8cHIdK3ypgMmro6Qr+HLPJCbcsMFAkiNJumEzr0RBWeS/wEdnLXWJbdyvDHkE7TOi4RwEnoT7iFHdWSX/JGvrEK7o7gU9pPzYPb4Sb6OejQC54I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbOQKoaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbOQKoaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA34C4CEED;
	Wed, 16 Apr 2025 13:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809354;
	bh=Yco0CGIujHvcLTakqanKlVDaVYhf9wdeNjDL1giNZwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbOQKoaDFNyKJ1+Bzu50Qo0pfeDSrgHQgOVsV2NPbnCkZ3CcNaUQS7rCQyo3aI65d
	 8aBvSTHqeYGAq3QLCOAYldoBsftRGtM3QN5uu8dVUC6+VkU5NCZGCADNyD0Ss8UKqR
	 JAEnJresTFeE3U8oVFGeGFh4G6UHnEKZxbFSHQUnt7fGqrWHM8NNWZvpaK3qwHeSbr
	 vMurWOkq/RwhcVlwemIteyjf9sV6n9b5xAMgzTyugcSvmT68atupnyPNPBl+quelZe
	 5QAhlxXMRk3/IPQgjI/fVTHntfA35UgnPqcpTEDGv2bHhfM9KVYSvxG412kehi2vfz
	 HSAaImgioAM7w==
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
Subject: [PATCH 26/31] ALSA: echoaudio: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:36 +0200
Message-ID: <20250416131241.107903-27-phasta@kernel.org>
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
 sound/pci/echoaudio/echoaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 4effcc0090ac..80d8ce75fdbb 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1910,7 +1910,7 @@ static int snd_echo_create(struct snd_card *card,
 	chip->can_set_rate = 1;
 
 	/* PCI resource allocation */
-	err = pci_request_regions(pci, ECHOCARD_NAME);
+	err = pcim_request_all_regions(pci, ECHOCARD_NAME);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

