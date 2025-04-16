Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF961132122;
	Wed, 16 Apr 2025 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809213; cv=none; b=n0bBjX0xGv5fiF0JO3M/hW4W/RULR7JjtHtFA+oafmy1M+Jrn45yP6o5e1PQU17gk3w+eAQ3kchMBVcf78Y8MKXS9qijD9y6wVFuy+qZOWpunnjQe9NqiUjvi0HyVv4BEcabgilEoeTeL8jtj5nm+re5J9+uLgcb3+U4vuUC+HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809213; c=relaxed/simple;
	bh=8IbZJ8f0snPjp+AG/9OT1malzVNUOz4CEadV1wniIBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULYXvAnlzvqlzezeaNcXxWDKAcOTDX/+I4JtizXF3vqEkRojlCV5ptP0OQiAduSs4SRu0dPTbujd4j9rKUhgi6Z58eAs99Rt4sxDdjb6XLim2i4QoLiq6lIhtVKKNBOiAtTh5Gmuj2GsppRA33qY49+RyLSusVYx8RzjxlbLeIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DobZFdNU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DobZFdNU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3349EC4CEEA;
	Wed, 16 Apr 2025 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809213;
	bh=8IbZJ8f0snPjp+AG/9OT1malzVNUOz4CEadV1wniIBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DobZFdNUUFRtfevNTUmGzfSlmom17TPFqlISRj6VIPJG4WYWwtQRVGab5w4A2Z118
	 Z+z6JwECZVRf+YJgvX41D38RkBXcZooZhioo1n9t9Lm+W+bnjCO8f6Z99tYHwB8Y4Z
	 nesLsipGsJTn8ltvzupaOl/qixrmDwVqKHuvrbH0IrmkNiflbnxuyEvRdsB3PuQw8V
	 72v06A4/yaZIooPkw7v3nnnYpKzRYbmUtMVG6u0LSCx3zC/2J2Vp2O+8pBlOrZON7V
	 xJSHI4YsLNs1c6dVQeg/L9CB/Y++vSlM+TMxSWw7znGzSRCABcYeNVsYQ6d8AEPpc3
	 oPFD0oKZrKwzA==
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
Subject: [PATCH 05/31] ALSA: rme96: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:15 +0200
Message-ID: <20250416131241.107903-6-phasta@kernel.org>
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
 sound/pci/rme96.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 1265a7efac60..01029843d7f3 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -1575,7 +1575,7 @@ snd_rme96_create(struct rme96 *rme96)
 	if (err < 0)
 		return err;
 
-	err = pci_request_regions(pci, "RME96");
+	err = pcim_request_all_regions(pci, "RME96");
 	if (err < 0)
 		return err;
 	rme96->port = pci_resource_start(rme96->pci, 0);
-- 
2.48.1

