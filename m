Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA81F151E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744306187; cv=none; b=Cmin0ZdVoXs3ACv3fZV4dbyDhrmeXw4p7QwQRrrt1+T10n/RpK+fCq6kQPTGD8aXb16Qv9tGu6CCcw/T9wpCeqXnby0ZbbS6D7t1HJhWtlMy6aXat3l4h24//ckEw/stYRbCAhRyLqKDpiSHBpqi6eu2HT77xwG9ny+PR3f5J5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744306187; c=relaxed/simple;
	bh=sZkkg4FHzf3CqAL0r8ylcq97bxB/mCKhw8YnXSUHlHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/FzuVqq41N2BovFtP5r8kl0qwOt9TYff90L5pvYu+eYBY3VBZk5yxhrOOHVWhWkUWLFaSMfdjRGVAi+EI4G5OjXt6nXlfv4lZEvQXmy3lHYdq1mVJqUTy9mYqPXHqfPUFdXw73PES03T43NmbaUsG9TRH4soaGpvEHX41NZ0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+lsCRxt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+lsCRxt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG5hK8018638
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnrcxTo06c9o2oy9wzzrpk++e7CPzYP7UWeWvj6S8G4=; b=C+lsCRxtFti7Vumn
	C95rPc9YApR/ZUmR436xvuRitZOH/vdbeydPy8l3CeSVXyV9d59Kp6YBaLRZqTS9
	Y7r2+8BKqZYYf7Och1+yXNpNmZvSv9+PL3Oax0p1PG2l3sJJEJXYvFrP2+eD9znE
	Op449UmSpC6gKiGP1IqkiJE59l/kKbUaoCv5LC2NNV6+//RpsJ4+URCF38u67ec4
	gHaiDc7BV5yXXXIjvYx3jkMQ/bfEGgAwWl+qjc6RuIfe/WLpETZusRgl7GPMpZPd
	yl/e5pWSn3fPlyDNegu77ly6G6hVLVkk1JEkmJa6lnEQNARN4RhHC7REfPggybv0
	zoDOjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgr0d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:29:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af5a8c67707so726768a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744306182; x=1744910982;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnrcxTo06c9o2oy9wzzrpk++e7CPzYP7UWeWvj6S8G4=;
        b=ZDMsymhaBhcfAaIgju8EyJPOgFOtEXuYs4wck6D/9fh1cWqVY950svlxh84xTRJ+uc
         8bVrDjzKz3srzJRN8PepNynHJLmzwZP1cP5R4C50EW/C9Lb49i7Uyudtl0CRy8BQKIgG
         A1fK/AihtDgA6aB5zhQyJGdJUmL86HOg01aqMhjwu/y1sGjbSgtEun6XzWPk6GFWF7SV
         RBO7rNryW6bti0dusgeScErnIGXFRFILhHL9nOy/2/069Uf/HaAK2YQAYg0Lb3w/zTNL
         ZJOqsmWUgCVeFMDorOft3O25u61HoPymveglG48nNsw+PQBbY8Zuvx6PZIlHQnntockT
         nCBg==
X-Forwarded-Encrypted: i=1; AJvYcCVqK+MV7aSgarl3xtdv3u9iAbrGpaSiDf4tYla6XYKw1t6Hvvj0hPfN/Cs6E4MsKHPQphCZm54BMvL6HN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIp8xkuG7r8e24ECb9W6PmLui0lZ7lWgt9vDK1muhQS9z42g1S
	M23SMgmPpSuGqAG9lZojS1e+qzyNr1j9ihvwZhZnzQjK8GTEjF4KBpSB7urPi7vehXuYoJt4wHh
	PK6v+hgk/MVw5ywDpiz62t5yaCzOR7TOLM1Vcvt0fXeljxubcivqBDJj+itRJhug=
X-Gm-Gg: ASbGncs9nDF+J0m+rne41B89AdAW3ixAN/9WS433VPDdgvYrDyL02/9diOQ7oU50ujc
	3MOc/OWhKwD3WBhIDRx78rnOfNwLBDDHY8P8kkyuko0eRJIyX9euZwmE/Fly9NWk1fnP8yvK7Ah
	Ds9Ud/jT4zjDRUgsS5+nCsR2TSUvx8h/asXC89tMVlO+8ysJcSYq24wFfuHATffWo30PG+4QHjy
	6TxnGPiSfjuWJyJ7/rso0VhEQTqVvPAdm2w5WBJ4Zxr0vD4bUvY1bQR+djVKGkDTsD/prx499q3
	IVKcfWY1SoEAuXu2MTkV1HzqgbDMX1tz6Kc0LjS6/uOqnFtadHQEplUJqmMMSD3uFDYNaoQ69TC
	yred3
X-Received: by 2002:a05:6a21:4a4b:b0:1fd:f48b:f397 with SMTP id adf61e73a8af0-2016cd5ec16mr4314590637.23.1744306182266;
        Thu, 10 Apr 2025 10:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWtPsisoIv6XSliwjGzBZFHr5cpJYt0ZyuLeyZu9YaURO2s8l9gPgZySOZTq6mo1UvdTVi1g==
X-Received: by 2002:a05:6a21:4a4b:b0:1fd:f48b:f397 with SMTP id adf61e73a8af0-2016cd5ec16mr4314567637.23.1744306181848;
        Thu, 10 Apr 2025 10:29:41 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d39624sm2809763a12.59.2025.04.10.10.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:29:41 -0700 (PDT)
Message-ID: <171e226a-eddd-4841-9672-b81b6b5a3038@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 10:29:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Use of_property_present() to test property
 presence
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250408190211.2505737-2-robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250408190211.2505737-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f80007 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=no2ZJX3K_zlcQ_1UBIIA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: HN5WFdkhmHIc6ypU1A1eacFIFYIJ2hvU
X-Proofpoint-GUID: HN5WFdkhmHIc6ypU1A1eacFIFYIJ2hvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=856 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100126

On 4/8/2025 12:02 PM, Rob Herring (Arm) wrote:
> The use of of_property_read_u32() isn't really correct as
> "memory-region" contains phandles (though those happen to be u32s. As
> it is just testing for property presence, use of_property_present()
> instead.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> I'm assuming this should still go to linux-wireless list? I had to 
> manually add that, so looks like recent MAINTAINERS changes aren't quite 
> right.

Yes, it should go to both ath11k and linux-wireless

Johannes has a fix that needs to make its way through the trees:
https://msgid.link/20250329220135.8bfaffbad97d.I946354c2395f4a30b8c435857a92553b1b58df5b@changeid

> 
>  drivers/net/wireless/ath/ath11k/pci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index 412f4a134e4a..87ef7f321065 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -929,7 +929,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>  {
>  	struct ath11k_base *ab;
>  	struct ath11k_pci *ab_pci;
> -	u32 soc_hw_version_major, soc_hw_version_minor, addr;
> +	u32 soc_hw_version_major, soc_hw_version_minor;
>  	int ret;
>  	u32 sub_version;
>  
> @@ -955,8 +955,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>  	 * from DT. If memory is reserved from DT for FW, ath11k driver need not
>  	 * allocate memory.
>  	 */
> -	ret = of_property_read_u32(ab->dev->of_node, "memory-region", &addr);
> -	if (!ret)
> +	if (of_property_present(ab->dev->of_node, "memory-region"))
>  		set_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags);
>  
>  	ret = ath11k_pci_claim(ab_pci, pdev);

LGTM, I'll pick this up

