Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3723372B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584845; cv=none; b=SDNJhTrrAf0r+k97DfzjTpn/BOqsQ1sDjO+bq5JSKCoCtOCajDoolyBTT20ildagLe3Y2Od4QQ+/IOvhHfOc6Wnx+yGlnvFEGLzuAx0QFe9wuFUtd2feQhK3gcyGKb5LcXg+qabRAvu80+k3ToNxaFtmQ4Ao4KVFifBydeeNamI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584845; c=relaxed/simple;
	bh=Xp7NjTmdRWtkvSxci/5Q7T8swps/gmF6h+YZGeiBWFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qpdmscezgmSExnISnXa2gloX6EKRDv3odVv0AOHC9mm/Xl43GX+8xCQ2iRKe/RvlBtqNuu4q3TXgJLpaSa6V0sSB5fHAyp7iZ7QefYXzDIXWaBtXEHFgvNLUGGik96ZTcGyy7olBQghvy91aO1z+ZXovp2t7r2uwtElYdsqI4yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEaLNOk7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEaLNOk7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39149bccb69so5670533f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743584842; x=1744189642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3udIIdXkF3HY5AYksdUCIcCpP+zIarfpBsTfRd4m5lE=;
        b=EEaLNOk7jl16AF/8cHyXGPSc56t3cLQPrh0/R/vl87zkQaKeaBEGTpWzTJjoq9Yay2
         2IgvR9r+gHaw8DMxeRNZuhe+tco2h9LjMibm7ZTpqOB89irN5l4LfZzddlWU9Z3L8NYx
         brJRtkhjIWqckOx8W0k9vjnv3b6kDRb1iNZ6IzgXAO31ipsQxy07XWHvhIY5RY/9HPav
         YsqYCiYp763O3PzL/N4mY4td+R6Lu/NlI4iHfEvIeLUQQgdwylneFWxLoVOM//Xh2WME
         CQtKzyFAO89MQ9C7G5bZ5ecieUI1oMVfNb9yBgKk3QqxXZ/fpzcqNSsvzqa+bQ8ymo+5
         nSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584842; x=1744189642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3udIIdXkF3HY5AYksdUCIcCpP+zIarfpBsTfRd4m5lE=;
        b=vVqta+RmIrLZcNdDMVLTy2XnRmU34sihMiJFk6W+QgmCdcanInqyrx2kc/7eyy8tHX
         tSQqXtgkVsddTS2uZHOSs6nUWZiqgulVPnOvQLMr4jEZwIgf23oWaL1XRW1iuSEOlMcq
         c73DG9faDfDevVa4SE0pi6ninqoZwlec4876T8G/5CA0gyQoQffpiJ7jC6gItnRaGsBZ
         BfVQ7PzL6xsDRwE5Y8mQR0XXglS/+1ZCwNd0ZmR0J+ZaHrf6sutf5YkfBe/3Tr9PiK0E
         1eLrAOlQref8XlaLw5nQCAt3fVHg/nf8G4iJsO83UrLNzfSDlAElmGa6Zs1yO0B1FfGb
         7AAw==
X-Gm-Message-State: AOJu0YykIMYOzombGSublrCUwLZFdLe6TJUj2GPHgpvh5GSOhZgQC8Mn
	pc81PjpkTIDnH/VFEm+lpS+V29WIsJyZQUCXcLGUBXzXkSHYSyjoIIWOoQ17rbK43OzGmMkYqJs
	j
X-Gm-Gg: ASbGnctV4x+hVTxEuBWK7vou8UTSQyUrvXQf7bBvfwc1Ld7l2AHAbCjzJIG5pumOQmn
	WEhGboLOvqDHMVqPhQgmCt6DrzrTdd10mGCG1yt10KwMzWgSPcuCnPPOUMUFjGpEo1YNATbMguq
	6JElU7Q45b7Xb8054Gf32rci162g2h6QcEkpntmwKRXUABuQU8Aim43YN/sGo2ZaCHU8xC5xP8x
	xbO8+6t9XH1y+ZG35u71PQuU/lnM2bEnzXS+Hf9XtGsjKCvjmxlmOMjPMFQPMEc9xW8tLJSyFaF
	94HIMzUUI+0ie8wpFQTpC1gwl1T1w9/QJo4c7HkEi3DRk7EEEWRmqycCGtGFyxTEJWYwBO8=
