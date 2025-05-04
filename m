Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90031B041A
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746359528; cv=none; b=RvVhqw5pDzaRQ/KoWRqd071JJubSv25jNVIl22gRgwKdLfxXxcg0wkHBeio097DuuYTi2c3aKAsN8EkbTtKFcNQ0w0fcWc6tsSMxhwHiBYTDM2Exrv5bUI+BZPjm9UsNrtuJxGUOFNIgK+znuIMMbWEvIXEZnpQJ8cOa8FBayfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746359528; c=relaxed/simple;
	bh=96P1rrM5+jZou0xAjm0eLJaNz1qcRnedMxoeTatPzSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aql2hkrKSWzVtbUiq5RE4rCRv0qr+myxgutyeVuFHEqXLehXPGWJJy6ix5kGCzm1uEG78Bc7BgkTyJ2tZRQ+Q5lAznbXxb+git0qvhg+jvchgiSa3YrlFXAdP50/F8Q/lY9Yytl4J5TbWm2+cLmyLm/HV4R8WRnRBDfMnqLVKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=bRs2JqMc; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="bRs2JqMc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746359523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NyDgShD5L9byu08pC7acRvCQ/bNI7rSNU5omOW+7/l4=;
	b=bRs2JqMcNsoTLP9J18s/1NXieC/DyQAB7h7pCFcNF6KaRWM5NPynNDrQZpm6UUDUOtU30U
	CuIS82Ea38+B/qm7d+KXn/fgHBXpQhJmfQUiohkSaF2liG4meb/Srh08K2uMs8MMLsw1YE
	Lhmt8+uqNH5m2JYPNyMPAHPz55wx0k6cSoUfuqisgLcuUrg7rQCAMeoF7tXfUd+MZj6IFK
	jGumCcTgv2ehrdacsgtxBWxm7W5UdfQkk1rNuOhb3lozkz33wSHnpSUmCw6h3XtE+c+NIW
	gQRh/OLBL5Lu9bybwKUOMizr2Am/xIgaNbcWJRzH1A1GNfE19bOVE0J9z1pK1g==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Dang Huynh <danct12@riseup.net>,
	Alexey Minnekhanov <alexey.min@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sda660-ifc6560: Fix dt-validate warning
Date: Sun,  4 May 2025 14:51:20 +0300
Message-ID: <20250504115120.1432282-4-alexeymin@postmarketos.org>
In-Reply-To: <20250504115120.1432282-1-alexeymin@postmarketos.org>
References: <20250504115120.1432282-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

If you remove clocks property, you should remove clock-names, too.
Fixes warning with dtbs check:

 'clocks' is a dependency of 'clock-names'

Fixes: 34279d6e3f32c ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 4a51076890694..74cb29cb7f1a6 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -175,6 +175,7 @@ &blsp1_dma {
 	 * BAM DMA interconnects support is in place.
 	 */
 	/delete-property/ clocks;
+	/delete-property/ clock-names;
 };
 
 &blsp1_uart2 {
@@ -187,6 +188,7 @@ &blsp2_dma {
 	 * BAM DMA interconnects support is in place.
 	 */
 	/delete-property/ clocks;
+	/delete-property/ clock-names;
 };
 
 &blsp2_uart1 {
-- 
2.49.0

