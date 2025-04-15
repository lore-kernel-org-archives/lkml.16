Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDB42DFA3C;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685158; cv=none; b=GYQakk/hFto4aSOB1j1xMU88oPbmiI6LXl6/65tz5mKulW5F0v2dSwD4G9N0nAcmSGlWbNQ0+9xX2K7LK9LmtP7VoVAizZHmHJYvWZ7mCg3iVmRhnhhVdu2sjKJN2Cx3fItTOpwhuMe8cEAVCRuMGV1b5yXQvta7LXCwmmrsqYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685158; c=relaxed/simple;
	bh=75keAXRMnoUm3nWjp9JCjWhNFcUePI50VoUETtE1kCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/BIioPWQzTb9MklzZKUYiLJ2uTqp/sn7xmZfw5v1MYxGyxTG/Ct14J4imHKtLpF62pY8CzzAv8tl5eOUjqQZbKDiZAMX58g5vcDqdD+DC8QtUXxQYqZjznJmEVeDcdWcFqYQAPc+mHNXhD3B7fucOh+/rlOeMjD4aRcFlwDjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SR00pwcp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SR00pwcp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E64ABC4CEF1;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685158;
	bh=75keAXRMnoUm3nWjp9JCjWhNFcUePI50VoUETtE1kCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SR00pwcp9LgUcNzvz+70649JT5PGeuPxs6DQLzpijiL4Lg8/zQIia3Pie1JAlyXiw
	 s59u5r43Lmn7xqhd45woDdbz2wC+A7nmprW3hhpeOWZzwCcyJ6gKCFpQ/9FzSvFQnr
	 sLAK+EzqiPoLywnO1EYAlfhN+IaUlAYp/J8mHsaLQIbZa3hxmITW8WXJT5DPMCzwbj
	 gQaQuRTAaeBo6DMGMr6bZZWt4t6c43MD4lR3eJnnU0eqrqNKbYRIVycEpr9BmDJGY/
	 ZvZs6a0G4xL8sP3g1rBxO4swriaLPTG5kktXZe5SpFea+vzBUYkctXeiwY1WtnzVJv
	 Ds5zomc1aP0pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79A9C369B4;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Apr 2025 10:45:26 +0800
Subject: [PATCH v3 3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-clk-measure-v3-3-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=868;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Bv5Y4DpbmiEYh7fjv0Fc7kk2ovIc05XnT6FwbcehZ6c=;
 b=w88IzP6gAbA3az1au7kmY/Stty3NwkvdEmCsgj+oCuRXQV+ilieQMwlv4fHg53IaJrtql/vwN
 uxHZQHA18F9Bf5GYJ98y7H7f6sRAwslBL3LgZFkKiG9INGoVDtaDc2I
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

S4 adds support for clk-measure.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 275afe7fe374..39d4637c2d08 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -23,6 +23,7 @@ properties:
       - amlogic,meson-g12a-clk-measure
       - amlogic,meson-sm1-clk-measure
       - amlogic,c3-clk-measure
+      - amlogic,s4-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0


