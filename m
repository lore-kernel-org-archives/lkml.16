Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121D0156237
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747408455; cv=none; b=izzoovnTW0qDVpj9y8Oke3YW2mKNJSZR1+jRCEMWEC+4eHsih7sIvmGN7sIFBJPFCtQ/1zRdhcj5Z/2EXJTIpkEdXa822WOwGLfqXobbEpVQdlFZJjKtLNaFcN79t9SadvqFo4Zx3v5pfl6ggX7JLwKcl0MZ8AiMvTgCPRTTknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747408455; c=relaxed/simple;
	bh=ji2MsarXRrFl7yeae/YtYv1fow4jjJzCAdklKRqtHLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pv7nY2NfAifoX8HYJTmKjbnZJMHI9B3XYo0rkYC0L/fxrqKNnU9joy7cocgWYWpPCMLL8pNN5k2W9nwUCCsym5FQyUs3Ulw4x9dVhqaewLbg1eyIKkyZ23T1Y3FEwiHZsjhSXnlCj54NEE7J6QjbYakRqJmWWFRewzEAIPk4Woc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UftFdbHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UftFdbHh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBJFVW020883
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLu3+hjcuIIAuWnKsxLgTgUWpF3MmcU4WCdhzBMUVNQ=; b=UftFdbHhwRRRmK2R
	RSge/Cz5SardokvD2dv2h7OEJs5RtaI5Lw7S4UheU7f6PGsbgehXUeeqZKjfGhUU
	FKzbGHJOW5B+NmWxKPwIep+BsUitqrno1pvww82d400k6evr9FhXsWd8jkAyIWIz
	ApaEEYreYINieATWQbV+z4ZWHyVlo+2D30ojN8UIf7yJP3yq4S3o8pVPe7OfeOEN
	28uveYgRIutobtekJUEvRbewVYaVFycqYo63SQwQE0AGTHTIqWIl7azD/AhtY8fp
	1fwoZq7mUhCdmj3jKgyshJVtDpLbBGkKqNWlqd3hA7eYdGscVWpcx3ch1qTvbDkq
	6aen7Q==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbewa5xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:14:12 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3da7584d3baso24076065ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747408451; x=1748013251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLu3+hjcuIIAuWnKsxLgTgUWpF3MmcU4WCdhzBMUVNQ=;
        b=EOjJMV4EkElYVhM+972g0UVBST1vKm5LhzBlKaj8YSJXC+f0Hu1C1w5xHmdVUrIqq/
         k8gh6tGFtdRZAsG1yDrb7nn2jHPYWdnU0WnTmA29WxtpU995TIOoHD8qovgrtDfF36ED
         +fchVr/EPyFqtME7cHzwG7jCslNPWaYx1LcDcSJ1E6rwJ397eR/bCE8Og1RxKUZN14WT
         wII7srST1LTGa52fEYvhwTY9HkrwMwC3GwJwYh5Tv9aRUHTN4RDjDgSOj1InI/ANGKab
         rrQtudDnpvjnFf4YNcfE/jdgqdKmyrravrP+gjnUWOqRSDxIyPUNa5xZ5U7j3+hJxJE7
         Xb8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpc59BeH+NReqDM6jUp6mgfwN/VWHHWFEsU4j+2uJdKXvCPXierrfrH97Imwq72n4xVMlmhd0ZuneZyeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ6vaQvlAq+DBrSjTN4uA998ynxUFADkwJM7QoZFIIL2w+IjVW
	QqXsokAHe0Ts/mfmyLpzQdK/5AY8WBRmfwHeQxPLwDZbFTqZrKL3rxvB096YSNFk5ewatZzE6ze
	Elcb5P1DdQ3mnm0IINH285Z8FiJ17Sbq+GqCudxH5LsSpkeFctGmExCVoLz4P0jzNiD9YZRO4WA
	g=
