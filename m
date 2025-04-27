Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290EF1FE471
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739859; cv=none; b=ub24Mq6w7W70j4LkM2Egfp6XZQl3BOaajEzknWgdtPBEq0y7/lJwWaEGhi95tPRKTL6d0xXC7i7Uc1azE3GHjeLwCw0yy1CpUb3ueQ2GDKTopA1jrWOqdqngJyWtJP/YgQ1cUGTwCaQqL3BaTsyjPKaoZPyK4XgJ/67h63UDohA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739859; c=relaxed/simple;
	bh=2FOgtbU77ukSFaTqs3+C1Yzc7I3qiEYjCzzEQTK6S3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNou1tCtCGzHFqq4rNXGZEL6TDgx42FrwZdhtn2HqyS/6UyRD3DpeadIm8ofdSZPfmzKQGR0YlOySusncLVuBRiZjolV9f227PBQfq2Ibj1wJRGpgCx8MS1bVqtcQOEwWjMF8qX1yWq0tW4Hozx1Hp06cZxhibMPdAkvIw+eLgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LwdTDLCM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LwdTDLCM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso23519895e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739855; x=1746344655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URqZNBSvISpfkOaSlJCBjJ4EBAiXVSB4aYiQ2cb72Ks=;
        b=LwdTDLCMo1a+GCDc4emeVZn5x9d6ll454wkCVhgzJf+bJae3wRdM/oozaSwVdYGyFv
         W5GsYw4ulBdYmsmMMauJHH5fVly0MvdmAywkMIpbKTezGVY/dohdEJf7tx1FaeUi+isJ
         50dCpEGxSwF3iUJmBuGpVa2iu6YegqGYubk1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739855; x=1746344655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URqZNBSvISpfkOaSlJCBjJ4EBAiXVSB4aYiQ2cb72Ks=;
        b=jTKMJbkLTeK8eIcV/tfEUaQND7E8x9RbOOhNkZmbRRXhyOcHC3L6qoRfz76gQCkDO6
         nJHyN6ABZyWB3Y7GE/1nBnc6OEGYhzMM1F4rN0ITTDTr9sEOnWduRgGNKnFZpa8K1mve
         yMCFACKjqRsTBS5wYp/79S/MMb8WLMOACUHSXl/qPmSVE2xsLtBY1Z9YO/4fbnGZ8Kpv
         AZLWiQ/oBZiSt0laSR8l4GlFH35hd/g6XozoNLcZTcT/FGs2Z+aPjEa4i2+6gcJN6n7i
         C3wkyiRmmxCKjKH6iTbr1w1G8nSkZrGw4HIkalxQkUS9hnnj7KZpNE340fILmr68caVa
         dLxg==
X-Gm-Message-State: AOJu0YylJDxIONKfIQE95lfpHdjTsi3Q8RgCUVZgRg2T+RfDfVLvIWgw
	BI17dR+qp1JXD8TtWcy/yMqrVXchStcTwgZPwcOi735fXHzE5A+DMnDB4I7bis5/cB261IKdnzf
	S
X-Gm-Gg: ASbGncuikC9eKBRl5iIOj3u6pXGsDMLg1gKD3FZdtBHzukvFI+hAbeCs3VQK4AE+lae
	Zpqcm8MlYX6zuoOyB1ITtkG+BAF09NVDqRot5wLQYX+/mLQ2KLLPEiMsPUJis3Zyt2fVnNKfoHa
	IxoHJePzAIJs55CmLAIy4KrvJ3HoIroGvsyYOuYy348/JtQHqy0fbn3emR1eDKXcyZsLKqXnmVS
	x7DJqADiLD6SBqcfwnpWFsE9nbbVINi4vCJP45ZIWRo3S50mDQVd1H9vL6fv8yrEChRH/SgePPT
	5l0FlxXvvkT0aCWESHeRg3WlTnnBgAOfEqpdCsqhTVOFc6Rz2c5fuQbTta6th9YUHrFZG2xRlAW
	xuTx13A==
X-Google-Smtp-Source: AGHT+IHhG82qhDLAZy00txDJNFJskd3rBxAaXWQjSVQfnIUphGYgfQ2PTE3YQPQE1g+s3Wfi/jBgwQ==
X-Received: by 2002:a05:600c:3d0b:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-440a6346aabmr74474805e9.0.1745739855396;
        Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/8] ARM: dts: stm32: add uart8 node for stm32h743 MCU
Date: Sun, 27 Apr 2025 09:43:24 +0200
Message-ID: <20250427074404.3278732-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UART8 by applying the settings specified in the
reference manual RM0433.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h743.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index b8d4c44c8a82..2f19cfbc57ad 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -211,6 +211,14 @@ dac2: dac@2 {
 			};
 		};
 
+		uart8: serial@40007c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40007c00 0x400>;
+			interrupts = <83>;
+			status = "disabled";
+			clocks = <&rcc UART8_CK>;
+		};
+
 		usart1: serial@40011000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40011000 0x400>;
-- 
2.43.0

