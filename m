Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F10B18D;
	Wed, 11 Jun 2025 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668468; cv=none; b=kmnzdOK+kb6TrColUZA+DLCg+E4XJ3A4KUDI6kcAbq4+uUn2NwM1TQHMYeGKdwuf2cc2qBMh7f6cK0kgpePRamZW3RMUt194eM+UQ6Q3gxINi1NJf2U/+9reQPjm8DMlvLoCW1bUvVn9gsfOwQhce9Xmw8MUf5o20ICq4cJL5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668468; c=relaxed/simple;
	bh=HEU4YutA9kG/s0/mba3Ytoq2491mLHZZ1L9DBov7nkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AbBdgoQVtKqyrB8A3WBZNQwlTjiIYFlS1ofKxboHUe+tBVZj2qUBgwl7+LHi5LUD/Jd/xeLUs2iytxEf1vbxsaDlRaRAVZkFj0ax3chgk6IVhzKWaiccVBKUnTWs/Z44v2pY2wNXizM8xFw3TljAV6j+3rvmGL58Y1hKTDaiXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7d89dHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7d89dHb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F5D0C4CEEA;
	Wed, 11 Jun 2025 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749668467;
	bh=HEU4YutA9kG/s0/mba3Ytoq2491mLHZZ1L9DBov7nkM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=s7d89dHbjMDYIEd1Gn4wI/fitFyYw4wUZNjZKDx64yneWUFCGbbWUgIBliO8RBCLl
	 s+3mZuC5dTu99y8EHqyNt8pcLNhBIekbr7QiD7MkvGSPPhA3lp1R+XgewCLdpcW0en
	 PhzRiFpANFU8jm83mTp0Hi8Bl3taTUCHLlZL9HF82U9zXwhG5h9e8njw3nCtiohzCu
	 wlcU3EV2c9qR4I12+s/ho7t5CNIKd1rfO9SG69VFXa6rLpUolrkhM2xhmn856INgha
	 yKmNhwggG9t1utPlyN5XcUzbJ4T4i3QBCqclNSlRF4CZXHYSt068+2LT4Yj77g3XUF
	 HXq/tkc+MOlKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94910C71136;
	Wed, 11 Jun 2025 19:01:07 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Wed, 11 Jun 2025 21:01:01 +0200
Subject: [PATCH RESEND] powerpc: dts: mpc8315erdb: Add GPIO controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-mpc-gpio-v1-1-02d1f75336e2@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749668466; l=1409;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=yIo4OMFzwIHk/Y7Ad7fIh7vacgPJLYwfWJ8zjzP38HI=;
 b=t2XtzKk2H7rwfNQdpvWOKJG4VX8BR/rxKH6Dz6UQMgVFtZru+BUuVAF8xZp/evmj28KZWpxgG
 JgO+ojw6KFlC8hwxoeHM7YdVVX7H+wqjB0xhsUl8KqDVM9xAD42Bznx
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


