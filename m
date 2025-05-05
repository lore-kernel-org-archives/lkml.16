Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EBC274677
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472953; cv=none; b=n8sdZKgb4v8gCxa3/c20MyNKVdacT1Ew8/WvxlqNSGO19E6dunIT5J3IJwaIPEUtGCMjOOYfUkjHCaasgEy/pLED+Bpe3me7WyoSYlqakLTYUTsJ4AN1oqsVuboFBJpyDVt/zvBO9+0lC7qcSpBzgKLyubJbDrSqMwQdhwc0kqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472953; c=relaxed/simple;
	bh=s+oUiYl7CDbWTOgodxyZMoZtOp55e5vM/A6RygvPj1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxVitXLffWLAs80IOmGxFKdqZvJHpqfxElN/8JhYiyTZF8x4GZmKxPEn2XKubqUx4sbTrrZN+Z6EfrQQQwWBh1kZZMKX+pRypttW50e8ASTrFJoa8MuJHBJlufhoo5O/kFyddoSl4VsCLQZEBq6ejQaf211ZCdZ6yowV8hSHZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=avD9sh8X; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="avD9sh8X"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72a4793d4e2so3180776a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472950; x=1747077750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvnJGWDA14GWtEJuBEh8lukLlF5El7ON3BEm8TGMIMg=;
        b=avD9sh8XwwtsyMmPSyPZuw08WDzuUJasvtIplPNA3T4sk+yyRTfrzTyWHfZNkVcD0e
         oMaRvnixVVy3sC9uK6wjOiqxW+2jAytp0Lj5Yx7JV7GlbF6/nUeTZvY1LutTd85/jVZ7
         BMlWL19ARW+qs26Qaw3DN9WfENIKQBy69tke3qGVLQieT0a0kBNSkodUHQTREsaF+W6k
         Y5NxB5hViF9vPyNU4CJU8AcuhiC/ZSek6FZZfQWq3gbGumECqmAq3Jd4FgHVhkL3gA47
         qoL629PTXAa18KBFYFoM1lLEcq615Hb4irP6TgOGh+YL23Fgp5zl6SH9wVZCZIr2bH/V
         E18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472950; x=1747077750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvnJGWDA14GWtEJuBEh8lukLlF5El7ON3BEm8TGMIMg=;
        b=dKZvPnfkxyzq4h0tAJM2Qjrx3bpUyX2lnU+IOvEEmxsw/kAnWgsTIyUb9G+dmzsP8o
         lOhbOXd96gX3gNlS5Ec1iqwOvIkJzKbpLi0PBixvnKQAsOhyBD0iVNWAtjEVgYu0fxtm
         +WMR+MYnLqz4GQB8c2VLfgHCpn4wt6yAj+mdkdUy2G/GuaCoZv/LM8YDlDjr9j8FMGAI
         /AMMt6QqRsuVY8Lr+UI0SJFCBY9E2YC98vM/EpIBVZDS6LaFVWKfNw32cXe6E4juLd0Y
         CjJmpEPzKv8ckWNWRUVpru8QteaoRkRVOYu/YiXcS98waEEHftnzy/tT90PAaI7emQ9X
         cj1g==
X-Forwarded-Encrypted: i=1; AJvYcCVkY92apeSXBBsOAGYpsZigqrInvAmL6RjNH43vzLGAGkuhAv6vlZV2/ol0ypXs36N75oMI1lIHs0zxkNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBEzwiZFX7F0/2izGbYh5z1IxMDCyLuD0E0E2MBWN1jV0XXF4
	6nve9M/1+LNRoqcVDBjWnZBA+LjxQKXv0gj7iic6cV0EL319bkcmiaMlYn+dW7WDfkH5A0KaERO
	V
X-Gm-Gg: ASbGncsSBNb/gYKmLrZRegc3WFdR9KQYIraUJbruec0pX6/yPQEbEd7C0GCggnwvAFW
	D2Os40XnH2ukH8mjMyAi6VmMLbF32//AwZTfujacRv6BJ5g0qWNKXAFj1P3wbrAvMNPakPAT88c
	Dn203w5BP4GrBcxfCwMxhy3yY1knQ4YWTDpgcazIVCureKDkywsISFQ/77IIPpiT5MYnB1PIeY9
	v/q6F6DeUKnTrrA0glJ2rk9Zf+UyCtSlflADEEs81Rk+J9ySdaeOX6vEKHBlOD7gV92nAuBp/z3
	I8DBu1d1BheylKOOxRVLKxYs+jpA4J9wj5lWS6/zXb1wLw==
X-Google-Smtp-Source: AGHT+IHtWmAabMwSuz51+XuM5L5YN1jlQWMYX+d6Nt9gI8sJgZJdIcsUtjLOQgwHgMmp7vUmHoah3A==
X-Received: by 2002:a05:6830:d1a:b0:727:3b06:112 with SMTP id 46e09a7af769-731da16cfc2mr8068052a34.14.1746472950569;
        Mon, 05 May 2025 12:22:30 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:30 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:33 -0500
Subject: [PATCH 06/14] iio: dac: ad5791: remove bits_per_word = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-6-341f85fcfe11@baylibre.com>
References: <20250505-iio-remove-bits_per_word-8-v1-0-341f85fcfe11@baylibre.com>
In-Reply-To: <20250505-iio-remove-bits_per_word-8-v1-0-341f85fcfe11@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Esteban Blanc <eblanc@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
 kernel@pengutronix.de, Song Qiang <songqiang1304521@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=885; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=s+oUiYl7CDbWTOgodxyZMoZtOp55e5vM/A6RygvPj1Q=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ+wW0+DF1g28Ewx0zBvIGolXdRhuMzqcOPeo
 vvDu3SYuFmJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkPsAAKCRDCzCAB/wGP
 wEdoCACD+DRj/1vV/NRBBu1AdZ94LYMh9AfgfpK5MoIPA9zdFRNy48NH9bwnAD9V5WqXQwmrwci
 7pREchILvv/npXq2BSvjSgmuTK6TvfUTk5cGCE2vHS2riJzX7nvvA2pYj+j3ekmjUxyM6aZGCkl
 ieYzXf2GzNsra56jyCHWYGTl2i5p0fXCLZ0Uo7d+MEYy6S2jdMC6coxIRQcFgIeJGCDqmp/DtMf
 EL7Uss5mDp4s5E8+0SimUpLzW8fuQdPycTA9eAmy7l1I/BJRJsAH+VuWPe4RwziPq2b06j8vcnD
 2HTGCR2qpifFuav4wI8h4eRULxKV6mqYlxOmFZ146NszTVXE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the ad5791 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/dac/ad5791.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/dac/ad5791.c b/drivers/iio/dac/ad5791.c
index 8214e524afdb1ac6b2f6baf69d6594694800b6a4..41582f2b90fb9d83ff82ccb27a0eea92d9d9b431 100644
--- a/drivers/iio/dac/ad5791.c
+++ b/drivers/iio/dac/ad5791.c
@@ -138,13 +138,11 @@ static int ad5791_spi_read(struct ad5791_state *st, u8 addr, u32 *val)
 	struct spi_transfer xfers[] = {
 		{
 			.tx_buf = &st->data[0].d8[1],
-			.bits_per_word = 8,
 			.len = 3,
 			.cs_change = 1,
 		}, {
 			.tx_buf = &st->data[1].d8[1],
 			.rx_buf = &st->data[2].d8[1],
-			.bits_per_word = 8,
 			.len = 3,
 		},
 	};

-- 
2.43.0

