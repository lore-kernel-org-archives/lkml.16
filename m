Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2613F279331
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472958; cv=none; b=qDuiQfZhK0ZPtWf278A4LqytxxMt386eDjOte25JLbMO+oLeiRWXR8HiSTq6/GycfmcABjxmqF6RK+KGXh072KFK8i1reshFvOzuBKozXvTt2wnlrGyhuft8a3YOsJFIejS8wGwQgD0fujnDuJ/M13VW9IX/Z5NMzcJfx3M4Eu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472958; c=relaxed/simple;
	bh=NifuiFBYnO9C7bcQk5fXpH5uYus0GOBkVLXmApCzRrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lv8xz+oROEBi1SVLZoZXQTNuuKBe4iye79QeoHqjfpc5elP8sFc2Lw9NSkb/uQY8j4TeQ8l4X/YExi87SzfkbYQRCSaBvbb6O+/UU5zdOrlwngMlwiJnZhdX9NFaM8ztXnIBjdjoLqo5ZK1z8VUYjnIVeTaOidIvhUD1viw/jng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sneLxYQY; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sneLxYQY"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4033c70577fso2323431b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472956; x=1747077756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ln2YlhyAJDzCScLdY44Kp1OUXAd8+b/Q8d217GGzRvk=;
        b=sneLxYQYPp+tVWrujHC40a90kdzbWLXRh5BbOf6fUEvO137T6sff62/s3C9lpwU7VH
         r1IGOQlmcjOqL/TcCg1rotM93H/GOu3lABZ+WzyuQPsvqTNv6ophJ6FGrRo6NC+ancY+
         R/I+9a5WhCKnPLd55UQBwWj8/m1nKIPrQTBla6oAG/tW12hu8PAN7fUAcA63zGsTicvB
         gnziQyFK5GXHgeDxRR/N263DSpSryFVxzNdOpO6oMgSAnZOENwMPFNQW4n9bJ7NQLSRL
         LTTxR6ss5bJkCsn11dAPxTMc4xEAXWXYoCMp3qdLUVjfTkIMoPp4gf/wJbtdhutXwwov
         IO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472956; x=1747077756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln2YlhyAJDzCScLdY44Kp1OUXAd8+b/Q8d217GGzRvk=;
        b=mPQm5DnC+UinqVG7KsblyHZUeGOfE3I74ImNQxzyvUG9rKZaiMMUbI4mbyw4nwatjS
         Kh0NMCX7mkHEBrO3e2+oYnpCvGVXl2Hz+0HTY/DlpJ46b0uteVTlPNUs/4iqBA0IawfC
         HK437MsgSRRVTtbNIvNRTeeY5dvmEHs5fbnBlq3YOd3ZckiPcOkSXJ5adDn4pWyhK7N3
         Qi8KuevNgeBu5GmDHtsEMLauZNUAMzLlMau3TYECc3qSOcYA9tVu+polfB5tRIeEpy76
         E5v6TF8Ddb/UETMKh/3SNU7KGkDxPNQIYSlvPaP1VOjNlV4OrzORhTx1rRFGWlThQx61
         BIKw==
X-Forwarded-Encrypted: i=1; AJvYcCXuIagop+K0DpkuxZMeJebgGOssmDyGtvGbnB46uUY6jtGq/ejK/prrpBXlzBhYkLxhgoyzv2Gw7FHFsqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0LrokU1wh8nQZuCzsPF29ans0QB2kfyvH0W2HqH+K3YNTzWAU
	8IdbEiDtquof1Oou4FmQs0qfXpkM98KuB4gkx1AeTs2nOskYmXqRmPHHrjGl8Uw=
X-Gm-Gg: ASbGncv/nydaqakRntWaVlMmSzv0WPQqA7DPM0WBKzZ5MGpLP4qZ2R+phmZJhiBf0gx
	JXBYwu4mo19bk99r3Tqnz/IuM8bLeE1b5NPzCBivraHm3AEHnvdDZLV9BpaQRBJS+x9jRKFYhjA
	FG9UlbqTYl0joPvT1NO63fhS0ZipDBXTlb0F46w59QE1XrykU64wJu4PFRFopihpmfZulh+dKn2
	gEU8e0jq14E4B5cWOIt7LBKRb0oJA/K4YJseb8JVMpvLttP1VOB6+4RPT3wGkTG2WQiOE6kAffm
	e+b6pVMJt8uJOCyz0tElQablD61xwax14DTss3hu2S0S3Q==
X-Google-Smtp-Source: AGHT+IEQMfPYy+tuFGwlo/O+o+nqjJ2b4LWXrA9zI7XiFYKnZNeDV7t5ydAlhHJeUCWzuEfdSZdYJQ==
X-Received: by 2002:a05:6808:1449:b0:3f6:8fa2:1c6f with SMTP id 5614622812f47-4035a564247mr5362610b6e.10.1746472956284;
        Mon, 05 May 2025 12:22:36 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:35 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:40 -0500
Subject: [PATCH 13/14] iio: pressure: ms5611_spi: remove bits_per_word = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-13-341f85fcfe11@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NifuiFBYnO9C7bcQk5fXpH5uYus0GOBkVLXmApCzRrQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ/gD+ie7hcDovNbowAlrihnSUYKWeZ76XIYQ
 E9EzCA22XaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkP4AAKCRDCzCAB/wGP
 wAMlB/43BtX6yw7eB4KMKpPVCEKBGMMzg3lJVE9WltghJVohieIAGaQAtRK/vwWGYqtAHS1usot
 1Lyd7MwnIviuDh5g7zv84eWtgBBj3svsIizwiuZcAAI3V5jg97lOpxiJ8OQFdwjXXnPuITOfR20
 z4MLXQ6NxFPkvlr7qI/+o8/qZ5dVl3fI4u4NNR+IuLJCBhytzHk5Qg1LgUbAR3O98sCYJhoVXcL
 1ouSan/KPdsCNm8qTQBY+MjSJhEdAOrfnXGGUZ37sGYa3pjshtUrpdPJfMeJdWA0cZJovt/oRpB
 doffH1D7+LOVR8IZ1H4rlXVrucarrrwL07I7V9gsl8uVNHog
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the ms5611 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/ms5611_spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/pressure/ms5611_spi.c b/drivers/iio/pressure/ms5611_spi.c
index b5a91e885793543bcd2e8f231a21ba91b8eac6c4..25c7bd2d8fdfd56a425a7cf3a82885962c097b7c 100644
--- a/drivers/iio/pressure/ms5611_spi.c
+++ b/drivers/iio/pressure/ms5611_spi.c
@@ -92,7 +92,6 @@ static int ms5611_spi_probe(struct spi_device *spi)
 
 	spi->mode = SPI_MODE_0;
 	spi->max_speed_hz = min(spi->max_speed_hz, 20000000U);
-	spi->bits_per_word = 8;
 	ret = spi_setup(spi);
 	if (ret < 0)
 		return ret;

-- 
2.43.0

