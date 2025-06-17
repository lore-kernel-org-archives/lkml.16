Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBE51E3DCF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148813; cv=none; b=DGnOAYBDGvcOsXxU94PTIIahQK0Ws48nDFK42ytDsSWb2d07Dbs80EMBD6ez+WjGA1jT0hSSuaCiN8MYoPhU5LqK4nM01vTBWc1PHcfiViC3hMe2m2W0IG1z2djfutIG4MqAIBXgaXILZwX08YEVXkn153JswzapcoaSp3ttukc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148813; c=relaxed/simple;
	bh=NLs+qWJn+ZP5DPsry/eRPCLoqWTcxBnwPUA0+ZFuPm0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PI31kPCQP2XjtE6FNyo4HXrREEDugPEzipCEdpCXsbR+uEoGlEDGgdJlA94czJFoITOwgW98nEDhiFUKAJTtKQ7SLUmDxfyh7fqSgTYB+QldZYD2G9tETgfNF7s9uL6hxDSOUqOmzR7YOGB7kOoTHyWtpXbgzJkxYNU/oagYd48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SR34BgGP; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SR34BgGP"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-ad891bb0957so964859266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750148809; x=1750753609; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ha51G6QljI8TE+htVqSGE/G45ppcBa69RDzMvs8Q1Bg=;
        b=SR34BgGPKs80ccdXZrqwNV10M6grPBV6sdEVTos8wUMwh+Xm8LMgKIx66WrTA66nFP
         Y5Go/LeNUtaE/K9OXzs86ptEKAbSECxTVuhbgzPt/3AghiwbKgg6GCTP1c6OYQrXAA+h
         vgpb9n5CrjslzZ8aP2RJKpL7pMSEjPBVxhR2zco2tncRo9z4fEhIJKYEcdvEGFSEWWKD
         DG8LeJfg9jrVTEqJTv8C9DYuW5L5pufDbOQfxsRbzvsc47GGf0fObzODYqSUWrRxSXL6
         OPiMeGr0HGgZmgY3SuaqPVFc6n1CoEu438/lk/fxatW/T49jeA8IY1XQvz1WU2MUUMl7
         LYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148809; x=1750753609;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ha51G6QljI8TE+htVqSGE/G45ppcBa69RDzMvs8Q1Bg=;
        b=sW5sYZ6xQU8lBBGoliUOg3jn9hK6rAJ85ch588/9MIzttDiYl4Reb25XWIPcPUvBfC
         5baCLFIgyS6RcNm36f88IYvO4EVBbuLWOdUw9JzVRGxTDFBxjfowd6l8ogXRejCaWWJC
         z4K0HStTan8wQhzZmNzUqI/UnOCprNPTi0VEMB8XB9/I1RTrPS2xv0klqGwzq1pE9BOw
         PW0EI+/ozSQrftUH/Wu6QVyrP5YVErfz3cXRVDUK8KglMef7UEZEO0+J0PmXmatmfas7
         6TMjUk0J2+OwOfC8TGWfoGlnktSjgi2TKfpOK7OABumtARtEAus8K2SCCQXLCb2vnvFn
         lbiA==
X-Forwarded-Encrypted: i=1; AJvYcCV0goYZrsKK/Sv+4H/DUNC5rKWNoahMo1mumxFVBtJufLCfT3Rf+PcHhGifk0jbmu8qO3eAk1X90TNJTmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkN+J6CpPGqcHQYS55W1Z/kx1yQbMhm2WRwqnlbRl7kZwBIjU0
	hX/fEkGyPjaFKD159NbrANfTH1aR1JQXUCw/W/2NiGgzUQ4xzeW8NWYet55pv0nWsN8=
X-Gm-Gg: ASbGncsKLDGHkf+RvOfzC4BbEMWTOZ79gUFr+EA/WV93XMIdCd/M11jNc/DYnoca6da
	4DyL7JQ0rq3dw1KU/mTjBdIb344loRzaKYmqCvMxdQ2hksAv9OZOcQPVTzbpZ38XCfCoupsG51x
	I6g9OBbIYzOG8WoDLkLwdaTOiUZIv90tmEu+e+OnG/VoeEpnzQXlr8ErcX6HCRuQm8jjbDnhdJy
	QK3mQKlAyONPGSPPBsATP775zFTAhFggVimvRHXqlFtaoG/dH9Z6V1bE5CNQdbmfhmhtFNwRiel
	Vf9qroofawK0fMGFYXO7QPtDuqEMmr6ZqhKiOFfrpjcIS4IW/bYZ/7fija1CeRwCZdKOUW1KwMY
	r5/PKwirs4O0TRnpKHk5gimr9iXsYhX0f2t9IyWoa68A=
X-Google-Smtp-Source: AGHT+IHaLMRID3hoXAOduWJ6WVSzCTc3PiOOYPbCMGHsJkWbLuGR1uhowGvy7+2zgZveMdkL4Rhl7Q==
X-Received: by 2002:a17:907:d78a:b0:adb:3509:b459 with SMTP id a640c23a62f3a-adfad329678mr1353406366b.19.1750148808949;
        Tue, 17 Jun 2025 01:26:48 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fd993sm840343166b.94.2025.06.17.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:26:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Fix tuning on eUSB2 repeater
Date: Tue, 17 Jun 2025 10:26:34 +0200
Message-Id: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALomUWgC/4WNQQ6CMBBFr0K6dkxbbImuvIdhUXAGZmFLpkA0h
 LtbuYDL95L//qYyCmNWt2pTgitnTrGAPVWqH0McEPhZWFltnfbGAy65syA4YZhRYF4ixwHI+bo
 2ve8MBVW2kyDx++g+2sIj5znJ57hZzc/+K64GNFwvriHS1FHj7hRYpjFFPPfppdp937+dt31Bv
 gAAAA==
X-Change-ID: 20250616-eusb2-repeater-tuning-f56331c6b1fa
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750148807; l=1310;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=NLs+qWJn+ZP5DPsry/eRPCLoqWTcxBnwPUA0+ZFuPm0=;
 b=rx151nZm2NY70r0BR/IhQqna3HWEfZP2hVL3TqGjnULcMcPD/2K3GYVB43b9pA0Sw6Jws23B+
 aS7VXHp62ufAlpFof88Zsu88DJPzjdCyla1e58LwlwNqIsdZJJa8XSi
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the dt-bindings to remove the 'default' tuning values, since they
depend on the PMIC and are not guaranteed to be the same.

And add a fix into the driver to not zero-out all tuning registers if
they are not specified in the "init sequence", since zero is not the
reset value for most parameter and will lead to very unexpected tuning.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix wrong parameter used for refactored init tables
- Also drop "enum eusb2_reg_layout" completely since it's not used for
  anything now
- Use unsigned int instead of u8 in struct eusb2_repeater_init_tbl_reg
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com

---
Luca Weiss (2):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Remove default tuning values
      phy: qualcomm: phy-qcom-eusb2-repeater: Don't zero-out registers

 .../bindings/phy/qcom,snps-eusb2-repeater.yaml     |  3 -
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c     | 83 ++++++++--------------
 2 files changed, 30 insertions(+), 56 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

