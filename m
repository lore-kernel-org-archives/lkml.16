Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCAD1F4297;
	Fri, 31 Jan 2025 21:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738357734; cv=none; b=mDQpCWzO3HXLEfvBWRJnCUJuiYHrxeHi4MBzNiFaLE/H7ywtSkmnZJBV58mUVPd59FpL9KTRNYSopGglVUVTPCgLM5KXZAnNQITFIKOkYaGd6YDEHqWl9z/tmyZ27miRyGfV83dH/s03s96EXV3bvWYq7NaJGkEUl6g+CyXCD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738357734; c=relaxed/simple;
	bh=RJ05aPYqi6Of4mqMNLTsRwytI7XXfUy6aHeMa00xhm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNAgesNAHFw0BgRbl8b2py6MfRQjtdCl8NSb+bOXG7MRpnx47IWCDgifHPCn2cgZwjg+C7gnu1KQI5eOJfM6oF2BvMU/FLsHjDp4XTjTPchaSIRtU4Too03ca6nXiRJ9pQ0a54hcJgXTUFR4ZhPOKEtV6dERerDaaKOFJsrdR04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/v/u9OU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/v/u9OU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9378CC4CEE7;
	Fri, 31 Jan 2025 21:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357733;
	bh=RJ05aPYqi6Of4mqMNLTsRwytI7XXfUy6aHeMa00xhm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V/v/u9OULjLBlZAbG9SfvhJWjqvHfxKpgA5GPv0nwU0mHTR9VjASNL/XIkUjyF0iE
	 IfWOHjp8IA+BZyPEGxr17rvbGNTGpLoMKxRKyUcFBMgH35stA4dwL8OCC2WQAGsDNV
	 utBnLlomkRAf7JHR8dKlv+2dxUDe3Jqp5U07YciF+HrPGhRdowJGIHCqmsSHwIXGDE
	 V/dqA3WUe8bJ302e+raJpmcKspc8rKkTbzkzYfEE4SatrqRUMI9Y5CVKpaKUuXxEKN
	 wsCPAOaROnaPucrSQraCQP+BL56s+RkmpN/ZOY9CzyWWxM2sp4AHjnOYBRcMWVqdOv
	 Tl+Fm2cQJrTOg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:27 -0600
Subject: [PATCH 3/6] dt-bindings: marvell: armada-7k-8k: Add missing 7040
 and 8040 board compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-3-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

There's a number of board compatibles already in use, but not
documented. Add them to the schema. These are added to the existing
entries which are missing any board specific compatible. Entries with
only SoC compatibles should not have been allowed in the first place.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index f1a7e6576306..4bc7454a5d3a 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -23,6 +23,9 @@ properties:
 
       - description: Armada 7040 SoC
         items:
+          - enum:
+              - globalscale,mochabin
+              - marvell,armada7040-db
           - const: marvell,armada7040
           - const: marvell,armada-ap806-quad
           - const: marvell,armada-ap806
@@ -35,6 +38,20 @@ properties:
 
       - description: Armada 8040 SoC
         items:
+          - enum:
+              - iei,puzzle-m801
+              - marvell,armada8040-db
+              - solidrun,clearfog-gt-8k
+          - const: marvell,armada8040
+          - const: marvell,armada-ap806-quad
+          - const: marvell,armada-ap806
+
+      - description: Armada 8040 SoC MACCHIATOBin Boards
+        items:
+          - enum:
+              - marvell,armada8040-mcbin-doubleshot
+              - marvell,armada8040-mcbin-singleshot
+          - const: marvell,armada8040-mcbin
           - const: marvell,armada8040
           - const: marvell,armada-ap806-quad
           - const: marvell,armada-ap806

-- 
2.47.2

