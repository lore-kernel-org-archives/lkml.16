Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDBD2185A6;
	Wed,  4 Jun 2025 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029507; cv=none; b=uepEsVQKAInKfsilZLKe0qB2AAO5INVuai7Ks7X2y9VD2z/NWEAGkcds7U4UztcO6aSKwf/NIj0gqO5AZ3Ev2qielWbiUh6Wp71vnvrdKH4/Py6wf+e05Q40/Txh5bHlRfE6S57HGI3mSRqlETVWWWq44Ohrs1tlAdwfGfJ1DQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029507; c=relaxed/simple;
	bh=6HhoIgPukMJS5T7rxs113ykfa+EUpJTQgiJW9H1eZlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J4srCEv5vEWw+rmuxgOagxvyEaTHNJuJ4k5QvpaE0Vkvn917lsUClf/qboo3quA+vAIEFMYwWk/XJJzkmrxuj8rTB17JUpQRnGe9RlfjioWEicaG224ZdRjIQaKMHltp3ALTsWDXUJIi7wCHz/MjbO+d4r+OZTulINK3zz9C8pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kBzgqvCq; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qMjaYYAo reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kBzgqvCq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qMjaYYAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749029504; x=1780565504;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ND5I1wqWQVSRJHCCfO9DhtqF0hOCpub/kFuUDNFnLtY=;
  b=kBzgqvCqLxxcik0xYO5FV/6RbeZ6t0XOX9naRjEf6uX8mpeSWQHFeFRA
   tAkqR9HCWDN9SCubOmnqsXJgVRMIaluwwqC9wk+PwaFaxFq7ZbZtdL7V7
   4FPCsRI51EZm92HF7QqQ3KKDgEEJg4cJW7+PFJ+sZiG7vU5DxHhi7BurE
   9GkWp+FMg6w8FaN4sGANfxv3/ZXJE+W+hB2NME3DBPe9cFu/OPQnvlPjz
   0lbOSBm/c6u9edmlcHCQa2v/X0V6NrdPA+LEXMhpvJ7IT/WvZdrGuX6v+
   uxkEAsbFM9OHGjRfv5N1s6cOZxH2kCxEfraeOMG2uveQVKdSjftndRsZQ
   A==;
X-CSE-ConnectionGUID: F7Ph8sD+Q/e2bF0tYrF90g==
X-CSE-MsgGUID: iBNkwfGuQi6WVFYwDypSOg==
X-IronPort-AV: E=Sophos;i="6.16,208,1744063200"; 
   d="scan'208";a="44448632"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Jun 2025 11:31:35 +0200
X-CheckPoint: {68401277-2E-28ACC837-DD1065DB}
X-MAIL-CPID: 598B4D6943D72BDFD2099B674382E52C_2
X-Control-Analysis: str=0001.0A006372.6840129B.0081,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A093E170BCF;
	Wed,  4 Jun 2025 11:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749029491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ND5I1wqWQVSRJHCCfO9DhtqF0hOCpub/kFuUDNFnLtY=;
	b=qMjaYYAoyG2iSRnPM1FeM2/C1cqDqsX8Qx2OVv6BTNz1GKdkHLAErgvW2kruonHN1pPwMW
	L0JXZ9IGa3Vr9aEKQNjiGfeBYPVl627s38q47LhP5rr67xMY/ufw4KG+r+xNGFSAFFzDME
	dvDJIKKHZcTLqnHfWxG2MV4LS5stcpe4kNLmWg3w9MWHNo29YhpEcS5nV2B+ceBxjgosYP
	7CETJ29D0JaGDBTdgGZFdZ7wLUB1MLEjLVP3NIedg2Bt2vi9LF5oOpFVQXGU5GlzWvlE3N
	XIwdkCyeyN5QGrDLQXX9adHt2sHjY56QtES0MjIVclsXnw+/ilsQpeuBrCP3aQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] arm64: dts: freescale: imx93-tqma9352: add memory node
Date: Wed,  4 Jun 2025 11:31:21 +0200
Message-ID: <20250604093122.203929-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Although the bootloader should fixup with real memory size,
add memory node here with smallest assembled size for
readability.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 53e9ee6e9ca3b..3a23e2eb9febe 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -11,6 +11,12 @@ /{
 	model = "TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM";
 	compatible = "tq,imx93-tqma9352", "fsl,imx93";
 
+	memory@80000000 {
+		device_type = "memory";
+		/* our minimum RAM config will be 1024 MiB */
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.43.0

