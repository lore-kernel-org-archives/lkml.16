Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0C81AF0B4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050753; cv=none; b=k4q2mLKSDDMgXZQbyODPgx9RljiSRVnjU+WXnewfMfSANU8FfXg8a7sgemZUV/6qtyVWfF4As9Nrxyxy9GhbLNz++wUT/TfFjX677uy5UCKBuYJ6xvErxTeH1B2d0jc4q9mmqJR/4OxWPunO99pCcAuJIu0fPHN6QU7sLRQQRxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050753; c=relaxed/simple;
	bh=ZloWrNFeMmVe3/HDuD1aXKWP+8PNEOlvbHUi95SknjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTCRqNB1r9seJjNBRo2DD+oVkih1/uaFvFqvWMcPQNQ4VHCxquCBsWqpov9MdNrRhsliXXCbfZINCTd48PQC6BIlmh+QcKrzqeGMOGsyFu+kjj8sXl810EXAH6CdtQAdAf++RkSpK7H5s32RNoCoeGibIpqUwOexaH7BgAtkuQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEEDtvhr; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEEDtvhr"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso11559567a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050750; x=1749655550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RK6fDlVurrAhSO63sHrDo/ZYoV5lV5EQ9BPN02YtAuw=;
        b=cEEDtvhr+N7PEGXPEhrUeFyCa2qMbNtm/P0Ohq03cvSAEPWkKTQWaWgvMzPAwZ3viP
         zRE3yGsRYKJMYizY12jupVh2sj3akcOfCWdc/140wTbE2OBIDZWodN3ul+idJosE70Wl
         BY/6GrHREpcUeewuFqLXsOvtYOV1JaskxSaHVUbsJyyOHlWHBLbNi0mNS/pfnmupNFSA
         tXt9l0KeJhXI7DAkb0Zl2aQOo6P5IA35b9XKeGqJJURCP+AVdn4so4fa8Ezk3m3TXbqv
         4dhlX32QPgpnBAjxfTJCg3PHnfEAX3Ig3NsyaNCKZKqNb2OwczUasGSt2lB0HXxTLiRm
         QM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050750; x=1749655550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK6fDlVurrAhSO63sHrDo/ZYoV5lV5EQ9BPN02YtAuw=;
        b=k9gxveYlgfSoX0x44IduClkhDBY+nx6Dn4D0BYrN/ND89gQMKDhF9VWXRA0r50fsC3
         PHqL9YcnHIuqBzdN6Lp/1ir8HHABV/Pi6FDchEISsQie+tSBs9LmmcG9dw+3NxNyjVf5
         sfxLyY3/16Y7mzRUR9uNZ2OcEmdN0PZG5Xvxf/tsuKnyr2lq3SUdTH4u8CAPOYk1UlVi
         lFMBC6zkMdgytqfAMQ0ltbCOYruZh43jlkCay4d7iYohiD9w4Sm4WTb0eiBtzq70zQmd
         nO3IhhMDtp9ZOLoN+RAS0qEweicwfMip7jNEU2fHW7wqkoh9ECvbNyULr67U44PMlq4Y
         OqIg==
X-Forwarded-Encrypted: i=1; AJvYcCX6f8uc4d1XZRu9X01vaKaqt8aSGFx8K1YX7/a+MBXsLzJADqJBxEqWtR47dcEpXhgf65Bmn4lGDnxGWgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbwUa01VhUsatyqwIEShnPB/XbFuxr8ml+8yowYKrZv7ZMxqTU
	8gTuZl3orC7G0worfTmJLzZVJN4bxz7w5YhA9vCkffa/3qOddOafQCDDJuXAGJXH/Is=
X-Gm-Gg: ASbGncthwN44XXe6Gar5fvXdbuFBFiZA7i4tdx03F/bJm7dOsZZuhzFVotj8etMlWwV
	6iEcex1fHa+lkMArUFxI5IzHtiBYZ35Mree52JkKm5Gbqz4Sr3kERAJTutcyGZD49vHioPkJ2qW
	mBhmo+SNU/1KR0Q+9eXGBCwZHe9nOCfzFQmmKrtzClpaaKTsIp3wYsys6UFCh3SrRDa9giRrHIp
	aFcQmKNczIhPfduKlLbsw3CHWaGLMGkUIKv70vhC57H8OB7/zgqXf3fNWfZv4sFpz/C7G4JniMh
	GQIffZMWXvxBkHq4zuXYYHAVnWKYiCG27lIkmCJYyzvlyjF6IeuZKKwB5G3s7DdJ6SOyYoxhTRa
	osAw0RIxwqpwJx3YyfnW1DjcNqH9EpI/sDO3/c7ID07aPSw==
X-Google-Smtp-Source: AGHT+IGie5OT/C4dKIZS01jGdu9pcMB4S96GfIIlXrVLkYBNWiD38sd2vviPzRoeqlZOJ6SG51yRIg==
X-Received: by 2002:a05:6402:1d49:b0:601:31e6:698d with SMTP id 4fb4d7f45d1cf-606ea190c59mr3038407a12.23.1749050750307;
        Wed, 04 Jun 2025 08:25:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:48 +0100
Subject: [PATCH 09/17] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-9-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 04ae9c6150bd5ae9dba47b9b3cfcfb62e4698b6d..1f51fbc6c7b6e158f9707c04d9f030b9eee5e842 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1207,8 +1207,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
-	unsigned int rdev_num = 0;
-	int i, ret = 0;
+	unsigned int rdev_num;
+	int i, ret;
 	const struct regulator_desc *regulators;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),

-- 
2.49.0.1204.g71687c7c1d-goog

