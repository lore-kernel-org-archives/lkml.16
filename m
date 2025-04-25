Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B6274FF2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594260; cv=none; b=rzjU0yOQ01FR13Qyv744RPKDHmHC0AIcsXg9vIW+gT6NIlhJFX1tfvMwWFEOgy+W+fWEdJxGWheUmxTKsPimB3kZs5AmDv0fwZmJoGWdEHOkJK7kXA+uFXfyYh/VtBcA89fxWAbyOuORIcSJFolCvt0rIEYN9f/XSyOXYtfaVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594260; c=relaxed/simple;
	bh=TGW9E/1j6jlfDfpTgxM12CNevehH/NaVJ/ZtB1386Zc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kTjEMd6bNoJyXmzOTNvvq4niCXbyoCZPsfySm5L3ZyobvydpPuGO8UIJrpGmwvzI5up0QTx/KARRDyBAb294iVkI+uBFjTog2KosdPF5XXpwaM5/KDNj8RCq7kUvOKLBzXVqJsAIwLl3JpCfrdXpOTven3B+9Cd6T5QiUZzrqMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AFw0sAmJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFw0sAmJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso2576912f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745594256; x=1746199056; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oo8jEMx9PED2pgZx3cRaDbXTEl/gG+7vTJeJ5DnxFiQ=;
        b=AFw0sAmJy0uf387HL3jCN7f4tp9y3+6BUPgqwr+EnzGEThAU0fAMKuD0Mv1cHKCJEJ
         jWr342Nt1k3Xb2GJtbEjsSA3Dr0BQcSMf0zCJig1UtzL/5r335/+Rsvr8egGL1Xdglv4
         +vaoSZrNuh4DhfoljYZklRCdOQc+qpA2eitLpXt2CnW2IgJ4OSjXRUw/dLD8uzbC+xmw
         e+wtAuJlXL5ykbjvlWdc1oiA6Fh0MstMxoaKCtT5pBy+MGDcpDnTku5eCXGd0bH82MmW
         bEZuCb1w07ncWwSEAGpOK2CwMks6ituylNV2l0LacjXJFv4zV88h433IoI/75qk99yhj
         sC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594256; x=1746199056;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oo8jEMx9PED2pgZx3cRaDbXTEl/gG+7vTJeJ5DnxFiQ=;
        b=kKfDSagdaS8Sj+eVIDD6vVi2RmatMH5XrIcyo4wiau8Lu/3iONGoThJO4JVhCTbiyJ
         hqJu8IpFEhq77Rg6aSx5cdDKsAU/NursaOusSj7ngjHuKUQcYHHOFcML5aQrt30J1mkM
         ICfzySsnHRJmTHxxEb/FF+ql19l9BgYQ+4MmFhoKyZ9INzzMxq143IX9nItD5MIRDnjH
         gXnLeS3qjlLYmM0jqeZQHmCmJZmiCmg64Lqc2gYgWuiWll8b+BSuswgT8rRpC6CHKRJF
         643eVVdKXbtUp67Ca1My3YWOnuA6qg85kaWDWcS9GfQiOHa70Kure3ATVMvNFS6B3IX2
         ZwDw==
X-Forwarded-Encrypted: i=1; AJvYcCUOGOcl/udu+g493prBTc9KedGR3mHzML2pYY8VNHHXrOYGGYHx7ToXSO3EmUqUlk6XIU2dxbdv8C8fYWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxJfLn+GgZ5gIR8MUe902kT5w/dSNmfl00DosvNM921MyXT/F
	zowyWCLqxJpJvqBdr+vzvOoWNU7qtWbK9nle1DZkNVFTN8Ry+S28BrB0v4Sr2Tk=
X-Gm-Gg: ASbGncsO3BAQi6XQgLTBZfeOAzDUyWwUuxhSDXp3mcFAyX7rV8t+sKGV/sEi02q+J4W
	H6vxfFIiHwjfJC5E9VlxmnbQgt4KBoY5aL4RU8z9tX9HfV9Os1ybLYCb1jMsEWrMCv3Bx0jp4uu
	7FtPSjENAB4QpvOlF/NIgxs3Fja9PFRFmzcHOSvihLnw/0oI7GuWksSPVj/j7e4tPCW2o4YnZFA
	vZwGINRBdxBftHDBWkeKxBMD1fwPXQT6tKQcjZZz+COtHtp1X4bKhsVtJuCM4/h8oMbQJWglMui
	VRZQ/MPgwQ27A+csIMwDXGnS6IsN7sdlUWwxn6DJRFU1XVY1W2HXJJiffDI9Dp+k/GdZmbBWhdG
	HbZgXPA==
X-Google-Smtp-Source: AGHT+IFuzyzDqNoR5eXCEwlrfyHPIN7ewh2HMRJoJO3w8+4r6x3c6GB2SrKBCVueKHqI8pW1o9ClOA==
X-Received: by 2002:a5d:59af:0:b0:391:1652:f0bf with SMTP id ffacd0b85a97d-3a074e42cccmr2587173f8f.33.1745594255850;
        Fri, 25 Apr 2025 08:17:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ccf44csm2684738f8f.60.2025.04.25.08.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:17:35 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] media: qcom: camss: x1e80100: Add support for
 individual CSIPHY supplies
