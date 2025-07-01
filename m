Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29A27381D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381375; cv=none; b=GviCaZDEizLgeeQ9JWl8DfX2ODv9vwkBzp2eYRHDU20lNSw0tbZUixvTe0OXVUQGZMC0NKX6QGHTFj25ICLehHaX6UQ1fqnsDb6/AmLzGMtA4WztCPz1TFlT/OsqVniejG8kpDugDDUuPo49RHtM1LyEQhSDP0bTrDdE5OCGqzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381375; c=relaxed/simple;
	bh=e8cofJFzf1imC1xcaAYUYmQi7KXDT/mVIdcDBWP3M8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/BJZfRDzpJMymCTgdF76PUqHAYNDWaMNgOs46J9sfXkCcQBY+NoOj/lnWDF6pU0HoviyHpMA/XmaaS5R5PeR5Q5gTGjWmZzgJn43VaSlKr0VolOc7ZHvF+zc5Sv/GNqkgXyTcvTIyLgGLA4YYmumRUv25Ys/0IhpdBOCrUqOIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUEXXjWR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUEXXjWR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619TFxY007345
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 14:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=; b=kUEXXjWRWGbQa9Qr
	r003MGh6bnCm/U9M6kQDeZMtgTiFPgdiyzAxD/uqG0MkynGqevwcoXh6SnT5nM4O
	TJRcpGDH6GCbbUN/R3l4ReqRfSmbecTz3FyiaUCYkA42H+vqZR7IdkCSEdgp2eme
	QSm2NMRKJjpj2S7RL3m10Xrw42NuUrb0E3zW8lbv3bVztyRNgT9ERSexM9AEfQel
	pUgezVzsK5OirGkybTbMz6flVssAKmep+jmdCn48johrd2u26d0aW4GK0Zq7qS4J
	2cZ2Yoojq1GoG8wGU8yZHFk1Pzs19Aeg1hXXnG9qjDIGzP7XxiT2rflPjRGwLWtR
	festrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jdn24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:49:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23507382e64so30420805ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381372; x=1751986172;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=;
        b=JBwmKLS8cx5R8d2ePFhKAlY9LSh+XTv3J1H9DX2zg+5yV1FilRmVDv3xtbvBqd/IA9
         svzWq5i4lJ2dLrs7UT+DQCH8q6wKkS9ncgAMMHZrSwhjdcyYBQ1VAliVhGen8W6Dv/8e
         ftbyWkgzOzuqg8zYxM+LyVw/edlj/GFa8XnYoS6feVSJhQl3UiIvwP/2BnH78+LGyCM+
         jXhiXZT00zuDf8d6q8s5QRZIqBdHNcZQoWjsIeGhHfEe4ntcTDyWP3Wc2GOXj5A0esG0
         CTk/6uDHWdPPlgknI0kQWu3uRuBqHusb5ip9HOvZSWBlhO6YzGkXMiTmpMJen44AjmBQ
         PUBA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2cgrKEdBz3IFusjr77aIdfYgYh2cgSyF8TaM2vt3muIcehAYHHGc3p3M2buZzWOxFnPmu13x14ZxAJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmpWLjeAQNxgsYzbuhq7FVA2LYpoyCy3eu0JSIIfAa6x2UJyMq
	DPXTe7ErpgkN/ggTKx0Y6bF+qzw58XhMoeAOa92DxsVxNiIe5q93NLFKbVpc15++Z+Zih2ha9qr
	8q/cifWnr6Lpd2J2zlcXz5RJdUQ+zortSwXpnfvS37ihIkXh+LGQCf+1c70FVSHEPCpA=
X-Gm-Gg: ASbGncv09eHyCnhirwnKfvXpHiM5Z/IirLGs+BzBO5m2VWzABEil8eBW7IEl0ha29et
	zlmt0J3vD537Vd5jHNDD6ibrZVR5lTYMKxUR1o2IEZtVXu0yB/wHG2Zi5w82DSjl1STQKqkRQOt
	qUnnNhWkTxvqlmJbyOqAW/1oBEQvJw3iWSx0hUyPlO1dAYT/sqEBVcl1zX9P63+jTluGn3HQyEs
	B6+5sLEroXPZIR4eij4WSwPkjX7jHpLOgq4d9Z7V+LhlAD7lN5ydI17XkIeTXQQCJk1asKYfagM
	R9TKJLT/Emen4KVONwHAhvjkj+ZAzqxD1E/MsAgvKPpP2MEq8OeWa8TSUUqLM1dgbnEaGUYyLa8
	LinOe96b0E0pxUe0=
X-Received: by 2002:a17:903:2ece:b0:236:9dd9:b75d with SMTP id d9443c01a7336-23ac4606753mr303424235ad.40.1751381371759;
        Tue, 01 Jul 2025 07:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp1Ad/hhib51T+HK2hWQlQ5i/UENf7EU+ytKDeILLwtSvTV3KWZcptdDryg6BFVQuicGgoIA==
X-Received: by 2002:a17:903:2ece:b0:236:9dd9:b75d with SMTP id d9443c01a7336-23ac4606753mr303423845ad.40.1751381371312;
        Tue, 01 Jul 2025 07:49:31 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b001csm106117515ad.154.2025.07.01.07.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:49:30 -0700 (PDT)
Message-ID: <855ae20a-3675-4cce-b87d-6f25fb69e0a8@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 07:49:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6863f57c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=IWbF6JPFI0dN2yP9E1IA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: KTUBxBeYP77q6qtd1v2l-1slgh-xtg_c
X-Proofpoint-GUID: KTUBxBeYP77q6qtd1v2l-1slgh-xtg_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA5NyBTYWx0ZWRfX+yrUZrx/jsHf
 3CWB7t/ewWDqfJuhOwiL5yWCl0SS20LgUkeFkXrLcc2B7YMQ/Htby3wmpAMCBPt6uMI1e6NVUA8
 Denc5O0xPVJOh0jHtIFYZt2C1zYiIkwE9loaDTHP3RA3DklYkyvZGg/6/VdsZN1LOcJUIyD97lP
 HgdHk1RDXAEWXFrOrvUvm/Piuhke+0cERR/glsG5gE9bg3T2zXRseBmzhtc1I3e/HV82dyGqroU
 kK+usyxOfcuMZ6nVsVXqftUcm0ZnGOm4/DwpjQPaCQhL8Cdu2jpUTR4E+z6+CR1tO89jcxLPGqQ
 OrbaEQJYml5J7f2vmOU9xWnlRWXTaxOGfkPoYWbTEs+t0m63S9a+qkfbZdwWCacKpwBj0CCAa5O
 KHu4uYBLWQvznsFZvaQzGCUNvJB5JI7cKofBKgj89ET7AH8l6sQ6NAsS4TLf9nNhYeZiT9lE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010097

On 6/30/2025 12:43 AM, Muhammad Usama Anjum wrote:

Subject has incorrect prefix, should be "wifi: ath11k: "

And ideally it should mention HAL SRNG since it is specific to that allocation

> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

not quite the right format since it is missing hw version and bus

> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 4488e4cdc5e9e..bc4930fe6a367 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
>  
>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>  
> -	ret = ath11k_hal_srng_init(ab);
> -	if (ret)
> -		return ret;
> -
>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);

does this patch have any dependency upon the 1/3 patch?
if not, then it should be sent separately since it should go through the ath
tree instead of through the mhi tree.

/jeff
