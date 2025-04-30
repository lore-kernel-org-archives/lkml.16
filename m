Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3252C1C8FB5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038509; cv=none; b=H8PJli/NiwSMrptPs9HcwpGKiVXpa2ljx1zAki8aRQnJva8BySBHo6sPpIVR2LvF8KnGGSGniTbvEtCZpdMpH69SZqb2rbHdDg9QviUYrFoy6TS2UiaE7tX20DUuNotX9gwljZp5tulLdiWZrju6xOAknKUPuE+KozIFm8+T/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038509; c=relaxed/simple;
	bh=J0PH2ZcN2ZDgavrC0QE37WjFKhuQ/AIOsrgiuTFEZ/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cyYHpsL9+zdKgIvvlCFn8zEzk7Wto2kIb9FLY8mNd39KZ/VvUDyUVweQd1CSutThYNAzLBcq9XlBzPH493zBRLCe7GTVHv1taBpeT1cK5S5C2pphB2ffpdvTsK8WrzsOi1DijY7WgsTYMpBpWNy1Dwd5SjLTpg4XsnftD28OBxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rtok5Xdy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rtok5Xdy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee6260fc7so3103f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038504; x=1746643304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJ/0KoQAPu739/8iZCKca6ZuzZ5mrABiyOeLc0Hxuuc=;
        b=rtok5Xdy4NlD+hmStqFNI9nmsX6GtlWZSZz1pA7877GYrmmmnUvFWeEYuYBC7nM6HH
         wT4lEOXu0S09Nje6sjdgk1EnLV5BV2c5zSUIFcadRbheb2GNR2U6tB7X0QAiZUQOkcWt
         0O+7W5QnQ0BOy0VxAJm7s2U6SoKc3zutMWH3+irbVQ/ZvnN8iEIyZjBfnBeg5JNRsKt7
         Jx33RhICP+WcFOP985wOzFaqKTkM0NKxrAQHI90xz7niYn9DxdAIgLN2R+yfHG/I+weS
         kWBpuuEiBfPCzh7MF9pR6CqXh5xAdmEo0kYPdifAjlc4kNOgt3STumruvmqfLCkT2oxW
         pYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038504; x=1746643304;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJ/0KoQAPu739/8iZCKca6ZuzZ5mrABiyOeLc0Hxuuc=;
        b=AsGLGbDf4HK/v+WM2qaMkCevy47vlSTC6VmDC7PiQSpIk/TmJ6t9h15Qkd2rhzKCi+
         7ss+AqXrNzgCMXasYWbIqwdlfUsjl9MsrPxMJqnVtl9n2dWGt+YRB5n/PbmOZyIXSxzG
         F9NbUqxMigLNl3B40YrNYM3xhwuKR0BBONZn4rJA7bmjEs+0p/1/3kgFqMh0jX7P2O+h
         JFmR/JGKPBjVkTPcU1Jlm15ZPLE50YQvX1fbusHdpms4evlRogj/RfcRqyBqoMd/ypur
         Trgd2LnT32gWoMzW1BPvTFvdruC2rjpnyjDV0gcANLjjSMBSj24G7wq2YngEWT0Sr3J8
         yAaQ==
X-Gm-Message-State: AOJu0YxIieCr3RqhWkTzcXlFOxq3dLusq+E/mi+6HbrpMpLPSbxVZ3XV
	joQlmkRAdrqpbDdoWmZMj88OmvZenvfPBvu7x5dL+NVhEqU1En6pabGMOa3HIPA=
X-Gm-Gg: ASbGnctCf0OAj+S4vQpXAtPVWVuHqez1Rprx64ryIuC+Wq8t34PsSa4q3xjXbfPrIUs
	JES2nXjMlnWN5PiUOSpPyFPmI4SVpkqTZZnS90PGEQIhzcI7N8p2B2TZeQvkINpr+MZkUYmp4EU
	8dUbkXbuKvHFe/ZZK+trS9pvG4V9YAM5wOeyo+nrPGUPT+ehJ+RBpwkdAE0judCFKGeOsyzrr5B
	EvfXIsxlRPwJ5T3IXHcebir/Oo0Ew+jUQA8Zylsx/lwyDReQ4ROzrpasjgg+KgPhRKfrLd9xMI3
	FKTjammhndinEoprCvsmDK1A0GqTa8tyawAEJrxl3wakfmwOkqHbTRG/3HEpOzSbmOUT+A==
