Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1121A316C;
	Wed, 16 Apr 2025 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809276; cv=none; b=iFjgBpZhIHe9YoBoKLpfrdDJ1vLHLyjcOXRUdGyJLPlGu7rT42ODRPkBa/HY8/hQ6/aZdEayXV+SS7WVIyeXvAHOCyBTmnObGJPtdivNHtalpmBHj+poY4rmDQHkcLM717byfhSzgg/yg6qJ9hPsgJO4WzKjumFkB/+loQbSCQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809276; c=relaxed/simple;
	bh=etN5enlTdQ7ZZ7vMqengUwdH5a4P126ybxuvJUd7kGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXauiVKYa+qkCGfkDNsXU/+/aBrVlva76VTgaIMMYubUO6Gk2/kpBu6i9b3+QrfAyiFxQZlNSGoxwrPhBw0mBG4MYm2Bwi+R0q9Nm5u+9iacuTrJPNviOr1lqmxZ1u2HZqa8Et76cXcPzKLYxY9gG9iwy1UGJmtHVK1RFK/pmpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEj833PX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEj833PX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F2BC4CEE2;
	Wed, 16 Apr 2025 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809273;
	bh=etN5enlTdQ7ZZ7vMqengUwdH5a4P126ybxuvJUd7kGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YEj833PX7R/K+OB+6qtw04Wc38lHqpB4/UEYGee9BFUHqvewdOUskmFaLnH8+7IkA
	 IV0tjrPVSnjzjTcyCz+YCFaYsYJcaQSfW0qFKwq+zF8/XZQMscuY+mEu57Z3fyXKYH
	 SUGTrEBQyObHAO2CHEAgOOL6ijK/Pfo3MxAaEGFCLcEcwVM/siOfYOm6x7vIkTk0am
	 /hY1qpHopyvULIbXpeN46se1AXnOnw6GaV7kMLMR7PukvL/d7PKfFm/Dp2h8YMccyo
	 j+OfdmA94QM9Ff3iF5NpNA9rKp5Nc8+lU+qaC6ZesicSp4aCYSwDcUVGScUvA8hQEl
	 oibKGd/EImlMw==
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
Subject: [PATCH 14/31] ALSA: azt3328: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:24 +0200
Message-ID: <20250416131241.107903-15-phasta@kernel.org>
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
 sound/pci/azt3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 8a895d838005..053a18f434bf 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2347,7 +2347,7 @@ snd_azf3328_create(struct snd_card *card,
 		return -ENXIO;
 	}
 
-	err = pci_request_regions(pci, "Aztech AZF3328");
+	err = pcim_request_all_regions(pci, "Aztech AZF3328");
 	if (err < 0)
 		return err;
 
-- 
2.48.1

