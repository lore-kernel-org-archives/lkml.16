Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5578E1DE3A8;
	Wed, 16 Apr 2025 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809314; cv=none; b=mt2HsRz2MJE22oCcqwe8GmtUxTmNU3dw3koQP68yth5CwXzLR5WYyAsVFIZyKDrGogYWNsnTk1X9YNGa0aXY9T1n6XSYdCmlo0+pLlAT7nu+CH6L/HC9UoSV8QA/9rGlh68GgvwbexXVjOquS+AMukzg3AcpKmygunAQrDOK6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809314; c=relaxed/simple;
	bh=Brxg+ytOSEo39k4gJTMc+X7RGZ1Gfl8o00RDEyoywGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrSieZZoE4cC3u1VCa1sO8zprf0+xrdh1dZ0/HCU29kR6csZZjvRdPID3zx8PAQp4y8cmVATzvqlqo14tCPD0ZhbbRdT9tKXBPMyrZgM2igs7c0gFzEjqYw1VZaeHF9I0n6vJKbjShQP4VpEU44KaEnxuaWn4vR+kbFNNNM0ey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=soZWGr9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="soZWGr9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FA9C4CEEA;
	Wed, 16 Apr 2025 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809313;
	bh=Brxg+ytOSEo39k4gJTMc+X7RGZ1Gfl8o00RDEyoywGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=soZWGr9m/oUWl5ze0BoYRiImSRSzz6lZC81ra9k1+ZhG2tsFpJgYp5GdDN1t53oa5
	 gnjSKtFR6GwCv+rxh/xhdh5laygyy8pxxCrLUT/PvW8TKtWu/84zRGoh3JU6ATj18H
	 9XTHEE31QPBOqcl89z3MaBwnOmGkHwkYgBpIH8JdpmQ5+srnGzm0sZmqTEmXi5LEZ0
	 fyBCe7hLW6OAQMRsL0rPMtlUnEheTRexp3/d9Y2zho3WSyDGy9wve14tlb5fE816Fz
	 Lsv+6q3I2IOGk8uBOxEbEbuAvpF6ePmF3HdQ482OcUe6BOg7qPMGygFBJEYQhg7eDK
	 FDyNi9dkZlZBA==
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
Subject: [PATCH 20/31] ALSA: rme9652: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:30 +0200
Message-ID: <20250416131241.107903-21-phasta@kernel.org>
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
 sound/pci/rme9652/hdsp.c    | 2 +-
 sound/pci/rme9652/rme9652.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index dc326face54a..873b7eadfc50 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5277,7 +5277,7 @@ static int snd_hdsp_create(struct snd_card *card,
 
 	pci_set_master(hdsp->pci);
 
-	err = pci_request_regions(pci, "hdsp");
+	err = pcim_request_all_regions(pci, "hdsp");
 	if (err < 0)
 		return err;
 	hdsp->port = pci_resource_start(pci, 0);
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 5b8dd7b0a02c..34d9c7995ddd 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2406,7 +2406,7 @@ static int snd_rme9652_create(struct snd_card *card,
 
 	spin_lock_init(&rme9652->lock);
 
-	err = pci_request_regions(pci, "rme9652");
+	err = pcim_request_all_regions(pci, "rme9652");
 	if (err < 0)
 		return err;
 	rme9652->port = pci_resource_start(pci, 0);
-- 
2.48.1

