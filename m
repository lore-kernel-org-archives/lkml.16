Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59AA145A05
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970613; cv=none; b=NivjgwQQJPhAyYY2sbCtrkB8TYgWo9iUO/jopyq4SzjYREiaohatx7MRspm0Y2PcRemZwM0Z24e9rGUY0rBsFUXs324AlsvNkaZ4qvBxuXxjL1ynAPI4zDgymhLUv/v6mVdEgeER29VBQoTEOZLKQ0iNy7TJZfevc7XtfGvaBfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970613; c=relaxed/simple;
	bh=IynFeTWu2RIJzXLhbEL7Bz8oQAxmTkOW8hpdmpazhoQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s8rzAT5nSIEvFuhcXmH3rhldEaBM2GFknWsqxCQB0anwDd6oDncDCpcmzC8yF5Att7UcOA90cQ92xYwu/6trohSjNDrOK0m/VlHe3UYUXYFBSM9r1HjkbzYyuzH2D4GYaxewinPCt8M7gwxm+fdJc52jl9rL/nltbJp45HS2Q0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRuDVsMv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRuDVsMv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39973c72e8cso401707f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970610; x=1744575410; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dVyzSn8fSeihotin2QKk8FRBWW/ENbboLn0/pECTQU=;
        b=RRuDVsMvrZi1kojq4+yaJST+usXcde29sGmJi67LgMHvQR+MZsdLLjTewfvxddtS1v
         ryusXwuqto5W1NSfhV692LDk5qMjC2T+MsswbW/923/gCCiQFdNMQ24L5JzUdGMyIJP8
         YHxZi3g7H7rG12Gr8MlefjbLl9owvnpHeElLmm3z3HLfCwsR16cDLWDflME/zr4aQtTR
         g9cdg4MnypzuVCLa4314aZ8v2xuzUlIrVr7hdCOvZYrHUWRJxaipa1zEQCZvBPXqKH+w
         mapG23oNCxEM33ZQhlK7T0/1DcAptJOJMwyntK0SxprHhgIZ8WrpwLghPDyGp8ae/OGD
         UjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970610; x=1744575410;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dVyzSn8fSeihotin2QKk8FRBWW/ENbboLn0/pECTQU=;
        b=FyGRV5ZGoeMUSmVBR4XfOAgUeGvLkElZI2L01R6ROyaE/Pp7aNi+QRqtpt4N2Ov/k2
         fMt9OW+pS/OvRdwK/EuylXRnJb0M0JsqhWUCJf7XbVPR2xK2KjHtsET8qfk8lgU9bCfa
         pGyyGXpX3eLQAegZPosMS7vF4tt3IYU1Y8Ys1QXgwoTH3qwqzXthOXVCg3dtmLWzpn+i
         ZPZM/jjX2DggUqv8I/0nwv4mVoriwZY+5l54542uKPeHbUZZW7KDhhSfQ1Pa5J5y4KQW
         vsKud1fLOjJAmUR56U6oTcbZG/ZRCN/79AHNsYyFfPb2MX0y71C3VppR4tpxmdfQERYR
         yFPg==
X-Gm-Message-State: AOJu0Ywy911lNWN0MAvJIdSBRiGXyyW7P8x1Qf4/fyBKlH+k0QXJdXKq
	FLCfUQ3ZWNPOzyOUjauoE9gun2hXRwVXgJI4wCycfKa1WGl15oJq8Z/LXOdf+yA=
X-Gm-Gg: ASbGncsOqpa9p6V4OrXizjH9qsCj7lb70CaXOYWd6/XOrU67vFW4O9eoZK9ayjV77Fz
	Q5elKcQjOGelo8NzfkZr1RYvXpkp3aqm+3Aezfrq297XY46xAwM+Q9Z+Gpwly7+gsblMl86j81o
	p+MI34rlvgtrvOwbPQDrsHMl/TfFsgIaBtei/Wy1FNbJTnOsLNbirx9fxBKrfNRE074lbwqyOnm
	on/y6bs3Q/PCVifWmLJgM59bVHOlGBTpISUEnyMyN818vFS0Xq57rjbbBtXcXezsdIUg+NE3olA
	WH13BAB9xobagpWk/yXNQKHHCaTeUbEoG/qMWh4l1K1kRyrZEeV5qtTxn+k1EC8=
