Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8925F784;
	Wed, 25 Jun 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857425; cv=none; b=JLoqY8emzParYivl8nyf3LuLIdxl5IGI56ck6i1gKhB160pDE66tTQRMOSIk5zpbagy5P09mKwDRH45mGkwaqGJIbizHEqxuwGQpaZcZJnm9j200T1qhN/HIn43yeaDH2/BMnn43KZXAcvJRTjqzVsRGweZizyk3nFfnhvRuud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857425; c=relaxed/simple;
	bh=2wjz3+JKr8b/GuKvZURR2QiYdmWce02dMigkYvBt0Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQL0MoZNDaKPRQvjIb6JJemGmqA6ZZVLTzYahmhHdwVrmJtrGQ0T7G42/BotF/m3J0f1SdifHEgHDMgSA8KbKGk90/DcqJ1lzso6GOOlxLefxiDLm9kiBuzCn5rwywpnIkgYtKzbjOCaRLFdQWcqijdhYY4Sl1W90/EG+Tvo8MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3AopbvJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3AopbvJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4105C4CEEE;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857424;
	bh=2wjz3+JKr8b/GuKvZURR2QiYdmWce02dMigkYvBt0Gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F3AopbvJ164+Etui5cLAx3/wbfJEr+coRlX2u6OyEm1akxuq0i/AL7fUXVMBTjiLv
	 LLjT9xl8src5NZV1o1yIMp4eh/9b3evLl2JUGSyNIWStmk/jPDDgT3Dz9XQTQJJgPt
	 zN0zX6f4dp+DGSrZ6Dun2F8eNQAiu0fkFrAN4H0HR0BhP4BjUACuf3pgjS1fzcvORZ
	 eM/2PRlGQaASki9zmJmbSRbsO4qU8zRsyX38v9xy7KruT8eZtgAdiMnkbTdZQTtHba
	 ZvCo1AFMvM3IoKuTr1AdyHdp2Mpw0cF9hym7nj2PrZZZOmsP7J0hhvgTijm9Cy2OIe
	 hm1ciZ94ZlrVQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 794825FF4F; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
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
Subject: [PATCH v2 4/5] arm64: dts: allwinner: a523: Add UART1 pins
Date: Wed, 25 Jun 2025 21:16:51 +0800
Message-Id: <20250625131652.1667345-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625131652.1667345-1-wens@kernel.org>
References: <20250625131652.1667345-1-wens@kernel.org>
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
index 30613a0b1124..6f62201fd739 100644
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

