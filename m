Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0013277000;
	Wed, 23 Apr 2025 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394848; cv=none; b=u/Gbrp1c/fRVY7/JqnxHyzQKSqvyXJAQydX45gC53O3wkDGjkEpu1IJpDG+bC6DptJluA+rqYprftZL4J/tjptcy9/tGjNAUepYiu6ikky8iisaC3BN6KxhnthuzGRNpb1z54V/n/ULIFkxSzUK/GHdV3gDJYLH7k8TcOLdya/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394848; c=relaxed/simple;
	bh=BgLyIthlR1ViWBWQqISVLsAmPUpfYVKzJ2Vwu2Qx03Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONTbSoyDoi60NhxyDnKOJMnbyD8G0JihB4t5aSkEHOjTguDvp4009T7q0An6OUSb+ZcbIIWBjfXiWVQrdpjM94NvZLL5TfW9SpLaQgkxvj6COeZGieJQ6NtmBHkxtNRRk87HSQBHR0qguTazkUTTgeGS0l2oyjFWRJEY1zoE8YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sauz9oQE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sauz9oQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9990C4CEE2;
	Wed, 23 Apr 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394847;
	bh=BgLyIthlR1ViWBWQqISVLsAmPUpfYVKzJ2Vwu2Qx03Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sauz9oQEHQK7J51glj74IIddjBbegHfZpGbMfIAEbaBRYxDQGQTRZRSeXMzvOTxpa
	 cZORTi2JrxT+/Y+DYWTvOEc/CR2EzlK00NHsDkA1t9tSzNc2owh/QnWr3NGI2EF575
	 0CW2hrc/H78gBMPRxUadygGej/OABMGq8ziMvhHWsLxUeL4w85rR9aIUQjacEEXp+j
	 iBfnoR8blEj11N190FI818WsNbg0obJZyn4kn7oVNmwoYQTtXPUb10VtyAbATHbFra
	 8+eI5RURiLrp60/B4W7TCZKaM6MsVcQXK65vGudp4sPPoXC3OOSew8HCruWZFdNZ2Y
	 hQJSZ7C2X2qTg==
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
Subject: [PATCH v2 01/28] ALSA: sonicvibes: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:19 +0200
Message-ID: <20250423075346.45907-2-phasta@kernel.org>
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
 sound/pci/sonicvibes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index c30eaf1038e7..808a793ff4da 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1227,7 +1227,7 @@ static int snd_sonicvibes_create(struct snd_card *card,
 	sonic->pci = pci;
 	sonic->irq = -1;
 
-	err = pci_request_regions(pci, "S3 SonicVibes");
+	err = pcim_request_all_regions(pci, "S3 SonicVibes");
 	if (err < 0)
 		return err;
 
-- 
2.48.1

