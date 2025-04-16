Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837A335BA;
	Wed, 16 Apr 2025 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809383; cv=none; b=pTED81E6MR1g0H7q2Qp0Ns2THhAF0QkH5B/eQv4Z0KsDo/6E5hkfYgGEUu0UxT5Ni2nTRzyMNacblQMT9IGmNp1z0MIE8ajY9MMySwyYHh7YGp5aLU1RRSIdBw92aUNnXTpTY9O6H3VlAYmq4Svfwgcme4/NTEhAbPbLwuQbeJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809383; c=relaxed/simple;
	bh=IexOsqoyajHV7wN/9+GI3Q8eMJhi1xU+7WMbBThMlp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtcNHvWHRGfrj1+1aKXZbDJDlUedaU7w1a4cMyLNhdV0hGa1QFrdWcZB4Y1eyOxvd+bhrPTE6CMXh3VYwCzu6EFMuYKjYe8q940RqAHD+/gZQDFbYAwC7GpxkAhg37DufiPTDYI4ZwBW+PAbIXCbokCb0SSHIaejoZ5asmfcnxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdJ9uBW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdJ9uBW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AE9C4CEE2;
	Wed, 16 Apr 2025 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809382;
	bh=IexOsqoyajHV7wN/9+GI3Q8eMJhi1xU+7WMbBThMlp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdJ9uBW3C0U/szSey6KVf2M9IaaVMsfqcGJ4lqggIKhih7GKuDREEofwzqiuMcgSp
	 nfplHCeTuF9+ZPDgmGUblvrFaV3gairc3RYlMy8MbBzGKHwXmL+rZZBrDPE7ylEfJ8
	 tM7VHQikapC9tHtbKxCMqsH++++FR0LeQUj6f7j+8P6HraweAnodyvZ8Ho1v9qv8zu
	 znCi8hTPspvPHkcclFsMLjpYJBaDCUlpqovYmDT4wp+T6UYa32h3kWZ7zmntOcWvFT
	 aa7i38pDx4nAlr8IsHe/umxUdedytjJ2Kf3z5S20Ot+OgKSUAcmW8WJodfD4C7CPLj
	 KVhOKQoVxcYQg==
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
Subject: [PATCH 30/31] ALSA: ali5451: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:40 +0200
Message-ID: <20250416131241.107903-31-phasta@kernel.org>
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
 sound/pci/ali5451/ali5451.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 793d2f13267e..5f38a60467c1 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1989,7 +1989,7 @@ static int snd_ali_resources(struct snd_ali *codec)
 	int err;
 
 	dev_dbg(codec->card->dev, "resources allocation ...\n");
-	err = pci_request_regions(codec->pci, "ALI 5451");
+	err = pcim_request_all_regions(codec->pci, "ALI 5451");
 	if (err < 0)
 		return err;
 	codec->port = pci_resource_start(codec->pci, 0);
-- 
2.48.1

