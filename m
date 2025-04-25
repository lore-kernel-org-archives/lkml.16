Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99621578D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603237; cv=none; b=QJQ1dpeJ8DKR4RTMDRDMfPXCkZwgZSOROuu9t+1h/J1VC3stoevWccda+4cRngfsq58nhPFjOnYgGPTwDJQqI6dAVGLrucMQlD93wj9hJxnjmZ5VN5yVVeF+QBqKt1pq2VDWYAPbATJIAfbvW9Ks64O5w2gEl+MIdjGGIAjfIQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603237; c=relaxed/simple;
	bh=j8aNBL78dlGDp6ubghqzb5EpCs19vQB7AjDT5wAScrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkcHaMHiTSgs9sKWB5qUAFxNtCD+QnOwmDfdlx5CzdZkMzpYJpEATI3mI1MqyBt2qgVIYmSOFb2tb+V1nGa/oH35RWtg7I67AWLURFCqSLH/UdPgKIXuzw6nSLQKrectYmzKmIMxNZiUzh2H6Gt7AyVL/iOD6u9mvcM2SpNBOlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+Bqg/Rc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+Bqg/Rc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK2wl004881
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BjF/ocdHV2gAOAgtlX9D3SCyO40KdLlspPA9rA2BnyA=; b=V+Bqg/RcdzT6KK3c
	cQIkvHWyFd1pkKlywurOaW5Gq1aQBf6cVxTCqBl+1M5kn2Aq8PwrUzQk2LaIrT+o
	bF7zlUe/WuN9vewYuvt/ZYAiYLjL3KuLaXq5eaUqxR+os53ALVovZjTOKQhg69jI
	QuKCcRm0ex9yQoSstYEBx8ZyuRP6x/0N8vjLHBG0TkMxzpU8KGe5OKK2v/TopVAZ
	eLOuw154spYTmsesDJ/PT9J9SsVXWycJK4fOWiM96JecChL2IwkShS1OgcAcUh2H
	LMSNPB+sPaXK4K/PDTl64NpoRIFJEaBoeZCa0DLczYw1oD2h63PwA2e/T3sEKXNP
	9UXJvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09w5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so460069785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603234; x=1746208034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjF/ocdHV2gAOAgtlX9D3SCyO40KdLlspPA9rA2BnyA=;
        b=lYCf4yHGSswFgq/QlMuINI2ZtyzQBW7mcjgKMbK4YF2uVkhAnzGz3W0nupLhSlhu3r
         +suUz1Ktb1DZ57fnSRhJ14GT2acQ+NvmGbDkCTXnNZiEk2CJaPWqhd7EM1mSNkAZuN8l
         Hey/tnxTVfpdJKKy/a4dVO0xRhUHKCHJNHejmnZ4NDGxHB+JLlQgDOIDQKA45iwZGdPG
         qJFOFTp4qmJJ7dhSXJEqnIOyyNcUah0SB9Xd98twcTZy684RcqJS0Bc3EZfJ0jKkDGVD
         uO2OJ6g9d+SiMElDAMk5iGDRYo6ZDOwiX4i85MuvtUnT/w7HhBWqsmLM+09CgtmxmoR1
         qTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfVdpgg6aRZe50qeZ4a8A7O9Vd2IqzYJNsj6rvn72dh1PHoSbPPkjkvtdn9msp//+fGWLW8EkKYBYnm6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR14CQafJjYhOde49KY8uTF5Pp55XSHu5CUHUnjVbF4wQ3jmjj
	dIbmo+oSKgl+Ha7Y1QJ18zpC5ELM1wm0sAsXjaoUryQbPIj0AjTMvj1FkWk1qE3mwbNBj+bFZ5N
	hsix2r9VpWNnuZ5eeh/AzNIoGXSAO/fD2yXigbvSXxTXD50R0WQDC++6F5m0odTY=