Date: Fri, 25 Apr 2025 16:17:32 +0100
Message-Id: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIynC2gC/52NQQ6CMBBFr0K6dkwpLRpX3sOwGNsKk1BKOkg0p
 He3cAQ3P3l/8d4m2CfyLG7VJpJfiSlOBdSpEnbAqfdArrBQUhmplYGnhuAdIdgYAi2LTwzllnp
 fi4EZ+D3PY5FCq67GGilbh0oU45z8iz5H7dEVHoiXmL5HfK3397/OWoMEhY1zDeoLtngfacIUz
 zH1oss5/wCvDPi95wAAAA==
X-Change-ID: 20250425-b4-media-committers-25-04-25-camss-supplies-6285c5006da2
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3012;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=TGW9E/1j6jlfDfpTgxM12CNevehH/NaVJ/ZtB1386Zc=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoC6eOkqTfXPUuQvTMa5pLqdFMW9jjaVaI2RkNA
 YkZ8tBj/oWJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAunjgAKCRAicTuzoY3I
 Osh0D/oDNM+4hQj/6Tldg5hQBzTDu5GsLo7j8Mr+cw9jddDr1O1oyV2YKDel6A/9MPJo/ZZLvku
 0JhuNRIsj2vNA2/XP+tMAeoW4R56LtHKwzcPTeFhWHoUnZDeaawejocTb30wXGPx7q0Io1y7R/C
 28nnE949QGQL4xlTv9gbv5O+taDvXecdzngh5R7+2p7fZmWvhAEkLnanrSeBKcIrGiVPaXpctqm
 Vv9ejYxrulrNa05uDB77Gyk/UKmAiqDDEgvDzHMEu4Hveq2zCzlHfq3cm1mhje3MFg2x3d1Ha+2
 38JFEtxGew6c4Xz3HTc50NxDauIacYwzE5PI9JQf0u25Arr+nwYxNNskIgNx+Py8IqcXp4uEYJY
 0lqMsNS5ZMvMmaRcTFC+2s7Tb4NPTyvouJht6N5s3w06pw19AQduddKSi5fkyJR3yVW2V7IGZs7
 84MlGoUcbBBUpl1G7a++A0uGIkWeRSAajaWHO5LwfRvR0w4dOzo7L8xcwmhKRQ1NKUfl96IP97d
 01PN4Y2DDVceeZcgsWzPlSK9H4k5oIuiPg605hAlqQcSBipUBpEAhpPunfkIxm9JjlawwU5sJCE
 vX7dDGN5+kLzZFn8HAmxkkNwe8AR0e++MTwv3V0QKv6sdb9X+n90ceW5BTgdWQ4wMJa8bQaN4UF
 uCicOgsnRxIDNYw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v2:
- Fixes an indentation error I missed in v1 - Rob's robot
- Link to v1: https://lore.kernel.org/r/20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org

v1:
In x1e each CSIPHY has its own 0p8 and 1p2 voltage rail. These voltage
rails in previous SoCs were shared between PHYs, over time the hardware
differentiated out the rails per PHY but CAMSS didn't keep-up with or know
about that change.

We have two options to support individual rails per PHY.

- Logical naming of the supply lines
  In this case supply names describe the PHY and its expected voltage input
  For example vdd-csiphy0-0p8-supply for the 0v8 voltage rail to CSIPHY 0.

- Pin naming of the supply lines
  In this case supply names will align to the name of the SoC pin.
  For example on x1e the supply name would be vdd vdd-a-csi-0-1-1p2.

This series chooses the first approach for the following reasons:

- Naming coherency across SoCs and PCBs.
  Virtually every CSIPHY has 0p8 and 1p2 voltage rails and these are akin
  to an architectural feature of these PHYs or at the very least a common
  pattern across SoCs.
  
  This means that the pin name on x1e might be VDD_A_CSI_0_1_1P2 and on
  qcm2290 VDD_A_CSI_0_1P2 but the yaml standard will be for the regulator
  name to be vdd-csiphy0-1p2-supply.

- Accounting for upstreamers who don't have schematic or qcom IP access
  Not everybody making upstream submissions has access to schematics or to
  Qualcomm's SoC-level pin definitions instead working from
  vendor/downstream DT information.

  It should still be possible to construct a valid upstream definition from
  that downstream DT.

- The counter arugment.
  The counter argument is that aligning the pin-names to the regulator
  names is less error prone and I agree with that statement.
  What I'd say here is - the requirement for CAMSS regulator defintions
  in DT at least from my perspective is a putative upstreamer should
  be able to show how they have tested a given DT submission.

  If that submission isn't tested, it isn't working and should be rejected.

  That should then address the concern of having as another example:

  vdd-csiphy0-0p8-supply = <&vreg_oops_wrong_regulator>;

I'm promulgating this series in the context of x1e but it should also
unblock qcm2290 and sm8650.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: media: qcom,x1e80100-camss: Fixup csiphy supply names
      media: qcom: camss: x1e80100: Fixup x1e csiphy supply names

 .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          | 16 +++----
 2 files changed, 48 insertions(+), 20 deletions(-)
---
base-commit: 1d1e564fce1bc361af1a1980a7f915a0475a008a
change-id: 20250425-b4-media-committers-25-04-25-camss-supplies-6285c5006da2

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

