Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6355DEACE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749701727; cv=none; b=qy2G1StGY/O8M2Wbh4Y/3Ev8uGXS7eFjpGkJVQBTQ1lCglOxjH4052hLk7/gWeJJNZUN5D6x8m1eocRJi8cP+JSzQ41crGtdBKop9jn6/fDTOmT1A16SJOj82FfmWJbHWHMlLeq5vloqGb8ivPOcApDeglHaaXw4ojSJOvf5UXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749701727; c=relaxed/simple;
	bh=lpAkSVoyxNACPdIdnN1idWGDw6nN8KK/jKqoSvbsz2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDQzQ8men34LXby4gTThoEmLXQLi0N3BBuQW2MYrHS9PUD2ZAB3T4OYeUMVsLky1VFb15GvQGnVh30tAQcF3O3sIsc8cwe6PBgUqNE1TIsTyT22I1Vqm8oI1z+TH6Jz86AmPpsYTdOrf9YGZl+5fvGvspL7jFA+DeHmnh3P9yYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBitBQ2u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBitBQ2u"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BIiMD1026034
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlDizTZaRy01LwN7t9CKJYpTQ9cFtd+2yQ9Q6Pk8ShY=; b=SBitBQ2uHh39FlYM
	D2J+br9uu2y7Ug87feAwrBlT1iYzqGzHcZjelg2+MYjw/1/g24fL1hyg8j+sgXIr
	88/uoIwUGLJfliokH9+zFb7Wl11Csn0e88ZijBf5DCZ0jE5j8njJYsAqUjl394Gp
	ioGsyutX5i3hbV51T1Ijiml3ac4go66wenGTTKKcWCAYM36TW02t4+yDbbVYjEow
	FiykS0bWXUwSpjXipiNlOP8yXgavz8qjtgTQ8xupzwNwBrurYE+eGgm/wK4qwtJx
	Gbs4pyUqH+u0ozvUrkbhU6PqqRUr035opLmi9wuOZswi2LZpiJO/7TC9IyM5tJFp
	zOjtHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2ya0c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:15:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234906c5e29so6486665ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749701723; x=1750306523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UlDizTZaRy01LwN7t9CKJYpTQ9cFtd+2yQ9Q6Pk8ShY=;
        b=i56NR8XYo18bK3Up7ZQYKHWDhicwVi3xOkpRxvnjz0oQioZl6IzG/gYNeIiaDZtvnN
         B14VywE3hays0Ydk/Jl/3rZPVRgDcqFye097UVSyGjF0zN3C+3xiNGSJ/Viro/jmEpoW
         es/xwhXugEfnI/XIeT2ZfMobk0MfoVLV2+R/IiwCD0xIFEEJ0jJN/Pz9e+eGzhDowbBV
         9nlkYXhHbshKuLfumxz8RsV2J2i7y006rJdtkllLfIqETMfKau/u1qoWNZRfewS9D5zu
         FGQW7E0akkMziPaCAB/ux+PZOnBsWiNf6hxS7srwNfjCUEyBjMS2VdWHHSSU9RLYGjt+
         vmFA==
X-Forwarded-Encrypted: i=1; AJvYcCX1av18zKFqWUj1gQmKeh/D1+YRiODTAer7GoitjjO7mzUbBagDPcEMpislt5SF1ht9KZSL8bASJZk15LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtesDWCKoAhmx98IDTx86nKXrRwR8wn40dEJMMtVP1lE+ARadr
	vBQA9tMmEliOIfs5upT6uZBW+6GL9OS394isqK70kUiJnB5Dw4twH58i0pbmO4ebvUzdLKCDGE6
	zSfzb7LG1RvcZZMMVD4FY7Cxm0uEMCKVFEyerPRFh2WjXeJ6Ka46Kqkx41LFAmSiNpW4=
X-Gm-Gg: ASbGncsTqn/4hWHMkW78wceoVbTQIn0xQTw9v+dFsfBwyoAKpNc4k3bxhU9L2Bbw9lb
	YVRXZCWYx9FJbMMKhC1IZieol//qzflZ9KjtTP8bDc/HLmKh3OEzYo5hsDDAOH36OA4LoWQ68SF
	+iW+4L0Fc/n5jU914FpZSm+DK4YbovHOKA/OKm0ENhbRR9rj1Op6RVbKwDxfY6zQAGv8yswucYl
	XOzfxKySZn2HEjhlAyh9Q497RcO5hzhS0Ux6N0uZIOW9M90W7t527vs0Wtd3LIeC/pPkYwPJQ1C
	ZIaalV1fkSBdnf+lH/5MrSX6FKXAdtEBy4UbgKc2lhT0DRz/JCGCHkJnaAW3q5U=
