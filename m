Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393BD2F949F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572291; cv=none; b=gFk+OquSI7sVwxQQDtS7xFdEQeIkOXnjZ1mpN710qf8dzSBLqqEmzA+vXrIYihxdvebYrz2UfqNryqG/sLutXI4qGSib+bbBJ4t223uq7S9vARB0s01BMzFeklL5nTG6OuJbLc2t9sCPkLtLyO5PXAjBarZiPVf/BA2uemhUq9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572291; c=relaxed/simple;
	bh=8+rfOhAZJ5zpDxo/gHwlDR+PyPMfFHPGV/0Evol3Ukg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j4tgqgIKkXV2TsfASXFt2sZrqVRUWDYphQ1PZJJ+V+H8r46KrD5Sf4ui8jb1PxKqBZL0S9Tfj4GJ8G38mhsrYBrSQtVJbPc9yU88m0RyB2MviJ6A0HwlaLWMq+vX3N89+EQYuLaulw/e6YWRrAmQo3zk1Umh5uzDnZhiiuLfnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=s1f6IN/J; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="s1f6IN/J"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2f3dab2a2a9so253660fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751572286; x=1752177086; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qqX46Ikvu2J8+FmRYWool6QuLD9cHW/4YH7HWsozgA=;
        b=s1f6IN/JT2V8N2QxbthMQM/69KdgCFlL/BUCtxSaLAEYG9y5LVLOzd6VPmC1x4IjvE
         hsJdRWY//9o2dx8EWWea829ulLarP3l1P+QzBqqS2lhQINdtGKxMbm9HaIOM2IO0+ffP
         ROHeAqlvZ14Ywu7MwqYzhEGWhDsXJEFxEyMn12h2QpN+OzkUvN1Ek3xI6EFKE+69FB+d
         wIP0VsEDc2taz6KJL7ArowZDXtf2APaituj7C50YwqLF1LbOkTA5kXmMZRpuMH6VJOQ5
         AhCWUsVdSl2zgFmu58fIsNASTOMdtqdiihSc2mCWVeX0TP7APc/AH3Cfd1M3Y5+EHdUJ
         wGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751572286; x=1752177086;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qqX46Ikvu2J8+FmRYWool6QuLD9cHW/4YH7HWsozgA=;
        b=H5wspZSOHpkIJKLh2Fp4jZGWmdcUQ8/6hyb/ifRgyGCyjQ9IK/nIm4Cc69l9FbRuts
         0zm7cxaJf6EtiTQfITcFcelEvBm1UpS2YqfLCbMDmBbOaeiOiEX2ucFS539qJy564E/e
         bkPKUFSXxGyZVn6iMjikuvdct3Nia8Uy+emVZ944aYIJnLQwP+fu1Vud/NPKPSwLdq7Z
         NdGyaXU97dq+Jq2cUXZ6As84bv38mCQcDlA4frGnX83itQrPNnDs7GqAzCKXveTbZnZj
         hu1dpi9CGnu5Ck9VRa16/VkDzuMzCtKB6xT6IXD34SHH8xfsmIHfqqaJUluu6BQWDGjc
         TjMw==
X-Forwarded-Encrypted: i=1; AJvYcCXsXsxT2jOfqngVn97/IeQ3qmOxU8hVvr/9u7ROln1iaV2mlpYgH3ZBjbuEPEeuspDcoE7dykQrz+SzULA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYD0IfAFYZoVnlzC1Dax7o+xjFZ2Vjf2tTo1XrN6YYPruFC/9k
	+vionTkZr1//AMHWdpj0mw0W03SazExHGdgDaoZMh+y32e8KZCS1BH/icM7dQRvoVwUXlBTGZ2Z
	lOqPxAYE=
X-Gm-Gg: ASbGncsZdLiq1ZeS+Lkj6/Vd3YAgcXYHtx5vzXnP8BtRv1fningPAdogQ8KIfBU+0Qz
	xzxFyMLMRt20gU80ujPrQmuxuFr3PCHqqysZvNIHOMfrKFsfHulYNeW+aeFFjiFeAAflylPBx2J
	fVf+7QsFrsY48MqaWijV3oiVH2JGcobu/7Vh0pN3Z8yS9G6FlscDsBFToLgAtzNgNcCpH58YVer
	TDVAzGnLHOuCrc/8qw7cWJdNuZP/gd0xgSZY0XMQHemA6rQx5yciB9tyBsNTFEJaqmoqW+NFNHd
	7MPnMucaMG3fVdzvmwzUoAFh0NtzgBGEWZ7xZc6VlV8/GvyubLw4OT0Rs/+UTYKec6Kfhj9+l5X
	tFlo=
