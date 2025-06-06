Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863419D087
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749219646; cv=none; b=bp1gJVIXf65Gi5KhjxYK32H3vEXyDiE34B0/+FF5Kni8xyNSTlEF7/CMtld0BaGnvaVGvuQyEpLb0823S88BZMf3OXmkItff8/smKzZnwFIO8pF07LDMR65nhzmbLEVqA2HBj8aUabzou8/K8dvx86HYS1ti8Ydip7DPw7/ikUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749219646; c=relaxed/simple;
	bh=gYfEpf2B0eWfEeN9J0NWkVxgQeOXhE0vWQqSI1AdL6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O0P9nBLBKlpH9gNj9Q4lf3lvL1kJ6dCOjzE+ccOz7cnimr2O3tWgsgAoen0s5+SCdhXzNT0DMDCROogobk3Y8zAEXSdBCX16DNN3PeJ8UQTrx50ZgUsrT3WWmXAZRWGxQGhJm7zd/+b6LsU6D0PCaXQgOJhVgIPcX0WFlk8lw70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xl8zDuQg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xl8zDuQg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f71831abso2073721f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749219643; x=1749824443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1WuSemWPuN4SdNDyJuKtWMwJnRcINbePcyuYFAeNSg=;
        b=xl8zDuQgOcvXr26pndVTz9RWxSiJfigwaOWDjUCCUw52d27jJEQnYgTocxzmfC2Uwo
         900ElBBmYlOzi8NeBJoHUsZ7w6mKaPDyJEDPJUaWgO1bOpm/oZRnoyC0WIlL7dLzQg9S
         ZI1r+ZBKdT4QF1zAfNB8BOZLo/SfrqYpnvIdursH11lOLSDrmUYJXh25v12npT40okEE
         A2WWcLv345N0PNBY62VpXLKN8ni4d8PHNHn4dsCr7KSjssjBp9UnKoCm5aKhDdH3bgjA
         5V4Jj7xjRpYOcomRJj9A2o9EH9dYJmtWsFByvR8oqhW3ol0BhwCPW8Rej6B/xahn6Fy+
         aPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749219643; x=1749824443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1WuSemWPuN4SdNDyJuKtWMwJnRcINbePcyuYFAeNSg=;
        b=VoBFCUGUJGT8F3JgCpW6OKumoPA4HbcMSvX/Y4K/FtsAhpftCl6+3xlpGkUiWbRGdB
         Pst1Dje8cEyAcuqi/dR3D+92s+qYPzD10m4IUfAhbml8lAk3+hucYUcDZBIDlGMrxpi7
         ZtolWF2LODdno156jBZVRf7Yl5WQPiD1XT02wAmiKgl/2GN3RnVa86HpEZ24zH5tn7fS
         +uQbeUejC6qvUe2rUWcweaYjSSQflfsz2HHCZ129whIYcqNDggcNrtV+Y5sWTzHZGF78
         QYQVlvhDTT5fpKExnTDSmZaWzK2tNZ0eQGGEBa717H/e0WjuZivsR4ee7f6i1X46hP2t
         M1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5/MDvfu9HQZ+IOmWcrkX8HH1qfx3g1JdpKmV1Pylku89+0iCwDDDUOgxVegARDwwSEMsPIXnVepU1iWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjrLCMuI8H3hCBDgfWqC8kcoaEzmhdt7mJDeicvgu8hxuvJyaM
	9gt1kjk+K069a/io0KYT58yMV+78yuD3FKQZZu/NWisP7x/x8YfL4UiuTLcZ8diEwo8=
X-Gm-Gg: ASbGncsdIvBywYq0Z06wMHzo6dPUAPqioFye7cWSki1EN3alzxDN1GOU/sysvvkoJki
	3urUMcOUgYZtCupTN/auMMLhiji0vzgkHA2ZfLnVZDE6WH7Jn0hl1cG+yClOCmSu4KutUBfNo54
	Zhwbg6egbWEriu6nIzo2DHPLD+lSBvY9iLwJBNspnK43hHLCrg0bCuSBIvOSPczZOcWPSRXDswM
	MNNoKvkarUOnNzsh442/9bJTvQR8CFPryTYhAAlF47UWH/HWsyWSBW5wqy3peX4nRxpztTYcSD+
	TIcOeIN9j1gmrH6eqSHyDHI7hTQ9qM/z8kvnfAjnYgHWW9O7yIM5KqkHeMu7+157N5HjDwldfQL
	1f40Hsv9Pe24S5RJVs+grk8xdv8Xz9yE=
X-Google-Smtp-Source: AGHT+IFtlzsfvKdrGidMqXsh4h0hFXBsNFDQ1/vkDgbyZn8qf/GpmYhHZbaV81p1vbt2rpfR/6BT2w==
X-Received: by 2002:a05:6000:2288:b0:3a4:f8fa:8a3a with SMTP id ffacd0b85a97d-3a53188d961mr2814047f8f.18.1749219643145;
        Fri, 06 Jun 2025 07:20:43 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213754973sm25686345e9.35.2025.06.06.07.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:20:42 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 06 Jun 2025 16:19:20 +0200
Subject: [PATCH v9 5/7] iio: adc: ad7606: exit for invalid fdt dt_schema
 properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-wip-bl-ad7606-calibration-v9-5-6e014a1f92a2@baylibre.com>
References: <20250606-wip-bl-ad7606-calibration-v9-0-6e014a1f92a2@baylibre.com>
In-Reply-To: <20250606-wip-bl-ad7606-calibration-v9-0-6e014a1f92a2@baylibre.com>
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
 bh=RXow6w1uaNfMkBVbDyKeZVZMYqn8OBoe2df7BYhUk/U=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYshw+vHse9SpmdYf179kvjN5/seTMywr79gmJh3gnBwbK
 pF668miZR2lLAxiXAyyYoosdYkRJqG3Q6WUFzDOhpnDygQyhIGLUwAm4uTIyDBpwyLzDUkNLtua
 7j08+P22bl+43sTQnbIHNP4UZh+48bCf4a80x7GdF/Rj1i77ov0u/d6vGTIef2xfB5w48a9jU27
 goxw+AA==
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
index f0c22365f23fa2bf00edddcdd7d608bd1393bf28..e5878974a28293664dd8dbded5fffcea6db31ef3 100644
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

