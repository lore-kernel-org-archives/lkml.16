Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA2525394C;
	Mon, 23 Jun 2025 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683432; cv=none; b=tCs7rqf1mg7+b1Dm039bmXMFBs2fGaR5eSRKbsAF5MLjcQC9ECd6dqDtEYB3X5dgM8qlEflveKjV1jwnsYFVsvdQQLlphfZf+Jeh6GTOofoVGQVtSVan9iM9reHbCJ8i4+LGnoK+U54UIz6MgBmziS7pyHTxYkpVK760jFduXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683432; c=relaxed/simple;
	bh=ix4sQ34JPxCSiUUiRsS0uHeEHS+bhk2iYFRRYP8FzOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/epvLKiTRQegiQEmxa8dF+DWPaByCKv3arXDCS86jEA/pzmK6kZF4aCrzUfQ7RPOLiHZkswV7WXMzp50zcddS/7iAmBLimBRKFT/4SQ0CIOzbR8tOgdLxTB9Yn0x8Shan703FWhuGjLn6SU+clrfL8VTwIPkT3swDWghbejJkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U80bDazB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U80bDazB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0426C4CEF2;
	Mon, 23 Jun 2025 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683432;
	bh=ix4sQ34JPxCSiUUiRsS0uHeEHS+bhk2iYFRRYP8FzOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U80bDazBAxV3LbQXojEjjkURit4HqA1wBXOVefF4khXubI9+sNChj3EiY+7bV+4SL
	 dKxmdwFwjeq5A8AaNNAsNVDkPbAvxlcbVUL5GlgfLwopG4pOjOflc6VKOpeK4QBga7
	 KSd7w17wciCYll7+b/DBgyJ6/30pt26HghuVZ6Q2xm829fwj3MN3ThHefK+Sgiqtx9
	 FRt5wS1iLHjFATZM0EfgKcE8gqUK1XhEL/tTel6+8Yx8/lLkc1sP7RLQn4uC7035aA
	 lM7oCCTiLvTtgLkIYthoIjJxwDosFBuBKHmZHYnEzH9+xZmVkvKUKTygXPdphJEayT
	 nvYweseGyl4xg==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] riscv: dts: microchip: fix mailbox description
Date: Mon, 23 Jun 2025 13:56:20 +0100
Message-ID: <20250623-crazily-boogieman-08d72613ebac@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UOaeuCyA0NwooEKtPScWmm72FpyZFfETubTA7thTmBE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfh8uz/vidvtnKfe2og9S+fVvOUTCFMI8TTkj+U0N5 CbvzCjrKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwER+r2P4pyBasvZWwsv6rsrJ e5ujD82/KJnknJ6zeNubO3oPJNezmDH8d3hQZtpil/rtqoyApVqIvdhkCWPZDJao4uk5+t/fz+r lAAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

When the binding for the mailbox on PolarFire SoC was originally
written, and later modified, mistakes were made - and the precise
nature of the later modification should have been a giveaway, but alas
I was naive at the time.

A more correct modelling of the hardware is to use two syscons and have
a single reg entry for the mailbox, containing the mailbox region. The
two syscons contain the general control/status registers for the mailbox
and the interrupt related registers respectively. The reason for two
syscons is that the same mailbox is present on the non-SoC version of
the FPGA, which has no interrupt controller, and the shared part of the
rtl was unchanged between devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 9883ca3554c50..f9d6bf08e7170 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -259,6 +259,11 @@ clkcfg: clkcfg@20002000 {
 			#reset-cells = <1>;
 		};
 
+		sysreg_scb: syscon@20003000 {
+			compatible = "microchip,mpfs-sysreg-scb", "syscon";
+			reg = <0x0 0x20003000 0x0 0x1000>;
+		};
+
 		ccc_se: clock-controller@38010000 {
 			compatible = "microchip,mpfs-ccc";
 			reg = <0x0 0x38010000 0x0 0x1000>, <0x0 0x38020000 0x0 0x1000>,
@@ -521,10 +526,14 @@ usb: usb@20201000 {
 			status = "disabled";
 		};
 
-		mbox: mailbox@37020000 {
+		control_scb: syscon@37020000 {
+			compatible = "microchip,mpfs-control-scb", "syscon";
+			reg = <0x0 0x37020000 0x0 0x100>;
+		};
+
+		mbox: mailbox@37020800 {
 			compatible = "microchip,mpfs-mailbox";
-			reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
-			      <0x0 0x37020800 0x0 0x100>;
+			reg = <0x0 0x37020800 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <96>;
 			#mbox-cells = <1>;
-- 
2.45.2

