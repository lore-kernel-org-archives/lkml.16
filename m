Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B23288C86
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676893; cv=none; b=bg2wGeLIHtv8cZOPvSb1CHkItvCL5brCTwYTb0orRYijwi7KGgpcTCLHQDWkd1Y6GdRZWqBGJOpTB4Tv7l9K+I4sFEPoUWvuH1BXijBWSmHFNpn+4BAcmBb7THPEZMLUjyqAR0/+I34GU9gJgeS7KlrKf0R38lpHVrCtF67tmB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676893; c=relaxed/simple;
	bh=m0hkJuL36ikol2X6TVKitP5XRuHeBdEHsBtcWqONzzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HY2SlMyGhg8l8LRGs8UWzDjPjSPJUQuAIMDh0bdhZq7LaFrwjAWabBqLo7k/SOzKE+gCmWyv1Tq3zreiv9ME2hY38NOMoTuewIKBwalNOfQPkAVfNtmbWK6ACzaF5LoJ1FVG2+jM1w97mQgx3Kh7QFotx6QAu9Z5miXsIBmi1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtHHa4CR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtHHa4CR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dNA6002033
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lu9IvRz0vgh0VPf2mVMC3ARfT8ah5nL2M6eYMOzKR9U=; b=KtHHa4CRzSgltpAb
	dIOh1BPsaoJ6GB6U4kgkVjdrQFCDSLSxXPAPayXQ9sR+ykW8Gp41NEee7UW+zXYL
	YsnRwPjWa68ur3xQN7fWabYJQ5ahCqcqSQJ4TtRPJeO8R+1HgT47T2pWodjpv1Uv
	DysDaG4dmlGyZ5iAYQ3/2302p0x7jgraIuZAD5EaiEu9YHKUMmobAz9Zznj9eNmQ
	EplUqnVSHS2ibnwJ3i4WgfvD2W/045MqL+DEs34GBwWtP5gndRevHxxJO5q7DQk/
	/8RPjkiacYt93XUu6jYtLj9E/YUfjCmzIfnZid6sIEkn1FCuecmU/jdelyEyLQMk
	aPhQAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1athgqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231d7f590ffso24132825ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676889; x=1748281689;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lu9IvRz0vgh0VPf2mVMC3ARfT8ah5nL2M6eYMOzKR9U=;
        b=ucpU1pTwKa616szgIyXUjGA12HAL2X9VglAe50GF7/ANntEjSInBMf2udaiS4j18VR
         O1x3c0NHsQPgD20gq81GQBNuSBiiAY0TSqfHomnjYDtkR4gmgnkJxinejRU/RtHMuUXj
         OeKmj9v6uLBtJT+Abtnt/c5LAenVCcrbEQzXXbXF9rWgDQfXfFDwIBnvL7Mdcb43VNZ8
         mc9WCUIrYuy3z5CRhVm+o6rhwbHxnGqXZYeJ556BtsjU9ZvPWEjLTLF07ICUg9VQiGfR
         QQipJBDqn6/4DI3cdtxX5iI9Rjy9ZRQ4QJyLRYRjgZM7XUGvk7LtVxQTmg5+gnie1/9P
         1IPw==
X-Forwarded-Encrypted: i=1; AJvYcCW3szN5e7VfdtQr0eUAEC3KctD+XFLHn39U8xQuBCX+hyzaK6VdJDwC1q/Nc3SK1PGQzslCN6apZQkGvmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Zgu18AkrC3faF/XHhId2YZkbsqwZcUTGdTp9bI0dgdesWHq0
	WTWtxWGPK5WJjiilyZQlcBeQib2fvXp//j7x9tgRrvfQpe7TmrQi2cREPOK2LlVYtUjtz62A3yk
	nJiJztC7HG+pqoA+cwJXbE2mhIOD958eh16t0w5Ofi29GDRhoKNMHiJ9sPOTlHq40ewwsQeK7um
	A=
X-Gm-Gg: ASbGncs+shhTVJ4SRMzKQB2cxvjp5pno/naDLHJGOn6gxkDBn5gMCxEKEf1Y2I6X/JW
	FwpgoKGYjx78Nx2H9djO6bUYf+2AQGNjKTFWkaRaA7SEinOmZmqauWR1P5TXXsBTj0dJFszqD3X
	VxYUtDvxM2r3emLYMiUHuLzghWCyo4ZbP1qShI5dgOsS5eHcI/5RLke2WaReuB1k0LpVxBLZiIv
	VwXeJIwPb8rs46OdfqEnidPNasZiJJCjbU0JO4jAwsMgQIb+sCD+dPcNLbZG49V3mHlzXwXfmVe
	m9kJuUeDVOrzw8hnaPJy5B1JL3U4i17vM3u5EIbV2SZLdqwd
X-Received: by 2002:a17:902:f648:b0:224:f12:3735 with SMTP id d9443c01a7336-231de34468fmr203642955ad.31.1747676888737;
        Mon, 19 May 2025 10:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWucOxXROLeNBzWIWs0QhMZ/i9p54oWNrg+8F7yqrejxyn/eAwE0eL0qCwSOlf9U/ucIR5/Q==
X-Received: by 2002:a17:902:f648:b0:224:f12:3735 with SMTP id d9443c01a7336-231de34468fmr203642695ad.31.1747676888342;
        Mon, 19 May 2025 10:48:08 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
References: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
Subject: Re: [RESEND ath-next 0/2] wifi: ath12k: support usercase-specific
 firmware overrides
Message-Id: <174767688738.2567051.17814529820458546404.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b6eda cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ZHLDmf7C8hvfDcYlofMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: qkBkhLbeU0Kgy9DdJjtd9tW_QWzP5Axp
X-Proofpoint-GUID: qkBkhLbeU0Kgy9DdJjtd9tW_QWzP5Axp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfX+cH7uSed6WZ1
 P1ZMKCOrw5ji5lo0weJu7v/GxfRYy19DcMx8SecaHHom5/XgzfLAEsrX/FbHOSXeobjNRGlmMCx
 FP9wquw9v+b1DNFM6D64S+mQaiLFuS1A2YqRJn0CugPCEe0vRyTMYbgTnFSkPQ7hOSPhflEocj6
 zJJcatIkOsALgUR8dheR7oABA/8CMHXVADBgcvD+IeEubNt2wderrlzsUKOkN9OsPt3fQPV4KV3
 1YfGmoFHAexdtpb4TG0gmkwbUvci4do5trvKA5m9PQXI3uQxZJCEE0oOxkXk44N7g9nbW3NGBlE
 sB5AyDeU8LrgMLEH89xSLnvfbC30SC3sItwhl/Z+jAaqQ5sdhm6WVWfIJFWpX9Ug7J3KpSYCeWB
 nSWA2j5ZhxUypv1m0pALnXu1J1aJyzffL5iSd5/SS3p8lN4zn7T3Yx1C+lXx2MHnDu08LLtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=922
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190165


On Thu, 24 Apr 2025 08:57:01 +0800, Miaoqing Pan wrote:
> Introduce 'firmware-name' property to allow end-users and/or integrators to
> decide which usecase-specific firmware to run on the WCN7850 platform.
> 
> Miaoqing Pan (2):
>   dt-bindings: net: wireless: ath12k: describe firmware-name property
>   wifi: ath12k: support usercase-specific firmware overrides
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: net: wireless: ath12k: describe firmware-name property
      commit: 607d6e49dae5336bd9f7356b0e227d8571450bd1
[2/2] wifi: ath12k: support usercase-specific firmware overrides
      commit: a9610bc482ef9c77ee0f3b7c077e0b49732769b8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

