Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137CA1F9A8B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431466; cv=none; b=drZJtcih6L5QBLAs1Hp+II/bF5++OqeuYRTwvbTaEjQie5ugg9cTa0LceopsstJHOsRGZlXMXuRmz+OiVqEtbmq1iSFfOiTsekmDRoJkNiPP3aoDqX67DgqDDV8baNda7HCPpt4wjxDn7zS5afcOI/ZoDCabongU5tcoluL2JSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431466; c=relaxed/simple;
	bh=s8YvYzFzgJVHFydhLtLGu0apY3FGCB+uze2f/rIqpz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OrHiel9DzfSOwaisPdKP0wdXMXogKZ26f6m/T1IpG86jap3QkOxirRoKZg04IASIvGx5S2iSBjEeBfofD+AJ6GLpSq6x3Dq/jt0pDH2Cltli6hvQN6yYqhzUifwXaNqWyTiJRupwg3x0Q6/BqO+HuG4pfn/4HtHFAPs2JwHcos8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jPW272rx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jPW272rx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAd2ct022296
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9OaIR/JgCGry6K2mLBsDcR
	Bp3ny/e1tbKsimDqc/P5Q=; b=jPW272rxOWAFGjUDZ6W+I6VCbZTymA/xhJ80Su
	5a8sk3mk4m3KHfbXGqpcalRRpW4pLhgqkK0qa3dCeJj98r1d7Ny57iblbpK4I9tw
	IYPylnUKNd4dEvF+Lcr9fdScRwJf1OiAGhkDdcIg+v/UFwUUzF1X8oC3H3zqqFhi
	Du1Xtq0WDEtWjPmzeSfVXDSCstO/k1EMo+MUtP0JYLybg0q33QPbM+pmqffQhzuP
	ehe4MKZr2o/qRfD0NbOUJDO5RzY/z5UnnEGtFpNRGidMJXR6sMqQ/bYiTs+m0/q+
	B2hdAxyo3XE+4UPARzA0p1A5WBUjTEhr6XYl11SHmVt6PAJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqa7dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:24:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso408239a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431462; x=1749036262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OaIR/JgCGry6K2mLBsDcRBp3ny/e1tbKsimDqc/P5Q=;
        b=Saw17NwiXuo7Z+3f4g/8WtMQHdrCgqtz+kAT92DA/nClxZ0tN9G0dG0y2/HSMOxAbh
         j3Bm2+kWCP4m4Aw4LLLr7UbxYT2oyQmTDA5HNmBBTC2b8usUwyLFPlZ22RBKc1Fz7MJz
         Fb82l4vEEJxhRb+FaPQBaATc8LeL/gNUxP2m8IUbjZ75GaPN+1RcMfWPUq66N1g7z5CP
         0MDIcKpgqvVi89hdInf34dCBRe+9CwFiyyOV0VTqOMwJ4hCpXRqZRvZ+K6COS4IxeJyb
         TB2H7VsXSobE5FszaaXhsKfuzTgVZvZekh519tj66pJ1S6b0S9sr595yWpUAV+pOgi9a
         LeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxz5XxYRY29T59K/OzXn5PXnEImPx5bsj+4iPrsLehM1qy2fu3id92gaCJtTqO1Zs5Ad2f0CXY+R47TMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXxhfTRFlJnGmUg2Wrw6SRqjNE6gdgKKthXeJZzEIDTjrKroX
	9oVMdJFdC1LgPZfvNcr6lxMb9+2oDudnK8FWHpfGbuICXwr4OQ8CSM+x0AMzlE4N09Zeob2skKj
	06iR92Dj1gmh6/vRb2eMatai/xqt4+90g+aZzEcGdiyj7ctFQQBVI8RmyOliMKf9qU3g=
