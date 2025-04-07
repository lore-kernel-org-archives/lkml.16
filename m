Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C8422A4FE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016014; cv=none; b=uIgAL7SvMFLnDdjBs+60Lat48NWkgHQplQGde6KuVfGzdtIvX5m8RWhMERlK91axg4x9OlW7fhtADJMrF2UgM01UgD3UN4kKH8Wq1oPBg2VhJVEqB9AC1hydoOSt1JJTSM6GHjGljOBx3SwPNXHr805ltkdzwBY1JzIhzPFatTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016014; c=relaxed/simple;
	bh=OCoJU5I3KSv266Dud9GYmsHSuvkY/G/QdJ0ymA0kyLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtgLs734/qdf3LS6xmogG8XR8ewHz2rsytU3b5qksUV9NDw513OUboWlMOfQq27N/43eH6Bg8/eCQrFuL3Wc4u5NHh7ZZjTSfbLe0TidNuykoYO2EyBO0Y2+JNaHYiRcyJ1QNmD/NhM1zNoIzSEaFklyLj2qGfLA7taOqgL1Rls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t5dQ9luL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t5dQ9luL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so37133795e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744016011; x=1744620811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHYg6gWg3qo6Q8O/SnNRE8XUeJskhJduG/oZ7vBh458=;
        b=t5dQ9luLTW3NiNFEajHqSP6F/uTWMdjppO953hKmrDzyfqQyV0R8jbZUON7RbNjhmP
         CQOnptnH4i994yFfHtp7tG7CrbyxvQM6jRP9fXUJaPfqrFqLoLfraNKrFXfnDJNBGqvG
         LnrU7SJba//rAmy33++2StIbPRX1vSmcUERrwbcm9YIbMsHOEtVI9MWTJJtTi3sLbor3
         LycKL42fdx5KQ6s5iZfAkYurqZK5MeUBFVqD1HiFv9pyyVPI+2fY8fbOIXu4sjIfEVc1
         Ug54yUG3uLAPQOoDeGIgHcxWsv6keNTEglecCizqXQRbSiL78EflpsHTFPp8t5w7HIZl
         7l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016011; x=1744620811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHYg6gWg3qo6Q8O/SnNRE8XUeJskhJduG/oZ7vBh458=;
        b=M21uLAMpm4CWhmiva1nyWF3C1U0OC/o7a6vWDWjhygSX1AKLAZH1jyMMqeK1Vr4Llw
         IIvR2LjPguU+zzy38LB02hP7QoIEGanK90feppD99r9Pu7IVkmiMjKMy+4r0/P1TAG2d
         z41h4ZsV43haSj/Y9wnJTBYjW9bkhQbW1CVtMvVEWrF9wYIC4wupBpWDLeqtwq8Ci1rn
         RH2jlBhBm0grx6IobcXP5F9gpSmZyEzvhqJhZ86Dbs4rw5jBiqL0qCZbxn2uK84yH/7H
         3sprWYugSmZzcn+zGv+Hp0djk0nJZe3SKj+NLKyODzdaydvRusFyeSD50XrWJ/qObvQI
         ueEg==
X-Forwarded-Encrypted: i=1; AJvYcCVMlhyVpJ4FhBdwutbbpuDyjSloQEXgWCE859El77EmlGXmB0qGhH4BhBGB1H7Djb86XjbMlNfWbbxLEIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnA27QbcPEyHqguwGoFJS2/OGwB+AsWB9TrQfzMuWcEPxs3ier
	Zer8GNGdxHtCZJhtDAZ6vj+Ktdb2j/oN9aoWHIzh5+WQbx4ooCmXVdfvUddhMMI=
