Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7F1EEE6
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148546; cv=none; b=VsH7wu/ZKlwP8883M3/z/iFNohG9RgTFA08TR20AgR5PWbKjP0EBXHR32Nxe2mMGEkJ2m7QKixrdbQFChP+4jK8qUYNF4Qq7WjWBuNzPNkNKikTUllQMwl4xRuzV3L7dsZA2lRKpJ6I7WbRU2rOC3UWmp8HH7dF+8bBjwxS1Rgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148546; c=relaxed/simple;
	bh=7tblKRIEs/wuHiRfiDyfbeKTY0Tq2mICunAPZlfSnAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Go7QKn4THVgTofw0aXW1CRz+vrisxE6DN9btnCX/wS4f0sT3+J6tnuN7Z5UDdOUPSx3T3zdeqpKPV0BGuxAhqnFuctO7Qm4YLjpQofniao35YeQP8tk5GnZ4eyxls+h9mTK9TIggaL8zmtOatXe7t7b/LA4UX4jN/2+7XwuR1kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3c+aPwB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3c+aPwB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so789481f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746148541; x=1746753341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=olGP6orZfNAwJCaA6Lz+3muHKwDTOzLKnHavYSk8xUo=;
        b=e3c+aPwB9MXZSLvJvcpTaFcr3uJiJ0ih5MNsXpsgsrwQWKoSKuVzEM8D/BBvvzvkHP
         /yERUKOhee2Vi6KpV602PlnMWaFVQtsnnyFiKlDrvIhEqDleG8Y+bH3jbBQVNsLsLV7C
         GDVRt08jFSX9Usghl3ILzV/CQ5oqmlvLzIuV3BDHG8US2KmOXt4OBT3KECM9BJDPyofx
         BUdfOECI454a4kOh1kJnCJaWS0f2KaDwRG/p0IfkBDi7sJ0e+mDvFR1yk9ySqhOGSL2f
         gsAi914Eb6koMs/6n2qG61Z0AWgL6eBcOlMrosYC+6JyM0WMhdzUwL+/Z0fIsyy7LR5t
         GjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148541; x=1746753341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olGP6orZfNAwJCaA6Lz+3muHKwDTOzLKnHavYSk8xUo=;
        b=uUXN4qzV1MQsBHQJTR5bEfQ2ddqUwJD/w66vqeKVM5eRxO/c1zHnjRGml7P3NCWVvI
         7Uyy3TXpvitaa0NN65iZece83YwO8kKvorqEeAOn2MiDtXz4ZPuLt/P7yr9ingagXjg/
         eq6McNNDYi1uepI/PezjfoyAzPzyOk44kqjTNaA8kNXs/BtOeu4STHv3dw6Fnv97OLo+
         vGLEt+5OyZHMu/uTh3pH6a/JyY+Ovb5V1y9+Nvxe1Bj/CYm62JiDbyyFpIhdalZALAVs
         Ie0ej5WFeOEWJXwB3RXWtJrlOw8txrI9Mbp5Yg4zNynbvg9Zg1thlIewsuSJ5VzKoR9r
         zKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPIv/GkgdlQvgvlJccok6nYsHO3KM6x8H/gh25XRFQttp/7UZVi5kgDVoVnKNdrcCCXul2wI15DmQrxg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK9E+R5FZpQeWuNAfjLH+rHcG1eoqVbB4eGyubdxnt1Dsm9dcG
	UR+bauoJMzaZOLEhc9lTB7VEJkN1BNCySORp9Q5n0HbCrFhHt4fIrAoh8hXanTYC92hDAUHETXw
	k
X-Gm-Gg: ASbGncsQ3OXEkAuo5ixkZMRs3UHCmaFwKD0aIsGl0YvWNkaKqgmLZmQDgqq2p1/fA8L
	BDJfk6ftp88xxlSMe+sTbIFsBtMilR8uH3KSZrJyPKVNEe8qVPNb6raeJ5cG0ggVRg05C2Hjz6y
	gOHTR9Bck0aKWhZZcyAQz7kLIqf9hkC9nfDWJ53FtiRBCwdERRuj3eqzQa2QRTyGgerpzPUZYEf
	qfRRtchx0ipUO6bxgo+NkTB8DW2xRZ/+oUa+4Avc5APsWseSUsS9kEh/Z6oTQ3taRM2kpRBeOL8
	/sD+/21L2Xn4XCUwSWNbAzuzxGc6ECEk91D2XqAtXYA55Ku49q2Nmckt
X-Google-Smtp-Source: AGHT+IEqYUFmpZ7odHGnJ1BNpmOkYizLtX9vRoQQWqRfk5gA+1X5UK2ITRLVd7eG4aVWuhHCMBNPwQ==
X-Received: by 2002:a5d:5f87:0:b0:3a0:7d64:502 with SMTP id ffacd0b85a97d-3a099ad46famr556036f8f.11.1746148541310;
        Thu, 01 May 2025 18:15:41 -0700 (PDT)
Received: from localhost.localdomain ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b172b3sm660560f8f.90.2025.05.01.18.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:15:40 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srini@kernel.org,
	quic_ekangupt@quicinc.com,
	krzysztof.kozlowski@linaro.org
Subject: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
Date: Fri,  2 May 2025 02:15:39 +0100
Message-ID: <20250502011539.739937-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While at this, also add required memory region for fastrpc.

Tested on sm8750-mtp device with adsprpdcd.

Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641..48ee66125a89 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x800000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			reusable;
+		};
 	};
 
 	smp2p-adsp {
@@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
 						};
 					};
 				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1043 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1044 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1045 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1046 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>,
+							 <&apps_smmu 0x1087 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x1008 0x80>,
+							 <&apps_smmu 0x1048 0x20>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
-- 
2.47.2