X-Google-Smtp-Source: AGHT+IEshZk8PLHeNRJJzRxLpXBE4APsuyYljUVZ9lTsie9TDceUQEYK2pTVak2xdvxY2zDgOgI0gw==
X-Received: by 2002:a5d:5989:0:b0:38f:2ad4:6b1b with SMTP id ffacd0b85a97d-3a091d667a2mr481452f8f.13.1746038504549;
        Wed, 30 Apr 2025 11:41:44 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm17728991f8f.77.2025.04.30.11.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:41:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/6] cdx: Minor cleanups
Date: Wed, 30 Apr 2025 20:41:28 +0200
Message-Id: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANluEmgC/23MQQrDIBCF4auEWdcysbpoV71HyWLQMRkIWrRIQ
 vDutVl3+T8e3wGFs3CBx3BA5ipFUuyhLwO4heLMSnxv0KgtGm2V85tyK1NUFAzdw+jQ2Rv0/zt
 zkO20XlPvRcon5f2k6/hb/yl1VKiYNKL23iD65yqRcrqmPMPUWvsCW1EZSKMAAAA=
X-Change-ID: 20250425-cdx-clean-af4a9f1c0c53
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=J0PH2ZcN2ZDgavrC0QE37WjFKhuQ/AIOsrgiuTFEZ/w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEm7c46mSYwlJGevjpOKlMhDtEvMwHN8nWGibZ
 D7mjOWwp5OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBJu3AAKCRDBN2bmhouD
 1zwPD/97kC65d/CKT65taKsKjrpPbbV29/iIJ4lWT6Xt/VmWJ82MQ/SPTdFMMEgZg7SMVBQI7h8
 E2BbHK1c5AHGNhD40Uy3nSjBJdVhf6CQSdrAJHsacTn6DQAto1JDEwWaJT3J3Ge76mwuTmlfKi9
 Js4yQBGgXNzIg53u8sOdppNVEb52VJUOa7A2RFAe/Lz9nYFozAb4NiuBiWbBn9QZzHZZo/vToai
 zd9FqZ1pZS/XxdsQB/ItQp/sseJepiOHhdkm0vO6X/MEEs7QcHbzyg3txTL9sl1qvo1dRHXM3JT
 Gxex7ZN2CjJcj4TQqT4KxT+Y76IVVXvDWe8uB8GyE5i/Ad/KXRjw6orw8J2T3bPfMqQKrghmFcF
 uFx+cwHluoGi6n9KLUMDSLqhHWipdjhlOtKULvj/9iKYt4IX5tcNtFpLX3BJlumb/CUmO6UgpqT
 RqKaNNWhF3LYmbItNaJzTicKOslf5Re6Q1XNolKYvdcnRu1qC5zMidOrfGFG3r0ueZZFGC/UF9J
 hboGTf1KvtSMCn1wGbzDZyP42NdKmxO/b6MSmtriTNycTqpgBU+7pZGwczm+czoviwTFyNlkmmN
 awGNO/vdHUhmRIaXrzEXFt5zxWpYFSLZ7BcDlg12vx3A3lxiI3m7UDkxeCKxVVLuSeFheRL+3oY
 M2r9mcJomorkHLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Patch #1: Add HAS_DMA dependency
- Patch #5: New patch, split from previous
- Link to v1: https://lore.kernel.org/r/20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org

Few simple cleanups for CDX drivers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      cdx: Enable compile testing
      cdx: controller: Simplify with dev_err_probe()
      cdx: controller: Drop useless probe success message
      cdx: controller: Do not open-code module_platform_driver()
      cdx: controller: Drop unneeded driver.pm NULL assignment
      cdx: MAINTAINERS: Explicitly mention Greg who handles patches

 MAINTAINERS                             |  1 +
 drivers/cdx/Kconfig                     |  2 +-
 drivers/cdx/controller/Kconfig          |  1 +
 drivers/cdx/controller/cdx_controller.c | 27 +++------------------------
 4 files changed, 6 insertions(+), 25 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-cdx-clean-af4a9f1c0c53

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

