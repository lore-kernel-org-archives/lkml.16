Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908213F434;
	Fri, 11 Apr 2025 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370873; cv=none; b=Ojlm0dVvUlm1wOszIKIICZ+AQ2DvqJXEBXV55KuO9eNO2htnRSDs2WfklMCnGDUopfBrafM//5b3xEl+Stu+VCH4B/Quw1MrCcf8KdN5SB5WwOWstmbX8fxl7bDGvw1edTtw0pi7cD5y391GGQOkpqD5VoFXln3IOv0UcbLmW0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370873; c=relaxed/simple;
	bh=rcZ4hUqkPHAzf/+Hghm6DmFVxWHcdR3LRlMwrsk358A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWBLrDJCWS/2WktM9Lw73bzqDhTJiMYUFcFiSpOtQN3IlL/qrxycPYYMGpvsDwlmfRz8kVG9JhQ6dNAqwt7+tZzCF0d4QyW9e3ocz56dyRK96OkucolpcomUb/T4vPyOmbegRtWwhKDv0AGQwVOeXCXCpnzyDn9U+J3UfEe94Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syq/wXVG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syq/wXVG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03C5CC4CEE8;
	Fri, 11 Apr 2025 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744370873;
	bh=rcZ4hUqkPHAzf/+Hghm6DmFVxWHcdR3LRlMwrsk358A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=syq/wXVG5CbFPhhBNhUbwm2JySYBWVgjng3tzSv3mJE/YTJjzhi+V+cY4vqvlIOj4
	 +TAq1n0OF7cih74k7yqMqyAe6J9kg50cKTYXJkBlsk+A+vTuE9xxHUQSzaWe4mffQI
	 jxCaAw+L2+/UjSvRGiaYhtY4fCxjwoCL20IEl3hmnZtPYLF4Ex4tdA3MuH/mgsX3vh
	 6AiGQTki78zQTLv6trMbwZsJ9coWwI1MwQI2PcCqPkbmavp4q2NWvGefV8NLDPQXpQ
	 OqTAeqYpfeShfPUh4fBl3QYH95UWyNnsb7uVvZOSTKY7amgHo3a1KxvsoyC3S1M44l
	 8m8E1kGyZDkUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D6EC369A9;
	Fri, 11 Apr 2025 11:27:52 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 19:27:50 +0800
Subject: [PATCH v5 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-a4-a5-reset-v5-1-24812538dce6@amlogic.com>
References: <20250411-a4-a5-reset-v5-0-24812538dce6@amlogic.com>
In-Reply-To: <20250411-a4-a5-reset-v5-0-24812538dce6@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744370870; l=2254;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=RBPG6lp45fxsEDVQ6Y1mIySEYTUUWfsM6OujOhVw3vA=;
 b=LPHNSyFpPJezQI1/+B2FqsCdLsR8F9dZ+NkI6lmgql6PdBtksSFpw0Q4+EpaggFA2DeE3mfa0
 9B1+wx8qMb1DPmzDwKznC0QyZ4c4t4PNvztoGiv58QBwmf4JIq4OLq/
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
Reply-To: kelvin.zhang@amlogic.com

From: Zelong Dong <zelong.dong@amlogic.com>

Add compatibles for Amlogic A4 and A5 reset controllers,
which fall back to 'amlogic,meson-s4-reset'.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Link: https://lore.kernel.org/r/20240918074211.8067-2-zelong.dong@amlogic.com
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 .../bindings/reset/amlogic,meson-reset.yaml        | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 695ef38a7bb346c92b4cf428e7615d45682c940a..150e95c0d9bed74c7045942610a311114a257889 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -12,14 +12,20 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
-      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
-      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
-      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
-      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
-      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
-      - amlogic,t7-reset
+    oneOf:
+      - enum:
+          - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
+          - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
+          - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
+          - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
+          - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+          - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
+          - amlogic,t7-reset
+      - items:
+          - enum:
+              - amlogic,a4-reset
+              - amlogic,a5-reset
+          - const: amlogic,meson-s4-reset
 
   reg:
     maxItems: 1

-- 
2.37.1


