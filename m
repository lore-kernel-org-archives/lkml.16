Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C820D1487E1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472669; cv=none; b=q6DpiEnwkL0KE7mHcNN9AGMJIymV6cG7FQICYlGBpu+YhlYUXsMeiccVV2nRlQoKH6bC2/hQDSYldbYVYbJmOXq3bE7J94m21kVNcTR0qZwyhODtrPzJXNJY7rYhH1OH+ftrv6vxm1qDujpk7cAtqDniaSIfmzrJ1eoPVWS2ML4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472669; c=relaxed/simple;
	bh=7mn2rrLB+XnCWDOZpcjuYtgBAhtXxoLufytebR8dLHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmVFzgKtXk+Z4ea8eElEXcHxra3lWvHEpdRaZT2py1w9eFjf1F4wxPBdj/VhpIS5PEGca0N/hZyVrY30J44cKfYqguF7ZEdBSReuGg4ltJOQVlx3BykVr2UPNTbyidCxQDOXNmX+uzEZcX8QVDrFt2+pKBMVdNa76sfwjG6Td1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBiTabJW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBiTabJW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BoPDT016270
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 19:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mn2rrLB+XnCWDOZpcjuYtgBAhtXxoLufytebR8dLHs=; b=BBiTabJW+n4KBvlh
	R1w3pNpnz5dWa89tsPzuX98S8ZllEPCT8oKi0cdnxnXqm2sOjiJp+w8YJE8mtuTj
	b9tZ96FtS8IUc6cAfAsnpRQ7XWABacow/r36VNmYkqqP/J3XYiW4xQtLO2mWNTyl
	31Hyer/PnahgX6vdGkBlPgeaxzz+Gkyju8VDlKfu2ABwHw5uuPXWmGgJxZ92jF+p
	7+USM2gSk+PeQs49HTI8jvc5H6pDWAgUuQqAKyaAhI3ExPM/g/33AhIwikkxVWxA
	/gs6BAdV/vNpPmbN6NQOp5zKRChV4dAqPodRPKWm2OO3YSgYaH9/nonjgUq8PoBs
	BnESbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfmwth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:17:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so3796483a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472647; x=1747077447;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mn2rrLB+XnCWDOZpcjuYtgBAhtXxoLufytebR8dLHs=;
        b=LG4UOmory2kzvCHnJOEMzd0PKsHxqLUfpu4N+wbn1DquBMenll8pOGajiPlWfeml9l
         HPpkKw0inju6Csd84z4X5NxZbJcs+SnF9KzpAzIzh37dTW2NHXLLAaRA6c1P1z3k0xTO
         TD9AaW3soUaQA5Ilqjbu8ts+7lPbNe0KFOxvqGkOqQaE22hdO/7v/FlAKHJ0ly9TknIJ
         pUC9sSwp/PG6Tlkxjas/0u5zq8xlXlVIrXcZ9rf389VpKk+xY0MJqheW0DVPseZkaIO3
         Qt3Qf06+NN7HCCu6S0hKCkYNty4Qdr37Jb7cH6S6TzONJJtW6WKyxS7qRHAkZjST4KnA
         Xdvg==
X-Forwarded-Encrypted: i=1; AJvYcCXSaU2o2TH8y5pag2pJIu6hW7llrNB3dlS8WM3I9ZinfHcWn6Itkd+RfM3T9MsN9blPXPNDyso/yoIVcF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9rBHhpn34p94vLxxq8vI2JjtsXfe3v9onUrB/GdDHyf2+g0T
	FCi+7UXMq4Hk6JUp8aFcIoKZfd1yIv7jn8D0Di0xCpclcfs2Wn/pUC2DevMIrRmmKjN0kHLVFP0
	Ekx2LK6WvCz6oB7UxuzpsB08lijlItFwAz1Hk9zXN0iyQw+W/8Jc/TwcmSxRPvHA=
X-Gm-Gg: ASbGncsgFp+K7gmO6bGRZOJG1RPMm8DxHRxKmqs5DjUr8KZI6JqSqrMrnALTclcLKTY
	Ijcn9Af38F3W06FBO1bVTB+rF2amlYgwrH0QD/7xgvfdgtTMb3L5xCSOwDpiTO5McGEGxrGoFDn
	T4QfLP5gZaDnPl3HEsuwlIllNHY2BqZ8rdgPdW0lBTxoQeENbaahrVPrAVERfRkKJcIeWjWaXN5
	FIPl7XcxMEcZB2s/o4jhwoWlrNlZTijxChEmXlbmtW2UlYHeR6vM33i0sd6kR89telUteO3zkqC
	buls2aKKFu5IlC4/K7SoYCq3aVJzT07RWHTedZJicxNRWaQq6T7JFiykcM7T+nHZ2nPUznUMecS
	wy1g6
X-Received: by 2002:a17:90b:2545:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-30a61a2bf23mr11942150a91.27.1746472647418;
        Mon, 05 May 2025 12:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp19+cr+5w9t5t+d0bTheMNcdBYXAAQfq5l9a4/Cfanoha8qZ0UTuQPA1laccqJJm2/wtiWg==
X-Received: by 2002:a17:90b:2545:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-30a61a2bf23mr11942122a91.27.1746472646944;
        Mon, 05 May 2025 12:17:26 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4762672bsm9313052a91.32.2025.05.05.12.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:17:26 -0700 (PDT)
Message-ID: <f58075f7-f643-4e47-b774-dc529aaa01e5@oss.qualcomm.com>
Date: Mon, 5 May 2025 12:17:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, quic_bqiang@quicinc.com,
        Jeff Johnson <jjohnson@kernel.org>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250428080242.466901-1-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250428080242.466901-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 22K3E5ccep7VhD7ZjIz26uGi24DXZlBJ
X-Proofpoint-GUID: 22K3E5ccep7VhD7ZjIz26uGi24DXZlBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE4MSBTYWx0ZWRfX9AwnrPxcIv+8
 ZTn1cIgN+ea8QzFmZ2+7nt20+1vo2AxXQipmhoWNwpKIluFGNbZp9dmEdlZkI0RQ6Lj/rlav/m/
 rTglsyh1Ep7rDQ+byHqbDR73eLnVbso2ndqgxG/tO7rcS0Yn4rOG5V771dyNfX9iOuzwfuaJcQb
 PWQGT04R3vFvIyOisBQTIHQyLt3Dn/sf3CoHjbXpUla0YWYugTqe3lRicsFI/ZizE0funYotDow
 SUIXXNCOPqdHq7fcoHYs83VuS0twlvc6BoMutYBZi11yAZx34xRuXmM0YmHnvVVqIkoxBprJfVd
 Ad6I1OfRfnvRwCSLtPBa0vVo7SXTIId5eH7UZCsiOAsC6hFTOrzK8KBKqTXMu8djvK3TfpYvWGH
 snIC5lwG3HTIWNoHIJdE8KnTa5tlGu27VaWhDmZ+MVvs8n99CJJzKVSmRJKxypx9YyIWM2O2
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68190eda cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=aP1bZ6Fae55lA2u8vz0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=934
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050181

v2 feedback was not incorporated:
For starters, can we make the subject a bit more specific, i.e.
Fix MHI target memory reuse logic

But don't repost for this -- I'll make that change in ath/pending

However, does ath12k need the same fix?
If so, can you post a separate patch for that?

/jeff
