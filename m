Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF426FA67
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648072; cv=none; b=iCaa2ycTxXrDb3Su23w4kUlpPeHkIBXDr6P/UvA7ZnCX/1/qXwrrxMDKFgAgSzvNVGghlhh4hiB5h/WOfV97gg1dactiP2PFJOOwMOrtb9J0eKE4h0ht0RwMpU05SY2MyyzyuQYVWJxRcxwY+X7vfRtstw67hqJ/Rz9H4oTTmHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648072; c=relaxed/simple;
	bh=bTMRlUg8gGDU4gh+pkb3AegCsq7QQeq9LoiypQRoc/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ocP2RX8vhzXBoF8jnLr/ZcNQDZh+lWRBRKL8pWdLA7PMVG3yJ1r3AtweQl3jRUSfqrox/TIYqVsfHTFzt/eRLVx8Rw5VWkFL8xnPK7zhzo1D7mJDso2sGoog6o7pS4OM8qJCa1blxJOoqYglihmNQRiwBg7yXZuNLReEoGtrrJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEaZjUp1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEaZjUp1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9SLiw014157
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5wZN4QwiiDh7CZQZWtWHLOO5pZhg4NU9nBM
	vPrkxGUI=; b=IEaZjUp11f6tzylWGMQ+CB7zq8oh3q23XSz3NifgkMa7ohIrU75
	BuTEnNdxUCW8uVIf1lXMtAXH1MUKYO/uaoux3h/pE4rBuxi7PXJTTg1/VHxHXf8x
	T9XPh8dZFg+oNMaCi07whmJAAUePGDfpmazQaPdbCARRHrIUY4+Afj9jkeweEv+D
	u9/JJHkLXh47jlkttgGA3/d3YM8flwRykrOVle6MKzAghDk5f+OTH8nkw2GnQ4i/
	yhNYUlEZtVEZmpoxmc9/e6cQuwTPHYe1P1h/YZ+HIkF9KM6HycWQ1AAtX08kQKbK
	FBG+QOiSwsSsVekxcnsbNAUF+4KIFTIu95g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4uwh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:47:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8d0c8e917so9732156d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648068; x=1748252868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wZN4QwiiDh7CZQZWtWHLOO5pZhg4NU9nBMvPrkxGUI=;
        b=Aey03MMIEvbXs1YSoXocz5pwWCaBI2mTWuMB+ahEwX4LuCQrHs/2zOX6h4sE7xcju4
         6SuST58ZeGV2OVcfp02KYMJK2aeeUqhk7AcIv2uuYS+CxxxG+UVGtFTZIQ9cul8GDEH/
         k6R1eGxSaPlA2raD1l96BRy/n/DMlcaP2RA+3IYRl6Am0pJBmQq8slqaaCnkkkWnyHwj
         H5tlmAEOVX3Z1LqF3t1k6oG/vp4fVlmKSpEF6+PnVDwquyKNbOryWceyc9kpt1mFqxnJ
         ow4j+JuKyklrynAnyDfBiJzBGrlx0boHuX0+wrHHN9+VZwzTp3RIsS0anF9aV9WsItE5
         38Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUJSJTNn8kVE50kieawKkCmGK/KrdWRQDSh0lL7DIxeZ1aw9sAO8GQQe3O7UoxCvJQ4ZwHBI9P5QESw0gY=@vger.kernel.org
X-Gm-Message-State: AOJu0YywC+nbUOdxcbTlveFO8OSHxqmGBfY8b2i4sr1atSWpnUhwRG/U
	BrXNP7qBLX/BHfwKT/1hlPcJUdvKUGJalG2dUiPrvKtMKPLP9n0bHmI28kjV4/MbT3RJeVtCbgU
	iEdfbec9rYM5BxE2RfvrwmlD/8QJfLaW/wHFfCm/UCqqDPHEh1ZuCU5xLhz1trjC55p8=
X-Gm-Gg: ASbGncu9mZFXgtNW5gCQXEk4FeX49fYAeJA9+D/GPU2tMuZE4KezDTiIqz2+nfHZL9f
	7B07lnog+ZsHFmsC4/163wODO+UrUkMfAnQdQUk3ddTYE/q7UhpCSt80oDddjEe6cpBDk6aelsp
	eQ4N/0KQeV5X0TOHYwAHEc+pNiQyghXwz9z2lIARKb+2HywQ5yuL6CWiBE6CfK7Wl8UHnjI9BNy
	k5elTeZA0rK2AnhsRsD/0dqzAUK3rqIEuoRGNnkc6x0Lw5CV7L+3Nm8epG+10crdEbiRNHT4hh9
	uTcGYweuPMmRI8qDF3Z2C3BAEnnNpROomd/iLKbgCjjP9wI=
X-Received: by 2002:a05:6214:528b:b0:6f8:c23c:5278 with SMTP id 6a1803df08f44-6f8c23c8524mr138859286d6.12.1747648068384;
        Mon, 19 May 2025 02:47:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNDW7YAAg+IYbOh6WTNXEz8eXGB3AYdSOPplc6+3gHrYcspZExavw8no8LzsHgeCqcfXMRQ==
X-Received: by 2002:a05:6214:528b:b0:6f8:c23c:5278 with SMTP id 6a1803df08f44-6f8c23c8524mr138859036d6.12.1747648067830;
        Mon, 19 May 2025 02:47:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e5bc:5c94:e4b3:3c4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498d05sm572185166b.149.2025.05.19.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:47:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: rfoss@kernel.org, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Mon, 19 May 2025 11:47:44 +0200
Message-Id: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682afe45 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NlPZ1nVzr820ScHG1asA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nRUhya6vOupIlecdelMlGNaLW-TJ0rxY
X-Proofpoint-GUID: nRUhya6vOupIlecdelMlGNaLW-TJ0rxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MiBTYWx0ZWRfX+HGgOZjhr2Zy
 KxD23e7oDWUk5p6JymsXCmK2jOny/18kcc1NrCM0k1W73rwj1t+ZWLK6ihq0DbDsVqrusC/smPB
 9rRblvnXQ5b+U0eJvr+8N2txDYotoFrqtdWmwzsCZ6gLDPCIsFcF/taKThW1Fa77jRa+QedFoLx
 0nOIgKspg9eKerdditz+5/o6twD6V3xM3hPeksEfeo8qn+5jBk3GckcH2TAynJRdun/cjG8bXqy
 gYAG1FF3GqHN3ZHEE85iltfJCCLkQ+7rHbkmtavXjSwJYyyLZoe/2yMq8rrtYVchfDv0iwBzf5n
 NVo+ohShUw11IH4vlGNvduOse4EVc16KpsAxeNcNhx3bUe86wtwX98H6PJghngbTh5SOlnz4Usv
 qlwmuaK3rMFjciLJlSVER6Phort4YBvWiB6rBAuQRktvG8eQdxE/nOxkrmD6WisZwax+z3C9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190092

The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
It requires only two clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 v2: Reorder commits and Fix binding testing syntax
 v3: Add clocks minItems for msm8974 as top-level minItems changed
 v4: change AHB clock name from camss_top_ahb to ahb
 v5: No change; Resent with missing recipients

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..83b13370ff6c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -44,11 +45,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   interrupts:
@@ -113,6 +114,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -120,6 +122,22 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.34.1

