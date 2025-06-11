Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23E24DD1E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681743; cv=none; b=HuYevohFS08Fx3T5AKf5LlvHgNQosw0mGYtuRIHlW3jMFlWFlFkTq9wqv+BmCI8ab0m0Ff2oiphOarKL2WKQ/+yrgT9+FREg4Nj23pvjlP0wE/SIdCuJhV8rfTRyUeDM4wjJMPJVcpSDcxXRwG2mC3EfPLU3jxj4U2qj4Jn7KI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681743; c=relaxed/simple;
	bh=odIkwKy7IqDnChDxGqAGKTlpXL7zVUclleEfAo7/6gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPzOZVG32GhkG/33Br6gHY1DY7CU9cK7+5VX+ny0q6D/npav+a0v/7Ku6UfqtP2g+I94AYCgDcGYwqwFNsr7XY7bf0SC9b314065OvaymYf80kfgFm7///vQKeuqed6dgrH1G/MapuIW7uNeDIGRZ7bR+C4ezhxAJXB9SHPEWeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YTGkgriv; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YTGkgriv"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-730580b0de8so756886a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681738; x=1750286538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KWzRpEXlRaOQy2XtO3D8TKl0onTqF9JeInDK4cRjLg=;
        b=YTGkgrivHA++lCY/3R9YU3ov/+7w7QcUku9gj4dN7Pf3wOeTfLyzwoVmQIHw0lf2GN
         wS8MXlZA1domjmYYriZ/qXfnjS2a0L63DrpxwadbnHdlefrnhQ6s/KZOq7+aY7T7imq5
         sVFO0ETp55yO1GJHj/HU3M6xnAnid7btvVdOPbfV9buc+ChNmf8R42vWZsryHUihGwo/
         PHbM7Q3iE8XATKd7XCaHDJuhZoNCEkUp9YObpV4vXsJLHy0FTEvv2p6FczQAolgi8tq8
         r0bCOzno27AiYjbaNj6eqVLqH/l4lQp4ClZ8JrfZN/L9mC2TFZudsnxN/nHOUc8p926q
         929w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681738; x=1750286538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KWzRpEXlRaOQy2XtO3D8TKl0onTqF9JeInDK4cRjLg=;
        b=mXDV9nSlp4cc28iTGMGI6YVpgooqpYidU/8SsiAJ7jM/KUuDsaN6W/FxScvZSGmV0P
         gw9GlJHDOPNNwXaohJsNZhPbXbnvK15ruSkC2eOMF0I6m5Q02ijYeNg+gD8aw6ZH+HHf
         KsOwATOa42tnYZ5QQE1X1o/PVJrjzVEJhht1gz3Mai8+7eSzj+Q+KM93VM2obmphMLFz
         Uc5OM6+jL7wnpdnqtw7Q47XtnpwQzFMIfZMnbqX9yHl6ALlzH4J5ZL2zb3d3lzvvOO9L
         JCQHmipHCEl4n7sb7Hp5gU/++PM2+cK6F2YrO71qR1vbOwOKnAmXiKm/T8PBYx+fPR0I
         jfsg==
X-Forwarded-Encrypted: i=1; AJvYcCXAbTOedthLYwk8R5lgyQUgdBVz/h5UAvsRIksE3ewZMiAyXUYDF2cehyUwWLq+oyyzj9U7Bzn9FPXI4iw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy6hGCevh/OoOY6Uht3MA+8fM2raw4knKFsmObacjUA3WGlQnJ
	IcsCk2fuU0PuNBjnvdLbBhD5OrveFyZg0X948da6V007iZPP9OpZjjlwOMpIERB+XpQ=
X-Gm-Gg: ASbGncuO3+EP/LpzGTQUEHmQFldABGFR+KFaOsmnvQcnOgsHgtUj9tivYnWaPa9Woom
	7D7WzHAA46KD5MQZTdqwTOplKo+Q8D4vT1b+zgZVmc7n1PKilLndavwy18Mcl1ooGNzoKKmIAPq
	X9/TE6M2Jy6BDrRujZhrqb9o+7Ny+UTRXt+CvgJA5xgLQ4jUDaUPM1NLrChGIm3fo2NjeNh6cOT
	6ps9IhEanpbxQcEus04WXnHHDHnODCo+vF6W2QFrLmnkFwHR0viEZJp3A5QzQMFfXXG7wfyLSql
	REsgTseA/KwqvB23qGJXm1p2bOpBr7/3GQNPK4Wh7wcTbhjtunuJXSO77zFtj41RCwS6
X-Google-Smtp-Source: AGHT+IGUaZZsecRpS6ezZKLm+idnU2IVxpLfqAg4YSBuYkt3FpO3sNHyKbW5ao3Kw3MTkHa7seuNaQ==
X-Received: by 2002:a05:6808:23d2:b0:403:304:6b06 with SMTP id 5614622812f47-40a66015927mr932627b6e.10.1749681738571;
        Wed, 11 Jun 2025 15:42:18 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:18 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:54 -0500
Subject: [PATCH 02/28] iio: accel: msa311: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-2-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=731; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=odIkwKy7IqDnChDxGqAGKTlpXL7zVUclleEfAo7/6gA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWQWkEr5QWjTPvfNMocah7h8+meXXS5pWdsy
 5sDAkLdoOOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFkAAKCRDCzCAB/wGP
 wOi+B/sEIoa3eIWCvSKlVpRK8xGkIEyYTFb6Nq8IlqoeBNY05GGcL2a5hP1Gn/kmb+2MO6PapeI
 dB2wl0+dESiOgkcl+SenqcxbQRRAhbRbVRd1/Cqac8psYYmmgKDSdLHesmbAPsWPhWccCox/lvU
 N0jdZERcu8kxa9AJs3z5gfb7AoKrRAZR/Q31HaF9jMQZk9xrzgW6H7/w05EWYudtxJPdpOaPv9W
 5N4ONT005xNjYaL/6LuZKHCE9D7n0gCZPQTTr2LcZXOKPofYkVVrg6LAuac/UpQH45sM5Bykm/R
 cW7aI66fWEN0bBxgJ8Jh9VbYLcpVDvd8K/aZLgpoffJ0rwGm
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/msa311.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
index c31c53abc3d09f29d01efb7cfd31955cd88b9409..3e10225410e89a341411a75e544a890f45c8f55e 100644
--- a/drivers/iio/accel/msa311.c
+++ b/drivers/iio/accel/msa311.c
@@ -897,9 +897,7 @@ static irqreturn_t msa311_buffer_thread(int irq, void *p)
 	struct {
 		__le16 channels[MSA311_SI_Z + 1];
 		aligned_s64 ts;
-	} buf;
-
-	memset(&buf, 0, sizeof(buf));
+	} buf = { };
 
 	mutex_lock(&msa311->lock);
 

-- 
2.43.0

