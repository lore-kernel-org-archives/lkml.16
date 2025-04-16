Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEEA1A5B9F;
	Wed, 16 Apr 2025 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809368; cv=none; b=o2RGe7jJrkrnTtTS78tOAYJZiuudZMXBBC1WON5YevW4OBBP4qMSCnQA3J6dycU4Tek1xvYmRQYgcTDRv7T07IeP3KfWARPUSgSZySVBmGkVQhEBGS9BOwuXEAvCGTfA5UE5/Z53I7VXL4TPFDlrTGUw9C7rYs+g0fFPNIZaJVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809368; c=relaxed/simple;
	bh=bz17M5N2p8+mcA+n+C5IIg3Nypk0tIM42PzVv5P8IDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5T5jKZdGo1POfHOGIxaIE0wWoz1bwZrrwKIhaqzSvgNJnaS11hYM29FEmqfGVF3LModK1Irzn5TP4mbyoVNb4eJVZ4oNwzX7M2352g0JRBCG6ILoGjggUgQeSM9xpc9X/uRRlqQiRPK3VMo9fQlmHtHX/vNjJTHNrMEuHP8I+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZNoH/Du; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZNoH/Du"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81945C4CEEA;
	Wed, 16 Apr 2025 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809367;
	bh=bz17M5N2p8+mcA+n+C5IIg3Nypk0tIM42PzVv5P8IDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sZNoH/DuGAZOt+La3mU6eVmmVkqBY8HdCArmyCbT2g+Ldwj83s3WgDkoUdlvPlYAf
	 SjqKKM+hDNWZtvDDIHQ5kPPd7oLqb0/BSQBzF2+6pthZZIdMfhDZU9IhX8idwEU4gC
	 2oXOhLDuaFAFvq+QfYtQe2linRLUyt+geoEtumwfQzSLDsUPNo8DAoS3YapA1BrLAO
	 ZmFItvD2JgZ+khX4zQaoXNS9MJcTgeaBiRcHM5AakfQyV+7TDkimGvjszU5h/AFxWD
	 pAzx9l3sWCkVLxH1ge8xvAA19eZwA9Trrh+yQzhBgMB7xDJKWUoSCVgS7sqFfe/eay
	 zxBnJOhMuJ4ig==
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
Subject: [PATCH 28/31] ALSA: cs46xx: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:38 +0200
Message-ID: <20250416131241.107903-29-phasta@kernel.org>
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
 sound/pci/cs46xx/cs46xx_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index f3a94bb537bd..fb733633740b 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -3839,7 +3839,7 @@ int snd_cs46xx_create(struct snd_card *card,
 	chip->pci = pci;
 	chip->irq = -1;
 
-	err = pci_request_regions(pci, "CS46xx");
+	err = pcim_request_all_regions(pci, "CS46xx");
 	if (err < 0)
 		return err;
 	chip->ba0_addr = pci_resource_start(pci, 0);
-- 
2.48.1

