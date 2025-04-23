Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B427466D;
	Wed, 23 Apr 2025 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394937; cv=none; b=iuJBCfnvir3Icw41+YX/y/rTqrZpu+mju2OoViGajofzEkAzMtfcTDkH0orISuENZ1wGyA8eIxl4AaihPDQOMTOgDPX/DqVVyXuUZtLSO5/KnxQoC9VJEU/uR8iWzDRSKY8tKNG7NXjPitsW0As9DOYslNwVQTr/hBilDaA5cXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394937; c=relaxed/simple;
	bh=81LnQXQ3jZoLQH8C61dQCX16AgtA56SkQ7xh3/MmwHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZyHej/nYo4X7yJoTmEbpMYZtIi8IZzyp5lLSvyOQxEio8U6nDulPPn1I5TOl1Gus09AP4EIa9D/FDg1qVvKeNdUHTSnqoQQl7V3A6j08gh4byM4NiiUDjd0vbx0zlnAaY85Xu3b+yMA1x55IaCtrr6ShRr/rBGGOIxkUdO4SRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/TX96V4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/TX96V4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2270C4CEE2;
	Wed, 23 Apr 2025 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394937;
	bh=81LnQXQ3jZoLQH8C61dQCX16AgtA56SkQ7xh3/MmwHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n/TX96V4SCBDZk+jF14wJnMTigtbuJVW/QdglHSPFxQpnoMhmse8k9BdivsB/ahY/
	 D161ro2SD/4mJXfxv3IW6+DZq2JR7gULxXQ6+vqlIe+W99p8N6+a59fD7jXdeuiUS3
	 nfnYPsXyK10LrVdV5kXiKazH0R7UJ4BNkhZthbDNq1FMyyyyXolDUxIM53hzz1qYEg
	 /EMHur+ohkVtKxsAU5HUphK8LEI61OycIMTxs+vcWX0I3lGY+CRDYddT3r2YQWrYWV
	 Oxv9wuxIngvTcrZkSTIaPFmmjYwyFI/ijopyClU7gVuegJwVSlSxfZJIdFsPxzHI56
	 rPvR2ALocq0MQ==
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
Subject: [PATCH v2 17/28] ALSA: rme9652: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:35 +0200
Message-ID: <20250423075346.45907-18-phasta@kernel.org>
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
 sound/pci/rme9652/hdsp.c    | 2 +-
 sound/pci/rme9652/rme9652.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index dc326face54a..873b7eadfc50 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5277,7 +5277,7 @@ static int snd_hdsp_create(struct snd_card *card,
 
 	pci_set_master(hdsp->pci);
 
-	err = pci_request_regions(pci, "hdsp");
+	err = pcim_request_all_regions(pci, "hdsp");
 	if (err < 0)
 		return err;
 	hdsp->port = pci_resource_start(pci, 0);
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 5b8dd7b0a02c..34d9c7995ddd 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2406,7 +2406,7 @@ static int snd_rme9652_create(struct snd_card *card,
 
 	spin_lock_init(&rme9652->lock);
 
-	err = pci_request_regions(pci, "rme9652");
+	err = pcim_request_all_regions(pci, "rme9652");
 	if (err < 0)
 		return err;
 	rme9652->port = pci_resource_start(pci, 0);
-- 
2.48.1

