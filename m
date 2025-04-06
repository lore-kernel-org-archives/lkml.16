Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964D741C71
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969027; cv=none; b=ea4cCmW+WK8ycQj55DzZHFT5J76Oa6efBwJQgrbkOckFAeMrbdlkVJEM4dQTInGC3ZaNHcuUZyZ2f4ReAaA708Ty8WjSf3H2qkFFY8N5UMh+PPMPiijrdPnYag1cpVnCRPAJtBDtU7uXu/Z9QWfYIOXvKa12zNqCbi4rSOTzrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969027; c=relaxed/simple;
	bh=VyGdiKrS4XUqc3JfCMhd+aDYYtmmzvodq0k8kmL/h3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YCYrIkDnI2gVQXhKkBpChDGF20lnnMrhTijESoez1IvZvsEnwYsXf7DBgFll5qSpxhBpmVLR12NE/FCd9cUKM0X7K2lDGD8ABO9qRSCDGxZly5meyaKA1XmZNDcPcJavIfGeIziJJGzC22mcmJK+vhlG5illeojeLMU40/YMoVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vneop5+K; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vneop5+K"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913290f754so444657f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969024; x=1744573824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeSqmbRMd7FAcGxEkpqJ7+o5KOI6K4uKw7Kmco+pkWo=;
        b=Vneop5+K3pHqt0Ms32gmaQxH1UYpu2QT6TktA27V3F2U2kxC7lrmagsn3XPMxf/C5R
         G+/6rZTu54AfkF3RJmGgmqJT10RxwkKe3esPzGEI89m9zNE355KczPFss3ycllU0gCpl
         311nBZHGD4uaiBIsRBCzY/uOKSZmN7OUfdKIBmGOvjCTc3NuUGX826b39Fk5dEmlVekp
         64wLm8xK5rdUD8U3vdSlbxFjo/OZJ0HiBL1Aa39lJotfQuGpT4c66MyikJkSuXhNFIFI
         bg+MbiEHx78UhyxaZ9NbycMLvH6fuoQxn15sdWiPFALXizRH1TVJwm/2shupjK0A6oDv
         sW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969024; x=1744573824;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeSqmbRMd7FAcGxEkpqJ7+o5KOI6K4uKw7Kmco+pkWo=;
        b=vKKbSKoVxS5ZyvQtNJLBoeDoHupuCtVp3CnXJIaQP+2RA7nUS3hpXNO5l60bTpoJtz
         By8WFI1R1k02nJ7MWrQGdVnYwC+T4JEnOa1I9ogmMQUJRJiMsEFJp6rbIzVNqxbz2TkM
         t9sdu9veyHXcGNxr2W6ygtYcbUwG3O/5px9E8Rjepiaq2RzDcw8pucZGKep9DxJrxk6o
         tNqTPV6kIgDYIlr87mQWvfrjSqfQ6eewUtq9kJtDFrA1RcBR3UdHW5OigNSVIuCIbZyH
         9+CA+zTEcrwpRBGEoyjapUlPMDEvb7Y8Zuytc/GhtCGyDceCEREmx+3V4j6h0djVb6FT
         lKgg==
X-Gm-Message-State: AOJu0Yw9pUFI73I3rYD5TjP5X/4J/NAqnyRGWb2wr8gN0T6jfR1BqYiu
	Wl5jSZGtlgOdx9lI+ludBpeqUsN0Z8R30YIiDzf+cr1ynr4LwWTu9lS3iZLxMWQ=
X-Gm-Gg: ASbGnctzMKCPzALCtzYeLMMIgrt2NgZZ/NwMJMA6QZVxvmiErIUkeXzJSEQDJYMD5+t
	5M1woBV0MHUs7mtPGbFMCtD6ayblpo5JTND+/FeRIo2btKmG5L1CWBP/c6kv5bf+z05MyyhHj9+
	6kv76uIKC5oAKEC4FxMFrmGgApUzNUxRo3zAz73v+ko33lLIM+tBR965Q1YTD5KTaDroe7jdxHJ
	cHp+ko3UED7S+YhwF9ZwKsIYdpJQ1Q6pMxZAUgKJVLjs74At1QOPqLlLBED0pP7Tz2jgiHaOcWM
	xtSCKdH2/uDMu43bqVIsi30W9vx+55Mf1vwzUYS9E/59c8Le4rNzfQd1JnIua2rTjKVZxXSbiA=
	=
