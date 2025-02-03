Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51863209F32;
	Mon,  3 Feb 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594458; cv=pass; b=W2Q6Wf8xXzcP/xyMMs7JzgiUcAqK7OsrBA9e9EnI0ue+kfsztYJDuMmQyUdBpL6IGRrWe220zeOBKuvAma6lKmQbvf/dWtQYJRWc9CLQgALTg8jN45HfleHFViqULuYCI9hexl3ZjJwpjH01AslzKjE/ccXVX4Qxb+T46omPbUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594458; c=relaxed/simple;
	bh=2kDeGFPRU5ySinR8BTj8CnBGsOS8PfC/VAHys1rOVcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZY8WjOUKiQWhWzBfs8aLJ/NWK61NAH64TOyaDAWrGugdMbJCK1KrdAMcDzKk4ZhdmyINkcEWpqJZjGgqWtRbPMduMzxgC1z9vABpB33f40VjedQWZzpwAuh5868VzWUCEQYahd2VbqxzpMmxjjRjSx9RlDODXKOau72Yg6Een6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=ADDkMDhC; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="ADDkMDhC"
ARC-Seal: i=1; a=rsa-sha256; t=1738594411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JcqvtMqcMieo997JEIs72YQYVWtko+QStp1rLeJkk0YIqiKWfbEU8VmtJELnNd3pJV7AJfyORDJW1OSIUUUi/0taJkyVBFdDZGkA9P0uh1r0QlSTKF+m5d8rl9A0cch6CQc4rwRB/XeJ5Vjmn3ep7h1C+z6t3pfbuN9n5/Vk/Go=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738594411; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Syb9XStZ74dZ9UjkC86uQY//S07l8lYvVVc6rFRliac=; 
	b=MDhBqX1xiNWmPvN9Et1L5KfXLfQBBI6XRzzLMoOWvEtrxyAmdwjU1//F2L7sLWb3mym6pRNq7liX+0pvQzwSHuR6dKhYNfQiVIW9EDKurOLQMTLQp6pdJB7mjBS462HapBc+fVwUXiople5LqyIyFTxJhP72VNlRrXov5b24QgY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738594411;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=Syb9XStZ74dZ9UjkC86uQY//S07l8lYvVVc6rFRliac=;
	b=ADDkMDhCe56AxdypqqikCmg3b0yuIE2GWQEb0f/KQLf70DJVcjN2qbZfHXNKEtbJ
	T82mJah7KuE5RWvd+MoQhCABXbQfd2TQSsofPVtRMw7/fP4f6a7jk8HehkAKeQ3lPyN
	tAI9nW7WGmxWEGTdGmtK/bZ2EHmfecZsKm9ZISPg=
Received: by mx.zohomail.com with SMTPS id 1738594408629965.8786061662063;
	Mon, 3 Feb 2025 06:53:28 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Mon, 03 Feb 2025 22:49:57 +0800
Subject: [PATCH RESEND v3 3/3] riscv: dts: canaan: Add clock initial
 support for K230
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-k230-clk-v3-3-362c79124572@zohomail.com>
References: <20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com>
In-Reply-To: <20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr080112270992e02b4f705f56f6fc30fe000042dfdaa070337a3026dff550f67a180f702183f5ee7da4b2ae:zu08011227e19cfecdd80517604a5e77bd00007e675372f9696a0dcfe7c7075d9ccb646559ab3d0afaa816d7:rf0801122b9bd85940fa49cf4007e3a85c0000df1bfb6016b4915bc6c1fce2636eec59e7272842f77bed447034abd375:ZohoMail
X-ZohoMailClient: External

This patch provides basic support for the K230 clock, which does not
cover all clocks.

The clock tree of the K230 SoC consists of OSC24M,
PLLs and sysclk.

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 arch/riscv/boot/dts/canaan/k230.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..e50ba03c2c21597e5f7d04a652db08f84101cbfb 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/canaan,k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
+	osc24m: clock-24m {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -138,5 +146,29 @@ uart4: serial@91404000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		sysclk: clock-controller@91102000 {
+			compatible = "canaan,k230-clk";
+			reg = <0x0 0x91102000 0x0 0x1000>,
+			      <0x0 0x91100000 0x0 0x1000>;
+			clocks = <&osc24m>;
+			clock-output-names = "CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4",
+					     "CPU0_PCLK", "PMU_PCLK", "HS_HCLK_HIGH_SRC",
+					     "HS_HCLK_HIGH_GATE", "HS_HCLK_SRC",
+					     "HS_SD0_HS_AHB_GAT", "HS_SD1_HS_AHB_GAT",
+					     "HS_SSI1_HS_AHB_GA", "HS_SSI2_HS_AHB_GA",
+					     "HS_USB0_HS_AHB_GA", "HS_USB1_HS_AHB_GA",
+					     "HS_SSI0_AXI", "HS_SSI1", "HS_SSI2",
+					     "HS_QSPI_AXI_SRC", "HS_SSI1_ACLK_GATE",
+					     "HS_SSI2_ACLK_GATE", "HS_SD_CARD_SRC",
+					     "HS_SD0_CARD_TX", "HS_SD1_CARD_TX",
+					     "HS_SD_AXI_SRC", "HS_SD0_AXI_GATE",
+					     "HS_SD1_AXI_GATE", "HS_SD0_BASE_GATE",
+					     "HS_SD1_BASE_GATE", "HS_OSPI_SRC",
+					     "HS_USB_REF_51M", "HS_SD_TIMER_SRC",
+					     "HS_SD0_TIMER_GATE", "HS_SD1_TIMER_GATE",
+					     "HS_USB0_REFERENCE", "HS_USB1_REFERENCE";
+			#clock-cells = <1>;
+		};
 	};
 };

-- 
2.34.1

