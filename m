Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B00928934C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627254; cv=none; b=FndXs8fALzYtzBDBzqcQ77slXmg7uoziWowE2eyy6QzIY+jW/+mBSBtLJAwL5QdygwAaBzJ1CLvCkB4TD3YgeRf4SHNs4vAaVUpE7KuUxh8qCfhz7rT477VFDrTgf1royD8cZ9bsZEWeSNBUiPWYfVDDF/wGKeqQa0iakOXbic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627254; c=relaxed/simple;
	bh=zjA31ECKWrYkvp6T7RqaV1DJ7jIFc604unho5HpCUh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TW8mJAYGRyglG8SCRJkjaCfd287DSXlUiPYkBU0Qjrp3HdOyiMk/kEOqaXmlkA71qy+jlfvGXKIIivWfGBo9WresWZccHkOMy6tLSX09GgAXC03Cwwqs8PrEtX5eDCUw8aRbmpIYuIDncgWvLG0KOLPeT1hAp9j9KtLUqH0VV28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxLuGw4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxLuGw4i"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547BO8BL018182
	for <linux-kernel@vger.kernel.org>; Wed, 7 May 2025 14:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGluIw6NWJNNfPUxDeMzbPFoQEkugMbs6IrEIEEdFwI=; b=PxLuGw4id89E1aml
	6gV5ozGPCswlL9yuIGLr2dBSTp8mzQLJuaK670bAK7VHXfylNPmHlz/kmJkNEW8d
	VoXugREKv37J+sWjuir7/XdG7+eICBODoQfkBXVjC6Q3Rq2OFr8htq9nSaFJRq/L
	DL4WHqEb4ZqE5DqRG6PbXAue7XNJuHwOngGQ8jTd6PiXqvBgfebIWRXYJR7G9uFJ
	Oy+XvCGeY5DO2zLFBQqbwpAWh/TJh6A1Dow5MtaM2RcuBRznoUqwrYNiO/dq1KTg
	LeMoLAATRbcp5S7ynDqzPQ56aL9fZ/OBAY3iif2IAsfj+MUlUNouBhxODjnJ1RZD
	L5pEig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbdycg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:14:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ab5d34fdbso802806a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627250; x=1747232050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGluIw6NWJNNfPUxDeMzbPFoQEkugMbs6IrEIEEdFwI=;
        b=bNqktvj9gDMs3iTYlnzTavMdeRcafuODjMsFVPRNUrGhSVBo/wWVg9whL2RDI5baHL
         HKK8ZttWUnLy1+w71eCkLbP0LpuAlwEY8/tCEBTDCyr9/SjaoAKFJD6E8MEmzaiWoH/x
         O1HLdFSRe/EGAtP0jRqsbNPLIZ243VduCYJVCB+2MozCJSQczl1FIa6jN+B2AbaQe742
         suUwk1iqYa0/jl4HV5z5N5pWtzKXa48Nf5/4ghhpTYrdw34q04/1yBYiJGQ2qNprX674
         s6/3+KbsmatN6K1k9y2IPYXtEZLOcAr5Ksxd4a+qNNzW4joKYdl0/cAgpD5hWDUf4Akc
         R3OA==
X-Forwarded-Encrypted: i=1; AJvYcCV+AL2vLAcyIvyyYA9RJ8YF8ZDtSftWIu1TPu9Bj3eDqxvHrpp86E1RQ5SmafCL7I+g9OPWuZlVH1jN30s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWi8kZHuOwKe98VJNdQfpp4ZhTnZDSEVCcBGIsPbeoiSz2oby/
	BbSIPy5ITPlVjclzdoo5/SW4mjxBxXGtI6m86UI91jFi+a1vnXMUf1vEDQXiVcCoRGNj1dF2X7w
	SatWIH2vxjUNImTF35qeGqnp5YXJC025CW6UxHoSbAAkFySjBJqC5h6Am1egpD2k=
X-Gm-Gg: ASbGncs6wN8AQGe7ZETabGs3wK8m+5W5VgSWIwOlmlnxdlwxYY4fbEV5xKuafSiN14H
	wkM5QTrxX5o6W9dyPExJxzWa+BZJKjcoBkLviDe+JU/27TCyjiN9qtLvH919F3xFNwcXlQ4Qlbz
	CYDtO6Slz2wMmTIlP5DAqBtL3jvdr4bvkKy6HFPexLZq31OjtDD26VYjdJLhPM1yduAXSPHDyIn
	z+xLE7to4uhkv8A31eferrt8pygLj3LNTMcKNaT9pFLLSM+RTBeevzNf49JFbHE2GoSGST1sa5j
	HYnJr2FjJ1jKWP5nNuhzPrxXbn4vU2Zh3Sdp3hol/7MiGh4IYXlMscU931PqRrUD8r4=
X-Received: by 2002:a17:90b:3848:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30aac1857c5mr5519686a91.4.1746627249751;
        Wed, 07 May 2025 07:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1V1DpH2j5TQAnKSXjEhB0Z9ZTZtIJQ3RIw8lPQXZTbkyLn3CbGTR63lRfuDo8fl3HrCpE0A==
X-Received: by 2002:a17:90b:3848:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30aac1857c5mr5519620a91.4.1746627249268;
        Wed, 07 May 2025 07:14:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe2248sm156879a91.35.2025.05.07.07.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:14:08 -0700 (PDT)
Message-ID: <608a5b08-a5c7-46a4-adf0-7106e4d82250@oss.qualcomm.com>
Date: Wed, 7 May 2025 07:14:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E9yp5CBhxK4E6jm1aLay6-DeMCcNF8eT
X-Proofpoint-GUID: E9yp5CBhxK4E6jm1aLay6-DeMCcNF8eT
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681b6ab3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=4n9vdfglUG3wgorB42cA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDEzNCBTYWx0ZWRfX8XtKtZba4cZi
 ebuU0GHYz/0MMdFGVAFJMYcuoXZSsUgDrcF2pqnSUgun7yIIowwVtFsduXnXMvv7GNp8XQSX7ep
 WiaK5/TLdJdv3DG4E0asPCLYgfCnFEF/mYU6bQbH+QN5P/8R4AV5b1JYBAL1dyVAk/u4b2hhQa4
 bM0VQcTEyXb5gqxYyzDPlLxO5TYa8gLPifgbZEcpiJKw08nBuzJndA2yRjRVw8m5T5oqFPXuP4H
 fN6A0QXLQl2o5ORlpCrt2ayWl8EUPJEyxM7Hd7v1NIV1s2RLBwiYHOmBc3ykZtAarpVyuLQ1bfn
 mO/JXKKn3K7i76fJQ44yQkfVVs9ys2avl2OEqjXN+voHgWuDEvB/P0JvLXk6T1Ul16zhw+glGfR
 XFfVHewEeEXince7D6vjmmLkh5Onz3Zxn1IhAoUw4hwT1lqBZJJxJ51jdIhwPUWjE3IGWyRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070134

On 5/6/2025 7:49 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Mani, if this looks ok to you I assume you'll take this through your MHI tree.

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

