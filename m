Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED791E1DE2;
	Fri,  4 Apr 2025 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769201; cv=none; b=DXt8ivO3a97TQPjOG2/XlGxUaa/xUfVA5fCOukV3XSvnoNtl1tlZzGrXypnkj3488OK0hH4VA6y4Zbdk0IcNw8VmMD6t5fc1pbenWgwCUdqkO9qxTcQyqYXozFHWY1keiVnF4wO4z5v21A08xpVrMGsnLk7P3bdyDbhz7WZLQFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769201; c=relaxed/simple;
	bh=fbXea3Shj3guiflysHMHcCIqhdLN2+X5cOpXRldk+4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+KjR6vUEq6lBfH5SrEK7MSfZTxZUwqAe3sKOyfwawA+mkXL+R55VDpThjTOIh9OC+t6RkvBC7CMHdzMO53tJohMHZ6Dxb0fh5pwAculH7a6XQmv0hBg88iVRjU3WtE693rb/toX5nz1QXnsIIwBRt7M05MA1xO14goYYIG3nGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tn0Ct4Mu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tn0Ct4Mu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86529C4CEE8;
	Fri,  4 Apr 2025 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769201;
	bh=fbXea3Shj3guiflysHMHcCIqhdLN2+X5cOpXRldk+4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tn0Ct4Muok+HTFcxJ+vpAgclnXQQD+YjBZK9C4pXL0GUA4UD0b/jUN8r5wahRpmAO
	 xfnrRWHHf7Az1CtmKWQYlgjIpOAlEfcMH1+OlC48zKqIpB9ApTFHx783IhqmSRRyq3
	 QegUvSfB7pDA9YHGZ9Jw40rNL5qh7UB03ltoadRaYnAAKkw/qdleQJCDPObdW1GL0N
	 oLXXHH6sXvn0S/o/W0Ykm+uWbYbaprRbsM0LW4m87/qvcZLyIsGAFDjASCZFUT4U/+
	 pJFXccfOotlltD/hwUkRshKCVsnr4MxZZ2E19ag1HAcT3SjCW0UB2esvKJL/RTcAZd
	 5EAfFw2jC5ing==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Philipp Stanner <phasta@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	He Lugang <helugang@uniontech.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] ALSA: bt87x: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:06 +0200
Message-ID: <20250404121911.85277-7-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250404121911.85277-2-phasta@kernel.org>
References: <20250404121911.85277-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions() have been deprecated.
Replace them with pcim_iomap_region().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/pci/bt87x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 621985bfee5d..91492dd2b38a 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -696,10 +696,9 @@ static int snd_bt87x_create(struct snd_card *card,
 	chip->irq = -1;
 	spin_lock_init(&chip->reg_lock);
 
-	err = pcim_iomap_regions(pci, 1 << 0, "Bt87x audio");
-	if (err < 0)
-		return err;
-	chip->mmio = pcim_iomap_table(pci)[0];
+	chip->mmio = pcim_iomap_region(pci, 0, "Bt87x audio");
+	if (IS_ERR(chip->mmio))
+		return PTR_ERR(chip->mmio);
 
 	chip->reg_control = CTL_A_PWRDN | CTL_DA_ES2 |
 			    CTL_PKTP_16 | (15 << CTL_DA_SDR_SHIFT);
-- 
2.48.1

