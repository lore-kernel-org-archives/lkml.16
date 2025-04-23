Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F2E26B972;
	Wed, 23 Apr 2025 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394971; cv=none; b=No7qFTvqfmq67Q4AphVlmQaZdDB2FGR6rrnBGmHcUmiLbZ7m/0Bh1yzNVTeasDmxeIkRQ5RVjulTi+kdNmGXBRXssWZzIbLJhSY0s38Pl0aNPK9x5FsNw2mxgNoKsChrg6QohK3jfQKNgstw/gNSsxMFqOEN3g/fSzrpKr5l1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394971; c=relaxed/simple;
	bh=xhHJ6NrNjgWVvLXfeckaVT5bsoFk3guU27u3fnUlOqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXy4LXewflW6i3R/Vzhyr/QLtJfWNk8/QxR1RVvtub/abzleWpOfyGtoctR1O/LEdJnE/GmIzngAgAmJDheDy9DqE2cys3WTLvpDAeLAFpml3Gx5L29azQx9Sny1BA9exDxWXmUEkE2dkNTcrOefIc+8SI95doZCF0G3TarPVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcZRhxHL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcZRhxHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C67C4CEEC;
	Wed, 23 Apr 2025 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394971;
	bh=xhHJ6NrNjgWVvLXfeckaVT5bsoFk3guU27u3fnUlOqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcZRhxHLGvEBghLr2S2caLHuVWUJl0+/TxGVQokCdsoowtDTDdY5B0shgKFlc5+hi
	 DOhHSkN9XXr3oy08Uxaa0TdAFshcMYgKS6nRyEBovqvD8CbM1A1Esr1/ZHy6VR9w1Q
	 nsqGGR92NXfNC98JYSaxDqRISAySW7JpC5UD1/cICe6gEWFjSSjU1OeVG2d9MspOWh
	 wenrOvFiB11nPmFYfvZcoYJxPMqPRdgwPX7UYq32SDlgGVspRZV/DuR7T6kJDcphhN
	 GrljrsQ58MNFfpruJA8+5FHTn8dOOd5YOthFR+W82fxleKPE/Xhz3GgmKDj3bbXqQ1
	 YCn0wTyhEw7rQ==
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
Subject: [PATCH v2 23/28] ALSA: echoaudio: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:41 +0200
Message-ID: <20250423075346.45907-24-phasta@kernel.org>
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
 sound/pci/echoaudio/echoaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 4effcc0090ac..80d8ce75fdbb 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1910,7 +1910,7 @@ static int snd_echo_create(struct snd_card *card,
 	chip->can_set_rate = 1;
 
 	/* PCI resource allocation */
-	err = pci_request_regions(pci, ECHOCARD_NAME);
+	err = pcim_request_all_regions(pci, ECHOCARD_NAME);
 	if (err < 0)
 		return err;
 
-- 
2.48.1

