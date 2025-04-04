Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128101EBFE2;
	Fri,  4 Apr 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769226; cv=none; b=DTz9RFbEQOQBaJbeyTfDZcSEtBCsx0yt+4AK/+aJ+KtBLn7MWST0M12ZOVb7fUldrMsLAGABaR3pFm8Hy1fy8dmJtXHRGONptRQC8RZ6ZKyXEok7pUJyFjQ0phVsaEHZVnl+VxQMjzFK3oO1SxQqJr2RzHzx2ZL4wLG/9jyEebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769226; c=relaxed/simple;
	bh=s+giwPaT/Tv9s/df4azVB4o/cHwapfcHYHXBslVCdOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bx/CBEnsoHfBVPuxRsZzXFGoXKLtLt9Fcnk+6lDGjaKweihPJXzfhg3pyQUuZbIfLI46LV43FZINGka36vi41Q1bErfrZVW15MDeP3FSOLyMeRYIdtuE0UWSPrhQTFfo8yFv4SR8Hm+vX429Efcc8vbzX3r0f4SrKQ0PFXICSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZIHhL+w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZIHhL+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699C4C4CEE8;
	Fri,  4 Apr 2025 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769225;
	bh=s+giwPaT/Tv9s/df4azVB4o/cHwapfcHYHXBslVCdOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZIHhL+wJKM35i0cwXBtvcIJv3nqbcBfNFsdbO5hQCEpwTuA2Spk2AYqqHG5bfiTG
	 ixRIbd9VS/djCN2RpMI4pol4eM88FZxbV4Sm659k+E1IsGYIldPmi+W+ZO2k/goAJ3
	 qQVoEmEIXCj8+OSFELVUgW8yukYDv7c9pzlkdawTlG9+deXT4Q1MWC7IYASmeco07h
	 grFkmXddflaJbzQXl5TFwIkZqCQa+kbOMCwoQmzS3s0eLARjjXpEpXPzzZthY1C7D3
	 sFXb4c9LTuiX1Eendh9WdJ79KRHovPKAvI9ia2ToElrZ8Y5pyw7ocRKV/rzdJMboxC
	 4PtzEkoBQtvzQ==
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
Subject: [PATCH 10/11] ALSA: hdspm: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:11 +0200
Message-ID: <20250404121911.85277-12-phasta@kernel.org>
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
 sound/pci/rme9652/hdspm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index f89718b19d23..9e11e60284eb 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6558,13 +6558,12 @@ static int snd_hdspm_create(struct snd_card *card,
 
 	pci_set_master(hdspm->pci);
 
-	err = pcim_iomap_regions(pci, 1 << 0, "hdspm");
-	if (err < 0)
-		return err;
+	hdspm->iobase = pcim_iomap_region(pci, 0, "hdspm");
+	if (IS_ERR(hdspm->iobase))
+		return PTR_ERR(hdspm->iobase);
 
 	hdspm->port = pci_resource_start(pci, 0);
 	io_extent = pci_resource_len(pci, 0);
-	hdspm->iobase = pcim_iomap_table(pci)[0];
 	dev_dbg(card->dev, "remapped region (0x%lx) 0x%lx-0x%lx\n",
 			(unsigned long)hdspm->iobase, hdspm->port,
 			hdspm->port + io_extent - 1);
-- 
2.48.1

