Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F41DB37B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876001; cv=none; b=eSAhr/zdiOIn1jQAvzv2THSIkb561yLlCgLg7tByj4l2mb3djZ8av1O0Jc7/VoAUK2d09K2vAqWbXmCqft914BKQmb8dmwQ4xR/rRHaAH9gtrJBH7RVwRQX3bjWaG7bUCJ/yX1Akqdawujfv+Jsm5fAmYNv9/m1etipqkC9NWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876001; c=relaxed/simple;
	bh=Eb9cXVsuOC4GbThMc32N8q0N/L9WglE/l9ak7PMRhw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLnO+dnyXUNKNtVRl7+SC7j0YuzgvrO9cbI4ASrVUy636NKRuFW//VJfktAHqZMk2GprzrztTnIYdEcmn+27YMduRHZzyPN86fyPMa3QzgPNBI4EitBjuRxoAkcTH9ViLWyu6+R+L8N8ADhMvY0RxlCnIaMh0Y+pQWJ0rF3C2cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzmxQ+nX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzmxQ+nX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so15925f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875997; x=1745480797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRtdeaVuk9B5XsngdQBqU6+Uwf4/zyBV5nrkNqEVjA0=;
        b=bzmxQ+nXQ6yNMQcs/q1cuW8TPGvQw6h8Q2KxjWOibEdfhKuo5Ph3AI63wByy60rfE6
         oBZa1YW4qZx35mwxHJjB4npNBiUNjU0ce8LXvxN1JHOg0e4ej5tSuPZ/5vhgM4mOchV1
         kixzmkiw0A3XzSkGS6uD4fWTjr3x3ygSZmqS/smzFMsvNb3mmO/t7TjNmCqeKh1eeG35
         aZ5EuzTk3buVqD7RJVzdiYnOmsJ3Hv1/gsNsPtRVIH41wkj0Pmyji18o7Izvj/BIAIyK
         ceVCxVK1G4irBd5Q6MxjbCNcg2I5escT0Mzzp0JD841xfrO047W/5AEC10K/sZn4cgzo
         vy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875997; x=1745480797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRtdeaVuk9B5XsngdQBqU6+Uwf4/zyBV5nrkNqEVjA0=;
        b=Y+nFgrM1TJOcRA7uK6UnD4MDUTAPj2+uxf7VRmcN3qG9Kg8YIqj7iuYp2P43T751VM
         A33RHAN2/fmg6HDVMc7Ez9XOVUNw/EpJUM2Vnjk9lUtXxoA9O9JgTVQhNmyqz4KaWsFE
         2xuCKtPU6QeLNhsg+7lBlfNFReR8zsPHF011UjV1NnzpdcLSVD75pD/XVasZ4nm8HtMO
         bLA3CfD9B5G/CREwWF/LfPhruuR7+VlDtQBFJU8o/k5+BJE9CD7++tkHoMaoCtBDM7N4
         tLZgNRolJXN9iLq/2HkEmFThVzFIQHHq+aDlxs7aDprJSc8iW68y1W9VXUeyub82K4IN
         ElPg==
X-Forwarded-Encrypted: i=1; AJvYcCXfIwsqVbx94M15KwcJh/MqaBsCkyF/YIQlKt5GmIhuBrw1j8ScZbStnWkEtkjkXes/m3mSyxLMVaB6T2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DTevnbSI3VOUTYz8ta2Uhw+4F55e7akWK8Ow9VPjDspeN1xa
	Pj8PXeWvafpe0V3WoLvtL4h8G2jST2nPgVlCwek6E+NwLu+pEQRDCASMqXhRoGg=
X-Gm-Gg: ASbGnctZVh/yvR5HiMpNP/W9WUyGRmQW1NqdJC7WMd2XlR/RVXa/nyr36NcYUSuTk7S
	Lybjm1FfAsxN2BNxmRXGV3wXhJqO6DfG3cyW+Y2JMI2Jj5GpbEXaZ13QjDkQQ7ZiXw2o/oCHJX4
	5y/RGW+OARAKTFHKsCc29+eeupP1ifqk6HmDOGhEftvfS2v09rEZU6VVddbsg0X0TSLsMh5aV1x
	RmX5XlSegVFeWwKQHnoYZnR1je67F3dHe96X5yub85e+ohdb1DLtC0VY9SJqVQaqT+e29CGecXj
	c/M7ylFtz5XHmUAY19v4pckztzMwfuotJhw5uqSa+V/3wWbgFxRi8qCFBWEydtrzkrFPFcKjfd8
	xX+bDbg==
X-Google-Smtp-Source: AGHT+IErpFYig+5USrElsn8/GLitcKQ8MpWzj97AV4tWtydIWiChjBtijhGr4jx+hlgc+5rmITX55w==
X-Received: by 2002:a5d:6d8a:0:b0:38d:ba08:dd64 with SMTP id ffacd0b85a97d-39ee8f2ced9mr726282f8f.0.1744875997580;
        Thu, 17 Apr 2025 00:46:37 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d12b5sm43332595e9.10.2025.04.17.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] USB: host: omap: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:34 +0200
Message-ID: <20250417074634.81295-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index d011d6c753ed..6dedacba94b3 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -225,7 +225,7 @@ config USB_EHCI_HCD_OMAP
 	tristate "EHCI support for OMAP3 and later chips"
 	depends on ARCH_OMAP || COMPILE_TEST
 	depends on NOP_USB_XCEIV
-	default y
+	default ARCH_OMAP
 	help
 	  Enables support for the on-chip EHCI controller on
 	  OMAP3 and later chips.
-- 
2.45.2

