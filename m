Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2683C277805
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223872; cv=none; b=YXNsTBHf1T8Yx2Ri1arXURQ1UwUcNosnUpRxL9RjLDvcX6ByqEMRg6onnvkJR4OKygyUTxFUzF7/0hB08yHNSzXTjkCiHMR0VoUTmX7eyLqwy93Gn/fNf9tlc1LPVvZQRsOYOEbBH+2xZbEtYI8ZcKnyJ9LL4QyF4kxXbpazi2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223872; c=relaxed/simple;
	bh=uaSn6MwlcUjmKtZsVLaWOQsSsxy2zH+ZMA/NJ+Ecw1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ni4UA4bFg4uAgXVXuOIPX2v9qS4csvQHTEm8fdPBa8AvvYntp9AqvAy4Ci3SlMrQoDCDJOgAIfgvr/K5FwLuEXgZPjd1Yck4Pel+3ZCnIc5ablGXnDIjLwxfPNg07RycKw7ZNCkSqCalMgpEk95YmicWqN9bHWhwcrbHYR1Qfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KirKT0OS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KirKT0OS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c2688619bso4486326f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744223868; x=1744828668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TWjREkBL8GjTju5ZPe7ZnjIycMK9O4uTTIH3dx3mcg=;
        b=KirKT0OSs6BzC8KRfTi+9CJxcLlGB6wlpXhYoPmmIgbdJn1ItQR6d0MTUaxP20SLoG
         ATye1h3NI1PUrxPvqaJFSbvTt2aeDeW5r9ircgRQzkKIeiUrUiM4oSlV7Ee8afgzZsig
         4WAP1tkgTBQT51OLlUVr091OEYgkGSAIoq1fLTapCSVIq84fAkk3dI6RDF/AfCs7oInN
         BPfeWUvodTA5UG0wWwLdztiu0RPQ3PO7tvD84by4HIExKX2YP/TMe1ztjXvSSiUrfDva
         1JsS1ASC4RVFeWqSiBb9reUGn1TWoPklVmaPhlUIA6WPWQaB0uyQCuCC8otMs0W6EKQ9
         TwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223868; x=1744828668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TWjREkBL8GjTju5ZPe7ZnjIycMK9O4uTTIH3dx3mcg=;
        b=tjMbJ3PAkB+ijHBhCkQ+xaO6sgfE9SXxRtSxicag6NlZxOySg1lWY2mDqUXfUKGTlq
         RL1dK4P8Kwii0MopiMv7KupX+JEceA1NiMa+4E8isL/kWvhmaN/cwLGAuzI67AQLhvd+
         JBWZEsm9WT/NDNRffGPfstbw2Xdhfn1YSVz8wiqyELWziaYUdO3TQsJiP1t0ekp1Ylij
         8mCXnoOTEmwbkFMkZfuCiIx/wJaYhzsFYOJHYef/tiyXwDvgSpUkKJhwmDfSthJo0k3F
         vK8Hz/jc3ZWwOeOhipb4nxIFG23kHxXj0YF+vweKAqvXtnn4fV3zkrmwFwEbiorOBhn5
         shPg==
X-Forwarded-Encrypted: i=1; AJvYcCV4SQDugZHbGPjFTQRcxE2iQ/9z32iSBx80Slczpkf0xolIXV3OFxE9fBK3Z5T9sikj3kB3P8BaBoqjYCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmMaYySQtKGBLr0WfyJ8iB+700iPRnFWN6GbtWh45yLGz3fDdR
	00gNsjBMwwIMzhkUM+Yw49y2MBD+8UuN6j6Whn7Iv2ugO0piY3tjKk3+7BCePJw=
X-Gm-Gg: ASbGncvpXll4wgiT3pW6DzEzAZOpvS+5k8/aq0fp99zuPyZHUEWXF2sqKPz7LSse0SC
	XRlYFGIYFnx47S+xQ8BqKdTt7STOYea/wz6ttE91asdpcCkk8cvHWEg2FJr3kDSfcoHqEjOUmIs
	T4nxQM6Nbq+d3wX1ysWAYUXcV3lowp2VZ8pTIoCm9DJcZ1qrSNj9Dkpn5BK/X9dmVGvAf+74r+D
	mFl4nP693j9DmKrVtQYCdtg8wbFjKYXT7aPp3jgJbZYri++AKTQkOdUNM4HotldCkID9ypg/PfJ
	keC2xhKZRSZW/1ZChquHTmI5zqYqWirsAcKvenDUsEt82PxvmRkK1TguLMKJQDQJBnmbzF41Dq+
	72eFqvvpC2I0gXab4qQ==
