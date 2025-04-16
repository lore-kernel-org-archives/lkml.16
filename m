Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9991AAE01;
	Wed, 16 Apr 2025 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809227; cv=none; b=gW6Ji09V3ZgynnOzhKZjLVISLvmyUShG0AZjtOwLJ8XpgYYB3Kfk6sDlxjlkTjcdXqgE6N7tEJ6DNhWRpVmbznyza7jzOhaGXTTWHe1W63hTWl4/tLJPVDdQhmT0ZvTI7f7X0N0Wfm47LSG4gAgWxK94pkjd0Qr1ZsrbRDsjTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809227; c=relaxed/simple;
	bh=qXpKytL+mFxlJBagbnBDnuiAlAAfV9I1KNlxSIOAV8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahmljYBw8rVp1mUpQLHYGzSsXeiT+VcH/5/CPA7VL3Pm1TzMFJglCAfLbKl1jQkjyeN0jYysnWT3S5lyATAj6Usz3lqF/tq03W7qmxMwC3ChXiQn544xcYksjGawjfH5AaCewuqylZ88k9LMKW6J1lR1W+q4OSJu+jE5cRd/V7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k27ISNv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k27ISNv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68807C4CEEA;
	Wed, 16 Apr 2025 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809226;
	bh=qXpKytL+mFxlJBagbnBDnuiAlAAfV9I1KNlxSIOAV8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k27ISNv5lGUzE3Qhl+Xe48aZO6jx9RhtXGa4mpVnVzowAmITERZFF1s6slaBZMRSV
	 HVSg63sje+Ohvm8hy7en7iADpAYL9hVDDBpQeastiSYIaF5LYhTWtthCtlV3SATo0T
	 5sUSeun+7KWfLsDHZXK+2xNbwq200tJj5srsG1X4PI0BrfosnuFp52u7+PhJ1ON+mT
	 G46iwsnKs1FWR4kY6FeWhpCS2eOhxePfRukhBBMUtcJ/7RRelF0J7SnLtQf9hoE8US
	 /uHJfy75hZAa+9KDnvGdBYGQ4mIXWPpyxPbbzQcNiPkkkDSUTzyNjpayDhvMClLuFN
	 gApfIHoy0zrFQ==
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
Subject: [PATCH 07/31] ALSA: ens1370: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:17 +0200
Message-ID: <20250416131241.107903-8-phasta@kernel.org>
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
 sound/pci/ens1370.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 71c89e4e3090..1e6adf1ae304 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -2022,7 +2022,7 @@ static int snd_ensoniq_create(struct snd_card *card,
 	ensoniq->card = card;
 	ensoniq->pci = pci;
 	ensoniq->irq = -1;
-	err = pci_request_regions(pci, "Ensoniq AudioPCI");
+	err = pcim_request_all_regions(pci, "Ensoniq AudioPCI");
 	if (err < 0)
 		return err;
 	ensoniq->port = pci_resource_start(pci, 0);
-- 
2.48.1

