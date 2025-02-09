Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634991714C6
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739115594; cv=none; b=ipiXSYa4fzi8nShB2+ZQ+midWQ0B77go7b94nrYO8e5jm+n7Vq6LL9ykRLUfUagSZgjmVioUe2RZ9ddsvgfz4HFQWYhOhU1GErkObypCyOcL2/H+GOu9WhED/pMxYBnsxfAdUf7jqefu3C97HOkaZ1RQhUOVeq/N6bjl4Jgs3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739115594; c=relaxed/simple;
	bh=cARFp4SIhGtLx/eCixlAl4h9ZbuuApwEVo2cNQXqnyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iLDLkcU/ZhQrejfP5QfR+Yafy708wqEr4jlHEqNVRSDjt+2bCRMFtacjVeaS6T2DGqlYf/gO89LX8kg9UPMSZ97bcJ2O+NerpP1twyGbmi0fXeUYn6bKMoz/5zq9Sse6sk6tudi5PU0HU3jHExRZdcnV0utuOUpfoP8lObdHnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6yNn3k3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6yNn3k3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f50895565so31275335ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 07:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739115592; x=1739720392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/kvIzQrtuFWagP0ZFJ0py48diq2bMBbEg8k6AGhhM8=;
        b=O6yNn3k3+aebmvrvgNfgPOSc57qDwnRQUTCjhtMWLyhcVL+JcRBYg26nzo/ggRWgB2
         XEWb1E/D08PAvmDUlkgYyFlpRU4Ge9aZi7WAD+NlJzbLlAlnSII/wsxgE3efJT2sP6Ux
         UU7lYVtjgd/ILuFQGhStbxB44fHEYt20Bbuasz9pfWYUwh+7CLgwIdWFQ29ZnsIJELfg
         VS/x3Jiwl0Ij9jRF5J+lSe2xYm6AGGpZ2VLsvNh58zLnjNNjiYFPGZdxj/z4xVY1P6Za
         mn5ysgBxLQ2RqV4JJbk2VNHTqBxlaTIfaHODQ8NG+ce095O8ULTe3PEDr8Ep31bdI+x7
         b2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739115592; x=1739720392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/kvIzQrtuFWagP0ZFJ0py48diq2bMBbEg8k6AGhhM8=;
        b=At6uvNk9+BWYLCarjjYglTXv6edDA+MkrpQsO3yJb0Vi2rvy3XOF2FP4tsihAnQsoJ
         MRJax4uyP+eNHgNymWhihizZruggUz6i7vkasVTGTf+sXNT2hxe2EsHPeGR+hzbF8bPr
         ZjsWtlg6fizENDPe/D/ec0aHg0l1D7Fit5lKLeYcJNWSgCY2H6X5AqO5ncBHJzUVmLrr
         f8iEnO/itG6l0ubuLsrCDNDa0P01C/hLwsLZRNekdaOZU3l2wqSxvn7b/NybenPaHJXl
         jpS+oOa694ToJvC3AJo/cD7z8oPGeHcx82erJSxEKl8EUppDMsxNhpWNykkSuENqxH+c
         3kVg==
X-Forwarded-Encrypted: i=1; AJvYcCV/ozQk7ftUdyGkEs2C9gOg0XeGL29akr34DkkrJGJsqbsgw/k6XnohhxCyS4tsIn72fJheUneZ7xaNvnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7387zlW7SFFNq20+nr5ZJpjsctrZG7gXZi/k+hC4B+2D/BBN6
	h/cAOl7PagKY4aU1epsQfEesNmorVh4lT3L/6UXUqNofBRsGUEfMHGttVHryiw==
X-Gm-Gg: ASbGncuU8ErsBalgwoaczVjywfonVjVGPrOhpgmj5ihiyULBfHyKZtMh9FWe1lBAs8f
	XQSm2Rdt2Uh6o4smWR5V7BXepbSao8BxKVybGKzqX4ZVYenbTKhew/KmYFeCBxLWhUdfQ73aMlW
	HSdmYtfZjMRJoZ0yc3HtCR4Tx2y29sHo53mOIohzcUDe+oVYFcjFQE8ee/jh49QTrz5mCsdmlBw
	tLqwI/71hh2o/ceTE/6tugCVQ6+cT1WJnNWe+gPRAyLvCuXc4GudT8j03lGJVL3HmFDEnMWyUoe
	ceiRzdxebWmmyi3y0gA42tyXIXtvMWxH01nD7f7RbF2jtA==
X-Google-Smtp-Source: AGHT+IF4pqcL1CA0s4DBaR/hb1zv6OAkpbvkONKhQYvXu/1axVV/kqi6HnIszoiR+HbDfFDdXVaPxQ==
X-Received: by 2002:a17:903:285:b0:216:2bd7:1c27 with SMTP id d9443c01a7336-21f4e746605mr166465975ad.33.1739115592714;
        Sun, 09 Feb 2025 07:39:52 -0800 (PST)
Received: from localhost.localdomain ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e0casm62105095ad.174.2025.02.09.07.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 07:39:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sa8775p: Add 'global' IRQ for PCIe controllers
Date: Sun,  9 Feb 2025 21:09:40 +0530
Message-Id: <20250209153940.3489-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'global' IRQ is used to receive vendor specific events from the PCIe
controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d1300..7355ef9bac21 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6421,9 +6421,10 @@ pcie0: pcie@1c00000 {
 			     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "msi0", "msi1", "msi2", "msi3",
-				  "msi4", "msi5", "msi6", "msi7";
+				  "msi4", "msi5", "msi6", "msi7", "global";
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
@@ -6579,9 +6580,10 @@ pcie1: pcie@1c10000 {
 			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "msi0", "msi1", "msi2", "msi3",
-				  "msi4", "msi5", "msi6", "msi7";
+				  "msi4", "msi5", "msi6", "msi7", "global";
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.25.1

