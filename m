Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8FC25A32E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083223; cv=none; b=DQ8geEutv3ZFgBpbgD6haCE2YvVFNpwXBuziDIGuYKO2PnfnXESPO9FYaqCUdRIgVgavMB0U4L1B0zaKOTMnLcFaivEJYlIkwBTKAHakuRTkFzJpZR80helS1Zt6pzW0fnlxby7SIFMhqd0bhsl5lH+t9zrQENAv6HkapqRmzgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083223; c=relaxed/simple;
	bh=IQc7XbpOb+OEAWRL3np2U3qHnasNjpu+1rvKk6ZTu1o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NYaNQoi3gzCcl9mDawYbCQvhzkviHCgZSPyOApw2YoTZKgS8sJsspWVGk+Pbnp1s3Xd0aPGumIwDwplXa0fA/ngPOWLbSC7fj001jcbHjmJqS5S1EH0mD6A0GHOofuG8oKlfZQd2UUfoUC9V3aPJsXlwglGHiLshmZcsIt6GrUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNy9EDpa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNy9EDpa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJ7VAN003720
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cq8u30UIoPjW/N2abdjgA07N6oSz8BgxUZcaxGy2v0=; b=ZNy9EDpaAWZMIGKo
	Cr8ywLg9L6bXwHdswLcPAIAa2b+KnFPU2Yv+PbobkP1MNrw0wYpq33cv2IZVmBqG
	2HwGacQAMN80uboRuNNPW6H22XzfXJWt0MRBJsBgvr4uPQlHGfbMRniNadGdp2cl
	X+mwhKBr/vKDTfDcgcMHQXnES3nnPIU6tC8MAEPTNLo4yblQVuM3ChIeWctvxHdB
	h6XmqXkAZvJySD6Jxx3kpiVDj1OH/wNHUKukSq8BJJvrXV4raTrja/hbU+6RD0mN
	MdtDX9ccPYg5HmNQxpuW7kmHIjTLxgFV0PEX/lZxavsdQ9Ziqod8vEQWyonAThH1
	7fzu/Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt95k46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:53:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74089884644so4351564b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083220; x=1747688020;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cq8u30UIoPjW/N2abdjgA07N6oSz8BgxUZcaxGy2v0=;
        b=Xt7s6+c684gZ2KtdF2ur14bK9osnk35QJPzGFo2+0epZqb+IM8lrcl6AM7aw3fQgFq
         QaFYme/fX5fzg/xTOqPqbxpIHPFwVf74iticItolQcKp0octuZ7LpYMMOJzfI4oEvV37
         SRwEtCPr0v7Sz0qzie4hzAMZlDk0q2uV+eKzdkvic6PnzNcUmdjC8VqwjMJFNEpdHzGV
         BDfDIFl+vpn2ydxONZJA2yfqpxGUcEjGkVgdVBCvRv+Mrut787Z/K/OvpzqoEZP6OFWW
         nriFb7hR0yOgn5tO9H7ICNBAi2qXSFt1DnruEY2WVuUhF7TFd6/K36cxFg5WclceE4rw
         o+kw==
X-Forwarded-Encrypted: i=1; AJvYcCX/kEOCOKh8rN9XOcot3hnmVhkYPn+1CAUXWz/+3gPVcvPyjUp0JjPvGkR/p10zwBF57GbDhRT+KhBj7Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz0bx/QtrAoBuV/A9IaM4IZa0qfELDE2bDrEkB4C7pc66o6LV5
	ltMxSKJd8Byo/KrEDrK8HDzwRX0W790toG81geSV3pduwWtJU4zALB93D2pqmxB5lYIxPvQuUyZ
	pXw4PnwBnvQxfFyK8kUtCWQiXVzzDK6OxcD6c9NEQJZd6WBznNK0NM/nBmts2Xzs=
