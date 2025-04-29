Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16AF8F49
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745910688; cv=none; b=di4F1BMwFBuABGFZuXKPmgBBnLyDmeQ5cir15wU3yLrupJxIXupOJVln4d3vCm8/ZeZer0h9ls/6d0dh7DNHO3HzEMeOLrwoGU7hxgJRjvzQQ96/GZIYI8X6CcC9v6VXbwCHfQJmhDeXeCxd96V9HxvMglg/YyzqtfrvlE2Y0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745910688; c=relaxed/simple;
	bh=1Yt/kKdWgyFjVcE3Cz5XZTPFxYqSvfdYHbrAMfAxYRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tk0QLLhT5lSis8VH4jACX+ssVWQhRm1wf1AlcY4/1pHMy5aTT5NKh2x+rDvNoGJF3xMtnR1MqI2+diN3hRVJwULvXAF4aH13u7UfH9mQ5bMzIn9NzvHCNB3pKoAhZEWBaAOvSiXR24PfhhdCVPGOADDXu2wHmJXzayErfBMVKQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iu2IA8gR; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iu2IA8gR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745910684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=whzbueSM5IFp/0EHZ1SXALhjUlx+PeV3oY2K5xgmepc=;
	b=iu2IA8gRyZygarg3IPBa8+REnPW9cIchMrXdhp2YOKlJKHVYx6B8azVloaBmrDFIH3b1gw
	9WG1QWDNJz4MnKeu71hC1F5jG8bQ6UmE196q4B5NOzDcK3NzUw0kOuHFFyUsNsHbJDL3vp
	B7yOWIgW7udFP2I7dalP4+IuYfPLx9Q=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Zhu Jun <zhujun2@cmss.chinamobile.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: Use min() to simplify aw_dev_dsp_update_container()
Date: Tue, 29 Apr 2025 09:10:13 +0200
Message-ID: <20250429071032.65391-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use min() to simplify aw_dev_dsp_update_container() and improve its
readability.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/codecs/aw88166.c                | 7 ++-----
 sound/soc/codecs/aw88395/aw88395_device.c | 7 ++-----
 sound/soc/codecs/aw88399.c                | 7 ++-----
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 6c50c4a18b6a..4f76ebe11cc7 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -11,6 +11,7 @@
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/minmax.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "aw88166.h"
@@ -909,11 +910,7 @@ static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
 		goto error_operation;
 
 	for (i = 0; i < len; i += AW88166_MAX_RAM_WRITE_BYTE_SIZE) {
-		if ((len - i) < AW88166_MAX_RAM_WRITE_BYTE_SIZE)
-			tmp_len = len - i;
-		else
-			tmp_len = AW88166_MAX_RAM_WRITE_BYTE_SIZE;
-
+		tmp_len = min(len - i, AW88166_MAX_RAM_WRITE_BYTE_SIZE);
 		ret = regmap_raw_write(aw_dev->regmap, AW88166_DSPMDAT_REG,
 					&data[i], tmp_len);
 		if (ret)
diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index b7ea8be0d0cb..e1430940015d 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -10,6 +10,7 @@
 
 #include <linux/crc32.h>
 #include <linux/i2c.h>
+#include <linux/minmax.h>
 #include <linux/regmap.h>
 #include "aw88395_device.h"
 #include "aw88395_reg.h"
@@ -1114,11 +1115,7 @@ static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
 		goto error_operation;
 
 	for (i = 0; i < len; i += AW88395_MAX_RAM_WRITE_BYTE_SIZE) {
-		if ((len - i) < AW88395_MAX_RAM_WRITE_BYTE_SIZE)
-			tmp_len = len - i;
-		else
-			tmp_len = AW88395_MAX_RAM_WRITE_BYTE_SIZE;
-
+		tmp_len = min(len - i, AW88395_MAX_RAM_WRITE_BYTE_SIZE);
 		ret = regmap_raw_write(aw_dev->regmap, AW88395_DSPMDAT_REG,
 					&data[i], tmp_len);
 		if (ret)
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index ee3cc2a95f85..4b90133e5ab4 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
+#include <linux/minmax.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "aw88399.h"
@@ -872,11 +873,7 @@ static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
 		goto error_operation;
 
 	for (i = 0; i < len; i += AW88399_MAX_RAM_WRITE_BYTE_SIZE) {
-		if ((len - i) < AW88399_MAX_RAM_WRITE_BYTE_SIZE)
-			tmp_len = len - i;
-		else
-			tmp_len = AW88399_MAX_RAM_WRITE_BYTE_SIZE;
-
+		tmp_len = min(len - i, AW88399_MAX_RAM_WRITE_BYTE_SIZE);
 		ret = regmap_raw_write(aw_dev->regmap, AW88399_DSPMDAT_REG,
 					&data[i], tmp_len);
 		if (ret)
-- 
2.49.0

