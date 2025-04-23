Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5586F18D63A;
	Wed, 23 Apr 2025 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394927; cv=none; b=WG02FWidjI5dmQmcYJr/l/O+QyN/0bnH+BSoegZlQc3biOwS5kO1ImIUFgO96Hqotizx2+rRxV3kCtcQ5jDYNrfJV5YcrjKfJomYqNk6UAzt1K+SiR/S+MZDLPLOT8iluJ7SXvJOXmJPp6nDTNsAjvzRYP1/ic/kFwVOmH7qljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394927; c=relaxed/simple;
	bh=pRlQuKwYT6jW8iLQvmqLXqutr9MP9tCZHFL43ftBrws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGzMm4+ntyvELV/+eNX9ilhWztfLvq+SJXknqx5NN9S/iRYyUy5P309H46VYupi9SBANvXEAvZjorfKwc7ZORCOiExN6un+Lmcw3PNz/O0WVPjh8FWJC93IhfQ727Q2AjngBFudWYa9aRQwEbHUrWTZpjYBvJyWYITWuBVUz93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNyBMOBN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNyBMOBN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C53C4CEE2;
	Wed, 23 Apr 2025 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394926;
	bh=pRlQuKwYT6jW8iLQvmqLXqutr9MP9tCZHFL43ftBrws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNyBMOBNWQdYVnm+yOBa4Kty5N0oznkPpIkB7ty8MJ/lk8ZgKEqF0mUZEoHKgHimj
	 zesi+6EYwxv5lY/yQ2AuE24sg2+wZh0Bxo1VjFfYfmlJC2JrfUpMTwyYVbhELImytg
	 w61Fygzpg306la6O0su98fiXogzKhtL2JEki7XkSoQH+nBkm6WDPeieYsKwUtdMgeb
	 s+1QPK2y9sn1z3kc7ylnqNwVNQwbfPcTBO1PAOWlg8LOIqiKjxYJg0nPv22jwjUsRz
	 QhsCYA3y0wBAJHX5c7zE4svo3pd7whUty3pVcKSKQ8x3J118VmiwE01ZzYHShVm8XM
	 N4+qFdcJVKovg==
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
Subject: [PATCH v2 15/28] ALSA: vx222: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:33 +0200
Message-ID: <20250423075346.45907-16-phasta@kernel.org>
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

Pass the driver's name as the name parameter of
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/vx222/vx222.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index fdb039896205..693a4e471cf7 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -123,7 +123,7 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	vx = to_vx222(chip);
 	vx->pci = pci;
 
-	err = pci_request_regions(pci, CARD_NAME);
+	err = pcim_request_all_regions(pci, KBUILD_MODNAME);
 	if (err < 0)
 		return err;
 	for (i = 0; i < 2; i++)
-- 
2.48.1

