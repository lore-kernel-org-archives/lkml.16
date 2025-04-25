Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6372356A4;
	Fri, 25 Apr 2025 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569083; cv=none; b=oTzeddf2c00g4ns0eaXlBR7LZtGt8ESgfGMAlReKPCPNWffD3fUKRxsAFqATqz1S8CTO71J34XjFHDXNPkubrYQZAQXgshF9GWAjdDh65LDWlryzsF2T2PcNTfAxc5ij74hL88lLvrorpRI2uzuDuWGWYZSVlYYTFDvaqFTKPb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569083; c=relaxed/simple;
	bh=Q7F5o8AVhR4zCIu34F9b0xfiGNI6jZVtQ88rTFRCmfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IN4z5ZU8SEhGdY9GW6zeJsht+NlEjhEcMk0HCiTo0FHpfF3mEmRhOHq6IP+4/CzlntVHFg9yNXCxxxhPvBEb+6C2dvJie1mbQyE4k3LyGNFyJugUUqMqtp3ngUvdB5EB2nmohVDb9yMKAoZOoni3ZwBYHAB7SRtYgIaJJbiIV1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmlmR3RU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmlmR3RU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B722C4CEEA;
	Fri, 25 Apr 2025 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745569082;
	bh=Q7F5o8AVhR4zCIu34F9b0xfiGNI6jZVtQ88rTFRCmfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmlmR3RUGsRb4c65c4O7IpQUXHZGK0oFAsFll/hEN2w7a+SHx3M2F64yLy5Ik2wOw
	 xF+43QeV7spXkQkJZj9mq6CztDaa4oBclbHpSoBvEWH2jZ9f2XEDKUhrXYivmhxEEH
	 ISGi1TkhXAIQ4CihiH5VMHgy2wgWBSKfS7yX3ZMBaviXgXy4jQcE+loTFWSizp7KFq
	 reQvtVwgumwEmgdVNOttUCS5UmpNdw10EwsdMmUmg7R5BjYKLWKDqhiRVt/tMJ/O+n
	 xs0UxSPfSaD7pKnFswy4kqBbucE1zm2tPWY/vAY+TgLIj4kowaYVMflK9fQnSBMR74
	 rHCjbZKZ/0fvQ==
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
	Damien Le Moal <dlemoal@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v3 2/4] ASoC: intel: avs: Use pure devres PCI
Date: Fri, 25 Apr 2025 10:17:41 +0200
Message-ID: <20250425081742.61623-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425081742.61623-2-phasta@kernel.org>
References: <20250425081742.61623-2-phasta@kernel.org>
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
 sound/soc/intel/avs/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 8fbf33e30dfc..8f15a65406cd 100644
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
 
@@ -584,7 +581,6 @@ static void avs_pci_remove(struct pci_dev *pci)
 	pci_free_irq_vectors(pci);
 	iounmap(bus->remap_addr);
 	iounmap(adev->dsp_ba);
-	pci_release_regions(pci);
 
 	/* Firmware is not needed anymore */
 	avs_release_firmwares(adev);
-- 
2.48.1

