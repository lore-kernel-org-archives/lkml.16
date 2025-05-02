Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2921FF20
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166852; cv=none; b=VMh9mIO+0bjs7bmLoJonjz+QpmV07gplYkziI2vmlh0IcF8UG+k+Hci7MzQ0Re2Bgk75JLXQX+0t1PvUht4uxMlXzH85rJcULgUz5VIB1eer/HwxSV9HJUN1uxuWBN3NLpptWzKGX6WP6nYyG1E+3alkFx8ys//+2fmt93ZmXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166852; c=relaxed/simple;
	bh=r3f/ANtWfkJFfa/bdr9fvIlMOb9ghFz6WEa4bTVqwyo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L3nL9Ui2UFb54vH7sAAyxFvpHliTOylnda1t8JBF+R1Pj+5ZP6OsHICh2SCxIoIJMN1TZcH1ADAuPZziyag1Uq/T/DzetqWQclt+77X/ktYLvIkUypHJclLFodlO6r0HW6LsYCSN1RA0p51MuViJ90dYTGgkNMgbTRUMJxADXHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=moWDWT9J; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="moWDWT9J"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so2055525e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 23:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746166848; x=1746771648; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhVpSQT0TtpNS+mlUbStMqchJwPC03Ur/Ihggs+Dp6U=;
        b=moWDWT9Jf1MRWQKV3DXSFW4Kewj6BTBdwD92uS4gIPuxWQ0ySqgABfvoxbGE7ppYgA
         cXmR/xcDouMLUtMSdFa4xnVoOP++dmZs5+bdHuWNJocmqMR6Y4dQArDpTGX3CxxZoKX6
         d9l8SXo6QHRLDQQ618f7vsgBY9Yd5yqmnLIBgldAtMpUFWWuABbOKvHOSTGq0v55xlaB
         Im0sLwM7Yama5gPqTIyM7FdtkhvHd9yw4TTZqYYosB7yXuOmF/O9hJb6vvBJkvpuldlz
         zJTzMpnNLpFXArcxoGBLMfpSNlIbAM0H5UNhBHu5jPKAiESe3pVqgO9WUJ/iHz5uOX2P
         1B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746166848; x=1746771648;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhVpSQT0TtpNS+mlUbStMqchJwPC03Ur/Ihggs+Dp6U=;
        b=Q+YsHhhlAnEf6mbBkBVkxnZyeZ7yTvQiStW9/VWkzGwbhrjl3rclpx6sPz55mPK2pG
         IxSyLNzhqCq6zlrUiqhHoWUWss+mhzoR6cedvOK8pqElzhWgYRT8S/Wie9ZY+DUm0x3e
         vOrVVhFoPqYt0JoOYukKm0ebQthXrSH3HL31S3HVrgksgoPH0mKD58bQSPhPpovO8Z6e
         jGs8JfFuSTHLcjVF6ps51hNAegkkkWBIGZwztPeq5kugx8J62VoB3ZmAbv87OuRwJn+D
         ClR2/CMPYY2HZnZUEgwdUTNpky8NeJdoQBNsP2evr9mVys4RsdpDl/9Hu3HfrD7L9XCG
         sSUw==
X-Gm-Message-State: AOJu0YzX+tpTH+9B4zkAE/IBOVHQhaA7a3wQUHwKFqXmkRePPbO5tQL5
	1d7qBZTK0Xm53yxYqG6IJatyl6mXZFXmB67jHZAlq4cDSFFBLa0g4BTV/xw2HKs=
X-Gm-Gg: ASbGncsOgeuh8dKU7U/VQq+XjcOrANqJJiuqrxdU+W20qIlJK0FKWqNCVnvRf9UUc1O
	epRgO6EndSqt1V/qD+vhSz4qFuGfo7vDHjbIBXGkpsh21djM2+Y2kxdDl8C7lEUHHx0YR1mkxH0
	X4Pahki538FtnUIYcpaBPV8r1xiKqgnMYD/M51Ndy+dZ2xkKyAHVMx7hXV0kC0z1X/QyQIoLeKI
	bwNI7eB8VlX46dQhzv4rJYjWQi+Hy/DQN8BGYYaihnxlvUF+Drufaz8JLG7Poc9eSRyTVUiVKLL
	gTUemCWFoIJeSeVXwJXRstqMfdGb3+JedJbwijegS8W1Dk381OH3T7Ixsi4=
