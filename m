Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36951B81DC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447847; cv=none; b=GxIw+y+KNV0znDbmPT6KogXuEqLtEQEpJLwQxVOXsS+aRKoVHrcNrxc+JkeIi0ltEk+WcYB02e3Unwo67Ars/dZuDUEN6ybkGXS3upnYn3Qdr47A/aD7dZuEfyTwPcElBkgk4XZvReGwSH5rCu2gO2ZtqlhXN5it0mH5wdBnOtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447847; c=relaxed/simple;
	bh=pCpjDjmBZOzK40k+vljZr2BliJA0xp91AOXjRWTRx0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjZ9pdqWEBtAmkzhqrAQPfVT3zHYcOEli8f/xsPywGs1fJJFmL7HjRkzmpaLAh9J0kLuq8zOS24TQ4O26LXXIeytrKyu+A2UfMLE2UECoq9fvPJJg8cWS9fBwxvxti/DJ0YeasABxvGySK2JpZqiBemjKtJQJM3MQdbj93URKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=16yTkjXF; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="16yTkjXF"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso856489366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743447843; x=1744052643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOf9H7BQRbk9vcOFRZPDyvrAxaPKr+t8x7+lT2OYigQ=;
        b=16yTkjXFtBIglHFhdwmF0nFiytBdEPI/qZmziZNrDzLV3W7VYMuVe4NRLU+lQIqmyr
         CNJIAi3i2TXPlijRe2JUznrJvIUAz8rm4Ryeg8ZOPhVsnldQRKcoKw0WN/iGnolcFMrL
         9kn1zkS1hqHrAZaWOFeVzf5S/nvmoXxPQAu+cDbah41tJxvXonwzTFX5rshoi9YSaotO
         vYc5eAHBTtSWMTOJ6okijT/cT1Mynu+VuovodWMYzKFvJWoraDA5R3L5Yl11X0c2OWZ3
         P3DwvGjlnJl8qfN1kiYdL4fH13hxGk3eKfJXx+mj7TdaRF8mqjQaMmhABfPOQ/hDhLyE
         t4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447843; x=1744052643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOf9H7BQRbk9vcOFRZPDyvrAxaPKr+t8x7+lT2OYigQ=;
        b=CPyD3F1R8ARFxhaPY17lrvIBRJoF6tG8sbJZ0RojjBqNO0sdV6M9glKpts4RwVVaoy
         HgWAoYJ6i+eYjah0jXqUstnUtFZUJDVBwWQtE8NzFwOCD1A9UhrQ/sqgai2A4Qijf0DG
         /I+N0U/IVOfoXY+G+sK9BlFuEEzcGnP5buZIOc6MDtC90sQZvKHEQZcpEpZzfxve3we/
         1y/aLkwH9/cPv6AwPPPgxmqSsIzWK09hEvg8HEFMEBlsPvIKDgTxOYv4S11YmwwNdaom
         oC1qbz+SA17N/+wBrrqarQDbEdsmPOfo4uQOKs+SEHoo3vB8xm1/cAonWpM1j7oy7fNQ
         EJZw==
X-Forwarded-Encrypted: i=1; AJvYcCVzPMFzUbqlTOKkNGac28/Kp2i8Okdpgxtt4ttFOPh/CAF/Hb5PPN81yOOt8vCv+sm2CYGMlvWWV/blK14=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9cNeZJv1S70hTL41832RzIFkQvOTvP9IsOVMCVEvNvBvc+Tx
	GoSlnMs8yZl1bzaAO3DhhGzkAcZ1DzlOaCzE8HWcKFwZb0ZR9KaPAU4+Gtt9dHY=
X-Gm-Gg: ASbGncu2hXnUitVZ3beRB+li/PGGU4M8/oPz9J2bwo6fbjNMUY4eKfUdRLFq29LxXR4
	WLf3nrhUkYHkhy0flltA/YqLExgiahVmFiV7X5WybmEnjnFDpWYMgS1NsXBiBrDRscXEWV1iYUU
	O7b0spessIaqSbrNkhc+HFPtbnkwt15mwv8ypUpSbpRSh6SILMm868rB2ad6f/Pr59Zo8f74z+V
	B8v7ja7UAWC0AIu4ok+NH1M/AOBEhu6C/OR0AXmCwIUy5Q05O96qwG35ilW4dxQlXVt/g10BSDT
	w5KGxCEmZBLZOc7+oXtPkJzfvAwii0Uei2PnMpFyhcpOJ23fqLM6BDBnQpeG///wXY6HJUj9y8s
	jqTrs7u2DC3CmwarRZe/UYQbZFlrS
X-Google-Smtp-Source: AGHT+IEyejNkLxFRZGWHarGHeID4fM5LIi+a+hGbdyDsdvvbQ4mg/BhGzUVbVkgba/o0+UKlP4fIgg==
X-Received: by 2002:a17:907:6e90:b0:ac3:d1c:89ce with SMTP id a640c23a62f3a-ac7367700fbmr867755566b.9.1743447843171;
        Mon, 31 Mar 2025 12:04:03 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-172.pool80116.interbusiness.it. [80.116.51.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9cfsm652288566b.122.2025.03.31.12.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:04:02 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 31 Mar 2025 21:02:44 +0200
Subject: [PATCH v2 1/5] iio: dac: adi-axi-dac: add cntrl chan check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-wip-bl-ad3552r-fixes-v2-1-cdedb430497e@baylibre.com>
References: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
In-Reply-To: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=LEhJ7d3UZmGONv0UbtL1XfLYWtYo9rliWEIHzqon6QA=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkh/9ezWxmP3Xs18uCfJ+dP2ny03pzVc9jx0p/SEdeQRC
 0/7lsc/jDpKWRjEuBhkxRRZ6hIjTEJvh0opL2CcDTOHlQlkCAMXpwBM5EAMw/+SwJ++Vilf9Pz3
 Pbu5yujl3Ayd/WxlWx7OEHJwWL3Vp5ORkWHG6onLHm4xj4kzmr1sA18at0T5kdAaPV+hdWsP3fm
 wupYbAA==
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add validity check on CNTRL_X channels (valid as 0 to 15).

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

