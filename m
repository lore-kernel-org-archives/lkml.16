Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B9835962;
	Wed, 16 Apr 2025 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809207; cv=none; b=WXJ/GOKqObv/LuGtdo/8otow3kRniFvkBRMe1eOwIlFSidH3jPKQGWfz2pWsw/t9hY8ikqbeD3QB0AD4zV3CVduHXJkThy/1VYncp5aFZ5XTUkErGblhPwiaSGjZe0ra/gEtb1lLrI2Mzciko3Z8NeVixWpvFH4DeKqMCERoJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809207; c=relaxed/simple;
	bh=19qrJhMk+m82/99hnutTomwXu07hTuTL7FwFxkvNJXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bScNLuELT9+0lNCMN8KJY/VbaHMdXzrgXjYrAlWLHb9Qb+hqqo+5Rvo2CIOyJx5V4y/3zoelk0mxYz2uetWS5Y+ZudvZiwmp+0Hki2h5U2uEb60wz3r54/RMyoZ1/xQe2AtGCOp4whC0S4j2SYqmIwPZznvvCF1mKe4gAqfSkas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wg+Tm4d6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wg+Tm4d6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7007AC4CEE2;
	Wed, 16 Apr 2025 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809206;
	bh=19qrJhMk+m82/99hnutTomwXu07hTuTL7FwFxkvNJXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wg+Tm4d61/Egc7Prrmu7HOid9JKFEOxBu53Fss0cmi2+uodgfDapzzc2t2+RTO51m
	 2aWq4EiC5wwVlqO6vF76BzDrFlBsQTslL5eZgdw9rAB8lncjgYu42Hr7+9WL31/dI/
	 fD6DeRYJIcavLplh4qDPQoZzg5YcCy20n6x+Tu6lhDRvQ4o3EDNydNSvQd/1MXJ7yf
	 MUQrmah/cNkvhM6WzRQpOmiItz4FN/fYQZxvbBa/QW4lQM+dclzCxlIfbWd8wPy0lM
	 mLa+gOTyc9EwEgKX57wx8UWQlg33+p3RfJzPvzJIWNA8lEDrKge4yDYrda8Mewiiz4
	 IqZb7+NlyOFCQ==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Stanner <phasta@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	liujing <liujing@cmss.chinamobile.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH 04/31] ALSA: sonicvibes: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:14 +0200
Message-ID: <20250416131241.107903-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416131241.107903-1-phasta@kernel.org>
References: <20250416131241.107903-1-phasta@kernel.org>
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

