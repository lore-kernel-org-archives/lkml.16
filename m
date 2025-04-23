Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2BA270570;
	Wed, 23 Apr 2025 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394910; cv=none; b=cm3DDLBXjvz4R32nhgz04RolymR3ek+P7wtfi1qMiD0sPUPk5SR/+O/ROYVxd6mav2QW4UYy87LkQgikJzQx+tit6PjkI+39WieiCFQ4E4+Ys7TgUG9FrFlE0kvlKfZeE9ZrAzeZ1O4y38EE05mmu7X2D90MUEMXVYs+0YUMf2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394910; c=relaxed/simple;
	bh=hpsl3GfCNgR6vusE1HtvWnkX8X5I671B1NgKWynmTdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUBrEExtKvAjVLbvbuz+eAToCzlog/53oF3PMEncbvavHOM8ds6CTxEKpYQ8dU8huIe3UHcWjFWO3VkC+FcR21Yy9cMTGblH1GiBDWODBmHTRFYRDKQCeb15yLH6kQv3FkuTG40Uee3n3E6kSa6G1iEF0mpDdbAZgHO8Jh9UClI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ND6QBbxE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND6QBbxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A8FC4CEEC;
	Wed, 23 Apr 2025 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394909;
	bh=hpsl3GfCNgR6vusE1HtvWnkX8X5I671B1NgKWynmTdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ND6QBbxEdLXyHNB6VwFjJ3O4Prg2BAbBWmezB9com7jpPe2Lzdz+1wNxsrgjnkYAD
	 SBOZ589RtnejUrUehjqY3wlWaPte0Kj/D2fErd+i0oF0JKj7dnwLCd6FhfJQSpjR9g
	 a9+j9KT8iDcuT1d4Gj+PAoLd90y0F0RliUTNy3cAPf5fcbOca2E+wTjlFB57KxyNvH
	 PNIT54zM1pif3VIi/iYfNR7tcPrd2wXib1ZovGp+Nj2nbDJZnQ44l5/OqIdSkdjc0I
	 2uNaxlpte7CVYd18tDrcad/8siKmjLJ7p4DIMsd6f73m+d5PuJWXKq6hTPqTs1bfbY
	 mqmPAvKJ2bIrg==
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
Subject: [PATCH v2 12/28] ALSA: als: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:30 +0200
Message-ID: <20250423075346.45907-13-phasta@kernel.org>
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
 sound/pci/als300.c  | 2 +-
 sound/pci/als4000.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index c7c481203ef8..43f98719e61b 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -617,7 +617,7 @@ static int snd_als300_create(struct snd_card *card,
 	chip->chip_type = chip_type;
 	spin_lock_init(&chip->reg_lock);
 
-	err = pci_request_regions(pci, "ALS300");
+	err = pcim_request_all_regions(pci, "ALS300");
 	if (err < 0)
 		return err;
 
diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 022473594c73..3f4f3037f71f 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -836,7 +836,7 @@ static int __snd_card_als4000_probe(struct pci_dev *pci,
 		return -ENXIO;
 	}
 
-	err = pci_request_regions(pci, "ALS4000");
+	err = pcim_request_all_regions(pci, "ALS4000");
 	if (err < 0)
 		return err;
 	iobase = pci_resource_start(pci, 0);
-- 
2.48.1

