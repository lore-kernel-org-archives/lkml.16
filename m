Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9DE27466A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067160; cv=none; b=iLPIuZaeZ9sg0tCa6qY/S+lS6vqxAuuLZD7mvcS7zVV1zS43qxcT2BD7sqtWxFBDRxivyFhFjhNY6ZmmPEQtFSAtmR0ywYXTdxYg7jCXdqAYpBDmuM8fazOSq8DBh++iRikOQDgAQ5YGWn0SSJ5zasm0wKnogk31wJQVDDpEFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067160; c=relaxed/simple;
	bh=yg/Z605KkyVU+56JZHlueaasnOvYoTqeMlYl3QzL15E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V0bJIzZ9pUG9k5dST8m7DY9TJ3rZgiLElPKRW5yGJpT4OahW/2jTkWviKaRDi45VfWFswYZeSNbf5V2Gxm0kH/cu6ovw6uz9aoaAm0v2Oxpm1af/ftXAJTsbMRDZMHp19hnWNFO2GrSWJCdr0GYDg1zKHYRoP367k6aay65d2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p8UG9Rd8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p8UG9Rd8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade5a0442dfso809016966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750067156; x=1750671956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wv5TZzXE1pnoqd59sPXctLTMd18ru0CNrepNvpJnV7Y=;
        b=p8UG9Rd8e6xg2tEJ/OQLvkHv/K0MvrZ1fxcvINZAjD95zW3RD2we37oduXBgYK831c
         tadIWKh4qxfNkVv4y1nJO9BAvmdT3PbAcgZiZTi+ot2iAq7N6dXyrTmkyGmSxkSqtBTC
         nQjf3V5f+U9pljT2MmYGztzAfVkNB9d1PYAtFOXzo/iFjMF6bNOEUHWcw2DJoXi+Zlhr
         mVD2jWR9SKRNUfJd7Q/CT9xFwn1aMKQZ3h34vD6Jje9tCElIb11evUUVs7YRG++BligC
         TbCdb6zlYHui+p5L0A3OuXafLeJboUN/DDLpxnm298ttuSMRx2IAQ4W8f8YqBNhLbzn5
         LCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067156; x=1750671956;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wv5TZzXE1pnoqd59sPXctLTMd18ru0CNrepNvpJnV7Y=;
        b=Ha1ZxwOjR6HHBMhYvSY9VvXMGFmpkdg55ynzw4+yjtOXUOjpc0/dHDGsgg5v6isASh
         xIBMaHiHFbCZcL5a4r0TzRdY7exuDrMs2020sFZr5GaE7vbaqvJnvmsjzI3dzpIkRcZi
         k64jZE3yHkehilUBjuLAzETUELV4rkJHDmqSzOO8h/xPnj3AeM7qSJwDNqWF+bQ80+aO
         KJW6sYsohnojW4G9m1CCs4XA4poIQGajfsqGoDYHoIITi/bFISV2hPcneujKHhQAWbMc
         aQwMFjGGnyXaRsS/s+leo98OIk0QxPd1xGphLDkTbs5WRQvClCNkvIVSaU/hjQcMCE23
         hr0g==
X-Forwarded-Encrypted: i=1; AJvYcCWfbrX3K0erxwKlcwL4eEf/yKPUv8vR/NDF1lrlYVNHgOHv4pfioczGPZPFM4qhVH/79K8IuyF5jQWtwZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAAegosDdw5PK9gZyLQmYNGYdA3sZcjR9re64yYBvISYgJhSTw
	bxCdWLR3tX43oTdWvXVJX+dyOb1QDPKLfy2T1jkYgY52OIsH4L9g2dsBHXEKe2Ax9gk=
X-Gm-Gg: ASbGncsz4z2m545VIP8z8Hcnt/ygKAI2/5IPRRqt/M3t3YImnze1NvmYfjNTVVHJIJx
	a5zA99hzYa5jaB+RJboMnXvjCGDnjye+5OG8ysvUhBrWeXpvHlwFUpg3J3EeOC1d9Tcc1zgI3Ge
	hpSG27jAR5gkPUnthlLXf1E7mZ7NxBBccgurhCiCK9qHm6Y5zLN2ceeqoZCFOp8Rcq3ztByz7fH
	ILLPMA8ZkZzZoOL+D6n6qXaeZmhknZRRM1G/CHSdQZQlaGM4lxCz58orjFfoSNVXGhH2pnob/jw
	qE5+bzk6ZSCSqFL+wV1qMrYY10zJpDsW40C42BcsvQtRW+6YSobotUzIXuUaQa/ZTvA54lPqDqD
	+DyVmmyd2yGXYyeO2gz2z327zApVJI3oWEDAVcyh/Hc4=
X-Google-Smtp-Source: AGHT+IF1UCCT/9hU3wi3KuAvxeqhvZuI9qbh0Qqdl66L5+wsfuS8m2r+/KHpbcCfod5gb4crjQOdiA==
X-Received: by 2002:a17:907:72d4:b0:ad5:55db:e411 with SMTP id a640c23a62f3a-adfad3eaca4mr807509666b.27.1750067156564;
        Mon, 16 Jun 2025 02:45:56 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0421sm613375666b.46.2025.06.16.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:45:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Fix tuning on eUSB2 repeater
Date: Mon, 16 Jun 2025 11:45:10 +0200
Message-Id: <20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbnT2gC/x3MQQ5AMBBG4avIrE2iFV24ilhU/WU2JVNEIu6us
 fwW7z2UoYJMffWQ4pIsWyowdUVh9WkBy1xMtrFd44xjnHmyrNjhDygfZ5K0cOxc25rgJhM9lXZ
 XRLn/7zC+7wdbt4NzZwAAAA==
X-Change-ID: 20250616-eusb2-repeater-tuning-f56331c6b1fa
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750067155; l=953;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yg/Z605KkyVU+56JZHlueaasnOvYoTqeMlYl3QzL15E=;
 b=3GYemwlBi62KkKVXr1IAcK4akalZscChQtxjpoaSKQQ1Wl5RrGQtsumLggN6/gEGWykiP3ruh
 uo1DCOtKVQJBbW5GvuxtStUCl9EdnWqu2TWea+fa92D6VCCaiMmSQJ6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the dt-bindings to remove the 'default' tuning values, since they
depend on the PMIC and are not guaranteed to be the same.

And add a fix into the driver to not zero-out all tuning registers if
they are not specified in the "init sequence", since zero is not the
reset value for most parameter and will lead to very unexpected tuning.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Remove default tuning values
      phy: qualcomm: phy-qcom-eusb2-repeater: Don't zero-out registers

 .../bindings/phy/qcom,snps-eusb2-repeater.yaml     |  3 --
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c     | 63 +++++++++++-----------
 2 files changed, 32 insertions(+), 34 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

