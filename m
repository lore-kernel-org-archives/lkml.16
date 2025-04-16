Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE71B6D08;
	Wed, 16 Apr 2025 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809343; cv=none; b=ZGOWv8SGmDL+XFlvME084eIRbLypF4TdUCXvnrGLTgSb0YPnHRGlxh9JOfd4ZKL5i50zDOJfwYF85Hi/vwfFxNAridgn35cLvS02MdakhfEim4UJ3n1ZmECwwJUSGKRgIpNK+ZCRw+F04h70b5+Qgc/kHIyy+xgGQXNtKd71jWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809343; c=relaxed/simple;
	bh=nDLCOf0Qx8OCk6bvF8FEbrcg4lHtvsGudmJTJAPMq1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tddtlCgaOzuysAPVXnEsNMdcwGc97zVwxMnRPxK+twTkX2y+Jgpr8s8A2SmWRKAKYYb3Xh3RaIl2ZhV4ym7ifKLWvOl0TxvDqNwEkIv6OMSEoNpoqUp7s9tZbg6x3d6P1iGEjSU3IdslPfcd3nL4+TO3pooPbFxNOskY4Lp9mkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHN+4HO1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHN+4HO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B092C4CEEA;
	Wed, 16 Apr 2025 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809340;
	bh=nDLCOf0Qx8OCk6bvF8FEbrcg4lHtvsGudmJTJAPMq1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sHN+4HO1S0AjJv+plZTb8631dyelM7n0XZJpKnIXz4YHEjwe0CnHrzso9Rm5v+M84
	 9gqfOKy2mg0zY+ZX/DWFXw4vWzn76sbp3YhpvA2FPjLPA9ql/37mKHP3X0I8QxUjYV
	 Sb3mJR1BX5Um36x/+e61oXcl9LhxP4dqg4Uae2ySnTY1fHY7L7krMgIwofYU97YusY
	 qDUf+MBwTWfSeyG0HjdCKhTFrsPj6E4rvJacWs1ABXpoXpx5KpVhsjTGu3bIq4VZNr
	 vnDF4WmKH4wWA0mzGdOGPFQ15fIOabF1HOpDR3yJZbJ/Pu5thksYySNqcIFD1H+w8+
	 JJ66kxGJOTEAw==
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
Subject: [PATCH 24/31] ALSA: ice: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:34 +0200
Message-ID: <20250416131241.107903-25-phasta@kernel.org>
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
 sound/pci/ice1712/ice1712.c | 2 +-
 sound/pci/ice1712/ice1724.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 3b0c3e70987b..a8ac14887676 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2502,7 +2502,7 @@ static int snd_ice1712_create(struct snd_card *card,
 	pci_write_config_word(ice->pci, 0x42, 0x0006);
 	snd_ice1712_proc_init(ice);
 
-	err = pci_request_regions(pci, "ICE1712");
+	err = pcim_request_all_regions(pci, "ICE1712");
 	if (err < 0)
 		return err;
 	ice->port = pci_resource_start(pci, 0);
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 1dc776acd637..be22b159e65a 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2491,7 +2491,7 @@ static int snd_vt1724_create(struct snd_card *card,
 	pci_set_master(pci);
 	snd_vt1724_proc_init(ice);
 
-	err = pci_request_regions(pci, "ICE1724");
+	err = pcim_request_all_regions(pci, "ICE1724");
 	if (err < 0)
 		return err;
 	ice->port = pci_resource_start(pci, 0);
-- 
2.48.1

