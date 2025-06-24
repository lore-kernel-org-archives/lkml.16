Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF9E2D0275
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777904; cv=none; b=JMgqq9E7FMOo7B9fn5OzByJxn3G3bBCOWKUU6/WkMc6Ve+Ulvc88q5j+HnN3gZGVkWx2q8+m9GAOkfe/QBd32rUQ451FVp0rUazhxYv5USYv0Nm8TvJNtolWJ1lHDTI5qFN/p0Rvs/ONaVdtrgBizTxgQSda7beUPgWIehB4CUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777904; c=relaxed/simple;
	bh=nL+o3QWsD8Q6/r9+nASdZ9ksUUyF+QydFWN+GEIYKh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUc8x4Hud4xOC2AicFjzFqB6rJS7KrzIZlyxBmcVCl2p1T5VTGaAyDq/TdeBqA4OjvYXSVu4VFZJ00xUFpj95oBU2Uum2WqB6/udJBbxo0vIKQ0HEeWjyuW0NzQgPR/4eU4FMvVcBr4v1v7RudHW1zYxqy3HEL0+OTniHprt9Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUnzGllz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUnzGllz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEYJEB005909
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WROZRR9mmLK2PFxiaEc1SQNzlb0RAKYImQh60GijuC0=; b=SUnzGllzQe7mBZZr
	hyZgmrSuT1yzy+JMUqTlQX7iVh8DggcO9UlfTVvrnZR2HtiEAj74fPxEmWa+LEmK
	90SDxIHo5u4P6gqKkRhYI0ae9Q/ROs7BPuXXK6jfj2blftnAaQ3/roWgNW6P6iyu
	22mDwxX8hXL/vJvmeaXqGeQAoLNuyFDz3FM5mEhrvT7GT13RD5LMm0MZSnoi+GS0
	6un3BjI5QGfkoXTSOz/jbziJ/mGIbPPUxJ3nGPTrc8q+BSL6t27xl4hkTkW9H8X/
	98hvXCXzXvRUV9Uv6LOoxsUGB6EXxVXg3Tgd4gUaVTo3wKOo/DpCj7ogBee7fUen
	EFTb1A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgckt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:11:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3184712fd8so4350125a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750777900; x=1751382700;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WROZRR9mmLK2PFxiaEc1SQNzlb0RAKYImQh60GijuC0=;
        b=JtO7rcVy9L0/0UzYGQevPPIbWGLJUvUsqyqcFC1sdvQWF3rC95cIc9zZwbNdSPW/yb
         uUuYUD1A3jr1MeBMjloEgNTVeN/iFTUbqTPCOW6fT2AC74Nd/P3+eUnhM+AxK69udsGp
         eP+Ip6VaCw+H9J2k5x8GPXF5mRcp0q/47GQSoVHv45wfsIjNu6L8Im3xCrlqSbh/so+x
         zSLYNJKwI1aVjrA0QoGagbJEX6uY8F2cegHpUM49NIKs6voKf8V3E3RvbZfNRltBaXYU
         p27EkbHaa3Y8Vc9B+F3Z+0vigp/5XKAotaPkikpXqZRq9lmS7UowGAguNSQStnUgzso6
         DIwg==
X-Forwarded-Encrypted: i=1; AJvYcCW6i3h5FeDY8lGIdaYffIuEAhh2H0PAPqeneT14yzNz1enypwPISeVR8I0L9WU4S304M9L+sncWD9WHxKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQPwW8v+wJG7Rsp5z4qbjwJ7DM+ZFP1+H2rKo17+nSEsW4Dbv
	Yfy6dYFJs1sX5pOMU4rMD5rfY2gmJV/aQR4+C8gKl31KuFy0hplpkNJj3hxKv7+n7Ab+ufryDnh
	n5oFVzVMn0Xt3qyiFrGBJGaEFs0JNwfvRpYsmzJBsCSEHCnUK56QviUYctKKtFJWY/Sc=
