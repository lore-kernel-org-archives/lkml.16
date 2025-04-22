Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD48122B8DB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319858; cv=none; b=c3SapW0LO32HbIJfSCqWeJIk8H1pCevcQeADf0F0ykQMqimNg7dA9Y8GVtCTIoBmSc0pp/hHAbxEhoQFlGCzSWYOZL+rlUUkZapKzAZHodlKgs+VvYyya0uqcG92UtMBmSdT2IydxFdmzpoHOdCboRpf7w8WRQlgkCV2m/fu3j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319858; c=relaxed/simple;
	bh=uV6ujamVStXpEvao7zFqfEA0uxJwBaOVhk8e6yHSv8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VyhYbhTXs0OV9bAXK7y6aCN/mQBHyzbwxq5K++5+aVBHKidebr6AYMGpmcT4kXexXzHFnpsTfFl4xE5ZkFHIe18U3di1KhA8Fj3UurCWCMG3O/iow3v0Kb3nzV1DreIVKUFkLIXbg8x3Nf0J76WETTcRCMa4LLoPNiH62eoIEV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwHEIMze; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwHEIMze"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso58883735e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745319854; x=1745924654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stczcmLF4CwDu8wpHpVgUDiohWhx/z3wF2KWIWtxeUA=;
        b=NwHEIMzebIozlxCGTqBCIZz/uRx6uhsCEVE1CwXfyrf5JAWF4WOE/XbGW1JXvFPUaJ
         QF4LWqRYYFd1tqTfn21oVIDpV9bLt0bIGEtJV78Jm7PeKWvZn9ULMD4ws6JKeUbTVc2s
         b7Zdiovx9rETsB/fGHWsmcaWWfNGr7VrUp//gyV/oIxesDDq1fezCkLbDtVq32ZtN9BY
         ZQA3ttW2SONVq3e2lPjgfyx0hLihApxZPDOZGst8DnwFFoRUqEs0IXUbs2AN76LEzTSE
         e9v0s1DWeFSn8kDtW170eEz+D5Ex50sU1iQ3c9plfDNtzZLT7v7jcscFLsoAsste8IZz
         SU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319854; x=1745924654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stczcmLF4CwDu8wpHpVgUDiohWhx/z3wF2KWIWtxeUA=;
        b=LuBi8w4vg/S4N9vnFN6CFdTBgapqnMQk2a9z0EPg44PWsstOSZbtdA55h0Qw1s1Po3
         /oJ4YgXxircfA2K2oguoPzzE6VaaPUBWHKKBRsKSW6kx0ym8e854vQodUTE2DmW9piIP
         a1ABQ3+jBDUd7rRWN2fsUYNU0jB7stvr8YZoWUQ3tT3H/BJX96btmwyBVX+ms2H/nMeT
         YyND1a016fbYnO7fcRWmFRY5wu15w9Mfcq3Stu8UN/ULqbb1poKIFm6LruuHxfJF/sza
         RmTxEQpF4gP05pVFU9P065DPl5sF2KAYh7s2VMDXJO1n6iKGHyiFKnMBHVbKR1Qec4Mg
         WVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMcQw6AJkrs1G9kopyrj7FKasTU6TJqunlSaAiEmn2vCvmSeBEMMBqlBJdU/dY/pmk/KD62kx+mcPiGf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy279xhIb4LG/eIZlv6GRrmuQpT2CbMqIzZnV3W+ZVk0Fp12btl
	pkZXgjSs6WSydWa6Yt1I3t2pwBUm0k9KBCpv8r9LMusYmj7UpvZKrZ+DbpTwkCpczdP39gBvLbb
	A
X-Gm-Gg: ASbGncszq4SH6iZssuM1AA9+hKkA48ER6Eg2fjhw2kB3HunKJIDw0B2r92+qmlxAA3E
	pAYvD9867Q1bd7hZuEba9AFFpiWOp/ltYGDPub3UPY/yXzy+oXEO5K/exo/D7X3g7+ATni5yWQt
	ZTZsojg+Q2C6WQkuMfG3WwRHR8zvi6VbMgN13DklT8FGjMlPUot0WEgQIEWXzo7Uxy5MVTR0dw/
	cKf9RJQEOqTC6cyWeSBB619yY1BSJypy/WFnOmJoDp1znMDJExjhFMQGWuIxTUvbNAI6bPWEKv0
	c1FdnnlXc5th8K0830pZy41pfjNodayKGw71DlmCwFTR7yVrefR9ORDpsLXVLWd0Og==
