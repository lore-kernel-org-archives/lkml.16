Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAB22B8C6;
	Fri, 18 Apr 2025 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002104; cv=none; b=g7irOy0NviWLdXSHZASRm71FnoX0PaHd6ypQHe+RDwlu2BUbpm8NwNygx2bFxkNdO9W8jatZ9XjcLegjHtlMxmdjysiNdlTTUyFBctRWE+UIaryIno/lguvd/F1SxfdTDhPaF3mjJZ8N3+OR+sCgRNLct9lmA5XzKPMPJP//p00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002104; c=relaxed/simple;
	bh=HEU4YutA9kG/s0/mba3Ytoq2491mLHZZ1L9DBov7nkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g7UcE2AeCZHiAbqXV2DPGMd7uCle2bGlNO+hst4JKLaW2d1gXzFBK+8FWQ+ziuWu3N0J64cYY43XtKKzfdYEmkogZTKFBtyvzS5ZHQApDQT5fS9dUIskyputdKlzle5kn0qo+8RJ/cnFtPlRpBHq9kLjiRx0EGoNV1A2fo73jDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDXo/Ncv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDXo/Ncv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74F55C4CEE2;
	Fri, 18 Apr 2025 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745002103;
	bh=HEU4YutA9kG/s0/mba3Ytoq2491mLHZZ1L9DBov7nkM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qDXo/Ncv7gRvbyUXc1P8PIjOCWAB8BXXi8u3a3c6zNMziFoRBIqe+IvYHMfEdlDJK
	 hAUYJBaIdqglqaMWnHJnZBpB/y9KeQNuAJO+QN6EYQo0ChUBCd2uXBEZyQ1I5cvL/i
	 Q1i9nDU14/8nGaA2pFMdT197bJFGyRVVoJHAWsCgSdE/82cMWQMp5ZshFm4ubqJtEk
	 UDT1rfVGEDa9Zp83jtCEbX1m6WZX2JBwZTL0pjgdHi5e6DFlpjD3+wfZp4agFU66OX
	 zAqfJFNhiFoDCFJHp37y/eKNY5KIG6UK+Qhmw8mu9tnUDtUv10L1T2yEOihjXUzxeF
	 Avnd9JJ5Joc2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF10C369AB;
	Fri, 18 Apr 2025 18:48:23 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 20:48:14 +0200
Subject: [PATCH] powerpc: dts: mpc8315erdb: Add GPIO controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-mpc-gpio-v1-1-24be2365992a@posteo.net>
X-B4-Tracking: v=1; b=H4sIAG2eAmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ML3dyCZN30gsx8XXPLlOREyzRzA1MTMyWg8oKi1LTMCrBR0bG1tQA
 w6h8oWgAAAA==
X-Change-ID: 20250418-mpc-gpio-79dca9f70546
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745002102; l=1409;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=yIo4OMFzwIHk/Y7Ad7fIh7vacgPJLYwfWJ8zjzP38HI=;
 b=MzF7If4e34vj/JrF+b0JokWfYf8Phq6bZVN/3vliB9QLi2BrnJARDvJb1SwTr4FhTogpGdi+M
 FirkRP7a6TaAqPvGZ9/xqAYQDYkFSgt9bL21NT0rt0QrvtFJl/aFXy7
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The MPC8315E SoC and variants have a GPIO controller at IMMR + 0xc00.
This node was previously missing from the device tree.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
A version of this patch was previously part of the series "powerpc:
MPC83xx cleanup and LANCOM NWAPP2 board", but I'm splitting it out to
reduce the size of that series.
---
 arch/powerpc/boot/dts/mpc8315erdb.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index e09b37d7489d01bfd16a26e9786868f630fa0262..a89cb3139ca8c3d4f22e43838a4b7d2dd5109aa5 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -6,6 +6,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	compatible = "fsl,mpc8315erdb";
@@ -358,6 +359,15 @@ pmc: power@b00 {
 			interrupt-parent = <&ipic>;
 			fsl,mpc8313-wakeup-timer = <&gtm1>;
 		};
+
+		gpio: gpio-controller@c00 {
+			compatible = "fsl,mpc8314-gpio";
+			reg = <0xc00 0x100>;
+			interrupts = <74 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-parent = <&ipic>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
 	};
 
 	pci0: pci@e0008500 {

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-mpc-gpio-79dca9f70546

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


