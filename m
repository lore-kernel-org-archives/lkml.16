Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9959926F47D;
	Wed, 23 Apr 2025 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394893; cv=none; b=nig3iE+djfXMb0+P3/m2uQHKdK8SmuLLdqhxfQDxP5NSC8UK0PDJdpLK4t/+Ge8VUCFoAnP4iPH/8X/zx7oN3V/TJpdI+DsKdYDa4Sn6QrYCSTqtEqBCmd9SpBkr7SJv7dyGI5u0kTTf+NmKMG5dYhZePcsdjUDm5pZypHDIF1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394893; c=relaxed/simple;
	bh=ckUPC+gII0Muaj2FUy9202+fnQ3JDo4zEO/VHhFmR84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzTG7wezV7KQa4SlFZ9wnOAzFBlHHd4dH273JpKem9K7TS4rN5mljIyxdy1vRGHFGWEPB61m6re4QAU0HtLdtnCmU9mYjP6jEHKB5qoSqmbI9IIg8ZYhSUEHdUAuuIB99CVvSB0qqiM+uH0qsGHiAinYg+DvSiVg2YJQgNZgkUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIJ6SzUv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIJ6SzUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B24C4CEE2;
	Wed, 23 Apr 2025 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394893;
	bh=ckUPC+gII0Muaj2FUy9202+fnQ3JDo4zEO/VHhFmR84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BIJ6SzUvpz2z3mK8tw/5gDaNPsKbcP2ME8yU1YxDV3xHEuJtbnclhOEVfcnPokK7l
	 RYXXzAR8NDcvNI3eAm33pVr2xAYJXJEu3TcTxptKgjgqkVWzzP55ZrYEhBescUq7E7
	 unEe+Wf1SZjbjanCuz/2U3LVrxr8kRMd7g7MHY/P3D829Mn0MH/x5vV5FlPdlHw+3F
	 WcBevdfTfGR3drWrN226dzpbV2rnMBRlfLQYVGi7scNjdw4qxbudzCVqA/PG65jhFG
	 sxb8JEx7oX49VsPkwQeHzrpyC+yXyZ1E/Jh9QHNHkb9xFUcPtaxKksRcbkyJf/qOXb
	 ECOl8nNsHautQ==
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
Subject: [PATCH v2 09/28] ALSA: fm801: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:27 +0200
Message-ID: <20250423075346.45907-10-phasta@kernel.org>
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
 sound/pci/fm801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 7f4834c2d5e6..f283256eda0d 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1191,7 +1191,7 @@ static int snd_fm801_create(struct snd_card *card,
 	chip->dev = &pci->dev;
 	chip->irq = -1;
 	chip->tea575x_tuner = tea575x_tuner;
-	err = pci_request_regions(pci, "FM801");
+	err = pcim_request_all_regions(pci, "FM801");
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
-- 
2.48.1