X-Google-Smtp-Source: AGHT+IH/gWHH6q9gUtsBn3nzctAro0gqQPBm2kyxBQlei3/mM8qB/SGkhOkiY94zTQT2R9T56TpIXg==
X-Received: by 2002:a05:6000:1a89:b0:39c:1258:7e19 with SMTP id ffacd0b85a97d-39c2980a18fmr1040941f8f.58.1743584841917;
        Wed, 02 Apr 2025 02:07:21 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b65b4fcsm16680724f8f.11.2025.04.02.02.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:07:21 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzysztof.kozlowski@linaro.org,
	S32@nxp.com
Subject: [PATCH v4 0/2] Add the System Timer Module for the NXP S32 architecture
Date: Wed,  2 Apr 2025 11:07:10 +0200
Message-ID: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These couple of changes bring the System Timer Module - STM which is
part of the NXP S32 architecture.

The timer module has one counter and four comparators, an interrupt
line when one of the comparator matches the counter. That means the
interrupt is shared across the comparator.

The number of STM is equal to the number of core available on the
system. For the s32g2 variant, there are three Cortex-M3 and four
Cortex-A53, consequently there are seven STM modules dedicated to
those.

In addition, there is a STM variant which is read-only, so the counter
can not be set because it is tied to another STM module dedicated to
timestamp. These special STM modules are apart and will be handled
differently as they can not be used as a clockevent. They are not part
of these changes.

The choice is to have one STM instance, aka one STM description in the
device tree, which initialize a clocksource and a clockevent per
CPU. The latter is assigned to a CPU given the order of their
description. First is CPU0, second is CPU1, etc ...

Changelog:

 - v4
   - Removed useless compatible string (Krzysztof Kozlowski)
   - Dropped of_match_ptr() (Krzysztof Kozlowski)

 - v3
   - Fixed bindings, compatible description and name (Krzysztof Kozlowski)
   - Fixed bindings filename to fit the compatible (Krzysztof Kozlowski)
   - Fixed a couple of typos in the driver changelog (Ghennadi Procopciuc)
   - Enclosed macro into parenthesis (Ghennadi Procopciuc)
   - Replaced irq_of_parse_and_map() by platform_get_irq() (Ghennadi Procopciuc)
   - Fixed checkpatch --script reports
   - Removed debugfs as the driver is not considered complex enough (Arnd Bergmann)

 - v2:
   - Fixed errors reported by 'make dt_binding_check' (Rob Herring)
   - Removed unneeded '|' symbol (Rob Herring)
   - Removed 'clocks' description (Rob Herring)
   - Removed 'clock-names' because there is only one description (Rob Herring)
   - Renamed 'stm@' to 'timer@' in the DT binding example (Rob Herring)
   - Fixed dt bindings patch subject (Krzysztof Kozlowski)
   - Dropped 'OneOf' in the DT bindings (Krzysztof Kozlowski)
   - Dropped the STM instances structure
   - Use the dev_err_probe() helper (Krzysztof Kozlowski)
   - Use the dev_err_probe() helper (Krzysztof Kozlowski)
   - Use devm_clk_get_enabled() (Krzysztof Kozlowski)
   - Removed unneeded headers (Ghennadi Procopciuc)
   - Removed unused macro (Ghennadi Procopciuc)
   - Replaced 'int' by 'unsigned int' (Ghennadi Procopciuc)
   - Removed dev_set_drvdata() (Ghennadi Procopciuc)
   - Prevent disabling the entire module and set min delta (Ghennadi Procopciuc)
   - Factored out the clocksource / clockevent init routine (Ghennadi Procopciuc)
   - Use devm_request_irq() (Ghennadi Procopciuc.)
   - Use irq_dispose_mapping() for error rollbacking (Ghennadi Procopciuc)

 - v1: initial post

Daniel Lezcano (2):
  dt-bindings: timer: Add NXP System Timer Module
  clocksource/drivers/nxp-timer: Add the System Timer Module for the
    s32gx platforms

 .../bindings/timer/nxp,s32g2-stm.yaml         |  53 ++
 drivers/clocksource/Kconfig                   |   9 +
 drivers/clocksource/Makefile                  |   2 +
 drivers/clocksource/timer-nxp-stm.c           | 495 ++++++++++++++++++
 4 files changed, 559 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
 create mode 100644 drivers/clocksource/timer-nxp-stm.c

-- 
2.43.0

