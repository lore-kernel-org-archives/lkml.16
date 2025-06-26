Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED32218871F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957140; cv=none; b=sUigo8eRWH7Fkg2LN43HBjsdaSevSOq0lhCcDx0U37Fw3ATXNZkeg4mcSkphT6UVFAZHno75T8tMTyAAbJj7FrT5KXf3NTSW7gKzQnPVAu6Xgx3dD2Z4UDEbykahSrXZXCX9ijofp8TeLf5pdLMzHSI7eck3H9f0DhakfkcBqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957140; c=relaxed/simple;
	bh=FP0OWrSM5UFdwpJyAWRkGkLiWZASZR2VM8uql8M9qZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFeFxYNmZ+3fNAHvsQE+sgai8T2Iu+D0oXhF4yUID8k6PVwx6ljLnrsfiq8OXx04OQMkZtatI21wru2LhpvFCHRS8yx2m/Wsaasx0wXYmBXQ8DqMqtZsJM1g1w7Embi+l70xE94aAwVX4WpqbYjxjOH9nR08AOtU+7BaNTK5OKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8deDrJ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8deDrJ0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9lFYm013200
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFPPqTu7MXA+vyY2s6jE+8VmboVurKBM4dXe7ELAAi4=; b=f8deDrJ0pdWBJwzu
	KRooBqZTRkvta3YcV7jEhkrDITXu/O9awSvIhho4e3PcsDq5gKOk8aNE0Ti/jVnC
	Az6bAgBjyoyom0ZkFORwQ+hG5qDcG7eHFZRsQybx435lb1OrQaZIvwRzKpci9Ds1
	b1Lv16j6xO83WFO/7mdNanU51UJTDFhwC389RE4BIKAzR5NnJ4QQG6gSgzlxht5r
	FMBEJ01LMfIxIBxqCh3yNJlgn0IWEvKCD64B8wxj8KbIGB4EN6+LjgF37rxiP/aj
	xGeLQWC+dkTTmLroyVQSbA2piM1gHLexnO3d77YwkOk5GSF/eXwxFAv/mz3h4HW+
	SlATZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm22n3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:58:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-315af08594fso1267220a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957136; x=1751561936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFPPqTu7MXA+vyY2s6jE+8VmboVurKBM4dXe7ELAAi4=;
        b=oowhSl+k/SconJIHBUv4BwBhFLe+yD2dAt1dKHVtNDoQNhAImYB/mEsfya1v900yVr
         OUs8jNsWOeCisWdKPsDh4ydpuW+5y+mttwTlaYYjp7l19QC9BgFTYLSh5jl4v77dayxC
         2rnPlgrfK43glTWeP5OgBc+lmZUKyTBdM9X9nvmq2Be1cY1czgRGL6mYSeA4YEIpjNF4
         VKznMEpWWYMvX96aumvFdc5L9ErYsvlAgQC2qA42jv23j6rC23Eh6ApJK9P9F++dkbKk
         jjw1DTVvp+6iVANRf4ZaHsowVk+DJF4Q16KP+0467vOZqAPOn8qeTyQhSbg/5hRJEpzC
         WlLA==
X-Forwarded-Encrypted: i=1; AJvYcCVIv1/FMFP0YJ/5y9XeeohDCHsAvLHXqkKyv+Za3C8u1wp1ZVn5ye5nreF0/PlOer7fY07XCrVxKdMGv6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJqHnGxgTzMbLGO9Kg54WNT6OSd2m3pYHr8e20yqIUiZdbx0rY
	SvQRJ1PBiHDblGaVkPdpOboSRSBPkTW/4Tsq/0eAi+HdlK1RWV8OSMWMKOhrfz8hTvmaJa8aejk
	zQZzm9IJ5oCkKw7hKu2YULe0k8ScX1ZF6IygNnkWYV+hiTPPaVa6Ehfr9qrBxka1T5bw=
