Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695523B0
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200558; cv=none; b=isJ48kryTBZuOO+9qJsQX1r/KF/WFGTjEa6+t9XaFE8xoAhicpAJY3vx0Wj+xC3DxPkthxKNZs5HaE+gXOicVw0xDXR/8725Yj5uCFr7Nt50EXpLSzz1PQ8S/ondDMwhWH3qS7nGQVqUVNr+MAoFIoyuptqcdOBC2SmPib5SNUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200558; c=relaxed/simple;
	bh=QAJSt6rKKZp+7sJ7azwvwLPtYc9N4CHc3g0ulN45n1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jxagQ5k5+7XThj3mRnF+/0XAWdlg5bNL24JOGcZhhN5rY3dVPg51HOPSp8VR2lSYn689oX+aYyHfo/rSITvcxLKXwsY4D7eJulOzjb7+GHq0Zuhi02etANV6XiGWjx2aPbuAyPiB09bOXtTrlv/NFDXYLxhcf05CVx3KM1Lnrqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mZwrtYEK; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mZwrtYEK"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73044329768so1675556a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746200554; x=1746805354; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSUCe1/D8mQxVmxIYOBMFbvuysALwG3zBMpMWpILAzw=;
        b=mZwrtYEK0cqqk22BGKKQk6/rZhOdvSmvuklFWMuqd+W19cccwsAwp3mWrlU0JNxHfm
         7a9sEiE+lFUN9SUyESzfnSEkVjuVeDm1qexyxT8CLQQiyBsM8kwWEqCQNtZTuQO3Kztl
         fATW81Vext5MuIUr61Fm9cOIiUtnqG5FHl+mz1FCBsRZTbZ0DQyDvg+bPD7sYahLhaHL
         fp/GZ5dqHWCpHhgDAAKiBH92t4E7Nf4C6Ljpb+ImUSvKbxXAzYXwKetsUROKwivBFGeq
         KTNdVSdafqjpaCYuLrwIIQ2QKk0nxQC0M2w2cy1pB2Q5trVA/Tr1gkNI48tB+cpqU3ue
         Qpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746200554; x=1746805354;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSUCe1/D8mQxVmxIYOBMFbvuysALwG3zBMpMWpILAzw=;
        b=uguesuVQzyUjbrcQUMS6jEYGkX0gI2R5465s00+BwKSCBzC2AgqvyWYEqIxQmF+IBF
         BgQPWxvSdhgg0GbBEYKEWG6cxqd83Nnv4cxclH8Avfghwus1Pg1jdlCI0Fb1vQToICcK
         ncD5way+uq6C6pwZ9UAGnkHG0BlUZRHor4lOwcXZYq79V+SrKUpWAJ7OraJ8WOxbh1Jr
         DGcKvWy1ujYmroyxLfPcC+/hpwK4vtDsm7yT9JTJswcnMp6qor2yY5ptvnrt8W64lImb
         DKguoMadVUlcv1QTwWlTd2ljenuHq3D44XG4vtx9MW9s9je7bDGd1H9m5hN3Wxo0rQXn
         xk3g==
X-Forwarded-Encrypted: i=1; AJvYcCVFuYygaYqRhT2qKiKarkOexCxpxLVhmOtBMRtAX2CbCUrSFlAD4mFcH21omwklqXXFlLjXqLg+iPRukpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDCnsaD3fR1SIM4h3BQmcYtOoft31wDFgPTROduPdI/cuMJUf
	K9iP0eF3Y4y+iuQVDHIEMN+ogYjpE51P0VnbcUHsdINEgOOyx0nqXLpsVXVTLgo=
