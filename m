Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166A254B17;
	Mon, 10 Feb 2025 22:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227530; cv=none; b=ItVPkMJ5r3upM0jx/SlxRBWvk5XMe4NqAoz8RR/X9MgnZ5aRxFmomAtGUjnNqKcuo8QlgMh3H5nuvrJvUUyGPyE3dhe1wqQckRMV9AvIL6ifQNVlK6pPsRBkeiMGhB8rf2IsDKvmq0SXolceKJ7ewMWP+vP/g+zJ0gLmqS03kr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227530; c=relaxed/simple;
	bh=X19WOOPYgP+DuZFchChLeLEFY5CA1hNJzhrLmeGnrWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtEkn7Fw7Pkx91q9lFhlzFGj757l1G7mGdLR7S/PGiMzot+UHiM4X3LMd/Z1Qg+uYCPAMYnAwKGzAgR9T6A6QB2CN21nRK5phZ5kaqbfdGv9K+cRSJEV3IW3fHTfg13Td4faVMERsFRmNuLCxkJEtnU8cLizJUnGI8giwzObAGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Mnqsuejh; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Mnqsuejh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=MnqsuejhUiY2v0YatPHLxFAs7a
	iEIOs2TLSk48gPAV4TZ+b2j8GdKgbbeksTaf3iRHeSYKBvduqJJOvY190llWjqReGeH0D4hYQFkT3
	fRfbDF47bP5xPDtJECht8XTEfugG3r7cM/4VQX2X09Q9aPLdNqRM2RcVe2o1OJc/whGEsNIAU5Q61
	s69KoSKP6j6KIPyqRtWFIJEXmr/dLBfX5O+NuUEwzAcIUO8QqTx6O0t+3TztdzedazA8jctxXpWl1
	Di2Lig9tV3dCl1tp21/J9OhXgLYDAtd307izVciWdMfFkHdKXNcTi61OjPQJcpeAdJCbdY5pHZZPa
	FeNfgNJQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWq-0008Re-Cg; Mon, 10 Feb 2025 23:45:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH RESEND v2 4/6] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
Date: Mon, 10 Feb 2025 23:45:08 +0100
Message-ID: <20250210224510.1194963-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the OTP memory found on Rockchip RK3576 SoC.

The RK3576 uses the same set of clocks as the px30/rk3308
but has one reset more, so adapt the binding to handle this
variant as well.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/nvmem/rockchip,otp.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index 3201ff8f9334..dc89020b0950 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3576-otp
       - rockchip,rk3588-otp
 
   reg:
@@ -70,6 +71,26 @@ allOf:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-otp
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+        resets:
+          minItems: 2
+          maxItems: 2
+        reset-names:
+          items:
+            - const: otp
+            - const: apb
+
   - if:
       properties:
         compatible:
-- 
2.47.2

