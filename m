Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A7158874
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971257; cv=none; b=lmoKpee72+AJPsimg+SIZqA1ikOvLdnUaYjPnr0iIHU0jdjHVde5mTLJTqtYa+7w7gllKCrFos5DglUtkqywVjMhSJ5rfSQr2x2Uan8ngFd3NdnNd0ZSzQAoYcI6L6tJF6REn4F7XYyR+Z8xkGLlUv9f+I2NNAe+5kp6CbnnIqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971257; c=relaxed/simple;
	bh=2trunEferEiekSmXIbrvzSG43Kp36B1WcqzsiY1pYL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOXEDdS50qtjmpIywDTDt3P9znJH2pOeWJ0VzMvb0S+VKtHlEWl0q1nlCtyB/vNvLeOk4AAFmxHgRESzZAfPMdbrMk3csr6nC0zrQckG778R7wFoWoTzl8h1KZGqPtrTYT5zqv+GINOOhAQc7d5TQ6zWFHawgdoqMcjbykdK/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1g2Iqka; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1g2Iqka"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39127effa72so351345f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743971254; x=1744576054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+eeXc831jTE7R3MUTxvHjz8t/oVP2t92OuvIkna8W9M=;
        b=C1g2IqkagIiWlTmspCU0t3MlTgpv+m3xtPybyXYYY0U8/yqEAePsmCvohjYPhE0k8i
         ySzOADRcZ0GY55if2xiWLOtFPTxrH63DeREXSwcRwAExCf5kmnvel2qj5H2m2eX4lDhq
         2Wv3yBambRhYdKuBc43NsHKOI6hypi73UCFRkdqOFHW+g15b6qYNKEYmXUcRRNKL9tQ1
         Hc1btS6Ll6/T1nS3G/V6iK6rKK6wI3z2Geo2j4WebgKuYtXfZgXnN3CSTiHNnYWMg31x
         pmsLrdgNufBEttqnNC7cN9N+VyFQxfKRYGLOLNZwcgqpibDZVktenmQ5qWW9LazMAA9z
         3pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971254; x=1744576054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eeXc831jTE7R3MUTxvHjz8t/oVP2t92OuvIkna8W9M=;
        b=krgfo6ut6W3Cg9UueVFM7ucvE7MxjUXEd9D7v977i2kIb/MfFLrEx+cmoQTuu071lM
         PETeZ1f0CiyeIVp3nyR3eeeAxDzanRzUBlasrZnVqsHyQn3zYvafH3zxfLwE9Dvz8G5T
         fq4ero7snhFosMw7pVkmX60N8Yq/oyKoBTrKjYBUTRQWPtr9dFRauYsGVS7cxnO1KAEk
         HcRFNeRKEfUIdi5UkQyl9w8wqHZgA50DSyWgq3anaAafU4dwT9QXJ8RoalNqBjoLZyLg
         tR5aiPHkiLhhM9Tx+A32V308CMMvVa9mSHBXqnWrizIAQ5d73fyo9V2N7mOzbYv0+mZL
         plGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUazOnR0hjd12e6Mlmfd7BVItJK5ct08aIVjL9+N4pyE8ivxRkZajfuYHsABykH/PnyT3EQX1GlBEQmUhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjN8Uv9otLOdUoagjhaBcpin8pY9aM6Hw3SnV5a8GjAfPLEFmn
	PeGOyHl/rYXPlTxU6Z7tUk2qDCs1bMfP0VGZ6VJAs9mz5E3pkWgyDCY9YrQLvYU=
X-Gm-Gg: ASbGnctO1YtyC4oRfVe6mwBLE4vb5m9pWMZM5j4sMA+pdsauNrwuXkrUj348pA9LjLX
	jtEXF5UVN4Jl7uwEn6BK2g/u7y90fbO8Wacm1Pcm1LWiJYe7O44ZIdhY3Zrk4+zvjYiX7tlfR2f
	YHy0Z7OmGdnU1r7sQcpK4n04LR+xhL70gnFt5Q8ivNWDcNepCJ+p+Pe/4XhIXk6+JtyYZwyvS42
	45Zd2hrKELCeibROUQIoCblBKLJWfcwTgfVO43e7K3mLXbsYMPEGv+aZ3iytEoLBKG0dcuZSEQw
	Bbf98z5m0nnRTq1f7bW4j1qr8ao51OQUGoif7PVugf/GMOxqzonsyA==
X-Google-Smtp-Source: AGHT+IFoPbEvAK3UvI53U2L+ZD0sPGTteZiiWX2CiOJzo0vzUR9TlCHv4Yl0XzwNrZIEdAf11Yyewg==
X-Received: by 2002:a05:600c:3592:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-43ecfa18f83mr33929465e9.7.1743971253632;
        Sun, 06 Apr 2025 13:27:33 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663053sm112207355e9.15.2025.04.06.13.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:27:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] power: supply: collie: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:27:29 +0200
Message-ID: <20250406202730.55096-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/power/supply/collie_battery.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/supply/collie_battery.c b/drivers/power/supply/collie_battery.c
index 68390bd1004f..3daf7befc0bf 100644
--- a/drivers/power/supply/collie_battery.c
+++ b/drivers/power/supply/collie_battery.c
@@ -440,6 +440,7 @@ static int collie_bat_probe(struct ucb1x00_dev *dev)
 
 static void collie_bat_remove(struct ucb1x00_dev *dev)
 {
+	device_init_wakeup(&ucb->dev, 0);
 	free_irq(gpiod_to_irq(collie_bat_main.gpio_full), &collie_bat_main);
 	power_supply_unregister(collie_bat_bu.psy);
 	power_supply_unregister(collie_bat_main.psy);
-- 
2.45.2

