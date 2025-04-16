Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5351A5B9F;
	Wed, 16 Apr 2025 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809376; cv=none; b=er7Xbu+nlz1W8fdQlpkAKbBxcICFLaf7QQUGDJDEeKU4UDXl9l2OgM3SSsYFBdP4kzTOLhwWrfpxqaiTfZcIhqkZqsVnXg7SKDvOCrvARCMDGLt9zJfUarsCsiMUj1GJ6FN/Q3t2zCAbes6XfH5Cyf0ydq74wQNVXc860NDLFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809376; c=relaxed/simple;
	bh=oD2DV2ngAGE3L/ba41pDYijN1kN37YqfhkNs/6XEIMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baAZltUvA2//MsvZsyHmggz2fVmx7xP4wlOjwLyLgwYRdMACpGdBCs+P9Ljifp3Gu3qpTEn2SjnRtDyE7GYxxowKLI48TE0U3S15A7Gw7N7QLVpm3QkjfDvdoJr1fy8NAI6MHXq5lNm/JF3Uul5tjPskitdVNtabYRqxqSwChD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzFrv4Jn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzFrv4Jn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D6CC4CEE2;
	Wed, 16 Apr 2025 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809375;
	bh=oD2DV2ngAGE3L/ba41pDYijN1kN37YqfhkNs/6XEIMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HzFrv4Jn+1pIZq35GPQuUSNQPVNP4UDd2O5Kj7Sei2ROpkBCJMgJt0FaoL58DRnpZ
	 fSHqeAHqF5rvF+uWxAF/R1QeNIDGeDbf32KMeF/wLoBuSSpyEEia2oc+fA1ac0Ea37
	 oFlcilyfGEZyTkFpgK6C/VGf5dkLhYyyB4oQP1RzVkvN5HMoU2TTOf9c/3LPZmfYwv
	 LO7/XMc0PestPSferh0nRMugtNiX5NhJI1egzMk0Q9PSbFPv6hNp3Ix0LfsCdRcZ+X
	 wZ0AduIQzo63M6xgN0J2vVyBGcQtE2L2H+XDcBYpxvqw4C6flkuyR8h/6UFwDYdk9Q
	 uXAJ+Y9ia1gqw==
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
Subject: [PATCH 29/31] ALSA: ca0106: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:39 +0200
Message-ID: <20250416131241.107903-30-phasta@kernel.org>
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
 sound/pci/ca0106/ca0106_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index cf1bac7a435f..7c7119cad63c 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1593,7 +1593,7 @@ static int snd_ca0106_create(int dev, struct snd_card *card,
 
 	spin_lock_init(&chip->emu_lock);
 
-	err = pci_request_regions(pci, "snd_ca0106");
+	err = pcim_request_all_regions(pci, "snd_ca0106");
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
-- 
2.48.1

