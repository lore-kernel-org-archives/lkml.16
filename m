Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505331A2547;
	Wed, 16 Apr 2025 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809327; cv=none; b=DAerFUXikBlwM+YsStzHePE571vygtJpcuVxDdUALtL24hxIKH0yeQbzcakNcJtTZT3I5NxNV0O/z9TgujPU3DnEb5MhJuwowxKNSua0k+FwyxieodhCfLNWHK7F1pl4rXfjZM+6PoASfBhHZBX3WZmmbFEWhgRDiRy2Aq8d0Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809327; c=relaxed/simple;
	bh=Yy/lK4DGjx7wy8eH2tmthzctLlCL4AxCcCNMyjKUWG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tw/uF+/qPVjH6/8q5BMfGzR+S01Lq04RgI6ljfpej/krwR9TG7fMywI7SfgHi+vIk5QhCSzQmsSoxkvgIUw/Lesh1BtDKmuPuywsLZrGZKmNJqT5cS/EyfNGgaCUoNyrldRu7t7OOYknT0SWgKz8v+ctlUkadAKbgXnFbpJ/Doc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PC774tm4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PC774tm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B23C4CEEA;
	Wed, 16 Apr 2025 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809327;
	bh=Yy/lK4DGjx7wy8eH2tmthzctLlCL4AxCcCNMyjKUWG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PC774tm4doPhIN0XeiRZzEUj0CwuJPw+3oqcCpau91vz/fYL0QdX1b5D/H6siz6lw
	 ZjuCGnh26fqhFGLvEI5t4RnMqb66LLlabwCayf69nqAJl+ucEVQwBtuqVAXU9Mukjk
	 fgjmWy66mbAkbvDHTgV/K9BaDCyiLQ49R1cqldPMev9cx1Ak5dMMS+XAAmlqu4telO
	 2bNSoa6nM8fnMxzvGDCQ0U1Fco3gMePlcjQpaHMzknSQcuUwAYzmOaZRcDhQXxi+fU
	 Pe2bOs2G4amcp1NY0V87KP8qUkTt9F8EHpR2b6Bn9V9f82ypWdsO0r3qsOU1M7mfzw
	 OF/W7S+UqDeTg==
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
Subject: [PATCH 22/31] ALSA: riptide: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:32 +0200
Message-ID: <20250416131241.107903-23-phasta@kernel.org>
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
 sound/pci/riptide/riptide.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 329816f37b76..578be0755b8a 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1831,7 +1831,7 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci)
 	chip->cif = NULL;
 	card->private_free = snd_riptide_free;
 
-	err = pci_request_regions(pci, "RIPTIDE");
+	err = pcim_request_all_regions(pci, "RIPTIDE");
 	if (err < 0)
 		return err;
 	hwport = (struct riptideport *)chip->port;
-- 
2.48.1

