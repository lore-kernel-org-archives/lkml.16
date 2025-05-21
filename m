Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEC61C32
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864394; cv=none; b=JONqP68ZEbLq7VJWnwLkNKt7WoyZfTmigurTKtxj4zl73gctmSgXeRySNeI1r1iA2hGifrFjPHR1ekrCnxzeSV67MaY/C/k6xokbF0JjAQcxn5tpcwKbav0nRLibZ9+dP5E4ytxceEX2TZW//V/ycFnVd+aOi2dZbKxwDftWgJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864394; c=relaxed/simple;
	bh=BvIsBbwn0SKcvYkOO338WYpFgAmu5GvxT3H9FH1mRVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcuIPSlV9vCfobwfitNab0mv9znQ6diTC/fkgDp5luXWP6srx7zwHW/8iyhF5YLzi4FnTkxFtDUu7ks/z3rDZcTVcaXvOvZhRcsnlwFQz0F63mIl6L6ZSSTcCgnfCMp/BcQyi4w8pPs615DgDnEu1Drdscs4zx/2SeaL9ycd1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kt2v5Unu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kt2v5Unu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHoxre016644
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8+jvNPvz+gKJvrG+VMFVXzwjJgRjgR2KNGBsLzgH4E=; b=Kt2v5UnuN2VKv8Tp
	yOb9KGlmvOjkKdhjYysv7t1ruJO3/lFqMcDxC/kdU8dISYVRpSEIYR6P7fHJL29C
	qIM+sMJ3SucL+Se/S/kKhsYf6bKx4ApScSRvTrJG7FAZd4tWGrG/qOTMzlbiMVqY
	COCfsvfFcOlEIV1+x+kx2+hWaKXlSrJfsjYZQw2Owj/Y2FtSyIe++Zxrbui3dy2x
	W/QEOdJAJ1FjvMrz41edgr2IRGxsrxzrGa0m96wQLySkq2TroB6HA5NYoOAYjW6Q
	dCHkMsMxm0BqBilcY3xALjz+y8l+cA8yXgNBW5NI2jAS6VWtskKNuQxslxO8oJOR
	vykdZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9va9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:53:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54be4b03aso180691785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747864391; x=1748469191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r8+jvNPvz+gKJvrG+VMFVXzwjJgRjgR2KNGBsLzgH4E=;
        b=ARkv7JVK0w6CsSrMSqqkBmS+B2BB+mBFCCpk+sW1opyAo44HXEIp1do/EyFiRvJCjn
         u7uiHExRtzKxQeLZQ4umysSuGiJh/s1342h5Br3V/7UkrtfjsrYnWO8KRiKi5NMC4dxd
         crSHTh+UPHUqqsQaYKsVqRSRa4wWxCSNsnBBn6MlfaZ9WY3m7lk8/VcvBglkNkRuaZt1
         7mV8YVmHzLf2ZBo+2gNuI1shHoC+lla2W2A3S/rkcpank5jK/jgFn1+yZA+qjlqHwfn1
         XFarYoReH+8LmjQf/tIRbaoee3mbYv53USVlEUqEMLGe8OzTWPfWoIot+pjfVk66YXbu
         ur6w==
X-Forwarded-Encrypted: i=1; AJvYcCUkfggZVQh6rRKcgJy2zSpnzt/muGGrMSf2lVY/cpJiZLvVmbHVrX1WMPA1w4zqyTuJhIDdb4DNN2WI3NM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNNlAChSpEk/KqCVHZvmvGqs3I/X+ST3LbWpdAai2flY7L9F33
	BqG3DQ6CInQ188dfg0bQjd4XPCEO1dsL+okC7kiCFGIPTzrzsf3DTuWW0pmEvEk/CaoGv9oOfOu
	mC6S+aNvbkba2TLVut/PedzZVxSzzFM7kOmKIYR4aeip0XMdIrjum/wJ6kIzNT8B4z+g=
X-Gm-Gg: ASbGncvr1u+7ZrZ0nDYuiuqZ9h4kouXcEUgB5CU7NXAm2fY6+Rv/PNiWT2Itouvb+K8
	HkrgTLwyzPLztI7YHCJ96sZNYsICNFwA4qkZ7YQm/9LRHW6Tqez48iMP3WQKw5wljzeTP0RZ4cr
	FsUKKFZy/ZTA0enrl7zdKkEFHDfFAuvwgVc2iLk0SWSUJp1X4k3uhnjE/t20BUGD3BkowTA5hlx
	7KpDmaOryudXTL7YDvyH95QHXHFqyTtBavhh3WdO4Is74m1FUllvgIsfq6gzNP4hLK37ZAWFjZJ
	eAs/8P45/o/8c6CJ0JDhghuS92KsBbvT211wOmkoyTGAXB6PDl9y5M2rYC1cwZ1+DQ==
