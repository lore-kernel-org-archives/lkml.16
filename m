Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB141C2437
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064103; cv=none; b=Be9NxfjUdBLrgnkkJqY/PtkMeCXobRbsUOtqcMkxe0+vtlZzI1WklxLc4YcV8YnzYoBPnc0yT7lNS43EYD3lk6YlYyKtg6+CODqVWugVJmnpifynHzORczO2LNUDlI0uC7BR6HO9b6VgA2KHmS7hr7ktBqd5Qb7GhPQt0EjzbBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064103; c=relaxed/simple;
	bh=PafZNXLcYRiHf+o5MJ5tQ/BrZltamGkt95RFIeu+RTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TocrTHv1AXkxKj1jO5NdUd+HEJMdBLQI+M0EfEb8NV2edBLc1Yz4/a8iEWiIYUjE4SwRQKdNcDbXpCl0Sk6Lcs4/miAWgXa80mNmvbo4xKRZBzxl1Y6dK+Rq73vorG4m32F1WVt56kR9g2Pdwf2IiTdqt4Io0P1gTGYYLhD/1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRQWQYmZ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRQWQYmZ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad564b7aea9so300529866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064100; x=1748668900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enzMbJYQFdAK3zJGU0fX+4958E9SfYdaxnw49zMJcLw=;
        b=NRQWQYmZ6pK3aW8ludIfZf43XFMfeSP34AGs+p3R1WwWmyY57EKhdNPdmQM575qNiE
         huC6UoERyhxpWl75Kx4gG7PKJ4QRpCccdpJud7Yr1nRN/fADip7iou0rWWQafk05OC1G
         TZzkLKM8t0kknUxLF3ssfd2d4gzbCURMGltKWM4IjHjPumY5LwMROiHKUa0E/R/aQqPU
         KJ0h6npXrOHJViu5Cdk1Df7Wml1+Qis3FjpK08rfyqb2RS28bWwx1zK9YoqBdxrQCWAx
         9+3n0hb5MevSHMSNgXAVP8ryGK+qIVNPESNX3UI0LveP9J0wooY1avoiACb0HTU3IT87
         TPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064100; x=1748668900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enzMbJYQFdAK3zJGU0fX+4958E9SfYdaxnw49zMJcLw=;
        b=pZMIzZV0AoH3rgBsT7jM/IlPMCwR2SmpKcu8qzoTSWIPs8wsJK5HKF8D1a79kSsqh+
         ApQXnJg/hiAIELTgy7cABoG/HA7F4qa9srHrfGFOY8FRI/9iseu5tt35pExbxFsRP7LB
         n9jmNY4plEO8dmRJ32JCxnYfOloyEuaG1roQBLI0YRgWtYqWYL/33xCSpNPYtgUPTaCq
         qZaTNb70JXUZqRpDmRJDr/jPyTDNKqJr6B48t+Kd2GMw0ev5HlU6xTXUTCBB+S04VeUm
         mdLCRBYpsONi22JNg30eCeBn2rbKXq5Qi5p0j4OnO4vrxcZp0+jnlQG03nSZPQHW7PQV
         8fhw==
X-Forwarded-Encrypted: i=1; AJvYcCVY0va7E2QeS00RvCZ+Rs0Y7eYuh3CWRpkqFnsRA733EiWf+AdK9AP07MOFZaYVAJCUyOKR31k1V8AanxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws1SBzsACosDX6gelgNMi6h1ifylbaxiHf4zp44XAztkZrv2Zq
	r7UJndvsgBfCPkjsEGmjp6cagyxOtrzztCkQbN2m0g6sNGR41eprgLRJBqkvzT6aiaY=
X-Gm-Gg: ASbGncv+g2zMxYjCG3Kgn15hqtW6qlinqdNfW67InzHbTsMVwaWbebyDVI8w/qBfrRo
	61X0VmI4jqL7QZ/cZ437P4fa8yLYckJZibZKaaRAA1pWMWhQz9TUo+lCFZTCRA2iUzv/suv3olE
	oOYXUZoj/2twPXO16iVEwg6sVxIRw2QDa3U17+wCCQ+5KPdhaJ9KPjLlZURAJ/qhFlbZ9ei4lXb
	+c9Bpi9wFdm6woCWEQHO15OCuEhpNPL5TSVWcTTAcRoZbVCboTBM4lihiqE3kEmxzk2/mVZDFS1
	c+JlI+AI53S3xrrIQQXR0hLbzC9DnySdSSUWWGx95sCV0Nv07ZOuakGUM95vJctbgvOS9My/DgL
	nRBM6YO6ChHOhspB0kf1uqaSXAvgiACNGX8g=
X-Google-Smtp-Source: AGHT+IHTF8pgma55Bi8QUeu7CaUoHTKr21qBvP+LgCFCuUXyRbc9PZ/eQ2lz09LALMtTfl3r4Nz/Yw==
X-Received: by 2002:a17:907:a088:b0:ad5:4737:f030 with SMTP id a640c23a62f3a-ad8596d8befmr167307266b.1.1748064100011;
        Fri, 23 May 2025 22:21:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:31 +0100
Subject: [PATCH v2 4/4] arm64: dts: exynos: gs101: add
 dm-verity-device-corrupted syscon-reboot-mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-4-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On gs101, the boot mode is stored both in a syscon register, and in
nvmem.

Add the dm-verity-device-corrupted reboot mode to the syscon-reboot-
based boot mode as well, as both (nvmem & syscon) modes should be in
sync.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48c691fd0a3ae430b5d66b402610d23b72b144d7..88e491b2befc463789651a4cc7f3a658999ee808 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1426,6 +1426,7 @@ reboot-mode {
 				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
 				mode-bootloader = <0xfc>;
 				mode-charge = <0x0a>;
+				mode-dm-verity-device-corrupted = <0x50>;
 				mode-fastboot = <0xfa>;
 				mode-reboot-ab-update = <0x52>;
 				mode-recovery = <0xff>;

-- 
2.49.0.1151.ga128411c76-goog

