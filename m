Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3599A176AC5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631168; cv=none; b=SkAyr51Tr5tFY2SZZxicW7ZntFbuTJZ1uNddnR+1PGT4m4zvNOUPbardrBQ/j2xmolC2SV4WgOKmMnVBRRumJJpW5IAW0rr66GPatTUUHN54EPzNzO3W783MWB1pqZoYn3jyNgftVR8NSvvl19HJqakat91TvJ8ssVm+10Cq9Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631168; c=relaxed/simple;
	bh=+jreOxg//pMTYnkY1ODgltFYJ19ixhSwZ2c3LRQk6Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pN2yC4eRQxJtBrNnsv3s6uUd7sqiUF8OS2NkZiYZ+NtUhRRdk/RgZBWH7ZC/vNJE8+lfz4zk716EVVNP6FP2vpeUpRQrlm7QHF1uiJ/sqk5nRugeGwBEfqVMDDjDmuijr4ZSzAWL3c8ZlRAOhgkDpK109hM999Io6QFgzvJbs5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EJkx69o4; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EJkx69o4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744631161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J9jffcSIe14s0PuvJhwrbqjHGZgKpFic5AZKn9psRkM=;
	b=EJkx69o4oBi30McBkvgH1o2dJnpdpsFhYkqvR97/z/c3amiKa5D73X4SCZ4W/iBAwmg9iY
	ePB/GOHvHfohigRvrwhiQLN6NSPphumTxo42/8ANYMa2x84/hB4vJcnpXzpmUDAco2HCe5
	J+0i20jX+NT0d5uq8qn8YvBYRvDwsB8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: cs-amp-lib: Replace offsetof() with struct_size()
Date: Mon, 14 Apr 2025 13:45:28 +0200
Message-ID: <20250414114528.355204-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use struct_size() to calculate the number of bytes to allocate and used
by 'cirrus_amp_efi_data'. Compared to offsetof(), struct_size() provides
additional compile-time checks (e.g., __must_be_array()).

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Add missing includes as suggested by Richard Fitzgerald (thanks!)
- Link to v1: https://lore.kernel.org/lkml/20250414065904.336749-1-thorsten.blum@linux.dev/
---
 sound/soc/codecs/cs-amp-lib-test.c | 4 ++--
 sound/soc/codecs/cs-amp-lib.c      | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 45626f99a417..d96d46eb5372 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -12,6 +12,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/random.h>
 #include <sound/cs-amp-lib.h>
@@ -40,8 +41,7 @@ static void cs_amp_lib_test_init_dummy_cal_blob(struct kunit *test, int num_amps
 	unsigned int blob_size;
 	int i;
 
-	blob_size = offsetof(struct cirrus_amp_efi_data, data) +
-		    sizeof(struct cirrus_amp_cal_data) * num_amps;
+	blob_size = struct_size(priv->cal_blob, data, num_amps);
 
 	priv->cal_blob = kunit_kzalloc(test, blob_size, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv->cal_blob);
diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index c677868c5d5f..808e67c90f7c 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -11,6 +11,7 @@
 #include <linux/efi.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <sound/cs-amp-lib.h>
@@ -147,7 +148,7 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev)
 	dev_dbg(dev, "Calibration: Size=%d, Amp Count=%d\n", efi_data->size, efi_data->count);
 
 	if ((efi_data->count > 128) ||
-	    offsetof(struct cirrus_amp_efi_data, data[efi_data->count]) > data_size) {
+	    struct_size(efi_data, data, efi_data->count) > data_size) {
 		dev_err(dev, "EFI cal variable truncated\n");
 		ret = -EOVERFLOW;
 		goto err;
-- 
2.49.0

