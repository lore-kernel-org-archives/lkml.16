Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262824886B;
	Tue,  8 Apr 2025 20:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144029; cv=none; b=n5aqFgW62d8lyt108nlgEavM1+PHBMYFtv57W0Vmf7oOwbQRYmhyifdV2Euk8x7sVleNCmN4o+9Qae5yG05MlvE1ulxgVeCiMAwn+fIANHq3rkBrlV0UoN8xs+3CyzCg8wk94pg5LVgx8BxUe2fWZVc1SxoPyo9kTON5HPyVu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144029; c=relaxed/simple;
	bh=PMfPJkfYCA5FLy35kmGiTNL94yNxRroKCmDLM+iqoTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=skNtDLtM9bnA7JJ7ieIRUvL/9rlJHjbRgXunnuQlOU5V5mmVBy7O2rj9G0NSDrFpu6GRvX0z/goXQxmKp6wEnHyC8G7nG5u/r5UQfvkZjV+SOaobWTHiDStsW8jyGj1CknVxlSFKYb0oBaDK9Xsq5Tdv90pUEZrwX+G3Y4FvPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=cTpjVuaW; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="cTpjVuaW"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CDED01F9EA;
	Tue,  8 Apr 2025 22:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744144023;
	bh=V5Rhzl+UaSq7NkWq0KZryRLkoi/5M8dAQSxp5ngWDmI=; h=From:To:Subject;
	b=cTpjVuaWekEYhcb7/2HVXTC8QJpR2hXnQ3HLHRKFHoYwAhlF2TKWCiPZE+A5xLJNn
	 Xl0xZxbLpKrgPLKJHEXDXTNkVfq3rFgLnqK2wqNu1vsDnN9B9WcHfHov7P5pGAMhlA
	 hTfnlxKj17+XG7tD4ybZCx6UhsAhSbyUibGrEgWTCO/2YTXcRzRYUf+Qtx6DbMjQgM
	 zQ4LipkNXDuoIxTcBXyEnkv3ZkA/XTc3llUx2FthTbghqiV6kUL4usvWn9t2hMUGXi
	 ZOXu5idauxq/vFSSeYeGYW6zeFMmExnbatSnGO39uQljyFk/o/HRz8aiSkhEl7/yDc
	 UVB5KfOMXcl9g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am625-verdin: Add EEPROM compatible fallback
Date: Tue,  8 Apr 2025 22:26:55 +0200
Message-Id: <20250408202655.6329-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

According to the AT24 EEPROM bindings the compatible string should
contain first the actual manufacturer, and second the corresponding
atmel model.

Add the atmel compatible fallback accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
index fcc4cb2e9389..2b5f5e50b578 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
@@ -114,7 +114,7 @@ sensor@4f {
 
 	/* EEPROM */
 	eeprom@57 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		reg = <0x57>;
 		pagesize = <16>;
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi
index 7372d392ec8a..9a2483cf5d70 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi
@@ -118,7 +118,7 @@ sensor@4f {
 
 	/* EEPROM */
 	eeprom@57 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		reg = <0x57>;
 		pagesize = <16>;
 	};
-- 
2.39.5