X-Gm-Gg: ASbGncsZ9hNuVe1Es+R0mOJAGu4gOmsT+hMQQQ0sXAsL8/+8DYnpaWYACc7L4Eff67M
	zLcV7TKSrdplhM1WfP6awETgmhpL8JIR60ifCWX2RTwfS0f0Nn4JDnNRg5MN9zCmsQcn+XGBzGS
	iZ0ByS8/58YNLvujM4KCxu7dIdIFLCy2p9o9le64tjVXNm8cjKTvZqMMi38Ib+uvv7gaxI84c1l
	RB+lNX8xnp6pblvYQLWKed+Tfdm5CImZn04s2XePGBhkaAshpMDaPG9G65C/0bN9DGHyCDzlEGj
	2fhD2f30He431rVyNT03nDdzNU/FjLRLWfAWS7M1p94BrTCFTkuKs24u6GLy6A==
X-Received: by 2002:a17:903:b8f:b0:220:be86:a421 with SMTP id d9443c01a7336-231de3ae560mr39661275ad.38.1747408440880;
        Fri, 16 May 2025 08:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9PI7SUtWE9rx7ZEEoLHR4WZhmKY8xH8K9phfkI6WzyFtFIQ7RTKmuVc4in7kjhjWVvfhq2w==
X-Received: by 2002:a05:6a00:391a:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-742acd5115amr3981025b3a.18.1747408430066;
        Fri, 16 May 2025 08:13:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfa9dsm1702805b3a.10.2025.05.16.08.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 08:13:48 -0700 (PDT)
Message-ID: <fa6e5f45-a6d9-4f31-ab5a-7c47200a913c@oss.qualcomm.com>
Date: Fri, 16 May 2025 09:13:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: fix endianness of BHI vector table
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250515095517.1867846-1-alexander.wilhelm@westermo.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250515095517.1867846-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OFfeO0IUNTLcxWxJnPhhWn1bmBxM5Pc0
X-Proofpoint-ORIG-GUID: OFfeO0IUNTLcxWxJnPhhWn1bmBxM5Pc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0OCBTYWx0ZWRfXxbqKfBPevSEn
 wubRsboTRckJiztwWk0ZDmpWj7ruB3bpRTQxJzMIfGmVTfC1gp5Vv+R7IP5bzxEg+qoj6eI6d2n
 QNrlRVLHV2FNnnrErx/FPTKjCLVr8SY++JFRDyaskoCvV0KQbKw3odcWlpq0cC+2qe7RGdA5Mys
 jckMh6ZJS20uAuxUxjgEEKSveYgf5Nw2m/HcYNjM+ko3yTwSQi9CYyWqEwIVAuMvoTAAs30WKTl
 iGloY2iR/RZ4s9Nsm90j51CqRbsIV2OmalJ9inmFYF0G/58Bhm8kalJoOeRlN0qBwLxDqRrI8iT
 jmZJQnGxdfeJL7b84lM0UgPeuBfTMlGnGqiiPJKbzOdyf4Nnr/q5la18rov/LdWKK9xqgTP4qL/
 nLvFUzDA+rjC/0pVLIhK+kg++sWEnL2f4dKFdLHllQIjKePRanwg1S2mhAN53gxFvVJjqZwN
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68275644 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=mnqbBUabxhxt7vZsbGwA:9 a=QEXdDO2ut3YA:10 a=mHQ74H5e8mo-RpSg_uaF:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160148

On 5/15/2025 3:55 AM, Alexander Wilhelm wrote:
> On big endian platforms like PowerPC the DMA address and size are required
> to be swapped. Otherwise the MHI bus does not start properly. The following
> example shows the error messages by using qcn9274 wireless radio module
> with ath12k driver:
> 
>      ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>      ath12k_pci 0001:01:00.0: MSI vectors: 1
>      ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>      ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
>      ath12k_pci 0001:01:00.0: failed to start mhi: -110
>      ath12k_pci 0001:01:00.0: failed to power up :-110
>      ath12k_pci 0001:01:00.0: failed to create soc core: -110
>      ath12k_pci 0001:01:00.0: failed to init core: -110
>      ath12k_pci: probe of 0001:01:00.0 failed with error -110
> 

Fixes?

> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