X-Gm-Gg: ASbGncsC69PW+gwwHdFvnOZGnahUhav2TAg04UF9r0x2P2MEOPev3p4BgSF7b86tYn+
	kDwgDbjuHyVVTut2v4/Bv8KHRiHuPmD+SJmcOU0N9AsM+3CzzdMl0EQhnbSMdNUqFITD/ZSdw/n
	F1P4Ssrg968KE7Pc31PGMU2ZmNN8+LytoiOVaxBQq5Kub6jeK4tdZZUWhF9Fb4v0ZdWLIkCiEep
	RmHqshWcUvKAlcRwHs6PKfOPqAa/ULUeox32pcYh8fUrJP3+F0Jd9LEYtNFMQt1dmzYwB8kVYNS
	aWlrB9sE/SdpPjcrdjlvhVdIQGUbT9BjHk8OrEL8dU5f7grEtw8/gvpxAE/1GK24MkOK91Rmg4I
	CpwQT3t7fTDvA4D4dHs9/S4uxrnj3wiBRpvrF
X-Received: by 2002:a17:90b:3911:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-311f30b0ff9mr1919583a91.4.1748431462432;
        Wed, 28 May 2025 04:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT2k6BW8Nw88MJooxw2RTEDAtCcWs25yiA/HlrYnpjr7dK3nH9uZma9yPDliobnauzqCuwkQ==
X-Received: by 2002:a17:90b:3911:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-311f30b0ff9mr1919559a91.4.1748431462029;
        Wed, 28 May 2025 04:24:22 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e9b668ffsm954665a91.20.2025.05.28.04.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:24:21 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: use real noise floor value
Date: Wed, 28 May 2025 16:53:59 +0530
Message-Id: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/yNmgC/x2NUQrDIBAFrxL2u4JRDE2vUopIsqkLwZXVlpTg3
 Wv7OTzmzQkFhbDAbThB8E2FOHUYLwMsMaQnKlo7g9HGaTdaVV45s1QvGHafmAr6bWcWZbSbr9N
 sp2W10PUsuNHxv75DqFElPCo8+hKpVJbPr9la+wLFfiAkgwAAAA==
X-Change-ID: 20250513-support_real_noise_floor-205986936cd3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 6t4z1wIuGlSu3FjnQt4IX5uZDrw9nUso
X-Proofpoint-ORIG-GUID: 6t4z1wIuGlSu3FjnQt4IX5uZDrw9nUso
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6836f267 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=oo-PE9G31wNHbytkz5MA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwMCBTYWx0ZWRfX9s+twSAjRQ2N
 tPI5zFSgLaS0fw4YuQh0BMhqlistllIZzY+kgqu9XIA63XmOTtITcv7h61H9/x5+siv3OCOCZKw
 vX3M9ES3TSzCkRNZVqARk5l0WaxikknBnHIyfv+PyMEb/IMwivxPIf9zfjgzcd5D24hn4qOxQOd
 mFmdATS6SxagZbBucmJN1Ibalcz810x335+ahru/VGlZUUy5QJt+7xJ3WXTTZGIs5BUBY3OzJWs
 Z+OYxj5ehHcsGV9sChHrjKGgtMHL2/aIR4pgSUk6sTL70/+W1O7HHyAmQ6Nm57OKNZLA0CkBJ6W
 LjigOVqNs4RYKlQeMXLN2q2RAC8047DKe9IwvecFJAxxc5mbBrNw/W4Xc8AHJUDhikEbahAb1Wj
 hZI33fmwkVM2hiTYrLMS9niB/k7g/ooZTr2IN+T1Ne4e8nvefLf+K4LKfLeivPNisoJHPoHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280100

At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
value, providing an estimated noise floor value. Consequently, the RSSI
value is also approximate. This works but however, using actual noise floor
value will enable the reporting of the true RSSI value.

The firmware possesses the necessary data to determine the actual noise
floor. This data is provided to the host via the WMI event
WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
runtime parameters needed for calculating the real noise floor in dBm. This
event is triggered by the firmware during channel changes, temperature
offset adjustments, and hardware chainmask modifications.

Add support to handle and parse this WMI event. Use the received values to
calculate and store the noise floor value and use at the required places.

---
Raj Kumar Bhagat (2):
      wifi: ath12k: handle WMI event for real noise floor calculation
      wifi: ath12k: use real noise floor instead of default value

 drivers/net/wireless/ath/ath12k/core.h   |  17 +++
 drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
 drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
 drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
 6 files changed, 324 insertions(+), 9 deletions(-)
---
base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
change-id: 20250513-support_real_noise_floor-205986936cd3

