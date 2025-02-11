Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00127214815
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278608; cv=none; b=DsWDTF056sJNsfj2qlAfg31he87MLBGjEDU4oWdRx8Kn7fZ5alK03W5jM8wIuI/WSCe9A9ss+FtNlC4HgswRQV9GIRB5Xd6YtW05YDM89xFiU/SHCN3tp/ws6CQKaxaHB67Q/s52LtWzRvZmIRjsT+byYT65RlkD1+eUJq89XzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278608; c=relaxed/simple;
	bh=d+GjSlfsiPtSREFcW4TugBdSP8ZalkWtqO1Bjmm9SpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u92rpK+L3xtV7TFJI6WwSGlTz8A2qNGrTeVNjIRhGzbB1pkTCbJRk6ihghup7J+64sysJPvoYlx0R/tDhlWdEOXgSoFqudY8oKxoBqHJayg/lHh2Xfj1ElTLfgc9sknxnyIV+SakRT0xC9lYZL48Te9O5RQ9TbbX2qPObQbFUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IyAhij7R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IyAhij7R"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dc8b5bb0bso2467854f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739278604; x=1739883404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoASWxQXtVgWCHaFayYEr/E5Q8fw3DlK8oqmIqWCzcE=;
        b=IyAhij7Riz2cQxDQ82sq/X6sK7sreKDJi/3tYF2HMT32L0U/FsCOiB7Zd0LsPADo1Q
         YMquauMRnccSDzHqqsD/Tp65rNMBnIoQN0dxW4naeLurwK+llzZ1hp4kc6Zps/G4QBAC
         sXon9FKOZVJ251AG0gjdHNUgLFGeS9JIwxU8bXrRQtWDYQqpbwSToopmpYPshAxPpvlS
         0yzsOxQbYeibdFiQhOt2yIQ0Jo59kh7FlKMQjKtYgqxrfmXytce8e6k2PldHwzcFb6qT
         LWHsYGDGaBehgtHP/Zn37EF725zf1Rf+CMtjDYT6bvSWyvNSScpd67St0ts/OU3gQt2B
         Wh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278604; x=1739883404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoASWxQXtVgWCHaFayYEr/E5Q8fw3DlK8oqmIqWCzcE=;
        b=wP4XNWqSlLU2vwrxo9j3KHPsSDjuAuUC3jbQoXoqoUQPjYptiehaK+pf7Sacrk4k83
         jJr5BbqtKdaIrGDdHQ0/PuBxAzvnFhisSCsnTcmWQakYMeJwLaZ8Z/gWyEGXJ4XZ0rA9
         Il+1kGZrdX1kxor9qIUS7CX3GtJDEo4qbN9whiQ/xorRckaXdd15BW/2pyunZAcKkB8b
         ffHGEXD7Zd8dcmwDjofp4qj1VZ30zxPspBGleXi//0PpK+giTfy6ZZNAKecxLBPwCD33
         mz80yHFYno9cqT0bI3XsHFZYvcY1zIrESj3Jz4QOMvJRvkx3JliuqxU+t+O+bzy21Q/m
         Iq8A==
X-Forwarded-Encrypted: i=1; AJvYcCV3fEjL0fQkoi4JcfDs1OHm5GmHYM83rcLPBK2Fbv3Bca9gRhrNxVSzqu6eKylkoysWHTRkrz7k33X7B0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4LckZtZBw3J5LI93xVYtdDboZFtLEfkwtEhUjATLT1W7vgTw
	B3H401xL1OYFoPqf5GxjyJIvGCfLYLAAEsfTFKIFPy7KjyohwFPbtM0RDbEzvtA=
X-Gm-Gg: ASbGncvv9HB5uic1deeXjke7JJ6SFr5VZfAGWH7yD3aZ1d2N+WVHw9yjp/SbC1sbitL
	3pnddSkU/ihxStG5EJ78XBt+43+gZE5kU80vFbjGYL0QsirMW936OglTMUDe5ssRXpkMsKTt6e4
	VFhGWRJw4IZ6llZvpSHyIIaZRVlIx/olX8MRkVHjhuwaW70NuPq/RJMht6HElA1oD3gRhjstZQs
	/IIbj3+gQHTmMVfB3yHXrjlhzmlLU66VqmpD0QhaVdyuJYcYkxvwubOepmmu9zjL+QYA7pcJ47Y
	eQgBvNWmhJ6fvQbQqhSzULIBiBxpCAuqCE2x
