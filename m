Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2061BEF77;
	Tue,  1 Apr 2025 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496377; cv=none; b=L2b8/MEBiN2Mwcr6ILu2FEsN3kyKqIFPetNsiJCY1SfauTgq/4XVP4XOMjZV9DFS8Dea/xZSjFnSCF1S3ZM4jobVtXGotSmdo5o1a8EAblMHpXrd36ELFZMe3f5Zu31YccglyjwCoi9G9VFrraIRQGKP5cEDDhyfiMQgLDA4Sxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496377; c=relaxed/simple;
	bh=UqgS99roY25RNojS081Y3MkvepLzF+PS+1yR4MUWOfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UPbgF2p3k5rgnaTbI+7COdfpWjRav/kxRTMpmiYT+gWjbWDOd3m+Ln6n0sNydl6q4LI8yM4bLRMX+Qr1wxMHBJhj5wqKDte7YIhfYdSQIR0nJO3kXvY3dZAAzKUzrcFyNN3yz2tiv2xrHEtn3yRmUyiiovl9RY3spsZoFGP7wNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfOdmqa8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfOdmqa8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605F5C4CEE4;
	Tue,  1 Apr 2025 08:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743496376;
	bh=UqgS99roY25RNojS081Y3MkvepLzF+PS+1yR4MUWOfk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZfOdmqa8+TL4XpP2OBcuwqdpODAS43xk82Qzz6ZrvWnCaju0PcAz2rlS0rfI8Nm58
	 mQq+UV5kHDfZqKVWArgAnnGq5RolcpzvU5O2q1IHSMFCrMgYBDWmDd/Kll8tUvzuIK
	 rID/+gBvNAMktHNqTB0oEEmUVS/OHbnW5gVI/bgh450wxqlLI4hcnpEBEA5z8tbrtf
	 OxaCdAdgqDU4kmCl9UavjHm7iliwZzbfMBxADkVNEeXafLJQYUrTAfWBO2uP5EYtuS
	 bCjWONpOOUNLXkpFgabG/2OeALmVDNoVBP9ZEfhmxmEFTK0x81ZlZ/N9Pp9W62JHoj
	 42mZIZa1tqlnA==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2] arm64: dts: ti: k3-am62p-j722s: add rng node
Date: Tue,  1 Apr 2025 10:32:46 +0200
Message-Id: <20250401083246.3228964-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the node for the random number generator inside the crypto module.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 6e3beb5c2e01..7b65538110e8 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -227,9 +227,18 @@ crypto: crypto@40900000 {
 		reg = <0x00 0x40900000 0x00 0x1200>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		ranges = <0x00 0x40900000 0x00 0x40900000 0x00 0x30000>;
+
 		dmas = <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
 		       <&main_pktdma 0x7507 0>;
 		dma-names = "tx", "rx1", "rx2";
+
+		rng: rng@40910000 {
+			compatible = "inside-secure,safexcel-eip76";
+			reg = <0x00 0x40910000 0x0 0x7d>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			status = "reserved";
+		};
 	};
 
 	secure_proxy_sa3: mailbox@43600000 {
-- 
2.39.5

