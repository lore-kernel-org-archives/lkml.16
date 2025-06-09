Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1FF221D88;
	Mon,  9 Jun 2025 20:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501439; cv=none; b=nhSP6ydZddTgfKEJGDSCSkex3AtXtlH6uXTN2vgQDl8z9cB5laLsur0WQAQvXWGL1M5KIoCv6qjWnBMZQgsMbscIehSmu0V9I7fy+aOp8ttDVdovs5TIktv+ZUk/9aA3MmJF2FMLd0YMzBwg0MORsKQcg7I/orTLUrfZbGTpOi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501439; c=relaxed/simple;
	bh=9xyeqjqPV2Bdmkwjgp/CbUzX3IxOrEVjsENrNl37A1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUmI47XjE8rqDLdKVxE0uij8i7WHbXkS6W6QItFuZEFrtUstO7eP92NrUJ5/B7LltKvj8VcpZO0nLe9xx/iK++DG6pLXM9lL2yJ2IssofqSfYRW1646H/TLktKagmvl/B18JKReZTYXRftTn6RUcgh+tkfePuNnGJF7YFSM9jFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PREvJkjX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PREvJkjX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDC5C4CEEB;
	Mon,  9 Jun 2025 20:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749501436;
	bh=9xyeqjqPV2Bdmkwjgp/CbUzX3IxOrEVjsENrNl37A1I=;
	h=From:To:Cc:Subject:Date:From;
	b=PREvJkjXRrUTD2ohmHgu8GmoV3QmKwPa5SK4tdH9POkEkHmM7VaQBwLZMOwjHl0ml
	 bPdnHm6VgIWECfqzsxDgcQsCNYio+m6II339JJw2C9NdOuiCwQ2CL5Pt3+xfwhwhQZ
	 fP7l4Ac/Byl16SRTSFBuwAFu3TCMLxwUWwlpj/LFnglVT3HmVovWF0LbAKSzkVxCaK
	 eT59MYYLqUG6F1K1NtiYqHeTQWXcQo3xb1fklSfE0nObeqx6nnB3wSl9fnOQ4IBDEf
	 Jey2HkaNKc/krBTRONo6wA15qaF1Z2h3/booD7FF0Rt2sx3hJuTK8dAw9Je/173nWV
	 5UKtGuBw7BdbA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: broadcom: northstar2: Drop GIC V2M "interrupt-parent"
Date: Mon,  9 Jun 2025 15:37:04 -0500
Message-ID: <20250609203705.2852500-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default interrupt parent is a parent node containing
"#interrupt-cells", so an explicit "interrupt-parent" is not necessary.

Fixes these dtschema warnings:

(arm,gic-400): v2m@70000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@60000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@50000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@40000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@30000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@20000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@10000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@0: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 5a4b81faff20..9888a1fabd5c 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -367,7 +367,6 @@ gic: interrupt-controller@65210000 {
 
 			v2m0: v2m@0 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x00000 0x1000>;
 				arm,msi-base-spi = <72>;
@@ -376,7 +375,6 @@ v2m0: v2m@0 {
 
 			v2m1: v2m@10000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x10000 0x1000>;
 				arm,msi-base-spi = <88>;
@@ -385,7 +383,6 @@ v2m1: v2m@10000 {
 
 			v2m2: v2m@20000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x20000 0x1000>;
 				arm,msi-base-spi = <104>;
@@ -394,7 +391,6 @@ v2m2: v2m@20000 {
 
 			v2m3: v2m@30000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x30000 0x1000>;
 				arm,msi-base-spi = <120>;
@@ -403,7 +399,6 @@ v2m3: v2m@30000 {
 
 			v2m4: v2m@40000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x40000 0x1000>;
 				arm,msi-base-spi = <136>;
@@ -412,7 +407,6 @@ v2m4: v2m@40000 {
 
 			v2m5: v2m@50000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x50000 0x1000>;
 				arm,msi-base-spi = <152>;
@@ -421,7 +415,6 @@ v2m5: v2m@50000 {
 
 			v2m6: v2m@60000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x60000 0x1000>;
 				arm,msi-base-spi = <168>;
@@ -430,7 +423,6 @@ v2m6: v2m@60000 {
 
 			v2m7: v2m@70000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x70000 0x1000>;
 				arm,msi-base-spi = <184>;
-- 
2.47.2

