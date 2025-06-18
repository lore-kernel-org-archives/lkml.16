Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9166A2EBDD6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257696; cv=none; b=E769rEIJlq6NBtyy7qwQMX4yp32qMOIJL21WxzO122kRFVHM1T5Gux34yxZuoM8QuPkBNt2k+8HM5p0qxoaDE8vW4lb8r+poNJeo6gAtuVb+wGo3CyJde4bL5vcZF+ArNtN4g30GYdLgITQa3Zc7kJR/N3Yssc6IcQMln3IZ/T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257696; c=relaxed/simple;
	bh=+/kUoxpwy+yvBDT++5o5/YrPxXFnUi+BeFnYK1qWQvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzS/PfrA3Zql7GHlKFTD5XvtQjLnn/7zSuk4mGj5FhbrMX5AAVDaRlAtrXqSnPnq2/UE3OMKmqsUwd2QRwU4+2U9keAwOCj7OUhZ5rZItfjN5pndXpJJRH34QnXbwSzxV7XV/WOsmoJ8NwefpK3VjUg0sENzykhlDd5b4iffnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nccYx1e0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nccYx1e0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9pWGx030619
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdkjN7cQtXvfbdtYqO2/u7xrAMjNp8r9I5gqRta1Kos=; b=nccYx1e07IQHOsLw
	3n0rbXcDloPJuBMwJrU6efqHyKIThbaVupKDI29g2NCgYowrgri6erfjm7Pt3HRY
	LPTI4ckHVpPcRXeFTROyLurlpS6DezZLa0RsjLNPoGbXTLnShzC1FbUgq9JbpOq9
	bCzPVKpCSAvwbM6GkWC70iQRpzGy7B6+9epoGY2SXJK6UiPIu/9tlDH3LeAWDOdt
	zJ+UUedO50PlgLwPT+05XYT+RIMCXGsKXzYfVUatWVraL/cV4utRYH5AwJ+2aqUT
	f9csXbQKjQy2seFAKABD6s+I4Q8zjBMWxNRlZ9yyKJzg9TIEZ0v+ZNEigXgvuPwa
	53OQLw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mmeqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:41:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3122368d82bso9822954a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257692; x=1750862492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdkjN7cQtXvfbdtYqO2/u7xrAMjNp8r9I5gqRta1Kos=;
        b=NCEfAeE5IFBHIMBM68WYZMVHNJVWfss1TactGnAxgt3GEdenANmrQCY4MSu8EmJtd+
         zjHghfBpRIl+nniBwN+wzF1TAUX6DMeubVz6VgVggIus6af7j9lZ6jemIpH2aEu/NeIs
         Sjcohn2JAKT9eoCbM7KiCX6KbT3+Nlc/2Mp0tmJmqse2XYbab999nF724ml5QXSsW0MS
         Ec9fUtuOA6ufhuzhP9Y3u4yV8/3lHvQA3mQru1Adi5DT3ji96xpX0kkid3iAmaFdeCkj
         DWn/I7AgVNe3IgrvU/BggzadRzF6zkvOLFs/MJpOmcKDKAX1ZFv1JBJ3s83MAcEsVFxX
         yeaw==
X-Forwarded-Encrypted: i=1; AJvYcCV0DmqV00Rv0y52scHmclZT6KZxKhnMJell8LrMQMfuciPtzukzxwzLrHzK7uwaHuD4yZFSo6tymgKCBB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBT2XRG2q7Jb8z5zNsNyoqbSv7TUwhJs3tfcevUj43orqR8qal
	MQ85Y28GJWN2dU46cVd/cvrBcyb6u0T2GlrtGwDPEIAMHK25K8V7goSfgIuUp63JeeYhickZKuC
	9ZWRRxBLuWdo5kT/I3P0z4BwvxEp6ahoL7epf73/uOR6CNSSBfC9sT/16bADZ4RzKfMg=
X-Gm-Gg: ASbGncsW7fYVOz0FF0RFeEirTnBE64A9/7QVlKZii+4QCY8StRNnxQYeB5p57UQ2C0E
	2Fmh5wcO5U2mxhHHeDoACm+myZX0PlVHm5lLVgii1uypzc+X03pf98hF/tW4RHgKYhZquYAMN04
	ImxeXtR9i/zUl+wWJ3ogTfCE/y41Zem6snFpqN/Ss2iQTkiBkZNTauS6AwkVGQe9PhXyjXsmv6y
	N/r16fj68rSXoiMbBU/DCGkd+lBcG4RfGAOU7XBOu0eBHhZwvhYgkRadf/CN6LF4TPBh9fGyrT9
	cacJQTe9SQa/gekc14iuK/F534LBIZb+AkQUAuTNWrqIsnmGBU/OK56IBJNhnUlrhtV8wCk7
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-313f1d1c00cmr24251105a91.29.1750257691662;
        Wed, 18 Jun 2025 07:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmA2bW/1zuZ6NhOSuWKpqZfn21PWtERB2Y9DfGzXkHDK1YYr282G1Ivdt6vHyvyU6L2Njbtg==
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-313f1d1c00cmr24251066a91.29.1750257691162;
        Wed, 18 Jun 2025 07:41:31 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5efa2sm12826992a91.41.2025.06.18.07.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 07:41:30 -0700 (PDT)
Message-ID: <8c969e2e-e1a4-4c53-9a83-b11debf3615b@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 08:41:29 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Make local functions static
To: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250617064906.14079-1-mani@kernel.org>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250617064906.14079-1-mani@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEyMyBTYWx0ZWRfX47fKL8feBmpM
 ZnuWgGA7umCKQ9CXeEELNTjo6Lby3lSbvzsXXeT25b1YVjf1H+zsnwAhti3JgCUvuAXM5zvAsUC
 XID4uBW9/9Duv6g+k+igQDgNTLX9pSTNKWkGxvp22B4yLAZ8wczFpmUqI00zurwxsnYbEecRvmW
 pmz/KqfUjvloIKsuK39odurRabLEpUtpQMXlcU3M/VobcjJreuMtk1aXMINarrPF5l0gcsucM1Z
 96bQoaF3JeAcr1i8Iu4rUdcqsJbFZnNy0JxjdqLCG7/ESjngMyfUTMP4znbaAo+wz/ZxBJl7Elg
 mBjw04tmt0axJ2l4UFwQgekUmlitaZLXS3RdaBAqmHz6MDpbppLOw0SJ7sb0xQHm7w1WI/iPuts
 q/OlWsJtkZypAhPSCwl4p5ukSyqQOdfhBKaSYNiapMn/3IuYNq0vFUqzBeDrlAcZcsuBDO04
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6852d01c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Bs19kDPuFU4Rk2GLDhQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WqG4yMmQ0KoJ__0r2950E_nIkYsc6_5M
X-Proofpoint-ORIG-GUID: WqG4yMmQ0KoJ__0r2950E_nIkYsc6_5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=900 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180123

On 6/17/2025 12:49 AM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> These functions were not used outside of the file defining them. So make
> them static as they should be.
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