X-Google-Smtp-Source: AGHT+IH2uZN2Zbzw3YJ2WJTh6/sZb1U2AgQZkrjJhlf1vz4G/pbKrEq84c6eL9i7fbiSyw55mnPV5A==
X-Received: by 2002:a05:600c:1e1b:b0:43d:22d9:4b8e with SMTP id 5b1f17b1804b1-4406ab93fb0mr172402695e9.10.1745319853872;
        Tue, 22 Apr 2025 04:04:13 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8847:e39a:2a2f:e614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acddfsm169609725e9.15.2025.04.22.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:04:13 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/6] arm64: dts: qcom: msm8916/39: Cleanup/fix UART
 console pinctrl
Date: Tue, 22 Apr 2025 13:03:47 +0200
Message-Id: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN3B2gC/3WNywqDMBBFf0Vm3ZQkPmi66n8UF9GMOqCJTCS0i
 P/eVOiyy3PgnrtDRCaMcC92YEwUKfgM+lJAP1k/oiCXGbTUtayUEktcbkY1og8+hhnFSr7feBa
 yMYPT2nboHOT1yjjQ6yw/28wTxS3w+zxK6mt/zfpvMykhhVWuLNEaU3XmMZO3HK6BR2iP4/gA0
 pSsg78AAAA=
X-Change-ID: 20250411-msm8916-console-pinctrl-069fd22abedd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <casey.connolly@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

At the moment, msm8916/39.dtsi have two inconsistent UART pinctrl templates
that are used by all the boards:

 - &blsp_uart1_default configures all 4 pins (TX, RX, CTS, RTS), some
   boards then limit this to just TX and RX
 - &blsp_uart2_default only configures 2 pins (TX, RX), even though UART2
   also supports CTS/RTS

It's difficult to define a generic pinctrl template for all UART use cases,
since they are quite different in practice. The main use case for most of
the boards is the UART debug console. Unfortunately, the current generic
pinctrl template doesn't work well for that either:

 - We need bias-pull-up for the RX pin to avoid potential garbage at
   runtime when the console UART is not connected, but this may be
   unneeded, unexpected or even unwanted for other UART use cases.

 - U-Boot needs to know which pinctrl to apply during early boot stages, so
   we should specify "bootph-all" for the console UART pinctrl. It doesn't
   make sense to apply this for other UART use cases.

The solution proposed in this series is to abandon the idea that one
generic pinctrl template can fit for all the UART use cases. Instead, add a
new pinctrl specific to the very common console use case, and move the few
other UART use cases directly to the board-specific DT files. This ensures
that people are forced to consider what exactly their UART use case needs
when porting new boards.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Add new line between tx-pins/rx-pins in PATCH 2 (Konrad)
- Squash patches 5,6,8.0 and 7,8.1 (one patch for 8916/8939 dropping the
  generic UART pinctrl templates) (Konrad)
- Link to v1: https://lore.kernel.org/r/20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org

---
Stephan Gerhold (6):
      arm64: dts: qcom: msm8916/39: Move UART pinctrl to board files
      arm64: dts: qcom: msm8916/39: Introduce new UART console pinctrl
      arm64: dts: qcom: msm8919/39: Use UART2 console pinctrl where appropriate
      arm64: dts: qcom: msm8916-motorola: Use UART1 console pinctrl
      arm64: dts: qcom: msm8916: Drop generic UART pinctrl templates
      arm64: dts: qcom: msm8939: Drop generic UART pinctrl templates

 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           | 21 +++++++++
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     | 41 ++++++++++++++--
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            | 28 +++++++----
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |  3 ++
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts        |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts       |  3 ++
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |  3 ++
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |  3 ++
 .../boot/dts/qcom/msm8916-motorola-common.dtsi     | 11 ++---
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |  3 ++
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  3 ++
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |  3 ++
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |  3 ++
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |  3 ++
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |  3 ++
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |  3 ++
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    |  3 ++
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |  3 ++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 55 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts   |  3 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |  3 ++
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |  3 ++
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    |  3 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 54 +++++++++++++--------
 28 files changed, 217 insertions(+), 59 deletions(-)
---
base-commit: 39155a896925c3af2156ad61e821aa9fa5a1dbdb
change-id: 20250411-msm8916-console-pinctrl-069fd22abedd

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

