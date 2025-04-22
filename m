Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4601E3DEF;
	Tue, 22 Apr 2025 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316167; cv=none; b=hR5+py3gV1ye+BMea7CtB9hMLF/FYnzNwIXjvOTbEs7NxlQy+uCfJ7cS62PcQuY482TfNUL7R1pP8+fAgnDv7Uk+cuakMtNZVCH1Y6JF35iG7T/gHQqNFoxgqPJb7lP8UFhE8g6nDFOHg7Ug5+FGKRotlFiUZVtIQ2Y3BYzEh5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316167; c=relaxed/simple;
	bh=/i+M89FhVSXaTlMiWBGQb5ELGk5s8fZWdKUGGhl5vHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FNoFymmBiW4iE/+++VQqGbOD4cEMPhLQTAveOhGEB1kqD5eDr6owq/SRrgsB2HkPtrDZzdw4VTrC8T56yrshkEXWtnSRlrJ35efyjg+VPLcKFyPhUdKU+v1slc1vfZoru7L/8Mcc1ZBhiPm2VOkmEHYnVVMY5lzhfrVHa0lOoK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=VRpkuyDW; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="VRpkuyDW"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 45CFA1F92B;
	Tue, 22 Apr 2025 12:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745316163;
	bh=5MJcsDy2OhQnbeBMx1UynLRxiyBn3DMKWGrFzw5aL6E=; h=From:To:Subject;
	b=VRpkuyDWG8e5xqejt1ao1ybkm89AggTICBQO7j4twnnOd5RQ57W1AqZQmVfgfCKh4
	 v9Wayn4RAIeYnW21i/uXaMNSUsrsdE3imWiph1UoGH1eI5y1IIvPuynzUP50XwpKmD
	 5q2SPiSK4WeOHzbr+6x+vrpKCjqjbgM4gI5eObpCJBthNLbfqVP9kYtKPk6d8noN3i
	 gponeJVFa+9yUJOBAELyn6rq7OK3vLCs9LYGkl/qRywrlpyL/LFtZh0qntEaSyoKNj
	 B0xB+Msvw19QM1ncTHOUG6pg3LdmqxTH5wQhJqY+lDYFBjswkHD6uyQwGBj0SlzMST
	 c0Q4v6NRPi9zQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: imx8qm: add ethernet aliases
Date: Tue, 22 Apr 2025 12:02:39 +0200
Message-Id: <20250422100239.58799-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add ethernet aliases, they are used by the firmware to set the MAC
address and by systemd to rename network interfaces to predictable
interface names, e.g. end0 and end1.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8..eccd0087efa7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -17,6 +17,8 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		ethernet0 = &fec1;
+		ethernet1 = &fec2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
-- 
2.39.5

