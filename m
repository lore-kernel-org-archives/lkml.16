Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA64E192B7D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169361; cv=none; b=F2UrgGas1gwA1r9+Uc4JvuYaZD/Va5hCviq/koxbvCDvvRmXCm3eIGLHmHd5YzB1jiKKFajhwp2M9bOKz+RGiLEoTrND22SZen2r7TW5nHI9gJLE4/jv+sSWkJGjJYuL0fODFTRyB9kI0cCUjA0XoFrVmdzxXkP0B7L6ceBepEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169361; c=relaxed/simple;
	bh=2NCrCz8LLsWzrMcIoaserEKJxl3tKd0aKFxQe/BWlV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nU4kgltsQegF3ibOsXSGwEARbHcjXGRo1Avk4ESGDg+MkdHBhmObnSHi1+JAjB2nC9DegBXCqYlnTrwsilsippAlk0pOTxu6U0hOSnK75TaQPIhps5CXrfoTM5845ZKHOjIgQIPqRSMYldW33K3oF+9pDhKf8ZWV123WYW0SSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0n7sTRg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0n7sTRg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912baafc58so1738978f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743169358; x=1743774158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+SH4rhydJ8Ber8ZCLqHRWR1DQIYwWheJrU8pNciPcuY=;
        b=h0n7sTRgF6tARgvWKux0BO2s8QmKlqGtvTBBiWO5quF9pXjft9juxsd+AX0PY8pC0S
         WFFG2IWsUcJRWtMVVmHh8xuXjVP5c61kOdWd6hmTjoLMZUU3GYyNUrFx/W9YohMYdb1F
         uACvjZuB46Ckk01tioXAx/c1+qlPrUpwym29/OHex88WByQjPYcL3UQyBSVlX/zc1vsG
         VbfsUw0+xPxMfnsHu/AR6k0gYh98pmSVFlh5B1cVk7UZ+hy0nUmNk86WGn0MaEXdmUbe
         D8Un/WyABtx1hAD1Nqy/RRZmd9SQ5yaVtXkgB0u9b86jmjYQTuxV34jaHCJEdOWfU5ZP
         c2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169358; x=1743774158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SH4rhydJ8Ber8ZCLqHRWR1DQIYwWheJrU8pNciPcuY=;
        b=O/O4EqJpAEG7PiL2FZXf0Tf1YlHgUyZg5hk9mmi7g6oauMeQJoBi5xgnOsOQKbJtg2
         R7OqRXABysuMCRNSjKr5JALZ+TkdX1GL1pC/krGTI2xQtSzIJ/quL172r1cMVaPAakHN
         0XENybH/1hhHOMV/ctedyuveC3L5sCg9+3jltdJt22q10FHFkPn+Hf5Z5xmQSIgeX3wk
         fpvL1+AVJRpRSt+O0tUoOLvCuSSTkbYNj9a1IfmbWGYlTUSLEZc4RrPzNS1HchMABlys
         xfrgyn4BpA30KQ9KyGxYPXTYN84OE6kWtoY5m97XMbQhYCPjJojq1u7yU/4MfNRuMeXA
         dqwQ==
X-Gm-Message-State: AOJu0YxILChTW3hksaMz3+5DA5BIwhR40NDgQ0XAOJtIDC54x3dFWU8w
	V1sUnlDTOnCVqK5Hqa0F9R/oavjH94bbiN5pUUFeKF+JGpCUHj+/s3bTZmveTc8=
X-Gm-Gg: ASbGncu4O5gc2e7L4uYIyq0B2FQymo7fqWkYSzpB74haxe0e1mpBjgFfoE60oQlKIyP
	kZ4mThE5wHHoU91IVtGsU6txkMlrXX38cr5rYurcNtCr2N0cwF7YW06Aod362STcn2i1mtDPfoA
	2oUhLiHDtqzXhhQ2WoTxY0Q4WZqTbKgxBNNOHXkY37dvBkkKmYvL+7lrifKuS2LawlmyDsN+oQH
	sU21xKEBxgGpi/kmlNGKL+lj3RKzKR9pV2rhseRQBsiVuU3rtH9ZOUHtXtYO/VEmmhrdko1sQRG
	oe8eLsO8Py7BoWD8S0f2QqO4WrBacxxOlIjiKJTHsUoGonA1q8SxWGwHqhDtcNY/nyG1niA=
X-Google-Smtp-Source: AGHT+IFb0QUtRw3AWFuiKbuavZnL0eoZshfs7L0pG9I3U17WzNdOK+7ys+NGLUcDCibKIFzjzhDmKQ==
X-Received: by 2002:a5d:5f45:0:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39ad17607e1mr6220953f8f.24.1743169358092;
        Fri, 28 Mar 2025 06:42:38 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e097sm2595454f8f.80.2025.03.28.06.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:42:37 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzk@kernel.org,
	S32@nxp.com
Subject: [PATCH v2 0/2] Add the System Timer Module for the NXP S32 architecture
Date: Fri, 28 Mar 2025 14:42:04 +0100
Message-ID: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
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
    s32g platform

 .../bindings/timer/nxp,stm-timer.yaml         |  50 ++
 drivers/clocksource/Kconfig                   |   9 +
 drivers/clocksource/Makefile                  |   2 +
 drivers/clocksource/timer-nxp-stm.c           | 563 ++++++++++++++++++
 4 files changed, 624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
 create mode 100644 drivers/clocksource/timer-nxp-stm.c

-- 
2.43.0

