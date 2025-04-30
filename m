Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2FD1EA7CC;
	Wed, 30 Apr 2025 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995800; cv=none; b=UzeJ4/nK7VhHiN4gh6ST9hAqQbPUQkeaID6ZTjZVkrsTPJJlTciB0CmhAke4uiVkw9ngdFhRR4CxRbq7vDShuUeg8cSVRIve8Iw87n4EnHwn5EHES3iNuz0fZs41jv3aV2mXhxiQcw7OdLQJZ8AzowGzBDygrQDTXuAvX5j41dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995800; c=relaxed/simple;
	bh=ob9kuGreDbaYbYNHaAE8f58xGhHGg0WXt6lHL5n45k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNjwWQfItFzg51DvjHBPUqFeayrNO/9WtWSuf3Yn6U87RvHpsm65EiS54dPe8j2xxs1ICdjphvS8JT7nRBOBbEJ5zfNDdYYD9bRiSF+1XzbWwMcYxM3E70RXOhld81hXa2gOU14TWy6TazV83z2ZXR2l/RQc1tcWLm0TfKHQFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEGlQ/kO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEGlQ/kO"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ace94273f0dso740223766b.3;
        Tue, 29 Apr 2025 23:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745995797; x=1746600597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TjwPnuhpxVRJ+7EtVSBIf/pKb1ipM80jQo69yN+jVk=;
        b=JEGlQ/kOMo2abA20OuAUciT1JO1y4QhzvqjQg6JTCNZ+RtCTWDHRDxbXW2fgv9JLxc
         8HnQ87sfWu8P29XwRdzUm75PX2kWJmiAxIVWVcHVVLy44ksuWA+O+Y8rW9uSUrxUgkUH
         o95oHM7W0OUr2HbREggpr2gnY0goGsBdI73C9Ih4yF+NgDJNN8g0hO1pqD5D2H2Qz1zW
         oEEzkfT1G95qXN362vwYLsrK37U9v/Sa5x5l4mmi+wOrKtaUsws0pfWtL75Sp+GEUSKT
         Si7VDuK1yFZ7gvAgkVUiJwkSeh7kJOubh930FhhGAqdnaxOzRjZ3myQjCP+2ci0sCOnb
         YBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995797; x=1746600597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TjwPnuhpxVRJ+7EtVSBIf/pKb1ipM80jQo69yN+jVk=;
        b=aJ4wMVG59GbkoV68s4J8C7Edl47+unjnGGyezkWSByruC6flG5Pon2hEFgPtZAgOL/
         DYv4H3cbVfTR5vM8pmkLq7kf7ZfR7eS32czK+fl3LuXy5TM2MeAumRDQORrmSMnGm1jF
         9H8Ovbq5hIgrW1xZB97hr1WttklEwk+dSGGxC/H+eorETdC2W5KW9SWHDALvVOOynKfl
         cYDnbjF1mjCeJ16THCk7LkygsQu/+fbqpTcwzsZDqvfNlqrN9CnJODBC0XLPMH+gAXnJ
         pGMYgTX+D7Xpc2Hzlf4a6ByXZKy+pqa44LUc5ZaLs4FzPJaJcmojKUvBZLgh6ZzALd2e
         OEJA==
X-Forwarded-Encrypted: i=1; AJvYcCUbZkaz6Z5qhFVSt2naagK1KaTLFNqDoD44AQFh3QNHF3UgtAeWnnIqMloGPk39Da9h9WkgsKCsc1AL@vger.kernel.org, AJvYcCV0EZNEVTM6oVAlE/alEI3ZpdyprmEaziLeWRUWGeHpRc6AxmUbj0wnsBYMCDU7FlVehX/sf53pjoqLQ55P@vger.kernel.org, AJvYcCXeKhx8wcXV98lHhqhOkb+tLBwRzC4wa8SScKucwYlkewjgdqWinTP7iUH+DHls+n8P4PGgnLmjY5o1@vger.kernel.org
X-Gm-Message-State: AOJu0YwONETxMe3abtS3N4H3gx6TuTPnlbY88yT/74i9jMXoHc+P15SG
	uAYGGmFbhzJrHrdcpjUue7aPDijO3CWa90VvrGUskpx+4yaO9K1C
