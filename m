Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7923CF1F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889229; cv=none; b=PV68+pKHu2OWzh27HygohvPG04fWRViUpf7vWEnFm04IqBa91i02fRBVqwtqO9Q+OvuuoJLKDdt03NA8/B08kf+Xu5pZWYent9rvQugltAJTTW6QcvvYCnNejKzQQi8IzSd2Tnn/nJkrR/ZbeCso8DnaqRcwgburjm6zQTurl2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889229; c=relaxed/simple;
	bh=0WOI/+GaMRZ1iG9jXOjVp4ioIDk3o7i8HtCSn6lsE+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LlCSlT+gR0JM98zRmuiLSq0U/Tp8gPbHIq3/tc9oPqicPZ3LrgIZkaA3RHkbu4AGJFR/JhqSAQ39Ynho9FHXqsnxy1u71lPNSoQ8vlikGSoqNVR1b+kY/2xshVd540wesMNEOOt0P1geZdKnBhWnKSasIRasa6nmC9heRkOVZ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJdRer8i; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJdRer8i"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913b539aabso391309f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889225; x=1745494025; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UW9gJcrsFg0xEf0FjEU3I0TGtp3byhu0KO343DFdP8=;
        b=OJdRer8iK8p54JZS/LOxFaK2TFXXLIdHapG5vJkPizsz50oFWuQ90cnHXep83n5PA1
         aUFHijD3Imevp93Wi9TUwlUUepLODW954dce/o9AMGb0EhOod0/8nAX8aQpy/f6bKnyn
         jhed2YTnLZcycQVcRr2cFhf3p19HhdEcQf8xlICUpLQmgsVarNnueyZXB1G7pVh5AhTa
         lt1cA2NrYLey71+NKgP9VbRIL9qg0/t/4ATHCsO3g1b/q5Ok7fOeXCT+WRnjIsFyu92d
         +pw63JDZ7pYf5yeyiicsDRdtqG0ipSjkPcBq4yucjw9fEo3y/qhbaKGyhn5zp4lB7szs
         VTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889225; x=1745494025;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UW9gJcrsFg0xEf0FjEU3I0TGtp3byhu0KO343DFdP8=;
        b=olVmITZ1fXGLe5viWzEg3Rhk21/59WGrK659AjD1+n4y1rkM8Sv0vgrWA8PBODx2Cp
         7wmk7/dNAazr9ccE3RBSARsOCL0Y9rRn5gziAICZE2yCms01jjK304K4tQboG/DAWsJy
         7QP2JR4ZYP/E5GjDVoipg9d6TRGPSu2hJErcpC9l8qHD5CiyTu+Q6mRmGksv10cinfeR
         muhuSxp2ok+1rknzhUl1tOYlhQRB/dglva0ZHV6+vaMclmYISK7z+rBhpRYLu4bwwCvM
         q4YHmkmFRmdBG6Ejg5VMk+cBNcX3OgRd0ZjfJiWWiQVtMSHkk4qVFsawRJd5jwUkl7pK
         HZVA==
X-Forwarded-Encrypted: i=1; AJvYcCWmxtaWAX024/1xbEPWjoQz/CKci5jNZUOF5pM9t+vpTG0aCDy8x9nmEzhoStJvJBy8bpCBBaGXq23PWtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Tb5KbOMFLyXF7Qb/owCdt2nKD2NjXagIbCqvdja/n3sLpaUY
	shq9zsQUpbho5LndkAv1ul6aKNbHn0jkgREls/hI+wzLY0M39dMXk/WlSuKkVFIxGEPDG2rwPlg
	maPE=
X-Gm-Gg: ASbGnctxd+5O2xcufAfy9q2qbmS6KnLOPbPZa5AAjQQmM5BkvB3EMBY6/qEjeG9ZmUT
	LpQ99HQ5PQtIyAtiwkPeUwdu1gkjbH55hGRMjTVWK51u+2mLDUSpbB1zu25v9oES2AOPy+8wh17
	KpS4qzfcpwB0uFai5fTAa1WbohWkjoYkcKX7k9CQ/j0b7uT1kyarfGbg7PObeKFlkSnfYwJh4IH
	Hskguso5og3NI6IV5FbtUNHypC4MZIgRZSrcdIKKu2N5B/mp+o8zw6CwQhrPKPnuTW9sLJHfOWb
	hVhEn6Q/IuOW1fSAiZC23+61xNb8xWYLi3MDD18jFbN0bq4vv/8D07qEhFh7HRSbD4rZqxmkFRK
	g++8G+A==
