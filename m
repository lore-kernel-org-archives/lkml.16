Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7528C025
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547095; cv=none; b=pZozvM2HRba9VzrfuD5jVHvjZqUYYBEpNJqPrLPQs5ATJidMvisxszu9VuxLoHEsb6FL/YqjBVT3x9n3uY7fJshYYMc01D0bp7TTObeywsRx7Xfohm1Qq0moRmG5QuZ3vRjmkJlsIBpUOQc9DE26AoKWXBdouDbRPWDLpo3r4QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547095; c=relaxed/simple;
	bh=S02eX3cwwq3IqD5T1Y/z8bQjR5t8zDb4jbbctA55FK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AhZXpyq73xKmAlahDOrNU+TzwCqx18LItdQRegjYPaPTuHyvWCcOtGVhSDgVIDid4xEYJJvnk1pU9k3ryHnAZP87+P9gSGnyCtPmho5p8dhZ57pmVPaVHFnIlJpnrg1O+etX2nX7GCGhA4cOc4Xk0r9DzjLEaxbthXHG/8ttE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKfdBQj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKfdBQj+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A7vx4i013568
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LD/9cXhB15D7e64MfPVXxDkC/NmdpQlnbE3
	wwb3R8hk=; b=BKfdBQj+v9xEWynAzywk0NwBVBT3M0DtiZKhfuxUDLOCxQ0V/nj
	UnBrLTaBQ4zIOzH5gaw2i9ikz5hCsw5e+cnyFjkFenwNorTF4TcON+cYglxsR4rm
	uJ/TmR3HpQZg9UeSDI40K0ZYD7hJgGU3ngrQcAjdAus8WpfZM/k+8WhLrKxk9488
	3A2OSyip7MkMZB44YBw2p7YIA31PSMzrD1qwIzDX5PXEZvgShq3hy+ddGJ6HhyVL
	4yWTc1JzCotvU64PxjgfqFKvCDY5+Nw7n5o4F/3kH+EX7pkoZR2ijZYSr/EvKlTY
	kv9X8ZgZf3q1jOU3EHaRkm9DDT6srsZlBHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcgq0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so4864368a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547092; x=1750151892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD/9cXhB15D7e64MfPVXxDkC/NmdpQlnbE3wwb3R8hk=;
        b=Cv1w7/VmWLWROSwWezAm/0hxPCi8Z9VaXn0Yue14+LPneboYiVo8+0hn3LsFB3Qlqt
         Fr220R/EYir11H8slJrj+vUmfHcT5bLb1wCSc8EatIWcf8oflCfXe6muzE3OOuabfPZn
         SEuSR3LFZfVTwSq0fuZ9IBLtYproGslF4QklH6b2MlGqNyuJ/ds9DLhc43f8Q3R9Vz98
         VsLJV2VdX/iE9K9qrGsHL+yoNH2HlGXsgB8SnjIhoJotKc5avD6xOc+FJgGFImukww7/
         P1OZh7bDNcwHmlEJYRsOxXhFfWedFcSX13gS7NOaAAAgz7CzfyRVSOA5v/XMphec2goQ
         1nFg==
X-Gm-Message-State: AOJu0YwklxgOcoNhCuNUdSvwU/lcMWAtToYUE8IWyCm7t3QohsYa71ds
	6IOuPYkMaro66Ze0DUt5GRWAdhO76xf8HyUIGqUSxi7PU6RRsUPN96n8DnpV1MV4MlvUrtn/OqC
	dCUEBms+3/e1HK648Pq9tFADzzmEssU4nqn1KGQRLtnTpcweCdEzvVNRYjMB688zdXObhLd3vfz
	I=
X-Gm-Gg: ASbGncsKlZdYS9VaOciyURJwKiefXqMxAXkUnd84BoQCg5CjLIQ7XEoxwzHGcV13Xcy
	Ux8qinm2BIXAUMxz0DjIZr0yyDHhTw5bsVlce0+C7pUuxSyYdBErEBVkEsgjbZvdqLhSu/XHLnV
	OdF6p9zO+xZ3SjPPq/mHdo0nJSnu4slUyQrG02VRsplqh7bloBGYGLTqGqzioAef6tikGGWutgK
	zaF9Rz4f9axcbKyzb7Xg6FDRJ/4/Bm03Prlegsobvnq1vG8LTVw0ZgsGGOVDMjPVJh/IBEUTHXV
	aYNl+spBHXrRQ3CnlqUIzhjvUQhiiFCnBc8M90dQ7skXs3GO5AF8+sn9KVLf
X-Received: by 2002:a17:90b:254d:b0:311:c939:c851 with SMTP id 98e67ed59e1d1-31346afa132mr21731763a91.4.1749547092318;
        Tue, 10 Jun 2025 02:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA6A7Fb6MP+DJ9bPZH2QmIbZNP81kULJOwxSyuh+v1p3lpVKxB4ERFlDWV9kdLaXlo1o/WCA==
X-Received: by 2002:a17:90b:254d:b0:311:c939:c851 with SMTP id 98e67ed59e1d1-31346afa132mr21731729a91.4.1749547091884;
        Tue, 10 Jun 2025 02:18:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603d14206sm66951195ad.34.2025.06.10.02.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:18:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Flattening USB controller on SM8450 QRD
Date: Tue, 10 Jun 2025 14:48:03 +0530
Message-Id: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfXwO3ZX2OxGeel
 o7YwcyAAwA2OEUAF9DJQeVNn4gnqnp+s9puWusInQGQLS1zTk1ziU6KfMDhvYqYuzjD+vIuiBhY
 xQGzZurhK2LIjObar4MdyPGM2pGOKyM4mamS8CN233iBMAClaRwrR8n+p7Tr06UP2u0Q6FL0tB7
 3nSufr9/3GM+PIfQ6paJE+IcuDIFEX/6XiEhnmSfhC6XFFsfzY8MG2WCTp+fKGbX+F2GWzJG3M6
 7W7UBlHH4dcBSDg7eca1fKVuN7crmCKbC38uRopNUZSu8CEypYkzDifxM3izuhhE9/sSBG80G6y
 gsY3Enhibz5eICfouezwr3zgVpumQgUGaCaGAoi2hWSQI+D34YBoum53QQIpHGOeNj1MKQ1UDje
 J4RPF+E/ZS4qEVKdYeUL6DNIUALbPdXFCvZcInFOSmKzos+3h9bSQImvzwqmdZv8QkvZls1J
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6847f855 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h4yBHxX_cEBQcTB0eGkA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: YCBoguLfrQ9OZGZmrLEKoW4B8s3rbV1c
X-Proofpoint-ORIG-GUID: YCBoguLfrQ9OZGZmrLEKoW4B8s3rbV1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=822
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100070

Flatten USB Controller node on SM8450 QRD to move away from legacy USB
Qualcomm glue driver and make use of new one. The series has been tested
with driver changes [1] to enable runtime suspend/resume during cable
disconnect/connect scenarios.

I was testing on SM8450 QRD and hence flattened usb node on that platform
only. If the community suggests to flatten all platforms of sm8450, I can
do a compile test for the ones I can't get hands on and send a follow up
series.

[1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (2):
  arm64: dts: qcom: sm8450-qrd: add pmic glink node
  arm64: dts: qcom: sm8450-qrd: Flatten usb controller node

 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 110 +++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 2 deletions(-)

-- 
2.34.1

