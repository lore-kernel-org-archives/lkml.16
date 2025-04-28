Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDF26B958;
	Mon, 28 Apr 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844080; cv=pass; b=lG5SvmemD2XzyJP0ZMMVi77yG+oDlvQuiOKCr45Wte/RMSBF1xqbbGOcRT3Kviid50lVPnmmLFVOr3IO9PmTWcdwQNQxldaWY7CD4Xlq23jfrupDfh0p/CfZe+UhbfWyxOs4bUv+OpneqqnSZoPzYP1Y8zhgg08tfgbTFBjFkpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844080; c=relaxed/simple;
	bh=BmJ8fFhrllrVNXh6foM0tOz5xDM3nSNM/fFkeFylePU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJSQ+1AOZjv6G6A8gcG57BUP9CAhuP++DnGMoEzB9cJWOOx4bIrpo6DeUN3vfW7LCh6riKZ3mQOA2/tkk15l+maVKBoA/DR5wur9uOX8IwZvy7XgnmHE8Jj0srTcHQpMLqaKFQbaJCv8yLtraniFldNLx4+RQS0NtN44aTOp7pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=mUOSWiUt; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="mUOSWiUt"
ARC-Seal: i=1; a=rsa-sha256; t=1745844050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hQ9kU5ovfWYh3xJW0FBLTEdtP8B4QMrQxe0OhCIyqy8l89uhvwBy+w94x1AQUTWBJll6HFtD8w1mvdEmmjGhOV4J9ihq7ECj3WH8DmEbFeukEZHM/zN5Vjeeid9NFu38GKvj8qelhGS84v5WNP7HxE+e7gbVRHLE6PALVu2mJAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745844050; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iDUWlWYITNoYcDcCC3jnCqiVPV8s0bgHvdEQpT3GAHI=; 
	b=mkQToJlHeIgAmzuz7WstdN2eVe88kUck2JXyX09EtmuccQx0rOzdh6XSX28gGsJYX6tvlybqNt8PzllqjKr5AyyyCyGj81+jJjgP0xLjH62ul9cZdsx6wcr20Iv9y40LcqemVnjRDC8/L0hsfCA5KqDPR09OEkNpRonb8hTTE0Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745844050;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=iDUWlWYITNoYcDcCC3jnCqiVPV8s0bgHvdEQpT3GAHI=;
	b=mUOSWiUtolg48QWGbkJ4prdd9W2gijfvjSAvQtnI8ankqLssL6wGuKrr6fGiGOrR
	EMlZMTHeBs8FGlUN5lsBdXu/65jXmh4HzR5NRdqFiDH8k77yimqZBo8TQjg4EPqvQuX
	Kt7iG1YXmvm0RkgHjikoH7C+QMXOZlJVgpNfcMpY=
Received: by mx.zohomail.com with SMTPS id 1745844048587698.6681306110062;
	Mon, 28 Apr 2025 05:40:48 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 28 Apr 2025 20:39:45 +0800
Subject: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-cv18xx-mbox-v3-2-ed18dfd836d1@pigmoral.tech>
References: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
In-Reply-To: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yuntao Dai <d1581209858@live.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745844011; l=884;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=CSLWYAdiw9/p/f2aE/yXFp+1aCvV9HAX2JHCuVxOo5Q=;
 b=MaKr8B+Qeb+49HSAO3AqIztELj+ryAHblwbpwEXmlyUkGDKJnaZk0YdLvkyy42JZIGCeM1y+p
 6mzz2/ppmOGCLCbXlwjsanvwPw7bhJnv4F+tFzzZnK/5HhCw1Mq/3Zq
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External

From: Yuntao Dai <d1581209858@live.com>

Add mailbox node for Sophgo CV18XX series SoC.

Signed-off-by: Yuntao Dai <d1581209858@live.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4176fc95c2c8be52 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -55,6 +55,13 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		mailbox: mailbox@1900000 {
+			compatible = "sophgo,cv1800b-mailbox";
+			reg = <0x01900000 0x1000>;
+			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
 		clk: clock-controller@3002000 {
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;

-- 
2.49.0

