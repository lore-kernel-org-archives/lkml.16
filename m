Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7853D1AA1E8
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746359514; cv=none; b=HVUPw5QfcAQ3tkpJyb3J0Fm2ANZUcji/TNoDX+t/QhmOfjTHiiXljzyXaekN6dkiuyJK16cUp8FD4eZ8qziTuQs+npOgsXSS4qHyahkU3zRDAw55PI/512Ibx9sjhKZR6uX85PGyKCr5tF3ExtqW0d2Idfa+mMxT/yhaHRH1dD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746359514; c=relaxed/simple;
	bh=ec3OM3Kdbx+cIeMn0G6xXZ2/2B48E1XHg7GD28jg4ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgo3SHjHo2K/MBBBQTP9HJEhzsKCwwFjXPsAknGIe1nhzWW6Ycfhmgdx4p9/OjCR2IRWX42FjUDcT/JpkBiflX3TkBErtXtogt44emzC7oNajlXJ0npLYY29zkobm/uNOvKSpAxzvUXxGbjr2dP/RnNatuJP1emmHDexhiqctE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=g4cXB4qO; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="g4cXB4qO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746359510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8BoJqr4TlJkVA67oKebDqGrsk1Uxh1QUJDUSIH1Ng8=;
	b=g4cXB4qOLGIcoyOwXBuWU8Ccl5DTAJBB6iZ+2qqJk78ayOX+uyKDShEnwEzK28tusaDkUK
	A/M0IJ3gFrQGtE3X/sZley/YPsV4DUz6CddMqQ4LVTMLtnCOxKq3dv8FXYJ8K60EkT0GWv
	vYtdkZ+0tbs92YfoIHI77c5KmdLjzk9fpOlK9+9qhbxom9q4Rmi6JviD7b0nVI6cXf35YL
	Xr8Z3p99aKjG1ztwR8cfFzFzeGwxo0DVdjXQcRtbFBZ8OOMj7qtmfBho0/koRsfSs0Mrjs
	lsEMUPomtuyUx3r+TaNepD9Mtne2kF4nzHd3FeXDgyIvPuTH8agb5G7fwWh2xw==
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
Subject: [PATCH 1/3] arm64: dts: qcom: sdm630: Add modem metadata mem
Date: Sun,  4 May 2025 14:51:18 +0300
Message-ID: <20250504115120.1432282-2-alexeymin@postmarketos.org>
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

Similarly to MSM8998, add and use modem metadata memory region.
This does not seemingly affect device functionality. But it fixes
DTBs check warning:

 remoteproc@4080000: memory-region: [[45], [46]] is too short

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 2d3820536ddf4..8b1a45a4e56ed 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -509,6 +509,12 @@ zap_shader_region: gpu@fed00000 {
 			reg = <0x0 0xfed00000 0x0 0xa00000>;
 			no-map;
 		};
+
+		mdata_mem: mpss-metadata {
+			alloc-ranges = <0x0 0xa0000000 0x0 0x20000000>;
+			size = <0x0 0x4000>;
+			no-map;
+		};
 	};
 
 	smem: smem {
@@ -1056,7 +1062,7 @@ remoteproc_mss: remoteproc@4080000 {
 					<&rpmpd SDM660_VDDMX>;
 			power-domain-names = "cx", "mx";
 
-			memory-region = <&mba_region>, <&mpss_region>;
+			memory-region = <&mba_region>, <&mpss_region>, <&mdata_mem>;
 
 			status = "disabled";
 
-- 
2.49.0

