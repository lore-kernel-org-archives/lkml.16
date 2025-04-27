Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC7724E4B7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739861; cv=none; b=YEbsBuMvb9mZkFkN15NY1MhBIcqcKy+cyleDumUC/zL/HR/EJioMosU8tQXT4Y/8XaCr5B29To/QW7rmtVXWHlXyiwTkIMWpZl1HC6TzsXriJMI1LodmzBynwWN4TCSo8SKawV6jdr8FCLCE+MoGzkK08MbVsbxTrmzzmTlS6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739861; c=relaxed/simple;
	bh=n8jNejICJIQqsgrzxfglxNW8ClxYTcIiU+YtA8l3ZNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7ddkZdP4zc7eYUptcM+dwdiyfMaz7HLASvMAdfO0A6AwDl88P77X5GzEmfEgXxfRt4o6H3Ptpdfb2nKCxlUcrYY7dEHNREbvlRdcc2A0Xmj36nEF9p6UYr8r7hSLvCzl2dmNvmKq5HWmF3neNqCT48gPtq5qEYVxxfAWZsX4to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cCSNRfwb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cCSNRfwb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso24881325e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739858; x=1746344658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da7zIFrpu0j7h2mGPrNiJuERzcQJY6X/JIb6xBtGQ24=;
        b=cCSNRfwbHXscf/TEunjN6RStOgksJzx45lS4b0RrN2r6HQ1DuRXvk25QjN+myaQhQn
         Z57S06Z7dawXIzr/K1PYcvD5P0TGuIKDrp9Hg9Tpiu2xyKARepxe1VFzvBvjlETqivmt
         I4msESyxl16Q00Mx+UiGEPoIT62LSKpdwMkwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739858; x=1746344658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da7zIFrpu0j7h2mGPrNiJuERzcQJY6X/JIb6xBtGQ24=;
        b=m5U75ArHfry9jyywoFMsdNYUanR9Yl8UltKgsie81HmVdjbScbkfg4WF/7WxciZRUx
         szJJthVue4v3riSsfPO/sJtDIkuI+QhUfdUMrMaS0iiiSdDGx0G89F+cxWCjXYMQf/Zk
         bEeuqYPaz4oS/wh2Ret9IpfguUCVwxmGc1OvjDYLJoLZdk2mQH0NOjOt5a8jM4Tx7woC
         KGAptHyzPUvibCu+K5J6aYObOBWrCJlpsNDEnZw2R3cwlUMCCsKyM/IjJBA5V2W85VPc
         R+tvac0X0KaHrIdjbxZcerA3ItMWGT/oYUiFbTQLZtOboZWwUQ4xm77EIOt/6u1rmeZl
         eCDw==
X-Gm-Message-State: AOJu0YzPhF5HipqS0Z/Njy91V+MnMGFTb6JNiBDUDGYHIkzIB3dTTv43
	WvmQLOhgtTOCgp+Fpl2aFv9ykacKXUDBDJFwXuTdvnHxCzGLvCXvQRNgSnNQXNAbiIoQSJENp44
	9
X-Gm-Gg: ASbGncurvSQ3ty+RdjdLX7WjCcRYDV+zFQNKK71lETc0UzrCCdJXv+aMeO5vKjPT18i
	mNVKQHMRidz66u8k9Et79/99fbPOdFTslD/4jdZaknLZpvWgRjRZviRH9Sk37iahnNlRd8gjhdy
	0Gz00MzeLm1XEhJy54ezanjjuGra7NwxJRNe/n2BqHxg25tIQKts4FNPU5whGXW1Ignvsi/Sboe
	52bCw0KPWgI15wSjgXdzqW9k09VULEyH3LFdObb6v7HLMDOjRh+VPjr/lBxdIOeu6h0YaLGQMT5
	TcpMiSYeAkPvEa4YYIMzKROQEvMCSh35XzNDw7dSHPyBrnszgUIg8e3Kta4VgFF2ro9i4Q4WFGK
	IE03YPA==
X-Google-Smtp-Source: AGHT+IEuupyIlTgaign30DDDz9KUfwF9305jfDutvCc5oP7891e/+Sd1Sp7bK1ZWlfa2LaTwV1N8Ag==
X-Received: by 2002:a05:600c:4509:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-440ab77d34amr40034595e9.4.1745739858133;
        Sun, 27 Apr 2025 00:44:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:17 -0700 (PDT)
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
Subject: [PATCH 7/8] ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
Date: Sun, 27 Apr 2025 09:43:26 +0200
Message-ID: <20250427074404.3278732-8-dario.binacchi@amarulasolutions.com>
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

Add an additional pin map configuration for using the USART1 controller
on the stm32h743 MCU.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index 96022afd0168..8a6db484383d 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -237,6 +237,19 @@ pins2 {
 		};
 	};
 
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 9, AF7)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 10, AF7)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
-- 
2.43.0

