Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6216217647
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447850; cv=none; b=TxZn3I2wmqzoKMlXz1hVxLq9uWchSBFSF4bbv5F5S1MCXkwUCW5KvCUPiFkimaszwuYPgdlYaLQuRTRoRo3AknAa3w7CKTLje3yCeY4yaclIKJWAnnCBrhp0yErwjGK4c2r2UpTe58Dnm1yMlZEM6daF/0tFJr8iyEd+kDCnhMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447850; c=relaxed/simple;
	bh=OCoJU5I3KSv266Dud9GYmsHSuvkY/G/QdJ0ymA0kyLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+1myc86TdQGu73MTU+Nuh1wrV4TStgCHj2XDotHDE/p494QC4GavUXmsbaNyXTZrdCyOty26DeLQLTr0f+xcXB+O2pOYKc4JqUUpo5A+HbbKaTeXIejdBMmLTyziNs0ktK2TTwYSj+TewKgjFR044j3TmbKha0wZiTx0eo89Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=w5UZosCU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w5UZosCU"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso911349766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743447847; x=1744052647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHYg6gWg3qo6Q8O/SnNRE8XUeJskhJduG/oZ7vBh458=;
        b=w5UZosCUMziBchXY+n7I+u74YZPlU/9HCaoXURepJbq7In5x808M/RXzw9gGSz19EZ
         l6CZ9NeICfUVX+MBi4EixP4aiNbbOgwp5dCXuLBt6kP79LTL7Z2nVpT3hlHZzoZtxiLB
         +9dOf7uEBWR/tBWuysQQl/ea4Q7eI3SFRv60OjvlS0LrMdXSQb1WHOgzgUiGM+SMtFJA
         eoKe0yG/c/ssJLQeYsOJSIoAWdaUiTDR4Aa6HNB7lZ+tA1EZcxmGcOjAQEg8pKiZvyFt
         /CZrNOfj1Yr/gTU+MeGG/dyfFKaLkEdichhvtSHs5PSgSf2l92ZXmFWzwqKwGSZ0Zsmo
         CxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447847; x=1744052647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHYg6gWg3qo6Q8O/SnNRE8XUeJskhJduG/oZ7vBh458=;
        b=jsYij/AgR0llGM/RHEyI0TZBYEIxHPs/+NLF2L+tv30Zbc7oYW9NBuOEACU+rsPdUB
         hH0TDUVYmiL2tUZ2x2EFu1+qRHX84Omx+DAuV3rlrv/Ee0ZpPBl7/2SEzEw1cFu3uowF
         2tVLi+S2d+rTXCWYqcJfZOK3z+QDZPWw/HLa8P3LvQJEjMWfUYvUwYc0Dk5S3BidpwkN
         vspxTb9XqKsooJkuSSRkN0h3XbG8yUSmzX4/hZpqvZ1RAQjxT0mursViNPEX3q5slUgR
         skH9cja4EsOlpi728TT0mA6Dsyd+aW1KoISP+5aLonCx5bq4+Mu1GhEBC9jRPcrNVHFT
         otzA==
X-Forwarded-Encrypted: i=1; AJvYcCXGwCD4gofXFyd45GAqeXVkaMtPZ+5FzudFwgMlhWPyh1QFmCDO6/iBTB919B/bS9+xFlFf9Fq3i5cs/dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQjTSFlXowL7MMu7kyUXKyJEjCxVHFFgwiDYkaDXiE1EeGbHs5
	ja/eGpCbkIH0wS/C1ZtuQIpT8fK+8/f80StUruj6hb50ned5LpN1ih9nx8rCDnE=
X-Gm-Gg: ASbGncsCfdlZ1RDBahROZOs/YSrzkruWbVlNGLJqGw9fS/q4PgQDZ08E2wNg/VBaHQT
	gxKfYeWL2G3UUDzPd0ORf1MnjxUQgHmGWR1gH4UGYPATAKHRFbtPQRTupH+DtSXQPiyTa2ypTVu
	tU/jroik6BCDSlgBni0vs8iIOOk44urPd+Psw478zpsza5xijlxA7ZBRNnTdm+uIpQ8G8t+e5+5
	45XCT5sO2K4wcLqhR2mKoAl0DyN3L0uVe5PbkeQAn4dyUYu2BhktjYz2xuFOMdtHv7tsqHsvWR+
	ajxRPDsNPoejVEQWF5o9VwyIn7j2GBTx6k0fxQ5PJsW32L1BqKV5v4zCa7GZAuKyKUDAh85r3Fr
	2XKkjiScCQU3ZKpQCvlXNa05jP6F2
X-Google-Smtp-Source: AGHT+IH1ajlqE2F024lPljZdCaIQapi1TL3tf/zcfKCmohRAxM4jAC9APTecsk7fMbkihoBrWTAcOQ==
X-Received: by 2002:a17:907:3f26:b0:abf:8f56:fe76 with SMTP id a640c23a62f3a-ac782bcd3b6mr32947166b.25.1743447847104;
        Mon, 31 Mar 2025 12:04:07 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-172.pool80116.interbusiness.it. [80.116.51.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9cfsm652288566b.122.2025.03.31.12.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:04:06 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 31 Mar 2025 21:02:47 +0200
Subject: [PATCH v2 4/5] iio: dac: adi-axi-dac: add data source get
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-wip-bl-ad3552r-fixes-v2-4-cdedb430497e@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=DrKX9r5j3TjlenOHNRW1uPlJC2BhLVb8vPawrBK+mKo=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkh/9ezWRN8TLR++uPmLB+cUv+Na/5jn4YOdP5qZXbI1p
 XlS1ree6ShlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCRy6wMfzgSXGZn2flX37OU
 cPrzc2JkpoFfH7+YpB7nAuUy5UBjFob/aQZ9G9Ubowx3Zz10Cvv17tD8hY2nY+dv/p9646G/wF4
 tXgA=
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

