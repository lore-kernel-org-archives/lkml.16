Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC24D26B766;
	Tue,  1 Jul 2025 21:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403657; cv=none; b=dzQZAPEI3zGL5IAymd+tc7GrI1AAfZBSOarWM7Pkk03z+N4jYP2pfldAkx5F10Ij3pKW2e0HZpl2dzfAu/aGPSp45jIMSZfrYS3T89UPaCD8XCaVrqab8daRth92oMIecX3GdcWwtZwv4Y87qPOtJxEZBNxH7XcJe3lWPkOcThg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403657; c=relaxed/simple;
	bh=wNforJdLU0FkGAjg0CfefCw6/V9RHWpPiaZ5+97ppu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wh/YFhscQZWUpJJjE79bG3qjA4alikmHr/iMrte5kL38EFdv8z+TGY5uoZMOXqKtBrDqtyWaweMhvoEYtflyo2wfREzSZUmzXyCPw/0jzlZMav6JJbeBJvC/5TCOKN0Z22oJTXG+5/BoBIeZRydP1EOpTRCufU3BmY+H8NTbRZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNiuc4/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNiuc4/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C367C4CEEE;
	Tue,  1 Jul 2025 21:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403657;
	bh=wNforJdLU0FkGAjg0CfefCw6/V9RHWpPiaZ5+97ppu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RNiuc4/NoonkBAQWXW3cme9hhOgo4LKIV1gTz4qJ6kR+y6Hf6Eb3J/EFtvUOpCxpr
	 smCZRyyNmHt6s55hcwfqrRYlxtFq+xxN79T87OyntVAtxNuECmFlWKuxKjMNwKT58l
	 l3Aeh7uQ/aalGliWJYDwPQH65/N4p2Smbn+Dqd6/O7obMPQnKvHz7tnSPZqU+aEYli
	 9uyx22EqSMqE7DyNNKLCCi/btQwoItf24UOIbKdDjVy2jgOViJF0yHwQucLgUyr9nA
	 XGhAcogsvJ7uliaTVfNj0vftR3MkhTsN4Ep9T5gK+csgQ9N56KMGtnILiyjuaJcj0K
	 6xYLGPEZLccSQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 01 Jul 2025 16:00:40 -0500
Subject: [PATCH 1/6] dt-bindings: hwmon: national,lm90: Add missing Dallas
 max6654 and onsemi nct72, nct214, and nct218
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-dt-hwmon-compatibles-v1-1-ad99e65cf11b@kernel.org>
References: <20250701-dt-hwmon-compatibles-v1-0-ad99e65cf11b@kernel.org>
In-Reply-To: <20250701-dt-hwmon-compatibles-v1-0-ad99e65cf11b@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jim Wright <wrightj@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

The onsemi nct72, nct214, and nct218 and Dallas/Analog max6654
temperature sensors are already supported, but not documented. Add
them to the LM90 binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 4feb76919404..1b871f166e79 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -20,6 +20,7 @@ properties:
       - dallas,max6646
       - dallas,max6647
       - dallas,max6649
+      - dallas,max6654
       - dallas,max6657
       - dallas,max6658
       - dallas,max6659
@@ -36,6 +37,9 @@ properties:
       - nuvoton,nct7717
       - nuvoton,nct7718
       - nxp,sa56004
+      - onnn,nct72
+      - onnn,nct214
+      - onnn,nct218
       - onnn,nct1008
       - ti,tmp451
       - ti,tmp461
@@ -118,6 +122,7 @@ allOf:
               - dallas,max6646
               - dallas,max6647
               - dallas,max6649
+              - dallas,max6654
               - dallas,max6657
               - dallas,max6658
               - dallas,max6659
@@ -139,6 +144,9 @@ allOf:
               - adi,adt7461
               - adi,adt7461a
               - adi,adt7481
+              - onnn,nct72
+              - onnn,nct214
+              - onnn,nct218
               - onnn,nct1008
     then:
       patternProperties:

-- 
2.47.2

