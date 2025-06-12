Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD0D24A06E;
	Thu, 12 Jun 2025 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734923; cv=none; b=tNGUvANS9Gp11lTgXJgJLtRiagiU+WU0JSzUMxVQliKW7qU1CpU19i01xmZXow6QyUZBp8yZ8RXwnBgYPLExmBCBa6pgVgMrvvZYbVyZxx4D4WDVVtld4QFhTB+EBetpYKZ/uvcsOwRx39M5Fd3WJ6x4fkz09jFB6msgGGGCzL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734923; c=relaxed/simple;
	bh=NzF8D+jscEUsAE/1/Fd1SPvbvgtFxlYHFfAZNNIr8K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxtD+qo9V+rxiOBO+1TYv9zdiHQLeBKL1s8uoOqk/Z/V2GQFN/K3bJW9cLLQtNqLMBahsd3Mxu4cJFOVW00FMgSFbSBKTkN8qC2Wdy0DqilUTl4HM9cedP4aOupy9TFsE9frKO70/AjJUy73ugfJ2qKJN4Wig3/yYzsJwGoL7ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wszjd2Nv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wszjd2Nv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cfb79177so5451815e9.0;
        Thu, 12 Jun 2025 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734919; x=1750339719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=Wszjd2NvYuIstgXcDpTXpUYORJ9fGc30/fR3YWlNY8WcxdIzptbtmj4fAXR0m4oMsy
         k1kekUHsgpBr6o9k03GyLV5O1HOez3krBlqK6Hk3Q95A0YVpTc5QH3oGPRS/tZJd9+vQ
         NNL3ZPE6k9E9sgQCQjClaPHtSOqhxsiJnF0TTJ5+6z5kqyHCt2SR23Kuje0Hv9hz+syo
         456NeV43X8V98XcJAcpURkIte/zmJpqD6MmF3WeYWyzryVQAJdH9Y0dQaefC9im/Z5Y1
         kABnfI2ttQm0dnxNkHFEwKns07JKLbQhxc3M/9w3RrpomTiySvkWpyqLuiQFEV0+PfaY
         zjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734919; x=1750339719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=bi/5t4P5UFBcN0B9lkirfIg1NN+Wyh0vKst3am4qxyJAvU7k683yKdnITz1C8JbzDM
         zBbzbI5gTMqBpaVUab13BuFbvQNCYIDG1AWMzoCUBG3tljH8MUKN3CBy9/6O2bHLpDB7
         HQhJ6IDyLjFYd4Uqol9TF+2xSxJSn0L/HxiieojUJUR8u2UDOukBQhQ10wp6J59+z2iu
         GvOpg47YAEeShh5L3yMFuD6EQDhAoE1avf47DSx3J70+UNy8ostHYtaXA0Vt354cZTfY
         Hd38K2bpC5qJdzV/YziYaIPTzZ71GjT9/nmO0rbjUTsPGlH0fW/KolW/kho2AgbLdz7u
         LfCw==
X-Forwarded-Encrypted: i=1; AJvYcCWscbjys9yQ/f0xaPBM8v/VCV3CeYrZqm9hDpHz3J1+O6OjklDZIcipw0+/Bq1KHfKL07mFYcc49bJt@vger.kernel.org, AJvYcCWzYk49YldCdaHIE7y41Hh/hk0LBMskqNVf3Gi9n1QsrNKCLPT0KUJRZ1KhuHRIh1nWGRGcx6mU0SqBp1zP@vger.kernel.org
X-Gm-Message-State: AOJu0YyCrcB8zuvrVaI1/CodqjVxqQS+iMofqrTU3GM89w7BM1Dz9ZTo
	7kiqJRoE4vH6uUmvciTHez6Gyc2Op0isXkQ19e/Nm2tiwH/gYa3e+gYg
X-Gm-Gg: ASbGncs5NFlUD5dD0BNm+1uPj5YFpYgmsGfHfgzuiTNe2R6Ch9yABpQzigJLGGKC7l5
	EoaIKhZ5QW/jGtTobf5novcZ1Lil7oDmxg5hN5rlxlcJj8ayfPg6pvmSFJXTEZcoNvF2no1T1X1
	CO81X/7LTNQDYoYBoVmYeV9dDjotiIQlpeduF2HMGIZW9dRGKWNu3UYWeD0IYYn1zod8LyLJH9l
	h6pNMSBUlbTajzosj+X1cvi5YAAo5/+xfLv89XvBWPcJDI4ngHZoQac8VCQicRmcP3ffTkWrZeF
	4kMmso4qwWOLkVQ/okUYhskGxprylAU3JJp4u6i1h2nzS9VMAQVYEr+mkvuTozRIqERvl8nckBs
	0IpMQlXR/kA==
X-Google-Smtp-Source: AGHT+IHcFVWEX+KjeW3ppd6At7eyZ4IER05LLmIVtxkWrdoTFMl7T38r6NDDqCMPQK/Fvj5rzzGoqA==
X-Received: by 2002:a05:6000:26c7:b0:3a4:f70d:dec3 with SMTP id ffacd0b85a97d-3a5606c7a11mr2662391f8f.16.1749734919190;
        Thu, 12 Jun 2025 06:28:39 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Thu, 12 Jun 2025 15:28:14 +0200
Message-ID: <20250612132844.767216-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..b43f9502acce 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -66,6 +66,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
@@ -654,6 +655,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1430,6 +1432,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m
 CONFIG_HWSPINLOCK_QCOM=y
@@ -1530,6 +1533,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.49.0

