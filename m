Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDFC14658D;
	Thu, 22 May 2025 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747945828; cv=none; b=eW6WHy6+uZQuARx2WJp8V5sg9uT5p0m8yTiKTpmN2RoBUkZdNAu6N07Sfzxu4MYkx2j4CIdbT1S4+CnyOSeUB8qpJ39XGmNwYR9f5OUhmC/IDy5nTU6lOvlx/M59zEEElPEl+Ads/BJ8NpLuduoJBz2HqJEWSfOxtfUg6TQJTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747945828; c=relaxed/simple;
	bh=uQsezi9xXkJD2WST6jUpJh15925KiJ4sgHCkw5DImdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mkbg3sc2p8S6rXVoXKMvFmSgyHsf7LDfZogTO8+Je0XPIYdtpE5ImdB6E7EjPCp2XeUzJ89lQFYjAuR6LfwWBF22guv/yKFLABI3IeIPjfrZvTbxSz0aKwiV+0af55dRJRSI49pifNJgmnDv3h7A6So++GPaMzpbXrniS0P+eQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NNopRXti; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NNopRXti"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=VGADaWwXrD+siNXh8qq1xehNpdCscPaXOmC04LLMKnQ=; b=NNopRXtifwcXyHYvXFOVwUxpKa
	pNHAti/vb/q4J/SziLLCMOtFfjhQRbInqm25vuIYI472EXbIYQCxQPlHYtwuwWqEzxvkZ/K38l88R
	8utM8FNXYwsGtTcpZ01R6tmRibEqlV7LadsVbGHE6NFl+4tiQo19yo+j7UacwBo5ZOfkC0cJunCBQ
	EZcMvEmzOLVheupSvplGEpWNdCAcibrSPVeb86Ol4uBtmASgFY8ztKegRR5tbc0nt7BFQoRcjRLym
	YRDmV/UaiUuMjju4PxfgL9Yf68nFL5IrDVuad6FkE9rJBk6f+wbIUK608LF9HBDphqP1JcKP1dv0g
	yzzYlMhw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICYZ-000000027ox-2ihN;
	Thu, 22 May 2025 20:30:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Daniel Dadap <ddadap@nvidia.com>,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda_acpi: eliminate defined but not used warnings
Date: Thu, 22 May 2025 13:30:20 -0700
Message-ID: <20250522203020.1478369-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_PM_SLEEP is not set, the hda_acpi_suspend() and
hda_acpi_resume() functions are not used and cause build warnings:

sound/pci/hda/hda_acpi.c:282:12: warning: 'hda_acpi_resume' defined but not used [-Wunused-function]
  282 | static int hda_acpi_resume(struct device *dev)
sound/pci/hda/hda_acpi.c:269:12: warning: 'hda_acpi_suspend' defined but not used [-Wunused-function]
  269 | static int hda_acpi_suspend(struct device *dev)

Enclose these functions inside an ifdef CONFIG_PM_SLEEP block to
prevent the warnings.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Daniel Dadap <ddadap@nvidia.com>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org
---
 sound/pci/hda/hda_acpi.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20250522.orig/sound/pci/hda/hda_acpi.c
+++ linux-next-20250522/sound/pci/hda/hda_acpi.c
@@ -266,6 +266,7 @@ static void hda_acpi_shutdown(struct pla
 		azx_stop_chip(chip);
 }
 
+#ifdef CONFIG_PM_SLEEP
 static int hda_acpi_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -291,6 +292,7 @@ static int hda_acpi_resume(struct device
 
 	return 0;
 }
+#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops hda_acpi_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