X-Google-Smtp-Source: AGHT+IHiD6DpDsPdWzofgt2e9mV3mId0ez7Jbo755xSenrxr4s0bEDbqHojT24paLUJ9xvA562w07g==
X-Received: by 2002:a05:6000:381:b0:397:3900:ef8c with SMTP id ffacd0b85a97d-39d87adcb11mr4182487f8f.35.1744223868292;
        Wed, 09 Apr 2025 11:37:48 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a808sm2380893f8f.53.2025.04.09.11.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:37:47 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 09 Apr 2025 20:36:28 +0200
Subject: [PATCH v5 1/5] iio: dac: adi-axi-dac: add cntrl chan check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-wip-bl-ad3552r-fixes-v5-1-fb429c3a6515@baylibre.com>
References: <20250409-wip-bl-ad3552r-fixes-v5-0-fb429c3a6515@baylibre.com>
In-Reply-To: <20250409-wip-bl-ad3552r-fixes-v5-0-fb429c3a6515@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3092;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=UoS9PVUrR5VQ2Mqe4V6ZiAxOY0YtQJ30vm21lXMXNAw=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/tk+3t3nK51dS9hPe71q8REPG88i90ug5DPnLHCdO2
 JnXrG6/oaOUhUGMi0FWTJGlLjHCJPR2qJTyAsbZMHNYmUCGMHBxCsBE3s1nZPj2lefg1JNLai5O
 OfSB98DdyAXpwnyNrAYT5veFXmdtUjJn+O8gLu3NmuQWc3e2y+vIraWV8fMkOaoE+VTXaVg9YMq
 U4AMA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add validity check on CNTRL_X channels (valid as 0 to 15).

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index 892d770aec69c4259de777058801c9ab33c79923..f86acb98b0cffb09bf4d4626f932bf1edc911e2b 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -84,6 +84,7 @@
 #define AXI_DAC_CHAN_CNTRL_7_REG(c)		(0x0418 + (c) * 0x40)
 #define   AXI_DAC_CHAN_CNTRL_7_DATA_SEL		GENMASK(3, 0)
 
+#define AXI_DAC_CHAN_CNTRL_MAX			15
 #define AXI_DAC_RD_ADDR(x)			(BIT(7) | (x))
 
 /* 360 degrees in rad */
@@ -186,6 +187,9 @@ static int __axi_dac_frequency_get(struct axi_dac_state *st, unsigned int chan,
 	u32 reg, raw;
 	int ret;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (!st->dac_clk) {
 		dev_err(st->dev, "Sampling rate is 0...\n");
 		return -EINVAL;
@@ -230,6 +234,9 @@ static int axi_dac_scale_get(struct axi_dac_state *st,
 	int ret, vals[2];
 	u32 reg, raw;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (tone_2)
 		reg = AXI_DAC_CHAN_CNTRL_3_REG(chan->channel);
 	else
@@ -264,6 +271,9 @@ static int axi_dac_phase_get(struct axi_dac_state *st,
 	u32 reg, raw, phase;
 	int ret, vals[2];
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (tone_2)
 		reg = AXI_DAC_CHAN_CNTRL_4_REG(chan->channel);
 	else
@@ -291,6 +301,9 @@ static int __axi_dac_frequency_set(struct axi_dac_state *st, unsigned int chan,
 	u16 raw;
 	int ret;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (!sample_rate || freq > sample_rate / 2) {
 		dev_err(st->dev, "Invalid frequency(%u) dac_clk(%llu)\n",
 			freq, sample_rate);
@@ -342,6 +355,9 @@ static int axi_dac_scale_set(struct axi_dac_state *st,
 	u32 raw = 0, reg;
 	int ret;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	ret = iio_str_to_fixpoint(buf, 100000, &integer, &frac);
 	if (ret)
 		return ret;
@@ -385,6 +401,9 @@ static int axi_dac_phase_set(struct axi_dac_state *st,
 	u32 raw, reg;
 	int ret;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	ret = iio_str_to_fixpoint(buf, 100000, &integer, &frac);
 	if (ret)
 		return ret;
@@ -493,6 +512,9 @@ static int axi_dac_data_source_set(struct iio_backend *back, unsigned int chan,
 {
 	struct axi_dac_state *st = iio_backend_get_priv(back);
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	switch (data) {
 	case IIO_BACKEND_INTERNAL_CONTINUOUS_WAVE:
 		return regmap_update_bits(st->regmap,
@@ -521,6 +543,8 @@ static int axi_dac_set_sample_rate(struct iio_backend *back, unsigned int chan,
 	unsigned int freq;
 	int ret, tone;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
 	if (!sample_rate)
 		return -EINVAL;
 	if (st->reg_config & AXI_DAC_CONFIG_DDS_DISABLE)

-- 
2.49.0

