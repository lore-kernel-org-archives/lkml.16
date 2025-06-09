Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE7822FF5E;
	Mon,  9 Jun 2025 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512518; cv=none; b=HKNe8JJRoz4MjYW8Of6nIbE7PzTX3btKICwWLUk1nvASKnsJv82gnnEhMGUXOZvyh1fTMvi5qARBUqBL6NKRtqEGrC0B8xpemsMDD4jrf9+rtkSWLHpkUNCt9T+jpda7SehWxA2zNb6MyyGUiZ44NT40uwRSnJwDUyZRDhxliGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512518; c=relaxed/simple;
	bh=lcxMmmgMJHInwGzpCFkRWzyLBb5iGz+frAxW/UIgQ4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RytW8BQq+3fhFwYVdAKsBwPz4HCLYBNT31jzHxWKfrM0K8fgqnzwplVqtwuNybVt9eEh/nkY9SI2Ef5D1RokoM6Y/hHVniZ6Nc82CSN+TMdJwWFIMNYjtNz5620Ai528bMHjHtWguP/nxYBzyVOSrW4tISc/5pQOjhE+W7N9UGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JstRrvkD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JstRrvkD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45310223677so13783165e9.0;
        Mon, 09 Jun 2025 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512515; x=1750117315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrPhTIZpQpTInVFelKb2k4Az/r9q2Weg3w4rxnkgyCU=;
        b=JstRrvkD2N/X63T3SHeXhSRDwAQ926OuVtuM9XvRaoAleRV8gsWr0RcLBzhiYB1jB8
         n5iQrQQAeDumh1LnAtm5QdcE6ogngmjtsNzBFHgQgPVAGOchaaVoZ7u/fpyr1GhRstgC
         Kc3fLtV1H3HpeDAXFjp3dYceqeTx0SgseCKpS3ixXL8zd2oO5H8eFlG6OqkdoxltPjZw
         cBWeDQ2GNEJo//fhncULQnH1PD8Qx/VXI7DcvIPPTRMgzH/DUG7ey37D1nnpPx63tM17
         puR0InPMYcvXsPGb020NpAXRkGKTUKOLUiM+wsggyKHkjYTnULPdl08OD3dPX9TfqnN3
         qscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512515; x=1750117315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrPhTIZpQpTInVFelKb2k4Az/r9q2Weg3w4rxnkgyCU=;
        b=epwlRUDYHjUY4CMHM6szE7L+Qer7xsOdYSPr/1cG1IcOeUdH1r95HZY3TKvSBsV01t
         ejQCXuic55oqXow2MAjva8mfGqhP+8rxMoc6ZIJsHDdcKITLQ4gCXw3ZZF4egIRSPB2p
         elkkReZ0bNtb8x25ur1hDX/MJDysRtkB1val1koXwOCclxCrcCUVnXAvjHe7UtejdGqL
         9qDVlOrsIxHxAM0bL7Fs15LYzjlcbva9RvvveROTF0LPM8EdEUMU0eI/U38UW6DgGAQP
         dIfP2FQanVM3DPMZaGqgl00apObJiJ6zcHwaTLQND7Ful5/x1B4hxdLMM/c4tFGQ9ZsJ
         htvA==
X-Forwarded-Encrypted: i=1; AJvYcCUNQFTCo+uERD01qjBKLx/+pHzDTEHw7gfmkvapxmyg5asrTbW4rz7TQsfl9/0F0vvd7TUv3gDNzcFO56Kb@vger.kernel.org, AJvYcCWd5lm1+Tixh2SeP9Jzd3rSUwofNKnvlc/FxCzhXXSF1aOWGBY5r0JpF2zoo6potXmkRMydnTPYi7Vt@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjDk7lqSg9E+MHOM3JRqmU2LbNx1Tfg1KvKi1zpeLoKjebzP2
	1368e4ur/I5xdsM3hVX7EC+O1EhY2QcIiEp++tsqA1c3Nr+SXC/hYNGH
X-Gm-Gg: ASbGnctN1Vh5MoJoZXrxqTVYpNpJ3al1jWplm3tmPwNy00o7f+xQazMUJcFGfP8lcU2
	1P9I1tI1b3z6bz1QB6bmlmswq/hA+AxJ3LubETbPFU9c2xAlydpp9nxD/XB+ajzMXQJVLICppNi
	DXgztQ53FT7jrEY4ojUkCpp6sqAlWxG2NBszMVqKOSFcr0rLxEwBsbXsnLMlg635BYokAHVeOZk
	X4Juy4ORiUce79V0ZKcSrHjk2jPAVD5nDg5yl8K7pgqTAlcRglI2Q8i2dEvYIkP/EDc5QC35m5j
	L7qn1StJ8HDy1JDlrhASezl0lGjpV9ftdRZFNTcNCKKyEiOla+ryvElCzc0DrLsevg6kTaM0p70
	=
X-Google-Smtp-Source: AGHT+IH8d+d87qasytIhytWan/WEKNQkCJ5MRSNoOqGEJq+vqhXarvhfJpA5UduVPDcP1PlcvnPGqQ==
X-Received: by 2002:a5d:5f4b:0:b0:3a3:727d:10e8 with SMTP id ffacd0b85a97d-3a531ce7122mr10392078f8f.50.1749512514738;
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
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
Subject: [PATCH v6 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Tue, 10 Jun 2025 01:41:17 +0200
Message-ID: <20250609234125.722923-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
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
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..84c85a222b3b 100644
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
@@ -652,6 +653,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1411,6 +1413,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
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

