Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53623909F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674537; cv=none; b=Kc2bkiY9o23aQd4oANoPllvYgY4t+v70rsM1i7caxYlLypRFElad0qCX3zPOMdqQeljbcWTce4/IClLmEGb21pOMTJfIsQpo86PUR+AEai/0p2KaHkUalGIs2ln+sSS6GpRUpxC+n+NHKhTDGJW6XKflz5fyS0nJj8a9H2yAYx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674537; c=relaxed/simple;
	bh=Lmd1X4saEKFxJ/aHogwC4DEZauILywq0tD3Ta8r2+d8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnvM1dhcKoCXR324uZ9lBYqUWCw5RDRsw3KyyyCay/bHxpYVtl0qDAytWDaOXxd7cBYlcb47uRvy0F50DWDaC1z8ckLIH602pC6fHL94h3l6oWT1Z7HUyYThUCa1mIfDCJqE+9FvfjKSmza+2yPIAhMbJYateSvVaXzoVqeGjv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjBId7ON; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjBId7ON"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9adwJ030835
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oY/pEWq8UWiPBmqLuAws8oKnQaTNtbux5pP95n03QU0=; b=HjBId7ONNyjlnNsw
	7eNy0GZ3RTUo3xMwHCo3sI0pFTLsQVU1EIVwu0BEeLM/fVHJMGn5PgW3efklQJeU
	FXAjOvrFDw5DsWKzluzWxOUv0aNGFFLjslmKRK13Us7Hbhyc3C/CHzETATTxi1nI
	Mnfd4KeKtvacmWcOpFofySjSh1+fvf380VIzBZLpsn86q1zg/tt3v64/ja5BH3pR
	65a/lEUqK9TA8ZiBQQ8ECSEXKEyTWPk9GKjcP0ZP6Ks6QJ/uhc5Jpyuq1W9oR1rV
	60AJrYfHL2uW/CHQA3w2GJnVRQFlJiS5xdGSl6/KGLwqhwgM7GpsQ0gC7NRyKKjQ
	v9mzwQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7tj7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:28:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso103250585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674534; x=1751279334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oY/pEWq8UWiPBmqLuAws8oKnQaTNtbux5pP95n03QU0=;
        b=ShIPW6noXod+OIZ6mE1XAWTRXBH8SsU89iBO3visn74sG7DmBMMw4T+L+cgaNTywqG
         xhMO2IAl8Dtl9WpEC/7t7m8vaaOF0hkA6i9zpNgyetnCz6bJDRlt1mkqpLa1uT8ls11W
         dpMwjuj0mSqVI5hC9mEfnGBR+HuClk7L4cOLXaHpvNDype/fyOI/+d1471+qsu9UbVRs
         Duk4V17Xs0g/OV/ALj0qbC3sFRYZmTWyt7KrKFjZHwrTo9rnasGVnDbZ7HNiAqjI2VO8
         SDccqSPuVcFc/KoAhxtfQbc+qj01ISfLp7VtP7djq10bp+fyn51CN2HetYzb/IjVzR3P
         dRkA==
X-Forwarded-Encrypted: i=1; AJvYcCVtGMacB3brLwfl6tKIc/CkvtJxPrio9zMtD6RYEgTSAjGTU/+esrbpDLOpLH5j+sifZTgmKxOFwyoMFEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuJlmE9yAUcaH2KCs4R/xrnz5Y+EdjybZwZ+x5AI3+275dG99
	5n+ZVioaYz1iDjXe6g8YtuF/SFIgGXtGHHRqZbg3l9YGOIZeTyrPMa8UOPT80drS3iShBPwkW9/
	zWEwtmy9CiZx9hKSQxQa3Au5zFw9hulZUllu17H2dh961DhO/po7YatSj07bNggSF9q0=
X-Gm-Gg: ASbGncsWryQvSthvAClFGaGk+U+V6itGknw6B5fYvSTcj1AOOV8VT0ptBjNI9OdXx2R
	U8UHkLv+8YBPcIawosPoIn/QfBjqP1GAOwEj7AmF4EAm9dx1e/w3IOB19WtHxEguWzwwjS0QbnY
	WwVJb3hHxSTvvRLsJ3aCLcvmyTQBjvLYf5OfxKvPD1R4I/BDNDFtAvb6pcNDO7hvHwPE5WLfKRG
	Imu+cKJ39pSWERMr4sckq/TlC+kqrxT4I9whSr0nL2HE48O7Aa7u7msGjk9nmsZDqKakdZyePt3
	ESiBej8MXgRAIh7Ay4N5Umnf7xiWCUd1wGbrB8AiL8Jo32pj7JVce6m0Bo6o2Mf9iShvekydS7f
	+e3M=