X-Gm-Gg: ASbGncuuNdE5My+enHAI2VRlcuEIOmI1uCY0hhRf9+vUBGKPUpjyNthxkgumcWVlVd3
	sr8Qs1ACmE28xMQMe747YBQx5cV2vBY5oX64pPwuyFaltl+JFHtvC6M4ijNFGuUZIteqGOqlOja
	mJGRSK9iA7xk2BIM6A0vDuNGM0mdb3HT2bGU2pk6diNKyFdLETDHAQcg5HZOtLMHVklkae4bOWG
	MGInhJOOLnztacnzeEDWqkDXYzY5ryGzIT5PuAdc7OfXTUQRW8ugrI4FauNErXnsPyeI7PmbEc2
	++jOLtCJAQmRu3WcqzdUNQvWhZGLu2M1xhsvw7TUY/1S3VUjnDpHP2KP4kOmLx8DeIS12jY=
X-Received: by 2002:a17:90b:582c:b0:313:1a8c:c2d3 with SMTP id 98e67ed59e1d1-315f26896dfmr9569154a91.22.1750957136299;
        Thu, 26 Jun 2025 09:58:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDpfopUuG4hU2Yb0y46Ll3Pqz+c1+9LjOPXninqakgris97nlpW0Y2qwrsu8JaSPMiEtOk7g==
X-Received: by 2002:a17:90b:582c:b0:313:1a8c:c2d3 with SMTP id 98e67ed59e1d1-315f26896dfmr9569125a91.22.1750957135783;
        Thu, 26 Jun 2025 09:58:55 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.255.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5428ae2sm4932845a91.28.2025.06.26.09.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 09:58:55 -0700 (PDT)
Message-ID: <27c788ee-b12d-cfe6-3543-f320c4b7fd72@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 22:28:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: use real noise floor value
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
References: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d7c51 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=/xG1ZwzdjF5UbGEDupzz2A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-iIeHy2jdy7NZ5vI0E0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 1YO-PqqYQZFBfay_rBBAQ4ia-nHGJS6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0MyBTYWx0ZWRfX33alou5e3jRx
 yhYm02iIikmY74BpZccBB7UtsINzX5AXObHTWwpAxT7nJb6iw7N+aWo4Y/p8ntMxgfsvVluIzid
 EIx2orNA0eKyqrScCJvyWNuPNh97UqP71e3c84sUJkIlZBDI4PGEPDm5SnsJcf6E1KqOlu4Y/Q8
 eeMQ0b/LmQSuAoG9aSChP8osBYU+3oBn2W2eBlK4FSuARhTLuljh4rsEdWLzBmxTv9RGGUTc6Gr
 YsCBqpo1wjOFQ8Mo6CTlKMm0BXTyVfVdYgNXxxm+ZVOpBsxUQEzA77wrARhSixEtK2J6JSRzAMj
 HTfnjAlKKb2qLGSz1HGna9n25FReZs8OESXPQgZyHK0cMYwgk4csHNrFwDN5JWmDuBoVk2LuKra
 3Zz9npphTdwblb1aBi8fOTWaiT5MV8jV0Y9kEA6MCkVPOXCwl+LeT2duL1om8T6RVXUEZmCM
X-Proofpoint-ORIG-GUID: 1YO-PqqYQZFBfay_rBBAQ4ia-nHGJS6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260143



On 6/23/2025 9:19 PM, Aditya Kumar Singh wrote:
> At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
> value, providing an estimated noise floor value. Consequently, the RSSI
> value is also approximate. This works but however, using actual noise floor
> value will enable the reporting of the true RSSI value.
> 
> The firmware possesses the necessary data to determine the actual noise
> floor. This data is provided to the host via the WMI event
> WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
> runtime parameters needed for calculating the real noise floor in dBm. This
> event is triggered by the firmware during channel changes, temperature
> offset adjustments, and hardware chainmask modifications.
> 
> Add support to handle and parse this WMI event. Use the received values to
> calculate and store the noise floor value and use at the required places.
> 
> ---
> Changes in v2:
> - Rebased to latest main. Simple conflict was only in wmi.h. No other changes.
> - Link to v1: https://lore.kernel.org/r/20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com
> 
> ---
> Raj Kumar Bhagat (2):
>        wifi: ath12k: handle WMI event for real noise floor calculation
>        wifi: ath12k: use real noise floor instead of default value
> 
>   drivers/net/wireless/ath/ath12k/core.h   |  17 +++
>   drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
>   drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
>   drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
>   drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
>   6 files changed, 324 insertions(+), 9 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