X-Google-Smtp-Source: AGHT+IGEVogMmfIX4PhvWen00vY0nQ9rDbxfq9pneJ66y5sm0YOfwoo2GUn4GQ2tp656C4Ku5OrIXQ==
X-Received: by 2002:a05:6870:e243:b0:2c1:e9a3:3ab3 with SMTP id 586e51a60fabf-2f79200f771mr136377fac.33.1751572286178;
        Thu, 03 Jul 2025 12:51:26 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4f2b:5167:10f4:c985])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2f790277918sm81451fac.43.2025.07.03.12.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:51:25 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 03 Jul 2025 14:51:17 -0500
Subject: [PATCH] iio: adc: ad7173: fix channels index for syscalib_mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-iio-adc-ad7173-fix-channels-index-for-syscalib_mode-v1-1-7fdaedb9cac0@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADTfZmgC/x2NwQrCMBBEf6Xs2YVtGwnxV0QkTba6UBPJQqmU/
 rurhzk8mDezg3ITVrh0OzReRaUWg/7UQXrG8mCUbAwDDWfyNKJIxZiTxfd+xFk2/BULL4pSMm8
 414b60RQXme6vmhldmBw5DoEpgS2/G5v3f73ejuMLtxEHYYUAAAA=
X-Change-ID: 20250703-iio-adc-ad7173-fix-channels-index-for-syscalib_mode-49b404e99e0c
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=8+rfOhAZJ5zpDxo/gHwlDR+PyPMfFHPGV/0Evol3Ukg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoZt82s9XxXvOtyNI7tjqprD0rw2+0QJKtIROQj
 sLZ5QbA3YWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGbfNgAKCRDCzCAB/wGP
 wFClB/49Fk+Y36IL7xIqufegNhdCaW1itta5xNGVmm9+fy9Z+L1Dl1nwsHi8bQL1V6waCytIF62
 2tbLSwDkmOylBtuGY6vtl4eEaPsQ1ZlL0vSA9aagcuOjcnIt9uDeMtl0kxLs+26yM6SqK/pDRXc
 4U2F1+PqKfe4iNxIcvHqFbzURCkd0NVaHy6lRye9gmUDaVwlhDMn6QdYxYw4bRU6WR23tcIOtI1
 CE4vQhUMSOjA9etS3eniyyAVvNRt27/CtoI4VOJ/JUpvaqNUQXksS/QpMdlnmluOeWR4/lypJKa
 CoLXT3uRqzPKGGLThwzx8/etYy+UtIzGb/56UEfbBG6ERe9D
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Fix the index used to look up the channel when accessing the
syscalib_mode attribute. The address field is a 0-based index (same
as scan_index) that it used to access the channel in the
ad7173_channels array throughout the driver. The channels field, on
the other hand, may not match the address field depending on the
channel configuration specified in the device tree and could result
in an out-of-bounds access.

Fixes: 031bdc8aee01 ("iio: adc: ad7173: add calibration support")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7173.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
index dd9fa35555c79ead5a1b88d1dc6cc3db122502be..03412895f6dc71fcf8a07d09eb9f94a3840f02ef 100644
--- a/drivers/iio/adc/ad7173.c
+++ b/drivers/iio/adc/ad7173.c
@@ -318,7 +318,7 @@ static int ad7173_set_syscalib_mode(struct iio_dev *indio_dev,
 {
 	struct ad7173_state *st = iio_priv(indio_dev);
 
-	st->channels[chan->channel].syscalib_mode = mode;
+	st->channels[chan->address].syscalib_mode = mode;
 
 	return 0;
 }
@@ -328,7 +328,7 @@ static int ad7173_get_syscalib_mode(struct iio_dev *indio_dev,
 {
 	struct ad7173_state *st = iio_priv(indio_dev);
 
-	return st->channels[chan->channel].syscalib_mode;
+	return st->channels[chan->address].syscalib_mode;
 }
 
 static ssize_t ad7173_write_syscalib(struct iio_dev *indio_dev,
@@ -347,7 +347,7 @@ static ssize_t ad7173_write_syscalib(struct iio_dev *indio_dev,
 	if (!iio_device_claim_direct(indio_dev))
 		return -EBUSY;
 
-	mode = st->channels[chan->channel].syscalib_mode;
+	mode = st->channels[chan->address].syscalib_mode;
 	if (sys_calib) {
 		if (mode == AD7173_SYSCALIB_ZERO_SCALE)
 			ret = ad_sd_calibrate(&st->sd, AD7173_MODE_CAL_SYS_ZERO,

---
base-commit: 6742eff60460e77158d4f1b233f17e0345c9e66a
change-id: 20250703-iio-adc-ad7173-fix-channels-index-for-syscalib_mode-49b404e99e0c

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

