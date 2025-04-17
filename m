Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2102550C1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908821; cv=none; b=rF1+wycqCFYpKmb/b4R0LBjW0YdqmB+f3LuWL3mTO3FMZ2goSqi00H6qbescb4xx68pDqE/uEFH3BkKa08ybwu5yunqpDHkJYqZKZUTKpZV2efcFOHJ0fp854uHHD2apm0abvWn0XS4IxvasAXxiFVCH3DPMHM+ogLcMqpzfHIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908821; c=relaxed/simple;
	bh=WBd+USN8oBva7x6dTXqEXzGbksHW+JPbiqt083CEvM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Thn6wnyJ8mRiiiWBX9RD3cu5jPny1w/Mtr2HmhNPVUC545DpcWold0EIhkmYuKF/SbwZ3PLhGp1VJZvCNn/im4AU6ZLWynseEuSxZGbogU9p+2ZSPx59hmt5ZkR7XhhK36sXdYaaF6+slPKo0Pw8jC/IasHkXERgm6vy7MDdH60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U2iutLGm; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U2iutLGm"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c759bf1b2eso439043fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908819; x=1745513619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nu4943dg2Pk+bcmuLvvHqjkr3/0Uk0VMgvuphC7zY3o=;
        b=U2iutLGmQCOuxzFgUWNHQ93S20xcmTlg8qqdfujAqR30EYG1dbUcBLKQ3sAuexkDey
         FoK57/wTfZ6iF8T0XkSXsqN/GKfdNMlRf59GvkiMm6mI3Vwa3Jx7ehvoWwsS9pRZjKWe
         PbgFLFjvGRV5xvjuxAYfMTtzJ6t9qJ2AAJnOYYfkZyfHjDWJKCPZ25UEY0zlcmLg0WgA
         iHlniahZjWYog9CWDAX6Tq6mSkIVXe3f3QwDrGN9VmvD5+otDpVdTfNzuGdlFb0h6/y0
         yrDH/s9Xtrm8ztfoir50JMmUWtXjuqH7wqH2oXvc30QugDvFLfE4rgcJ643HS4K6q52l
         k9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908819; x=1745513619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nu4943dg2Pk+bcmuLvvHqjkr3/0Uk0VMgvuphC7zY3o=;
        b=Y4440q/8KegVxswT1w9oPn9VBVUOo6hXZVgBRbR8yZygU0W9EWGUZbGbLGrK1degGo
         /omk4UFAVsU0Lacd9BjeVEoR0MoUva6XiOOXEB5UjFTVDEQ08U+lJrYn6eOaCNtsRvyP
         /MVSVJu258yOjztT6O3Lx4ONHLPnvU6fBEmoL3PpH4YIA4PW7wYEnwlobx10vwV/tvGP
         AzMaVn6kcKuUS2rSVSl6CRh5f+lx//04I8p+U5N4oM3FgCV0J7Yvrt7rLZ1rABLfJp+x
         3klW723JP0JkFneXXCRwG++jtuxsHZDYtd6NBp6Db4omQspeDD1W0Yks1WTR9bash6ZL
         vQTA==
X-Forwarded-Encrypted: i=1; AJvYcCX4U0h0puzU1C3iw1y9dacnxLS0Ul7HYX9A2nYdLgmuYsGv7tfpXche3f110HpM2CCR8jTogFSGIp91ALY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0nvwRexQaDtVw0XrxDmpG/z6EtjtLtsj9Rcsqi1obdeTXtv0
	URjwMBMUSSpxuP+hwygNwSHpDcIXnmYvAbgWsik3K6RY3/E2ZfWvsh8IfibAz/A=
X-Gm-Gg: ASbGncsWv90EJegeHaczikfH+4cThuaPFQPeBqO36CDvbwq6unW1PyenwFc9IhSDcWZ
	r8y3nEdxrjGNmXxkbGr36yj17pfaQofH71Ffpo+q0LMiBCIStDUrRvj+s6vqd6hjZxFxbpqDW1Q
	6uxgHmetC82NaUi1f5tq0T9+ERVgy7PNb9VQ/JToLiiwoQTxAvBX2SaS6JnHZn4FdBJhkZ+r/S3
	1DlwWOdeULFrU60OY6E8Eu3LTuaGecrAglLH3dhijI81bv6OC7iQVAXhP1sVWzWcl0RaMfWKCmd
	Av9z6dGmR+Zx5Nc193eOEqmCfbZpL5Of/A9dbIWmVypKMCOS4pY3YS4kPA==
X-Google-Smtp-Source: AGHT+IGwEsmY3NyPkCPBCO1td4MKsKQCaHFkR6HGlUIvu5S2DBjcqDrjeSVGpeTxzrXMhy/9DDR21Q==
X-Received: by 2002:a05:6871:d80a:b0:2c2:d2b8:e179 with SMTP id 586e51a60fabf-2d4d29cc3f6mr4240604fac.4.1744908819277;
        Thu, 17 Apr 2025 09:53:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:37 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:34 -0500
Subject: [PATCH 2/8] iio: adc: mt6360-adc: use aligned_s64 for timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-2-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=WBd+USN8oBva7x6dTXqEXzGbksHW+JPbiqt083CEvM0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATHgh/KpCPdMfDSZdZwO0twpeUH8w6Bp6mw27
 yM9Paqb04yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx4AAKCRDCzCAB/wGP
 wOBfB/4sAtaobNgfH0comXMtYx8J/ZbqnniJM6PBSi81wigpWaU6BQwSLvZ9apGiXVtqYlbncIG
 y7Ip5Rezb3ea9YAeAHCbFjFHPww3jTaKbl9Pglw6HYss+9lIZkjHa9fsAJCb9nlDlWauj1gjBlR
 uhE5aqLGU/KisOj4QWs8TV+EM+/MeutNaGWGrALoVUjG7PvXK525ug7W+N8E7P3cXksK/572yv3
 RJp516+TKyALXADXXpnorGRvP+y5e9QW7JTQTB8gGxopm5ZxtGWVTHDvqosipIbiNH2hXzF+URT
 TkDamo8F67AwrSBmKUadZJxl9wyzUrN4SQJQRHAZV+Pp4mU6
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure that the timestamp is correctly aligned on
all architectures. It also ensures that the struct itself it also 8-byte
aligned so we can drop the explicit __aligned(8) attribute.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/mt6360-adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
index 4eb2455d6ffacb8f09a404df4490b5a11e49660d..f8e98b6fa7e923c6b73bedf9ca1c466e7a9c3c47 100644
--- a/drivers/iio/adc/mt6360-adc.c
+++ b/drivers/iio/adc/mt6360-adc.c
@@ -263,8 +263,8 @@ static irqreturn_t mt6360_adc_trigger_handler(int irq, void *p)
 	struct mt6360_adc_data *mad = iio_priv(indio_dev);
 	struct {
 		u16 values[MT6360_CHAN_MAX];
-		int64_t timestamp;
-	} data __aligned(8);
+		aligned_s64 timestamp;
+	} data;
 	int i = 0, bit, val, ret;
 
 	memset(&data, 0, sizeof(data));

-- 
2.43.0

