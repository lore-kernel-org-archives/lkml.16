Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EAB20F077
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324223; cv=none; b=mTj1sg+QGRkIW0QxZJDKfnZ6AZs1Fg5IbqwvZKWQQ/5kUasUDZPRe4zK+zGyVdPvcB8u25HKWYQ/HBnozf85Co4ff9+ZF9ULW1zVgctZcfNobH4m2YDQH+wqvXIQ8/Wd3jg1KRzgC75q06xCOStjRKa7ldyReEtbsON4t7TgOrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324223; c=relaxed/simple;
	bh=dNlcXEL1og5hj2r5kvEu/Kdl1W+j+I13r6l7i2pULIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra7BMjAQs6zOOvzBmzqKces36HTdGBZoM8Qw+xGKcHYOnPA8DVAxwL+KW4hNSg4Jb84U/n2UJuOsY3vngt/ryWc+0gMzm7/RF2qNHX6A9FQz4RpiCw7RGswwTf1Abf2SzpjZFPnFFtUVEEnmK/BDFWZN6FwLt+aFDJ/vx6p3Kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8nKleJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8nKleJt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDV4024326
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cc+zErqcootpPTjYvcB1ISvoOWYflU+BlMMVQ4RvB4=; b=U8nKleJtoiVp0HPr
	Ek0MAMznJhONqXdxdfICIwTA8XT6akalaMuedCzh7N43y+Jc0D4LSl34+JQCJcd8
	xOT7oRbShJqGJZFqgFdJmVC6TxD766q9WehiJVIep+knlDBAlkUCAM5WQcwGXFrh
	ssDo9wjLPYIttGE1EVwU8AOVPgvU/Wr7wBpip+fIEeNKR5T4zWMWBWe/jxvlzmSE
	ilb/eX6at088x+i8uo8LyoyiSbonxTHu8jnwKt6qnQovQhhrrTMgf/ZMHbxtQzMU
	2TRmSSkzJJyVf1efm5N4JoT4vgGrqEoLpR6G14XeI57J/88Nm2lpnjvcPpCdk1GL
	QJuypA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmxw0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:50:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47983a580dbso2465501cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324220; x=1747929020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cc+zErqcootpPTjYvcB1ISvoOWYflU+BlMMVQ4RvB4=;
        b=upzUpzYWZmloT8La2q2U8WwtPOgwOx/ZdwyftSmZHTMLwrKwqkaR7sFCYbo1wOKo3o
         TOgQvqWP4+5zHqDaI04mK1lcH89GXlayF17IzGDslUUEzIuoFIT4efzuCXHWQ5rKxFbX
         hfaFufT3jP83f/cbKMoM1QXe5SaCY5+NF+ngpLp4cRZy1UQADN8/4f4xAtKy9dbW4LtL
         phtDFkQv99wcYPmy9tNrWLPnwdAy7pw5DI75kBn+fhwSFPwquL6+xg7k0eK1qIvy46Mn
         wtxs8tmPr45mCWYbxEBV9W8YyEWl1Ytp8/qe+Sf9sen12WW+4TZu+P9meobY5h2hq49X
         rJmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/bbxcTPCgYtkae2HuDIhL4VLG4bVHpC4Hl8Z7b3S1hVDE4aZ1/gQ9slLt17jQpC7mf3QZGe2cL11z14s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx03JZwCTtfy/YW7YK70siU5S9iU3VEJJgBxzzmQUy6JhGqFbIK
	SAtkx4qVcFAKUtVhSv/7NV5PGZyBp543Ls/4v7quKDkcVulIKbWfiatSEYRuyaSODHCp/mbeg5B
	8bUnwIYmCj+te8cYOzkwvw6RpFbMb+p6yKcV5gI6YT3mnqxvltaQk2ipnxPBD50I=
