Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351061804A
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 07:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748071854; cv=none; b=K8e4KHtmowhuFvMhRpUZs0FfoUjs5rJAEl7gxTPhA0X4uzca2GDx72W0GE85rco0omldm/NxJBIaJ+1Yyd2JbDUSY/SZD3b8CjeAW35AVvcyi9MksPHja8KSZte/O+C0hHak753X18VcMfIaYvimX2o74ufA7b0u5um/AqE5KUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748071854; c=relaxed/simple;
	bh=2jML4/3kd5s8fLqJjcQSqvi9wZI8zPxe/sQgWxHfyK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CqH83kwkV4vfy2wru7TDbhwxXr7rVRl/DVe2EdVPF3/sx9uSSxIqfesTbzEbjN3ubXNOFpNWUV2u22j+/rlT/aCxCzBQ2STH3vZ0sFbIzHEBD68vTR0Z7RWOGYcJD6aOwvI9bvgBl3qAnnC0YHjGAKZliFV8i79l+/lkSRyp55g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vb5tYHkF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vb5tYHkF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so3967435e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748071849; x=1748676649; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPYbsFUFe5r5FajPn8cUBtZRLS5+bX15I0y2o2098dY=;
        b=vb5tYHkFgszU68yw1srb1Xx0NkYSkbwxZdTaHoPGAZSSQ1CY9Jqe9kEFtrLvPinLsQ
         EnIMdNp0rIo0XbXrB7DHZeWBf9u0ObQTASvS2yfGyha2VtqJOODQQ5WCtlZIrnrCSxQY
         MS+pdRQEWcfLWjoiS4qRPH1djzWvZ3ONBIK6dbyf+Y0Ib1gG3D7UBdA8BOZQkQDD/+1n
         +pX/d0boaLLCAkk5N+Y9kRkQOWZi6uqrZLSYqjhWzNIM039VBHNwPqHm3BXPO8xPw/Nf
         u4A2MmN3BoJgS+B8RayfEpkbjh/P7WNWAr6jjawPq/9uW/uH9Fl8ksBv4opk6fGejEiw
         rwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748071849; x=1748676649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPYbsFUFe5r5FajPn8cUBtZRLS5+bX15I0y2o2098dY=;
        b=uUBVvRCsH8EeCPevghkijnnG0Kn+8VPos95eE0nACz2WJL2nMIXZG6Ufj4aZ1ZYyGC
         zgVAGd2f/znTFvCT5wp3VR+318fTvTSJwjcwqGJpD1+emHxaI/8Gmv8XIebRx72DyRfp
         O4K3Oh2748+Vnkl4J5qemVtl/pe69fsKjGYP48YEfQfOEVZuzHf7Kdex7Y5RTYQorAJm
         KfsXFTIPELGYJxCKng7B/cee7YZr10xH1nFAFdeRsantjy7ZhUmcMtbvHlqeGdTWXFqD
         4Y738ZUGFp/8Q4hWJvyhoqjxq31Ts8aqFegX1LLM0FQIrr+W1JlhpwXAgETWdBzXeSwc
         vUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOce6yjb4Wcyacr+5W/1zkZbkUeBYL3J16cfKcbnG1jS/XLTU9mPzS5vohd+Crlkf+i/jbHJ4SQILc4d0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBSqzRu8drNLFvMWmp8LG5W7qqdKFT+gVqFerAtb6zO9CNDga
	KpH+zndLEmuUsaSC8/guBUyUKuZSP6E3j2S2Suxt1AX3t0JehILAMutvzrCgwnQyGiI=
X-Gm-Gg: ASbGnculwFv2Sb2vl3uazsiSiO7r4NQlfO4mf9h9f1ngxE07l+B2/JwdXIecwA5CgId
	qVR7uno7/0LZ+4kD4Pf29sFJP/7NRVGchSOK7o5eTgU+0J1pONAl0i3AbSRhMOz5hgBVBSlwiqR
	tJyHdIUmIqFlAdDyiF2d3L42+amiGKSGWFzcnYvMf7gX1AC7nOcECKXP6nkcpEwejIzTOG03kHV
	KL5cbaZTC/Y7Lk8HC/CfXRbcsVCN7tJejV5soLJXXjD2nei64Ev9XIbCw5Pm+Tgw9RajPn4w9ZH
	8EO4/YshrXj6j77kT81oPZwTYbcFMqBGCPbIrLTCXEfkpGvEUZq8a/RHUhiwp0dUeSD0bHULQcv
	xR3P59Lg=
