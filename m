Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A235C278E7E;
	Wed, 23 Apr 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394859; cv=none; b=ZoVw3oHiOl1AP4nXfGFEfzof69jp0Ld/wYCweAk4wgMDlMjbBLxK/B73UQiB2aw/EHA+vG3KkAdR8ju7IZYavcTukjxIw4cdgEF90PVGDDEDnOpu4m3oSkVYTabxFix0a7vtvichJtbwmWorMyFA1Boide0/w05/uxQNZyJJhZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394859; c=relaxed/simple;
	bh=sVjY/9VaxYVlo1WsAcVuLK++iBH/bVgweDbZRouF+lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dug7hOem46xjKCGy1fZyZddYzODTru+Ns9cQlhOgrYWlew8HZXSz4wOOTUlZqYUuD8f02zM519Y5YdRCygRNq97vCBpFpcdAE97uFHnhGkY6+uj5JL+rysimG7+y4IFbP16jWxXMmyNCl4cTbPnEhx+RLgELJc7MT32S8FubCfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sA6Sw4gS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sA6Sw4gS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C51C4CEE2;
	Wed, 23 Apr 2025 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394859;
	bh=sVjY/9VaxYVlo1WsAcVuLK++iBH/bVgweDbZRouF+lI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sA6Sw4gSCSyrQfVFYTQVAMxRt/R/yfDOHkARVPKplcYCZBdjizO0EUIIOH0H0usH4
	 zzsDlGZSxXKC6mN/RhB4spLLNgS/Ew3CcREwNxSHQd8/lN//392Xny0UIjb9CqiuxY
	 G8zjfePYlp2b8CYEJMHQZxHJwYat5YR3yaohkfdwtDISRAO2/+AuBKB+/8V8rZNBeY
	 U1AuoRaEsoA70y5v5ZRu6/d4Zxp7rbE/GbhexDqxhXomNJaINUcWZxl+djidyT2GOT
	 9vqSh9sH3Q5H5LMHcQ60i8zAajXLdCFleC49ur8FtisBzKdFPGfPMdxQPp7gCDX6Aq
	 +elPGbjZNorIw==
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
Subject: [PATCH v2 03/28] ALSA: rme32: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:21 +0200
Message-ID: <20250423075346.45907-4-phasta@kernel.org>
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
 sound/pci/rme32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index a8c2ceaadef5..4bf122abea48 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1284,7 +1284,7 @@ static int snd_rme32_create(struct rme32 *rme32)
 	if (err < 0)
 		return err;
 
-	err = pci_request_regions(pci, "RME32");
+	err = pcim_request_all_regions(pci, "RME32");
 	if (err < 0)
 		return err;
 	rme32->port = pci_resource_start(rme32->pci, 0);
-- 
2.48.1

