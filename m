Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942828C5C1
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926396; cv=none; b=f3ytHCpbhcVWJkHTDRJ3hqkNQ0hGKGJYz+OaH0qlR0Y4UHwAC1tOwFEwTgfLBc1ZTsBCh+0GweCDYkuzoPU5y67vm2NkXgXVLZe1tt5u6QyBwQvS27CGH5AuU+Odmd8TjD2EPvpiOFRs1AHJ3pYU4JnejoQLgKXqaZ3JmyF5Heo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926396; c=relaxed/simple;
	bh=mEO+SQ66q9f9bw9yAxTeWTvOGdYchecNjKdNFoT1k9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwbsBlb9GQqoC1icZRsjH5NkMvrz9ypN6myEAPjtDTgfJ0YtJV/IDtMWpjqbFOe6I1DgWZc31vk1Xpf5cJPh4eC5BcBHbKvDp/RjECGZMrY3R0M7Kxy6DnT0UydJV4FNBmjGP1iwzlevcqQic6dx121iHP+eteo3zsJlUkp3Jw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVKgPZpF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVKgPZpF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7cCW5016898
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2ZZQlG8j86gUKyQclX6XprA53hnoYhy4zTXw2h1Huk=; b=YVKgPZpFDoHcUBTW
	yUth7s0dP4bliKVMvq7S4C2lsJ/fh+dB1JR/Cnn4Z+cpr9HoPL+t3Hq1DIXKe24t
	EKbT+Pmn4gBq29RZ+ON/vLl/StcUqeAFp2sCFqy0R3nBohP1/A17z0yq7rmF9myG
	Uo2yvC3Jy1GmsSCENPVvI0eF/Amm0tll5Mv0zoubMA0Z29IIJISk8l0OnSEi5EI5
	1PN9DZwacvrFN5gAK3DsKP1h0Qx2iFMyi83YrdU/su1F5qaixZQz3HHYy+gV5jKj
	NMxUiRlToGQtl/iTto7kZrQk/+Zn1TXUYAxdlii6Ik8gg1HT6if21j4exlzQNso8
	xJCHzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9xrnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:06:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ad42d6bcso221579885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926392; x=1748531192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2ZZQlG8j86gUKyQclX6XprA53hnoYhy4zTXw2h1Huk=;
        b=QLSjsjjl3BFk7B6y5VRMD1vx3B/0+DIk/8xW9Qka+PMYv9nsO2tS0jNhksL+1ziLbj
         KWbkWZw4X7sPqCnU/ZAYdWUG88DRQ2TygFEbmrzpTb6A6m/A5w2OdXJ/Hb53Oq1qnof4
         zc4VppK85lVfQ+8rB5bb7RD8qqvj8QE3n8k2XPoZqo03oa5N9F+7P7OJIg2Ru0IpnZqt
         l2C5gG5l8Gi6upI42HLnHkjqWszj0h4mxA3X0Xh3s462oU+N/eV8VkMtPrDYnIKsVNBC
         A71XTwQ7SxZgi+udcUt3JlldMZ130c9lObFbfA7/dKrc8ML0bLDN1uUs6ska0OxrA7yL
         C3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDln2jglVqao00iEpz9cIhT2jCouSQ/HYq8iAA0tq4OGGCyU+sOKHrjAk/ytYAtfd52MUqFILm29W/ZbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8NwFUc/i5NsqnRsYmGO1AT+ztcbEe9xf0LNWpHap0nCArFHdt
	QGYVPFts4TIo/MqpPAR/Szr6882X1i50lGBiePRpJ/Wt+ibgGCQvlkUdWMrDXy8suShuun+el3/
	kt+9u+EVvlO6tDrvlqlEFbyV212yhB7Jb7SAE+K73A/q9Y/8hsSlNeRFIMkat/6/i5gA=
X-Gm-Gg: ASbGncuflY9Y3A8Cl6S0CpZ2XFi9impNJjCXUG7pdGxwmeJaplFzbYBTpDen/BGkB0J
	bSZdwNmz/a7h0PSnC+YpusEtmWoR9iTEFH/uXjWD1apw2VqgZ/YMnXSp9+q2iqXaLF32LWG5/2d
	tMfDSgfOiHh3jnSGxPKAJl1axWiTcM9AHgvbwrfmFGvxiAhZT2P0LQfFw+W+KSH/vtLcWlyRZho
	KUupLW8ZLaeHHhBE67fTHTKV6NeOJ2StEmajnd2bBYa55alA4Do8JDwn1R0TJgWkamBTWigXChh
	eneExFs5o0++Ngkj7YYMo1KdrQ4C8Vk+q6mZwqphPkaIdxTs34AjNSgIFgJ4TMWOzA==
