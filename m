Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA7923C375
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606489; cv=none; b=U1qJBYxIg9p27XX6eokwrcEPvHlRz9kyIsCkG0//28IfHpi46P8FpWox1rIb9zFMqX1lePFvvVTm/xa1zVS+tf7/y53TBbzmu64Mhj5L4LHj76R7oCgLL/TB73DKgEx+M1mUbdizHHh9cQjRKRiYDfKwCOIA1SVvx4C769kynWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606489; c=relaxed/simple;
	bh=HasINFUlRIViKB2cskU+kbu8NblFKmwssEQ+isKHAhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QncPL1WQJ54bZzm2WQeAmKNMbUwppkczwLDCjhENsoE3m9REM7UJIRlrSy5o1edjhqqBH4Dxui3zGJ7n3mZ/7TdF2QSseWHYSFWdsO5fklFB6lU3Ha7OdhIj967u1hIMN8p4WUgNDaBZ1ihkH6ccpgnFrhZKvIKkZK9KNMuXUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJQWSajG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJQWSajG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532ASwAb014498
	for <linux-kernel@vger.kernel.org>; Wed, 2 Apr 2025 15:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eg6GgdeUcQfqxQMUQCNQ75dZQxRkdOmu844TCJTbJRk=; b=aJQWSajGbNTf2gY7
	RKzn59dQfOH5AVnkHP3x9HeBzD3vPNr6gWtw7cdIBl677xQsg1i2uXkwaa7kHEa9
	266gJcJzjePIyAkjFyjUnniAEaGcNI1fY4+Q+Q8/VhJuiAXKEr21ujf80pje1xCq
	4s4s19/WrFowoWs0H2b4uvpF/LgnDfYwvCr25b8ccm43HiXkg91mo5NEcrm74g/6
	qqRY01hQBS7ZmBtE2gVCdw9uGES+KCEYU9l0Hk0ZgLMEwM/tvDo1dA2H7p/jKlc3
	Em0KdgX0cyw5213EEkLXrmabJ8vGP0Ict1uT7fdBFBEIvVB9sB5pxIeB0elssTjA
	HQiGKQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvkuc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 15:08:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242ce15cc3so124551195ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606486; x=1744211286;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg6GgdeUcQfqxQMUQCNQ75dZQxRkdOmu844TCJTbJRk=;
        b=GBba99LNrpXidEF++22SYq99AOutwAykpqWYcMc11GBTOEHSfrnKBwcAhxkiJvDOzz
         5RaOATyiZ82xg5B4cRRheQwbBAdypytD8it6ra8Vab57nI1R6GSMqB7Ij/LXnMGfX6Vt
         98RRLBydBiIRIwxDPhNqWZSayy2t+5Mw+uEbsfN/Hlx33D9mjetHjW+hMuBoefw979kJ
         oU+eXRK7YY7zdRKUuRqLpcMZyoRFFejYIAF7Ns2Xj6paD59jh8miJpoOn0ORBhAPo2T3
         hFAl4rLwStrE4Ced/S9Kok1uq8+5h4OZiyvM5JoDFgrHcbVEJlpABqQyOb9GiOaOECyX
         5edw==
X-Forwarded-Encrypted: i=1; AJvYcCU4OWb1leQLAfPzWyksiR/2NbfroN2n++6/TWXdpHtSSIXbJtuNWpqCf+RN6fG+yNQ44StDH3ayaowalMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgaJXx7k3WpR9Nz9P6pT4QI52E8/m7NerbEXivqNAI2fHobwE4
	ILmQSx2qlbrrHnn1aQQlG1eACvWvAek/vFVMKESj4ROK4HvMIEx+7BezAb/n+K+aB5IxnqQEcDO
	uBjTLA5YRhzcJ5y9VuVtTiSC/8AkWAfJF03otdT84ZUSajtUu7fbXVRJkR9xSR/E=
X-Gm-Gg: ASbGncsb4lfd8J3aTlIktcn8lQb+qxDwvOyspc3mTkrI088c9fVkc8bn+5BTC+nmHKg
	zy7ClZzUbsZpB7WBEiv2Ffik9r+7VJzTmaoOqTSeVGKgagCCBYyHdekI81inrY5HZ6XIiEAAPy1
	cFPCKoXQZ4ceNolMUIP/Y4Tq7LRNkpAIPioV1iywVMLVC8U3IkulQAFUn7VGStyY4abrPJmso89
	uBKxCts06dcTnGMd1mua6pC0uKcuyLS39tQP9eSGI3Gx5xJjR4LGQD11KOXb6F07WiOrnTc6aaR
	MDXSDUkFthYiQW+qve8rn9VuaMFUvR5M+IDgaOD2GrZr4bFadVde
X-Received: by 2002:a17:903:181:b0:221:7e36:b13e with SMTP id d9443c01a7336-2292f960d81mr259356505ad.12.1743606485444;
        Wed, 02 Apr 2025 08:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5qD+8L0lBGoJulsYZKR5ppKHZkUdhdPhWi6pZRdHsgeGyZi0q6BLIkrUN8HgUsSTbK9wvzw==
X-Received: by 2002:a17:903:181:b0:221:7e36:b13e with SMTP id d9443c01a7336-2292f960d81mr259356055ad.12.1743606485051;
        Wed, 02 Apr 2025 08:08:05 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedc988sm110193905ad.59.2025.04.02.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:08:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        Sven Eckelmann <sven@narfation.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Stone Zhang <quic_stonez@quicinc.com>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        John Crispin <john@phrozen.org>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_miaoqing@quicinc.com,
        quic_zhichen@quicinc.com, quic_yuzha@quicinc.com
In-Reply-To: <20250320053145.3445187-1-quic_stonez@quicinc.com>
References: <20250320053145.3445187-1-quic_stonez@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: fix node corruption in
 ar->arvifs list
Message-Id: <174360648372.2001642.3342805114344594348.b4-ty@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 08:08:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ed52d6 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=G5r7sExCSuRg-0v4KYsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: KOwTdI_YbF5JTaLgwwWnbujXG9Bo3GH0
X-Proofpoint-GUID: KOwTdI_YbF5JTaLgwwWnbujXG9Bo3GH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=926 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020095


On Thu, 20 Mar 2025 13:31:45 +0800, Stone Zhang wrote:
> In current WLAN recovery code flow, ath11k_core_halt() only
> reinitializes the "arvifs" list head. This will cause the
> list node immediately following the list head to become an
> invalid list node. Because the prev of that node still points
> to the list head "arvifs", but the next of the list head "arvifs"
> no longer points to that list node.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix node corruption in ar->arvifs list
      commit: 31e98e277ae47f56632e4d663b1d4fd12ba33ea8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

