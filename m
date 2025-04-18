Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217D22D7AB;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004549; cv=none; b=Dkq3sv5ov5xwoeyZYX+/yOVk8ajK9XBHQAQVYBlqpDNIlN82BCht91dxOOLyonMeUrYNcxkKOanQJo78ESoNvvq9OohdP8wa5TQnv02sfP586uowj7ApiZmLtLvlOCzAIJB80BGGjcQSMbrdUgjmWYisOFneaPsLtIeD6fkG5lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004549; c=relaxed/simple;
	bh=RP1N5bHXz63rpt8m5IOjX9qLsKGVIyvS42DszAO2ijA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9KCVK/wRy86K6ISsRn5U1+A25+hysK1OoGs5YnpcHaD/fajM9hRUp8U1EwBsoBbmyGiPph1hV0RykJfr0P2ZpNCrs5NoqYfVezSJgf89qRTqZ/QrjIGHW9PDxtgpjr/+Mno+kVSWU+VXoMv3FstA+OrHCNHCkWMHI2XgDUwo5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/WICEO5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/WICEO5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A479DC4CEF0;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=RP1N5bHXz63rpt8m5IOjX9qLsKGVIyvS42DszAO2ijA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B/WICEO57KnQkp0UzRW9IVGB8V74zRVW4YF/d46Dr9UmssNl9zSVf94ehpX7fQG1s
	 PQDXEWO2udvvpXG639JbHPjkMSdeCGg4mjw2+ublGbZQLzqV0C8dr7EMLAFJRheY2Q
	 RBk4s81d10u6ojBAjRlV8bhSHivWTYmA1TZ4Ysm4YK0w4YHV7n1V8oTIp3cTu9ZGta
	 +v2qDlMj9c4AAHqKqwo/StvaM6OARw1NNDoBBQVnJyq3alQjwVX6buGQtuGHWTJeCW
	 vHv04gvjgtKOrCK28k+f3ta9/RGzsm/052YJTm0QmKexawMltG5S0xu7//LTtg4rHc
	 NJljhoyRpP5Ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F373C369C9;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 21:28:53 +0200
Subject: [PATCH 3/4] powerpc: 86xx: Rename wdt@ nodes to watchdog@
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-watchdog-v1-3-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
In-Reply-To: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=2682;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=rZMd++6lrdOvQcrT6pf6xOYPM6SAtU5WeGJhAq64EIk=;
 b=tf93aCaOdy1EsZyU9FYVRQHK9ZP9v8Ml4xUXSUXJ5nNXpjBRmV+1T7Wmr5lcS0c2kGNGLJL9f
 sEDGXlRy+WHAh+988Co+paUGx0tza3RDe8ZISXSuTmWBhgH7dOd7pUa
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
rather than the abbreviation "wdt".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts  | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_sbc310.dts | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_sbc610.dts | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts b/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
index fc92bb032c517a543d6e1e498ab903f1937414f8..48a81430a8a31fc29b53fba03986b2fb984b66c1 100644
--- a/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
@@ -82,7 +82,7 @@ fpga@4,0 {
 			reg = <0x4 0x0 0x40>;
 		};
 
-		wdt@4,2000 {
+		watchdog@4,2000 {
 			compatible = "gef,ppc9a-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x2000 0x8>;
@@ -90,7 +90,7 @@ wdt@4,2000 {
 			interrupt-parent = <&gef_pic>;
 		};
 		/* Second watchdog available, driver currently supports one.
-		wdt@4,2010 {
+		watchdog@4,2010 {
 			compatible = "gef,ppc9a-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x2010 0x8>;
diff --git a/arch/powerpc/boot/dts/fsl/gef_sbc310.dts b/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
index 47ae85c34635bb0165004e52d15df92542406b15..8eb254b1738dde7327d5e3fc07b4bbba137b4d9c 100644
--- a/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
@@ -79,7 +79,7 @@ fpga@4,0 {
 			reg = <0x4 0x0 0x40>;
 		};
 
-		wdt@4,2000 {
+		watchdog@4,2000 {
 			compatible = "gef,sbc310-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x2000 0x8>;
@@ -87,7 +87,7 @@ wdt@4,2000 {
 			interrupt-parent = <&gef_pic>;
 		};
 /*
-		wdt@4,2010 {
+		watchdog@4,2010 {
 			compatible = "gef,sbc310-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x2010 0x8>;
diff --git a/arch/powerpc/boot/dts/fsl/gef_sbc610.dts b/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
index 5322be44b62e78bebac0fa92c0de05094b186dde..02edbb262b8f00279dea024700eebf874501f6d5 100644
--- a/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
@@ -82,14 +82,14 @@ fpga@4,0 {
 			reg = <0x4 0x0 0x40>;
 		};
 
-		wdt@4,2000 {
+		watchdog@4,2000 {
 			compatible = "gef,fpga-wdt";
 			reg = <0x4 0x2000 0x8>;
 			interrupts = <0x1a 0x4>;
 			interrupt-parent = <&gef_pic>;
 		};
 		/* Second watchdog available, driver currently supports one.
-		wdt@4,2010 {
+		watchdog@4,2010 {
 			compatible = "gef,fpga-wdt";
 			reg = <0x4 0x2010 0x8>;
 			interrupts = <0x1b 0x4>;

-- 
2.48.0.rc1.219.gb6b6757d772