X-Gm-Gg: ASbGncuHquviXAa8FCOLPBId3pLYcOksZjaKWZhBEGzflgcF8AatdTAfWrUhHfHcKc8
	gFlkpqjDi9gWh0CeF4qhk/udZ98Bxfgq0mVpCKIjKVq7k1mbMuRtmIthk4LkQbrclBd/vI/nWBW
	Y8V0st1pdSNl1Lg4oG1vZJ94bhTvc2Qd0Yw9QoazSRhZsSC0IQtVdzELvnzg8XvXWgYVtvBuY3q
	BD2/KwQnZbZ0VRBCtirxUpJD+1HQJW56n/tUdqHTtaj/0/PUeHtTAZSqGDlUhIgd0jfq8rk9/nF
	WYA10XCkXtr8l/l5soiis9yhdqvFnSyMTkUszeOk8WVZ9XPMwNa4aFK3jhUUlZaJPy4TeLMIc/X
	J676xw2dsYg0=
X-Google-Smtp-Source: AGHT+IFT5AkN1QQfhdYMAlzmlRZEzgQO0/KBE+vcsDUAPw4vhI618K/BBDNQC7TlzP2kEabOHikoow==
X-Received: by 2002:a17:906:f591:b0:acb:63a4:e8e5 with SMTP id a640c23a62f3a-acedc56b33bmr214595866b.6.1745995796752;
        Tue, 29 Apr 2025 23:49:56 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm881222866b.73.2025.04.29.23.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:49:56 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 08:49:49 +0200
Subject: [PATCH v5 2/8] dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT
 defines from DT headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-kona-bus-clock-v5-2-46766b28b93a@gmail.com>
References: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
In-Reply-To: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745995792; l=2774;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=ob9kuGreDbaYbYNHaAE8f58xGhHGg0WXt6lHL5n45k0=;
 b=JCqaxvgA/RqQq/ZG4jwMFgQ+5A490GNyKIwT87Do4KqiuunExK518Io15JCHdeQ6BHnbzDBld
 ETrc4CgcVoJDN4qmjws/T/93FwbQTGiqHiYshtxJ4xBQ4obn3RAnbiK
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The CLOCK_COUNT defines are not used by device trees, only by the clock
driver. Keeping them in the DT binding header is frowned upon.

Since they're being moved to the clock driver directly, drop these defines
from the dt-bindings header and only keep clock IDs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Add this commit
---
 include/dt-bindings/clock/bcm21664.h | 4 ----
 include/dt-bindings/clock/bcm281xx.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7c7492742f3d4ca439236f2f352e432989409570..7a380a51848ce100cbf94f9da2b997dbe3a65230 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -21,12 +21,10 @@
 /* root CCU clock ids */
 
 #define BCM21664_ROOT_CCU_FRAC_1M		0
-#define BCM21664_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
-#define BCM21664_AON_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -38,7 +36,6 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
-#define BCM21664_MASTER_CCU_CLOCK_COUNT		8
 
 /* slave CCU clock ids */
 
@@ -49,6 +46,5 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
-#define BCM21664_SLAVE_CCU_CLOCK_COUNT		7
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index d74ca42112e79746c513f6861a89628ee03f0f79..0c7a7e10cb425ddb597392939cb218545a48bf22 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -27,19 +27,16 @@
 /* root CCU clock ids */
 
 #define BCM281XX_ROOT_CCU_FRAC_1M		0
-#define BCM281XX_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
-#define BCM281XX_AON_CCU_CLOCK_COUNT		3
 
 /* hub CCU clock ids */
 
 #define BCM281XX_HUB_CCU_TMON_1M		0
-#define BCM281XX_HUB_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -50,7 +47,6 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
-#define BCM281XX_MASTER_CCU_CLOCK_COUNT		7
 
 /* slave CCU clock ids */
 
@@ -64,6 +60,5 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
-#define BCM281XX_SLAVE_CCU_CLOCK_COUNT		10
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.49.0

