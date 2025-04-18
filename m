Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D83922DF84
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006394; cv=none; b=Nc3XtwLVJd3PTnC3p5fWLIGb02+HloQB4hG4tXYjdPN7LOizebrcxmRKab1xbXMJkjHKh7ZXtLut/h0/DemZZL+A/IMgMtwxz4ZB6f3K7na28mK1cLVm1kRPaKcmAJdgyNYzeQXKTLECNp+WM8eY/YPyRbERpltMHYusAS7a3mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006394; c=relaxed/simple;
	bh=iRPzfo7zOSrCZBlrpd/I0/sbvP0TP23KOBXM/qSN7Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqhxDaKj/h/k6js7pMFlPIJRjp/FexxpROeeUmxtqX05gVS74StQSVEvSEXrkpBh6Lkfe7XFsQtw5OJdaG5nKGaT5za6Kf3BnbyhWd44AUZvrumm5IO5hyr69al6ooUHrkEsYwOPDHSdA6hJULG/2vhZK23P1SVPA2KKHveTrzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=txQmq/Fd; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="txQmq/Fd"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2d060c62b61so1185792fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006391; x=1745611191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsIMZendqa8DaCGwLwJ/VzIDH8OWSK+LqGllC/PCXxs=;
        b=txQmq/Fdb3iea3X30BbXxOLjZdFcuPH3q4Q4V+Vd6OzW60WDbq2cEFgtYDRsKtawim
         Rs8yA2dicv5aiQMdrUFUrA9scae8OBlrUKHa1HrqzK0IN+U5HoCoPNxC6p3yqZiZ7CvF
         bfmsDdZT67mqF8GVMeccSxj2OIFptBo0Izes/+1+eGnZj6PP4hbmyZAokJXioSAtpNQ3
         CIa35vxs5286eLi8tKbgRnRmeRKOFmk5vSkvF/Kf9A7fCUYN2s5rCxrIMC2F220gvadC
         gYJhXMSJJMXOMofSw/aHioC0/5f0SYJDOdQoVbGvY/VUFo7adVqLWZ2sid1XXza4A6nf
         BjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006391; x=1745611191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsIMZendqa8DaCGwLwJ/VzIDH8OWSK+LqGllC/PCXxs=;
        b=k99Jlsl9JSLeUaqC6rPudR3HTBeOT5oMow1bU9O7NzMnpr0iM1cFACyP8mch/RD4Rg
         qNSFmtkuRY+8OQo4kX5kII0nNjgIQntik6GQDPFqN5u+HyHIevzB62nTAJLxaM/oEr70
         6g1ZooEy1JyL0aSYfTzPUvo61HOwTYlfky5K7bwyFdNYiY1oAcHM9CBNqIAfEgT5oIS3
         vm0pGxI/JptDwuM/1hGSm4T/pJAAmACVAHurG0GE8QZP2VsO3JjC2BKMsEx1rlJzZNTm
         52TEHDvBty5SKqTbEYfOvcKUb5QCwPeBtPoevHatFqLAQakWVjkgNyLGTG76jhAE2zt1
         b/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVf1rBy4JM1ZSDu+kj1fqg5r3mXKjCKk8i12baVyi2kLMr6UrPdXj9AJmEi3qQswLN1tnYddzaQg6PHaFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaMctauD0ohrwIzzCFk+nGOaYY7aJjaChgvKGSCQ1Sh9qdodI5
	lgyON2ZYKZX6dfQpUWcSpYkhhLF6JjfjjXJWaxF7hLBKs63nHjaKnF/89qYMJmQ=
