Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E31DFCB;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127372; cv=none; b=IRHLH1Fd8mEz3Om2qcxh8OfFvbI/U+BoIhsvEhJSu2SgbqRzlDH76xH4Du+oGT+IEb/i6pVnIcKoghcTjO7wrWIYDlf2U7sfLAon5+LLxgUcLxIVAEffQyVv1Rj1Qr3z9cxMG6rsFQk/SrognXbxryKWe4a+S+gnJTCXLK2bJdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127372; c=relaxed/simple;
	bh=6oH0nwNv26PaXawo3Ih/MoBWIzEnorKGZ6UPBCiGcIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tq8e8zcPezYVt9SxV6rpJ02Nk3QnB6A0EiGqIbZq/Wv5xDbdunHlbvsur2zM5YwOc3ErcodewiV714iUpIi7kSjDi9bW08CemSIfGGrNkwBEacx+2jRITVGf4SBeNAo8/qgBBGOjinjDlQ3G8Zx1uLgvj8nmIMeQgtMrb9ylsCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeW0cAYp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeW0cAYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAB0C4CEEF;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=6oH0nwNv26PaXawo3Ih/MoBWIzEnorKGZ6UPBCiGcIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OeW0cAYp2YSdtnU+vLp1dK5SikFM/cCHgwGeOi81Hx6aTejK83MONtlQls0QPiO27
	 cg52qSiPBRj6dQsB4UqITunAIQo5e6Y5w8pHYmnjAZvX18pRiH/82c2Wwzw6ET8kxZ
	 cV6ON0cWRyNL/XWyRl49TQkhQ88q2oF5uOSGvAC9NpNly+m7F6B5403jDqDPxD0sPn
	 04CstsYDJ0MG8u2KomTL8kQQC3yY2qsKLS0CvXvzUgkdKx83gCJvbgBXpx0/egAp/M
	 rzqif3hjfcIbSA0yMSEs+XMpVeuWPisvZqTcp4Xat1ZpIJwN1Cjo9VBp/7UMAfvbIJ
	 sft+V+9yw5hUQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 5DA655FE60; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 4/5] arm64: dts: allwinner: a523: Add UART1 pins
Date: Sun, 29 Jun 2025 00:16:07 +0800
Message-Id: <20250628161608.3072968-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

UART1 is normally used to connect to the Bluetooth side of a Broadcom
WiFi+BT combo chip. The connection uses 4 pins.

Add pinmux nodes for UART1, one for the RX/TX pins, and one for the
RTS/CTS pins.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 4839411e51cf..cf0bc39aab04 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -168,6 +168,20 @@ uart0_pb_pins: uart0-pb-pins {
 				allwinner,pinmux = <2>;
 				function = "uart0";
 			};
+
+			/omit-if-no-ref/
+			uart1_pins: uart1-pins {
+				pins = "PG6", "PG7";
+				function = "uart1";
+				allwinner,pinmux = <2>;
+			};
+
+			/omit-if-no-ref/
+			uart1_rts_cts_pins: uart1-rts-cts-pins {
+				pins = "PG8", "PG9";
+				function = "uart1";
+				allwinner,pinmux = <2>;
+			};
 		};
 
 		ccu: clock-controller@2001000 {
-- 
2.39.5

