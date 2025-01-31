Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38FB1F2C33;
	Fri, 31 Jan 2025 21:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738357731; cv=none; b=QzTe7DcH8UWpfR11JrhEunq7ao4rSt+s4fisNp9Et4+nunmp+ESuCZs/R2W0OCjLJJ/b12eAR7lt487Zq/n0qqzo25UA+inhAPvKUFpJRGFYs99iiOmsSqBhEA8Fi74VKmI7qu8K6WCFnpS6TEqSNiUORASvuc5P0fqQldbH1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738357731; c=relaxed/simple;
	bh=hMG0Y6gWueOlmwyswPIHvrcICb1asfhtGWiaIHkDqUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTJ2qbHUXFMR2omCvBBTzHj9w7WS5C7yXWs0kwyPdsT6UHZs0D9iyiI9O2hE6D0NL1zSmRoX9uhZlPkVWDVSfckjPzYK9RxiCyNngeTdm/RX/u9pAk5MR+LDxsiRaVBNM96pG2VDbFrfeWC114NM8wm/N6zXhlLUXGnZYKp7ZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvC+KNEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvC+KNEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE3BC4CEE3;
	Fri, 31 Jan 2025 21:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357731;
	bh=hMG0Y6gWueOlmwyswPIHvrcICb1asfhtGWiaIHkDqUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IvC+KNEBpSzkQFiGkETJZRvRtqGu/lYPn+oL2jh8sNk1KplgaDB3kE7AD1t5bKOOx
	 s3JIYKU55/SgRdAsP/wFsOG6PCHPRfAShus+fZsKyoyUaGagWiL9UuK6NGvtwPcY6W
	 zQZP8p6wqRlimNfziZq5T0SAfd4HC4eW+SAitPP50bvLn7Yx3VMybUR1x2Yknty27X
	 CxnKgY36aDzyqhwQzxnRtOVzfHHj787rmMn3kSY4RRfs0nxkztnnzKR420vp6J4ZwU
	 Xy7ANee/jHDwm0cAsgAUfYLFms9CEaUcTpBbnHHc6YsLl+OzzY46+98JedJZ6PGDPI
	 pGzbOkIw3W4Og==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:25 -0600
Subject: [PATCH 1/6] dt-bindings: marvell: armada-37xx: Add
 glinet,gl-mv1000 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-1-55f9f6acd4b1@kernel.org>
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

"glinet,gl-mv1000" is already in use, so add it to documentation.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
index 6905d29f3108..51e1386f0e01 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
@@ -18,6 +18,7 @@ properties:
         items:
           - enum:
               - cznic,turris-mox
+              - glinet,gl-mv1000
               - globalscale,espressobin
               - marvell,armada-3720-db
               - methode,edpu

-- 
2.47.2