X-Google-Smtp-Source: AGHT+IH3XjNO+UydKAHlOL16If/Iir6btWGhMRGNXm93OsXmj4kTENZia2iadx9kym5hA5mWeI6SkA==
X-Received: by 2002:a05:6000:2408:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-39ee5b33b16mr4195260f8f.29.1744889225158;
        Thu, 17 Apr 2025 04:27:05 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 0/6] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Thu, 17 Apr 2025 12:27:01 +0100
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIXlAGgC/52NzQ6CMBAGX4X07Jr+A558D+OhlAJNlJoWSQ3h3
 V046VGP8212ZiHJRe8SORULiW72yYcRoTwUxA5m7B34FplwyhUVTEAj4ebHZ4bR5Qm4AioA53Z
 KHjJzFWWUgjX3lIApqrtSNk0rDEHhI7rO5z12uSIPPk0hvvb2rLb1r8yMR6iktrXRshamOuOni
 eEYYk+2zqw/3fInt0a3a23DbWcF4/zLva7rG36V1hRBAQAA
X-Change-ID: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Changes in v7:
- camss compat string is in media-comitters for 6.16 so it should
  be possible to merge the core DTSI stuff in this series now.
- Adds RB as indicated in previous cycle.
- Changes <0 0xvalue 0 0xvalue> to <0x0 0xvalue 0x0 0xvalue> per
  current comments on linux-arm-msm.
- Includes CRD dtsi for the ov08x40.
- Link to v6: https://lore.kernel.org/r/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org
- Link to media-comitters: https://gitlab.freedesktop.org/linux-media/media-committers

Changes in v6:
- Removes 'A phandle to an OPP node describing' per Krzysztof's comment
  on patch #1
- Drops Fixes: from patch #1 - Krzysztof
- The ordering of opp description MXC and MMXC is kept as it matches the
  power-domain ordering - Krzysztof/bod
- Link to v5: https://lore.kernel.org/r/20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org

v5:
- Picks up a Fixes: that is a valid precursor for this series - Vlad
- Applies RB from Vlad
- Drops "cam" prefix in interconnect names - Krzysztof/Vlad
- Amends sorting of regs, clocks consistent with recent 8550 - Depeng/Vlad
- Link to v4: https://lore.kernel.org/r/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org

v4:
- Applies RB from Konrad
- Adds the second CCI I2C bus to CCI commit log description.
  I previously considered leaving out the always on pins but, decided
  to include them in the end and forgot to align the commit log.
- Alphabetises the camcc.h included in the dtsi. - Vlad
- Link to v3: https://lore.kernel.org/r/20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org

v3:
- Fixes ordering of headers in dtsi - Vlad
- Changes camcc to always on - Vlad
- Applies RB as indicated - Krzysztof, Konrad
- Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org

v2:

I've gone through each comment and implemented each suggestion since IMO
they were all good/correct comments.

Detail:

- Moves x1e80100 camcc to its own yaml - Krzysztof
- csid_wrapper comes first because it is the most relevant
  register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
- Fixes missing commit log - Krz
- Updates to latest format established @ sc7280 - bod
- Includes CSID lite which I forgot to add @ v1 - Konrad, bod
- Replaces static ICC parameters with defines - Konrad
- Drops newlines between x and x-name - Konrad
- Drops redundant iommu extents - Konrad
- Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
  Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
- Interrupt EDGE_RISING - Vladimir
- Implements suggested regulator names pending refactor to PHY API - Vladimir
- Drop slow_ahb_src clock - Vladimir

Link to v1:
https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org

Working tree:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3

v1:

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (6):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition
      arm64: dts: qcom: x1e80100-crd: Define RGB camera clock and reset pinout
      arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
      arm64: dts: qcom: x1e80100-crd: Define RGB sensor for cci1_i2c1

 arch/arm64/boot/dts/qcom/x1-crd.dtsi   | 106 ++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 352 +++++++++++++++++++++++++++++++++
 2 files changed, 458 insertions(+)
---
base-commit: 0316f040a04804ff1f45e51ccd42b45552c54a60
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

