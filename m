Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76C1AF0C7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614002; cv=none; b=ScHyXK8urbdUkXfM6lzEHPCx3l4I+qGsq+aXWYN6vvFI1RqbZ1i+U7MpFzreyjNWd4o4eL7qD52PqJKwASXODy58qFBF1ebuz5IKMx9KByWlIplYBZ9ysac/QkvwDd19Dswzkzy2jIy3zoxDA7OG29ZyXPMtX6wVsDc/Avk3I1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614002; c=relaxed/simple;
	bh=8jkBzcU2x8SA8XsDmjjKjMwFaN6foRAOjdfUUGsXjIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TzKP6R8B5SCYqX6yuUHFPymQgf0EAnVjAMjsq+aV7sh4w/Ns7tkln2QFtfprZeuUWYYDecthFUUquQL1IpLYpgozi5opTDmYSa/Mh6tYrCH4iBPVl08+sWZsj7cmjbWlheXfYGRtQ1TgiIolPKZJUExCGr4NA0WaL8l1XlwHRSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q1TtBU5Q; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q1TtBU5Q"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744613986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AoJm+f6FnQK/O2OG0bHw+7ynZXalVbButioglhiA18s=;
	b=Q1TtBU5QI85z8TTBoUD423w1sgzAOah1b52f0aJPYmy6spTEm11D0GEle5C/8tJ/YS3h0N
	RXZwW9tZBEY1Po+k4MEPuYoSF3jlFkqGX5VlCMQaZ7BJ9M4RMzb3XskPvNaXygs7uskaOI
	/aYZJOgcTxTXLY+8102RYgLdwNTdAMw=
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
Subject: [PATCH] ASoC: cs-amp-lib: Replace offsetof() with struct_size()
Date: Mon, 14 Apr 2025 08:59:03 +0200
Message-ID: <20250414065904.336749-1-thorsten.blum@linux.dev>
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

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Compile-tested only
---
 sound/soc/codecs/cs-amp-lib-test.c | 3 +--
 sound/soc/codecs/cs-amp-lib.c      | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 45626f99a417..2369fffb58f7 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -40,8 +40,7 @@ static void cs_amp_lib_test_init_dummy_cal_blob(struct kunit *test, int num_amps
 	unsigned int blob_size;
 	int i;
 
-	blob_size = offsetof(struct cirrus_amp_efi_data, data) +
-		    sizeof(struct cirrus_amp_cal_data) * num_amps;
+	blob_size = struct_size(priv->cal_blob, data, num_amps);
 
 	priv->cal_blob = kunit_kzalloc(test, blob_size, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv->cal_blob);
diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index c677868c5d5f..c2ce828a96ae 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -147,7 +147,7 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev)
 	dev_dbg(dev, "Calibration: Size=%d, Amp Count=%d\n", efi_data->size, efi_data->count);
 
 	if ((efi_data->count > 128) ||
-	    offsetof(struct cirrus_amp_efi_data, data[efi_data->count]) > data_size) {
+	    struct_size(efi_data, data, efi_data->count) > data_size) {
 		dev_err(dev, "EFI cal variable truncated\n");
 		ret = -EOVERFLOW;
 		goto err;
-- 
2.49.0

