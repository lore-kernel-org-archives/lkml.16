Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB826C3AC;
	Wed, 23 Apr 2025 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394983; cv=none; b=X7qtEIzyTldoOT9opXjNJ9U0PLsc9Ks90YSztAa6jNHpNDAXgqYAcNDpzWG2wsC0PULYUZUNenrtdGB1qlytyqIbppL9vG2DzrvzGjF7r+WysMluxhO6pndFc3UPFpbOnSa6449oGI+UhxfA9288LhVXlXEUmAQKmy1GQH1rork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394983; c=relaxed/simple;
	bh=DXyvzxIlC1/iCNvghRELrGLjwc/42U+k2+KxW1oFSvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rT0wR72mxCZLPtphZal22W+kT4sN/4izbDka+X0hWd3V7FQVbkZhO+oMWBDVXYjgnuY6Ao+0LGM6+VEIkn73I6Gqnf/vRLdSnZPNxHFSWudpMZdBpg7zSlUIh+nISg9ekJPxmeV0yY5iTwIU522b58APK7hxesj575hPJbHZ3Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H207xFmo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H207xFmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74C5C4CEE2;
	Wed, 23 Apr 2025 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394983;
	bh=DXyvzxIlC1/iCNvghRELrGLjwc/42U+k2+KxW1oFSvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H207xFmoItJAq9Se99p1I/uA8RO5huZztxT89cmpfs1BnkJ6UXBNcgqG1uTz9q80i
	 IY9x+Ao2Ut9cPodXTnKO0PxmvJnCbP0MFkM7jOSjoNQ2inEgw7FIC6QlRaOINfHgn0
	 IogyMI0UtDNNOZgz7fDtQuLmU1pH5gh1/4hR1bjMFF84fKZtvl0RFmDV0gP8H+dl+E
	 H13Lxzw8u1aCJtWo7EKuj/Q6DnpaRNYY8MhZ9P9CEYXOgEd5xli1D9x2dkcwBuQ/t7
	 rtxYVjBr1mgapx31m5joPQB3QelO7P3dQcEJWrynsKJ17ozRzuJxmAase+W7Jx8zUf
	 MEcZslBQ3mmRg==
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
Subject: [PATCH v2 25/28] ALSA: cs46xx: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:43 +0200
Message-ID: <20250423075346.45907-26-phasta@kernel.org>
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
 sound/pci/cs46xx/cs46xx_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index f3a94bb537bd..fb733633740b 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -3839,7 +3839,7 @@ int snd_cs46xx_create(struct snd_card *card,
 	chip->pci = pci;
 	chip->irq = -1;
 
-	err = pci_request_regions(pci, "CS46xx");
+	err = pcim_request_all_regions(pci, "CS46xx");
 	if (err < 0)
 		return err;
 	chip->ba0_addr = pci_resource_start(pci, 0);
-- 
2.48.1