X-Google-Smtp-Source: AGHT+IFiIpvcOwBmgVnnknF4d+Z9EAYOHluJwv1KXZPNLWgwlIX3qotFRPLaaIcIsJj96kA9woECbA==
X-Received: by 2002:a05:6000:1ac8:b0:38d:d743:7d36 with SMTP id ffacd0b85a97d-39cba936342mr2974149f8f.10.1743970610172;
        Sun, 06 Apr 2025 13:16:50 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d68esm10295521f8f.67.2025.04.06.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:16:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] extcon: Fix wakeup source leaks on device unbind
Date: Sun, 06 Apr 2025 22:16:38 +0200
Message-Id: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbh8mcC/x2MQQqEMBAEvyJzdiCGKLhfWTzEpNVBiZK4qyD+3
 eCxoKouSoiCRJ/iooi/JFlDhqosyE02jGDxmUkrXSujGvZZcuDDzvhtvMDOjHN3a2DvKm+Mbq3
 uDeV+ixjkfN/f7r4fZ3n6qWsAAAA=
X-Change-ID: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IynFeTWu2RIJzXLhbEL7Bz8oQAxmTkOW8hpdmpazhoQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8uEr9D66aedCyUONRuEkOeAuxZZK90QD9AfiM
 Si+GkPkgZqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/LhKwAKCRDBN2bmhouD
 15wGD/oCr01DUByCd9GYdB92Iq8CCUYdDMU+GQBupswesIlUU8J/2WxoPkr6Ka2bIFMzYCXTJH9
 yNfJShPuVZmnFh0njAuNjaZhZ3s9Wo/FIIgFEZXqiAVxeZasx0E1MIcX3vN8C5DKwJ7bdld2cF9
 zJc+e/URXfrL37O+nxq2J1jKH2bTz3tBfGFLr2CxzjXvBqQZFN4IM7vkLR1rN16uqU5wX8d2Yje
 5k6s+P3XClnFZQPAstYNa6jeIOTvHcZP+jJrNUGngNZDeS8uqdZQDttqRDAkIDdQp5HhsoTD84C
 SAlM32ipHYy5ZOz4D/PEFgQRotQA+6W0IDmflN1n/4HSctjbhKtR5rWBsKeTch+r3YTaDShwiG7
 NZEtLN9mWBA8hfKc7XJOzA0ibe1pvJSLhi5TqS8/GqiMnvwpINushLp3yR8mvEoB7vYA6u7PA2d
 F3IosXTD1o4q4r8vzuy83isq2YNYBQN6QhVdX4s+YlkEb5JK9VFuHCBg0oQ7a0T/FJAGXUz0oY3
 gbjgpZoCHWEGFinaYG1yUbZ/XR43auMmRVUns7WfeD62z+x4hIhPFVYXsqr6HbZRKTfvFZg4b4S
 Zis9yUOKHTDBWAWf8SUrdSjUatQ7hXRSwRm3FjgaDxrCf2xdCAKh9SjUi7QamQWhNmnK8Ju8R5+
 N9npqiP7DAELkbA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.  Use devm for driver already having devm interface and manually
disable wakeup for drivers still having remove() callback to keep
consistent ordering of cleanups.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      extcon: adc-jack: Fix wakeup source leaks on device unbind
      extcon: axp288: Fix wakeup source leaks on device unbind
      extcon: fsa9480: Fix wakeup source leaks on device unbind
      extcon: qcom-spmi-misc: Fix wakeup source leaks on device unbind

 drivers/extcon/extcon-adc-jack.c       | 1 +
 drivers/extcon/extcon-axp288.c         | 2 +-
 drivers/extcon/extcon-fsa9480.c        | 2 +-
 drivers/extcon/extcon-qcom-spmi-misc.c | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

