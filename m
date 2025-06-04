Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DFEB661
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044434; cv=none; b=BCbxd1sCnG7jqxMjAL80GzW4qHVjeJFqfyRhP8adkofxF1Qkj6gzXanN80xuep3dMfn3y9btRG+UWQqbG1UlGi+Gw1LOWYWgiS9Pg6EqWhS31Y+kQScR2hwsOa8n/lg8k281KqqeUo3BjmlHVr97TxIFaAIJ/qCzv7lLm4d8lDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044434; c=relaxed/simple;
	bh=Qjb7+tpwfSVqwbR+01+vMBlCKspqono/piLqhjhXs30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P3S3XyVvQE2t+eE9IxIFkwX79IxETJjhWClhuvR/cK7qjs2jgq0WSJk5bwFTtdGu5cCys9BoGo5oBCtGVEcOitRr/BWk8CB62Jfw4QedzVnd2C39GkalW5NZt10e5+H8IlCgQ2DOkUiqx4xXGyvDQVIpb5o4QJE9IQKEe5MBQok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuTOCbF9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuTOCbF9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554AhvAN023175
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 13:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YxxLPwj1UiNyXkoEDKvafX
	Ll3rBkfGqCX7S59SAmyQQ=; b=MuTOCbF9DUju3iBBezNEdfXWhVDkNyVvjtIIi8
	7jYvQNp4W033lsZMdSoTZOR5uw7WwC2BZBaApswYPT8Aik+i6PtDDnMMV+YsVdEa
	GJyZs5khuWGu+whU0nMgs3pkmIylQ6o+uBJWBYbDEzB8s1hS1C06P/qa0ugc2/BX
	9Vi1O+cP1RBwaqdK8ZWvnB6marBObsK4/JqzylhSDAZQYBxRsvha2gRuKNcfFFM6
	4O6ejiTDzR5WDPbpHAdbgioN2pSDEmDTzFiHQ1TT24FL/708K4F+KLsyzzyEsT0W
	y0mk+mktIfZx98DWl8/NTBH5eBeiNd5tPhX5zxF/c9cU0ZVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn00ehy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:40:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so1742828785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044431; x=1749649231;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YxxLPwj1UiNyXkoEDKvafXLl3rBkfGqCX7S59SAmyQQ=;
        b=X17SUEKtkHYFDAamX1BWjxT3c0y//QlK9XBRn8McC5ocFSUe+p1Bq41UmvAT2gcB5d
         mtII/Ok5Hvb+Yv6HTc19nWGGLOwvGh5C9dUKYmfZJEuGamciVRtvAGH0Qn+51BMInUWK
         pyhBxx4iz9Lz2Do3lWhWcSRtgdIDvZcWbdjXlWTz9j0p4ziHiMaaeQQ8kwlaftz4VczS
         fT+r1AGyc8WhOrTpCmXp1rBqaO7/+866sNKrEkubWKwsRVv2JcADfPEC/jEsrF/E0GHK
         7xFEf/MD1/4NZyBqXNFsz8A6zwrrg+68kKunQNgVqrBN1QjcO5Xj3xAM8UrqkR7MfknV
         gxWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA9//kavZYau2a90QOWWUKRSlbrAaTybLerckm3Tn+WQOp65lafk7N7qzW8RnNe9gZwJviovk0FmgLOiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsNb6NOGlK+xcstAO9ScQDzlsjCLC1iZQZteTwuCPXE1aMU8js
	Jix3V68DlzBK/8BziNz79IGKOK6+rv6o2fyGzphm2l35V1FIFcdgyjg2u/LblIS7+1MkGwbZYj/
	31Z9OcArjvH+nOdco2tbk3IYh7/OqiiXK6mCyLnHtb2K1by09tkiLFO3Kkd95e4sN1u3bWG4Ssx
	3rYg==
X-Gm-Gg: ASbGncsh8ns7OmvRaZI+FU8Qm5akTJfRvI4NonkoyP0VgkrDjaqYU3yHwll/3q7/BS4
	OD5EbPjtNBX9EE1W03BUXnWOtOQM25O+0spUE2uIeHKs/SdTcQzD/TNwoI5gFDkCNM50AX9IS/i
	xhr6XpG4aG84e3i5UZUDnsTDmC7hGb6pV/2lndULwk3Aedj3mupVCttMVxS/fJ5AqlxOnmJNJV7
	xEYhIC2BB+znAGYdDZ3LXXn5HIyCzphhU5e7Smp2WoQcfjyrI13BFXzTXr+aa8UfbCK1WEgYNI1
	ttyrq8tO9YR9+2DLaURT/GHMUKC5pHo1kNCh3L2AggfvSDcE3mbqbJXUzoIDRbJHWsSQItXBJwA
	e6leHjSEjz3hWG9R2jblZELka
