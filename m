Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3E23D281
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572560; cv=none; b=E2eaD00d4iD4+3/kYK+QdvSpBAWM2BGyMzVQUQL34v+LFvFYMtDiIp6/FLas8/LSvI30fUhZgWSGD3Qfvib6+tv0aF4KB+wjwC70GcqLjtN3nLt/4k6OXtnqDThSGMNPxEijNQ80URMJvayPkKBjChyBQRF17/PV0D0b2+or1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572560; c=relaxed/simple;
	bh=x1Wkm27e53UM4T6qiWZzq4L2tb2uGPNcxdt52zzhg7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlDrwhUb7BSIaXRZ4dGq8PGUmMyZ3KNOqHSjtaigbCKFgX4jiI/15aeyIR1zcmmGwPjaKRtI5I/fYSFeYl/Mz2vNA84HgC6Uis+PCSBwpTRJRX97XieD8Y+LwRF675GFfjCeSyxXy8HqHARXUWZYQH0ZbfV9eAj7R9egLKH/GVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bGvFz3nwxzflV;
	Tue, 10 Jun 2025 18:22:31 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bGvFy5CTWz14h;
	Tue, 10 Jun 2025 18:22:30 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 10 Jun 2025 18:22:17 +0200
Subject: [PATCH v2 2/3] arm64: dts: rockchip: px30: add label to first port
 of ISP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-ringneck-haikou-video-demo-cam-v2-2-de1bf87e0732@cherry.de>
References: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
In-Reply-To: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

This will make it slightly easier for Device Trees (and Overlays) to
link the ISP controller to a video input such as a CSI camera while also
bringing it closer to what's been done already for the DSI controller.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 8220c875415f52bb2098af5c0647cae8fe5c9aed..0cad83c5d5fe64dc8539e0fd0640e02058e1955c 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1269,7 +1269,7 @@ ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			port@0 {
+			isp_in: port@0 {
 				reg = <0>;
 			};
 		};

-- 
2.49.0

