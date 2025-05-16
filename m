Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7772631
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747367529; cv=none; b=NjmJgnursJr+CZZa/jh33cy4MTGi/NELesG6QwPjundWY0tNpmUzTfMU+yqOcuVw3NjO3d0WC8N2VOzJ0jVEoZJkhFp09Oqd4ih+O3tcaKWuJLy0ekW77Kpuv0X2T3e7ttdi35SFMFmx2PssMl2x28Y90JXR3OKAibikrCiH0ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747367529; c=relaxed/simple;
	bh=xSiSAXJdHwj34rgiqd0/Lhc/cc3/kbKTmkO0aOHg8F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpPmtt8Lramwz0zxlUVO0S6hJoY2Mnwk9KjcUnc5jO9AHHRT0oOEDjq9P6PyPKf1wCu9wYcfEQO+ZSXU4wqHSDRWW//tvMPHHsupjYZ0SyH24o2YZei6s3ZPYMVK7ks5yzlVbaeUQTnkg7UKQhaYs/aaGbLLcqvmClTUsiWeyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X96b3wRB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X96b3wRB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G31UFR020883
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e9CUjuI5toNO/CwE9P7BAHwcm5bf++miBkuAeuRBtL4=; b=X96b3wRBcf0WRTJg
	dsLx3ec0XQPLO88LulB7qoNoi8DeuWQBCTHJHZJ13rs6zhDTRaQJ2PsiyounkY4x
	0K7xpeFdChjthCISlBcPkf9SnMNKGNku3ObH44DBlj4TL3GMRxdYVHDtI9dKjmww
	kCaw9J95OdEVvVwk7U9gn0qwjm2yKtyFfNyYt24ofXSwAu2frmq3krokMSA8fdYR
	V92yRjmoRrsY3t23WTqFdYmG0tltUzn/sVbh5XljZU8PxwWkIAg7KqWoqsY4cXl8
	L1Xl9F7+QEpQdOGACSUGmk97FxvIeKOyrWztxYE303AhyfFPwMzAoJUeZy/kHFVy
	ZIHQdg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew8b05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:51:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740774348f6so1563538b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747367518; x=1747972318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9CUjuI5toNO/CwE9P7BAHwcm5bf++miBkuAeuRBtL4=;
        b=Kpy4RiwTYBim+fOmTeCeOI2JHn7j4ZxXVzWRkAL/U/F4D2OPgcFZeR5zljBCUpl1+u
         v57gftfE4E6NK71uHjvWoaIB+EZJIvknT8zeoA/TsLoK4e3/lNlalLt/iI9XitePJTOd
         AaLxAXD7KHvkC91xrvtPNiw8abMdbHrMbD2gmjoYM1p3IPunnub2JI2Zf7DtUvXCC/Mn
         pn/B/EeyI9EQC7mHV+BqrUW5rV0X1gxUfjSp/2wtdsAK/hW8M/xyD8Derf6aJV9LMCTz
         ywiRRxXnZk3r77JOn1sXtR/QsDuhq+HdAbcVt8+Iud/WsbFN5bYW02n5SzsZEZmy0t6y
         tQOA==
X-Forwarded-Encrypted: i=1; AJvYcCUljEeEdEUWVeNs+8BFwtH4pdFFAxJ6hDkSvPQaWUTj6vDPCEOZ82ZfaanUpJI/WAyPWnzhq/z3NxgVRJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPb/w5xRj9+F9Mm+eZk4bv1t/UaXH+5/F4WKhPCWsd8uERx1Qv
	WiMGlACBqHO7FeAUl7krtIMr0nQPjHFYL2TY5fC6PjM3fJeVXw+7wnp4UN0pPDYca5eeMrrlil3
	ijPLMJLvh3/8xgm49UoyNMYiZGOemZyqURRxV3Hv693/GvfnRviuGMVRWBmo11gZQwSA=
