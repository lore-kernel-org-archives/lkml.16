Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC802D8683
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932095; cv=none; b=buYXu/Otg79uR+DDe+xve7LyfNS3Gzl703HlM1W74YWHW5em0DxbG93Pe/nNDS0E8CKMAsY18fKgGbUL+ZU6emxA7R1OBrrjdrIu03hpLkWLcqLdClKvKj8fax+dF+mYlolnLImJlFFvnCAMf82HvUeVG2lTnIyIcSFEycgsR2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932095; c=relaxed/simple;
	bh=iiNkKp9S/Y/GaVGbTXmn8udDFVG9/+jXerMR9s94M28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yp/gMrS81fcnRbsuBCkGHqvPuMiIeKeBB+3fptDBi0MabXYsJfEtymt61KOqmKlXpsAQF4rhW/Z/iK6Q1Ngo6n5wAjAfEL7VLHCcrG3NoCIbRwK9nqfDKkmlHIdrN27VagMpT2/IqQK4Evt4R095C6/5Yhit7cZ1LcILmQXG83k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3VoP9fuS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3VoP9fuS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-440685d6afcso57009035e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745932092; x=1746536892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mRBcsoz7zVCX+58NW+x3y1+k7FsR0LZXKG0O71RrzY=;
        b=3VoP9fuShT899l0srM5pA0TVD4NcfkDH6bfyZzGiLDLEAX5dvvt1h/wlVg20jbHHKn
         DVJeNiB2WX4xQ6SK6nH4yXOaL1ydxjlAc3QUu+QT+kNIMonOcBGQYvDqEp5KZ+y46l/f
         W/wKBzzFlG0f02poedz+eWphZx4/9jZctFdIhkZYjjunhtEc9ylfeafN+NonqqjfjZE6
         Q/wEa0N2MVw81Cif/8NOzmMlqWyQ/biPCuemG11Gya93wYS8ungZRt1+MpQieW7J1mCu
         ilqwYsfaffQ2p/RYJJId2O1/jxcHvQmm/OzYB0w6YdX8n2uc3SHkG5gO0KM6IpYCehko
         0Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932092; x=1746536892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mRBcsoz7zVCX+58NW+x3y1+k7FsR0LZXKG0O71RrzY=;
        b=OL7bqpx1JGD6KmroLOeoK5zx2geH5qmp7bOvDveCz8B/ImlIdjg2goMqN1XZJR7M4c
         6OVqAc90DnF6H8lUpSodgCO3NeZrTS7OvPi/8/hLGHEcfq3q0M+MS6mzTEDDpVkTJNpM
         D6UTaezgpVN+3mhfVVLJ9aKgpKv+KQ8jOL2rLJX6By3VyucpavBGr46Y91AGmiOBUzJ/
         TxeilmupIrzRJP3gQTM8hWcbYjzOjBAAtqzf66tfznbBrveC+E19DzaV0PeqOou9ibXU
         psfDdr1qf8V3+OC/+Zw8iOX5qOc3gkluMiwuTb1cxvGwm7Mugs5xPent6kr5v0mARBUw
         taTw==
X-Forwarded-Encrypted: i=1; AJvYcCWb2qdTKipzuL2vFhsikIqqOEWM6EWmiiVTxePTHhAm2iIYes9VVtijDtnJGDEN7qDIIe/DoONUS4lYT2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws8nlSZiFAFG1me9VoIm3Jagsvx2Ps9W1JQ13T1Z+Fi6JnlEiX
	5xYWmTQR8nHgisnTW0epvBtrcUI7ZiF8LKtUN9UuTYSVDUz09MBzvjz8hUJK03I=
X-Gm-Gg: ASbGnct/5q8zVQRqpJWQ62fhUXQjsIHdkn28VgvvHxnbEJyBirGOgcszazzjYxsGEYO
	d1rqZ1YB8dfjUEkrFUN7vttwnHdJm33TYt0B85MXRZBVc1777/MIEyaGFVkUAclCqR6kYgeKe56
	aVnR2PnGx2sIz+lQWwOTypUS8oBUY6JmmflvMW49UcdFMtUgCoGqpsW95J9yRRr+QMjn0m9q5Dw
	5UXjywfK9m7NmSypHfWYVt2O7VdyCDw3K7LdjYfwSLI7TZcJDVQgUn4hDynt9ajucQLuhvMh7bo
	xyCNx6npUbm8bYTTlxC2wlXCp4k98pDAl3+DyMJtbzbtSaww/uqeV77803hXzqkE79Md8RSNIky
	gDwHV0YFbbunNvnJVzpguWGE=
