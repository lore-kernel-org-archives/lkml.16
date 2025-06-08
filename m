Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B5152E02
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749398860; cv=none; b=hPayvO6z187Dr4k8tczOshy/xochlQjiEJ2ekStuXVd4OKnjjkw1b2GDvDY0p5M/NGQ0GoKN+/v2ehCfvWNMigK8Low5z4RFfpmG4POSYSBY1RaR5ab3LOObS5IhhRSLmmX3eXufCtjuRdFU25w6cBlB9Zn3qM+prXxAiVTQ+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749398860; c=relaxed/simple;
	bh=xNUos8tMyJTZs9l00RUfjTbkkE4YfRaJU63mvymHz6Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ePexPfKBuGPxquT7SFxHYE8EsGX9Xxy43PKkNAitbpxg2W86YCAVUsAsd1eubqboFIuUSsfokS+jwgU20z8V/Hn1bICjlyI9mzNkd5nq0Cbvx4jSac791YjP/DlIpAJux8cAGz9yYheYVIhqqDEU9w/sJq1E4EF6FA5qexbVjaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqMC5jH3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqMC5jH3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Dt0Ij012278
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 16:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2DmFjKIFcfBEBm6hD4ZevV
	afYtIuTQbyd1B3Nfqg0kw=; b=dqMC5jH34+GpzqahlHKPQ3LDtb4Yc9r3+cnFiY
	uGCDq/td/XZfqsK6Nt3aGmwQsJU46EWJrO+cEjHMwvH/Yjbri7qjE1CdXMkpQ9OA
	yYzkarj2zfUYK+eyEHYWSzCrNj6LiGXoMMts4+bDj8QVYnIPmHFjH8Jy2Ow/gw7H
	Eg/hWh1FhJ3TheopwvFauI/5NDMIpQrWnJR5ntnwNru5XF4xcqL4rmGsE8Hxhi8E
	9S8fZkV3zeyBoUAeVzh6pLc0IuvVyLFjwlyNdJhOCa1CKE+DE+JaNkYohPbNvv07
	MQTE88PoDjCUC2sUP+4idvxBUJqFGtAX97RrI6l8FdC1ZPnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpk395-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 16:07:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so446423485a.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749398857; x=1750003657;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DmFjKIFcfBEBm6hD4ZevVafYtIuTQbyd1B3Nfqg0kw=;
        b=HDIItcDWikgzRa1XQH6E9HxStLxVOiLJg6j/+DSIHMt1R2Ndwh1UTeKx0qU3Y8q9xO
         WUJ+yA2u9rO0t3So6KsP6l8mZJiNUdxeUuy6QP00j6eA3JPZAOkpLwoBOkueGuX4+XzE
         lrN6nGqoiB/NyaaSwdb686YNlvT8wnoFs5mj7Z/FhEClRQmpciYOln5EXhcJq6t9/e2u
         l+DL4+Nb/eB9y2KEBySJBgXRXTZzpla99v6+jVlKWwBpAiiwe05TxAPdOwVFE8WhySkq
         gKJlT2Rt1f2XeGhFu3GW7xFdBN4ZifVS79m0UKoKBTraEeKsMyTuoe1xqA3BWZwTPIJL
         BECw==
X-Forwarded-Encrypted: i=1; AJvYcCWdlpi0y9wGdcNSCeqtH6xHr4D7NBBoGTsY3/8nI6SA+wXkuc5dK10JCPj+cUCik5kgqEoH7C1vkWTaoA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6r3MzD0qlIGOGtIYWBhUgKkeSgohxsJKPK3lcrK8YYmLJZVBY
	lizEnAu2/Kg717PYFNgLAteiibYVaUdit5Usc7ghN5y+0vZuEt32ZauhWQJPi2m7NrrBaMjwX6H
	aSNPFPKHTcQW7pw0FCt/sG9dHT54FYZUOfZrKBZVM3sEU1E7E/dPdDS5oiHRx3d9EjHY=
X-Gm-Gg: ASbGncsAJl2ngLsapKiMGEFHfWZLqzZnlVl7laMJSV3DeXJ5hI8BW3F5Z9rmj+9jl8u
	Stv+CyadkKi6TjY46fWBakwqX104nKuao7s2daYkXbkRKQq37RaWP3iFngjC3c/tNHVLW626O4B
	yp2ew6SNJ1lErYjgRGAdv/UyMdStVTzr3af0zMQyy+hziXqokB2Gqz/osoH4bEjNaXwolmK8/lN
	Vxi+KMFn2VxYUun2T263aE8beiIi4dHNT76MXsakAQCCaLDSNkSEX0NQejQrWsfAfGjUJYJTUQt
	Pe9pGOYPHYCffEFFi8CZ3aow8zXWh1D+0OQwfYVRwb0H+NoyFGog8Zo7b/tTdVlJBA2JA5TiD5F
	RCsTu+k9UmbTT33Bs5PXd7FtH