X-Received: by 2002:a05:620a:6406:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7cd467be344mr1502752885a.12.1747926392042;
        Thu, 22 May 2025 08:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNzVT9npK6d+E8iUfm1J/u2+h3suqYhR++9LiAPyNlwVIEX5ZkOLp61BNj2fsTa3dIHMB0Q==
X-Received: by 2002:a05:620a:6406:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7cd467be344mr1502750085a.12.1747926391604;
        Thu, 22 May 2025 08:06:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06ded7sm1099929966b.61.2025.05.22.08.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:06:31 -0700 (PDT)
Message-ID: <757925b7-3795-409a-9419-b33767c49e2e@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:06:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: fix a crash issue caused by
 infinite loop for Coresight
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f3d79 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=zEdONPlssZfnCtCruvAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: nYQXWBFc3K9ijYKcUIzfAEzhNkMrBGLW
X-Proofpoint-GUID: nYQXWBFc3K9ijYKcUIzfAEzhNkMrBGLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MyBTYWx0ZWRfX64wczp9o7A9d
 4te/9HV/czZRCB1aYrxHGsI6ZHAILYda9wkyA/20uoYggPim4IqmEo9+D5gOENivpThWHP8J1qR
 MZ6KFNAO/MFcnNH0iTcFdPIA/FzyM0GSC6wCc8/MtVixKRTh72gurCsyKVZV3iYh+1y8QuvBXLk
 3E4cxuYpPDbQUghwjGKOnfsuLNXdfBoZHr12TCqBrR2EJbfq0fAJgAArzOM8BRu1OGGpRVttv8B
 8D1rGJ0K5iokkNhPwy7pGJ6gl/3tAXpFMx6DTEvA9SMjIj5GSOhMAdADHXev1ovEbez3o3G/VI7
 n8Y6UChTSVzD93kWnzD8zfgFh8vErz9H4ITZgkODmxt6/04p5mtifNiyc4Day7hqnYP+2iwAy6T
 ZsinzeR9u4EyEW6pV/vvQqpUrcNTQtbvc0+D45878YMGbd/AJHf49YdHSTLcqSNJswCYi9ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220153

On 5/22/25 2:50 AM, Jie Gan wrote:
> An infinite loop has been created by the Coresight devices. When only a
> source device is enabled, the coresight_find_activated_sysfs_sink function
> is recursively invoked in an attempt to locate an active sink device,
> ultimately leading to a stack overflow and system crash. Therefore, disable
> the replicator1 to break the infinite loop and prevent a potential stack
> overflow.

Is it something we can fix the driver not to do instead?

Konrad

> 
> replicator1_out   ->   funnel_swao_in6   ->   tmc_etf_swao_in   ->  tmc_etf_swao_out
>      |                                                                     |
> replicator1_in                                                     replicator_swao_in
>      |                                                                     |
> replicator0_out1                                                   replicator_swao_out0
>      |                                                                     |
> replicator0_in                                                     funnel_in1_in3
>      |                                                                     |
> tmc_etf_out <- tmc_etf_in <- funnel_merg_out <- funnel_merg_in1 <- funnel_in1_out
> 
> [call trace]
>    dump_backtrace+0x9c/0x128
>    show_stack+0x20/0x38
>    dump_stack_lvl+0x48/0x60
>    dump_stack+0x18/0x28
>    panic+0x340/0x3b0
>    nmi_panic+0x94/0xa0
>    panic_bad_stack+0x114/0x138
>    handle_bad_stack+0x34/0xb8
>    __bad_stack+0x78/0x80
>    coresight_find_activated_sysfs_sink+0x28/0xa0 [coresight]
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    ...
>    coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>    coresight_enable_sysfs+0x80/0x2a0 [coresight]
> 
> side effect after the change:
> Only trace data originating from AOSS can reach the ETF_SWAO and EUD sinks.
> 
> Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index f08ba09772f3..b67c1f8a1118 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -1902,6 +1902,7 @@ replicator@604a000 {
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			status = "disabled";
>  
>  			in-ports {
>  				port {
