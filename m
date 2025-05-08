Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702C22D7BA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712016; cv=none; b=C1ZBktziPod4IS+ZgAnOrJZTTvKH8CxrBA0hpTonlMrLx/34juMiIP1a3tb3zLZG5aV6YWhObckb+YrnHQ/nS2A1yvZ2RXHcj+m+gyUfClRdQM9Z155IwNtmv/C5EcJxe3Gg2eLy7+NiMvWmvxUTjpWSCoU8Y/UiIEKmSH8s9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712016; c=relaxed/simple;
	bh=00UIv3EZjfp+e19Qr1XiCLjcZ87sY1P79LJK46Z757o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mdQDdryOE+wLJYgyR4rPdY7sMoilF0+n8KvBlYR3rvJt5hfq8JlDl+66CQpHBts0ynhtowhfPvysLFzw/dHe99GfwJy//1goK3ML0BwgFyDTFq6O1q6sSa3Hvbamyxh9NaffvCDSyqVUoVymsc+XZbkHg7wAaWPigVnHRkeK4Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwVQMrkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwVQMrkK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DE8HB014014
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ria+LRyG0hX
	Dtj4N4iCruKkzRBUm5VLACf/+IbNd4TY=; b=BwVQMrkKiNsph28DX9QKzvUrspU
	/ZTJziXwCwQXhtbweglQ5xcPgl4vFRG6vXOpIlFy0HosBmw7NcsSYpIeEPbwejCG
	f12f2W3rT+kAdFt9xBkhBKFyzZCz3O77VDUyrY4KFIEwvv42j9xu83TPYueFnaSv
	UAozKH/R6XQ7eOCqut3tLNGuxKQ8vjOZV8uA0QtawpAPPZLo2Iy54TU87qx7xZyK
	FUnL9R2wRoihLmqaUyGPAKDezT1ERa4SX6AcibplTXzbBK7DAtEJnk5rzWL3R9oU
	vPjb96hLXj9Sw0H1IhMz7SVH17oUSV7kPyE1kBBYbhemaum6Dqp9u26bAsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4hgsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:46:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e3abea7e8so13645185ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712012; x=1747316812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ria+LRyG0hXDtj4N4iCruKkzRBUm5VLACf/+IbNd4TY=;
        b=HgSs2ky0RgQcN4UC1hjsUx8v6V4it4eyjopxyj4bffo4ULAW/fzwh1TX8GcwnXoaAS
         rdBL9ZLWpsPXEB1M+0hmVPKUZE3bgLPyulw+FHbHMT90dedvYOyixE3Boz8mGl+pR3DX
         38TL4QMBFUVfRTcx+qbXkZDW2vLajAguVyorOXVRibR2In04tqdR2s0aJd09tke/FVjK
         bAWEZC4xIVzl5bUhrGh4+Vh9jBS98K7WbNz7SsVN590BGNrrc29hJWRHW2dWcZjGGAqC
         jxxImq0t1vdDJma5GTEI3EIAaNAIZSP7su+XA9Tm4PSWcbJxkL8yUoUSpuFLls56dgE4
         feAA==
X-Forwarded-Encrypted: i=1; AJvYcCX0fDJYh+YladoU3RCiplYu4xoYDYNmt8xXedXpG6rlvqqwODc3y0rPZNzvQchv0sfEMP/cxohsP4l+AqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoLjkdXDoxZ9iWKjdBrbywb+SpZ2kkBxpnvjYELjo3WhEAkUA7
	0XWcvwnnukalAxMj0ufBHCfZjW23eSbzaIseQOruKkbXR14G8MBtrNHasNUvbTJmjMcxCVuBE+c
	jLUtJQOz4OR3JcaHOAd05EupsTecV7kjaabTuXWx85M4HpyuuSnv2D757TYXF92w=
X-Gm-Gg: ASbGncuoc/hOvLAfKFQ6uejh+9fR2ah4xg6UwJW+M84cwrRRcvWywk2DLINHTfGm6SR
	V0Q139cD9XFnV84fJ/PeqwvYC7Y/E+pP6kyVfivdwNO8mhUXBpjbkVQjMEYdZ8hSqUNNoT3/ssx
	FypVC81BzjMJlcXogjImBwK2g2AEKzvzNq2jj2eSBYqNIhY6Zjf/tfSh72rhm1aFsmET5u2UiKA
	NCZTzh2H/W8BBwTQ654d1F30xEPFBBaghBEXXbxSraIWDIwEmCRHPrfuVQitLsaTgT/IRx8e0kZ
	o8kReKp5u3HYMZBhNoGZeg4h+AACuQA9Kt8iJic=
X-Received: by 2002:a17:902:e890:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22e8560d03cmr40451155ad.6.1746712011970;
        Thu, 08 May 2025 06:46:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrRn+7wTjv8yheir8mwT9EEJRVfj2QZD+8KvMvdxJ/YMsQjewJtkW+KGPFMQztegPOr48xCg==
X-Received: by 2002:a17:902:e890:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22e8560d03cmr40450845ad.6.1746712011622;
        Thu, 08 May 2025 06:46:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eb56dsm112250715ad.23.2025.05.08.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:46:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: arm: qcom,ids: add SoC ID for SM8750
Date: Thu,  8 May 2025 19:16:35 +0530
Message-Id: <20250508134635.1627031-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GqmXmROxS_MrfR6eh2_NgXnWNb3LoteN
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681cb5cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nBpc0M3TKDbq6_S52-cA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExNyBTYWx0ZWRfX8w4QIvPVyTb2
 LUuzSZjtmk4CMCYTUTrT1RvZxUshpKKyBQBA4PhJVrLSZWQSDJdzp4jqZidSiXK9/hUU0NWKMNn
 U2M66wUmPIs3CAJoi7V2/R5dI7srzUKFTYcWlP5vwm05lwqeURpyW/Ltw2xs2EZnDpFxEqcGZR9
 NQOoqeS+8Lib0npBafme1cuyMQpfO9ySs6IlA7D/QO0aFwoWdy2Cy1O9E3bTi3o+7vINAtiNi2/
 dOnss2HdPPBQOiHOfrs1vOImsBzxvLZi2Rsj7D7VGJ9aE6bWSXBNr5CZmL6yaAh8WviOaoMTd78
 vAPjfhj4GMlhQS4F4Yzl3k716N3crGbcs6/NCDArDExMKkVPJgkJby1FrfuX30jrScf7/naFPR4
 U7vi0GkisIy9dpr8nwzzSaUaB9kY0BGaAxt+ScOWu1imeEcX8Zp9lSOFxqHTkbJbJr/7U3YP
X-Proofpoint-ORIG-GUID: GqmXmROxS_MrfR6eh2_NgXnWNb3LoteN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=950
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080117

Add the unique ID for Qualcomm SM8750 SoC.
This value is used to differentiate the SoC across qcom targets.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Fixed the checkpatch warning.

 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1b3e0176dcb7..897b8135dc12 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -277,6 +277,7 @@
 #define QCOM_ID_IPQ5302			595
 #define QCOM_ID_QCS8550			603
 #define QCOM_ID_QCM8550			604
+#define QCOM_ID_SM8750			618
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
-- 
2.34.1