X-Google-Smtp-Source: AGHT+IEQJBuuorWHy6t16RjU3wja4hwTE5P0PZNYO4s+k8FV6tYMGpmeqiXYjqWfBjll7mALW4WHfw==
X-Received: by 2002:a05:600c:3147:b0:43d:77c5:9c0e with SMTP id 5b1f17b1804b1-43ecf83e90cmr31081595e9.1.1743969023560;
        Sun, 06 Apr 2025 12:50:23 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/8] mfd: Fix wakeup source leaks on device unbind
Date: Sun, 06 Apr 2025 21:50:08 +0200
Message-Id: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPDa8mcC/x2M0QoCIRAAf0X2+RZUKrJfiXvYdK3FMlHuOpD79
 5MeB2amQ+Mq3OCmOlRepck3DzCTAv+i/GSUMBistmd90hf8xIBhiJ7xR4nTUvDNlJDclZwj/zC
 RYNSlcpTtf77P+34AJ5K3nGkAAAA=
X-Change-ID: 20250406-mfd-device-wakekup-leak-a98a99acb1fa
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VyGdiKrS4XUqc3JfCMhd+aDYYtmmzvodq0k8kmL/h3s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8trykqvvP0MeExx8f7I2VyTLhDDfbkcKeZUnr
 /Q4x3sGCU6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La8gAKCRDBN2bmhouD
 17lyD/9YZdvMvrNO7nul6MaM+6o9GIq2Q6sre+/2sscOZcsLadYoeU8DDcJsd2QBG4eafOS7Glu
 YAaYdyQos1LmjXQ8NwWYf7WGvk2p+gCK44Vj9S1rrwXId9TKUGj9iK5OtYgCU9ojNHiRSpZHFMW
 5DiYtJ96qJpo0EM+8ywVXI/i/Yx8TF5wBCiY2gHLWkuVcwyHmvbebmWG+fK5SK9T0r79+k/ov3a
 xL2vS6lHjPZ8oPABkOIye6ir76PcuVLMdwPA+bnTrCEw9HK4s1Qh1If9rLq1wJMwkdle1WAonlo
 6M9ZPKyHMEjNmef3BmGYpzCN0cGdaT4mMlGyojyoaOJO1BPdykihJqTATaBvtMzp+3z3OU+gi5g
 TBysuSNWsdIA8qwSw2I+BAoAxh/NUZZOHLN6uE3bznoylVJJ7CcHLjg38XNyLIpyhpUtjkzjfFl
 bzJ9nu9EWdsRgVq4WmMgBKua7MElTTwX0+cxqPi173hJHys4jYzdoIJTQ7UGApugSC4Ee912OI+
 wYn4qx7SIoKwHXEvFJiDejHOzaopA0Z2WxXzYUGgSII2oMnZTt4MBPiNTXrPzzA750WloqOwsny
 CvXFO1GBV96WVCPdqy1+chcfTjlrrKE1Hhg6JBCyC8huY3eIqO2PltKrxXgYaRTc0PFgPwafwZB
 NljYubvzHADQTDw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.  Use devm for driver already having devm interface and manually
disable wakeup for drivers still having remove() callback to keep
consistent ordering of cleanups.

I did not update the drivers with suppress_bind_attrs and no error paths
after device_init_wakeup() because it would not bring any benefits.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      mfd: 88pm886: Fix wakeup source leaks on device unbind
      mfd: as3722: Fix wakeup source leaks on device unbind
      mfd: max14577: Fix wakeup source leaks on device unbind
      mfd: max77541: Fix wakeup source leaks on device unbind
      mfd: max77705: Fix wakeup source leaks on device unbind
      mfd: max8925: Fix wakeup source leaks on device unbind
      mfd: rt5033: Fix wakeup source leaks on device unbind
      mfd: sprd-sc27xx: Fix wakeup source leaks on device unbind

 drivers/mfd/88pm886.c         | 6 +++++-
 drivers/mfd/as3722.c          | 4 +++-
 drivers/mfd/max14577.c        | 1 +
 drivers/mfd/max77541.c        | 2 +-
 drivers/mfd/max77705.c        | 4 +++-
 drivers/mfd/max8925-i2c.c     | 1 +
 drivers/mfd/rt5033.c          | 6 +++++-
 drivers/mfd/sprd-sc27xx-spi.c | 5 ++++-
 8 files changed, 23 insertions(+), 6 deletions(-)
---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250406-mfd-device-wakekup-leak-a98a99acb1fa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

