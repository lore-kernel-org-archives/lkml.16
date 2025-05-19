Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB273283CBC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663464; cv=none; b=Ok8/4/7/u6sdbJyvBhJFyQi29MTRlBVE9LXNN3jmM4koUWv1jo6bFbiymxYKVzWI+DZaeYpkTrG4JeNsn5yzA39eS95/jfnepszELMhuPBJGDB9PDA6wIm9oBe8MWBXP8jkica8FvRTQ6zNXSfNSP+aU9rxs3sqex+nj5G0YMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663464; c=relaxed/simple;
	bh=mTV4BK2qfjbUtqotPH31b3r0RSBtimJqNdwrEbp6QFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0zrvW7zf0zLPXCpgOdXKVykIQcNgBG5n3bctPFXAAQxmam1cTdTyn/5m0OVYSS2vHbWjnC3lIzkyFhjkgdGLxMRWwy5AEJqoiN/i0XH3s1549G6m4LGuOSRKZEZVjCQiZqAJ54+UJ93LNtpacz31uF6UQxAauQPz78xPqlixcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tarx5S7D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tarx5S7D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dSf3002214
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kkHo6XHPeTMOyNCSzAjow0H/
	jYOdseS2973aNB14vqU=; b=Tarx5S7D7AXAHXZFO+mQn2m316NJRSaqZrbLHVKX
	ljvTLTHt9lk4EMcow8w3XdGDgT6UuHhuPvXMSpVb8MAr+X5fCXjXYLK8yfVqZqO0
	doPbVozq+QfJKzzoAl281oXWEzN2b21RHgZosEV5FhkSZOChpn+JuaKxXjDM3g4A
	wdUPAeq8g26lLFrgJLYzimvxUTux2zPzIOb97GcWajTf/G9PVMJ2ltughO7hypZp
	Xk/OkUzoQSRR64kyihud3B5q8PWplVklsW2MsnKXl8yOI+3Wq1vhi+7bTN3Zx4GE
	gdzZqiLYqd89cwsJ0YazyDCLgwkkshuKUZBCbn07iYCSBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atgvy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:04:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742951722b3so3664740b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663460; x=1748268260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkHo6XHPeTMOyNCSzAjow0H/jYOdseS2973aNB14vqU=;
        b=QJ454/t23PIFiFE41EK597Conxk4lkuq6euHMz9n7NA4Z0s5Aj/K1xbUBcpTqGcHTj
         WGlBoh3PB6v2rUYzwZha66H9YoNNSGv7DPzeami/8+OZdsAiarZEiCER1gCByxstQIXj
         t9CYGPGAHL7OIA4ZoASg44Xi1bnGuCnnQ8NojyK0bvgaeh2Y9v6eg9fmKNYDC/Tx9akk
         2u/YxzNwa2bO9FJg03s6pO6pyKUstE5kITrhMpUzRnxlxYV5eReZMJIFs9BJLhzceGHZ
         aPM1lChC66boVJhHyuXptxuRm/sBXXMl0paOTdK4HSOHOfODVnE27IHroMW47neHiNBU
         NHhA==
X-Forwarded-Encrypted: i=1; AJvYcCWW6O1Dl0pdbHm3qtKgwzyZ1HTpphj6ArucPpQFPm2BbrRo7P3WGbs0Fz+nCsyIcQp641fjI4Ib7B30PXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSe/a8AdbA8K2R/ULWDNZEbDPgzky3S00ms90oDoz7ZbuY0DP2
	3Z+rcjPfqibeZfSDH3t5eX12En83+7KLSnWyFduGkFpxYYSblMbWO+XQJmlzLdLJW8zWGHBRa7j
	xcVCfFxQPawq763sLR40soa9rBzlkJTsYEZ8M+PkAxzSY0lrW9LApd6P2mevass9wL5o=
X-Gm-Gg: ASbGnctmuhdXpz/K5uLfAdvo5Nh+h3YXEbEzXvJzFiFY3pNdbrY2WCD9cIPlawsas9N
	OgS1tJDETjS3m4AqtQnftttMUTTKpjGFqBBIPJD34iqBl5patLALh0TKn4KuY9kxu+KV2qraqzB
	apwBe7VpIrtUamK7808vWcBjomJ8mN+QBLscQHP5N4avg71Er70xHg8iqdPqQ5x9ujzbZc8R81Q
	Q3dB+PAaQah3mHce5SKWeYEK9s0Eafe1H+Vu6ofimcI5Rl4qaK1J1NuEgL3lEts7ZjEwZmaietO
	FAFeNfWJRDUYtwLZjQN2y5KPTbGG9jTr/jhpjsabPLUCFs8QD3a6lUrkae0jp5vvmJI7lDE/ymo
	=
X-Received: by 2002:a05:6a20:6a28:b0:215:f6ab:cf78 with SMTP id adf61e73a8af0-2170cdf123amr19638869637.28.1747663459990;
        Mon, 19 May 2025 07:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGunqExUmPIanvU5qmKhM8zQx7HqoTyCSd4dzk6qSGPCbuorQvpI3kFvR+d6JyY1cXPKu80pw==
X-Received: by 2002:a05:6a20:6a28:b0:215:f6ab:cf78 with SMTP id adf61e73a8af0-2170cdf123amr19638813637.28.1747663459443;
        Mon, 19 May 2025 07:04:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701812esm1869721e87.112.2025.05.19.07.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:04:18 -0700 (PDT)
Date: Mon, 19 May 2025 17:04:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build
 details
Message-ID: <wcmz26zuregrhq37lu7bpbcteatnyuhio6m6a3h4gfoqlyj4g5@dx3kxnwrm3pt>
References: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b3a65 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hASR2W6MItGKdFUF1uMA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: LfGrVLRHgMTiWO_-fyVlUpDJtMZ0kEJb
X-Proofpoint-GUID: LfGrVLRHgMTiWO_-fyVlUpDJtMZ0kEJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzMSBTYWx0ZWRfXyc3mWQn/TwCF
 V50n/Q5MyZq4bX49VPJg6wdVPXiYnaWmbgRwmyGxUmxT+5bKhhcfrPxPHdnXi5xqq307wjFCUfQ
 /tyn6Vdp5On15qK1Lg0RlQa34btt2q9EDbfGniAyqZ5il325NMDX7pLzO9nr2xN87MWZaorjnPz
 NG3NgM98JzaRmPF36L/VaRkjtv6MypfRl+6NE/RNwGGShRE/tMuxT6PxY17vDUWYM73ZpRidvz/
 Nyu7zRjofgcwKWSP+IjxVeZ0rm6wG6DDKZ6fT2kOY3CozldgNay/Cry0xcQvvz6Qylms17ffkEH
 q6TbyU/5PKV5hD/lPgXAvhmFwMe02K0U4uhu9dC9aaZRAhmyCjZxFXaqs3GHvBBafIxXeM/Ri5G
 p+UxBG2yP0zpCckNJkkrt97W8qK1wUm0dLxvZh8sOqB0qkdb+s6pFIB0FlL/hyw31uBcHOUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=659
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190131

On Mon, May 19, 2025 at 07:14:01PM +0530, Kathiravan Thirumoorthy wrote:
> Add support to retrieve Trust Management Engine (TME) image details
> from SMEM, which is present in the IPQ5424 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Note: On IPQ SoCs, the Trust Management Engine is referred to as TME-L
> (Lite). Other SoCs from different business units may use variants like
> TME-M. For consistency, the image name is retained as "TME".
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
