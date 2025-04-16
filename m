Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1719D06A;
	Wed, 16 Apr 2025 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809287; cv=none; b=ebR+gZdINB18rlFHsdAPLhzw0d2M+pHrmBk33+qq2dFV/zRszWAZ9INzyP9fAcAD6+x3HiyZkoMXoYsKa6GGuOkopSHepHZ5FMD5N69Hjmi98ZvaMPxXiQEgC4aNquNF4wUWI2UfBW8b3uq+TGquncR2zUMr9F2rgmH47iOL5GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809287; c=relaxed/simple;
	bh=iHrVRISN2Nb8oJpA3nIoZycUBnT2fvE+HfWWaU7w/Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcwobTDVtzxNzvf4yI5cHi3jc0m6PsQC/oRP9Y0Tp9fyScO/a+SacR/Lbn/rCPk+TY7WljyV8i8KOEDfaERIJFIf3PrbbvKmJrM7UCT6WIQtl+dmo8nRdV5mFDJ0Zh/Qx4Sm7oBwrRdQ7cGM7jVbxyqfpLkBzuDCE/L2PezrP+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKENUD/L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKENUD/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D7EC4CEE2;
	Wed, 16 Apr 2025 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809286;
	bh=iHrVRISN2Nb8oJpA3nIoZycUBnT2fvE+HfWWaU7w/Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iKENUD/LraSVN32gmUeESo1Io5kA9dwHpcO6fc0KdAvu/qJ9qZfVb5vtpopNLp7qA
	 24Lrx/wjfe0Ikqjo0aoJoVuYt89BcvGKtyOApi8kuPYrhYYUK69yEMYMo2xjqZM3eW
	 YMKCxToXsuy/KVS0I+rCBvusso7kOaZs8htQ532GO+N7wr7ADChlne3/RfDYIizW19
	 F2g+YjS8Ll7BGaxdDC1W5F25ykKRd81rEz4TPP9OGWB7/GGbPImKtK9Y5MKN92TZTo
	 K3azPmqEUuPtIVQBE8iplBA0VXs4XsqveJMZzhwStzB/qpDNO5hf1YG9LeKwjMj9cv
	 VualTXRQ5KwbA==
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
Subject: [PATCH 16/31] ALSA: oxygen: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:26 +0200
Message-ID: <20250416131241.107903-17-phasta@kernel.org>
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
 sound/pci/oxygen/oxygen_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index 9340d3c9ffd6..39b8ccf37cdd 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -609,7 +609,7 @@ static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 	if (err < 0)
 		return err;
 
-	err = pci_request_regions(pci, DRIVER);
+	err = pcim_request_all_regions(pci, DRIVER);
 	if (err < 0) {
 		dev_err(card->dev, "cannot reserve PCI resources\n");
 		return err;
-- 
2.48.1

