Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9ED2522BF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903011; cv=none; b=L9THir8KkzbQo+xY7v1w8uzqgd2rnHI9E9PC7ybcyIr+SyeUlA8tfpXtL0klUY7zkjdD5/3OYOWP63uMUNsKT0BM1uUJTT9pUiRrytmsTgoJerRYzuSql/zN3+vaXY8MkJx63CzmM6+k1T0OYwCDBjs+uLxB1nhHBmpQNXP9HxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903011; c=relaxed/simple;
	bh=Ys2EqgACX0cL+daHoP5EiN4rYMl0rh5or5GCGkkGTKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oWJ7qiYf1tOwCc+HtdhNj7pPtTLpB3740O4pZ8zo9FjtSDfvx24JlGQZt9aPG5noCsXstzOiyHa99WVE2UL0Ho6u4X2F6HZcjgbGX6WC/ViTpOGqLAUyKjkPNcclj0yh5ZviL1IDugRa2Ois6f7CGl2RPR5RUqYosTtP4JR7cmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aEfH70VK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aEfH70VK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso8427865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744903007; x=1745507807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8+TpeWUK0EnK7TAevGTAydH5jdr7kBGeMy1Oq63Os0=;
        b=aEfH70VK/huuxFsI7uQXqUlBBZvfCK1z7eALVozk6IqVbdr3XqBaqo3EZftgaS7xNs
         pcCmLt8fkx95QwKJVfFe8i5n03aEnuhc6vpxV1gyZF1hkJRpSAXXXG1tr1JlaFxS/srl
         zyrLH96Q8KImvIUeoAVjDKu19DXRpp4byBiNp3b6tVXY8WzCdf08Tl56Ds0PYmI6J8g8
         982bquQOAgZ+DIjVCl+PIq6uSkm/GQmxpgzvZHqUlOq0LgcFXAtS/06CV+lJRN1Topvv
         Z8/gPJoEmxkDJ4YwQfRrzPhPa2bktbDsrNukRUvQW3JAvVivr2qcOhKNZCSGvPQkQ1m0
         z8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903007; x=1745507807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8+TpeWUK0EnK7TAevGTAydH5jdr7kBGeMy1Oq63Os0=;
        b=l4yWFyz6hnIgYhY23wXJrKU6EcOyV3+RLWHRyH+yZUZ69WNZ+NrxwV1pYIlbGBneat
         dBHWsbz5loQ8H2zvx9cnLCnJy5357XeZuSLaqAVlQhGbv5RmgHV9rPECovn6xvhxLyg4
         aUi6xtOZeFEmE5fvy/eucbjPiO+hZCS3BNOQKZ1QX7UlcY/UYDJxq5AQ8UstRQ4H4isM
         zpkGF17mmvcx+d8/0dhq3SPO3h2WLUPLO4smJNY2KHqb9hHmOhd3Omr/YhdepXnEOoj0
         vwGXaEOoffAO+OjDyFK/r9va45/CLWx9/Cyasxiau+DDEVUG7ESDY+1NFpKV9QYQ611e
         bouQ==
X-Gm-Message-State: AOJu0YxrHxZzOhKn61JMFVa6MW0d4exJMzqGHOtV5ESvASqstRF3H4qK
	opDs5tsLo+l11dU6wGePKKl+/n1nxpBYW31q1ovENB0j21RvsONb9zidnxonwupS8nNXRHxUr7N
	I
X-Gm-Gg: ASbGncsz1UhMc1UE7ifmGf+EVqd5ij5dzC0BMLgdWWXOr8ItiHON9w5dThm1ohKyMTd
	eH+oipEXJy9gzjxUf0fteU8n0dYiCKIruglO0QZ1jmNFHEFAGLun5uOfCWtp4VJQ8fzzNrM9hUY
	OiBB0xXeRXbCYajfr8/fXvsDyVlN0uh/SMEbXz72TuHSG6jeTYH9eIqbHFxotHGZpI1eHAzYGKE
	sNVJQMWhD17pD1t3xqQuZARv+mXROHJxqoqWR+dd/DoS36vNu6udAN2ExynIs+6cd6vnydr9WhE
	w77IHbx6jT/VthmmP/b3HxeTTrwKmwhSoLiblT688wCmoc2QMKjQ2nb62kA+7xlCsvY=
X-Google-Smtp-Source: AGHT+IEdRyryYWgHaL0fwAW/Sj5APK5Alf2wY8uJlmGrsmsoRU/YRkadjOMvEcs84ubN/8NU1/Z10w==
X-Received: by 2002:a05:600c:1e0d:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-4405d5fcd26mr64938685e9.7.1744903007316;
        Thu, 17 Apr 2025 08:16:47 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445315sm20528346f8f.82.2025.04.17.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:16:46 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzysztof.kozlowski@linaro.org,
	S32@nxp.com
Subject: [PATCH v5 0/2] Add the System Timer Module for the NXP S32 architecture
Date: Thu, 17 Apr 2025 17:16:17 +0200
Message-ID: <20250417151623.121109-1-daniel.lezcano@linaro.org>
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

 - v5
   - Fixed typos in the comments (Ghennadi Procopciuc)
   - Added clocks bindings for the module and the register (Ghennadi Procopciuc)
   - Fixed help in the Kconfig option (Ghennadi Procopciuc)
   - Changed max_ticks to ULONG_MAX when registering the clockevent
   - Removed Reviewed-by tag from Krzysztof Kozlowski as the binding changed

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

 .../bindings/timer/nxp,s32g2-stm.yaml         |  64 +++
 drivers/clocksource/Kconfig                   |   8 +
 drivers/clocksource/Makefile                  |   2 +
 drivers/clocksource/timer-nxp-stm.c           | 495 ++++++++++++++++++
 4 files changed, 569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
 create mode 100644 drivers/clocksource/timer-nxp-stm.c

-- 
2.43.0

