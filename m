Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E0207673
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654591; cv=none; b=kUU5kX1U4v+bHVSSBhCEbZwF53UMd7wkVU+izjIgZ1zDe2aKCvc9giqUHqXBGYgiqHdP8tnQ0MWgPy1luh1ecwm6KLxuTjT8gO8DEoQmGThF/OVHeGEwRtwqlh9J8heLDSCQ0n83SbzDpBBjL643gd8ok2ImvYAfSaSXcLRcvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654591; c=relaxed/simple;
	bh=JKrkttbd39E+9OzR6qKOjn5EAs+0hEW7gnYf5Jn5nS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEoxvxYTReIpTbqqIHaewFgXOwv/FXPswqnFOdLZDU8RgdUsAU+LbtxSj6qnKWIWovUr1PRQ2T5K89kuQSn2KEzE+ihC3Hti5th4wbuzmUmwG5gDTAd23b9i9ayBf0Ks8TMxuvci1ZlPCxAJU+aC3YAnnkp98WMw75UID915xCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDlcXnUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDlcXnUr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IppcZ006193
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 07:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WE3//OQM5pXdaucVVgshH0y0fU0kJk0nrQaexmq2EGE=; b=fDlcXnUrYVnQEhFG
	xpAhjN+PBlXpdKzyjom42CItEiMWMAVa97Pg/hU/7CN+KhPR2gHvVcM7mwoiLkwy
	LlmOv5wqp/vGJ36H9GYcsaQwFmNsL31XUbMoMzUQ9jq7D30wipdssWcuct4/jJYa
	dmyY4bHoxrvZarLPlRwE9I4J7oanwPZWb5/4/u0mhj7zWhRM9E6sPj4ucpFbRySO
	m+9LOeuY1/8oNZkVB4Bmg+pyKa1yFK7DcUQlH8Xh3xeMBEg79BVm8ezw9Cxl+SEl
	yAg3Kqn5mReUr7fI2GVESlu2bLSAGaHAQs20Lpi/+lRDkAtZvy1/ErP/o4mUQnRU
	6AaJ0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3ex1cjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:36:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21dcc9f3c8aso82435185ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654586; x=1739259386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE3//OQM5pXdaucVVgshH0y0fU0kJk0nrQaexmq2EGE=;
        b=MXO4r3a5Ngaa26kc/ZyZW9ZqPmTgrj/rIC9obCIkhb5fZyxZXsf8oWorhgR2sMm+0V
         GYwzl1zWB6ho0HUHCoOOb0S9Q4Y1VFMcjELwy+H0pi48veItBmkT+f/vm+tDmGjSdGX7
         WJ8gcvR8mQ7nUS9ir5Jb7U3cZZJbwpzpMsCPTckZzNiKOF4wrBwt+yUWyuqYQb2sYB9P
         AlxE0/CjwGc7ustdczyQgdem95za/8IKeZqSDx9Vo33Dy02EL17CF15+R2SQI2c/fRKB
         kiq06Iul0+NxZvzZoCuicZJ6/6r5TIjbRzYzh1cD7V1YlwP49z0lxC6VRUw6DGJ7+7b/
         sFfg==
X-Forwarded-Encrypted: i=1; AJvYcCURKfcnxAjyt97B6c250r3SOgekq+E9a+qNZMoJPjm0DEeOrfAzf79tWta0RO7Mm4n58zo7zeL/07MiPXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIv53n1F6l1jZCZVw04IWkGcPscFlWjJqJEyGp4yn8L5KRtBnK
	2GwTqZyit8pD5UDuArDQavYrAJob37dnUKdDRx6CqEBSmE03L1uYiTr4P9wbDgvxQ0E2R85tuMV
	KMV/SnE9rZCZ10DG5EvVG9wNQ1youF7rKJalkOrF+oz1Adb8h9u8YHvhFnoE/SRY=
X-Gm-Gg: ASbGncvjUWoPWGMWOhThC09c7B5cQ1IHjxjzlJcHUnbgWLGpv6h79Zxlfz++xrkgQ98
	6hmITE++g8X2WJipDSRFzURxEo+OGAraw+KGD168s38ypobWDbCugg2C2ydcxy5+AFhBt8WxSFV
	isLOEVQh8H68jY77mAnTS3CtGmo02ki/aaiaWscMLJfau/yqjL3A+g6Hm291pihNN3ctGjLPxcA
	w1/V96Ga2sqBpW4A6SwoMg68WJUTFPaSfhHcod3/F1PnIXYwLWIM1I4fmXQsF1OQh+RX+xq56Fr
	inDwOfJP21QdKbMFLgX7bUDItz07/U8Aw9NVb5LyVU9FhMg=
X-Received: by 2002:a17:903:2b07:b0:216:4165:c05e with SMTP id d9443c01a7336-21dd7d787f8mr464939185ad.24.1738654586348;
        Mon, 03 Feb 2025 23:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVtpRw7hLlUBVdkkMj+yMEet/93LYwVV01hDU07I9y5swZEPjUMH3XSPFMb6pKgyn8ozqnXA==
X-Received: by 2002:a17:903:2b07:b0:216:4165:c05e with SMTP id d9443c01a7336-21dd7d787f8mr464938855ad.24.1738654585965;
        Mon, 03 Feb 2025 23:36:25 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee0a7sm90068475ad.18.2025.02.03.23.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:36:25 -0800 (PST)
Message-ID: <fc1df129-e859-afe8-a883-cc34f55e22cf@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:06:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] wifi: ath12k: relocate a few functions in mac.c
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-6-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-6-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WqJpxlBX2G3ECm2wHs7v-Zot48PwzDC4
X-Proofpoint-GUID: WqJpxlBX2G3ECm2wHs7v-Zot48PwzDC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=751
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040060



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> An upcoming change will invoke ath12k_mac_init_arvif(),
> ath12k_mac_assign_link_vif(), and ath12k_mac_unassign_link_vif() from a
> line located above their current definition. Hence, relocate these
> functions to above so that these can be invoked later on.
> 
> No functionality changes. Compile tested only.
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
