Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5161E1E0B;
	Fri,  4 Apr 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769211; cv=none; b=Y/mQDg8ZRUWleBqt3Z7E9P5D98THo5URWy5nIyPQDscIXBeyrwam3sDHybzA+mNqlX7sHePQwsUMDvKjdGnG9tRwTJmorXqP24cF1OXuJh+on+AFWdxNdnDjjIIq7qJiIDguwS9RnlXLAjLLWlc26fC4PxKgZNmdwgK6hnrDirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769211; c=relaxed/simple;
	bh=Eqsmusvff21LEc4e+xTapm1qlONThwACIGwwNzzDYes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYaHWcDUgkrszSoHgkI6J437FfLyDeGZ+G3HO07IxhUqKblcYbJXTSdnpsqn9N6a07zY+7/+LzKS9tF8YKz47A+b4x7N0Rc0CjZG+lq6n4tUSv9gKh1coIPtYpDeQEwiqPJYMRG2QV3tO/K596WC4PIKZyvMXjfKIKLRtI72EcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kES0BanV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kES0BanV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D95CC4CEDD;
	Fri,  4 Apr 2025 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743769210;
	bh=Eqsmusvff21LEc4e+xTapm1qlONThwACIGwwNzzDYes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kES0BanVXI+MEEwo3ykIbIUejtytVP+oqUaQDOmX3XowootcdlcdF49rhdrK5NlLh
	 CVS8HBTCYumvUf3xy70KiTpvK1kzakjGbB1UWYfwAF6BKbE4nv9x3Qs+/bp3dN8FlR
	 CG1Rg0oFIn6lRIVYzWjahPz5bz/gwMvRoCQtlE4Jf6UnCGqBbu9v4q764qubZfsztZ
	 3yppmSBpT3HsBLFAmRQ68H1gMu4I2xkJIJNJRj6ADdrFXHfyE1eoMFxCjTjoeWcV31
	 kSJBweQBzyrx+E1oTwPM5fUt4RClHC7OGzSK6qRaj83tbej/di3qhAWFduxH4pbcVG
	 s58jJiyOthozQ==
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
Subject: [PATCH 07/11] ALSA: hda_intel: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 14:19:08 +0200
Message-ID: <20250404121911.85277-9-phasta@kernel.org>
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
 sound/pci/hda/hda_intel.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 512fb22f5e5e..9756017930b5 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1877,12 +1877,11 @@ static int azx_first_init(struct azx *chip)
 			chip->jackpoll_interval = msecs_to_jiffies(1500);
 	}
 
-	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
-	if (err < 0)
-		return err;
+	bus->remap_addr = pcim_iomap_region(pci, 0, "ICH HD audio");
+	if (IS_ERR(bus->remap_addr))
+		return PTR_ERR(bus->remap_addr);
 
 	bus->addr = pci_resource_start(pci, 0);
-	bus->remap_addr = pcim_iomap_table(pci)[0];
 
 	if (chip->driver_type == AZX_DRIVER_SKL)
 		snd_hdac_bus_parse_capabilities(bus);
-- 
2.48.1

