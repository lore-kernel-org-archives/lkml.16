Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A019AD48;
	Fri,  4 Apr 2025 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769183; cv=none; b=fJ+kYpRKAoYYpeul3dEecMRSR0y/aSnXF7niQP4F9oE097FiGbs3r7NXTOUeTQbJxZp21mWIg5Q/YFmDo6VTVIOONP7XvwmA3o0ROtScEJGbqAJZH8sxqe5s1uloR7cr+CFhH2c4VWW5r+5dct+HMHEfzHqiSu+qxojEtE3Do0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769183; c=relaxed/simple;
	bh=6EyrOB3NDM1VBqOcneGBh0mEfK+tyesdMZnkwt2FIe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/DT3k8gB0u1vUoyh/nXXG9CW4RzMLwU4+jAO6ouhu8eXsaNW/RONOsyBhIA20SmH2TVGJqTEJrQmhGsPiuw23Q+8VgWzhfoLHsdfe+xG/C60Vh+JCwPt1xf1Ti0NWF/lOOANWCmsul/Iy9tWQNHRJ7wbZAb/qVikeeF7KkkeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHgIw6K6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHgIw6K6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C54C4CEEB;
	Fri,  4 Apr 2025 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769180;
	bh=6EyrOB3NDM1VBqOcneGBh0mEfK+tyesdMZnkwt2FIe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lHgIw6K6ygGoKTDPN1RyQjMAotnvnfcrg1Qk1w22LG5TiuCy+bHC3uoYYwgiIlEqK
	 ezt+hjk5oxLYnSdCCWXGyvLb5n7kOAky6D3XOPWz57cA/zATrZKTFnyjxXmAvS2u3o
	 rvi7KI5NaRktwIrwRP+vJfw8RRAGqlIyz8YmDKcWG8DYB8d5AA44YZ2qhuGapBsYkN
	 M0DeR51AFhiedEsrZaaJdwyioe+/m0R7pbB8AxL/r6agGBQftfM1MjfyAUPqFc79g4
	 F6H3L4F29nYP7CL+Keivx3T1Tt812US/jveoz3i+sRCfb2oUzPx8rDAeXZdpf9K3ts
	 +iVAB2Z1vgiEA==
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
Subject: [PATCH 01/11] ALSA: ad1889: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:02 +0200
Message-ID: <20250404121911.85277-3-phasta@kernel.org>
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
 sound/pci/ad1889.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 9ed778b6b03c..ac27a93ce4ff 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -810,12 +810,11 @@ snd_ad1889_create(struct snd_card *card, struct pci_dev *pci)
 	chip->irq = -1;
 
 	/* (1) PCI resource allocation */
-	err = pcim_iomap_regions(pci, 1 << 0, card->driver);
-	if (err < 0)
-		return err;
+	chip->iobase = pcim_iomap_region(pci, 0, card->driver);
+	if (IS_ERR(chip->iobase))
+		return PTR_ERR(chip->iobase);
 
 	chip->bar = pci_resource_start(pci, 0);
-	chip->iobase = pcim_iomap_table(pci)[0];
 	
 	pci_set_master(pci);
 
-- 
2.48.1

