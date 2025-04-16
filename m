Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4831C183CB0;
	Wed, 16 Apr 2025 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809307; cv=none; b=KnnkrqtGUL0cFiGmRfNl01hZeTLNBWC/kgMFk3FZ9JrSNdsI/QFy4cAhIVgyEn0aY/TrRvJt6LFEYQf+XI7y2DEz7AlECz0HevD/OK74WLKTjM+fAADiTkz19It9w8RToAcBWONTrcYfvjUo68OeZvodh8RIL9L4ZHCj1YcWY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809307; c=relaxed/simple;
	bh=zCl8pSdllL4AI+iRbnlr1wu6Efd+CdIitr2TaNrMXLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dewDxmR8Czu6eNIS8eCXYA5Ftq/U3hbBja6LvsYX7DHRw8jCLKYRbO2iYKSvePGy0tnCOCpWP9MKxxU4qCz9dSqwXiL5uKuyvv/YjN4E5wlnuvIijqATAKLiD6XCBSdbqtoQxtjVnQJfkxT+6DRd4C+Tcd56DMe4c9R1Lu/lFD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFtxLT3j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFtxLT3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A072C4CEE2;
	Wed, 16 Apr 2025 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809306;
	bh=zCl8pSdllL4AI+iRbnlr1wu6Efd+CdIitr2TaNrMXLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vFtxLT3jpEPqkjxvmf6ICJcQC1cadfY+MfKTEJ3ebmJwRltz3NpZZZOSI0uJoRl0P
	 xALzIb7Ng2V2mhrT7Vii2z5TeZn779PszpTX5RP7zS/pb7wh4AB5PjFHmA1mPUOhcu
	 S97WOwFdmF9Lc5aVSitDX7sDfSBIyAlxfvp2PqX4uPvbrXfHw2FcVOz/AGOPJvY7NA
	 VLD/l6hYqGQG2hX7YiwZ8/y17NUrrP6uAlUPNfJ0pWN9R1i1vNB5xUhp2LqlC+oDc8
	 xKIc9fqDE4vZPe+ZR8Dal8u6XHzsg1pekp4lTkYHU8TULGbC8VqcEmgRdtepFciqEK
	 NALZf6PvuSd1g==
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
Subject: [PATCH 19/31] ALSA: trident: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:29 +0200
Message-ID: <20250416131241.107903-20-phasta@kernel.org>
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

In addition, the request function's name parameter should describe the
driver, not the device.

Replace pci_request_regions() with the always-managed function
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/pci/trident/trident_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 8039f445bee2..4e16b79d6584 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -3533,7 +3533,7 @@ int snd_trident_create(struct snd_card *card,
 	trident->midi_port = TRID_REG(trident, T4D_MPU401_BASE);
 	pci_set_master(pci);
 
-	err = pci_request_regions(pci, "Trident Audio");
+	err = pcim_request_all_regions(pci, "Trident Audio");
 	if (err < 0)
 		return err;
 	trident->port = pci_resource_start(pci, 0);
-- 
2.48.1