X-Google-Smtp-Source: AGHT+IEOoLuBrvZmbUCEFOkGWsAm7+TMD7TUmhgzsQn5/1mS3vwzu2XpWTo3TgZr443jUbgiGRgwrA==
X-Received: by 2002:a05:600c:4693:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-440ab872201mr106757355e9.29.1745932088812;
        Tue, 29 Apr 2025 06:08:08 -0700 (PDT)
Received: from [192.168.0.2] (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm155550565e9.21.2025.04.29.06.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:08:08 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 29 Apr 2025 15:06:49 +0200
Subject: [PATCH 5/5] iio: adc: ad7606: add gain calibration support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-wip-bl-ad7606-calibration-v1-5-eb4d4821b172@baylibre.com>
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
In-Reply-To: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5506;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=Ko8yd7lWpMt5mc22SXoTKQ7xTbqRtaJANaR0a/D+dnY=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgQOPfi53zWBe+mrP+1509t2SdZabdefjUPH0/B07P4v
 dRd63yedpSyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZhI+mtGhp0L5puxSWWG+q24
 NvvZTAWenueWkpNd7ttOfvw7f4mk1j1GhknR4a/33ZsnnPGF59cWUWMfwYRrb9ekpM+WlHN9oJ7
 Lww4A
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add gain calibration support, using resistor values set on devicetree,
values to be set accordingly with ADC external RFilter, as explained in
the ad7606c-16 datasheet, rev0, page 37.

Usage example in the fdt yaml documentation.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/iio/adc/ad7606.h |  4 ++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index ec063dd4a67eb94610c41c473e2d8040c91974cf..1ebc7080d3d153a2ba02bc5c126ef9957dc782ab 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -33,6 +33,10 @@
 
 #include "ad7606.h"
 
+#define AD7606_CALIB_GAIN_MIN	0
+#define AD7606_CALIB_GAIN_STEP	1024
+#define AD7606_CALIB_GAIN_MAX	65536
+
 /*
  * Scales are computed as 5000/32768 and 10000/32768 respectively,
  * so that when applied to the raw values they provide mV values.
@@ -125,6 +129,8 @@ static int ad7609_chan_scale_setup(struct iio_dev *indio_dev,
 				   struct iio_chan_spec *chan);
 static int ad7616_sw_mode_setup(struct iio_dev *indio_dev);
 static int ad7606b_sw_mode_setup(struct iio_dev *indio_dev);
+static int ad7606_chan_calib_gain_setup(struct iio_dev *indio_dev,
+					struct iio_chan_spec *chan);
 
 const struct ad7606_chip_info ad7605_4_info = {
 	.max_samplerate = 300 * KILO,
@@ -180,6 +186,7 @@ const struct ad7606_chip_info ad7606b_info = {
 	.scale_setup_cb = ad7606_16bit_chan_scale_setup,
 	.sw_setup_cb = ad7606b_sw_mode_setup,
 	.offload_storagebits = 32,
+	.calib_gain_setup_cb = ad7606_chan_calib_gain_setup,
 	.calib_offset_avail = ad7606_calib_offset_avail,
 	.calib_phase_avail = ad7606b_calib_phase_avail,
 };
@@ -195,6 +202,7 @@ const struct ad7606_chip_info ad7606c_16_info = {
 	.scale_setup_cb = ad7606c_16bit_chan_scale_setup,
 	.sw_setup_cb = ad7606b_sw_mode_setup,
 	.offload_storagebits = 32,
+	.calib_gain_setup_cb = ad7606_chan_calib_gain_setup,
 	.calib_offset_avail = ad7606_calib_offset_avail,
 	.calib_phase_avail = ad7606c_calib_phase_avail,
 };
@@ -246,6 +254,7 @@ const struct ad7606_chip_info ad7606c_18_info = {
 	.scale_setup_cb = ad7606c_18bit_chan_scale_setup,
 	.sw_setup_cb = ad7606b_sw_mode_setup,
 	.offload_storagebits = 32,
+	.calib_gain_setup_cb = ad7606_chan_calib_gain_setup,
 	.calib_offset_avail = ad7606c_18bit_calib_offset_avail,
 	.calib_phase_avail = ad7606c_calib_phase_avail,
 };
@@ -357,6 +366,46 @@ static int ad7606_get_chan_config(struct iio_dev *indio_dev, int ch,
 	return 0;
 }
 
+static int ad7606_chan_calib_gain_setup(struct iio_dev *indio_dev,
+					struct iio_chan_spec *chan)
+{
+	struct ad7606_state *st = iio_priv(indio_dev);
+	unsigned int num_channels = st->chip_info->num_adc_channels;
+	struct device *dev = st->dev;
+	int ret;
+
+	device_for_each_child_node_scoped(dev, child) {
+		int reg, r_gain;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret)
+			return ret;
+
+		/* channel number (here) is from 1 to num_channels */
+		if (reg < 1 || reg > num_channels) {
+			dev_warn(dev, "invalid ch number (ignoring): %d\n", reg);
+			continue;
+		}
+
+		ret = fwnode_property_read_u32(child, "adi,rfilter-ohms",
+					       &r_gain);
+		if (ret)
+			return ret;
+
+		if (r_gain < AD7606_CALIB_GAIN_MIN ||
+		    r_gain > AD7606_CALIB_GAIN_MAX)
+			return -EINVAL;
+
+		/* Chan reg is 1-based index. */
+		ret = st->bops->reg_write(st, AD7606_CALIB_GAIN(reg - 1),
+					  r_gain / AD7606_CALIB_GAIN_STEP);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int ad7606c_18bit_chan_scale_setup(struct iio_dev *indio_dev,
 					  struct iio_chan_spec *chan)
 {
@@ -1410,6 +1459,10 @@ static int ad7606_probe_channels(struct iio_dev *indio_dev)
 				chan->info_mask_separate_available |=
 					BIT(IIO_CHAN_INFO_CALIBBIAS) |
 					BIT(IIO_CHAN_INFO_CALIBPHASE_DELAY);
+				ret = st->chip_info->calib_gain_setup_cb(
+					indio_dev, chan);
+				if (ret)
+					return ret;
 			}
 
 			/*
diff --git a/drivers/iio/adc/ad7606.h b/drivers/iio/adc/ad7606.h
index 4c39de36154ffb80dfbb01bb4f812826bdc55967..e9a59d2afafd43e66137599dbd8220cd6b641e61 100644
--- a/drivers/iio/adc/ad7606.h
+++ b/drivers/iio/adc/ad7606.h
@@ -50,6 +50,8 @@ struct ad7606_state;
 typedef int (*ad7606_scale_setup_cb_t)(struct iio_dev *indio_dev,
 				       struct iio_chan_spec *chan);
 typedef int (*ad7606_sw_setup_cb_t)(struct iio_dev *indio_dev);
+typedef int (*ad7606_calib_gain_setup_cb_t)(struct iio_dev *indio_dev,
+					    struct iio_chan_spec *chan);
 
 /**
  * struct ad7606_chip_info - chip specific information
@@ -66,6 +68,7 @@ typedef int (*ad7606_sw_setup_cb_t)(struct iio_dev *indio_dev);
  * @init_delay_ms:	required delay in milliseconds for initialization
  *			after a restart
  * @offload_storagebits: storage bits used by the offload hw implementation
+ * @calib_gain_setup_cb: callback to setup of gain calibration for each channel
  * @calib_offset_avail: pointer to offset calibration range/limits array
  * @calib_phase_avail:  pointer to phase calibration range/limits array
  */
@@ -81,6 +84,7 @@ struct ad7606_chip_info {
 	bool				os_req_reset;
 	unsigned long			init_delay_ms;
 	u8				offload_storagebits;
+	ad7606_calib_gain_setup_cb_t	calib_gain_setup_cb;
 	const int			*calib_offset_avail;
 	const int			(*calib_phase_avail)[2];
 };

-- 
2.49.0

