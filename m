Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985B1B4140;
	Wed, 16 Apr 2025 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809267; cv=none; b=r5mGU9P3yx6EyjI5Gkj3lcjJImr0CK8lxfQ8fjx8MGLSu7/z3tyjc6zdoBW07v3g/cNwoZOg9hVZN3yhSYPY4bchpskx6oAScuj3C7Xxvhd69RDXlYLNVyb9y6eR9fnkDI7Qjz80fNT+PbbC3vgr1vVkTvvKParSFPC1CVaNY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809267; c=relaxed/simple;
	bh=r1lXWMLlCF5OtLuwjF1yEdJF89x6vCCxH6tyFbIPcWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KstNi4Rx8533K36hH/hHbuBHF+T9xLfk6UoBuuqIv6BTny8pBuXZO5IgcmTrrf5N8NLvmGcjhUL0eVd+uD4YYNmBMUvNy/jArCI7Og55Gt5/V83X9E2efvmel8oCwogugpfFVWdmiF3qVJuvDAjVaNmxkg/8DNsWLiFQuv8IEhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3CDbU7f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3CDbU7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF49C4CEED;
	Wed, 16 Apr 2025 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809266;
	bh=r1lXWMLlCF5OtLuwjF1yEdJF89x6vCCxH6tyFbIPcWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3CDbU7fsZgcFghdE7nMj70Jk4da6qS7vHcTpQMuJaXGS/qOM8VVnlVFjkUnAknAh
	 Jw/iMQlpd96CR0gZMrJqRsTvDbAIA1/wuJ9TiD5g8e5YmTPWHI9c7i4HVVtalvMJim
	 TGklsfuKwKbTJl+ODWGoSDrRgnrtZyodF6ry4FkQqtwIpuH+5CmyBmxGLF+opkiGVg
	 2iFmlmFYnpuNnBpBGPWwv7bpnHQpz6GTtVdyXFPB1m6MUXuwIT99C6526w/GQNVi6q
	 HZkeiPrODyDqsFvyzPpo2CRmaZiDi+9yXLLj+TBz6GzvPQPMLaePx4lcu0yiis276H
	 oGFT7gDACBogA==
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
Subject: [PATCH 13/31] ALSA: es19x8: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:23 +0200
Message-ID: <20250416131241.107903-14-phasta@kernel.org>
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
 sound/pci/es1938.c | 2 +-
 sound/pci/es1968.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 018a8d53ca53..27728bdfac57 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1531,7 +1531,7 @@ static int snd_es1938_create(struct snd_card *card,
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	err = pci_request_regions(pci, "ESS Solo-1");
+	err = pcim_request_all_regions(pci, "ESS Solo-1");
 	if (err < 0)
 		return err;
 	chip->io_port = pci_resource_start(pci, 0);
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index c6c018b40c69..899135d3922e 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2647,7 +2647,7 @@ static int snd_es1968_create(struct snd_card *card,
 	chip->playback_streams = play_streams;
 	chip->capture_streams = capt_streams;
 
-	err = pci_request_regions(pci, "ESS Maestro");
+	err = pcim_request_all_regions(pci, "ESS Maestro");
 	if (err < 0)
 		return err;
 	chip->io_port = pci_resource_start(pci, 0);
-- 
2.48.1