X-Gm-Gg: ASbGncshlgR40LMMXBZAHYPAn0nfWtxKxlgcw/+VEOtx6qoVINKx6JuwoMkOv8tU+aO
	hPOlxKKqPEvUifOsKx5qropIOv/x7ha9AzLMceAfa6Mb3h08Eh3MeCQythkxtDvcSMSpdnP6wwx
	hzkTY2ZtyNpMzAFSRLlPxJ2uT4h2iRj7OgFLpvoYarvO6uSeJit7fpCsK9f3GzAFwfr+6bBw5oY
	XaAfxwCaesSfJBhhEpeCM/ThtPVacL6oxNvhOgqkbtyYiWn89zrKcDmljmwGVaaR3sgxlVw1leo
	ec9HmJqy8zJx7j3C998nv7+ZkeNFw4B6udrgbc2TPX/1/bvrILBkRFuBa3KU6kjr9F0=
X-Received: by 2002:a05:6a00:6c96:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-7423c07584fmr20255193b3a.22.1747083219945;
        Mon, 12 May 2025 13:53:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH687p/Y1iFlDutqkUP/1gknV1sUAfUa3Pyf9KjJ8HWT3SJf+/S7+d01a/7BrISVOK//kW7Eg==
X-Received: by 2002:a05:6a00:6c96:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-7423c07584fmr20255170b3a.22.1747083219556;
        Mon, 12 May 2025 13:53:39 -0700 (PDT)
Received: from [10.71.111.220] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8f520sm6703804b3a.172.2025.05.12.13.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 13:53:39 -0700 (PDT)
Message-ID: <a1ecf255-f8c5-4f3c-ace5-793171a5ab87@oss.qualcomm.com>
Date: Mon, 12 May 2025 13:53:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
 <20250414-sm8750_llcc_master-v4-2-e007f035380c@oss.qualcomm.com>
 <cnlu4yhfax3ggtkig46bwimr7acpoxl6x74dpu3kdwq2wcjwmd@d6spkmdywrja>
 <f2215dac-6d31-42ec-b2ef-d0357b9542c6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f2215dac-6d31-42ec-b2ef-d0357b9542c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNSBTYWx0ZWRfX46melgAizvuo
 6B+KRKwGHeQdX8Rv3Jx82aHzTzre9sVpDYDEAwCRz2Vl+4gqqm4FZIGdnBHmI+v40XQw+RMKW8G
 VVPxZn8qL83DwDb2m8qx7XIhxAr9cGfazpdRBWdUpbsBPeLmkWlowCaiX1YADFe5SnJ6s7WtIwb
 1bwdzjXrDUIaZvWQdU1avHhJmWfZTkaJ0xKPo8RZ8c0E9BkGEIdECzsn+h3upYSElQqJUdoYIvw
 6d6Y0Nb1zHH5aidJdB2+l8dK0qBmP+2E/czgdrpSwTl/+xNacXeiegx5TgKuu9BFF4PYuJS5A2y
 syEvK99YtKTd3cmczNlN6cwOTuC/JHioFTkMMY+hVkefaXJ9TyKc1+901k/kCg0Kp+3t0vEcSNl
 g0oXpf6AZUqpOgm/ijy29UpLkNKD998wGbpA4+xagHXs61YTkKh0xfzsFhZqDwaLSqRDoePf
X-Proofpoint-ORIG-GUID: R4reu-Azp0gbmT2Q7cT-zg-0SI6P_Vph
X-Proofpoint-GUID: R4reu-Azp0gbmT2Q7cT-zg-0SI6P_Vph
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=68225fd5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=2_Z1bVATJppRhMQeSlUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120215



On 5/12/2025 10:45 AM, Melody Olvera wrote:
>
>
> On 5/9/2025 3:12 PM, Bjorn Andersson wrote:
>> On Mon, Apr 14, 2025 at 04:21:51PM -0700, Melody Olvera wrote:
>>> Add support for LLCC V6. V6 adds several additional usecase IDs,
>>> rearrages several registers and offsets, and supports slice IDs
>>> over 31, so add a new function for programming LLCC V6.
>>>
>> Can you please fix up the checkpatch warnings in this patch?
>>
>
> Apologies; I'm not seeing checkpatch warnings on this patch. I'm on 
> tip of linux-next/master.
> I ran b4 prep --check, exported the patches with git format-patch and 
> tried running each
> through checkpatch.pl individually, ran dt_bindings_check and 
> CHECK_DTBS=y and still
> not seeing any problems. Am I missing something here?

Was missing the --strict flag. Will fix.

Thanks,
Melody