X-Gm-Gg: ASbGncvn8wT8YARNDRvWKDeYgYm9g/wN2wBcvwvwczj10MNGUtQanBZJmlm/pU2SJ8b
	llKbsMRZoTf22eKspm4i4UFMeR3p1urjEKah25TttuM2HhNvALM8PhOttxj2lju6uEXfVvj0HdG
	UCgTHju+kc6IJeitOoDhhPLOXxLy7Sct1ikIHsycoXAnQMJApOL0IHgEnyhcbeq4S0Kun5z6oxy
	EcMLNe3+fsjTvj06EqS74E5pDOmK94IPiQhq6gf31zi6lB5a2Mbdk+LkBUZ2liTNjp3kCpR5yH2
	WbgYdM7njo7xg7WJW7vn5+RCGIZLTgscKGaIOWBDlIjbEx1Coc0+TiLiBlm++xLa5QH+II6wOPP
	6PtxrPaBMWq7ejU4=
X-Received: by 2002:a05:6a00:4b4e:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-7490d7927edmr23738576b3a.16.1750777898477;
        Tue, 24 Jun 2025 08:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiedZO03xFRwWBJi+2VpVp76Xjs34tS60jMZH2JYRycd/Sa/hfrCCXMDiZ0p2GGGyen2az8g==
X-Received: by 2002:a05:6a00:4b4e:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-7490d7927edmr23738523b3a.16.1750777897936;
        Tue, 24 Jun 2025 08:11:37 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e0978bsm2003208b3a.21.2025.06.24.08.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:11:37 -0700 (PDT)
Message-ID: <43b978a5-c1c3-450d-8340-dc1a6dddc884@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 08:11:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix suspend use-after-free after probe
 failure
To: Johan Hovold <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20250624082022.15469-1-johan+linaro@kernel.org>
 <aFpingRwP3foaKJ9@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aFpingRwP3foaKJ9@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NYEsCjrt1pBEpdh8Tbdj7fEMlpluMdvW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyNyBTYWx0ZWRfX807B2HhdwGJf
 JWWwUnMX9cs96nYGcOCzkm4YV2fx6G07IhHNIPUiwKERRL2GeZJLYgkS82mV9Sfsd5zsY/2i9kd
 eLSuU2xJux7VhRjQ/jF7hbjX8XTNCprSTuxMzfQtDANCoKsFLHbikmTWV0CgzXtF9bAo5Y3yx1E
 1YzytyogvIvnQCQ+olEwvpO5+XP0t9hH3xToFCQ84SCmxwL0D4U8Cd8GwfgbQi+MMZy4IA08KCx
 1NadRGw/TFWu6AhKZwq2es/yvxSVPCwvW526vfPXsaZ35MjkPpp4YlJ3S1LkcQUoaMB//QeNk2O
 bDtAVKgy2INEeHxHtX2bJuhQ0RGgO2OHWF6iKZLvYEhBtEg9hlkf8nNi1G7ZbzM7UCLSQoRo2jh
 AgPvt/5tJwPeRNEER1Lk1BNzjccUQa3y2Fgae6SzG6fUFJmRvFqv2VBUD/I5XR7ZveyIqw8x
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685ac02d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=oKBW_v6FYzd1ttqmKkgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NYEsCjrt1pBEpdh8Tbdj7fEMlpluMdvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240127

On 6/24/2025 1:32 AM, Johan Hovold wrote:
> On Tue, Jun 24, 2025 at 10:20:22AM +0200, Johan Hovold wrote:
>> Make sure to deregister the PM notifier to avoid a use-after-free on
>> suspend in case core initialisation fails (e.g. due to missing
>> firmware).
> 
> Not sure it matters in this case, but forgot to include:
> 
> Tested-on: WCN6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

I'll add that.
I'll also change the Link: to Closes: per checkpatch:

WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report

> 
>> Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Link: https://lore.kernel.org/all/d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com/
>> Cc: Baochen Qiang <quic_bqiang@quicinc.com>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan

