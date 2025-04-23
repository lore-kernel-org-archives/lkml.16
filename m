Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353F726E164;
	Wed, 23 Apr 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394872; cv=none; b=DtwPpGfVr8nuZ75rwkOVgIQIQ6gQ9MZZq6ta2EvD299muF1wX9XBhFAhlJGIibst2oyDl4ki8KWfGAM/YKEw8k03dKRFiaA4L2gLrQFpqzzcEIlmh8Zic7q0NhpJ8Lf4Ay2AuzMSBauBUcy3pHErax5kJvqNyCjJxBRE50TI0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394872; c=relaxed/simple;
	bh=yyUvT9JkMyum4hiAa1+6ebNVa9FblrUX8+2SiiZ1X9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xb/3Ttb6Hgx9LC+ynd0fvbuvi+/mC3YsRiGMhhX5S4pndfNUKcO27cEcGG6w2SNKixwvTN3SMLH7NI5juktn6igEYw4Duactp4MTt6LTQJa6fIZuyNgLn6tSKbb8G6q6bklwA2LiRiXXER13Ehr3lL2ePGm5vb3X/iJnZo8JTpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ey+dwbsI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ey+dwbsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0709C4CEE2;
	Wed, 23 Apr 2025 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394870;
	bh=yyUvT9JkMyum4hiAa1+6ebNVa9FblrUX8+2SiiZ1X9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ey+dwbsI4hAt0upV2zp5IbIphcj8DHK8kea4mW9K4WqR1Xwm1meeBMPSD+gzDO0rE
	 Wwe6vStUO41BvYAU8Oy8u56n/sl17Zx5DhS4i9IMdq5dCdaWDodcm5k6ez4sqwjhnG
	 CwPvtJkSk3DuCain1BtAPf+oFrgulmk7QPg/RHggcc568fbMVOibbaHr/kIVlAWfIl
	 5nGxe78QtUveIEqLxrpqzTrVu5zQc30aKRL/gdpFVkHa+y3oOdmYnX2QSvOTRrdKOs
	 OhnWO9is3WhLlI2s+uiyy+JzqxaxQUoxrHYLokKhhWBFGa5/sDoWNiIdiNDUnT+kNh
	 jPrkoAvfr5LvA==
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
Subject: [PATCH v2 05/28] ALSA: cmipci: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:23 +0200
Message-ID: <20250423075346.45907-6-phasta@kernel.org>
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
 sound/pci/cmipci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index cb8593c376ee..b00df0a60d3f 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2980,7 +2980,7 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	cm->channel[1].ch = 1;
 	cm->channel[0].is_dac = cm->channel[1].is_dac = 1; /* dual DAC mode */
 
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_request_all_regions(pci, card->driver);
 	if (err < 0)
 		return err;
 	cm->iobase = pci_resource_start(pci, 0);
-- 
2.48.1

