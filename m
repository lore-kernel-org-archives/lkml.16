Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAC61F8EF6
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253892; cv=none; b=Q5MqU+iOKJnSW6da7WvNs8iH3nZY9lVhG5K6toHLjtxwXq06cd0Q/73KkwwAuQG+FuSGEtK7/qEuoOLnHIMLG+gXGViuYmU3bbXQemxvFvnW43QQ8OWCjR30tLapBTWgxFy6G2iYS9gUqtQIiDqY8sSTdXrPrDut+s56fv9hxxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253892; c=relaxed/simple;
	bh=G/PHL2H0hCT1vJawFGnuZDviCmco7m1K7dYprLhxJYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUyCOLCi9e+e1XLNvyhMfC7MRrqEE3fViApXWx5Q26cnUp1v6YEaaOdOL/wBE28zReE4bvOXVxVAOsDzqi8g6zWUgmf/vF9sAUdn8xkA0YdQPSj5jnMWNalCOhMu91P53yuLzt3eJ20ohozzCcu/RdMttGzkOLs1xe99ACWYQmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KXB3e99F; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KXB3e99F"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso15735825e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748253889; x=1748858689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1cI5SBD7MAWLfTRQEXjlnF27Z0y/aSH849T67R+rYk=;
        b=KXB3e99FGF1qMzkt23oiJUXYA9k/OwdBog+tgP4k63Mm9jf9x+DQmezeCPJB5IIx2D
         dYDko93fSKXfDkEICWt3pO3237OJVfYiJpWAUPMm4me/TwQXJFMCYtI+7rnspJaVMu1G
         74hiwfX2Hjfo/7YCEovhRZ/tVajMH/JGiSm0b1B+BlORdj6GQg+Qbh7xB7ydc/W6J7mW
         WmG9suiIotiSPS4fh2GVyLmw5yiugKBErexR7FrW1eAHBaxUC1V7FnCpWVjLlqUvGCoY
         w0kj3bcY6YJbVC4l5xLZvkabSwCoue6npnDLaKLMZr7GL2igZbEyz1NXYD5SDHLdslgg
         duow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253889; x=1748858689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1cI5SBD7MAWLfTRQEXjlnF27Z0y/aSH849T67R+rYk=;
        b=E+0Fo/xVx4V6xb5TJXj9fPeC6e1BUl24IfRjt1w5LSrONUVobKeKrdqXG0741j4/6f
         E7O+qJ0TCkkNzzX54ANwtpB4LCYJ7FDUMi06tigB6fKJZolBbCdfEpV6VU+8NpVUqGYj
         lArKI6bOiAf83qfgh8V9HPwznqzNSUdkkkszb2S+uOGZ5Z02l6YZoA8Cj+ca/uMxo3rO
         HrquuXuWPHuqagFfSPwknyGoZU0wO3OrywNoDTVJr9MVpF33SkpmxUuMD17wYEG1r8Aq
         07EVckS0F13XChHU7YPVTEsPnUCfuvM0Ombm3lOqqWzE6n8TNjrhEpUO5GDsQpkLgiDG
         3B0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSpc4Z7oIWZrP0UtsIV0eV2iLTimGqiOdt96IymbSb1Vax4CYkNVUnFc6ah/N6Rb7s9F7AULGLMXwDW4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9DqELnOZta7q9Zly8qKx1kEv2W0u2Dcc7IXH4ayyZte70Daz
	ikQ9ETpFzF2Uavbs9IeXbouR+pBaOGEQ0lvcvvkHUR9pmE9wE2rPAvM5t38EN5Syq9Q=
X-Gm-Gg: ASbGnctNfka+erS/oeYR7X5/lyPcwgse6ro43sEClun7VKeL8XWqUxH2zfkruYLc8tn
	TJ5DMsRygyX40MWNRVmhl81BRc96GU1nTwN8axgOiUEVQh857j/dDZfgO16THtm1xtIpNpQxRnG
	aSmbWdPiWo6v5ujdgms9SwYkI19KnZJjAMVxTjgtlmtMaKBRWKwWkKWXUIazwff+FtArNKTnxca
	XDD9j8OlHaf5ww95OELFvoRnlSGL2zQm3E0xOcm+z/EBMEDH+MS8N8uuecG+tfCmQdbue1PXSZJ
	g3PuE3rhI/d/OishYzBpGGCXSeZJRdEgHqg0XSj2twAI5jkiEBHb7udOuEmDtM/MwnLp+p+Vepa
	aVTdwbipeF5PSn3C9mePtH2EfIAfwDIo=
X-Google-Smtp-Source: AGHT+IF6mIEWndbTmsmJpL6uEi7nCS8HyYelPhOXO26l0/vLChjcCpiljRuyV20XEkmMAv/G/rTqCQ==
X-Received: by 2002:a5d:64c5:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a4cb4c6b6amr7756998f8f.52.1748253888985;
        Mon, 26 May 2025 03:04:48 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca888fcsm36141834f8f.78.2025.05.26.03.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:04:48 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 26 May 2025 12:03:20 +0200
Subject: [PATCH v7 5/6] iio: adc: ad7606: exit for invalid fdt dt_schema
 properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-wip-bl-ad7606-calibration-v7-5-b487022ce199@baylibre.com>
References: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
In-Reply-To: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=rfCHNvDJGZ9CfpNWbsvNZme06fPzQKFo7DAhEkye3IU=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwscm+2v1T8ol0YNBhvvbjfEkvOALyAjny9P0etAV9O
 Odwp+1bRykLgxgXg6yYIktdYoRJ6O1QKeUFjLNh5rAygQxh4OIUgIl8KWb4pzo9WHbnmyN2Bcrd
 z3p0jzFP2z1XryXLPjr209wrjV2LxBgZuqQN1t1mc9TelL5SyFGohb1IYdOMoKtX77tKXr8nc9+
 eDQA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix ad7606_get_chan_config() fdt parsing function to exit for error in
case of invalid dt_schema values.

Idea is to not proceed when there are values that are not allowed under
the dt_schema.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 9a9bef0cfbb37138f71ba5b1babeaa423eaf4d5a..e0a666cc0e14255754e74daa9e1e88bc4ad1665c 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -319,15 +319,13 @@ static int ad7606_get_chan_config(struct iio_dev *indio_dev, int ch,
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret)
-			continue;
+			return ret;
 
 		/* channel number (here) is from 1 to num_channels */
-		if (reg < 1 || reg > num_channels) {
-			dev_warn(dev,
-				 "Invalid channel number (ignoring): %d\n", reg);
-			continue;
-		}
+		if (reg < 1 || reg > num_channels)
+			return -EINVAL;
 
+		/* Loop until we are in the right channel. */
 		if (reg != (ch + 1))
 			continue;
 

-- 
2.49.0

