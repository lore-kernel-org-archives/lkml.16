Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D426D4E6;
	Wed, 23 Apr 2025 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394866; cv=none; b=fEvXqhQJ5zrJnYK/Z9OWBnBppbSfmNEBGrmKMIQt8rjvrvyNRQ53zlpUwLvAEkT/qEMEgGG33LGL/1q2MrMneW0u9O7lT20HFVoHSXbqFb5WUTgEso8Ii3qwscRDgMwIo1P2aIEM9q+OaRPBFrLa3fFyK38R7EZffA4d4UTnyf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394866; c=relaxed/simple;
	bh=zp8MWTdchx+xn/ppkDoZU95BK9wmgT/7c0FOAN4CkbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9H3cRcOv+FJkjeFCNsmxUBn6XqmCQgedKZPRvwbuPIBuNh2IuUPUHhTwCzm20nYHY5nVsyS6CchbbrxtYYT1DjEbfZKxqb5SZiRLB9XQco26bbj9ScXzpBJ7d5B5uMMViH8FqPrLmljCpg6TU+Cu5PxERmHVph1mUnNZSXE6EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGJxdhvX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGJxdhvX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD511C4CEEA;
	Wed, 23 Apr 2025 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394865;
	bh=zp8MWTdchx+xn/ppkDoZU95BK9wmgT/7c0FOAN4CkbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGJxdhvXR4sPTThCQAJTuZko7z4HzR+4wFxbLN+/S9RkxgA5+wrmfoMOOXruNWwUI
	 +o5zKs9W0E1aYdcFwNASVN1ozBXKPxTg+ObCu340dDODh5mTpODxp2XDKiDeGqzKH3
	 +5ipqLM/foYOEbJD5U2hfDfo4Rn6dlvdhtNXIyAFsNUUbkPUxRLX52rkvoG1Mjm++S
	 miE4Spb9j3oW/38dPCIkHwK3lrE8pXIQ855/Q8HHkFn6BcU0mAEyWex0QoUJVl0S6q
	 TjDFJJvRKSVo+8VABlb4kXCN9O0Mi0irgRGj8iy9G6MuT1f8QEKiJzenUMLDztQpLd
	 O4ikevSx3PGZg==
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
Subject: [PATCH v2 04/28] ALSA: ens1370: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:22 +0200
Message-ID: <20250423075346.45907-5-phasta@kernel.org>
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
 sound/pci/ens1370.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 71c89e4e3090..1e6adf1ae304 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -2022,7 +2022,7 @@ static int snd_ensoniq_create(struct snd_card *card,
 	ensoniq->card = card;
 	ensoniq->pci = pci;
 	ensoniq->irq = -1;
-	err = pci_request_regions(pci, "Ensoniq AudioPCI");
+	err = pcim_request_all_regions(pci, "Ensoniq AudioPCI");
 	if (err < 0)
 		return err;
 	ensoniq->port = pci_resource_start(pci, 0);
-- 
2.48.1

