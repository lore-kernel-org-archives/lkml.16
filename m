Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782BA2857DC;
	Thu, 22 May 2025 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908497; cv=none; b=pJ7RJ7mcqMgArcHRw0oET69zvZqzoZ4FyQlOvRuTOVN+Eibp3h2PnQkWgytbDyOo/QtbMGRTxmKX+rueuDEC928YWR4acWHsDK+OYoEicsfkEBaun9zHF2qXX1+GOdW8vkhDl1LIC39HvQAKF3EE2/3inOY316dMACUzL4F/2Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908497; c=relaxed/simple;
	bh=BX8oWSaa9Hi4cAQ2gf8o5haX9+XJcjZROfzkic+wEXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sXCoE3/BMfpSEiCYy8k9opZyACXqUIr0TUzZvWDikBJAdnyqs7ZKcs/kjpeevMKbnHjBoIooHFDGPzElrxc74+qHG5gs1v3ZmHUQS2a/SsZ2vgJySa5G+Rkfs4qsegn3/uzb6guXmrmVnKdWaFVayI8kVfimRXVFTIra7DOjS04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YStDAock; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YStDAock"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7035CC4CEE4;
	Thu, 22 May 2025 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747908496;
	bh=BX8oWSaa9Hi4cAQ2gf8o5haX9+XJcjZROfzkic+wEXM=;
	h=From:To:Cc:Subject:Date:From;
	b=YStDAockdhnkDtJbw9m8N5iPWSIHr9jY5YF4RV+Gh5/bOFXxfgELcQKzeCPVg45fs
	 6/QW0ANj4Yhta+VAls6Wyu6f8y+xA/Bz3OjdCJ2GDl1vZMqTuYXySJe4/WoVbN4SY/
	 utLn8TpJlIBB01OGKvqMcyROpmZMiNH3OBH5YgiI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: core: fix up bus match const issues.
Date: Thu, 22 May 2025 12:08:05 +0200
Message-ID: <2025052204-hyphen-thermal-3e72@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4432; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=BX8oWSaa9Hi4cAQ2gf8o5haX9+XJcjZROfzkic+wEXM=; b=owGbwMvMwCRo6H6F97bub03G02pJDBl631vmKzdsk7pR8uYMN4ORLNt7Lk6uek3O6al31IOC8 x4yn6vviGVhEGRikBVTZPmyjefo/opDil6Gtqdh5rAygQxh4OIUgInoTWGYZ5Us/inNqv+SiOTS 0nP5HzWbH7+JYlgwxejx6k7/bNcMg9yn7XtKGt9eeSQNAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

In commit d69d80484598 ("driver core: have match() callback in struct
bus_type take a const *"), the match bus callback was changed to have
the driver be a const pointer.  Unfortunately that const attribute was
thrown away when container_of() is called, which is not correct and was
not caught by the compiler due to how container_of() is implemented.
Fix this up by correctly preserving the const attribute of the driver
passed to the bus match function which requires the hdac_driver match
function to also take a const pointer for the driver structure.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/sound/hdaudio.h  | 4 ++--
 sound/core/seq_device.c  | 2 +-
 sound/hda/hda_bus_type.c | 6 +++---
 sound/pci/hda/hda_bind.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index b098ceadbe74..9a70048adbc0 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -223,7 +223,7 @@ struct hdac_driver {
 	struct device_driver driver;
 	int type;
 	const struct hda_device_id *id_table;
-	int (*match)(struct hdac_device *dev, struct hdac_driver *drv);
+	int (*match)(struct hdac_device *dev, const struct hdac_driver *drv);
 	void (*unsol_event)(struct hdac_device *dev, unsigned int event);
 
 	/* fields used by ext bus APIs */
@@ -235,7 +235,7 @@ struct hdac_driver {
 #define drv_to_hdac_driver(_drv) container_of(_drv, struct hdac_driver, driver)
 
 const struct hda_device_id *
-hdac_get_device_id(struct hdac_device *hdev, struct hdac_driver *drv);
+hdac_get_device_id(struct hdac_device *hdev, const struct hdac_driver *drv);
 
 /*
  * Bus verb operators
diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index 4492be5d2317..bac9f8603734 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -43,7 +43,7 @@ MODULE_LICENSE("GPL");
 static int snd_seq_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct snd_seq_device *sdev = to_seq_dev(dev);
-	struct snd_seq_driver *sdrv = to_seq_drv(drv);
+	const struct snd_seq_driver *sdrv = to_seq_drv(drv);
 
 	return strcmp(sdrv->id, sdev->id) == 0 &&
 		sdrv->argsize == sdev->argsize;
diff --git a/sound/hda/hda_bus_type.c b/sound/hda/hda_bus_type.c
index 7545ace7b0ee..eb72a7af2e56 100644
--- a/sound/hda/hda_bus_type.c
+++ b/sound/hda/hda_bus_type.c
@@ -21,7 +21,7 @@ MODULE_LICENSE("GPL");
  * driver id_table and returns the matching device id entry.
  */
 const struct hda_device_id *
-hdac_get_device_id(struct hdac_device *hdev, struct hdac_driver *drv)
+hdac_get_device_id(struct hdac_device *hdev, const struct hdac_driver *drv)
 {
 	if (drv->id_table) {
 		const struct hda_device_id *id  = drv->id_table;
@@ -38,7 +38,7 @@ hdac_get_device_id(struct hdac_device *hdev, struct hdac_driver *drv)
 }
 EXPORT_SYMBOL_GPL(hdac_get_device_id);
 
-static int hdac_codec_match(struct hdac_device *dev, struct hdac_driver *drv)
+static int hdac_codec_match(struct hdac_device *dev, const struct hdac_driver *drv)
 {
 	if (hdac_get_device_id(dev, drv))
 		return 1;
@@ -49,7 +49,7 @@ static int hdac_codec_match(struct hdac_device *dev, struct hdac_driver *drv)
 static int hda_bus_match(struct device *dev, const struct device_driver *drv)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
-	struct hdac_driver *hdrv = drv_to_hdac_driver(drv);
+	const struct hdac_driver *hdrv = drv_to_hdac_driver(drv);
 
 	if (hdev->type != hdrv->type)
 		return 0;
diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 9521e5e0e6e6..1fef350d821e 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -18,10 +18,10 @@
 /*
  * find a matching codec id
  */
-static int hda_codec_match(struct hdac_device *dev, struct hdac_driver *drv)
+static int hda_codec_match(struct hdac_device *dev, const struct hdac_driver *drv)
 {
 	struct hda_codec *codec = container_of(dev, struct hda_codec, core);
-	struct hda_codec_driver *driver =
+	const struct hda_codec_driver *driver =
 		container_of(drv, struct hda_codec_driver, core);
 	const struct hda_device_id *list;
 	/* check probe_id instead of vendor_id if set */
-- 
2.49.0

