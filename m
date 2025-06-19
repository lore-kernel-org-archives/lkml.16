Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961D241CB7;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354214; cv=none; b=o5dlCJTUQ644s2vgdgSx5kDwRlYBihZeuA00jlEZVteNaIraJJbWdlQbYjVfo85iXnujBFJz2pCFLbdM96lA4auD1boWrm5rGJ+skirq6sE3mVZn9mkeRiynLlOaJBfvNqc1vyM6q6nYKuwCLNyXYhNgRLyDAHxc6qI1gFcXK44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354214; c=relaxed/simple;
	bh=rz1gZsh7A4S3qN6IuAlTDtQuCkgP2vb88SwwNf0Nq2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PxDQWiCeuYZqEnzNTlErXPVdYUbbWyv58WoOewbRGqFwHx644fguvTGKkdzP68W+HKYgLnXgXoofJwfTuMSOlQX6qs9sibcnLN1bfM5YfAQVCS4p1nT77z2srIoqHxfUv851yCqHtoLY6SOpfHhqdxRP3ZY0lcq7CmqnCNdO6Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlYkaJ3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlYkaJ3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD7EC4AF09;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=rz1gZsh7A4S3qN6IuAlTDtQuCkgP2vb88SwwNf0Nq2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dlYkaJ3OTDpwCeKrBYMhpeu+Ctm4JFHWkf4GpF969PbSB+fdQ3tpM18wnHtoc8KjY
	 xAYlT47yv+7DfOgDuEysznix7QLCwPW+4LnFwKlu0/2rKeYy8Btu1J8CmbhbaLXLcb
	 3GQJRKhKaq7YU/2u0mvxiqcs7E75AIF22W2k7exrZp22dLt8chij53y1xkf+Y+Nrfh
	 9uNVBG2mAqgVY6D5jOU7xJJ5U60M18PmHR0JRCYCpVMJC/oE7isV96yFpIXPNY7wKe
	 5MbaAbfFAwoipZgGPgfT9WX5lqyCaFBa6/JcpOBj83DIyEYhx8syjhkfOpoTPw0OY9
	 RAQpn3zhGs2bA==
Received: by wens.tw (Postfix, from userid 1000)
	id 3703F5FFF4; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
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
Subject: [PATCH 4/5] arm64: dts: allwinner: a523: Add UART1 pins
Date: Fri, 20 Jun 2025 01:30:06 +0800
Message-Id: <20250619173007.3367034-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
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

