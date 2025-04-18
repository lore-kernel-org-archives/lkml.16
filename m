Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B5B253B7C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017161; cv=none; b=qp3E3sBQQa7rSAd7FuXsw8qWpG/kw5occt8RjKcW059VA+Yzjd1Pe7WsXoGxSajjUVJfcvXqnW8UaX8vc9MsyWHCzpUMoKRvWE1bR3Oabr9ExGgDC9zGzMTJ1cA11NcFG7HxRiMHTI/+0bBDdXPj4kX3W8S09DgokfEFK5/+yto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017161; c=relaxed/simple;
	bh=riLMNi8cTRALK+z2tdzALBzLDS506Wq4e/lftZ4Qza0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1C0EYtL+0TB4Y7rQgY5E/x6Iu5cbbJbW/2WYrmDiT/99fGHVaVHEDCASKoqNTqlw17lqcyHfSeWDl3NA8MTmB90G+zsmlfXX4NS5xt+GjYbb3reCNOdavxGWfjapfwC3r3UxOmL3yBdP2Q5a8rC4FIzzGU2/1pUFh2/JxDgA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H1CTWtCn; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H1CTWtCn"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c27166ab3so1470691a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745017159; x=1745621959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKikOgoKDd6H5VVHjKZgNHtxeK29B8IxCF5UHWIsVRU=;
        b=H1CTWtCnIsxSGloXteS0VxXMnL+TYx6mcDudDOJ6E4COVVDhRYx0NjEG5KdwMBDCVk
         hWV8PFLpp6C26Hw0ymzkZ8jfeAYkXnSUDImeXB1b4allf+6iNQrhL09nRxniaXDNyJMi
         b4R61orBrOo6SD5T60r6v5vdTku0cUZfn3p3tYPA7QbYfXecGO1DhbGLZlRX5AwPmr5K
         Xxb2heCBgY/p3EUCyLUn6x9F3jtIFWp/pfypafPm5am2LxA4nzycM3rUN5Fpx5OKxxr0
         edzVokUlTP43JqGBh/xdHmrLSjakfJx/9eDorDsFoD0ybmz2qmCWZqCuFCe4uGUqMdxD
         T/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017159; x=1745621959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKikOgoKDd6H5VVHjKZgNHtxeK29B8IxCF5UHWIsVRU=;
        b=DdfODjX19UhB5TPhLW3RAQXrONGQ7+BO+EdvCIQofe1Be3lP8r76LfzqPqY6wxEx/M
         JedLNtnTTMf+YMDKbM8kAvOeOEyvh/rhEf+XQd+JKMwxoO/+y+zYKoRmB0oZ+eMiCbEN
         mhNIollCJ8WcSz8uMiLCHPwhbvRgfPh8cEmn5a3aiqstUF/pyDLLonVjP3E1aQirF5bE
         TfQm49HtTFak79hT4lWCln7mbPuyLghxCxAfy5Fbo/EE49opExYFsOCsUYTq0IM7vYpl
         hNXfAG3g5UwzQqL8MjGPcLhYbp0DGwpySmLIVcT3pMphLxi3buLYRocHcdYfKrBGL1py
         H2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZKVPcCYlmukrC4Kn+OGsx3O6JILEBf5Ye+xZklP7yVqhnzUrcoriwOHrHw4CMX5iYKpVycTorOAd0BtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZuiefPgb+BKOi6GqwGInADe+OasA0p9zeuSg1WdLIAOFgFJwY
	uqFNBsGA/+JGx+CWWVwm4b7BWXQZhlFNBgK/aKfBREWeTyiThBgefnnRxHxahlkCJLq68mRCeGx
	1NCg=
X-Gm-Gg: ASbGnctXNS0jrOownttg6mzuDgIDRjmZbIpPXve+WeJw6Iola30cO/5oFBjVxfbVlrG
	Ut15lNjKZAWypjznfgHPUM0RShmQtZboPmTh2TfYPZK7ddlpKKQFxu/s1p0zv1OfFq3eAM+ciS8
	YU/k1HvXB5x3Xaw3lUDVZZy29zlB0ZnKVRmWUfnMmADQRBsyHtOL7MrtHeTjxKtDZV8OpkaZ+dr
	g89HCcBRWAmz5ZyC8I0dMFllAqHdqGnMJteiTPEtuFilt6peyBlBygVeLvIltQ/9Hg5Dk9LRAiM
	8DF3n6q4/WOPe9f0yQZerRZdS5Dv2w9zFkaLAIN7bRwFcNQ=
X-Google-Smtp-Source: AGHT+IGPJokDaTAIKv/2DTkY0IrE751M1/ey6Bstj4RPUeiVBf+/tF6VXizJAmOZInWQ1epMeUepcg==
X-Received: by 2002:a05:6830:6288:b0:72b:823c:8f66 with SMTP id 46e09a7af769-7300621472cmr2288047a34.9.1745017159150;
        Fri, 18 Apr 2025 15:59:19 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047ca051sm500187a34.36.2025.04.18.15.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 15:59:18 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 17:58:34 -0500
Subject: [PATCH 3/4] iio: adc: ad7380: use IIO_DECLARE_BUFFER_WITH_TS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-3-ee0c62a33a0f@baylibre.com>
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
In-Reply-To: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=riLMNi8cTRALK+z2tdzALBzLDS506Wq4e/lftZ4Qza0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAtk2t7drGYkZBaTOujJackZlIDOkAakZwtlxz
 7OJGnoF95eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaALZNgAKCRDCzCAB/wGP
 wGcMB/9a4WWdbWax5eiemUVcfLr13sp47i1kakQLLayyBmRyEaMLfzx0oomjVAIf9nBSWOq991n
 5EXQ2ULf0zWpWOTVcx87Ie0E1hJtkhB26kdM/H4nwFqxacPNsWcETx1LJbdq86uHMuFvW5Yvi3m
 mxpjVC8EkEKCV+DzOJ8Jg5N9MzDpxQ7S7oc3EBkpPTrGAIvyOW979gFe5bZOyPAI/qojBM/PJ0i
 hI3wlIaA3a2K/MlMTwjuqaRHwEA6MT6jjOo80ZGoj+WNT/D6XWGT4V7Y7osJUymCYHZk65cceng
 mi6yJ/53Usj68z70BNR31ZCpm1PMt88v8cYv/55t+gzTy4gp
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index f93e6c67766aa89b18c1a7dec02ae8912f65261c..f89b195c644024151c14977fd43e279a67439fb1 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -909,8 +909,8 @@ struct ad7380_state {
 	 * Make the buffer large enough for MAX_NUM_CHANNELS 32-bit samples and
 	 * one 64-bit aligned 64-bit timestamp.
 	 */
-	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
-			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32))
+		__aligned(IIO_DMA_MINALIGN);
 	/* buffers for reading/writing registers */
 	u16 tx;
 	u16 rx;

-- 
2.43.0

