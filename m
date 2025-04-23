Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D181E3793;
	Wed, 23 Apr 2025 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394921; cv=none; b=PQoZoh0sQOHFGhtN7aA3CuKNiw9F4vYyLx/r5e/l1HWNodo7Rup7jiZFW+XEtE550O5zmz+e+O4hwPnNj52y1KhM94coKZkrOQjACtGFAhN8yFeV7xIKtNP4yXN7O8ZnyXZ/X2vzpaS1H+UGSjIwxavvGBjYdV2O1G/bIOA1CBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394921; c=relaxed/simple;
	bh=WJYylwhCepb1SNsaRnb/rTV5rCelb585I7xMBcKHMJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAM3vXjZF/sdlBBZnTfRRy+fCLeWLYvawKqs2Ksq2jk5k65gL1fWHcAin+SFSgIM5zoJ5Tq7YUKC+tQVCgOdvNVzrqKL84egXYl0qN+5pvnRzaUceogD/MWWgJFOapPRKCKlONEgxDQBg/TnHFIYd0x2p1u+7plM3s4J5PCttTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tffuB9CS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tffuB9CS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DB1C4CEE2;
	Wed, 23 Apr 2025 07:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394921;
	bh=WJYylwhCepb1SNsaRnb/rTV5rCelb585I7xMBcKHMJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tffuB9CSQVsXysR8StVkUU+VGT5twYPHrqVVlRBl4Np7x6UJQfQwSMzo/5Mb/Zc2t
	 tIIWsPUkMz/8ln03M0+FZgOFKC4c43mfuRFy7MLc+NA1fRRMYiVccSxD6IaQLB4xSX
	 iWnQKvNQF9J4J4hkNQ1P4UGPPqLspPsD3OvMBEt9P9ZxBbHHgGIAA7gIf3R0Mr1qJ7
	 pmANq2uvv33is/hU0AEP7vZinzJ2zsEsnOhkFB0/nA924krNBVrU0XOOARf0ytGN+p
	 8fkIU4LgAt90gYck3RVm6Z46vIVbP4td66MiTtC0noeryRpDO5bFFYRL4pBumkM8rm
	 uMUZki6qLVd8g==
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
Subject: [PATCH v2 14/28] ALSA: lx6464es: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:32 +0200
Message-ID: <20250423075346.45907-15-phasta@kernel.org>
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
 sound/pci/lx6464es/lx6464es.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index bd9b6148dd6f..63ebf9803ea8 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -944,7 +944,7 @@ static int snd_lx6464es_create(struct snd_card *card,
 	mutex_init(&chip->setup_mutex);
 
 	/* request resources */
-	err = pci_request_regions(pci, card_name);
+	err = pcim_request_all_regions(pci, card_name);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

