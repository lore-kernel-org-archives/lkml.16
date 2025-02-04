Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B8B2066FE
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654568; cv=none; b=Zj5SzJejm+nFSn+rGttAMGhWT1FDpgsmZvqRM7iaBZjW4AyC1ure80Tj5Na8UzPcYTt5vmsNAN8MdeWTS7Ez+7b4aNSnMZBXZaBHMpvSHqRa+2kypTZogb6lPVisI9Mv9KnIsffL3lRbI2P1mq4elw2q4Ie2vrzTSDkVwVGdmRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654568; c=relaxed/simple;
	bh=ZhAq/oxK7dZj5M54Prtq8LP12WzijO6jogbZrQoKxB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6Q8eVevv12DulZF8Ejd0+ehh36x5wYtVCfk//hEPu4TYdO3GEO3a04c9NJHzqwsIkYKkZsIou1CqxmIpymKF4xVXMSUkO+dcLp4hSpMetxOyEYf1mlCUkLR0kr6BX7sFSpKv5UD7B0dPWJ7ZL512kKxS3ri44gK35wIaypYLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xj+UsbR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xj+UsbR9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQfZQ026948
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 07:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jwe9hhdmFgTmkl8rrqNn5Zm+ObxsRt3ZsPNu0jCzhXA=; b=Xj+UsbR9k9T9qio1
	Vth8Rn0GKSe5dC4Kn9pQ5/OJUXK371OuWVaANA/vBwemipTwqaD3zoAGKL3OkcD4
	/DLhB4sW1M0L2ISbPyPR2/5YUDa7cadcGnlKHsSnvFDKgHWJFPOPdUPFTfjE0gs1
	dRzSFTCaSoRq2SfYOAgfR7tpInQeQZqsCwF4fhu6VsqWkWNVQmQwfrBPEH9wdQRW
	RmqtZjf0rWE+3/P4q5QCMFxYba/tLphH2RJ0fyN0QU61BnG1/Cf+0fFMFPBJt6P/
	8UBG2S71uDW1rif0MkQBa6LjBDSsaFHXRDTzP0gkyvCu9TJA+tWnSV8sMXLRtfk8
	r3VjxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k4ufs6y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:36:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2164fad3792so113425425ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654564; x=1739259364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwe9hhdmFgTmkl8rrqNn5Zm+ObxsRt3ZsPNu0jCzhXA=;
        b=NieJP4fhvp+0HteA7htsRHbxGqhFE9G20YzWeeGpN/R4rrxRa4gnTWjBxkEZcRIcSe
         k1KCObLbYadWffm6jwpvpSvqBP7pMBFyblKTcqszET8fcIs/xgVJoyw0zfZmEFlhY2nR
         dtTm3BkWOe1VjTPC8CqO4K+AA3CbE+olXOq0eNbov28UIpvBBdWWli+pURHS1wg8JQY3
         0KuZn/IGeHQ1nqfIXGY0/lwDXzlEjkQwCH/vfRpb0J0UhI71whfG1xUaku+CJfo27wHt
         3XhVFLbgSzC5k6HHWzq3TMsRHMeL4IUb9sLVLSEUjmedPVlZsG0x2qkNFWd2ztno2bwi
         evXw==
X-Forwarded-Encrypted: i=1; AJvYcCVWtEp4jE8xuZUUgCGQNTlPa7OiMB6fOsvLRCZyqJkS4MX5hQ5XyVhbJhEFCzLWoOeVbf2/XJC8x+5O4II=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhGEYedhFYmcz0yo6cOJ/RBhgRqzQO3RV+/ttoyQEJwxpg6+dy
	dQkx88gilhuJyGtox9O+tVmCwxZBy+Qu/5AJngZN7kwu1SDmDLjr7iWWFCUeEuwNMg3Nq7terpY
	wa+4g3r6guqR/3FP4M1WCimHuvJwwmwdgNX63KGNExSNCTzImNnc0QF/Qsw/G7nI=
X-Gm-Gg: ASbGncvP02ioXS3VUWBATBgeOPj7cPKSwbI2Xh6Q005XZYCejjAjYdo/StY7w6MVdZ4
	0VXfaLAuyg+BHURWRlHcBS7fyrc4iJR+j431fXSw9fmDfEKUNlWKhV9tpOvaO/0+pclExL9Qv+R
	ldlTzYMD19UXDTwCPVtKe0lkLTof3wltoz5dk2C6bozDgjBvB2rm3ld2sqDuXcHXzc/krmO8YXM
	2DGOfXvLiPOUuChRsaIjrbUI7Xt7twS7hms2phEaObanb/YA0hEaX5oaTmSPbkZ2VFyw4GeL9MS
	nKlVggpE6kmxF29j4jSZDc6tQ9byedIDRYkAk29r5uxx1k0=
X-Received: by 2002:a17:902:d545:b0:216:3b31:56c2 with SMTP id d9443c01a7336-21dd7e0ac70mr463120325ad.53.1738654564101;
        Mon, 03 Feb 2025 23:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq8LKo+cMyNzoWSHXi6DI8qCtmjVVFkX0lFaNK27TM/hf807aX/YBH8bXI2KOygnXzpPA3Pg==
X-Received: by 2002:a17:902:d545:b0:216:3b31:56c2 with SMTP id d9443c01a7336-21dd7e0ac70mr463120035ad.53.1738654563719;
        Mon, 03 Feb 2025 23:36:03 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f6f4bsm88244035ad.73.2025.02.03.23.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:36:03 -0800 (PST)
Message-ID: <b38ab288-bce3-db76-5ba5-f1a69f575291@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:05:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] wifi: ath12k: remove redundant logic for initializing
 arvif
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-4-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-4-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f6Xhdr5U5mb0ScXjMd-7qCr39hgspB9B
X-Proofpoint-ORIG-GUID: f6Xhdr5U5mb0ScXjMd-7qCr39hgspB9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=882
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040059



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> The current logic for initializing arvif is present in both the add
> interface operation callback and ath12k_mac_assign_link_vif(). The former
> handles deflink initialization, while the latter is responsible for other
> links. This redundancy could be avoided by using a common helper function.
> 
> Hence, add a new helper ath12k_mac_init_arvif() which initializes a
> given arvif.
> 
> Since synchronizing rcu is not required after adding a rcu pointer, remove
> that now.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
