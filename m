Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B18201270
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746111733; cv=none; b=mR7nZmCZ+32EtJFR8/38NdSV94XD7JYiT//mEw/136KZ4bt4W5ReoKNQScYjAowREmPQLBqaaNg521DQkgNjnt3Hzn/Z4TK7v020EFAm9e5/I+lIRzwoMWz6rQOmv56a5f2MedHOfQRd79IhhPwcj9wyQnUA1BlyYhdHnB2HAKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746111733; c=relaxed/simple;
	bh=1VWijjOveKM78Pbg6yVVTbPVhW2rlfQmcQFnP8XIqZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=owgVtIMDG9BR6YcXONeW3tNH68UiqLUpkKiDpMcyOjnnuSXvhOEt6DI8AFVm+2FqwrWFCDq/viDDmrKq1b6xWZLcP9Vrh/BpRD6ej1ReQ2o4iZTrHMdqRNL54TZjzpJMZRmE+1YBmTfpTO7pXwUXHA5udV2NPVm111txT2M0Rhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mStVbJ/2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mStVbJ/2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39127effa72so15159f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111728; x=1746716528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttrcVZYlqM0kZXU17grb522rcBK1Mj9yyOBAh163GPk=;
        b=mStVbJ/2begK4HcerftuSeurs0ZKybz3qaKT6KR9c8YFyfxtBjjtJFUxBhQZN4FF2t
         2ABBiw172fAVCRdM7klQ6LTM+0pNgpKuScRHhpcKgkDpJN48or7LKLTMC8c8jKafSZBT
         6aOsIdzRrRI7x8N+iy4bZPpQcA0SKEa2TlUOYX2snLZ3iBh3eUCCfopq6HsRmAhaibbL
         oZlgz9jnkseTa0l5FRa8eeCnW+q6ecAVYhxRPjCA8xn7Om27ZtM6DA/L9Iv/sW0gioX2
         +zLCOkekQ2hNPupsWkeNhDJvX6otHl5MdrVklFfgBFd8xVMT707pVyx4uL0ux7MBJNRP
         MVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111728; x=1746716528;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttrcVZYlqM0kZXU17grb522rcBK1Mj9yyOBAh163GPk=;
        b=s8c8E6hNKkwRVlUKMOVILbYiASozqoH3Lbox+xWQJCPiX2Mu5IgvKJ9BQrGQquE11D
         X+wynhfMfxUKfEzx/D3n92gcpLYs24SoGErr2N8jcO9XsWJDtWjFz1/G3CDCNwfno+Eh
         5MohekUD79PkMHM5mp7rzshfwpsmKibBnDqjIERhICete5ZxmXYekZfvOZTRR0x4woiw
         GDNO7a5mlLGzOz2diDzx4eQZhbaNk7/PlmAJjbo+ETgVERKQl2A2/mifeWtNqiubN4pp
         kHulewJGRlb39alCNzkeQoA00HYGBbMGxka14g+EZ1QnYjowrupyUDe82CJhkXHI8Ni2
         HMuA==
X-Forwarded-Encrypted: i=1; AJvYcCU9m+kx9VW0F30lMD5pBmiS/SUDJHSuoPyeEJEVtTQ4r+/FBug/h0ss/I2TeaZ4mDn3WHTLEFbYr8sBQLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOmoFdaKjfaj8rtILSYj4IKcrgDZb+9zCfgDVy0hfVThDFSGn7
	WXqJDFjYRU5oJk13Gg5HLDGq+tg/ULHf4NRvjXpUXi3tVw9VjCtwIoaG8TZ4dmk=
X-Gm-Gg: ASbGncs2fFcQlmS/KFhpS71gVm5QCscpJiy2qsSqUh9+Oo1u/hQdjjIIo37XHyhBURI
	30EZIWn+nkNLo8uHLkmec5nZ796S3Erd9yT2fickCtoRovGTctUoMH+o59Nl+9dHULMoWRb8i++
	YHNHRuMMHyfXDQfz+XFLV5AJYMgIyOZA5PLv+l+rwOkBIHOrh611BV74M7I6lHGtKLWftZ0I6VD
	2nfHa3XfWwf5PUZgTqWnyUUcHWUaeOK++3ta2QTB+I/hT7wgYraO6UwdGMC5mthLDiD771orGs9
	piPSe8zo97lPbVpVQriwnAnzGRZu0OHg4Nya2YU3x2yBcJIxALeWdReCoZM=
