Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681641F7910;
	Thu, 15 May 2025 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318605; cv=none; b=KV9YMp2nBACV/L/zXfTtxh2RsSsxxDxDuUVUPdacbK6g9wY1KKpOt4yiLSUTM0guizFvcG68B0neD+xS6WJ9yKvI44KL+o3kURoG0Nn4afikmFK6oBnBglo2p3s+PVYStxjAfyC8GmmU+Mt8AmIE45j5DooT9YptP/te7LHJNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318605; c=relaxed/simple;
	bh=7vXj2lL0ABhnybPOu3woikYgEpsr5/S9c7rX9e+zIdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0cIHTKsQB3pXrmp6a0rVTGlC/z43hb3Ovls8KlTsLPDVYO8NCXYDSNeYzOscpGF1kFi9xre2eWdmHFmpk6YIFezgINmSJh3Prygcek0RqB0j8yh9UfQiUMn1S/sMiUdVvQbKgcDhGs1q1iGHUAh8CUw8lrZR+RiQdFMFIv2FcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyGxRnT1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyGxRnT1"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad24677aaf6so128006266b.2;
        Thu, 15 May 2025 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318602; x=1747923402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3UDIwrt8q2IoO3p0cBHqtcQzcmLYI3JiYKPqxI7uzI=;
        b=IyGxRnT1Y3ThQjh+k4oW+ijtu1kwORowy8CDF/gLrd7prAcOziuFm+EFNpbe8dPpqr
         bDs7Us2ReuoCeQYvW0zNVMU8+aUy/j8PnrqVcBij8NzT+0FMbi8IWPm68ObQ9joVJLw1
         epvDk+bVEVaZ0WsuUtQVGaiIP0/BOfzf5wHBfbb2kWgmAbr3VVLh6GLkpmgl5WAu0CTK
         lUstrmTWblskocz0W4qZnUvdYMm24P9Bjp0QRSfGXVXXHRD9cL39dFvKlCtR9A3g26uz
         IPlV10dOmdqDHlOG8LVNbwMntgKk9VHNOZa1IZQMEUTTBBG6tJ0iYPURcv/xCVRZLND4
         tVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318602; x=1747923402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3UDIwrt8q2IoO3p0cBHqtcQzcmLYI3JiYKPqxI7uzI=;
        b=gyZNvI/pOQzgpBeq8QbFaICVNkMiU7AdtAbiGT7tO9fpI4kUaJYDi61cbO1paEde5w
         8w2JzntSHfFDSh5ZXcgPujxk+T0HTlqkTxb2b5pp6Ypf3LGb5xU24qmmmOhdm28/syvX
         w4At0AkFIV3gfwtbnyPVov5nNyOFYKh2+DsfA7WtkYwfGNXX0iux7yRBx8zwdyioa1CF
         LRpzB0vGyZv9L/2f9R5VPI1a7mbJtv91whcPd7qefGsKshYdXpYdfnGq0qz0TObVFqEL
         WDnEHhjTuX4FdYjrKuvEnNom3XS1T27HOjRg7dhM52rVQusosZfyYEP1J/B7QjX8khRn
         LXqw==
X-Forwarded-Encrypted: i=1; AJvYcCV+cND5Dtg8s13P3PgtTznMz2ML7ihOjItXs5vqsFHaqUHvU09wmhRV5TVnXvSrQILpKr3jNnrJLvCZ3bVi@vger.kernel.org, AJvYcCW3or6lltB573iIp7Djggm4U88s8Fiw+OTsD2cPdetDxcZZg0qxyq1iSHNtvoO43mf1wP/UwSGxgFsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxnifgnaXVoXXAkd8QqpaHYUFBYWcLgrnNVJMQbk9REN4+KIRW+
	os09Hm+cVqbPhwbGCATLn0QlaI92pN8A5eq+xSDCzczLlFghzm7iGMxuwA==
X-Gm-Gg: ASbGnctXZcXIkyYZ9X/CVp97duJ/lfcIHqbZSK3Xgr+29Wbw7hfQNjG2VOs5bIzWKxa
	qna2s6uY9JmrWUYPLM8tUosigJqHnyHrLn2urTtQ9M4n8TSv6p7Ks5ozlkI+30fVBsg/lDsjlpB
	qE8boeWZDWSF/XEKJ295otNnii8rZ4e8R+iGC51MQPR2WKS3XIyJq7F0+sIVS1J+vOcrgFSIWMW
	oEUAZ/6RMVkME8McMflu2Zq3nKEeHUvm1ALGRp114HP+ClGjjpCrji8OL6pT8PyEUYoZwxmiOfl
	KlwGz0z0IihauipcggXZMQRCq5INUqmTAQHEjC5Ovk5mpMejWwN/E4VEpl0Z5rTDl5qasfNH4JL
	nFCk5lDCrAsfEVdwlVv6hIwy1da+139D8
X-Google-Smtp-Source: AGHT+IHDnCJ5OcM3OaKjhVLJS7uemAJqnm0OcV5tal0KrD+Vmzr2b9JmP0FGtbI1pOMCPRLeROP6rw==
X-Received: by 2002:a17:907:6a17:b0:ad2:4fb8:c0ab with SMTP id a640c23a62f3a-ad4f71e99cdmr712484066b.31.1747318601543;
        Thu, 15 May 2025 07:16:41 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:41 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:32 +0200
Subject: [PATCH v9 5/8] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-5-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=1173;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7vXj2lL0ABhnybPOu3woikYgEpsr5/S9c7rX9e+zIdA=;
 b=/BTWBM2DePXxZdvfSKM2bAtC7wlRqGwG63cagASWO9dexV0q3QfMB+e6Kb5EQvvT78vUqP/hx
 ldrxBdEtf/7A6L6UcO8XQ5YI/H+5FU3v5GI0ZW+t+T94qV/WGOZcXEK
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Instead of calling dev_err() and returning PTR_ERR(...) separately, use
a single "return dev_err_probe" statement.

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Added this commit
---
 drivers/regulator/bcm590xx-regulator.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/bcm590xx-regulator.c b/drivers/regulator/bcm590xx-regulator.c
index 9f0cda46b01506080ae5fa709104a8df4d174a8d..a17311fa30e4d48c0a4925778d7bed486ac7a982 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -340,12 +340,10 @@ static int bcm590xx_probe(struct platform_device *pdev)
 
 		rdev = devm_regulator_register(&pdev->dev, &pmu->desc[i],
 					       &config);
-		if (IS_ERR(rdev)) {
-			dev_err(bcm590xx->dev,
-				"failed to register %s regulator\n",
-				pdev->name);
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(bcm590xx->dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     pdev->name);
 	}
 
 	return 0;

-- 
2.49.0

