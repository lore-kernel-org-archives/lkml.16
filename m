Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B93275853;
	Wed, 23 Apr 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396965; cv=none; b=ECHM4PpmwNbP1mGvx/2uj86vrxSKBSq81ApWHfRyXATskLV9pMEauegcwwwZTzcGcKDGb8Ys9DgWasse2SGkoiUxpJ8aV3EVU55mXNNGM3BDx/yVsboVLxl5LLEV0NOxCILDcOq0BwNhJuiZFIw7gLMmtL7uHatUYWWbapHEjrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396965; c=relaxed/simple;
	bh=gpb1Vl3zMc7v2AN2uXCdpJ78JEE37uEZ4vxk3DO8D9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fixdqm7auR/YsXvkNu1gPtlZt18xTpYl3fkqmY75eSPCgorAWfic451jfQfwc/77dITwkIqqsMQ8cud0uPk6do8z5KmuS0gUL4UIf2aG1B7epDvh2age9+BUJtVf1vRim50mcTmY4+5m1E0ik7Tr5WLq23/+BsCioqCHsLpvXxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbPDbZMY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbPDbZMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519CDC4CEE2;
	Wed, 23 Apr 2025 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745396965;
	bh=gpb1Vl3zMc7v2AN2uXCdpJ78JEE37uEZ4vxk3DO8D9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YbPDbZMY3vrbRVhtzbHYKnMhxhI1ufVfwxyFi0qtaNokLvFlsHa0O+1rjKvcZ18Pp
	 rU0zGuLhEs+aZ02cmJAczE87huvVdJT62MIbeT0yjoMcOd38F04X+6nsfCsSFHcpji
	 ACs3vXcDLbQN/3d/hC3fdmY3pY09pskBPGqswjKS8+E8hfPpUEP3Ap4BOLj5pugyn5
	 4dAVjCNXd5u1nFfxCejo0+Xw8QCmV3NdmYSs5lLGJP6Vx3yZ/kRZf/u65pecj7Km5M
	 zqm5O8LNIaZvrm9GhbQHBCjzDrzMaNYTs6SDhs1iXU2LCiFwLtcVKzjl+wbtv5haGl
	 RlVw9I8Zj7IFg==
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
Subject: [PATCH v2 2/4] ASoC: intel/avs: Use pure devres PCI
Date: Wed, 23 Apr 2025 10:28:57 +0200
Message-ID: <20250423082858.49780-4-phasta@kernel.org>
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

Remove the goto jump to pci_release_regions(), since pcim_ functions
clean up automatically.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/soc/intel/avs/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 8fbf33e30dfc..dafe46973146 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -445,7 +445,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 		return ret;
 	}
 
-	ret = pci_request_regions(pci, "AVS HDAudio");
+	ret = pcim_request_all_regions(pci, "AVS HDAudio");
 	if (ret < 0)
 		return ret;
 
@@ -454,8 +454,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	bus->remap_addr = pci_ioremap_bar(pci, 0);
 	if (!bus->remap_addr) {
 		dev_err(bus->dev, "ioremap error\n");
-		ret = -ENXIO;
-		goto err_remap_bar0;
+		return -ENXIO;
 	}
 
 	adev->dsp_ba = pci_ioremap_bar(pci, 4);
@@ -512,8 +511,6 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	iounmap(adev->dsp_ba);
 err_remap_bar4:
 	iounmap(bus->remap_addr);
-err_remap_bar0:
-	pci_release_regions(pci);
 	return ret;
 }
 
-- 
2.48.1

