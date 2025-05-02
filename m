Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89172210185
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191899; cv=none; b=fWwRODPt1cVrRaTpkikgzelIjNGcbnq2ZREBKhLLI0rR/CF0of8J4jIyGq/nu9no5+HA+iMIdmjhlcPQ2AFCyu6y1rO83NDr8OscpRN1ALj5oT389T23eu+T+u6CmJsF3UVr/fG6GENYJsZQ/vdcbNUwu8/HdT3CpyruUBmQUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191899; c=relaxed/simple;
	bh=kuc3nwD+lVGfX59PAIq28QGYc+7HorB/Mg6Kws2foiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hfv5x1Ank2pUJxcturkVNL5WsoI2iCLqzYDNPf8MZQy2kbx28JCmNnac47tP96RiBGniSojVg9Nq8jbMY0ujiQ1fT9UYPxCd3XDGzanfuMTRfI3V/Am8RSxYqbUsfxdNLu7E6izIpyWmyXbAZtsHpJhiI//W51znNWwC1GdQGIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX6FvctS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hX6FvctS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N3EU009494
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 13:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfFYMVQSeb9gxCMqpC9gyzIMAiB8t0Jg4Tc03ZwPL/4=; b=hX6FvctSasNVQeC+
	lxcAGA6/d9Gt/YUfsyatXcCFxanOPNSakQ/CNzfQF3y1jbF4gpPUR+16HcENIv8W
	8eee+JyBFaw8AjtFfckxKLflTUiOmpjlwVOVUgwzJnFn2gExI7tB6cHwbYTwYIzH
	W/z23wkQkQSflDGClIc9nZx8eVmahhK9VJ+S78NtnGpeSW8B6PMEqRCutMBK8mgL
	M1+cAusyS9pTmsZiuRPE9gkAXiHLKANvSLptbi4BGn8+xWrpsu2Nug91Dah77MUP
	svb+sFsE3zMnj6YVdlC47xMFeequpgQC+9rjG2+cToK5bsuiDUuzeXq6IpOPzf8v
	4OIBUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubreuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 13:18:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7369c5ed395so2440531b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191893; x=1746796693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfFYMVQSeb9gxCMqpC9gyzIMAiB8t0Jg4Tc03ZwPL/4=;
        b=DR0+Kq/UTwkaLLtc0PwAF8Z3UT5R5bF0+nMn+j3iyY3UD0W98PDgXyuX0i7PPCgeV0
         N04ffR+94mwAbmmxGMFGhrIBueUbEjxDk6rtLTmEevFgGvREkxAFf9SQHKSAfeOBG/pW
         3IkTFJjVLvvvsIY7orsnZ0A7x4hQEodO5jHna6AbaEApDoyePuz9VYKGZd7AA1xKBjm6
         tVScGHxb2ioR4BarOM00p6dFK7QlCjoZVAMLGpsdC9pN6TkHAVRYq0x2ELEiFS6pIGe7
         smaXPzcFh2lANzK+xoAcFKt7SxTuvcXQVExFNle282B6acTD/6tqfAvUGQR5Orh76cXU
         7IIg==
X-Forwarded-Encrypted: i=1; AJvYcCXKXn5JpeU+pi2en85CyOk0f5P0GbnBa6ZawCYtp4OKPCsAHxSzSq2F2LdJlTjC2Et8UI/IVkyKBieG/9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3+n5+oWwTkEiu4ZvnlX3epD5osUjQLEACBuYXNU9lI6oXBKn
	2cOSodqmA/ciUEQJUbFu6THvLwxBk2VodPyZ2av06QJukc18qsmL7BTIaO1Y6jWcWJG4MXOpZIP
	xphZYyHApKNW8smqekqOdx23wUlKak0z8NRV0czBos1joxmlnujNiHGH/Z03/UCs=
X-Gm-Gg: ASbGncs30ff/fVTtTwF+WUsxF6tQDpBzJactrQYCdtW3afUmttrtHnRgN9gESjMEe/a
	Yg3y1+t2ocJkk/uMtS+DHfZHYSiOYT4ckmKg6iN9/Cv/d/a7iNaXjyDMk6WW73cKtiL6nF2I4Xm
	nyqTuPUWn3Xa/LDuZC0ogW1/yVUCxv+AVwE8mO59R7O4JOc4cMEbH4CHvRloP19QhDBHSgdZRKi
	3BlFuxTqxZSmas5/iqawZzeLXvZXk2gj6HKq/yDBKO5yPEA6kEM+PMuS2BUO4qUxNZE1jL4A2hW
	GzOGS0tX3g7+20wlQZ7OW6pEWtBHgCNzYb3wmrFvTqN+rbbYGlSjY/IUrL294N4xbViVZHAMkZe
	bSktxe7yj80IX4PGTgiVnk0C6hwja7+6ibAx2pY5TvaXjBcs=
X-Received: by 2002:a05:6a20:9e46:b0:201:b65:81ab with SMTP id adf61e73a8af0-20cdee3caf9mr4468308637.23.1746191892767;
        Fri, 02 May 2025 06:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfmJNczsGnet4Gkz0D0Mrc+1uQYNYpgTJdD3D/OrH8RLj2AReOWrjWS6ngfsAJXui1vi/DFg==
X-Received: by 2002:a05:6a20:9e46:b0:201:b65:81ab with SMTP id adf61e73a8af0-20cdee3caf9mr4468279637.23.1746191892405;
        Fri, 02 May 2025 06:18:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:11 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 May 2025 18:47:49 +0530
Subject: [PATCH v3 1/4] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wdt_reset_reason-v3-1-b2dc7ace38ca@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=904;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=kuc3nwD+lVGfX59PAIq28QGYc+7HorB/Mg6Kws2foiI=;
 b=/sHHOupQearhAFVBllGVOZfEFzBNF22HDoTAgH7WYVaI4fX3X44JA5y5wxWgp6h3W6sUcd+l9
 uOliBBckz3YA/anqCFFTVYGYMufOfv/Wf1ruq4/P7npCMWEPH+SR3Vc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: cuRejVR3TRj6w3cVBLAEEVVrKPHArmbw
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6814c616 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfX69B3oewuseeg nsymnITMeB1ldoUyAKX/+LQx/oip/LWafalz+AAuSe44dxm1JT1rtBl48ehnyWRLeO7ziH1G2iO s3SqUvvTPjA1jJ0P778EKxJLuniRvC6XUGe7Q5fmoqzKeAM9jA4muwxaSKmdc118GaqguY5Zs6g
 rgKJcve7mGtoLx0rREKyk0LMXSjca01i1yZCCbLfv+Mn6HPu5NKnqMPnOU/3jl4QQXJ5Ik3FlOD XrwPEvSmM6ZPvyQl95aqOVIxGhYZZ7+tGrK+G3nxZkW1B4deKAi1cSqrGghWfA5IEM1N1412qHW Qzw9+fBlwIhE9oyxJCECnqCoYrdW+ivLtF7z6uKufVRj2NC+W4C8A7BIpMZkDe056OiHD4Ul4CE
 lkQVRrpSr2APOMhMRLAhyzoJ7rKQZACdagcjELdX2ckHgyVp63Wru3o3TxTxpIa53Vtia4DH
X-Proofpoint-ORIG-GUID: cuRejVR3TRj6w3cVBLAEEVVrKPHArmbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=946
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

Add compatible for Qualcomm's IPQ5424 IMEM.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
	- Picked up the A-b tag
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

