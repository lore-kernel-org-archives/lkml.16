Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B404B26E164;
	Wed, 23 Apr 2025 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394875; cv=none; b=Ra28H8xmbM0txqgj+z3OYmvRntFy/MkYMb8gkg2vyRj9FD5zy8KHo1ZRPkltu3Y6rwK3XYRnERpilT2avfFWrUTuZQ2doSBw5d1PhDDGrf40AZDrAKqMbwi00b34btOffcZFFIWzuhR/75OFM+yHwnLtPqvM3k9f8WKrlPTx+94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394875; c=relaxed/simple;
	bh=W6L41CxhyxSigRjUiN6FHg7+GUS5vkh+LQ9hrJpAbEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLno2lfOpQ2ddyw3eZSi0mH7uFqQtBxB4oH4wjtzXReudGYL53gvPnMevEX70M2mnGQHQLYsezq13nzwe0RUpJtjCNQOFDb+K5a2BTu+uYtnl4M2Vq4PRuvQbF2U7585s8w4bkCs/pFBFEaxoiKnCZIZvgYCuEe/7fibu7XzT/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv7t6Ut1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv7t6Ut1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54974C4CEEA;
	Wed, 23 Apr 2025 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394875;
	bh=W6L41CxhyxSigRjUiN6FHg7+GUS5vkh+LQ9hrJpAbEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nv7t6Ut17hfgwPSrcjDDZzhlBr5lA7//4GOC3MHMWbWlW/cRsCVcdJYYlCqBuETDx
	 beLmlk0Svxn2LKsYAW+qFqGaIJHIX/l28Zx5K35jGOAl23ilPb0yCg92k62j5J8X31
	 clsplmKROr+X2jz+irigBbQrHPYT8CfFkGWMm/2Q040lcefUcCCxIOiCM2NTUh2hcC
	 tzk6ejwwxprFVPxylUdZzSVCtLjU2E3ciZ4aVC3Iz9RbtnsljVpr30gvX/FHHdrw7N
	 kjLz4ScY/6K8Xz/pYOsuoH5IV28U7+44p5BtxVzcO8EAtryu8XJTohoJ+g/vXS0p5a
	 Pz0gci28xSLFg==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Stanner <phasta@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	liujing <liujing@cmss.chinamobile.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/28] ALSA: via82: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:24 +0200
Message-ID: <20250423075346.45907-7-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250423075346.45907-1-phasta@kernel.org>
References: <20250423075346.45907-1-phasta@kernel.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/via82xx.c       | 2 +-
 sound/pci/via82xx_modem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 89838b4fb118..a04dbc0a420f 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2326,7 +2326,7 @@ static int snd_via82xx_create(struct snd_card *card,
 	pci_write_config_byte(chip->pci, VIA_FUNC_ENABLE,
 			      chip->old_legacy & ~(VIA_FUNC_ENABLE_SB|VIA_FUNC_ENABLE_FM));
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index a0a49b8d1511..eef0f9ddaae0 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1071,7 +1071,7 @@ static int snd_via82xx_create(struct snd_card *card,
 	chip->pci = pci;
 	chip->irq = -1;
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
-- 
2.48.1

