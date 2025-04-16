Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004DF1FF7C8;
	Wed, 16 Apr 2025 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809391; cv=none; b=mcfIi0AGP+iGyJH6QieIoXmmshm+MFJ8Z63NXrL09y2zlI7Kgr0iZ9bZtZLPhWm4U49tFVsJ/4qjy+5blU0s13WaHZPHI1ZTej0tCVxBrYX+w0Ju/ItcTxbmgjSNUUxzW4rru1ymkSZpp2rzM/+Ah5pKfCDQ1IKyHHsJw1/cOPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809391; c=relaxed/simple;
	bh=xLzy0iiHmrS6TvYQmc7UORTr+nPeIQJO8NwQkY8GFbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUEigviVycHWtFmBYXl/NaooTgXRcys2b7hOzD3c7i0VQLlnbgAIb0Nzi5hHeQaTca0j3lOawSEycaF18iO2aIsd75fJuDDnQQRa8qpQ1V6Aq1/EQjXfRr4txtKaO1yix7mgvUcBWYOnMY6Q12NT0qgrdiSmLg3oeT7WqmaartM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPgJuWxC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPgJuWxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217C5C4CEEA;
	Wed, 16 Apr 2025 13:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809389;
	bh=xLzy0iiHmrS6TvYQmc7UORTr+nPeIQJO8NwQkY8GFbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tPgJuWxCd5QQt3v5/x/eE3Z0uXs8tyg+4/P2UOnXOP7ujb1q3bJpNomCBOLF8tbgK
	 DBPEbZdP+xKqaxgLJ2kDjH4hik43HDHU8M2vHwocnyI9D9antHWlqiZ6Ip4k1EmPJt
	 m606iKoth0MzttOObZLdMtWR4wOMCquPipnpL8xQwbTihf/Vi/861uvROm3Vrlqvem
	 SRdL7yu+H21gb/E22vqX7SExf08SB85DO3/NrxjJt7zo57Qo3Yip18Gtr4bhMb2g5l
	 wmXsmRiveexmW5GPmokyURYXO7yd0B1y8i5HysEBMnRp3kzx3VTydn+Mbi/HzxrJ8M
	 ty8hoKxAWsbAg==
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
Subject: [PATCH 31/31] ALSA: maestro3: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:41 +0200
Message-ID: <20250416131241.107903-32-phasta@kernel.org>
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
 sound/pci/maestro3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index f4d211970d7e..e61e15774706 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2552,7 +2552,7 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