X-Gm-Gg: ASbGnctXVl/SHmpzend5jEPlSjpKMVZQcc4KssmZ1zOV3cbktPZRj6ImMEi7SwXECM7
	y1c5ZQjZn3PaeXwOkDhw4zqO+kkmpTyogu6WiWyZ7a3o7sq4JZHs77Bm8pYFmAj9+QUWV2dZqMM
	/vC5UV2PVV3DnvoHIaTb7QwOZXVvYdPWLTk/gQCbvfnFEhmfL8hGGc8FERH7eBIqKHdEjL9Orat
	1+V0hH3TIpGleHs0cNYQpP2mJgjbtsh+YVRkcPQ3Pjxfw6UXI2sS/48E7xux+J7tRM5a1DZL92a
	XJ+t977bk9B1kq2GLIpdStPpggMqVYvpF/oO4Y1CDlT1T8M=
X-Google-Smtp-Source: AGHT+IFa7ER/28ouws3j877IMwPaDN8EaWbEoMu5qoYoLPWpIthuQR+VxoPZcZGOZc+4wZgZGTbP6Q==
X-Received: by 2002:a05:6830:349f:b0:72b:87f8:4935 with SMTP id 46e09a7af769-731da0dbd2bmr1986090a34.4.1746200554243;
        Fri, 02 May 2025 08:42:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4489:d382:ca90:f531])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d350a8e1sm520709a34.64.2025.05.02.08.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:42:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 02 May 2025 10:42:16 -0500
Subject: [PATCH v2] iio: adc: ad7606_spi: add offload scan mask check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-iio-adc-ad7606_spi-fix-offload-scan-mask-check-v2-1-e70c6d71baa3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIANfnFGgC/52NSw6DMAxEr4KyriuHT/pZ9R4VqoJjikUhKKlQE
 eLuTTlCF7N4o9G8VUUOwlFds1UFniWKHxPkh0xRZ8cng7jEKse8wrJAEPFgHaWcDJpHnARa+YB
 v25e3DiLZEQYbe6COqQftigJLREJdqnQ6BU7zXXivE3cS3z4su3/Wv/Zv1axBw7nRpnIXZwj51
 tjlJU3gI/lB1du2fQF5SMJP7wAAAA==
X-Change-ID: 20250430-iio-adc-ad7606_spi-fix-offload-scan-mask-check-1d330400c014
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Angelo Dureghello <adureghello@baylibre.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4325; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=QAJSt6rKKZp+7sJ7azwvwLPtYc9N4CHc3g0ulN45n1E=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoFOfiRVXRvcNnCImEFkU2BueL0PIMiO/M6+MVB
 TfmXnM6Kc6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBTn4gAKCRDCzCAB/wGP
 wBHWB/4/Dwsx7aT3gL4Lh9bjJl/h6DZeqHuGrC0LN+5RBvXPez/KW/jw7+8ELm4Iy/uC6QxN3Cx
 2RkccxOGK95u5TaqXPQd98NuiFHPW1ZHkEDuHOyI4JaakOcPdOigEduujcUNruogia0JsVLwfww
 /C6UxiXwsEhZDI70eBMjRrn3qO2r6OANCYmqOcFGniADu5CGrc2DwhcAzwCjCsUFhAxlsAR+560
 LUq92Zzp9EmHcHpu9GTNL0Grkf3/JaQ5Xcwq9T7GszV8dwh73A/gNI9VBVE6G6Q9Z+/HWE1JiIh
 9sftsiG1K6u4peOfFAURQ4ksf1zNcQcpmXiWRBauWOhVlWXC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Validate the scan mask when SPI offloading is being used.

Since this family of ADCs is simultaneous sampling, there isn't a way
to selectively disable channels when reading sample data. (Technically,
AD7616 has a sequencer so could have some control, but that is for
another day).

For "regular" IIO triggered buffer reads, this isn't a problem and the
IIO core will demux the data and ignore data from disabled channels.
However, since SPI offloading is done completely in hardware, we don't
have a way to do the same. So before this patch, if less than all
channels were enabled, the data would be misplaced in the buffer.

By adding a check in update_scan_mode, we can fail to enable the buffer
instead of having bad data returned to userspace.

