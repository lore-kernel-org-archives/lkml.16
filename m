Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB9255F5D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192506; cv=none; b=QZ9d8D21wL1CPpNp5xHz2u/sZJxIqQnIXkuZT8wW2n/365LkjW/tQMMVj0kD6qdH4WJ8HCq6VGGu7lTXf+ZIwSn+zF2voPt0nAC2/zcpM/PvM179GZRPFu6QMQQa/TZ/yVJ40VYNdq9hk33LaQ1nq/d+LRSXCGHADa58yHSwsW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192506; c=relaxed/simple;
	bh=/r8suY1Up2Qw3JiT04uRdtjQsRncn+ol5tkKKKi4YvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJnGwacp894nfoqSkAc2lqSDazSEbj+yXO8e5WcDrw7GG8VdeYU2MrAoQQKnqpXkp0wOWyvW0+uLeIiDwbzqZiTwUInuM2j9OTRRZcdyM5B/OCC9Hwsyqrl3pLHJiZeCl3A/M0dBEERAVri365fy0yLa9EWPk+lih4P8EtIBzYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hxIacMxR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hxIacMxR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso11339135e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746192502; x=1746797302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RB+4ADJTBxuxoLrq2q5axLDiDnl84yPV2iN1+Z+zwY=;
        b=hxIacMxRcQs3BG72JPMQqyii5EI/e6GYhTDv1A2ma+k8Uec6HiAp9E+/1Pa/qaCFcl
         bvEHDhTMYUcoo8jhtn6RsUP70iL0kPdTMFKGTc67m/9lR95nW03w2vPQQyl06V8VRAVD
         kVWXcA31sMt2vPc/1fUSXfjXhxw4J1pcnB1OLzSdFnPRsLVrTc7sFzFRrQ6q3+8A/OXP
         l+gbuPwznwVNbYjM222L/HFm+vkj9+bcg7ghhZDc42IB1Pbg3SUc9MXG0AD2VtM9Yddv
         zA71J5J5OzApLBa/hzRmEiAWs9FMGkDeaX6OZumTnnRgwPnS/VX6vkbcodVPuG6ZeIZO
         hdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192502; x=1746797302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RB+4ADJTBxuxoLrq2q5axLDiDnl84yPV2iN1+Z+zwY=;
        b=ru7JZsk5DKd6cplLFAhPvHMhigK6Rn5wok52X+AKw3OXsp9zGjpV+lwPmUmTrIuN15
         YJjTkop9A6Mc9cxubkFN+FpmhoPCAvMi6l72qqbjie/YXVcAFnaKzru8NGEmyUpE3+Zl
         Qt/fZFBP/qHHtW4+ELD6K3I8v+uGy0NWa0ir9wbHuAdMRdBjt3qZ5nSeU+1dJdZEoMsV
         D7Jz/jjJ8WfN2QqG1TujXfhvye3Qai9ryBzUKHYTC39w3fQyBtFuJefWeDNKt8RFfT6R
         infgIBHst8oQntIWz2pzhrSCu8Ci8KWH+FVtFcl9k08yDqI+lgyGiIgyGTMakYWuE3d2
         PLtw==
X-Forwarded-Encrypted: i=1; AJvYcCVfDeW+NKTIuipqshe+NHNyCZfTIzbwhmpo+3q7qZ/z69HDgX7PeslFfosRCIuCGe5Gib77Q0hoa4SbZ2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCS54cL9Xh7PzIUJGw/NLr8pLLGNwQewP81dcVt6VzWd0Ba4gy
	unDMsrtnBUwmMu1X7rcpVp2vgI4aZu0UZLXFEhZtJ6ZUmpFQUzcwDLzKUZN1biA=
X-Gm-Gg: ASbGncuiL1kpPHVX657okuHXSY2uRdOMNerRNEZGsWuBeL+X0zRdHmZFN3dLm3qx7Ik
	L5KcdZZonILX8rHTINI9YePROQ+ATRwURhCFFfJ6H4aSAt5G2dJkRxFAvS01hl8D9iwEdpNF4F2
	7tZTnQQQl2b8OPkUnj1u1jHKM5v9aItiHqxikk5L9pe001lGQ9tju59voE/dtGpe7mPde5gokNm
	yge4nWatxGPtqilFgB+fLkwglYsfSyh1Z+N5/Ksfsgz2eKFqcfKLxeWrTxvkx17IR6Sb2ODu+4N
	hX3OkysoulCqXvw9uu4Emk+Wx3Z/eHt1V3gUW6S7fDqt
X-Google-Smtp-Source: AGHT+IEgIlcfMb/XuKwOYfgMGDYSXZQ5POyf/PBHKjynVwRRRgEBI6ighVhqJv33JiCr+mBDdnCeZw==
X-Received: by 2002:a05:600c:4fc9:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-441bbedb54emr29454945e9.16.1746192502497;
        Fri, 02 May 2025 06:28:22 -0700 (PDT)
Received: from [192.168.0.2] ([87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc50esm45761065e9.8.2025.05.02.06.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:28:22 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 02 May 2025 15:27:02 +0200
Subject: [PATCH v2 5/5] iio: adc: ad7606: add gain calibration support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wip-bl-ad7606-calibration-v2-5-174bd0af081b@baylibre.com>
References: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
In-Reply-To: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5681;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=vqrUpAxX+9UwYDkass8KUvKkJQRsyw1vKSCquKwrjPg=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgQOaGeIrHou0jJxfBkGdabri3MKdcclXfeFsx7wWp3d
 uu2up2MHaUsDGJcDLJiiix1iREmobdDpZQXMM6GmcPKBDKEgYtTACaSXMjwh+OlyhGPE+olVkpZ
 S7KbnumenOwyz4WH2WPej406Bxzj3zH84XHz4J63t0kiUYhj5bH5Bzh5N7RyTIwyOLM14kNUndF
 7dgA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add gain calibration support, using resistor values set on devicetree,
values to be set accordingly with ADC external RFilter, as explained in
the ad7606c-16 datasheet, rev0, page 37.

Usage example in the fdt yaml documentation.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/iio/adc/ad7606.h |  4 ++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 139d8b3f9bb39dd631a71c70539005d719fb5b7b..a167f080e89c8a8d8accaff5904cce31d860edf9 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -33,6 +33,10 @@
 
 #include "ad7606.h"
 
+#define AD7606_CALIB_GAIN_MIN	0
+#define AD7606_CALIB_GAIN_STEP	1024
+#define AD7606_CALIB_GAIN_MAX	(63 * AD7606_CALIB_GAIN_STEP)
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
@@ -357,6 +366,50 @@ static int ad7606_get_chan_config(struct iio_dev *indio_dev, int ch,
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
+		if (ret == -EINVAL)
+			/* Keep the default register value. */
+			continue;
+		if (ret)
+			return ret;
+
+		if (r_gain < AD7606_CALIB_GAIN_MIN ||
+		    r_gain > AD7606_CALIB_GAIN_MAX)
+			return dev_err_probe(st->dev, -EINVAL,
+					     "wrong gain calibration value.");
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
@@ -1410,6 +1463,10 @@ static int ad7606_probe_channels(struct iio_dev *indio_dev)
 				chan->info_mask_separate_available |=
 					BIT(IIO_CHAN_INFO_CALIBBIAS) |
 					BIT(IIO_CHAN_INFO_CALIBCONV_DELAY);
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

