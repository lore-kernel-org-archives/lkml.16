Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C501DB363;
	Fri,  4 Apr 2025 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769217; cv=none; b=rO9K5p01cJk7ZAiOwqOcd9fTwqE7p0YZAfyxU9LSm7iCqzd9DgaKVtL7aIEBCHkXwBQeYGieHoXGTkkCg9Wjf6BuZLbUtA3CrLIpdJ/fH+nq7eGHqHD98N8nuev2DLG6wU8Ks2ECwDIu+c9IM1pWC/SdYPOX0kedH4Ah4ogZutk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769217; c=relaxed/simple;
	bh=9KeLJD7hn/Cvu1GycH77pEkfx5NqVTboX7GrRF9VRkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saaJt2z1j44Z3FZwDKKry2mQkAj59oEI3R4m4o0+dyH21mSEOn7ZF790a7IQ9rkaNXVwZLG8h82/jxQ3okEaDn30aBsQZuiS7+9201b749664hcfGx0nl6dvAD71zgeWWvVXgmEKBBnKlls/w5TGFeJNiCN9BdkPRh8muTpvej0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCj84H31; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCj84H31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73097C4CEE9;
	Fri,  4 Apr 2025 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769215;
	bh=9KeLJD7hn/Cvu1GycH77pEkfx5NqVTboX7GrRF9VRkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NCj84H31pCom1IUCddDmd5M7mJn26KIuWe3KCQKt+WqZIa0gtxIi7gyz5T6vs28Aa
	 0AGFYhif+ci3/NtlETiSo1nciHq4fCB0oMkuNuWk/os0jeRL38fm1ouL+r5KBWQXq+
	 77TjMM2UsgLELBfJqjGruO6LvUOlQ8owpVDi248DCnvmqqhKnBewuuCalrHZk9CnaZ
	 uTCvDXlt3WQ2ZUZnAdBXzluYzdoihllkSCryOHNFrqBMHvY9kDAM3Y40jfexOTDYir
	 sx6ilzD33hSZ3SZ+LsSmSWS+W6x++5qry4aTTA3lJloAQuuR7GOkD1EFbaj7LjL8GT
	 Kwipuh7U7Msiw==
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
Subject: [PATCH 08/11] ALSA: cs5530: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:09 +0200
Message-ID: <20250404121911.85277-10-phasta@kernel.org>
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
 sound/pci/cs5530.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/cs5530.c b/sound/pci/cs5530.c
index 93ff029e6583..532891e67c34 100644
--- a/sound/pci/cs5530.c
+++ b/sound/pci/cs5530.c
@@ -91,11 +91,10 @@ static int snd_cs5530_create(struct snd_card *card,
 	chip->card = card;
 	chip->pci = pci;
 
-	err = pcim_iomap_regions(pci, 1 << 0, "CS5530");
-	if (err < 0)
-		return err;
+	mem = pcim_iomap_region(pci, 0, "CS5530");
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
 	chip->pci_base = pci_resource_start(pci, 0);
-	mem = pcim_iomap_table(pci)[0];
 	map = readw(mem + 0x18);
 
 	/* Map bits
-- 
2.48.1