X-Received: by 2002:a05:620a:2788:b0:7d3:c688:a587 with SMTP id af79cd13be357-7d3f98cc900mr531989385a.4.1750674534099;
        Mon, 23 Jun 2025 03:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7wkVQmwGEb5hIUCiShyOZhpRs68AVT/j2EwCWKmfhZrzHdWrHzOcRxuA1TNuM80/duXn3mA==
X-Received: by 2002:a05:620a:2788:b0:7d3:c688:a587 with SMTP id af79cd13be357-7d3f98cc900mr531988985a.4.1750674533599;
        Mon, 23 Jun 2025 03:28:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a06ed21bsm14139366b.29.2025.06.23.03.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:28:53 -0700 (PDT)
Message-ID: <09bf24d7-2998-4a15-9b9e-ba476fc08a90@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:28:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250622133820.18369-4-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fj65lAy8nJwulWBnapjuPSaNn-6F33Uj
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=68592c66 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=O7bdSeR8FQjTShd0N1gA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MiBTYWx0ZWRfX79uuaOAutw5y
 iDrq3+uPv+SwgiyOoxVCG+0aMjl31qSk5XjRsCdFuXTZHYebin30YLzjQo7GES5MjDIx6rBaeGK
 bwPSKLhDxKAu6WmONd2sC7VTYpra7I8tE3a9CNQJ6/aeziFVz3tVpdXHzY7YrDlTonJrReVdDgo
 PaowDpcj2SIqf+YVAiBDD0bhvpZSpvinXkZoq8xfZx5jRgLyvNPVxcLlucibBQVd8vEIj3Ic9lg
 tCLT6SfY11bH/fqYiGNEvDxf0SLPkv+LJAoU4XF/hfG6P1MOBMJcypUHd7mvNZERdEpUpoJ2gc5
 VE4yaOM5LY+ssa781HmXwsk1pg+42IlXygO2A/KuKYced7LBk3XccS6b64Ft7KMIWIrCRnjs5LU
 b26hn7J2Jz68+u0kGgI5LWsJkSz8BM3pcRNZTMPInNZlX5b5lxG/CE1cg4Lut2xcP/zpaS2l
X-Proofpoint-GUID: fj65lAy8nJwulWBnapjuPSaNn-6F33Uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230062

On 6/22/25 3:38 PM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. Add changes to support
> GDSP remoteprocs.

Commit messages saying "add changes to support xyz" often indicate
the problem or the non-obvious solution is not properly described
(which is the case here as well)

[...]

> +static int fastrpc_get_domain_id(const char *domain)
> +{
> +	if (strncmp(domain, "adsp", 4) == 0)

if (!strncmp(...)) is the common syntax, although it's obviously
not functionally different

> +		return ADSP_DOMAIN_ID;
> +	else if (strncmp(domain, "cdsp", 4) == 0)
> +		return CDSP_DOMAIN_ID;
> +	else if (strncmp(domain, "mdsp", 4) == 0)
> +		return MDSP_DOMAIN_ID;
> +	else if (strncmp(domain, "sdsp", 4) == 0)
> +		return SDSP_DOMAIN_ID;
> +	else if (strncmp(domain, "gdsp", 4) == 0)
> +		return GDSP_DOMAIN_ID;

FWIW, other places call it G*P*DSP

[...]

> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -18,6 +18,14 @@
>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>  
> +#define ADSP_DOMAIN_ID (0)
> +#define MDSP_DOMAIN_ID (1)
> +#define SDSP_DOMAIN_ID (2)
> +#define CDSP_DOMAIN_ID (3)
> +#define GDSP_DOMAIN_ID (4)
> +
> +#define FASTRPC_DOMAIN_MAX    4

What are these used for now?

>  /**
>   * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
>   * @FASTRPC_MAP_STATIC: Map memory pages with RW- permission and CACHE WRITEBACK.
> @@ -134,10 +142,9 @@ struct fastrpc_mem_unmap {
>  };
>  
>  struct fastrpc_ioctl_capability {
> -	__u32 domain;
>  	__u32 attribute_id;
>  	__u32 capability;   /* dsp capability */
> -	__u32 reserved[4];
> +	__u32 reserved[5];

This is an ABI break, as the data within structs is well, structured

Konrad
