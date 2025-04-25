Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CE22F169
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564936; cv=none; b=KslKCzkBnkv2bQjdXRheha14wT+Z/E4PkLetjZtdrOkSzodgiFTSw5/BHix5ennkEwZHPQXpr7ueik/IjILnzGYNVqb+289kyOjE6zpn+MkV00p6Ihkj8N+ni+7M/X/ojJ5xIlsjN4VVOijsTxC/+sxfU3eVPHUkUj3+zI07i9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564936; c=relaxed/simple;
	bh=QtPrcGpMh3mVwXvK9TpUt+VlyNAQdkk2FKBhOhf2Zcw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HgowEDRtRwtjO7/NmViPJCqAzvwllpIEbDtCtceS+moq1obFTN0FnaaAJMTLppclryi3w0DidwZrAuM8hWloXC9Xv8rUdqfZm/aj9K3fiG2osjrLmr72OhEBvO5Oq21Xf27JivWvpyTV8NxxCx2aLFVtsN897cScxAEOzMscE44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=htd3/tO3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="htd3/tO3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso12638285e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564931; x=1746169731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/pFaQ+mrPPFB1oid9YI7FCJXak/BuW7x5kjtSlS5Ek=;
        b=htd3/tO342rbCgFnOX/z+kZObT1w3Kwhe7I0aeU0u/bAm/PSS14uDrLUN5NPoaSI7r
         iHrweZApcbC1r5JkyLkk7lbIiqBZ/Zis/0+WwfdhPeJKgpTHOi4MMkXNjZFGvBPIoB3i
         UIgpLC+UAy48HNDnseN0Xp5j9Azcd5Y4vvHG6/zqKIhDFyEulfYiNkBpOcyWPqwOJy3T
         uVPiXFxToJG2vUGmtMxGUyXGwZbJSHLD2+tIuACBWGRvw1EQonXqU4uHPBwOZLNFqCQd
         nV3dLTP0tBHdVZX6y9lpVgRGZRn9zEdAop4qwBx+u6WJfTzm8+8iXUKZyQ2WcQKv3vHd
         T7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564931; x=1746169731;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/pFaQ+mrPPFB1oid9YI7FCJXak/BuW7x5kjtSlS5Ek=;
        b=xHpxPcR0XEowKMxrnCL94tOGWp+kByTkKLwieV3f8xcFJqyMxCEC4cpA71i7+N20qY
         3PK81YEEt5YqY9oVQVpWMGrNUKK/oe0zMvl/uyeHHNqxAzr+iLpg8uB1JEo8lZjNzQ2o
         dMEiOV42wM4qLgb7CYUdX3qRSSCw6YOj6gl3mOhFMR/EKfx44ANDF7NM4xaS6zjYFmnq
         Hez5yKP9jhmJx+Y6FETuAKlbSNMdaBlaTtx/uIeWNTg0du2nN7mMaJBgc+MsGkV8FQzZ
         PA+28859hX1Xq36LxVMe/XE8aYQI4ZbwjgI9udTn2onoCev8XwGm3lsTwhLiun05jg+r
         MFAA==
X-Forwarded-Encrypted: i=1; AJvYcCVzt/YBzis8sLUdBU271jp4FObF4Iclhkh4//t0UfBTdUEZDyWI8NLwgs6au+ymak9xIiF/b1hcDWjJjc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkKYDbpe0f71GgnFJx5DCntNKn22n+1K7nnIUB8RlUNWS+SMV8
	oADOxzgKAY6SbKJ22qhb6Z1AdlrKLssC9JJ2Sc+cOhgsoCbMwIyqfJIBMy0C21+qh98mmk26P+V
	x
X-Gm-Gg: ASbGnctiPZe3/PH5KeZ0YwlG0j+UpK7GrWd9XDuvWEKS18bPL/8kJ6PhAtIuWxVfyTU
	8ELI1gKTi4y32+ptRQo4yYBHKqgEXr+9NWvz0j6ibGbLTc+1n1eWfOrrmfMnJ6O2rBh312PeduJ
	E2TLKbuJJiEFLAoAWlq1PdQFqZXIsu5FphbUPzm0S1lB4la3kElFOwZocPfXcFkQLodRcEt3T7+
	vAx/oWBfBDjwesBPi5NlSEe2EglfTdMij0x3mNU8jSqQKaTJ14W/dMYxC0+FxKE69fWyGW7GBlV
	RdI1nHAmwsdu4cfj7Q8U93k8bqNHfTYvp00kriMNcNRRxjd3yVb3cTe59YuGQGf37wKlw0S4huM
	BeEV3SIu77it78ODPat+mIAFFim/nFUNJDzwVU2fGJq3uHa8Fe46a55Ae
X-Google-Smtp-Source: AGHT+IFzhPfcdeLBF728LvxKH2NQytv2+lwn8cMdeqMenQFWngddQx+8HhHl2rf3w1TkCbe6pFjxfg==
X-Received: by 2002:a7b:c305:0:b0:440:67d4:ec70 with SMTP id 5b1f17b1804b1-4409c48b0e9mr40766735e9.8.1745564931526;
        Fri, 25 Apr 2025 00:08:51 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Fairphone 5 DisplayPort over USB-C support
Date: Fri, 25 Apr 2025 09:08:11 +0200
Message-Id: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANs0C2gC/23OwQ6CMAyA4VchOzuzFbaBJ9/DeABWoFG2ZRiiI
 by7g4uJ4fg36dcubMJIOLFLtrCIM03kXYr8lLF2qF2PnGxqBgJyCaLkXVA8jNTy/knuwW3gIHV
 jtCiLBpGlvRCxo/du3u6pB5pePn72E7PcppumBIA+0GbJBUettbR5qRW0166mGAbv8Nz6kW3iD
 D8lfXWkQFJqpSowpqisMf/Kuq5fxSyNlvwAAAA=
X-Change-ID: 20231208-fp5-pmic-glink-dp-216b76084bee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

This series adds all the necessary bits to enable DisplayPort-out over
USB-C on Fairphone 5.

Devicetree (patch 2-4) patches go via qcom tree

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Add patch to fix dt-schema validation with fsa4480 extra properties
- Link to v2: https://lore.kernel.org/r/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com

Changes in v2:
- Move adding "*-switch;" properties already in earlier patches
- Move wiring up SS USB & DP to SoC instead of being done in device
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com

---
Luca Weiss (4):
      dt-bindings: usb: usb-switch: Allow data-lanes property in port
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C

 .../devicetree/bindings/usb/usb-switch.yaml        |  15 ++-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
 3 files changed, 118 insertions(+), 9 deletions(-)
---
base-commit: 4157b0a73f61cbcb3593d2fc86eaceeb5c06e1ac
change-id: 20231208-fp5-pmic-glink-dp-216b76084bee

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