Fixes: e96d35faf357 ("iio: adc: ad7606: add SPI offload support")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v2:
- Use bitmap_weight() instead of bitmap_equal().
- Link to v1: https://lore.kernel.org/r/20250430-iio-adc-ad7606_spi-fix-offload-scan-mask-check-v1-1-8b165d9d6c0e@baylibre.com

And in case it isn't obvious, the patch this fixes is fairly recent, so
this goes in togreg rather than fixes-togreg.
---
 drivers/iio/adc/ad7606_spi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index 997be483ebb93293481b922e13ece4edb47e940a..5b5b4677273b15956f1da73da41b16c5ee64e818 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
+#include <linux/bitmap.h>
 #include <linux/err.h>
 #include <linux/math.h>
 #include <linux/module.h>
@@ -329,19 +330,44 @@ static int ad7606_spi_offload_probe(struct device *dev,
 	return 0;
 }
 
+static int ad7606_spi_update_scan_mode(struct iio_dev *indio_dev,
+				       const unsigned long *scan_mask)
+{
+	struct ad7606_state *st = iio_priv(indio_dev);
+
+	if (st->offload_en) {
+		unsigned int num_adc_ch = st->chip_info->num_adc_channels;
+
+		/*
+		 * SPI offload requires that all channels are enabled since
+		 * there isn't a way to selectively disable channels that get
+		 * read (this is simultaneous sampling ADC) and the DMA buffer
+		 * has no way of demuxing the data to filter out unwanted
+		 * channels.
+		 */
+		if (bitmap_weight(scan_mask, num_adc_ch) != num_adc_ch)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct ad7606_bus_ops ad7606_spi_bops = {
 	.offload_config = ad7606_spi_offload_probe,
 	.read_block = ad7606_spi_read_block,
+	.update_scan_mode = ad7606_spi_update_scan_mode,
 };
 
 static const struct ad7606_bus_ops ad7607_spi_bops = {
 	.offload_config = ad7606_spi_offload_probe,
 	.read_block = ad7606_spi_read_block14to16,
+	.update_scan_mode = ad7606_spi_update_scan_mode,
 };
 
 static const struct ad7606_bus_ops ad7608_spi_bops = {
 	.offload_config = ad7606_spi_offload_probe,
 	.read_block = ad7606_spi_read_block18to32,
+	.update_scan_mode = ad7606_spi_update_scan_mode,
 };
 
 static const struct ad7606_bus_ops ad7616_spi_bops = {
@@ -350,6 +376,7 @@ static const struct ad7606_bus_ops ad7616_spi_bops = {
 	.reg_read = ad7606_spi_reg_read,
 	.reg_write = ad7606_spi_reg_write,
 	.rd_wr_cmd = ad7616_spi_rd_wr_cmd,
+	.update_scan_mode = ad7606_spi_update_scan_mode,
 };
 
 static const struct ad7606_bus_ops ad7606b_spi_bops = {
@@ -359,6 +386,7 @@ static const struct ad7606_bus_ops ad7606b_spi_bops = {
 	.reg_write = ad7606_spi_reg_write,
 	.rd_wr_cmd = ad7606b_spi_rd_wr_cmd,
 	.sw_mode_config = ad7606b_sw_mode_config,
+	.update_scan_mode = ad7606_spi_update_scan_mode,
 };
 
 static const struct ad7606_bus_ops ad7606c_18_spi_bops = {
@@ -368,6 +396,7 @@ static const struct ad7606_bus_ops ad7606c_18_spi_bops = {
 	.reg_write = ad7606_spi_reg_write,
 	.rd_wr_cmd = ad7606b_spi_rd_wr_cmd,
 	.sw_mode_config = ad7606b_sw_mode_config,
+	.update_scan_mode = ad7606_spi_update_scan_mode,
 };
 
 static const struct ad7606_bus_info ad7605_4_bus_info = {

---
base-commit: a9b169746d2e299159d4dde190552ae620982bbd
change-id: 20250430-iio-adc-ad7606_spi-fix-offload-scan-mask-check-1d330400c014

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

