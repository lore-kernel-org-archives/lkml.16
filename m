Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4929B223;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375375; cv=none; b=ibQU5zXGinrcXUkSJl7exk2JEegICWqVa47CCRRdb/ZtgwQ05sa0vxvgz8EerPUWZ1lD1VVQpOCt9dbqcH+oqO8xLQRSkoTVg88M6qghItdtsZiN9JZp4XisQDLoMqMbU/6/7x/RH6qWh4e2ElZrxGaTESduGU9+ecKpfBEs/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375375; c=relaxed/simple;
	bh=HLUNHReE0cNLO6CqkVo6sXtk4KZJ2890NAAWXXyNoFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSVvDAjAUwqaQ7urCp5ePpdmFz2YixL7oYTHgSZlZ0pagHqagpa/ZPnp1v6MCw9cXsvq0YILh6Sma4sV1WX9DCUDZdNVxQsJG2OV2wkiB7j1sBD/L8VoK9A6tVc9t5hLiek6fyh5tTwqE49sLK8QqHCIyPmO+spKushpT2M6ftk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGk+NyoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGk+NyoW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 316AEC4CEF7;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375375;
	bh=HLUNHReE0cNLO6CqkVo6sXtk4KZJ2890NAAWXXyNoFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jGk+NyoWzuBHZPmQPPUNW+Duw3aCsOpaGF8vy8VkfiP5nE5iDiDNUoX5B7BkqRRXs
	 fK8ZCmshrQnClvb+0Daow2f4KVhuojCHmcCPYuQYjzSnSSAx7OZNgWxmvoJzP+Q2+K
	 GkJCQpXnSj/Mq8ZBS6ZpbR8CBz+S6A/Y3D228e+d4b6Wt7JAqxjZ7L08/zgezrF5ie
	 XEvhotfgHhmbKvmrpW1i5VGdUdXkCKPd3nqnqFq/KdLZ+IPcZ0BrmcpyRToXQ/BUPO
	 CBaDokiU8iP2Z4V80PXAM2f0MzzWGbdTTXH5NyaI/uAXIoFGLF17h7tDGn8FEsliKv
	 jILBuyyQQOhBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28423C369A8;
	Fri, 11 Apr 2025 12:42:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:49 +0800
Subject: [PATCH 7/7] arm64: dts: amlogic: S4: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-clk-measure-v1-7-cb46a78d019a@amlogic.com>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
In-Reply-To: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=767;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=itRtutR2PIVs/kAFr6Titwp0GUUTkodKKnworvlokhM=;
 b=HkLHQwUO4HrZDuTx82Q4lLAZGwoF6OGZJQla3YnGfIsydsSWucE6PSmhvIS/JMYVod6KlvVBN
 spDHf+yEF9WAKvCoQ0EuQvZixoBqSExl9cfQuYZsHWI78avK2kycxxb
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 957577d986c0..9d99ed2994df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -629,6 +629,11 @@ internal_ephy: ethernet-phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s4-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0


