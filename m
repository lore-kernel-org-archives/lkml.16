Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D585D26B0B6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393441; cv=none; b=mGxB05As+knFzQod7FFQ8dTLMWQNe6D9mRMpFx3DZowsW7kU126tqv3fDgGMvzOYvF0rbgLiYK7xdXCjoPD8cqXxiRVD2LwehnHQqlALsN5IUcnZoHSEU7bSX6JTle0Fbw2BW2r2BSKdt5kfLMUMg/S1h9eJ9eCH/GeRc/gc6Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393441; c=relaxed/simple;
	bh=ugdh0Jwg8OtNDnnvSXX+JcwFs/E/9kEcCZ1PVSsw1oo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jErZZhv6rz7tx76jQ3uFhTH/6cs6bzbCV9TRbJF6O7R5XPVP75rbCTHLbmjQ1be/f2GWm8DK9kwvoPVOlSrdcFf2b7huf7YgnJL/z1eaQDl4NG8EcXXWqi4YFxIBiuBN8M2z8v4VNdXwN7XpTDE2ZWN/pyb/aigjzbkbZkQnBDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TICk2Rj1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TICk2Rj1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so5494087f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393436; x=1745998236; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAVOf9WwZt5yb8GSwQ0W6u8pvseS1B6MX+loQMEGJLQ=;
        b=TICk2Rj1l2YRJmLdqOz5FZwY43nDW2Lk32jG8grGPWZPJneWLq7G9cL+ffkwAclNsE
         Rz/0Atm00/xafJJfGnHaNe2rSY6AuE6tjc6Hhp6UM0r+MK++tJP+rRntbBXwS1lHPtt8
         lt8rGmFOCk2ElOs5VUEHS2Ck+7AjbUonhJ+FfhBLyIqSy/rd33MVj5M/rEMGbmfrRThA
         KVgbXeR2QkZA4ixX3D616vpaga9OH1g9mPyV4hVBiG2tgX6+WxByuzPQ7Qp12fSl8wLF
         RJAcoGFUTMYnfDVXD0ZCIGw4xWctHP9TbMho/W6aqwt08gDbOWBkSWuNmFab3/0hgqIX
         fOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393436; x=1745998236;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAVOf9WwZt5yb8GSwQ0W6u8pvseS1B6MX+loQMEGJLQ=;
        b=P+73KAMLF9eKQO89X1PFdwy3TLvNbrjJ0Q3HD5c5aM45E6peyHqYdhURJn20Ajn54o
         9ikdid0HF6mm6ZdfJdknQpR+8ZBELgoIlvh6d70PZ7sxxAZKEPVY4cjXWYsMFGy1oBKQ
         2d2DGV7uoTHNtb3HmWlRNl0QhuKPyMwOyJiK2sA9So1nq4adKTzFx8BKAr4kswGalDUH
         aEcZSTQBbF9ClEVmEcKkgwwFVFlZ1LexAs0LvWIAqQtoA5orxn06F0NBoP/x0/6YFLrs
         nn7Q2BtINt7+F0k0SmCw0ZReH1lTvlE3PcvjNwBNU15j+EEG9KQa3JPBlp1RO2GLzBfP
         6/LA==
X-Forwarded-Encrypted: i=1; AJvYcCUGDSPyli4jV70HM534ezvUHse8dsX57LdMPb8DmFVNaVZgMxKU5Rs8HKVbUed5RdKDN9+FgSPgLVCmhAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtgsevmL5BYcQdn00s2dYvKc9gd/IdwHybQUic00PXJclG5Yg1
	OPWbz1l652AhYa6FpJGgzLNpcrxcHjgJ/QmaadPYI+EgJNziNjHzeiK3cPRSDII=
X-Gm-Gg: ASbGncvTL+Piql3henkylzB2FV/wq7lBDzYkt/aktPuhsWiLfyyLukGAHCVncy5Qwdi
	CLpMwkzZz3ymUNtn2cafKJ/jJdQdO8jvbg4GmrgTKnQ+IrSjy4V5mMB5uw/7fWX5sxrJ7AqFBMi
	2cHnp3y9oD2JDTBuTKR7Whxq/Xv2b+o5ARgawhBJglo1PL5xB2wO/3PIKlSGWGkBvlZyq24/l0p
	Qq1s8xQ9l/m3T+jI9hflz/enXhv420qXCNKDQTlfYL3rTeqfB80wo2m0yWv3xsFiy3uTVx/34oX
	slzNVUFOQcbaCvwwVH0ULa/NF9yDObynjInZmd4OfNGIKfxiEoy0LBc=
X-Google-Smtp-Source: AGHT+IFDeOQJ84DRhqUsU2I2qejWhkxN7owbw0EAeDx/ORw4YLo17BdfeLQzG90l677GOD8n8erpdw==
X-Received: by 2002:a05:6000:438a:b0:391:298c:d673 with SMTP id ffacd0b85a97d-39efbade41emr14796194f8f.40.1745393436055;
        Wed, 23 Apr 2025 00:30:36 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:35 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/6] arm64: dts: qcom: x1*: Fix vreg_l2j_1p2 voltage
Date: Wed, 23 Apr 2025 09:30:06 +0200
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6WCGgC/x2MQQqAIBAAvyJ7biEXw+gr0SFyqw3R0JAg+nvSc
 WBmHsichDMM6oHERbLEUEE3CpZ9DhujuMpALXWtIcJbM5bEG3o6sER/zdUx1GvnrLFke6jpmXi
 V+9+O0/t+/insk2YAAAA=
X-Change-ID: 20250422-x1e-vreg-l2j-voltage-4281dd747278
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Several of the Qualcomm X1* device trees upstream specify the wrong voltage
for the L2J regulator. In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is
configured with 1256000 uV instead of the 1200000 uV. Change all affected
device trees to use the same for consistency and correctness.

In the other device trees upstream, the voltage is already correct:
 - x1e78100-lenovo-thinkpad-t14s.dtsi
 - x1e80100-dell-xps13-9345.dts
 - x1e80100-microsoft-romulus.dtsi

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (6):
      arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2 voltage

 arch/arm64/boot/dts/qcom/x1-crd.dtsi                     | 4 ++--
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts             | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts  | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts    | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)
---
base-commit: 39155a896925c3af2156ad61e821aa9fa5a1dbdb
change-id: 20250422-x1e-vreg-l2j-voltage-4281dd747278

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

