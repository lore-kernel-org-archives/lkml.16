Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1F4207A1D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664622; cv=none; b=rKnFyeFkCoGKe7p7XZzWzEbPSoPiMGN9bolPYl4rQOIqcOsQ0icAaYakyNTU1H0N954KT0X9wFHXhhK2Ehsjc6iJlD4z66HVkl/AALBGtce877AhGbgnIhdGlze4n9i0bYrfGNjOg1ip8aWrkZ/CvG6geVy7uMI2Cn24PAbD3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664622; c=relaxed/simple;
	bh=2tOrENL1eh7vCOb+YRZ48Z4/lH/9EZu7VjQAHHXcToM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/0M0kMLqE+6nlP1ZMdg93uY+p1k54sBEO/k47esgUH4+MX0zs23dpBXHJrDp4DQ4Sz+e3C1n69AVIf0cEkhfnnwGD0cIetBYO0HgGjzUhHl/VA6opI2t3QhJ2vgWDzgl0KZoQGfB3o76j6HNrR+o8hEyaA+L5g/OC4EK2I54o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLi0ChJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLi0ChJI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141ahUc003963
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 10:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hayHRKWt3KgTH36kTGY0tB09nAi5jZ+X1aXPPC8Jm+4=; b=jLi0ChJIfFSaqRTo
	U8zKG6GW4fh86fBHmxsOOe0PfMqBFOJ0RsFmFEObsBg6z+3w1kJXsiOwyf3blsbZ
	CaQbF9O7tv5Pab0r+ElwOqtCrA4nndHMW3bJ6YG97xRu+HlFFuwsrsU5y2eAvKm2
	d6/FXo4Fh2C053yZs40q7hdLXYd/2JHLnezsTH22df6bXYRFGrzeeELERbCAk2hW
	N4NAigo9wZTzsKOcgHOGLL9UccMdVVhmJGwWKc0Yi8uOOjo0uZ6uPJVHjSRsrkww
	rKrTZq+XTF7jtboxx8gAbxTrgaA2N2u/BjkC0j9gRkvIeXzo94CZFwEkbsL5xCWU
	IeGo9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k9cn11s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:23:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso10641940a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738664619; x=1739269419;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hayHRKWt3KgTH36kTGY0tB09nAi5jZ+X1aXPPC8Jm+4=;
        b=UJw4D78vSr6nUvpjWtIij6Q0Lbehr4y1qLb8t0iYjCreQGypL7pSkUQrm2ebJVin5/
         0naAit+do1UovU0bDK/A/vufl9I60RW2ABiWamAVZhoyGhfbY1k1gGuDZ+oYQjT6tdHB
         OvI0bVXXsLT8dsuE687n4xfCQHbcRrzVNWphFpmvJ4VEmJaIbpMWY8wg55wfTbPo5lX8
         TuhC/80or0LWq/BaHUrOXuCRJke7mLfYtGnhaOP1u0qpEACwGionaw/VYlPCOH+GyahK
         frG2yoBuarIHp6M1i+01iuBbQ4YV1m77vRXqe9O6fjBxzTE9lx7vV5FvNA+QGdtDXckn
         eFRw==
X-Forwarded-Encrypted: i=1; AJvYcCXY26NC2iaN8wYTDm92/+Eom0IPQE100HCpbf5OCONugpGHh/XD7U9YXyBr2Ig4GZ756urRcxutIwtRGRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysky7/VQrjo0jqIzGWveXdp2HLAPKU1l8U0f3lDf8JsOQuo/Vp
	mH6kua6oKSdLmpFlpjLsX5k1+5t6oh0Q6vT90ztPJ2H5Oe8/YFLFZqAFvxMrrxWZfRF4yRJ1HLO
	0IuH6VuHj6zl6+WDXkUyGQrg7cenKf1s/O68Jq89Mi2mMNpB5FQn2j0GyTC7F3aM=
X-Gm-Gg: ASbGncu3LLtftqvzIJ1QXeJegWZM4s15ijWYgpO3R2rdGDr9czZ/Rq/4DAkQHHnbB2E
	CauufomNcwRKbabMik0QhiAlriyBvN0JVwCjlo5L0pM1fXMBA7JK9sR6bfkTsGS2HtiC7O3OAKs
	MzGxOG5qVgv/pS8dE24/sWYRpS/mC+ychyN92+UY5jsaCnjci6v45DQ3E9r5ayn3euMCmWT2rHp
	+M2WwWrlznYNQP9GxGRJfpiEE3RPGlQXwarY4jNnamwEMlmbi13EWa6GklnossTcBpg5w2qDw1h
	sfa2fh0t9i/hkiyFElMSEG+37vpID79wIPhwikw=
X-Received: by 2002:a05:6a20:841b:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1ed7a6b81f3mr40738758637.26.1738664619076;
        Tue, 04 Feb 2025 02:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIdD5AiG7u15rXf2GHuHDUY9fbuc3P//5L0huLyjmG8JXN8JnwvXSF0P2RL0jsOL/hgtFu6Q==
X-Received: by 2002:a05:6a20:841b:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1ed7a6b81f3mr40738723637.26.1738664618630;
        Tue, 04 Feb 2025 02:23:38 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe856840sm8243100a12.41.2025.02.04.02.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:23:38 -0800 (PST)
Message-ID: <076014d2-eaaa-44be-81fc-a8f1eb0c2ac9@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 15:53:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] wifi: ath12k: handle change_vif_links() callback
To: Nicolas Escande <nico.escande@gmail.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <D7JKQ60C6EZA.24H639LLIG2U7@gmail.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D7JKQ60C6EZA.24H639LLIG2U7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Bwb82xIsmPCJMUSbJXpjNo4Se32aMvRb
X-Proofpoint-ORIG-GUID: Bwb82xIsmPCJMUSbJXpjNo4Se32aMvRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 mlxlogscore=946 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040083

On 2/4/25 15:32, Nicolas Escande wrote:
> Hello,
> 
> When applying this series I am no longer able to start an AP on a DFS channel.
> (I don't know specifically which patch though)
> 

Thanks for reporting this. I think non-DFS channel should be working 
fine right?

Anyways, I'm able to repro the issue locally. Let me investigate further 
and come back.

> After the initial CAC period I get the following kernel message:
> 	[   45.248441] ath12k_pci 0003:01:00.0: cannot install key for non-existent peer 3a:07:16:d8:00:08
> And then hostapd goes in failed state:
> 	wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
> 	ACS: Automatic channel selection started, this may take a bit
> 	wlan0: interface state COUNTRY_UPDATE->ACS
> 	wlan0: ACS-STARTED
> 	wlan0: ACS-COMPLETED freq=5620 channel=124
> 	wlan0: interface state ACS->DFS
> 	wlan0: DFS-CAC-START freq=5620 chan=124 sec_chan=1, width=2, seg0=114, seg1=0, cac_time=5s
> 	wlan0: DFS-CAC-COMPLETED success=1 freq=5620 ht_enabled=0 chan_offset=0 chan_width=5 cf1=5570 cf2=0 radar_detected=0
> 	wlan0: nl80211: kernel reports: key addition failed
> 	Interface initialization failed
> 	wlan0: interface state DFS->DISABLED
> 	wlan0: AP-DISABLED
> 
> Maybe I missed something ? Is there another series this one depends upon that I
> should have applied before ?

No known dependency as such.

-- 
Aditya
