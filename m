Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B392459C5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131044; cv=none; b=QtS7sqaM2xkBuM+qRpVQaFeWWxTJj0V+8WDOwrNqNF33lwABy5/OztTJS6rkDy+fiw6ESix/2VYMrSzNSZEnBW+5u+/BGA3LAvtEz6ZmNfMkBN4qRblg3kkCrgYyuO0r0as1DV4aJQuKN5mZBv+fOQlWeyDW/WFzae47d5W2ma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131044; c=relaxed/simple;
	bh=5NfpZm+2LpIuUUv/LKxeqdm9mkh2vEADHgfvGUBG+Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xbb0n+FcD9C+pYsToX3xlF3DJXAd4817QT730O7R1o5k0Dq5dl25yTNi4VPPlYaOFGIW6T90stWBztGkaN3frTpxqrB5QCcHbl5ZY+5ZWBb3oGHvhtE9O2i+LhlKidiLp5ZgeioZmlOMRA+nDXJhUtEx6T4knfHTB4b0iPOeNnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h5XNn292; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h5XNn292"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441c0d42233so5627265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131041; x=1747735841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8dBK6vbp1JpEHHLt8/xtt79SEaE3cK2HcOeapRU9QY=;
        b=h5XNn292dBqSQBcgz1K8dXCPkVaL1GmvnyCPPt4gdvPMEopgxc7Krh7P1KskrBbWtx
         UB3d22x1evF6CBNW/C23G5iLB4viIJMq2X9oQaClbrmd57U59VTS9pu+lEEBhj8swPn3
         nhcVv0QFWfKk8bjrcc0TCv6WGS0Hxsa1qY5tFysHf+Gb+vmVwQB1NcTveiPRg13zOpNo
         tcNc6gwKitIjay75RisfsnGLvYH4Fa69y3ZbT3itDh1TSJaNGfjZHHP3OxI+Bx7zZVC1
         8fO9FfnEIAngtQu7oEUula1knUQc2JJmxF85Q3A26Qyzfd3urqqq3vgR5zCxTKRkUL0B
         gSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131041; x=1747735841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8dBK6vbp1JpEHHLt8/xtt79SEaE3cK2HcOeapRU9QY=;
        b=iX9doIIfYvRFCBw490CO/2kiNZYsyXFOtOLtwB77DMWNdhFAPiNtFUwzxstgS+gqqt
         HuX2/8e/cOOoEyp7D85P1qSNaDq1st45tNJkYFL39qTYwH7SwLJGL+kJ+Vep05maTJIE
         OIoWOvgtp2LarVsHXkSoqsemwYuY9TVFNwZvkN6E4aNouBxaqbKg0kCN5tAG6ujuVNW/
         /GLO9N8IHDVO9E+AezkXikKe5sa0DQ+SUIY5kIQQPE1G0d3VJn13GVpSNB1fZm21fkJA
         sY/gd2vd1DFZkgRM0JQGivUk9/+6b8aRZkDtiQCyatKtGM6CiO5nRUZtj6puL5VoaQ0U
         q2ew==
X-Forwarded-Encrypted: i=1; AJvYcCXMKHVTBJk8TeYNU4r+nhhvKJJ340zWulbX6Thtm8RbCVUL3QH09gk0kW1nxIcn2awZlYjzOVQCLabSQ2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgATSrqgesxyP+hz/ghYbX4eAwE/fjdL3N/cDJKcljSB+hDL5a
	2EPHC9GTInHIjO99pKFcQkWH3WE+ebeGz0zyyRWvlTE+yHXwsbTISTWw4/whdJo=
X-Gm-Gg: ASbGncvCUQlyNXCzvrtfq8E4GKZoJT5iTKZpvJROBcp2YqvwGu5dQQVrtxQmr+dNgkO
	64jJMywv7DJo8qDuYiD+MjGd1DqqXpT3upp+tfV59y5eDNw9f29ZiE8qOOwica5BZKz26XmOyeY
	HNrb1KPm457D/l7d4wQ4GNpsg34/c4xN5HjbZHdzX9/jHiEXWRp2kpk6PBnyYG7cok743NSWXrj
	OGdTgIXi7Kc5tlGOrprUr19Nmjl6rqhwk1f01M0l4DDiW40+SHjxRPXEpikw5Hfh2jyPial41MF
	Tx4NQoXgU4OciWOUlImyvZGPq63jPlc0XYdWZ2UuQOI0FOw/mFsQ/8bUyVzHuWRG8+813mC6f6b
	lLwjZlhsjE+t+E0/TyFK3PqJFF6yQXAvsNnDq2Ns=
X-Google-Smtp-Source: AGHT+IGTa8DSyODAQzBZKZ5d4ecGtFrjDgOJkla3p4mKacsE9TPMC3VixJsrixwN7OQ/qL+vFjc8kQ==
X-Received: by 2002:a05:600c:4f43:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-442d6de7911mr53186185e9.8.1747131041032;
        Tue, 13 May 2025 03:10:41 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 4/4] ARM: s3c: stop including gpio.h
Date: Tue, 13 May 2025 12:10:25 +0200
Message-ID: <20250513101023.21552-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=bTvi/Wlka4LN1Gko7gZZp6DhLneFC3PKb0/XbChbsbs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqSgi9HNbWtstkm3Z3A0GUl00WkCIY7pKtqv
 bOCMTw2E8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakgAKCRDBN2bmhouD
 13MxD/9Aw74xNyjJwRIgwVKUPalXjz/+g5Z7eOUhQTnCoclouaD8LEGtCRL7rDaSMf3Fj5HOrRF
 6lN6J281zgiiZHHer1bQCt0E/t0WFZ9DdXEPX5pKwWAE7A3jaeLJ4AVucC1qI1d0OOZdiol2Rqf
 1Ps/nAHELq/COxJZphBGSZbJMOBGNzCT2RqsaC1vRkmyvKMYk4Geew5gr8Ur/pQLlqJD60kiXFv
 W6vRDLbj7LaP/Z9dgQ2btHNyR40NUB6BfzlRCgjZCXhUK7C8sfPmP8yAXaq3TbE3USOpjGL6sgC
 T/E4Fy61CArIUzY5UIDC8xnwjBI115aKmPsMgepiTD85MULQEfXG4Npc/qkc1z7e9O04mL0Jmxc
 Mp43csEyv4c2AW4dBCXR6z8OtUfFDjwfaaRASPpVic2yC8ZVcgnKa5eiNI+TMtqinWVZ041HbfO
 HH2J0vWo23OP/Nxgb/2RXU7Hn6iMPt99J6A21D/hm7snJDKN0H6OLEQ03/h4nAZBIHSa4BAUlFD
 lWkh7n0jYysRA9MPDkft0Z1nr1A/F2yL8A2dElslb7W5+dI7oEOBWqpyLFYqGEkeTe3YCY2a1GU
 ZH4kn80kZQZ7Tb9nzielaVffA+2B6THw15avhLmVp3jFCMj1U6tzHXquaQifcJim8pbEv6FlLm/ bldpnWXxn1iVXDw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The driver does not use legacy GPIO API, stop including this header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20250331093650.4028999-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/mach-s3c/gpio-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..79fdb52c4a6b 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -11,9 +11,9 @@
 // Samsung - GPIOlib support
 
 #include <linux/kernel.h>
+#include <linux/gpio/driver.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
-- 
2.45.2