X-Gm-Gg: ASbGncshWKRTnLm7ZzNB+4MB7If1/+mxqz3lchLdIG4C82qzdhC7u81vuepOpt/ho01
	OR47EdY/ySibjOgD2rjQi/Se2dOAfoiEtyIUm420LkEb7YgsfUsW/qE29QGj5YGtAjBreg4wVWW
	0XWVNDBDeB2UHKqocqnUUExziJpL6WVqi6r1MNrBvN6Tt+jFtATejEGIijJDd3MVywB7jnQOl9T
	kjVh1LVEvWnVe+pW4ib3ERNPWWMFakySG55z+2yxhbSjIgU/jx2+vAaZLxxfEQuZDadTB8NW4Os
	wGbOeuLgYWuhu+gbzzOLldGa7Di3z7s4BIGumINilIRXIObQDTtneMR+HP7qc6mxVg==
X-Received: by 2002:ac8:7d88:0:b0:471:f08e:d65d with SMTP id d75a77b69052e-49495c66538mr38609211cf.6.1747324219742;
        Thu, 15 May 2025 08:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMUIAEtbW2Lfnl05viWeYgKuGoOg/uXu/bpms5M6DOAK+WjTQWzMp430rphpSK5jRVU7Lf3Q==
X-Received: by 2002:ac8:7d88:0:b0:471:f08e:d65d with SMTP id d75a77b69052e-49495c66538mr38609041cf.6.1747324219274;
        Thu, 15 May 2025 08:50:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cdefsm8041666b.52.2025.05.15.08.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:50:18 -0700 (PDT)
Message-ID: <c1a18f29-440f-44d9-be9c-fac49639ccbd@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:50:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
 <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vq7oM-Ft9woyrLuTOKxvHXYWU-vPYHWI
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68260d3d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jzhEuBAUjWbXnsiB1ZYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: vq7oM-Ft9woyrLuTOKxvHXYWU-vPYHWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfXzr4epxbZ410J
 3OGVxvW8Bh7sUwLgL6f1UZltkdydGNcVTpeiOQYie1TvpY9eiw8D2RhO11Zgbz5VKRiH+JNtbVs
 IE9Z4aCT4ZSTDN6feLSM7E2ukNdWqC5enWlhnANC9JQfBOcbFlMjGi99pqSqHa7exeimiCh3Hte
 j6uLCFasBRcts8m+1MIV4OYwsNxtml1d5JhzMvm2UtVWq0cPdrbL/AsEmiCdXbiKLRuxqMw54Bf
 5b+CuizhpRU7vZqDCyjA/k5/J+kCL15uuK1ib3uOCjpwfeyZBFldXT9lIuc8ADhNZv7trP2cz+I
 zXUmDARCI6yxhFU0eKdBSLY3WXebYvh301Rt+5jm0xGMKzjzUVreNfAsEjT6eqzh15acSRTVFvm
 rkcpXc4MkSvVX7ZYndHPlLAIAZ1u5mypahhvDTx6466ZVyk4QsMqD7wBfO6kWg6TstT4VnbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150157

On 5/14/25 9:03 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:21PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add a file that will serve as a single source of truth for UBWC
>> configuration data for various multimedia blocks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/Kconfig       |   8 ++
>>  drivers/soc/qcom/Makefile      |   1 +
>>  drivers/soc/qcom/ubwc_config.c | 235 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/soc/qcom/ubwc.h  |  67 ++++++++++++
>>  4 files changed, 311 insertions(+)
>>
> 
> With the SAR2130P fixed
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
>> +
>> +	/**
>> +	 * @highest_bank_bit: Highest Bank Bit
>> +	 *
>> +	 * The Highest Bank Bit value represents the bit of the highest
>> +	 * DDR bank.  This should ideally use DRAM type detection.
>> +	 */
>> +	int highest_bank_bit;
>> +	bool ubwc_bank_spread;
> 
> Nit: any documentation for this one?

Not even documentation seems to acknowledge that bit's existence

Konrad