X-Google-Smtp-Source: AGHT+IE7QsdzhZcPw6zibNK5UvGLFSYMv3UerAe3R8f0T0a8G9H3YZ9WijThZ1hoipc3YOPnigfRkw==
X-Received: by 2002:a5d:5887:0:b0:38d:e2ab:1969 with SMTP id ffacd0b85a97d-38de2ab1b35mr4273490f8f.14.1739278604210;
        Tue, 11 Feb 2025 04:56:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc73c2e00sm12863078f8f.57.2025.02.11.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:56:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 11 Feb 2025 13:56:38 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8650: add cpu interconnect
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-topic-sm8650-ddr-bw-scaling-v2-2-a0c950540e68@linaro.org>
References: <20250211-topic-sm8650-ddr-bw-scaling-v2-0-a0c950540e68@linaro.org>
In-Reply-To: <20250211-topic-sm8650-ddr-bw-scaling-v2-0-a0c950540e68@linaro.org>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4643;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=d+GjSlfsiPtSREFcW4TugBdSP8ZalkWtqO1Bjmm9SpI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnq0kIAYN9Xlykt4Y45YFKgX/+5nZVVCbhCPkiJyUx
 xHVpzMSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6tJCAAKCRB33NvayMhJ0apTD/
 9HqK1MA5nLUfJRodntaIBfcxfz3Ii0gqCd/9fo49UJ2UHJsU+MT6dnV3zrgIVz1IZO0v/5PCqd7kw0
 swow99cgFATZ3P5IDBi8nyl4nI7yup1NvcvjMNtRChGs0XEEO1eMU8a5mNthDEcbxQfRnNwyoHSLfq
 sZtvbfi8ieKzZ6ltfzI+MoUkuzIFFjS+DZir10gxW50AViONUj/M3JtP2TXufBc9VfvGx7/yFpqPsD
 XTDJRpuvWe3AsiMuEo066EGGJhe8t5+RUbwBAcETgmfyPWm/j5qDw2q0HCiUqJIetG622DGV/Nr2BF
 mFd8ZEb3OoFbCbtMc3di4SNPDeTS+vyp1csdSiSIZOtyfxHVSwcRlHqk7HyVdWr2tN+et32mXVWYD+
 G7sE3xM6wrLJ29PXEpLxK2iZR9lEgEqtCfyazIoXoSDN28YbUAkPAx5aLQuW1NpIjVFcDscID5K8IP
 frSZ3HRN2NGPZM6NdU8dBY9PGaEhzKsl+h0TO11ne+9l3HWTGEai4oRFTRv+ezMhWTaHbeSG8b7zwt
 NYgA4W+kIt+V41T6xYRSXa18Cz5fn33uFKntuimKS2I1uJmfvvLKQ2TH2b1AEvg1xImqpzFqi7Lbuo
 etLf2AUxOTc3XoEV7mN2nnB5jcpnYkwdpQHeMBhio+AGUC3oEW4FliWIV7Bw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the interconnect entry for each cpu, with 3 different paths:
- CPU to Last Level Cache Controller (LLCC)
- Last Level Cache Controller (LLCC) to DDR
- L3 Cache from CPU to DDR interface

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index bc09e879c1440873a52daf3fc7a38f451f1f972c..e194a95cdcc0f0f692e62b942331cd9e07a4eae0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -85,6 +86,13 @@ cpu0: cpu@0 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
@@ -118,6 +126,13 @@ cpu1: cpu@100 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 		};
 
@@ -138,6 +153,13 @@ cpu2: cpu@200 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_200: l2-cache {
@@ -165,6 +187,13 @@ cpu3: cpu@300 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 		};
 
@@ -185,6 +214,13 @@ cpu4: cpu@400 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_400: l2-cache {
@@ -212,6 +248,13 @@ cpu5: cpu@500 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_500: l2-cache {
@@ -239,6 +282,13 @@ cpu6: cpu@600 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_600: l2-cache {
@@ -266,6 +316,13 @@ cpu7: cpu@700 {
 
 			qcom,freq-domain = <&cpufreq_hw 2>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_700: l2-cache {

-- 
2.34.1

