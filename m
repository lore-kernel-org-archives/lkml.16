Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD5C199934;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827630; cv=none; b=UF+apCr4w1NsMKOWPGgPHAkCSKV0snsDNNiMyy1Xbm62vc/KMVoTn8p/q3ze2gC1ti0NIxsUoTq0M2iWe4Pi9uJTTP3vXxt09Vx8u/F6ZvrJmEafawDupjKM1mlqvnpeRf7p50EtlgazzSPzqxAqTVgiwYcTvX/lF+ADXaYAKzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827630; c=relaxed/simple;
	bh=5Q2Q0HYjd/a051Qeq/6+x7Kt/vVCeBodlYiFHOoyYjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPzKzuO8RvN8H8zy255x0dojUgTdqoUPPzfrpdzrAs5sbfICKL8XYIKkaQEXU9+gxl9kAhFUDyt+iTzn48xpWSH/+AJ2+ATRKFsVqFgv1CMayMzYmrWnOGaYJyDvyzMKK9Gkz59bWzeLFSlVzvXhFTjioJXcoBv0bkbnZfDywWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHz63QPH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHz63QPH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD966C4CEF2;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827629;
	bh=5Q2Q0HYjd/a051Qeq/6+x7Kt/vVCeBodlYiFHOoyYjs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vHz63QPHJKbu1WaR6X38LhiUnOZTnYwkq/s7Cl0VPwu/RdX4/DtIFZHrSvfCbTzkC
	 cl5fMm4COfeBj/uRRRIPOB2atHNKMedVjX4+slhfPjTUqjppuAUeKwF+ovpema12ge
	 sh8KyEWaTo40/r/knxBjAD+BQFrCsQAdwZjd/+lSJ/+grIwAskqo6uZP7kLuIDQG86
	 sAtJpMzKx6ukrX3+uaay3yvI0GnuDCBUY4INxzm5iJAWMsIKqm8UIjFNhYGnh+g5Vi
	 qYnTQUzx0/oZEwPjcARak35CCGTSYO9ONbvxf4J+Xp1Xrm7R5Th2cWxGQOVMiNvxZ5
	 ZMVls9++8WtVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BA8C83F0A;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:46:58 -0400
Subject: [PATCH 02/11] ARM: dts: lpc18xx: rename node name mmcsd to mmc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-2-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=864;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=F9o9Zz1l+QBlQQDM8Dn10ujNdmNzCrECB6a3juGDdlQ=;
 b=i5bDnkjDaXg3R+eMt4iPutUeGhKw+htNfKMzD/bm9mmqJ4e3wV/3xTWR2FlH8nL/edtRFfYXq
 j1J7oytr13sBtnFs95y15K4NQ/a+zK5LF5W8wNnfAEjga6b+Wx81fqe
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Change node name mmcsd to mmc to fix CHECK_DTB warnings:
  arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: mmcsd@40004000 (snps,dw-mshc): $nodename:0: 'mmcsd@40004000' does not match '^mmc(@.*)?$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index e17298e89eebf4fc7e3f135dd4a20e563db48ed3..80da477bae3d9dc45f0dcdedc275ac2ff09032bf 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -111,7 +111,7 @@ spifi: spi@40003000 {
 			status = "disabled";
 		};
 
-		mmcsd: mmcsd@40004000 {
+		mmcsd: mmc@40004000 {
 			compatible = "snps,dw-mshc";
 			reg = <0x40004000 0x1000>;
 			interrupts = <6>;

-- 
2.34.1


