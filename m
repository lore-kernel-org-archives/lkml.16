Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB80E265CCA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102209; cv=none; b=N0WLqVRhU4pBqHkw5dYwQRpdLDuiBijy41iMQ4phYDEHIxrgfMTJuA08wvJd02xCDZJ8Y2DJb+DO9jo6EJE5uwQkE1EDNxsW0t/aHzfidoalbqNUhigg/sIo3cbO/eebAONFGCn8A/i9mFyxAMwXuBWQ/pqnOtiOyY1I6VINBAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102209; c=relaxed/simple;
	bh=Yawf0GxWstkt3RpP4+pzFnNl4jf0NXexGE58yTNmCj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osODg0E7guc9yy5gP6s7/lFcjqepSWA+2p6UVdxgkq+hUgACi4jdnz34vVHHQ+QIOA5f+YnrRjV4CXx1pGG6xndTKX4/DYoPwAhwXYeKDhFhaasiRJDEltKeJ1+pA5xSIwUchAQEPDVp37gmd7FnrbEm/6n+1DRiFMxgvsC5huQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kutGx/yK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kutGx/yK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GNNT014995
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q47arDcgQykw9X0fgNGTxtfQg6akjxMwJ/SPAEnCyCc=; b=kutGx/yKbggNJQeG
	WuAhf7Mw3vhhfb9LiQqVIqVhUFgokqtSfW/LhB8UX1U9jF5jJmHd6dvES14O18aw
	AqGPjh4M5N97Gr534lXDovRL8NISc6hbQz1qGAmwBBHqZMKQidjWlRnAFFRANeeO
	ApypCZuPrVg2AYe2TE/b01+RhGmbalwJy4BghoUddbDvDNVlGf7NgLx+f7mnVZxA
	4OiJM1kcvrpVFrITU23jQLNEx67j67RGgGWEiucC2tdFNDGGJzAu6dKWEJkyPaPP
	PtPUXGtr+HPFWWjq0+PVU128BBETGoptV0bqI+ZH8LCoxbhoiiHAG2SGBpilKsVo
	3aSNMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuf4rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:50:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff6167e9ccso6938055a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102206; x=1744707006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q47arDcgQykw9X0fgNGTxtfQg6akjxMwJ/SPAEnCyCc=;
        b=Dm90UTN/Qjdw9V3heV7aNzUFL/w6Bgrr3m1wo45IiCaOPJcj3e75t1Z2mjHAk7WHTa
         FBtPP3gvs9qnkIyHZ2oDYPGIo6XAwXiccPWv+WmyjcWCVNnKLCPLOzKid7jaxKkfbx0U
         qXS6N83v54jFTC81BHP7nYQESw8IURzu2Yfu1GvA9U9akZJzbJlLYbPq57Kx8im2OpxB
         /xFi5Pz/Td6j4haDRWOhpD/HtqrW+HrfKYJv0fGCis266VDMMS+7uVrNxu4NhcrHd+nr
         +f7dmsIjTRFq//m5m1fD8TPV58GDG3wg1bo373OYEA5Xb7+xCM50OnEbv9y+7Jg+2dKO
         fLvg==
X-Forwarded-Encrypted: i=1; AJvYcCXrLwIctCk+uA4EvTR0cTIQvw920sUknUDIJ+Sjlo+0zhZIbPclyIqSWsnfx/W9na+l2WBD1EEjOokVCxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWyWNTbW7I5hSoDHgyBFQc+vO0Oq7W/CEMUNL1V2bvfnud0xa
	0iIKdYuuip8OsfE/QHiYfskd8Rw7F2dW786jmjVOpXNctp4BZ96S3RDwsUmV6zEHwSBQ3WH5BRX
	2/Kx9AMOZedjPrLA7z9HyA8J8ZrtsYC9OWtxr49MHHJhQDz3ECIDSsg+ZxjSPGRhmXTeZv00=
X-Gm-Gg: ASbGncv65PMVCZqWT5gAnvsSaMrP7yVeAZ5oGbP44Qz70WAz/cPsDXGSoXP4IxiBWVv
	5mStIQLspnNM93swZ/IVDm0fdRVauhJ7TYcOVaTOVOZoUGfiNCtstvW6VSuFeulYBU4bQniIdpX
	BiLGApjDE5zOYh6wt1ZFfo7ofwDhThcRR3SCIM2IHnym+9QJfgAWAubERMcLtKzIR6Y9Ne1ycoR
	Bg9FIw+RBo2OLqqQ34xFWJGAUtiY5/0O/e9GvWQMF+3dWbGCK2XSyfBTnMuwTwZ2hs+lvBBRmPp
	Oq9HctNStJFrwC42UC0ar5uuekWhwclCYH2hVqwYWvad670LF4C2UF2DtDCnM3mCREl/RY+AdUJ
	cxeXOklS/6DcL8WOqPqiWxOTWZ6kx+3vrgECs6RKo76MyKel1Gnk=
X-Received: by 2002:a17:90b:6c7:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-306a62664cfmr17327927a91.23.1744102205676;
        Tue, 08 Apr 2025 01:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7DH7NvrU8wKbJuF8yH1TuTvQSsT4oQgoNTmptJ7MMjVhu3ISVAbO0QfF9w4AUCG7qUA/JKw==
X-Received: by 2002:a17:90b:6c7:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-306a62664cfmr17327891a91.23.1744102205331;
        Tue, 08 Apr 2025 01:50:05 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:04 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:51 +0530
Subject: [PATCH RFC 1/6] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-1-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=810;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Yawf0GxWstkt3RpP4+pzFnNl4jf0NXexGE58yTNmCj0=;
 b=JWJb4uqlg8iaJcsGYGBQncP/6c8Ml6a1AITVQdLVCNKbipPyQXyr70nJk/5+5RK3LNsLMhDaN
 1HPrcWroCEvBjrprptW2FfsUOBBFXvjmawZFgLN8vdinBYi+WA523Eo
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: W7pd8EiGtGmLNWEjB2qJlRWTIi0YHDwn
X-Proofpoint-ORIG-GUID: W7pd8EiGtGmLNWEjB2qJlRWTIi0YHDwn
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f4e33e cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=851 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080062

Add compatible for Qualcomm's IPQ5424 IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..dec1b1ee924cf1386f559eb262ea864f2788c165 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1

