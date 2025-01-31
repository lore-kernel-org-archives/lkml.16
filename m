Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8DC2AD20
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362110; cv=none; b=JxOFpUvrafqZOWUygI5EF/OIeOFxvgT+N3CndQTqI9R4ilfLpvx8vHb9/RLqt7CVSJ3vc3M5kFwr1jAcEL4wEFonLfcizPGavEVzIJSilBsdbOGT1RGqbQEhz4kypil3Bzt7Cjw5gLPWEHjiRLydBBSyCXQfFU1Rki0j33NTDHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362110; c=relaxed/simple;
	bh=KbrFdyD/bpfV8KJgZlshax3DHtdiuG3Af0rvvQwD8Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2mLZiV522K8dWpmSY6Yt/bZxI+tEz/sgVUS8kwSAMaOcLdusMrG41h2m5dSOz9zreRNyW8N9god7xgrWn9nzBYCuLa+hvnvmBGwFV7XAW8T6QlHCtopUAvbZMLEDDNoly49r5OPp4S5X2Je6n4GkGo6AAhUl/C5oPAc0gPOUUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JufgXu05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JufgXu05"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VGwLKF014097
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUB3hp0A/oyJSzN/kCE+SQcJbrJLtU+PWheTVJA603k=; b=JufgXu05Ime6bmk2
	TZUCUhKh5nugsMRaPyHT3gV4BjCpM7803lYX07ogl4jayuXPkEuOAiinzQ0C1bdY
	YK3wZrMR20j4EqHa2ZLFUOmxaUgMd3QxDhuhNKuBZBdVahjlSkbtBajXEXaT2ZYn
	b68gPJvHM95TweVZlQPW9X3aUZ0y4nwvq/G+jQPun6LIsamU9orU/9FmlGy5XEBj
	Rk52PV7daShTUESHAEZE2NzB5CKtgBfKRwfs1S/gLVFbyzePC1cQynjuFba9/2IJ
	uTg2kvIbCRPh/T8oi+1IAdPHBPg6AUoDlsxzK1PrDC8GvKgciSg8s20hkyvdiIWe
	LlIdzg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44h2gd8rae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:21:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216717543b7so64140335ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738362107; x=1738966907;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUB3hp0A/oyJSzN/kCE+SQcJbrJLtU+PWheTVJA603k=;
        b=pT67Mk8YZWRQllguOokaw4a/YvmIiNISKItV34icPuwnxZV5uC6w461OnN79qhcuav
         onEGTctAW/MyRIi3pXgxz3NUve1Om2Zcbg5bW3QJSz1P4RvjndOvWW2nIonJe/BFoihE
         IJ4mEE3MQKbv3lAg6sxLV44hbDPNXrUWrMCZc/S5Ex5eZW3afMWH3fa3vAqZ8Crbw4Co
         NpIPUtyETgRauZN0YVvH6Ty0u+qQmluUGr6zU7h+7sLg0ApgJVToCdac9FPb8nWZxWAh
         ci3begSwr63SUbsmHy/ZGTwjNeXp8yBz/fT4yk9fQrA1MJqcAKMZi0UsBQENbUpTnpJQ
         cEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1sj5Ptx6MLYvpV0+3ErxTvS7i9LjF5xPs97hCF28u7cNzui4lCK5MXkKoo2iVzFTq5XkVl0tyfUtC8SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgUXJwZ49yYS+6jy6Jir0UMmxVBiE63/794g0POLDIPOv3Dnx
	K6cbx6i6aFWADpGwv5TD7oBuXAt57kt+U9feVexqamB/8RzPj66G29eUNYBpYH0COdTBeUm23vQ
	+95OpgqR03LOdy4qKqg0jnBKRUbJPB/Dy4vL/J6Uj95oScnHLepng3IvC72gpm3YGprj+hJk=
X-Gm-Gg: ASbGncu/UaGFFIWpwynRpC9XWVbFqt+RWhXqZtsEj6m0fvahV5Bmgs953X7H71xkHNu
	Hk1uHsLp7lFhcuBWv+auRTBXDCPsAi0+vysOG/3TwoK19TYe4z3Ka+03QlzfFENiq2SZP6zr1Ah
	xnBIGF2lXPLfef7qjZHDv1Opbednb6lnn+meNWXi3T9Bsn4nc2BsUUbN79ckropcjxoCW7sHFRP
	NkCVIXPcQ0BHfXY8iJUV+raWSxawqsYABt0cRzBmQgMjcrr3Jr4NseHPIDqOsDnYkRFckgPE97t
	mlTCJCpSklvRXIzf4cldPGt53susIVK/oMqNyE+b4stKBRGnRF57xySZYA5lAjTBJPgNa0RKpw=
	=
X-Received: by 2002:a05:6300:6385:b0:1ed:a812:c3b with SMTP id adf61e73a8af0-1eda8120d25mr1156914637.2.1738362107187;
        Fri, 31 Jan 2025 14:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvl97v+gvKvCqFmCOTlaqsxyHfMPlUjGPpurC9VbXfstnDJM7M0Vc2/Ub1uoY8F5xiGAZZ2Q==
X-Received: by 2002:a05:6300:6385:b0:1ed:a812:c3b with SMTP id adf61e73a8af0-1eda8120d25mr1156894637.2.1738362106829;
        Fri, 31 Jan 2025 14:21:46 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe56daeasm3054666a12.32.2025.01.31.14.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 14:21:46 -0800 (PST)
Message-ID: <a8f4f4e7-1c13-44d8-b19e-4ac85b48ee04@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 14:21:45 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] wifi: ath11k/ath12k: Set IRQ affinity hint after
 requesting all shared IRQs
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, kvalo@kernel.org,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F2WuZ4oE-hZoDVME7LOVJbDFHNFQPK3n
X-Proofpoint-GUID: F2WuZ4oE-hZoDVME7LOVJbDFHNFQPK3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310170

On 8/23/2024 8:54 AM, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series fixes a warning from kernel IRQ core that gets triggered in the
> error path of QCA6390 probe. While fixing that I also noticed the same issue in
> the ath12k driver, so added an untested patch for the same.
> 
> Finally, I updated the irq_set_affinity_hint() API in both drivers as it was
> depercated.
> 
> - Mani
> 
> Manivannan Sadhasivam (3):
>   wifi: ath11k: Set IRQ affinity hint after requesting all shared IRQs
>   wifi: ath12k: Set IRQ affinity hint after requesting all shared IRQs
>   wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with
>     irq_set_affinity_and_hint()
> 
>  drivers/net/wireless/ath/ath11k/pci.c | 26 +++++++++++++-------------
>  drivers/net/wireless/ath/ath12k/pci.c | 26 +++++++++++++-------------
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 

What is the status of this series. I inherited it in Patchwork from Kalle.

It looks like there was a question if the 1/3 patch was actually applicable.

If we think this series is needed, can you rebase & repost?

/jeff
