Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E21F03D7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305794; cv=none; b=AGSYnPSkFauEicfjsYjezalO0P+dt4Vsuzi5EG4AEjA9SPAlH/hRjX82K6OBdUv/5IE4p//LokPudDLpXD8w2W8v/DCKpigtelLN63gDVC+bo9d2mB2PXCgQYhi9K3fkq73V8qh5KPatEKBRq5jX4c8b6DZIGaQiDe6julU1Cj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305794; c=relaxed/simple;
	bh=R5ybdCkyTddUlOPMRaGg48hM8Ao1y152Ju0ZZh/a96Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LD5KNiKyQjwJCbxdtY0aJDMbXIpYJFTqnrX/J2B6+X7v1GbuhTXt0/lZDF0aNTmnCg9U/lPNDr+9X6tuCyp9g1az3tFz3e1lNciQnwdvG2uMLtdcej+IhKozFgcOHHnBuSxyntIcDz1lvWHhQjeRPAhxyaX2qZAbFGOKKGRoCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7ejBOia; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7ejBOia"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG3EGJ032012
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3P5K8qIo++EOiyUEYlbHQXKSiyqq7I06DkfJB4A9SY=; b=e7ejBOiaL/xNwWLp
	VZOLe3WCzQY1MSDHQNqzKapEAntXx4ei//4KdJZUToV2SWi3IKd+3Y5F4khnbI4z
	iT+eagahFJhNg9ljUozGWBX+TlFVghLfUhlov2vUcsDnElXi6lNb5V8TyrFxg5II
	ACJ630wwSYlgGE5Ogap3BM9bfUw3NsPtjLlq72JSyr1WPYV54uLuMVGg0g58DxkK
	4IDOCy2yKvrooKKvp6plMIntdOU7Ef7xfLaddL6A4tWy4XfzfKRmqYdQr5ItxBSe
	/JDuGBZokpFMPKc0A1hv0XbehapPV26g9rP9m4UKw2hEpHxXpbvhvpw1H+RroBQz
	JNTtcA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmfqr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:23:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2254e0b4b85so9271605ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305791; x=1744910591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3P5K8qIo++EOiyUEYlbHQXKSiyqq7I06DkfJB4A9SY=;
        b=InhgGWxhjz1YFn80lep7/wnPoNtD4uGnYdCCiGwRKrKv0pbTjQTVjh0PhHJc3YVtRi
         gt+JUTI+Kei7+egU5ToTnCG7/kfFY3RkMEg3QJNv5fW8hafE4msvKcURAc+Az0GmyQKb
         ccAklAA9M8z1YAkvtKMmhBohlnIPDrG8Q0O4CU50rR/sKjRJF4pFf3iXdrTudnijPiKw
         1MgixClRtHORZLdx7DYhMQzwn5Uz54sn6Hm8Zz5ZcHG4x0J7+qn9kO1S0yaq6FR61ljF
         g7xYqxLiGTlEafG0LTJOQixRckeaJrMYeNN81e4MUtYVNlffjZhGHGHAYx94/Ro9VgwM
         6UVg==
X-Forwarded-Encrypted: i=1; AJvYcCWhon0KWUySvWyH3yUYVIOTrdB8cAYJPMwiFF7mlM/zXoVVqR2G8ZqBV2ak2AShtkgs56xhewbOqzZq5pY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJuZi5XsUN3O9EPlYQMuprJG0v/frFEc+CJvssAcneAW2wq7Z
	AKXtgEETy0YSHV6iUOqxKYy73Y1SS7CITzVdWMtP6JispiiyXxc48AVh2/qmir+M5FLH+uKKx5V
	ZT17KqCkpb8e0gQ//4pcYTB8gDqyEyY3gHtWNu3b3E1bBIUqCM9NmJVocRTHPyqc=
X-Gm-Gg: ASbGnctaVAlnAh9O3F8boxw58OCYf6Omnf/NFNag9OIEYY9a3P/S4418K0NqfHqxrAM
	FwhEF04PbWZIusyEr+5saF2TUKgcKmmnpbUm77IlkINUliCGUkLhWrtq5jnXZ71ltjnfCuZavJT
	F4CxYBijNghu6MipBYLMSdnJe+6/Zyk41x6l5dKDB7CaT4uzD1rc7uOWI0c+K2oukRBjtw+g4Md
	RAIqnqJr+Ae4pkBQtIQ37a/kIB2uasFIlc6nGmNqFbBso3N6HVujHK2ExI1R03IXRXOLsrTWPtn
	445WVwNexNLRe/4X5V/Ptwtqawlmolt3+02Bj6FyoQs/DFVSuHcXSnBVkuAQ
X-Received: by 2002:a17:903:19cb:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22b69430257mr54475915ad.1.1744305791336;
        Thu, 10 Apr 2025 10:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsOm6QHNFoIQoa9xAcmypmP2o9HLNTmyw9hqlhL3OGHmNMXVDtTazPYIXiQbNPMKCZ+GHi1A==
X-Received: by 2002:a17:903:19cb:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22b69430257mr54475625ad.1.1744305790913;
        Thu, 10 Apr 2025 10:23:10 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.199.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccafa4sm33459025ad.235.2025.04.10.10.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:23:10 -0700 (PDT)
Message-ID: <bb5a6a55-14f9-a854-c8fd-e059d34e309f@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:53:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8TUpoelNJSWUNon17qI0Q_1RBSNi49o0
X-Proofpoint-ORIG-GUID: 8TUpoelNJSWUNon17qI0Q_1RBSNi49o0
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f7fe80 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wh/sLrVJ8DShde116VVCZg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gMk---j7fasVHRGPvsQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=705 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100125



On 4/9/2025 4:31 PM, Dan Carpenter wrote:
> If the user tries to write more than 32 bytes then it results in memory
> corruption.  Fortunately, this is debugfs so it's limitted to root users.
> 
> Fixes: 3f73c24f28b3 ("wifi: ath12k: Add support to enable debugfs_htt_stats")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the fix!

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
