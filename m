Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEDA24679B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677633; cv=none; b=CgskKT75hRdguSPAyJguiiOPH8nfwVrZYPSXBf3B4qcWVgATV4IcxSv7s67OoH0743BhNd5bFTtaBOPMtiZjOkQ/SdBmYdME81eKakRKglJu3AK2T4RZKoOTrHdPlrkZR1UlcsN3P7NWu4qeYfA5d6yu5TKWcjIHNZHYyP4FV/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677633; c=relaxed/simple;
	bh=LlWi7e9nfRBdZldq8Xrczi7rWR0APRpPRo7NBynoOIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eI/E077k02rUPULHnkNx9t1fTg4XQwgEvYKIav/EoBZUzt3P8w+tlO5WyQXOAJHygKDwHTXteEuXt9DGTUmzOY2n+gMuPkczl3rsLUEsQCAHsNTAraV4mgW34i6NDRjJFnwRwzZsQrtn7/5SKWxCNT3gshDikaq1Kg4Jwm//rN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DCjWpjJi; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DCjWpjJi"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-408d7e2ad03so188232b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749677631; x=1750282431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4SaXSyEnDBgBJat/vCjlAxTbS9Xx4wchBNLXn8gtEQ=;
        b=DCjWpjJia/yjAe+sOB/UyMTZrT6vczMvTqoXb52DkGNqNX+WOciA078zvXCT5eYkHQ
         aLFbQEFMgkaibkbUPpitYVEIiqErSyfAgRaLMbagTPxiPENWAxfv7YnlXBhx+KhDiYKA
         hQoKJH/IUXTh88kXEulj4uxKA69PsraFHdZ47xZtswAGZP4N0KPlEA/gBzfzmN9+7oiN
         HJBcv1rTEGNl18CC/sEZSbNgx6HJjiUDiMrMYqH3mSq8UGCHA2BlhVa3ezFbxD19499q
         iym2DVXPhxDg33MfndvYEdQ0MoETnVwfztywqEqF1NdInfDusHOoxqfZxAgvo/OSBQJY
         aFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677631; x=1750282431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4SaXSyEnDBgBJat/vCjlAxTbS9Xx4wchBNLXn8gtEQ=;
        b=aZYKPnD4J76EftBkcCEYB+DqdD5LYp8WbEl6Fqfv/Pil/Aljb5cv1gLdDqJMWsRgd/
         efJDPXxBXMVnWxE2rvR1W0JeM5Dh1kOBpj3iwH8rM8XZTe465O1BX7LShrXJ22DvLiyW
         7ioAG5mrcpMhTYUC9MFgc043ZWTujCGrYcHMpztyTGluVesK9KJOngMRuqNtgkI+tQp5
         MITPXI62AB6AZ0ZOEuurlIg2FwHFM5gL43F1VcIx3jEFBEKoyCF+/OmpgSgGJtou5JSg
         XYEskJwBhHtT69MlS7A2MM25oG3v1vwMQQgTpyAPVuBeXOVuLMVurw2dUwit5sXYgWdP
         Jt+w==
X-Forwarded-Encrypted: i=1; AJvYcCWbgc5RHbftyvLBDjkjkC7lHCcjoRzB6qXjK8hFz1FxilVo9R2gNAHhGjJK/rbmMh9xzD6Nb3fVVctPlos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzft28GMuGuDDDtvt+rrXXjBrRrxWhDuIWfLz65UEh/NEGtnuJA
	O0dVFyMLV+jXEwGpb9vTD6i9ZazDACUQxciw4GMUME8eqOSp8ut3UDiIfVRn/TKxoqg=
X-Gm-Gg: ASbGncuhQUqwvXGj8D5gd39sy2RJzb2Y7GwWruFieCBBhUNHDKGGNFQ0WoNcafVt4RG
	k2AjgrHUyxYTjtLXJnVDrHiuo75PBHeWldi8TDn2Hs8tPfVq0cebOjWce3lRHjE8qI3/eLuLtee
	zOKTUB7tntIjAEz55NwD7zDo5RxqcV8BLY4vTjGZa6/adc91rv3C0fr1z8AScQNrHXGlOMyB5tN
	BR0k3mMO1cQBEDQWsfAxPnOENfSuJLHsk49vlXucJ4D9Eyqa1d/8nI9SQpU2fI0c+JsMyRcSow2
	rTjPnzoCGPUsCJaK7FBLtuhrKpVwbYnBRMdNSFBBY+9bIuVfp6rGg47B2mbFmFVN4m7BC4PeNNn
	LpHE=
X-Google-Smtp-Source: AGHT+IEinQKOQJo+bthrujO46CMI/J1E68B/eqmJGPvBJm1AVFdFm9iBX53E523/hJ1j1GrhDFz2jQ==
X-Received: by 2002:a05:6808:3190:b0:404:1898:c82 with SMTP id 5614622812f47-40a660a144dmr869806b6e.32.1749677630714;
        Wed, 11 Jun 2025 14:33:50 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fb0bdsm2262b6e.23.2025.06.11.14.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 14:33:50 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 16:33:04 -0500
Subject: [PATCH v3 4/5] iio: amplifiers: ada4250: move offset_uv in struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-4-bf85ddea79f2@baylibre.com>
References: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
In-Reply-To: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=LlWi7e9nfRBdZldq8Xrczi7rWR0APRpPRo7NBynoOIM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSfYpEfFW7bxJ7cb0xHYFKY86SyYWWpIEWzPc+
 2wFe2i12x6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEn2KQAKCRDCzCAB/wGP
 wMZSB/9SYHpDxEcALA6ygZ6HAblzs7li7WWy2wEqtsjhSHzE5BqETXVQmyuHfqZqN/uxsnpYGQH
 xyLwxxT3wq1+a8PUn442ON1x4iRSGj8RPycUBF06CsRf7yU0Ipm5fvicC2pOLsL1C/wyj1tSdq6
 daNjsLbxatI6LfvIEN7Xmo4mCyu2f8fu2LfYNM8yBKh11PUUbVppywpcZxkBiQXXw/qFyX8d7eZ
 JRWmY5l++mFCSy5U9eNNEI8t2/zSltkgF2gdFgX8ukjnQQRfTpse8EsUQxHbTGwGg/GHEzW3HiE
 Fksx2xtB2iONCEfs+lMfXv0dFniVASBAQKBbLDeKR0rHZS4L
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Move offset_uv in struct ada4250_state. This keeps things logically
grouped and reduces holes in the struct.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/amplifiers/ada4250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/amplifiers/ada4250.c b/drivers/iio/amplifiers/ada4250.c
index c367c53a075b26327a221e0c3a9dc8e788891f32..d20ca410c506226fce7f172632d46b2ebb140a12 100644
--- a/drivers/iio/amplifiers/ada4250.c
+++ b/drivers/iio/amplifiers/ada4250.c
@@ -59,9 +59,9 @@ struct ada4250_state {
 	/* Protect against concurrent accesses to the device and data content */
 	struct mutex		lock;
 	int			avdd_uv;
+	int			offset_uv;
 	u8			bias;
 	u8			gain;
-	int			offset_uv;
 	bool			refbuf_en;
 	__le16			reg_val_16 __aligned(IIO_DMA_MINALIGN);
 };

-- 
2.43.0