X-Received: by 2002:a05:620a:6202:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7cd4a08ee21mr955948385a.0.1747864391089;
        Wed, 21 May 2025 14:53:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZErIhRYY6jF+JvSB4t+dlNMKFZObvQZFGcRiUHU3xjKYKiQb8V70t/qYNriwOJKByWmXCFw==
X-Received: by 2002:a05:620a:6202:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7cd4a08ee21mr955947085a.0.1747864390697;
        Wed, 21 May 2025 14:53:10 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438c10sm968332266b.101.2025.05.21.14.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 14:53:10 -0700 (PDT)
Message-ID: <fc6f2ac6-c6a5-4661-b5c5-e1cc75a7d955@oss.qualcomm.com>
Date: Wed, 21 May 2025 23:53:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
 <20250521-ddr_stats_-v2-2-2c54ea4fc071@oss.qualcomm.com>
 <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682e4b47 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ARcffcqOct04O5k4gLUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: SJXlTMrWOb2BWmsUDaFB9fOWvUfonO3E
X-Proofpoint-GUID: SJXlTMrWOb2BWmsUDaFB9fOWvUfonO3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNyBTYWx0ZWRfXxpPdrcetopmb
 HhTb6oHvAow0qU6g9LaOpZodFUtUQWrnPn2yYlC/xxgsoWINMs/93Tb0immBcayMZu8zMcR0xXq
 mxfBcmBrKeSdjfWTh7Zdo/Do6C7RI2DFoWCSS3cm24ceRUR92a5hL2+88+XoQLTNNYg3kfttNMq
 HfeT1L7xhAfjLeLAon+hNRwmhBioUUI732NrQPvjHN0RGF8R/Fs6+i/WadzpJPdIyuYvN+RzgNB
 dAkFLC3/J2p40EGdgQDH3WxYvZgRwncuuhe4K/KekvV51lw0kpMFmpw5ZivrSMascAbRVTGwJb5
 yH1ZriDMUn2R9hjL2mOBzLHvMtNacNNYtnU4h2CR32SWDKUEqalQtAqv/adDk/eMcGmgsSFz0gi
 BF2/ajhkfqV5qmjoXzQshS89MfJCdpsh/GIVBkjzRUcMxZSbsKg3ZMI/HQnY3tz5NWuAde9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210217

On 5/21/25 2:52 PM, Dmitry Baryshkov wrote:
> On Wed, May 21, 2025 at 02:02:11PM +0530, Maulik Shah wrote:
>> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
>> ddr stats. The duration field of ddr stats will get populated only if QMP
>> command is sent.
>>
>> Add support to send ddr stats freqsync QMP command.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/qcom_stats.c | 29 ++++++++++++++++++++++++++++-
>>  1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> @@ -310,6 +329,14 @@ static int qcom_stats_probe(struct platform_device *pdev)
>>  	qcom_create_subsystem_stat_files(root, config);
>>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>>  	qcom_create_ddr_stat_files(root, reg, config);
>> +	/*
>> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
>> +	 * The prior SoCs do not need QMP handle as the required stats are already present
>> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
>> +	 */
>> +	qcom_stats_qmp = qmp_get(&pdev->dev);
>> +	if (IS_ERR(qcom_stats_qmp))
>> +		qcom_stats_qmp = NULL;
> 
> Don't we need to handle QMP being not probed _yet_? In other words,
> there are several distinct cases:
> 
> - No QMP defined, proceed without it
> - QMP defined, not probed yet, return -EPROBE_DEFER here
> - QMP defined, qmp_get() returns an error, return that error code
> - QMP defined, qmp_get() returned valid pointer, proceed with using it.

I was thinking we could get rid of the qcom,qmp get-by-phandle mess
and replace it with a single static global instance.. But it's hard
to determine from the aossqmp driver whether we should ever expect
it to come up. A sufficient discriminator is "is_rpmh", but I'm not
sure we can rely on e.g. cmd_db_ready() to get an answer

Konrad