X-Google-Smtp-Source: AGHT+IGLej9D7uhqLsKRUShSLFwSYDZ7HV1ooOhvc88e0EC8G8DILCJ6fLl+LSDGXwHpxKwswyEcWw==
X-Received: by 2002:a05:6000:22c3:b0:38d:e472:e6a0 with SMTP id ffacd0b85a97d-3a099ae0084mr279884f8f.9.1746166848099;
        Thu, 01 May 2025 23:20:48 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17748sm1159725f8f.100.2025.05.01.23.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 23:20:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/5] cdx: Minor cleanups
Date: Fri, 02 May 2025 08:20:32 +0200
Message-Id: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBkFGgC/22OQQqDMBBFryKzbso40Ra78h6lizSZaECSkpRgE
 e/e6MpCl+8z7zELJI6OE9yqBSJnl1zwBeSpAj0qP7BwpjAQUosNtUKbWeiJlRfKNqqztUbdSij
 3r8jWzXvr/ig8uvQO8bOnc72t/yq5FihYESIZ0yCafnJexXAOcYAtk+mgSjyqVNSreVqjOnkpz
 /yo67p+AWPKXtTeAAAA
X-Change-ID: 20250425-cdx-clean-af4a9f1c0c53
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r3f/ANtWfkJFfa/bdr9fvIlMOb9ghFz6WEa4bTVqwyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoFGQ1UWRt9JXUyqR0J1KJpNNWPNWpeIrZOOQSA
 pJ4ofgmoSOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBRkNQAKCRDBN2bmhouD
 169+D/9a0+zmL3Godgvl8bGzKZBLuPL3Nql9uzLa3PgrndKqksw5XJqa4eehcSeyTterI4Fbq0K
 iPcbshYjrZldEpYAA8QIofLmqt2sm9NatUScj1SNeWljsjAzfo5z0JWr23gcD0CZl48sG4eYrcG
 tIbDBshYb9qH0SuqEIPkwy+V0OafhmPvhJNIixWPaSUaaaMQ/mzueiEZrBVkaEiWgPW0fbTlNkG
 DtFd42S5tWI+qQUpKSSTPnn2LLhmmobep3g4VV1WbtGmGsWG5O49fZmx5xcmGZTlANmgAhqTe2/
 PHlQnQE44hUqnd47HkAJa3P7/oRhbm773ZQ5b4MH9MF/BJrgP83oOE0bl69QpBdk5jE7Dc5ZYVT
 IXFy5SuPSyT5QvfzfpJxKo9hSCqebMjOgTHMpJyeP9V1iJc/PrylrYbeP/XGMWrtblh6lxeNA1G
 /1EBZ/0PaGASTNKRLg4EixcWWlYcbYZ9ZPGfh9eBfoQc77VANAg+tXBeNHGlrA8FwolHLnc9ozS
 CQlMiNSG1RUVFDTsYJXqAL9MNbmkgpVcWIUNL+d43uu1GLqclBH8xzXRPMKqu8IXqRu3pAadOUx
 tfp4GgyZTMvcwbLrOLYgi98PSt43qdy6o1kLJmeXtz8GP6kmprnI4Y7j9k2KJrEFcBWz/ePIMy6
 nt8w0XS+fMEMMsQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v3:
- Drop maintainer's update, on Greg's request
- Link to v2: https://lore.kernel.org/r/20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org

Changes in v2:
- Patch #1: Add HAS_DMA dependency
- Patch #5: New patch, split from previous
- Link to v1: https://lore.kernel.org/r/20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org

Few simple cleanups for CDX drivers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      cdx: Enable compile testing
      cdx: controller: Simplify with dev_err_probe()
      cdx: controller: Drop useless probe success message
      cdx: controller: Do not open-code module_platform_driver()
      cdx: controller: Drop unneeded driver.pm NULL assignment

 drivers/cdx/Kconfig                     |  2 +-
 drivers/cdx/controller/Kconfig          |  1 +
 drivers/cdx/controller/cdx_controller.c | 27 +++------------------------
 3 files changed, 5 insertions(+), 25 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-cdx-clean-af4a9f1c0c53

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