X-Received: by 2002:a05:620a:480e:b0:7c7:b5e9:6428 with SMTP id af79cd13be357-7d219892888mr467188085a.22.1749044430661;
        Wed, 04 Jun 2025 06:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgJ/37/ZNeU7HPTqk6ukQbtmVMJRA9O3OkbH6dEHt1cdzVkbB5M/nPhHoPPto2ePyW7sAyKA==
X-Received: by 2002:a05:620a:480e:b0:7c7:b5e9:6428 with SMTP id af79cd13be357-7d219892888mr467184685a.22.1749044430334;
        Wed, 04 Jun 2025 06:40:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d376sm2311966e87.28.2025.06.04.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: arm: qcom: document relationship between
 SM6150 and QCS615
Date: Wed, 04 Jun 2025 16:40:27 +0300
Message-Id: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtMQGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwMT3cLkYjNDU93iXCBpoGtpbmhoYmlsbm5inqQE1FNQlJqWWQE2Lzq
 2thYAtNmsw18AAAA=
X-Change-ID: 20250604-qcs615-sm6150-97114937747b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=830;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qjb7+tpwfSVqwbR+01+vMBlCKspqono/piLqhjhXs30=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4aDz5lZq3037umzPt7EZeNR3TlRWZz9iHRS18QdXPNOa
 4n4K8l1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAix6w4GPp93krYPSoSvb5s
 0i+P6W2dWtffPXFkblbW53JofMnzYV+Gfe9vsQlikSybv3bZb+Jn38zU6dm0Qp5teoMox5QkR5G
 zs6VvNc9nS13B4fE/5laX7E2zgqP+chLGsptXJgSffsUgHcuYxNX1PHT5tE+FLMGnK3KiYtO39b
 bvYSuyO68RXjRfMLhLhs8iRnfhn1vmtS7dvg9t0nfdeX67yKGE+4Rct9ijLUe/rTrtc1ho14lra
 ctu2h9Yvevnirvex2dbGul0NmVemHZlVT/34dUpmtJz/zYyZXq8cFvcyKvrzipSdctmOXPlxE/7
 lCf87FVZLcOxb+WM9Ve61tg+XrRX5eHz3sn7q9S0Oe1kAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Tj6K7FSdqUYrKzdpr4Gl7zKyoh7ynars
X-Proofpoint-GUID: Tj6K7FSdqUYrKzdpr4Gl7zKyoh7ynars
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMyBTYWx0ZWRfX0crG/aHdjs7Y
 3K3SvkaUONkr1FoZCAy5H/IGxaEyOYft2fNtcBWfyxCsFdGrcKyY2T7KcecnYVY5J98ehMbe83w
 36kaCngzOFJiUjyyEN97WLRxqSuVjV2lfEp+TLS+p8jhatB0g5vscadIEF2FRD25toaXLRnLZZk
 RCBQQo2CK0q7RyX4i7uoAmHVEUv1YimfNfPvZvCXjABHQSgrw4l1covFyBp0XBAtMgOGbDi0CIv
 oMgVYrgzhg1IM48fSVpSWKNXkbTnLuRhiDC9clBYYzsxSbWO3ElLeCViuMYcD/q5YMP17KKB5Om
 qmlpH+cf9EFoKTc673TKEJfqzufh5oyljIHXz3h3tTEXCcsEC1b2CswOCP46MDQJtGCKMVSL4Ke
 hEGSGrIHyptwj/Wob4J1HH407doJI1OkcR20YsU36XB+d3g8wpc1xeDiUSanOuDf91ei1vR4
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68404ccf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Kp08XIzUypDThVJKgkcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=711 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040103

QCS615 SoC is based on the earlier mobile chip SM6150. Add corresponding
compatible string to follow established practice for IoT chips. Rename
dtsi file accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: arm: qcom: add qcom,sm6150 fallback compatible to QCS615
      arm64: dts: qcom: rename qcs615.dtsi to sm6150.dtsi

 Documentation/devicetree/bindings/arm/qcom.yaml       | 2 ++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/{qcs615.dtsi => sm6150.dtsi} | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250604-qcs615-sm6150-97114937747b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

