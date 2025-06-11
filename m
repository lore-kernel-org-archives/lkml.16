Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776E25486E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681788; cv=none; b=eMKYSWvYErKokIKMhrv+u2Ux/J6NsjV8vFiebOl7vT/9nTBmlB65GneaU8XriLOC3RLKGYnm32DYXvrxNxwx9hw0+lrovSTMoK5cuAfhKkpb1LhO44LS5je8UR+Df5zE8xg8UfjvK7rVcLcl06idU9rCBnKT88Jtlw3HRVHSFRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681788; c=relaxed/simple;
	bh=UW7Bx8ZURpZRdKW8GhG9VQDYCD+6f2n+DIethjWGd1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czXkHBIKKr9ODrf52FkCTzzyFhC65wB/c/E4DK+VyW62lzR6SBj08kzE4vmTyQ3MMFOOG02QYiDD8kePqQa2Z10AsemN5r92EIKI1RoSKBBw6ltqUqWji/1hGuZw4g4GK+EdGHChMPnLp99/Ueqovn3CpIYHThxFRGFfwROxM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qeD/aIDU; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qeD/aIDU"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40791b6969bso189805b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681786; x=1750286586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bvfq/1PthJkt3QRBA4xnMMNhlIO3I3TLPySbwtnDOss=;
        b=qeD/aIDUBmXvPLCxwbtb9Xejrpw62py0kgsFRdjpFW1tuOEhRqgYPclxzwo502naFW
         8himGY7D9tHnZuRe6W2r1leZiQ6YdHBxbgXL97OnE1HFVTCj+9vY9ttHku6FPZxMTEoF
         qIiSOamzg4vf8D2JdZtjR5kJMr/k7ovYX7llewy7PdvJ6rKITeNV1GHhNRx48L4V/0WA
         tXtRgJaA6lucKYgrdocaMCy27jqeQr4uvVd11/RMJOS333mFpfKrTM22TEaeFW7gGpzC
         k0DaTeNBxiQAxm+JJyaD/hx15ZVo7IvOpV/aUjY9j3cnWsbH45ON3gzSlGCaN9EhD2ga
         gITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681786; x=1750286586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvfq/1PthJkt3QRBA4xnMMNhlIO3I3TLPySbwtnDOss=;
        b=ofI6srsVZ7XssgK11yGEkG4mDuQzeAzb/+vAs0n7NWuM7PvvjKuoqpP+ZB5zA/jMpP
         amZOu8xsnvCdLr42GVnFkUiaEsCcT1Hyjum4wc6XnePpfyBGsTtkNFtZTbe3/5UiRiGs
         wT9HacM8P97Wpsw7J9aSDXbLejF0D1tzDDYSxGbdKEICQo1Lpo0Ue/eRtpx9Jhj45mkY
         5q1wJOqr61JgZ9n5M/cCh2CwxktNe955T3M85Xqo/56FHzGk8vVEJ3yi8404Vr/BNmU1
         r9l5wkyzV9lTmssYVGadngJXgbDz4TGr8qWhCkVYIs4IGJaS/9XCngqABnU3P9jS4H8E
         RN9g==
X-Forwarded-Encrypted: i=1; AJvYcCUp5OlYFcTC4mDF7h2DQ2PkQpXhSiZFeCriH5NPgtcZjSTSvdzoJ30u99ngdekxV1oobp1dOQk2QLIm5IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSR3DosBBVETtdhG/jrRHS0o+5SU8Lv3HsNI6Zgw3bmCP/doQc
	EqDmrS+lH4odP3+3rSDqPlWJh59Wvu8EbFvyYEEbly+kmeJ9CabPQ2UPbNcz3Ua6Pxg=
X-Gm-Gg: ASbGncvNMk47Tmje+b8fVH4Ff1rgsYYg3ThHexKZQmfjQgBaMipX7MkMuelUIjgsf8T
	zc8EC53shDGH0QD49X6CaklBGAg1on+Fj7l3ujKRYcHgqgQYphzILYwrcUUbyaurYC+fCX3LKSl
	bqFPcT6td/K2uUXO5h6wiEkuG6dwXe0BFOw9z1QPWiAH6KGZCHDCugkts4e60PlCQmXkISKyf/p
	DbSMWme59F2mO9xcabXQWqAsr3bWYazjeyo1lvht8FH5iIiAUaNHY6nl2OWS0pOPiEf+6obxbHN
	g7Pu0/5UbKmpH01460iusLmI52zfuzymnAHgr3Ghq2TLPU+P6lyQNS67o0xdwm2GrDAe
X-Google-Smtp-Source: AGHT+IEzxA2Sz6qgNCiFhtXAvcRaONOijMvYTiFTuj8n/pknGpxJ7PSUYEWQmDmDDdoICgN5Se7ZKw==
X-Received: by 2002:a05:6808:3189:b0:403:31a4:f3fa with SMTP id 5614622812f47-40a66b562cbmr545614b6e.35.1749681786177;
        Wed, 11 Jun 2025 15:43:06 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:43:04 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:18 -0500
Subject: [PATCH 26/28] iio: pressure: zpa2326: use = { } instead of
 memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-26-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=UW7Bx8ZURpZRdKW8GhG9VQDYCD+6f2n+DIethjWGd1w=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDK82AxWczZcn9t22vxZreO96Ev3Hf1fuZXnZ25ICSzpP
 XO+89HZTkZjFgZGLgZZMUWWNxI35yXxNV+bcyNjBswgViaQKQxcnAIwkao77P/DT3lqzXe/zn1s
 h3e/z7q+bpFp7GeZuULWKl1hX6qm8k+l9c7Uus/9bWfDFaKXxB3Sf9bVp7PzdswS9ZB57fbd2bs
 9DN64lqm9C9hhL8usdXSC/UK1SIvH+gkLWi1jV5+9WXnOxz7DZAbPKa1ug4TndQ9vSd5b8HaCvL
 H71aO/c5o12+TDV7dUx03cXXby7LJjMXZGwZkZlrXvL894O2uN3Z2kraLbH5m+jZN5Zror4rxGk
 idH5xtfc5VfqxTF58pnWEt4TC9qus7BwvP5lZUuj4ugdWhJWFpJSs2GpkXrpm5k1W3Tt8+R3Bi2
 rjKXxaVg2sXJoUKyX2+y7S0LaN2e9Pslj3Dx05DQFe3SAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/zpa2326.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/zpa2326.c b/drivers/iio/pressure/zpa2326.c
index 1640aa3717eddc135dfac9d5e45d899ae2579f64..6eef37c0952d7c209478911413de2cf3d2552920 100644
--- a/drivers/iio/pressure/zpa2326.c
+++ b/drivers/iio/pressure/zpa2326.c
@@ -583,11 +583,9 @@ static int zpa2326_fill_sample_buffer(struct iio_dev               *indio_dev,
 		u32 pressure;
 		u16 temperature;
 		aligned_s64 timestamp;
-	}   sample;
+	} sample = { };
 	int err;
 
-	memset(&sample, 0, sizeof(sample));
-
 	if (test_bit(0, indio_dev->active_scan_mask)) {
 		/* Get current pressure from hardware FIFO. */
 		err = zpa2326_dequeue_pressure(indio_dev, &sample.pressure);

-- 
2.43.0