X-Gm-Gg: ASbGncv/GHObgjWszfSpm+Df/GcNEVB+LiJAmGYYfFfQDLBnhuhzxrvLWf30kNH1ahj
	blyZlbCzMEI6MZMzqkCbCc38FWPqTFeOlVYiRNpTtMk59MD7fYFZeffEEv5FjbKfVfsV69RKV8n
	qDibTJ/8ueig5jaZL1T0OejkOCdL/cPBIaMJGEGmWsOMap3HTqaJfmphG+DTU75zy9HTK8bai6d
	o+yF0uV9ijEIsoTqMRVfgpdzyE4c1/jHbMmD8XDnWQistk83zk+/Vt7iDTw35bJf65E0BqjwbhJ
	H7iu+hTIuDRAEYytqRGu1BBrU/BzbAdisOifdRJGRkqO0A0dCuB1OxGdvzCDHHLWnIFQxx5eTYa
	+E0MBQUuLI7CSNv7RlXYRZQ==
X-Google-Smtp-Source: AGHT+IG3UNqwKSmnEghN1Yf0vzRJslD7xevndIQG/1hxBxCx6zKFOX6soLxXbaPP6oJYqCIRrGEM3Q==
X-Received: by 2002:a05:600c:46d5:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-43ee077feeamr71808175e9.30.1744016011319;
        Mon, 07 Apr 2025 01:53:31 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm126966995e9.0.2025.04.07.01.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:53:30 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 07 Apr 2025 10:52:06 +0200
Subject: [PATCH v3 4/5] iio: dac: adi-axi-dac: add data source get
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-wip-bl-ad3552r-fixes-v3-4-61874065b60f@baylibre.com>
References: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
In-Reply-To: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=DrKX9r5j3TjlenOHNRW1uPlJC2BhLVb8vPawrBK+mKo=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/PMnGKK638KhKL68Wi2vYhOdn96hf/lEkv9XvtNbUg
 GKxhdW7OkpZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExkLjfDP+0cvQ85O3L7A+d7
 nxKVPSDi+nt9CH+dUWmdwJrwVwE6FxkZZmz4um3a9phZBnpPjsjm22XXMi4OdJRfEta42ti/5GY
 NMwA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add data source getter.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index f86acb98b0cffb09bf4d4626f932bf1edc911e2b..8ed5ad1fa24cef649056bc5f4ca80abbf28b9323 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -536,6 +536,35 @@ static int axi_dac_data_source_set(struct iio_backend *back, unsigned int chan,
 	}
 }
 
+static int axi_dac_data_source_get(struct iio_backend *back, unsigned int chan,
+				   enum iio_backend_data_source *data)
+{
+	struct axi_dac_state *st = iio_backend_get_priv(back);
+	int ret;
+	u32 val;
+
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
+	ret = regmap_read(st->regmap, AXI_DAC_CHAN_CNTRL_7_REG(chan), &val);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case AXI_DAC_DATA_INTERNAL_TONE:
+		*data = IIO_BACKEND_INTERNAL_CONTINUOUS_WAVE;
+		return 0;
+	case AXI_DAC_DATA_DMA:
+		*data = IIO_BACKEND_EXTERNAL;
+		return 0;
+	case AXI_DAC_DATA_INTERNAL_RAMP_16BIT:
+		*data = IIO_BACKEND_INTERNAL_RAMP_16BIT;
+		return 0;
+	default:
+		return -EIO;
+	}
+}
+
 static int axi_dac_set_sample_rate(struct iio_backend *back, unsigned int chan,
 				   u64 sample_rate)
 {
@@ -818,6 +847,7 @@ static const struct iio_backend_ops axi_ad3552r_ops = {
 	.request_buffer = axi_dac_request_buffer,
 	.free_buffer = axi_dac_free_buffer,
 	.data_source_set = axi_dac_data_source_set,
+	.data_source_get = axi_dac_data_source_get,
 	.ddr_enable = axi_dac_ddr_enable,
 	.ddr_disable = axi_dac_ddr_disable,
 	.data_stream_enable = axi_dac_data_stream_enable,

-- 
2.49.0