X-Google-Smtp-Source: AGHT+IE9nIa3Z95Svj6jEfCbrj39rj82MmwJlGv/5CpxRLj8l6iGYqEF8+ydtTi6jSTDL0dicvuciQ==
X-Received: by 2002:a05:6000:1848:b0:3a0:b294:cce9 with SMTP id ffacd0b85a97d-3a4cb46378dmr1740124f8f.23.1748071849419;
        Sat, 24 May 2025 00:30:49 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3ca066eb7sm10924273f8f.2.2025.05.24.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 00:30:48 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Enable CPU Idle for gs101
Date: Sat, 24 May 2025 08:30:28 +0100
Message-Id: <20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJV1MWgC/x3MQQqAIBBA0avErBNUKrKrRAtxRhsIE6UIpLsnL
 d/i/wqFMlOBpauQ6ebCZ2xQfQdutzGQYGwGLfUoRz2IUJRUwqWL8SDhrHdmQpwHg9CalMnz8//
 W7X0/n6hfWV8AAAA=
X-Change-ID: 20250524-gs101-cpuidle-cafc96dd849d
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=2jML4/3kd5s8fLqJjcQSqvi9wZI8zPxe/sQgWxHfyK0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoMXWlx7vjsMqlGbR7cLc1qEzooZmx2AVmGOCuY
 8VMrGLOR2OJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaDF1pQAKCRDO6LjWAjRy
 uqXnD/0dLYPbDiWZjJRTyITURtSjSFF/LvctWlYwx8nuFy4GYJpm5AaiTF45kAWzpKe7qu3OEAD
 GSf6sxnrgT+qNsfyu4SMEiksZZFi+J834QcMcziRKd1WP9/DdJOijZuqcPq8e9zkm8hBF4TIWsu
 F80DehSiqSKKT7IKBBV5QuxEeYhTUKRZBd4eLQNfkpEKKUft6fbx9YObeuOfUDa1y+aUSl+/Bqw
 v0Gx2pUaO58IexchV2YfCDKJSJ5ZhXKjRqV80etD15B7LIDOdbif0u4BAV9nM4mZgeazfDOEEwR
 OTNIcUlx9E21Cy8Yr2NAV4ioBdCQDI7RYxcdfUteR5H0W3pJpJK+PhpbIvEYW3ylWdXepNKotgv
 jHHZTXz2SRDfoJ+pSxXqOwnN0Dugtc0xANAYqM5nOtwC3svA6CZcPkrweDlwDAlxDDwknwZRf3m
 ZUBkA5mG3PTTZ3+7HCv9Yu++KmumB12Gno2DNkYh7IBoZoANuYfc/G3PtDuzZ3UMMZ2l6bZ/vO2
 SrPnTD3yOgwlmaTAa6X5xLQc+zoeHUiJ7qAWYutJu97qNuxzts/zk3gaT0oL9iLB4+LiseoJC8x
 L7krP18Y16EncIZffkujj135CoFByxbsq+0IOQ5uAcIDDL0X3CE4w9zIL/jR9e71i2PoeTohEnw
 Rz4f6/rU0Mxxi/g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series adds support for CPU Idle on gs101. In particular it
achieves this by registerring a cpu pm notifier and programming
a ACPM hint to enter the c2 idle state. With the hint programmed
the system now enters c2 idle state.

Note: the driver patch has a runtime dependency on the device tree
change to add `local-timer-stop` DT property to the CPU nodes.
Without this DT patch the system will hang in early boot as the
local timer is shutdown. The DT patch was originally sent along
with Wills MCT series in [1] but it can be merged independently
of the rest of the MCT changes, so I've included it here to
(hopefully!) make things clearer and easier as it has a strong
dependency with this patch.

We can measure the impact of these changes upstream using the fuel
gauge series from Thomas Antoine [2]. With the ACPM hint now
programmed /sys/class/power_supply/max77759-fg/current_avg is a
postive number around 150000 microamps meaning we are charging the
battery (assuming it isn't already full).

Prior to programming the hint this would report a negative number
around -150000 microamps meaning the battery was discharing.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250402233407.2452429-5-willmcvicker@google.com/
[2] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (1):
      soc: samsung: exynos-pmu: Enable CPU Idle for gs101

Will Deacon (1):
      arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

 arch/arm64/boot/dts/exynos/google/gs101.dtsi |   3 +
 drivers/soc/samsung/exynos-pmu.c             | 135 ++++++++++++++++++++++++++-
 2 files changed, 134 insertions(+), 4 deletions(-)
---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250524-gs101-cpuidle-cafc96dd849d

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

