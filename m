Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2C126A092;
	Wed, 23 Apr 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394899; cv=none; b=muFVqSRmTLaNxhU9aO4aU9WUNGIKDL/4MCf4aARqiYsYNB2jwC27HWpflpMChfYDirwTbMV1SzLVy2+TDFvgjpvPig18A7knbdhFx/3XIzXeSHEbq9cuG1hKOqaoXsm1nRj96vDIiRgPgPKbkoKai/4owYq1R83wejuOYfJctQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394899; c=relaxed/simple;
	bh=h5Zgpsa48bh9H95a9hzZzCRVuxBEmBn+GcOnH8h3Dc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkmiXgBzVNyz28h9WJBnY7OTd1hOZ4bvMiYrS+NmwL/5cA/lgyiM83qSnB6b7RAx1d2yXm53Zp/mQqx1BhCdfpXIl5R3b7lhAz8cuRz4Jc+2QD6kRfHK5zYqs2z9OsZgOdqybI5OgM4ssT8qaD/noTRIL1hk2Yu1RET1mcVjnwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpKuzIeJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpKuzIeJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A17C4CEEA;
	Wed, 23 Apr 2025 07:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394898;
	bh=h5Zgpsa48bh9H95a9hzZzCRVuxBEmBn+GcOnH8h3Dc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jpKuzIeJYOI6a6J86wYbPpWUOeLkHm+zRZkFHv/aRykGoPjaKfxRjq5oylY58jEd/
	 X55VIJxgs5p3X4BvauKb05KFoNABx2GjR1j7Je4DH1x4auoGjcA2pV6XVEeGpN2Nf2
	 /WWhZvMK6bYjhbcFnKop6B7NKd5bGS8AOZpu+eXH0Eu06yUvognUDLuvz0JEh3s+0R
	 OvDQ/hJG3uLz5oXRQ+2Dea/etCHSdEgyGrizg/7VR+KQU/fdWn6uA8KncQKL0+Qzln
	 Is0jnno5ijyU9Ke5mM+XtVzVSmaZs4kPWNp/lQz4aZrthbudX6G5scS9mzh+YYEBar
	 vChHNVcrlzt5w==
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
Subject: [PATCH v2 10/28] ALSA: es19x8: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:28 +0200
Message-ID: <20250423075346.45907-11-phasta@kernel.org>
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
 sound/pci/es1938.c | 2 +-
 sound/pci/es1968.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 018a8d53ca53..27728bdfac57 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1531,7 +1531,7 @@ static int snd_es1938_create(struct snd_card *card,
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	err = pci_request_regions(pci, "ESS Solo-1");
+	err = pcim_request_all_regions(pci, "ESS Solo-1");
 	if (err < 0)
 		return err;
 	chip->io_port = pci_resource_start(pci, 0);
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index c6c018b40c69..899135d3922e 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2647,7 +2647,7 @@ static int snd_es1968_create(struct snd_card *card,
 	chip->playback_streams = play_streams;
 	chip->capture_streams = capt_streams;
 
-	err = pci_request_regions(pci, "ESS Maestro");
+	err = pcim_request_all_regions(pci, "ESS Maestro");
 	if (err < 0)
 		return err;
 	chip->io_port = pci_resource_start(pci, 0);
-- 
2.48.1

