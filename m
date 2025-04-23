Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49057275853;
	Wed, 23 Apr 2025 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396961; cv=none; b=WlhbNk/3ptYAGMT8sWDi2rA3GnjSX8IWPGaWjtimVMbl0yub1gxIStvJH3OJn6GDwieJCeTHoN6wkuzHBXOOZYFbsHOxhTz5USjqGjz05fqFF7IyzKP/4FCl5GBgr47RpIkS0qvgeAaAeiVadPPKUNTsAUzFcvlUux2ZKtpwC1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396961; c=relaxed/simple;
	bh=dIsIfNWPh4pCz7BGWzAp5hEA101BvYn+yM42BX3fm/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZVpexzxd22F5jb736Kzoii1PYwNt6/tkIPSIDGNV/De+g2pZRP2Dv80boFqRB3XM1si5tq5KNDRy6Ygf04GqFVBKIK8CclMRUbgtx6nGHYtnTsff6HCrieRpoRjxdcPfTtdwyKlNuw2TKVZLwkehnIH2Gd1gWVHtM1pX9hNJBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUtMnaLh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUtMnaLh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34382C4CEEA;
	Wed, 23 Apr 2025 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745396959;
	bh=dIsIfNWPh4pCz7BGWzAp5hEA101BvYn+yM42BX3fm/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUtMnaLhNzJcrNzjghx6mmWbAk396LVjPRzmYciufIkA87yaxMp9Hy4WZw4l34Efh
	 YSdwCN3iIOcGlFngxPXRtHKv0WD/7fk29yzwEceFVqTa3kQAOJEM8rNpcUoCYOlpzN
	 jmSI1W93fbYXRDltiouirmNzj+kQoE+w4hkIh53gPKwVloD1Gi34JjTRvVwE8uKDN5
	 qUudTl7BGx3yuoG80dHhST7pFTbT26Szve6LC9W/OnDHoyAdnn7B8FbNK2jHcUNkg9
	 NJv5vr9Y2voT5SzgxHqcM2gcAc++5XcdpRjYMOoyzi9aGuJw7Kck7ZVq6irRb1pgTV
	 68R3QO8NVIGgg==
From: Philipp Stanner <phasta@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v2 1/4] ASoC: sof: Use pure devres PCI
Date: Wed, 23 Apr 2025 10:28:56 +0200
Message-ID: <20250423082858.49780-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250423082858.49780-2-phasta@kernel.org>
References: <20250423082858.49780-2-phasta@kernel.org>
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
 sound/soc/sof/sof-pci-dev.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 2fc14b9a33d4..c50249aadea9 100644
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
@@ -271,13 +270,7 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	sof_pdata->sof_probe_complete = sof_pci_probe_complete;
 
 	/* call sof helper for DSP hardware probe */
-	ret = snd_sof_device_probe(dev, sof_pdata);
-
-out:
-	if (ret)
-		pci_release_regions(pci);
-
-	return ret;
+	return snd_sof_device_probe(dev, sof_pdata);
 }
 EXPORT_SYMBOL_NS(sof_pci_probe, "SND_SOC_SOF_PCI_DEV");
 
@@ -290,9 +283,6 @@ void sof_pci_remove(struct pci_dev *pci)
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

