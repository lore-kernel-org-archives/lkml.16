Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE52F531B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750207082; cv=none; b=COeSh+uH2ekMM+a0d8vi47wk3gerxTTR7s9YvNQFxTlp/Bs4vdFJhstdzUfsshInZ+Fp82T62CatFMl/TD9IoCwc2oY7c5xt2SUQywtNK0o+UM1oh6oN2WaqoTJKcmojfb5Xtio9EyIIMBgEo5bBpuiDZzgDqsa+Ei1Bhiwm0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750207082; c=relaxed/simple;
	bh=Rt6my2o1M0e/pISpG76AtZ0sXNGnasnX1avz34XtJ1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhtsTAugv1aA8tcohqyzXPLQ1cUIGFSSQiDUUqA3pY4PSIh1J2JYv7eWyuljmcJxcq/QBJfX7ADAyIIjfB1mPr769URNe1A0lgy5ApKNof9dXlZVmNdCtW8Z6jYv8SDbHZlxooENP+ybekAzLP4+tjkwr88MUAnEkFXVF/QWJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLODXMmR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLODXMmR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEGnHF023290
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtsxo71Ss+Fxx3eNA8h7CzAEpCZjWON0qU+YW0EyqVA=; b=aLODXMmRv2zH3N8I
	SDaywaOPsg4IGbq56jOvuTjgBIex0DHemod94S2MMQz6xUNbp3OLzdYz+naoNPLK
	1biYS7Kd5vEL84qzaTVBYLs2E7Sy53f9uReGgCF/twh7k0rhBUcTsJbbwk2qRkZy
	2MWEphLIiNmGDoLkUGPWuO0wFHV7wfhKLcoYpymJKveVGpQVjMLtcNkEVC0iwlDJ
	AZGoBe38IQ1fmopZX+4VRrJCvSesiKI/Z4nvCgzI+b1WDhUR3eWjmIbeafdRo7iG
	svvcJ3CzrBzblRt8jJYWQNTEnH+Je+ZZdJmLVIKYuj1NcgC9ufoDZvUExdMnaMHY
	rzRaVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enj3fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:37:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce66d7cso102757725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750207072; x=1750811872;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtsxo71Ss+Fxx3eNA8h7CzAEpCZjWON0qU+YW0EyqVA=;
        b=e3weRsITjAciSfBCfkaqxDBndWXHpS6BR3U0CuSKiZZnpZu6V/kfodW9gnxGlCxaf5
         aVUKsVlr7x5JiiK1nte82rykeuBNZw4kw3zLMcTqkNN16l6IJSYAPGe/KZrpd3SGoY7N
         jSvaTsCxGSjF3G+6wFVLLwG1DVSVyLKjOApCoMg5hSDnF4rouc5PvCyp1gBILrCRVA3q
         Fybrv6nXKhI33fbGK3HyWc5btBJCCwk+yHc/ynH5H+BiU9vGpBeE/hbPH+lBT2JXfodP
         Lb+leLmIKtkOXEwsjyu9TXLorl8zrjyuhIETXjTSEL8MKItqFSLUOyc6sm+1WHLvJpCE
         r/Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVqotq6iNhLk+joR/tkFn8oTD+MYPwdPfOm8ZPABxG5NIT9oc5rwDKyrN2ELyS4gFrJssk8zBHhyla27xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfs6Cvt2nOSJ9Ge4COLTS/3H2VZFFvQp3bSqs5sQ4wBM8ITFne
	8LXUKvliST7dsp2L/tmtpX+QbeuPlWQfiI2qtTkz8wJsnV+WqDZB+mwMKJpEJEm2iqS2ECzAIaB
	83gRLN3BWP02yyo13POxAvTFjsh1Tii85FHgrMfcbe8oemMfeTcD51QwCY5L1eM0ELkEEJhrW4Z
	s=
