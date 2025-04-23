Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3237274675;
	Wed, 23 Apr 2025 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394944; cv=none; b=kYcglsn8FuFNwy2FBIQcNDp8X967QC3wytUGLHGwjQCsGwlg6MHtGa2lrJG6PX/NKtcfwzvC+Z8bJLuEZv4F8jb0S9stNDNu81WlXW53INqsRQjA9K4oy78Ls6/FWEvVU1qej8NmYLGJEZG0XvEsiWaj6xWkI6jiBUYfpU7IB8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394944; c=relaxed/simple;
	bh=D1c33WK4ZllBAGJvl22HwEcQdZW27eAp7Ljv7yzye7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TytNzQh8N0Myia/1jkGLrKGMUKZW167na2IgUIrknj82cEmGiLfba4wbDjWSx+B3JrXVEoGT0iLIRIzPmSj/nXLWkk/oUzudjLbIJQ4DF+mIkQbQOkZVn0dbRQ1auwK+GWH0EhShDCwEQ/yDTsWf7TOZbzawpgoOun5zE+XG+sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI5VRHZm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI5VRHZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A38BC4CEE2;
	Wed, 23 Apr 2025 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394943;
	bh=D1c33WK4ZllBAGJvl22HwEcQdZW27eAp7Ljv7yzye7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jI5VRHZm4j5paCbFySnz+n/Oq1K+dwQlqqUbS947XRuDmqn70pb6HRIq+zvtGGUby
	 6ZSmZz//sQK+sBEcRR7q951RuGT1+lZbBDeNBWDre8So6VFmOFSpPDPbBHytbk2rZA
	 RcJdFJ2nRAL4BEilMUBX9VHJdViK9hoXuowX3qaYQhzRdg9/L/tl8Fjh7G2rRmpZlw
	 hziUP+w8prtRCfehj5Uj5DfhHP18pPbFkwcQDufTx6h5D+++sIE0B32ZZFu2PsIwp4
	 vgMaV/4Oa8YsFPGPxES6XfW4Cn8IOzmN5QvNGi7Ah8ypOgNTDW3evylW55Be0z43q9
	 fEqiI+cU56XfA==
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
Subject: [PATCH v2 18/28] ALSA: ymfpci: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:36 +0200
Message-ID: <20250423075346.45907-19-phasta@kernel.org>
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
 sound/pci/ymfpci/ymfpci_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 6b8d8690b6b2..d495f53a8324 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2307,7 +2307,7 @@ int snd_ymfpci_create(struct snd_card *card,
 	chip->device_id = pci->device;
 	chip->rev = pci->revision;
 
-	err = pci_request_regions(pci, "YMFPCI");
+	err = pcim_request_all_regions(pci, "YMFPCI");
 	if (err < 0)
 		return err;
 
-- 
2.48.1

