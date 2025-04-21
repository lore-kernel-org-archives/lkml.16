Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB0221F28
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272847; cv=none; b=XRY8IvJBmD6icmOJKuS8YcNE46oyrlac34Qq6ebOaS9QBpTTfzEKfXcxLD5u6LLvPIuUDjcLmbEMoZ/3JWoWakvaA6Lxysq9V2RCERKVNXKeK4QxRZkhNYV9fC3GF+IhhFLz6+qgfGbJI9kaI5jZsSQsPTE2wNFAladvK+FrE5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272847; c=relaxed/simple;
	bh=/pdn7VV26vHsdyRwPkDqqfr5a2aFBupKx6kIrHY3wNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXR+z7wSb7j5vUYr5wX4Q6zpXeTW2LO18fN+TggW6TiUzzRwMs6DV41xeqWnxFTxvTLpcqrBkDn3etvrHevR2rT+Lgp4Qaw7ZFUl18Eis9PYlzXtkFeIkUzcvh8qKBIaHpTp8AX7BbDC36iP6RWE8RNTjOLtQiPowdlzvzSTH4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6WRdDE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6WRdDE7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK4IIB009989
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uazp880WP4oSz5grWMsfUwvLFejN9KQ7Ij/wBd9lOUk=; b=L6WRdDE7droB3o9E
	B04i06qODKi7BaJnrV5JDgmzyap7qPuQpEledEvraihkC4zlBRCKs8FY5w1OSveE
	VxIh27XA0rRHsCENI8FTGCeNxi2gRIsWhoOCIS+cFgl0TGXvRomDcQalPnbvivEJ
	cCUTxbFKaMmoOd2N7UHBtc/5a8d6/0b+hKsV5InABEigbyb+mRL/hYxfUI8tt86S
	MuzTQawzDnGrZVN9zwmP7O2uZrwP8GUEJ3NlT0xmcGmeBJq7TWtkS19z0FJ2+7Rt
	f65X3v+bN/ElDmRcYy0V0AyvdrEc6DK5P+LO2ZgtHOm1/os+Arj52zwyYTufFPCA
	VeVZ1Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464478wdvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739764217ecso3867510b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272831; x=1745877631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uazp880WP4oSz5grWMsfUwvLFejN9KQ7Ij/wBd9lOUk=;
        b=WMIyjCiwOmPhRNUDLj/RVSxeGbOez8zZOQupmFCj5M0AoZnT9pvCYj27fZ3fCA9jI1
         Mt1EBVjOq7CcrXg8Fy+kuPFn/95lhZyz1+dBZb8PB83JOx9DCiWu751lL80aE5K/GDJR
         Z6EzZPhG31Z90PMd6o28sw6c4kUiQJxZnAbJdElQK+8evjxzCfbT+oXXYlfy5AXwIx6a
         6JVmqW0J1J6KsVJlaFrPsm9t8KlFLNXX+xJgLraYwXtt+xlmeOBmh9ulN3eP2mr+JJBC
         iBiPEhaseoaVyrFS98AYqYG4zY48XE3NN9B3LNQinr9OXXV21eG6HnoxrNRAW/5BD1cr
         7fLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47Gp7wTADQwc3XNqOBqvvdjfUSKOvpQ0z0kDmN6hVkbXznKStzW8glDFGzXxFDvuRo0vYtw6kF9X/UNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2uLafVdESJ1j3lW7ivyhkZX1gAcU8PXjT4ELQehZ/6qwfpjWp
	nUSqUOwSCXg/fhX/wPhO9Mt4Mb7ooM5iiA2xC/dxTeJu+M3p/MttSwXYFX3hGvHob8W2fVv7YVw
	N87+/JTyaepf4+h1APkFDEukDsmK6R8/fRTLDjvjq0xiC078dtaLaR7gTHHeBDCc=
X-Gm-Gg: ASbGnctKh9UdWlKClxtqxdm/RSC1vw4hlhiv1aDmtattnb07Z5V4YbkWDf4cDq22Fst
	86daFYe5jG2gU7WiqXJJ+S8cG/+Gyt0BjXKaNh1uy2YY6331zRv/TPcvbGByiJSQ59r0HRA/Qmo
	879MgYaF9wxnJDP/8qmKp8MJpHdwOc/lIrPeVXGLx16Bu4ZtkH4XUPUSIpzyBQgph9SPFF5ZxrO
	EOIryuqf2e1iFnokGGeSCT7auSu0N3ANfhyDL3UfrhlNjh0NoZlLsBVkM58Yf0jHoSNNLBAjR/y
	KZBQpaQKC3GKSOXFj5Cfpo0fQuOGMdqm
X-Received: by 2002:a05:6a00:3a0b:b0:736:b400:b58f with SMTP id d2e1a72fcca58-73dbe33a010mr20742287b3a.0.1745272831512;
        Mon, 21 Apr 2025 15:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd2JaFZ5xayiBayYrxFjaq77QJEeo7B+ROQTO4klSPnHDNhSnBxzHPeGDowAOPB7q2goChHg==
X-Received: by 2002:a05:6a00:3a0b:b0:736:b400:b58f with SMTP id d2e1a72fcca58-73dbe33a010mr20742217b3a.0.1745272830983;
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:10 -0700
Subject: [PATCH v5 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-3-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1135;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=/pdn7VV26vHsdyRwPkDqqfr5a2aFBupKx6kIrHY3wNI=;
 b=OAqbWj2tMbT4LgbPTEZ+OhAfWcf4RBdXsny37UizI+Wabc/Oo8AxHA53vPNaePdUIDjUrBa7P
 7DF7jHYD2JyAUiE6QUvCqENTZL2NqByI0QPi/nizK8adtYPYXfTumae
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: 1dEho9XmDg09H4ZjnYYV7QGsSC-ezCnu
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=6806c00a cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Y21Hm-oE12uJT_c86xsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 1dEho9XmDg09H4ZjnYYV7QGsSC-ezCnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=475 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210173

SM8750 does not require an XO clock in the dt as it is the
parent of the TCSR refclk_src, so move the compatible to a section
where the XO clock is not required.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a681208616f3a260086cff5a28dc23d35bd96f9a..ccf4f505913b0eea12e7cd58958b43013451f46f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -216,6 +216,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -355,7 +356,6 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
-              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:

-- 
2.48.1