X-Gm-Gg: ASbGnct11DzUCLveI5jBQ57F963H9hTjfMfAszEBVwf2mh/OErPA9OQ0VmkPhYjop1v
	PR/7Bug6iBCjyqSkKqa6c4nXgo95pmcA1ZEovxQMj15y41ypYfchsSlmxNa+RtYt1+Svbm8yjV3
	aJJXiVlPh2sfHtgm+jgp5+Tq7ZLo0fpvLwQzcJMDIsdisFYSClfDUr2LbBQ9/Q/4CaWT/0Ujo15
	l6BMvKmqXGMpzHZ5sArHK+r+wsP9L6VaVwyGWae3C2QO/gvW6ub8ssMQ6e3flpfARXFXIBN+SIs
	6JTWmB9ccCleuTPYHuhSS/RRBchf7J/LPJ40JAqZxUyo0f0=
X-Google-Smtp-Source: AGHT+IGTd+UcoiQqg98qqmDzGZdASpO+rjK08cJZPLUbdLs/qVHjgA1d1/DCHAAtJdt7FeGJ2N7IOw==
X-Received: by 2002:a05:6871:20c3:b0:2d4:ea06:b11 with SMTP id 586e51a60fabf-2d526974c88mr2268314fac.7.1745006391551;
        Fri, 18 Apr 2025 12:59:51 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:23 -0500
Subject: [PATCH 04/10] iio: adc: mxs-lradc-adc: use struct with aligned_s64
 timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=iRPzfo7zOSrCZBlrpd/I0/sbvP0TP23KOBXM/qSN7Jw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq79D0iiaEJ7LNLOItStpJpxJqxn63IdcoEt/
 O8MZKI+HdOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu/QAKCRDCzCAB/wGP
 wFryCACU4cYnN65V5Ne/n/6z/OCfHfoj4mdaoDqdml74vivWqgwTQqSV08oOzwAmNdPjVpxHSXD
 0nV50P/Y20VUEYVHpoJpuUArnFK3lj7jB0SBcX1rOuNCiqtNyuYHA1oH7V+l8/ctZyprtDBzN+k
 gK/IXGShh2E9A4LnYDTDmcfYOS8PHX4JG2NLolVn1LtspWso3m0L/YQH3GfD4+YmyH04/gl4e90
 s36RYJHqALm6OosMFi88MgyyV+9swKXmDAnPnEwmPidTyoIw8bCSdq43K+35GA+BJhDJof0YEmY
 2jSaIuf0L/a+vzPf70hFBbjXqtsIsUHiJSzg6uij9QXSqVg3
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/mxs-lradc-adc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index 92baf3f5f5601b863c694eb03b6d8f287e4fe6ab..73e42f0ebcaeaaa437ba5c64ecdd7759a1191e6c 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -116,7 +116,10 @@ struct mxs_lradc_adc {
 
 	void __iomem		*base;
 	/* Maximum of 8 channels + 8 byte ts */
-	u32			buffer[10] __aligned(8);
+	struct {
+		u32 data[8];
+		aligned_u64 ts;
+	} buffer;
 	struct iio_trigger	*trig;
 	struct completion	completion;
 	spinlock_t		lock;
@@ -418,14 +421,14 @@ static irqreturn_t mxs_lradc_adc_trigger_handler(int irq, void *p)
 	unsigned int i, j = 0;
 
 	for_each_set_bit(i, iio->active_scan_mask, LRADC_MAX_TOTAL_CHANS) {
-		adc->buffer[j] = readl(adc->base + LRADC_CH(j));
+		adc->buffer.data[j] = readl(adc->base + LRADC_CH(j));
 		writel(chan_value, adc->base + LRADC_CH(j));
-		adc->buffer[j] &= LRADC_CH_VALUE_MASK;
-		adc->buffer[j] /= LRADC_DELAY_TIMER_LOOP;
+		adc->buffer.data[j] &= LRADC_CH_VALUE_MASK;
+		adc->buffer.data[j] /= LRADC_DELAY_TIMER_LOOP;
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(iio, adc->buffer, sizeof(adc->buffer),
+	iio_push_to_buffers_with_ts(iio, &adc->buffer, sizeof(adc->buffer),
 				    pf->timestamp);
 
 	iio_trigger_notify_done(iio->trig);

-- 
2.43.0