X-Received: by 2002:a17:903:1b6c:b0:234:ed31:fca7 with SMTP id d9443c01a7336-2364ca8b2cfmr34435425ad.48.1749701723490;
        Wed, 11 Jun 2025 21:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjkJSZxC/UbgF2f0dDkWH1U92D9XxBYEir3BqtZ8ceLq2lAdw/5hGuqWNSleFNh7omefhGvw==
X-Received: by 2002:a17:903:1b6c:b0:234:ed31:fca7 with SMTP id d9443c01a7336-2364ca8b2cfmr34435135ad.48.1749701723040;
        Wed, 11 Jun 2025 21:15:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e732edcsm3945095ad.244.2025.06.11.21.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 21:15:22 -0700 (PDT)
Message-ID: <ab70258d-5854-4529-8524-d4b0a1eed77b@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 09:45:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build
 details
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAzMCBTYWx0ZWRfX2pxCQaM8ESI1
 fcMK6uGAQt6Hq36kv3s3nf2A15YUoRQ6ZaBoyJb5rPIneEOlyRn2XZxaL7xVG5c9DDgC6JkYYXm
 ClRntCsgVY3vxpKjmjZOz72FgwjnZ8gJ1evusa82cZtHy1bvSMoYpgxjbDHs1KL1fEPgyKamwh2
 NeCzF/8ZO/oiCAsF03g+vbMvg7OEw/Ne67mGk9lScWWMBEgcaY3LzwvD6mE/ZUea+Okt/3IPUb5
 lVwm8p3wo5JjVEY9ITXisr3CvxyJn+tHKQB5uIR+TG2yEXTekuDcr/MmX76oDcH3/JYtbezOcVZ
 9hcVV8+8PxwQt/0O6AewcmlYApGkDlKXZ1BDP9OT0asHyMTDgrbe6MgfztDWYSNm+bwgVTB6p/8
 AU99/EopAB/uY/jULhAOemhLSo8vLRQNHD7IAecM2IPT0oc2Q0/WYxoWCBoPx3RsVDMDubQn
X-Proofpoint-GUID: oqbgL5fQ_Aqvdnkh4YaSE8AZ5NNVGKuH
X-Proofpoint-ORIG-GUID: oqbgL5fQ_Aqvdnkh4YaSE8AZ5NNVGKuH
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684a545c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=3TG353hyPe5QJAdDZr8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120030


On 5/19/2025 7:14 PM, Kathiravan Thirumoorthy wrote:
> Add support to retrieve Trust Management Engine (TME) image details
> from SMEM, which is present in the IPQ5424 SoC.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Note: On IPQ SoCs, the Trust Management Engine is referred to as TME-L
> (Lite). Other SoCs from different business units may use variants like
> TME-M. For consistency, the image name is retained as "TME".
> ---
>   drivers/soc/qcom/socinfo.c | 2 ++
>   1 file changed, 2 insertions(+)


Bjorn, can this be picked up for v6.17?


>
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 8c4147737c35e3878db2def47f34c03ffc1fea52..391380820f082d8daa5c764d5f3c44e6240e18a2 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -48,6 +48,7 @@
>   #define SMEM_IMAGE_TABLE_CDSP1_INDEX    19
>   #define SMEM_IMAGE_TABLE_GPDSP_INDEX    20
>   #define SMEM_IMAGE_TABLE_GPDSP1_INDEX   21
> +#define SMEM_IMAGE_TABLE_TME_INDEX	28
>   #define SMEM_IMAGE_VERSION_TABLE       469
>   
>   /*
> @@ -67,6 +68,7 @@ static const char *const socinfo_image_names[] = {
>   	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
>   	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
>   	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
> +	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
>   };
>   
>   static const char *const pmic_models[] = {
>
> ---
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
> change-id: 20250519-tme-crm-version-a1c7aa3ce820
>
> Best regards,