X-Gm-Gg: ASbGnctyzFQToIDzN0EAL/6ypyswWcKqXuSaffY7kydrMf2Strn6Yv+fO6p3AnsDIqF
	bBQXLFo3oubvQYg7TaDHgbVLt897Ctvj0nAhOR0ZD7A3I02zEh+uwB/ETmqrMmIkGtTCkKnmxOq
	7k7mSnkZrsvS65sYwSLWH61D+tndstuoo8oWTMLKCCfSryEysME+pRRVIvyFg0hYbQeGuUMS8n+
	7kW4Mt13thugX8M918sWo21Ir423CKNbnoUpsSQCorA+kDlMhUfKOXrm/5qFtQXsrQbo1qcdwRD
	HYh7NdgGXr/G1oCSnMCZo7CjJ7efezshd14nP9eVK2ziQs5IjDrrOCyg/SAd4dX3M2/9+fOYoh9
	Dxny3oKjemWpZiVQkO2KvE620
X-Received: by 2002:a05:620a:1a0e:b0:7c7:b5cd:51a1 with SMTP id af79cd13be357-7c966863fbbmr83346185a.6.1745603234494;
        Fri, 25 Apr 2025 10:47:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSC+mrQTmJAdkiOE3OXc2MIEiYkLXFJcskPVPXwApFb7peHxl1WSu9sWzzLaO/eLY6YEKXsA==
X-Received: by 2002:a05:620a:1a0e:b0:7c7:b5cd:51a1 with SMTP id af79cd13be357-7c966863fbbmr83341585a.6.1745603233997;
        Fri, 25 Apr 2025 10:47:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:03 +0300
Subject: [PATCH v3 03/11] dt-bindings: mfd: syscon: add
 qcom,apq8064-sps-sic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-3-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j8aNBL78dlGDp6ubghqzb5EpCs19vQB7AjDT5wAScrc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qa8ztCVKYupyqz1bBx2SuD7HM3caM8S/mFF
 uCH0M57RpiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1co5CACoMpRjnOWlxUFIB8QW1xMsYlnZVHnVraKNEOF0xjhWGcflfIJyz7mCkSMMlavmMOoSkJe
 yyw4PQ776bnlSBEoaSGfg0znia2ydQGfobv64XjpoBUinXAV4ls0Cf2z2vjOFpZ4rXU23pgEgz5
 w+czwzZyUOUs+eiyeaUlGR8Oi4UvPkEZXW5BR1mpse2zoGgmJ9NIZU0FycvbWmxiL7jX07cPkpP
 LUrMZ7toWp17izg4e7giy21X2M9YsiVnD/sNyEwKdEn9+Ibd5gsDGND7ZC6FShE6wxFI7C5QGLt
 qU4S31Y1M1/mQUCDWKRMjBiJ7HFJv8SJljn5Kt9fABNdhq//
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNSBTYWx0ZWRfX253zeYH4bQPa +9i+ag3gOJRxUBE5A+TGETNl0S8NdxLPgxLGX2Pf3XJw9ElG1dEv755kTbbFs13cwzp2R+1DSq6 Hrp3qVZ3k3fRiSKH0QEOnmgn3QTP0W3z17oWASyl3nUe5zf1LVuT9Mmm1veqpgkgbBXAJlU1Chp
 hEqjRUQ5nXmxbt4Lvtz7opNpu4ABUWXEWzU2XjIjyfhpy6VFyE6b/GwldMXTHOV6quR17+02wqQ nOUilx/Yk7/+Dmv8t8Rq19WEP05f3F0JSuvQc8b9plSnUl2a7jFlKH5MBQ8MMMbivTrNx8WtuQm 5eOknXsbvSXPUc9cV4thVMQThEb1NbW9D2fGdD0KYwXpcC6E7vpS1AtZukADcGpR8ltyR3tWdZy
 toYVMHrCJONnWX+X0MAcCs10yskKIOXIcDtNJsIU8J903VORpXccKyQViXFbxAv2vlGJA51F
X-Proofpoint-GUID: 9RAht_BywIXP4YLjOLssec0mWI0tbK97
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bcaa3 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9RAht_BywIXP4YLjOLssec0mWI0tbK97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=750 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250125

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm APQ8064 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0004878dd0da7e9c84675afcfad7a246c561eee4..b600edbeb56a5d1a95e3bd23daba677fd1437356 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -99,6 +99,7 @@ select:
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
           - qcom,apq8064-mmss-sfpb
+          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -203,6 +204,7 @@ properties:
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
           - qcom,apq8064-mmss-sfpb
+          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5