X-Gm-Gg: ASbGncuF/TH+7gxjM+PTbnFOuD8SJbi/lUbzEblWlIEAMOT/gXXUrxcm2AuvdykTJgm
	HHdhUQ03BXWK2JDQ1XH+iWTQv+XSOh61gy25AXacoTnOi9+kzGVKgL0BjBTxDTnYzQJEcImPu6C
	CQG+UDYSKnsKV8zz5csP5cZRtb+VMHvsjcDL/vlMSRRJC1I5+bl+5Vem4QQsmT/iah3DTmXpHg0
	WfRdqSFCoNWfPI8TxY0d3241de2aBsgUHnSt2Gl34E3OSVWH4elir99jMNvKjAHASbOuvQPhomv
	4u1ulLOxCf0qmVEDo5ldvey0ocAoXkAU3443PZJJndY1Et/9Whsj5p1geSAwVfx8Fki/cKlSbXO
	NvWsKhqAy+4JS2lY=
X-Received: by 2002:a17:902:cecb:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-2366b3c38e6mr230344375ad.37.1750207072214;
        Tue, 17 Jun 2025 17:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkPzSzPmO4tfjjl83hquV3ywd9TVPJ0+3DO+ZDgWpwWJTWPeSP03HZwobSq8Al3QEM0CZfnw==
X-Received: by 2002:a17:902:cecb:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-2366b3c38e6mr230344145ad.37.1750207071856;
        Tue, 17 Jun 2025 17:37:51 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23699a75d65sm14373275ad.91.2025.06.17.17.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 17:37:51 -0700 (PDT)
Message-ID: <cbd285e8-9ee2-4825-a0b6-da64fbd6b71e@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 17:37:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 5/6] wifi: ath11k: choose default PM policy
 for hibernation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
 <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
 <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5m2Dp1JFSPmfDZ9Tpo7dyObguwh8AuzT
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68520a61 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=IUDzS62LCLz5u6N7BFMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5m2Dp1JFSPmfDZ9Tpo7dyObguwh8AuzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAwMyBTYWx0ZWRfX4xWbhP2+ch8S
 lLOVAV4TxNQavUS8tU+NEfrorR6acjescJD0yvsgUEh8qyDeE1b9fiw9hJezqnnHgAyzI/uYC4l
 59R5hYN3HdpNtIrHyUlT8UPY2qANI8VV+ZqJzTBXWYRKwtXIP3DSAMahzstBQHefDGxIHe7hGZ/
 6FkY/e7n5cdfDbqlXTq20JupIxxJPwFlW1zJWt5diiSmK+lsYCGxpBaRiW5r8YdZGs5AdqSHJGE
 lrrLuyCTxwmAbSHbYdPuO5cmxtDTLkRBD+N3EX6d8Ds4z06IOqHhhgTIPC3/5MEGn5ia4+cFQCB
 1Nm6K4EHQMtviKERx1Tm0nDaV0RlrR5MVP5/yrrYSYBdV5B7FyYaw8Za4cAaOprYxzW+XU91Q04
 dKAe7LN7rl26YbCT1DmC0SeWhy38hLrFH/l4t6o0KBg0leC4tUPAFUdi1X+adFjH6FYeH/x3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=680 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180003

On 6/17/2025 5:15 PM, Konrad Dybcio wrote:
> On 3/28/25 6:32 AM, Baochen Qiang wrote:
>> Now WoWLAN mode is chosen for those machines listed in the quirk table.
>> This works for suspend (S3) but breaks for hibernation (S4), because
>> WoWLAN mode requires WLAN power to be sustained, which is not the case
>> during hibernation. For hibernation, the default mode should be used.
>>
>> Register a PM notifier with which kernel can notify us of the actual PM
>> operation: if system is going to suspend, the original PM policy is
>> honored; while if it is hibernation, overwrite it with default policy.
>>
>> To summarize: for suspend (S3), WoWLAN mode is chosen for machines listed
>> in the quirk table, non-WoWLAN mode for others; for hibernation (S4),
>> non-WoWLAN mode is chosen for all.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Tested-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
> 
> I've bisected the following splat to this patch, still happening on
> linux-next/master, WCN6855 + SC8280XP CRD, 100% reproducibility 

This smells a lot like the issue recently fixed in ath12k:
https://msgid.link/20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com

Baochen, can you look at the applicability of that patch?

/jeff
