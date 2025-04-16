Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C84132122;
	Wed, 16 Apr 2025 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809187; cv=none; b=Ym41x3QOgIF2ficdRl+OKKp/1/rL6pUgTzQsBkIOUe5coE7d4/Vx2xdHs12bFF2ilAOQLxXphrD+CM2nx8qbNWSE3uZzflKYdloTYdMrFUZeFGxxfSRzA3e1I0FjV+rzynWbek1XZXgg2YpkJWBQUUnLaRfCTduQk/Cqn5TTnSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809187; c=relaxed/simple;
	bh=xTElyRR645mFTDYZGJqyarTLXqFYYitJacfd5zreojo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJ76BarRLdC4X4f0tJkPB6H7MhsaahJjW3MPMamEVP+LNWOuyqaepRqmqsLLIDc/fcVb2DtkO0aCpI6GyNzNP3ANIIbArbdqPJkiHfDiYDjbnp4YOQ/JuEv2VphtAFQhsE9dQ2NPspqtMrZOoYwWlPgEs+BC0fiz/C0UsQb4R/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLFwoIs1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLFwoIs1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F15BC4CEEA;
	Wed, 16 Apr 2025 13:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809186;
	bh=xTElyRR645mFTDYZGJqyarTLXqFYYitJacfd5zreojo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLFwoIs19DxOO9pnlBEAnp1gMrHTRe8kTNApfdcCHtIJy/LHNxu3Rzuy8Y/LzTVXl
	 hWvj0dpfqJz0BRL3/HqlNtl6bT8NayxMt7duvm2rFtGRDsYyRcBK51Qmo+9V5fsukn
	 NBFClAxcTFgCKixXyM3pHi6cuF2N1ziTF5ROrnT8CbipjsUPHzuqdnBjYxYSdggvv9
	 ib+uIcabWntlPFB9t9u4BFWDGTY4N+CQh43PK7Ht0uPTCpMXbfDqcudUhkNq8URrMv
	 9EyQYd/FNE7UI6mz0PxjI90BgI/y6u8/GTxpFZESQiUgqBG6FWdzV65r3nrBrnv3gZ
	 yaE3q4JoA73xw==
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
Subject: [PATCH 01/31] ASoC: sof: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:11 +0200
Message-ID: <20250416131241.107903-2-phasta@kernel.org>
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

Remove surplus calls to PCI release functions, since pcim_ functions do
cleanup automatically.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 2fc14b9a33d4..3d3282375827 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -216,7 +216,7 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	if (ret < 0)
 		return ret;
 
-	ret = pci_request_regions(pci, "Audio DSP");
+	ret = pcim_request_all_regions(pci, "Audio DSP");
 	if (ret < 0)
 		return ret;
 
@@ -240,8 +240,7 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		path_override->ipc_type = sof_pci_ipc_type;
 	} else {
 		dev_err(dev, "Invalid IPC type requested: %d\n", sof_pci_ipc_type);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	path_override->fw_path = fw_path;
@@ -273,10 +272,6 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	/* call sof helper for DSP hardware probe */
 	ret = snd_sof_device_probe(dev, sof_pdata);
 
-out:
-	if (ret)
-		pci_release_regions(pci);
-
 	return ret;
 }
 EXPORT_SYMBOL_NS(sof_pci_probe, "SND_SOC_SOF_PCI_DEV");
@@ -290,9 +285,6 @@ void sof_pci_remove(struct pci_dev *pci)
 	if (snd_sof_device_probe_completed(&pci->dev) &&
 	    !(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
 		pm_runtime_get_noresume(&pci->dev);
-
-	/* release pci regions and disable device */
-	pci_release_regions(pci);
 }
 EXPORT_SYMBOL_NS(sof_pci_remove, "SND_SOC_SOF_PCI_DEV");
 
-- 
2.48.1

