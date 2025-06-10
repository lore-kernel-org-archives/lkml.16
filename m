Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC998267B6F;
	Tue, 10 Jun 2025 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586374; cv=none; b=ogabXn8kzlTZosdTkxpKh6whbHNNYb1kzH1RC0bGEOtL0QmYpJsRy+XxvqLeDcru6cGXNYYgkorxqjeWcVBvZxT1vfFSeOg7j05o6NbT2bNDvZCW51J/yjPPqrAAfcFJTotLXVhQaOy+0Tr5ztM6k6YxJNhEsL1EzMhNt13lKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586374; c=relaxed/simple;
	bh=NzF8D+jscEUsAE/1/Fd1SPvbvgtFxlYHFfAZNNIr8K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mySzFlv0jAxAqxwPj+kM0G24GOFHg8zI2oLkPwOPTeibP/UCKkglngdXt9KipT8RJ3j3WgkNBaGlFG8n6vj9uzsAqU8owlPW32Usyq7X8YFHE2o8NVUeDMirgU1Ejp1+/ADuLp/1TOfHU3OCzRlXJnATqrrnxIM4Jt7gCpc5W7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdzMxRaI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdzMxRaI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cfb79177so29126325e9.0;
        Tue, 10 Jun 2025 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586371; x=1750191171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=KdzMxRaIa2jZVk8fYOL5Xxxm/PC4+R+e0nw3EHImTR5X9qf+A0xCFv1S2NcfRYQjbL
         WJ4jJYCEMhkNUmtGoCCut5iQUJfxsm17xyaiv86RJ0ndu+KLVTRUdN5kV8JVo84F2TYI
         UM3CO21N6GNqsJKH9fadDkZtzjau1GkIx01nDN8bpY1F5DmEzNuYdDyt/BdA7CvLbFOP
         xBRLbsQA8PT4TjLMFp8NOQyK3L9yITM4P4sYDGAWOL72ugQ2vX5fcE12JgrRy+ZwToL0
         8JJx3YhD2V7IPGayV+iU8NwNI66rUvwhDU1y//vhpIrTdO2nhOvtVm2/G3GmzNdqXhVW
         FCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586371; x=1750191171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=eTqra1pfd8YnM4CHo9zj23l5imjfiAaS8/5K94S9ivsv8uv/KHQssx6tpEEeXehdiG
         fyCsatqhDoc62uysTuyvRCIG0lbKAUeJE1O/XuP0ZaAWx7MOstpD9CUSENqth9b/bi2N
         xtr3TOXoWGCPuJdZizJxp0jAuu+vQW1RV823gcR7gg48U0Qz6giWoctehImWNdb6m3GU
         0LN8nWwMkGoxSTNMSwNd+/oPNfTzzeowkq/lIzYjfwOj9WxsccZDZ5AcMlR3wAvI5uKT
         yIefP2Wo4IZbWTnDzhShBo4JUk2yMOLM6rRGvNBfi0RzTPqbusNnDE61Jv448sjaFTRc
         2maA==
X-Forwarded-Encrypted: i=1; AJvYcCWov1zSh5+B5bBTwAlALwlNDT/cZKbQ72RTnszLMWisoCzUQblrtr7OaeqEVSEt2PhTGFAToT8er+2tKJeM@vger.kernel.org, AJvYcCXWEjAWouXK4lpnuE5xW3ovHZZSWz3EMPLzXW7noFArQciUmhHFvwUtOXWe8odVULPK7Wi0/8QG5jfH@vger.kernel.org
X-Gm-Message-State: AOJu0YyLIZo2+NhizwGQrMzPuo5VRLuXlmFgIGTYQhWfXyK1If/VqebS
	FKTfSP+x3D7vgYYuRSmJeIRjOd9H7etsFhRxv/iZtVmzMQ3h1aP2kPKN
X-Gm-Gg: ASbGncv9/XOL3zMQv8FnprjDy2EB+xFaH94eBM42shEtXhMSNbuUhq8/9glpNFxyywu
	bGnCLTZusTIjFpeX6DDSpcPkBdqI+/u0KkW+yhIX7FsjG9ax4VA4JkHm6GBOKEI/OUx3dTCrQA8
	fryMna9JRC3jGYFhFgBlH0AED+RuwUFqdDH3IhyR9UmBP6b702/wHYPlezL/AXqqAsHSUE2MxsB
	mTpr0jocTdYcBuiZiVevH0c3g6Why4E8S0ZbjRROzOddPQeQZnyQOqGZLSxdI8C29/MeF13zkhd
	VTk+CSrVoH0o7GzlJsnXRbgvNWogXVBiOA8oMtpjklSUGgEBtq+xw6596hyiJLpVNcjETEEuNTg
	=
X-Google-Smtp-Source: AGHT+IHAfus2as8xEX4iDfu63duVTXHrbs5exQRrMVtiCIQNQ6/TZbKnWxqRaxxHybEddLqJocBNng==
X-Received: by 2002:a05:600c:1395:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-45324ec37d2mr1288935e9.13.1749586370869;
        Tue, 10 Jun 2025 13:12:50 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:50 -0700 (PDT)
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
Subject: [PATCH v7 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Tue, 10 Jun 2025 22:12:19 +0200
Message-ID: <20250610201241.730983-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
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