X-Gm-Gg: ASbGncvqPjDm9VZNOLfxP2vEgiDsYaGVfrTcrIjKTmVvRVW6Rz0xiZG3jrN1H0EmHZe
	HD1P9QYURHyZKAUs2cgDCIvoTzQaMGi3k7tg+G4R7K21vkTkDMKBc6457/MSvv0xYx1pMJL6DZK
	yCUzVrd2PulADDwgMOFvjU3tK1rfdHNZR+myDQYNRTzMTu+0rwdKt3QWvPYwf6kpP1BuhdJWoSC
	4rwC4y4TtNfGLK3EWdbsJ6fCokCnAjG1frJ4mn54+mSZcliym3t2N4XquwmEmW5tuUVILNU4pio
	XqguIqjeHy7RAh4SUG4KG7/+FvfcuzR5GYC5qRIt/ci0PE+Yxb5aRw==
X-Received: by 2002:a05:6a00:6f27:b0:740:6630:633f with SMTP id d2e1a72fcca58-742accc555bmr1441410b3a.8.1747367518478;
        Thu, 15 May 2025 20:51:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuzA/K9vXNzdBZ+rdc/yclBLrXdzfPd516G/U+MHxZQNQqIOscd16rlxENvqnbCHXktqkUrA==
X-Received: by 2002:a05:6a00:6f27:b0:740:6630:633f with SMTP id d2e1a72fcca58-742accc555bmr1441383b3a.8.1747367518056;
        Thu, 15 May 2025 20:51:58 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a3167sm580089b3a.166.2025.05.15.20.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 20:51:57 -0700 (PDT)
Message-ID: <c6ecda76-bfd1-1aa1-ca2b-33a9eea418fa@oss.qualcomm.com>
Date: Fri, 16 May 2025 09:21:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] wifi: ath11k: clean-up during wrong ath11k_crypto_mode
Content-Language: en-US
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, jjohnson@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250515222520.4922-1-rodrigo.gobbi.7@gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250515222520.4922-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1pJvBFe1E7-4BD6MNkySu7pdyhQGxcsT
X-Proofpoint-ORIG-GUID: 1pJvBFe1E7-4BD6MNkySu7pdyhQGxcsT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzMyBTYWx0ZWRfX3HbU0e7lBZQY
 7yYf69h1BVNeXzLUbDlTP2dlxrafSb8v+9Gj/cbO2gJgvl3REqOz1ZL/4OYv6ykFJA+L0i/kPXQ
 t51J/aLxJmzafZLGnIOddRFe2fd4NXBzxu9xiHEQ0Io+C3f3mqnv/RcIe8rfuFgVmiHlCYmyBkS
 4++RmQHstohWKfbyODxfdchVvpWW1UkQALJRbTprWNicDCFvQ+MgRmHfve75jiuCVjqZDw0rc+C
 4U6TXRORrGmMBSKfH3fuPfBzXFNZMqBeFGNnhac1eAgyneDO02ifIYHuygkAkcyd4HhFqzKnlk2
 0/rN9QISvIwsAf2XY3FcZ3N7l8wn42wOIcxafi+kOuUgDcP2OoIl5GYxNXQWR0oCQ7X2guXhGKo
 rsPt2Zf4ohFC4Q9HQF9OIi6s0FB7irQIKcwRDvvz2oE4M9Nw64rp1yef4TdXX8+Dv6Em5YNb
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6826b65f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=l0rt95YCMWEmbhB2sSAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160033



On 5/16/2025 3:52 AM, Rodrigo Gobbi wrote:
> if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
> ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
> started/configured. It's reasonable to undo things during this condition, fixing
> the following smatch warning:
> 
> drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
> warn: missing unwind goto?
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Changelog:
> v2: add smatch warn at commit msg
> v1: https://lore.kernel.org/linux-wireless/20250515004258.87234-1-rodrigo.gobbi.7@gmail.com/
> ---
>   drivers/net/wireless/ath/ath11k/core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Forgot to mention, pls use branch tag (ath-next) in the patch title for automation to 
pickup this patch.
