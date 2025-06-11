Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C325D1E4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681765; cv=none; b=dOyvPzHg2+f6J42xAW3x03gM8Mw/v14FNT2z2TWGXYz0HdDwBlSduKlkNDrsmWGXCnyqxrcpwldLdLNu8xWSh1RjLhW0VubyAT19to8mwnKZiWRC9iagwqvTkDc5/q5WcmX/rndHqCfhHwf9BKtPloCBAX+Y/xXxb1I8WkTIncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681765; c=relaxed/simple;
	bh=5XDESMLoIhQpWzCEq2C2tgUyVZF/Bo3//3/twALhLps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/HDJL02M5sBqC0ilLzDzxmwdL6SSjENZ130hrwgJGvUHKVjvcG29XNTkMLbJD1b3eHMUyqaHufiCb+5T48+1tXyobzfwTFdOuOtyt2AcikVXP8oYOdYwPtsJA/tFj3TSozPZmr3dNAhn5xVdp/qHbTVNk79Wmb9nJxNEnj5Wpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Yce5wZl8; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Yce5wZl8"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-407a6c6a6d4so131106b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681763; x=1750286563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grWWpqkFx3VZeZHS3cu1IgF+mji/0suRYvkUNQaAo2M=;
        b=Yce5wZl8NcnZGnXze45VBERPr+GdgfJgXDu7W9+7O4mlSOhmYWuxbahAMR1pItW4i8
         9+yHbhjovbPzZHhuOlYaQci78vz8qG6/bDxUmFWNFpgcAullMt8hGbJn1vnel76/k1B/
         1nNrDk8c21rGaY/YeBedGXngZhsNqD3vhYUrfLjm/INZ6smdulVAGnuxzCAOi6iPpOd/
         H2pld/c6Qflx/mTKkqVbKU7KfrHikYVhnIKBF8dbyziI8LW1fTNwO6mCF1KQl2K0HUme
         QhobR4Eo1OvYEshoAar2aHkp8sxl4z93Ve3DKmHQAd1ViyJW2xBU1P4rWbpL4Gv3yevh
         xbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681763; x=1750286563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grWWpqkFx3VZeZHS3cu1IgF+mji/0suRYvkUNQaAo2M=;
        b=uGBvRdoEBzrgzImBGCI1XMHtdH1nAPvrzAfpRAivtIcDoWRatXQKFHM7rsRJOgwQcs
         AWkk4NAaXubVtqbet7S15O6ZmCupcbSjYGLLnx4LMw37XQyFe0Jtd5Fmf+MJo0mPpIFg
         fjbQONOUerDiu/e826xlC7Z6GPFo4kXs0QqSg5Vib3zotCCeDEc49Sid9s+PehJHUh/v
         nTq0nT9YfSBE5ld01xep242C52wrHfIp2RuDHUYLVVDGIAxGlz+0lb/fEiUK2zEo4/NF
         ZGbbAPK1oI3e8krqQ0ziaKvwqqjwpfOnJHsnLXDMzVRjS6b1tnTAP0PbfA5g2FQOogTT
         Tiuw==
X-Forwarded-Encrypted: i=1; AJvYcCUMLsSKaanet8bYEETWkTJFbBKehejhfkRqGBWmDpH4sPXqu243kLSPlfc4ofuQFGFLnBgTjrdA5Qu7Yu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3POCXfI4Nd8AMmbd5TUNhSemZ7DSX/Gqt9B1hHb4V8CCWS38c
	T+d4rG3KhD2zl3anKZ8ebRvvNrrWZc3oN/GY7CmmalHLiWZV4tHvLrp1oOe9wPf0F+Q=
X-Gm-Gg: ASbGncsPDlkMFMnYy2LxHuio7RshyiSygzPejFqamcv1UU43aL17YKHOGBaGjOiGdEV
	R3jUsn6VQQXhaVY2YB/L0S4AQ12xnDxNbDvjAS8A32GCSs2MZJrHfT4pzFka7DhtrX1hf2gOytM
	rEF2+uWDN2p1FpsVHLDADpW3Fulr4nMTq77sEc4v7C+mT6SzKwxJTVebuOHTdZH9hnVChM/NQ8s
	epHklsHd/wronyeczFPkTTUgKN6opIMtKB/PWpS+X6lrwsZNC/mchcwZNTHdRc040lCy6VdZm0z
	fBZz71ahsz7L4mktpXrFYaa8qSWDhimwfwgV37APEot8vsr1M2H9W8LgbLXpNIPBS5QFftM6Ey5
	7X80=
X-Google-Smtp-Source: AGHT+IEcwqu4j736p3LcoP9RK7c1t3h3vtLigrmQmQXvolB9PCLNg9UOQOYCbdmCSMZJHTC5173d2A==
X-Received: by 2002:a05:6808:178d:b0:409:f8e:72a4 with SMTP id 5614622812f47-40a5d05e776mr3722453b6e.2.1749681762900;
        Wed, 11 Jun 2025 15:42:42 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:05 -0500
Subject: [PATCH 13/28] iio: chemical: scd30: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-13-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=5XDESMLoIhQpWzCEq2C2tgUyVZF/Bo3//3/twALhLps=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXZRwKjwWR/y52G6u0y4MdHz3+z3OU7EB2di
 1dhrLGz2YmJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF2QAKCRDCzCAB/wGP
 wMtsCACJ/xWk2LPxNgDVgxzxAyBLwPF0PwZ+uQ2OnVZ/GKv4J2FuZDLTEK8T1XbSMOtLfNe3Emp
 g1WSmomvx01TlhG5cJCNgELnTbtZDAKvzuZ3aJ0YaAlab0axLhbvOxxqK5KcfI7G1vuzwrVwjRD
 txipOkAWnZ1mGS1U0hXSv4oYKB16S5Z56mkqqgOjtzjZEb1+YGybjl73FD3eN1K5SYYrp2Z6aqV
 glfuOs3MYd4xbj9SpdPMC+zKvBKyjga031caed8DL3D7MvrboWa/CoWmmIAJfMRFoeO2+yr84yT
 zqstaruPKxBUMHnLEBtRUeoXXFrx6mJM3kA7FDJl/xC7bJkC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/scd30_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
index 8316720b1fa32b9746b4aeefe7aedc77b3ba57e6..5df1926cd5d985a60c7095f692a63093d522d434 100644
--- a/drivers/iio/chemical/scd30_core.c
+++ b/drivers/iio/chemical/scd30_core.c
@@ -587,7 +587,7 @@ static irqreturn_t scd30_trigger_handler(int irq, void *p)
 	struct {
 		int data[SCD30_MEAS_COUNT];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	int ret;
 
 	mutex_lock(&state->lock);
@@ -595,7 +595,6 @@ static irqreturn_t scd30_trigger_handler(int irq, void *p)
 		ret = scd30_read_poll(state);
 	else
 		ret = scd30_read_meas(state);
-	memset(&scan, 0, sizeof(scan));
 	memcpy(scan.data, state->meas, sizeof(state->meas));
 	mutex_unlock(&state->lock);
 	if (ret)

-- 
2.43.0

