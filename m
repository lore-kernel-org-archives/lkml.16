Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F99204096;
	Mon,  5 May 2025 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461980; cv=none; b=KWmhkGOhOfT4RwPo/Vf24hjuxzVMhNj6JE3lt4Y6oi1RpKKDTOYcSuh3uPkc4jEd4oG2WU91zVslYCjHShTNuc0ogd1CGyevIVYgy0QhHRzIE2OW3BvbG+2LoGlHFTFmWUectxNmLOAvnASv1EwhACrIR/h/GYkT7iYfNg8sc/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461980; c=relaxed/simple;
	bh=W9CwbGba2l/4DV2mVSRkgzCbSIJIRxSkUrO2huXF8pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nVdGhqdrVyjxuYdFUVOybXNDwr2DkKS76paqaNKltnIVjwuvYnTfdlUmOdU3RExyFd6F+NKMfJBEyDTFL0jdNJqsD85iD6mxvKAWGlQluAoAgYAG6TJxvDeM3FtpUpNsAWYES5pe8fTR+Pr0epBt/9NcvCwfy+7X3n+311Ktnrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sa1Ug5sf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sa1Ug5sf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657EDC4CEEF;
	Mon,  5 May 2025 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746461979;
	bh=W9CwbGba2l/4DV2mVSRkgzCbSIJIRxSkUrO2huXF8pw=;
	h=From:To:Cc:Subject:Date:From;
	b=Sa1Ug5sfnyga80HsoJ3Dewm7UKCoPdgGsO7QDheok4L6aeRNgvNq8CU/eaJ32XUjC
	 w0vS8QmkoS0EFJGqZ28Ocry/JxgHOk1lif2f82y1o89pU+z0jgzHzs4T7cZhnTr5Qu
	 XCW4KpNe3hUwBjf+dgcnINMt9+plVz1Tzz/kf3rQoEW7qlcvdSZ2MmZ8h2YmKIU+cT
	 EuvOMsS3OzMqzfa3Ks/7l1WbNtWJI5iQ1lvjXR+NGMZg8QKkZkDf0agpueInltaJvU
	 oKz2mKHm52N4mXzcb5HOyPB+mwDz5GV242hxFTyQnZN2CmJNGQB0shbbnbvo8F3UMr
	 64Fa8a3bhsHZw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Drop st,stm32h7-rcc.txt
Date: Mon,  5 May 2025 11:19:32 -0500
Message-ID: <20250505161933.1432791-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding is already covered by st,stm32-rcc.yaml.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/st,stm32h7-rcc.txt         | 71 -------------------
 1 file changed, 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt

diff --git a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
deleted file mode 100644
index cac24ee10b72..000000000000
--- a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-STMicroelectronics STM32H7 Reset and Clock Controller
-=====================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please refer to clock-bindings.txt for common clock controller binding usage.
-Please also refer to reset.txt for common reset controller binding usage.
-
-Required properties:
-- compatible: Should be:
-  "st,stm32h743-rcc"
-
-- reg: should be register base and length as documented in the
-  datasheet
-
-- #reset-cells: 1, see below
-
-- #clock-cells : from common clock binding; shall be set to 1
-
-- clocks: External oscillator clock phandle
-  - high speed external clock signal (HSE)
-  - low speed external clock signal (LSE)
-  - external I2S clock (I2S_CKIN)
-
-Optional properties:
-- st,syscfg: phandle for pwrcfg, mandatory to disable/enable backup domain
-  write protection (RTC clock).
-
-Example:
-
-	rcc: reset-clock-controller@58024400 {
-		compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-		reg = <0x58024400 0x400>;
-		#reset-cells = <1>;
-		#clock-cells = <1>;
-		clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s_ckin>;
-
-		st,syscfg = <&pwrcfg>;
-};
-
-The peripheral clock consumer should specify the desired clock by
-having the clock ID in its "clocks" phandle cell.
-
-Example:
-
-		timer5: timer@40000c00 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000c00 0x400>;
-			interrupts = <50>;
-			clocks = <&rcc TIM5_CK>;
-		};
-
-Specifying softreset control of devices
-=======================================
-
-Device nodes should specify the reset channel required in their "resets"
-property, containing a phandle to the reset device node and an index specifying
-which channel to use.
-The index is the bit number within the RCC registers bank, starting from RCC
-base address.
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register.
-
-For example, for CRC reset:
-  crc = AHB4RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x88 / 4 * 32 + 19 = 1107
-
-Example:
-
-	timer2 {
-		resets	= <&rcc STM32H7_APB1L_RESET(TIM2)>;
-	};
-- 
2.47.2

