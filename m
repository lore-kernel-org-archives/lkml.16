Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3734E1A316C;
	Wed, 16 Apr 2025 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809280; cv=none; b=nIJzj8f54eP9CC3c9Z17Q3xJQxyGSpGRLc2Wf8XGbIjWWE9Kg/h3D6FSX89lONMBVL+Kma6pP4kb/uJ1vdX90HxvDDWC2P5cytDYOqsNnr3eGrtgNJClh93TX8D3IvX4VYjpSfDF5RBY9GN9nTHoKIPO8aRpPcJ82wOEu/F/3Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809280; c=relaxed/simple;
	bh=1veFytDgg/j/IwArkJ0aUXU9YifpuEvD0oLBw2nwwLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xa3vllO1+7Z91hDiDtHUJfDGllRZ4NRpiT47WSGJCGrIeceKP5tKTFXyTXugzFSfMgIk5Vhgydqc2WTi7LS0k5LkN8ymdN3qi5IxmC4cXEFUz6PkZ62Q3zN5KHaAoWcdPaA0covIuXcLF6DWlMMko8zMFdyoUL6WZhXz3Q1K+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibr65I/w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibr65I/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E05BC4CEEA;
	Wed, 16 Apr 2025 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809280;
	bh=1veFytDgg/j/IwArkJ0aUXU9YifpuEvD0oLBw2nwwLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ibr65I/wugWazXaln5hSaFSP4YzeZSmYYRCtkPoW5p/GkVmlOavYDe6yp5esLKUSE
	 o0+U1eJL2PhSfHPQpMCEYwpCVw3x7++DKVgk+IIILS4JJKdC1Bs4EsfJ8CUCVYAsmp
	 VUu17mDhQmysgAxlvdHxtwtdTQvhjYljCpf6pDOHJ9UVx3i1ZBW7NB6eflTlDJvvzk
	 tCnF4l+k2z4CCMHxTCpuKb7tCClxfPBEkGj7jv3S00ZXMzFLwauTkYj7VT2XcFTD0t
	 w7QHUq1e13hPZ40vbvF8HT5kkmkAMEBAW2zfsckpJ7DyyCZUmY1wKlGhhI6didzIvV
	 /8P36QZhHG7Uw==
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
Subject: [PATCH 15/31] ALSA: als: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:25 +0200
Message-ID: <20250416131241.107903-16-phasta@kernel.org>
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
 sound/pci/als300.c  | 2 +-
 sound/pci/als4000.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index c7c481203ef8..43f98719e61b 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -617,7 +617,7 @@ static int snd_als300_create(struct snd_card *card,
 	chip->chip_type = chip_type;
 	spin_lock_init(&chip->reg_lock);
 
-	err = pci_request_regions(pci, "ALS300");
+	err = pcim_request_all_regions(pci, "ALS300");
 	if (err < 0)
 		return err;
 
diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 022473594c73..3f4f3037f71f 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -836,7 +836,7 @@ static int __snd_card_als4000_probe(struct pci_dev *pci,
 		return -ENXIO;
 	}
 
-	err = pci_request_regions(pci, "ALS4000");
+	err = pcim_request_all_regions(pci, "ALS4000");
 	if (err < 0)
 		return err;
 	iobase = pci_resource_start(pci, 0);
-- 
2.48.1

