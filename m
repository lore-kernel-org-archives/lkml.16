Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1310324635E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670754; cv=none; b=mEofgU4GcQU92i+Ruxi4axKHZ8aZlrxN9PCqG6CQTu4NO3zOu/WTFP0pXsdbRsq+zZG6iRd3D24Abpdr6p/C3ax6TswlDxVbJoGQnaH1vz0wN+Zr1rL/hv1ssjG64drHwTo4cxL82JR+FKB6DOKbPfM4llxoBq/2bpFifqqsW38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670754; c=relaxed/simple;
	bh=y6yU6lYRyqEHU2RYOfcRxwcasP7T27SnGV4OR5isOHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtXcQuAY6bh8S4VWT0kIT8GmDNj2DzqCQIVdiaqrJKEtmmfL2tuIc9Gq/SjQaMX9nPT+sRN8zsLUCBEkboCrYBoJ4a+Krw1Td9EX7VS6z9wERMS9vSrlX8cbPn8SSgzhhTfM63FAXOvz1gS19RW1DMikL4JQU27/aow3pBBImxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g070MNra; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g070MNra"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so1271967a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670748; x=1744275548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=g070MNraLUu9C+TbpnMBlzKxN/8ckq+vfpi6i2v7e2IfEW66QjhDjw2e3vyMuw5G4A
         Sh/4V0dCc7MpUs9VHiLL97WtrYMgj+dCOQXTKItOZrsyEx6RbIZjhX4wsAIhXCypARga
         BQQmlrYMejWYoYvFKyjcRzECEOHF9p3Yn8UorQ2wGQAwBwoeFYfzxehbHgcEMO/LsYc7
         pgs9+mbQd5GJUbcnVCPCdotUdlWfWF5XCbb5vUhdDHz+yWfZKSXPyOOIxKnjrLG7KtVu
         xJHWgfbt1jpSE8AVPbQ/zw8+xfdbVFAEZzQjzHtpaOckeWoDNPtczPqKlOY5a2LE2C73
         wJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670748; x=1744275548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=wqFRAW97RuU0dh0Lx5fQFhaMsGVVWp9+JIKtzSQnnxf16PJS3ORKFuwSgGJObZOaMH
         nRrMIy80ZSHcVIIzz0SK1LwvvW4cKZ0RMpMoM3nhjYEuLoSSvMa2o0lK/SnyPNwNtDiD
         HmcQXvKOKcjIAEyTYrmXe3o3vkGKKzA3yy6orpT2WVU7wSS4KfDKG5cC2aBmN3+pj3LX
         0DgUzuFfoAlBh0EWVgtK30gCKPiPH6cp46zux0CW1a5dpbL+rib4FxeAephcf2cHioXe
         tyD3IAnSXg363MIOHWaCeY+u87kMldO4cuwMEJnhpTTNgc2xgOlnB1BMzHidfbIj0FQm
         FLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpxYxuaBfo8wJ2gEWNK3LlLeixnat6hYFCrVy8rkn77MabaPSrf/jZi8MH+AEL84urdoSC6WCkWRh4dxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBjNYTjP3XIzUHhQoxFfMn25Le0xP/e2bbxtodgSZcJqkB3Ai
	LbaBOqKuWJII9yCRrXe+6QVL5oIdyWmr5pQhfYYnytMjZU5x9etvLnBrq+p0zQQ=
X-Gm-Gg: ASbGncs3btOfhTLoKplTzTx7CA4jtOKCM1DebwyqL3HraJbgPnDer+a7DRCWb8lAbx0
	Pd4PQ8b7cnMzuNiUZ6/GM0iwxL+A9zwq/Egug1/+vcQHdisK5UTxYgHD0PW8SfqiYp+unYPRt/Y
	hBAnSIomevhOa4t9QGTRsxns1f1qBUMTShPJUpNSqWoprxw9KQiHxtn/0ckNMMtYT8KRGLfv5hD
	vmNbbFh+3IeOauWTSrJ8duy80QpcCWrq0u8B2Ts7ZR6cxVa9pN64cEKRab2GRi6hwI/NCS+5G2h
	lfyWI7KAQ/Ubp0wrS4nQ00BDtrhBfmW3gBezEz++wBvAJcl/PHWQSf3Rd66gjhQu52r4sskbe9M
	9HhPkDCWukeTEc2Chwa6WhAlwSwZSqybEK/g8CpU=
X-Google-Smtp-Source: AGHT+IHJBM6wgjWYZps6ri5VFfxoUgvh5j0PdsJYHzhGp7CXuLgrnxXEuXRPTmCkvL8y435madc/FA==
X-Received: by 2002:a17:907:9708:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac738a50828mr1837746066b.25.1743670747866;
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:04 +0100
Subject: [PATCH v3 12/32] mfd: sec: sort struct of_device_id entries and
 the device type switch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-12-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 8e3a365ff3e5533e27d94fa8a15dbfa639518a5f..966d116dd781ac6ab63453f641b2a68bba3945a9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -154,12 +154,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -184,11 +184,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -201,15 +201,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.472.ge94155a9ec-goog

