Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7E274FC9;
	Wed, 23 Apr 2025 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394966; cv=none; b=DpZmRNnC7S+15ePqElk6DPDHEmA6NPzmb95gZ6USUJmHTXB6CFShcI9TUKL8K357rQ3IREYmyi5U1gtq+snkw7mmWM2GFnS474Xnf9fQkH7nQMuZVN/tL9wXNCYJ4ixsYwewQrjMZ2rfSc0nWM2VwkCWFwfYZ7bicW/6iAdT3cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394966; c=relaxed/simple;
	bh=3Jy5j2C1X/vtBTfyX0/JGv5U9K5PwudYX9Jo9OmSXNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/SszImLOW1hdepR2tvpDTI0jYQsNby2/ZvFqevGNFW3Sj1G2D+njIVfNsIcW1cAWvhkxkiTqsnMKYFlg9rWW9KQfMrlGkiWSOFDQtaCcDniQINjyI3/mj4fSf2TYI6peCmcyPdCZAjNsKNkWcnMjoTmUkZbhLbL/4Uqpxz3YXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShP0iyy1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShP0iyy1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D8BC4CEEA;
	Wed, 23 Apr 2025 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394966;
	bh=3Jy5j2C1X/vtBTfyX0/JGv5U9K5PwudYX9Jo9OmSXNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ShP0iyy1sl8qYgmLZ7ZshR0Ziyah3JT5bR0B8GMCKUupWb1Ji/fiH+Pqm3Mw33sp7
	 rNWMOjVwQ7xN/34fn1pqCUE2xpFI+3fifqfMsP2eDkW9tBPAdSFknMkieGbd7wQpy6
	 2kvJQ6lHom6SQmHD0eHc+FmR0M6FlO0hQewIoHMOEvw+0poL8ljuOIo/hF5lJ9l5gJ
	 Hmj+VNbGf8HjZ/EtB1Xzj3RzLxiWRvC1Ce9mFqMFh7S3mbE2qjr8Fy2LwtFk4YpAef
	 0tW0djxdnRWDu4HEuW7Ym2WawNQmo4V17Co1ncAspx3eebyPYPnCLwaw4T805Hw27V
	 I00aNR9E0T93w==
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
Subject: [PATCH v2 22/28] ALSA: emu10k1: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:40 +0200
Message-ID: <20250423075346.45907-23-phasta@kernel.org>
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
 sound/pci/emu10k1/emu10k1_main.c | 2 +-
 sound/pci/emu10k1/emu10k1x.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 5b8a5ba825bd..bbe252b8916c 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1563,7 +1563,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	else
 		emu->gpr_base = FXGPREGBASE;
 
-	err = pci_request_regions(pci, "EMU10K1");
+	err = pcim_request_all_regions(pci, "EMU10K1");
 	if (err < 0)
 		return err;
 	emu->port = pci_resource_start(pci, 0);
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 89043392f3ec..30ac37b5a214 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -884,7 +884,7 @@ static int snd_emu10k1x_create(struct snd_card *card,
 	spin_lock_init(&chip->emu_lock);
 	spin_lock_init(&chip->voice_lock);
   
-	err = pci_request_regions(pci, "EMU10K1X");
+	err = pcim_request_all_regions(pci, "EMU10K1X");
 	if (err < 0)
 		return err;
 	chip->port = pci_resource_start(pci, 0);
-- 
2.48.1