X-Received: by 2002:a05:620a:2614:b0:7d3:91e5:5f10 with SMTP id af79cd13be357-7d391e563f0mr350790785a.18.1749398857335;
        Sun, 08 Jun 2025 09:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5628JA1HhmA6KC/drUXsCrJg5LWgDNQwz7I9cwloHhVscF9x3LpTuOw343GWhZhY5I/LCUw==
X-Received: by 2002:a05:620a:2614:b0:7d3:91e5:5f10 with SMTP id af79cd13be357-7d391e563f0mr350787785a.18.1749398856997;
        Sun, 08 Jun 2025 09:07:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a9d2sm818970e87.186.2025.06.08.09.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: usb: genesys,gl850g: describe downstream
 facing ports
Date: Sun, 08 Jun 2025 19:07:29 +0300
Message-Id: <20250608-genesys-ports-v1-0-09ca19f6838e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEK1RWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwML3fTUvNTiymLdgvyikmJdA0sTA/PEJFNT08QUJaCegqLUtMwKsHn
 RsbW1AIf7NMFfAAAA
X-Change-ID: 20250608-genesys-ports-09407ab555ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=752;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xNUos8tMyJTZs9l00RUfjTbkkE4YfRaJU63mvymHz6Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoRbVHSjNWCf9im0oyvJbg7KM/y88DVCiLAv8h/
 fechkskzgWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEW1RwAKCRCLPIo+Aiko
 1YqUB/9CKdqFy78i8CP3OKFQLk0HEDNXN6UTO3u6MjX+EpwFlNgS6VNF6IYlV1Sk6Z5Zm+mTgg/
 AQKvbKsn7IaJoXnH8QKkwv29XeFmlt467SAWbskRCtHjYte02b/HwFbQxvDTYTwV7bDofzridy6
 87+OGmAuIFhmUu6YoZU1E+/tuCEpBGCbXZ/8os+nwo4KUktHldnRZ5KcQL2A1AjeyzRuKKJIiQW
 LSZiPh81EncQyjfdvNkau3u+bUqZ8bPyyTxGcD3SRIESdPCCByJjHMKRhvAzehyVVWGYpejS2/j
 YMo1il2sQ/T/Vesj/Q+TaX5ZKjiSg1/CYqdZfg9vonqNjQCw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6845b54a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_VuCBpOh_WUD-g_gB6sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyOCBTYWx0ZWRfX5lDFP6q7KarH
 u74q1oIIJ82mdh6EIQpEk71lW6ySWQExmgo2SsJY3AxOlULsexWPoc087eMle5ZcDMEoCCV4g0D
 JiccF4ef4GCzq6px+/NycMoRi6ddzeuIzxUxwTPL3r/pDMHXl+5ZKV5rSJB7IUvOnmZ58ErQTSO
 67S5+T1Lh8g4zaLY1MrwGKS9xWveYrwvNtQXnC84QUf3HORPNAdHCsQSmHgtiiXbHYMj1Z5m8G+
 9/IpILvU+yJtpeQUrRKGkBo5RLQRw/gTe6ti/8MCqrO5m2SqNs4/mujDQPoT73RAqEm6DyQWfa1
 rmEB1C7VQlkQZmRurLJYk6meQMdGHeBB2TTny5doEaYMS1fs4d3BIPJOhknS7GA8cQzsrEf0/Gh
 qEhDfd2wDHWDx9M39jP80yN1H0RMtSMdGjHqO1Phj5x3ZT/DYJ86A8gtYtSpvZeig8C1beyU
X-Proofpoint-GUID: u1MhTBh4f-yF1JFc1Xdq_d1eCRTX6uGI
X-Proofpoint-ORIG-GUID: u1MhTBh4f-yF1JFc1Xdq_d1eCRTX6uGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=727 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080128

In order to describe connections between Genesys GL850G hub and
corresponding Type-C connectors on some of laptops (e.g. Lenovo Yoga
C630), follow example of RTS5411 and describe downstream facing ports.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: usb: genesys,gl850g: use usb-hub.yaml
      dt-bindings: usb: genesys,gl850g: add downstream facing ports

 .../devicetree/bindings/usb/genesys,gl850g.yaml    | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)
---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250608-genesys-ports-09407ab555ad

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