X-Google-Smtp-Source: AGHT+IGZ0ehud/ximXE2CMIJErpM4SI/FhJUBgX6fJOCUs66uW5nSEtDJMw+MUC0zHgypjkuk3SDZQ==
X-Received: by 2002:a05:6000:1866:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a09007e244mr2089279f8f.12.1746111727129;
        Thu, 01 May 2025 08:02:07 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4702csm1033190f8f.40.2025.05.01.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:02:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] spi: Minor smatch fixes
Date: Thu, 01 May 2025 17:01:58 +0200
Message-Id: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaME2gC/x3LwQpAQBRG4VfRXbs1RoRXkcVk/uEuDM2VlLy7y
 fLrdB5SJIHSUDyUcInKHjNsWdC8uriAxWeTNbYxjak4sm7unFcOckPZokfru+Br1JSnI+EP+Rm
 n9/0AxdzydWAAAAA=
X-Change-ID: 20250501-n-smatch-fixes-2e9e6d8fd3e3
To: Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1VWijjOveKM78Pbg6yVVTbPVhW2rlfQmcQFnP8XIqZ0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4zple8GyUEoL6IZq4zjpqAic8P29xT7tLZY/
 oehltltRHeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOM6QAKCRDBN2bmhouD
 10owD/9FVZ+pJ3mQzWF33wBIVcZ98/gdePGTPJk3U6ZXnM4XdSM93A8EysytmRSKp7mhypSC09S
 FG1Wog7SPakZpceFVwWPPrGY2hKwztfjXSqNvvBc+8dZrFaSEWCfcDXQbj/U8stZYVvLnWn2n+M
 ePWBE9BgqY4tVnCYizR8Ly6Uz4vq8Hd/oonDUaOetnq0k31z+QKYnGXL5MYWNJmVaqadmvjOHie
 hYusnzCyascIXdMkQmABsoD7Iy9WYp3xqi2jEk2Z7FrsHT26YGL7QlJei96DEMbhQDn+D8g3oJD
 MI+V1U5WUI/iy+w+1Y/10hyKKJocJDHxkobU93xbfHaHcJkB8r9of/gU698FNKF+Lh/b7WY96NZ
 zI7PcXajVysujp5u87R79aAfMiB8YZGZ0+gHy7vU5Q+ySZO2e9jGenhmcyYk1+zg+iL9mjK5fe7
 J9UUK1JDjVstLr133cuD1nGE6Sw7v0IgMS4aNWFpqvRaVMcnNE5/cB/TilOQGRX+TLUJX9QzSpC
 OpyD2tAVGgC1kI3A6okSAkKk4B7c6ZtK7Nbvd8lpdDjN8GZzoSJV07M4Ym4+7PK8ZwK+KFXnA4X
 si/kVQaqYfcvNnfJTrn7Lb0S+Q9BAXayQixDMKbVa8YjDsHsPbI2vn87cfFbihe7Be5gkOtN1q0
 4Oy9BANH0Pd/Djw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just few fixes.

Changes in v2:
1. IS_ERR_OR_NULL->IS_ERR in cs42l43
2. Drop patch which was already fixed in the meantime by other person

v1: https://lore.kernel.org/all/20250104205437.184782-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      spi: atmel-quadspi: Fix printed error code during DMA setup
      spi: cs42l43: Make handling missing spk-id GPIOs explicit
      spi: cadence-quadspi: Assume device could match via platform

 drivers/spi/atmel-quadspi.c       | 9 +++++----
 drivers/spi/spi-cadence-quadspi.c | 2 +-
 drivers/spi/spi-cs42l43.c         | 4 +++-
 3 files changed, 9 insertions(+), 6 deletions(-)
---
base-commit: 6b7e080d43429e85b40355986026eb69ef775df9
change-id: 20250501-n-smatch-fixes-2e9e6d8fd3e3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

