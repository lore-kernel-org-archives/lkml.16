Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C79192580
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725201; cv=none; b=jAtOl84EDWTjkG89Tx5bjA0uqU+jTWveU0St2pqJ3/Gbb5vFsQqntAbHOOwsX/RXAcetbgq3vorljlawWHhicPjdoAWeI4o+RNJ+4bWEqvhKO1Q28hQWvq83ThsfObv1wUToVaX0mvXnvDFsNy25drJR2aHk+kjV8a/NsJ2oBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725201; c=relaxed/simple;
	bh=bgzW8YxINyu6W61KznQTMmt2So/8oOuKzrFONOEyMzA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DLEEl4MX394IOPVkKRdu+ugsIdT6lOM6THr3bOXpfR7oFZYUnIMI0rnj0OPomyzYzzgoaWmRkEOmv2FjFoe6mr5cFwhB4OLuG6Z51JHne3huG8D47RXASne3tsRkgmnrWZWd/cbSUAjakD+zj/WuBxB9MgpqTaf/AcyYm+DArV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E1RGe7Hl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1RGe7Hl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so3394645a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725198; x=1745329998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AllNkRrbyjcjvSu2WZVuohdOWdJ1dJ6T/kkM49XqA4g=;
        b=E1RGe7Hlz1mwl75Uj/uWezX1dfBasXulgXnJjWxPIfaV3sKkq/2zg2Nkq9k+RJoct+
         8o+HJJw5B5PPMlwHf3o67Geo2NbrPbKdEpbnuxJLC9Ab9/IZ9YgMALAHX0jE/o8lctNF
         g8X47zold4lP70zcE646lC9m8KFFrN8YHjrboXe68aNmNxcRi20GDZjamXoCsMLR1bV4
         seP45/eQlhfblZnWRIsHNGzWVGfyuZPoXTLkCclO6p1aS4oIOxszGt11gcEciWLY8W0d
         0eT85PYDz8Bv1yJhgdRrbgmFhDQvMGl7gyru3M5L5Fzhw3ErmQ8AcxLeldeGIGPpXqV7
         ZtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725198; x=1745329998;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AllNkRrbyjcjvSu2WZVuohdOWdJ1dJ6T/kkM49XqA4g=;
        b=oS2kJVuRLwM0yPZ1x1hRVdVZQPm05+hPwBUsEcf1Np8+4x/bAx+Ox4f+CvokzePdOO
         Xm052RSIua0+VeSQre0/XFflm9Mf/0UITP86v65x5B1dcAj5WrHNvHO3PTeWSdt67jDo
         CmFnLE3IXKf7OiH610U2Y7MAmPu8+ON7Bopbd9PL2rUqp7gkTmLdsWME0Qfv/bziM7DC
         +G8Kpc41ShNn1eJSycO69f4bWUm048Hv46kXoUFgyIOPRIkgDOlOoiBscWj3Agvq7MgI
         mvxZjGyuwL+JXwouEiCA4ncqZ61ECIXTA43OhV/JRTzDTHgIh+ubCqLoFwTONMY4A6I1
         7YeA==
X-Forwarded-Encrypted: i=1; AJvYcCWNEG33Td2gqTHu4ipYxL9woXve7TJ59W5IGCkgFVvteHimXt81Z5NqpSIXDG/wwKO3DuisWj7OHO6CCk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynqEE0WFJgtVwWqbEnl3HiREn9AICWBFIASd9742MfZjZpzErU
	T9sRV9K7JvJGb9ndLpadR2fGzQ2UXyT8n4Of9Cyj6NnnrYi9pm83UwattkefWLE=
X-Gm-Gg: ASbGncs5WHhqtK/ngf8mpHigVBbdDDDcd7Tf16vZ4BYHub4ushAiEOBaLvldVBSM8QJ
	8jNmuvE6dipj7X/Zceq4JrTCE00eyVMEuDb99lzjKcDYomxyhT70bE8fJinUmoolNl7IkpXcsWI
	9Z2BzH+Y+j8jp6GSc1/Is3DQ+iRh3i++XMkjQITceFeyCQP52BkaaLJrvkzolbLHW52R2HN3887
	fUqgf6gBzZqBMwKpKsdF2KGLpXwiMPUVElw5tlr57fiSfkZogyRiGaa13SO2vpPwYCoeoXKV0TB
	ua1fBNm38lDgMrnis6P23kRuL/HZTF8PRBI7Hu89/gMo6DGYd3Zdkgo=
X-Google-Smtp-Source: AGHT+IGRcEt9oK3lxyGiEnhvV+ZQfkcTyZLJgYiuW7WPrPlF2pqkkrZjNilPDswBvYfDwLxbNzmKXA==
X-Received: by 2002:a17:907:a48:b0:ac7:1ec1:d8bd with SMTP id a640c23a62f3a-acad351bf05mr1481526966b.29.1744725197572;
        Tue, 15 Apr 2025 06:53:17 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:17 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/8] arm64: dts: qcom: msm8916/39: Cleanup/fix UART console
 pinctrl
Date: Tue, 15 Apr 2025 15:52:43 +0200
Message-Id: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKtk/mcC/x3MQQqAIBBA0avErBtQqaiuEi1MpxooDSciiO6et
 HyL/x8QSkwCffFAoouFY8jQZQFutWEhZJ8NRplaVVrjLnvb6QZdDBI3woODO9OGqulmb4ydyHv
 I9ZFo5vs/D+P7fqAypxVpAAAA
X-Change-ID: 20250411-msm8916-console-pinctrl-069fd22abedd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
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
Stephan Gerhold (8):
      arm64: dts: qcom: msm8916/39: Move UART pinctrl to board files
      arm64: dts: qcom: msm8916/39: Introduce new UART console pinctrl
      arm64: dts: qcom: msm8919/39: Use UART2 console pinctrl where appropriate
      arm64: dts: qcom: msm8916-motorola: Use UART1 console pinctrl
      arm64: dts: qcom: apq8016-sbc: Move non-console UART pinctrl to board
      arm64: dts: qcom: apq8016-schneider-hmibsc: Move UART pinctrl to board
      arm64: dts: qcom: apq8039-t2: Move customized pinctrl to board
      arm64: dts: qcom: msm8916/39: Drop generic UART pinctrl templates

 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           | 21 +++++++++
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     | 41 +++++++++++++++--
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            | 28 ++++++++----
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
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 53 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts   |  3 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |  3 ++
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |  3 ++
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    |  3 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 52 +++++++++++++--------
 28 files changed, 213 insertions(+), 59 deletions(-)
---
base-commit: 29f8b76c55e05821f41c3e975e6a48013d8a861f
change-id: 20250411-msm8916-console-pinctrl-069fd22abedd

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

