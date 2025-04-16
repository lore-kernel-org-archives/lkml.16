Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA91AF0D0;
	Wed, 16 Apr 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809321; cv=none; b=uxo7sJ4EPQ+RDPcwGokhw/w5Gkvpj/iKudVpOzZENNU/iO68CwylLSZYga4pDBJrQLwqBB+1SfyfSQw+D7t4WO81yRG2BTHPehWS20hMXuVvqymihYMU4h4MT79/Pb05oG5m1L59FvtgedrrslUAgG303PClRxAyq7IO4fKk1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809321; c=relaxed/simple;
	bh=DXF897aVMVQynwK1mxAmrzEFeGUvfiwvfJDNgrcBBX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWeOw2l7j+uVsG+d3yqJ9FudDN31Uw9t8T9KmquAwVkS5LhYcCaWIwn9ZIvuf4jUvlSbD5Qe+v1FoLvhiwfn/mVJJXmBrz6WJaGf7cwSe7RaJWhuO1CtdgLavrN8y06NTU2nOmCo9mNrA9Ts9zDgCPfNrcQZE0IbOEQHTeJc+ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyJVP4PZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyJVP4PZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A00C4CEE2;
	Wed, 16 Apr 2025 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809320;
	bh=DXF897aVMVQynwK1mxAmrzEFeGUvfiwvfJDNgrcBBX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NyJVP4PZfi2Ive0dysGFlqLRomKjhQZjRAYeKQBgG1i8dPpoDMmUeqIRG21olngtv
	 G+yqXJKQUWMFZh1QydC3emeaZL0R7sDp7cgZB0CjYpHBSk3KXdgXikIRTSQ5K+TXiI
	 iShSi8Yr2fA6jgceDN/MOSR65Tr6q4xpLvnka+iNZNQABwLy0IVu9fsABcRO6APK5I
	 opiC6bJm39sBJS2hQHTv4nNi11RTOE3jD6Z/veiLuX/zquAPdWI6YGKkFHwtMKBDHs
	 ZBoDm22KLdN7KjRqPkORuITpeBdV+DvC2wdY9+Twg/YUmve6bmxwidSJ92Y94t8hdf
	 b1o8rH+WyqNdw==
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
Subject: [PATCH 21/31] ALSA: ymfpci: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:31 +0200
Message-ID: <20250416131241.107903-22-phasta@kernel.org>
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
 sound/pci/ymfpci/ymfpci_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 6b8d8690b6b2..d495f53a8324 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2307,7 +2307,7 @@ int snd_ymfpci_create(struct snd_card *card,
 	chip->device_id = pci->device;
 	chip->rev = pci->revision;
 
-	err = pci_request_regions(pci, "YMFPCI");
+	err = pcim_request_all_regions(pci, "YMFPCI");
 	if (err < 0)
 		return err;
 
-- 
2.48.1

