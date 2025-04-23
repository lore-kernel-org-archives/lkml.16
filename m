Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637F2749DB;
	Wed, 23 Apr 2025 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394949; cv=none; b=fvgjeM6UqJRDe128h4reBko8ymaDPyeI02kGt9c5O5PBdGQ5ix1JR4pgphJm9ifnkzoH+bc1GSgVglWlOHNN4vV5IIkdHmhLdH7pV9Kj+7caQgjgFApLWavHuUDP1LdDk/F+TZahwbMZjZV+Y75xClGztYZkO4MTKVjCb3G+gDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394949; c=relaxed/simple;
	bh=FOml+/b/imwGGSqny080hhfuNCDfVvOdmZO95YoEmPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZ9UEuo7uUdmgpu78ds25heI3MhahXV9GdBLot3ervpMT9EfC2Ywe94qg5xv0lV9shwX+st8U0vlqCbAkc8bQwItin1/AvmUV7plhCNO4IedZ4o+IIYXMhxv1ow+EGFcSEkH8ur430lQUA88wZfc1hP7JPgejMiH8Ft4OrX3CpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pizUXIS0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pizUXIS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598F0C4CEE2;
	Wed, 23 Apr 2025 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394949;
	bh=FOml+/b/imwGGSqny080hhfuNCDfVvOdmZO95YoEmPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pizUXIS09V4HZRnSBYYlUjnhxPbgdLU/2FnztyA/arI9ftV1t19aEliI0+WMC73g1
	 uIqjSzGSn22HQcZIFZBF0nT83MOAY3U1Z33xj2GwunIiDV0jgUDUvQcCbWpXOsxwyK
	 +24zg9Gp+SbclUfbP8V8OJ1XSJx/vbkGC+UaLsu/Nv8tOioHLH9VxhPgdIscnGAhao
	 RHueUxbCE795cwjQa48NvsnKMWNWjnRqwTN0B77+kX09Cn31jntuCWw25LH5qJnxWx
	 6MXkC/dP4PA9ojNiDe3AI7MFDkz5RQ5UREAwx5W03xOQtr4/rXqoe1koZK+9PeZ7FU
	 HFumJ6RsBS4cw==
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
Subject: [PATCH v2 19/28] ALSA: riptide: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:37 +0200
Message-ID: <20250423075346.45907-20-phasta@kernel.org>
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
 sound/pci/riptide/riptide.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 329816f37b76..578be0755b8a 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1831,7 +1831,7 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci)
 	chip->cif = NULL;
 	card->private_free = snd_riptide_free;
 
-	err = pci_request_regions(pci, "RIPTIDE");
+	err = pcim_request_all_regions(pci, "RIPTIDE");
 	if (err < 0)
 		return err;
 	hwport = (struct riptideport *)chip->port;
-- 
2.48.1

