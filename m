Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC68175A5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042011; cv=none; b=YP4sS+Vf5qxA/xn9s1gaYFp7aO+b8OT/jf6o7CBDQTrM6dnTBfOpA9vJ3vyYfD6z6O/bK8fLmwTi2+gtpVpYjd/sweEGwEoO3lEO6yy1PP/moRsWK1wAIAdh1cK2DqmRFHJG/6CC1N0wWWFnI9DkcMUssFpy8c6qV/OXzKmPvRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042011; c=relaxed/simple;
	bh=8XVhguz1+Ed3YcXtVsOgIGoJBaQuam99SMuhMvkOoBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKLc+4W8xuJwYA1urk1wJ1mYH3UsMyBALWDlgbhFvXMYg81YGTa9sQR3yFDDaEHMpDU73R5kIewqlpV50is9Aq76dc+nOA8MUWBhnr0XRvCDd9M+anVF2IftJcUysw0HD0kj0JINvFgSpwWPR62UUesXqDuaItp3fTwRL9FUxp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRCsfPn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRCsfPn2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549qWmB012597
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 13:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yULVZvEmG9t/23IJG8ShwjnKhSSSSZCNlyggUkvwyY=; b=MRCsfPn2CoGwnkir
	1jg+wgvLYQIX+E5BbJ2vWKbYgwI8Pht+dg9r7oCoajhFwawI0OZLZETd5UfJWhSw
	Y8dqZUa7egZgknY0YPGyLK59vJHQaEGuewv7+b+xO+dj0jzLwh9U+k+oKowz1nhg
	kWESiOHHBv1sLh8vYynXyumbrfnQj+vriomqFb9IBjV8FPZyddN6Cud4RpfFv/5y
	Nn5gsVXg1n6Ttq7xasYEyYMQxxWcw27pcUL3s5qEomxD9LAHXGQZscElxovZYcy1
	EL8m0oDyLMfGJpmHl7v/1j0vdjPzgi7bWDCxtYoGwF9IbTMVZrF6WsSYRFSw8Wpg
	fTA4NA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be81sw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:00:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09b74dc4bso148465785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042007; x=1749646807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yULVZvEmG9t/23IJG8ShwjnKhSSSSZCNlyggUkvwyY=;
        b=JEoTr9MhYwRdNJGG6nf8mVFq/fkGuckGBYKSr3zLlK2J9ad/XUrzy0QuaV9SU25BS6
         WeRUHi9ELwQCJVbAVbQ5V4HChw0rzKr2d3SUHqypEDndkUSVCg+RryDwH4b6KmGXKxeW
         AiPGY1dQPZhX33YK7vxJcKbX5A201tHCzv9UQAtj8rGnLp0SZH8L6TjmlUTX3+zF2LV3
         d6Q0eMqy62lhzJ+x4Omc72vokj3imG7VR5/Cn/ov5vZ3ypfeobCTuUjK1C61MNhrEWDT
         d8bP+LZnmzJMgYn3zRfgl08tGIGpCSz+BNfwa8triJUEdRTR4w5z7TOIg2n0Eo5fs46f
         j3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjFEdhpRDnCQCqKhPAK7QZZgCyu9ICoJsYF4WsixsXKJ4sfGSnZSB5X9Erv917RJd1+X4hAQWf6PEV2QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgwyw6vwMyJb74NPrWgqtuRX2fB7Xl50lws5unu4L59e3Fu/P
	F8nbwrsPuVf00l40XwOTBfjEsGvQsIaJ8elThbWgvDO8if2RTwR00vRQbgt+2AozU46JW17gBJM
	33e3qKDwLnXr6SUTK0MNk9brqK+NMvZX2IwD9FuUWdN31wxABvtXhnUtuVTscoexfqH8=
X-Gm-Gg: ASbGnctMmg/aiASsx598cHKS1937SmyFLyf9WtCH8BraVajR/qjhYw4PzskOIEah1QX
	iHXOlg6TsV8hGynlRl6OgUDhjH6BMqa5yxPg0kElkRqww6ZTyuf6miDIa6dmRuweXAFOSxIJ4Eg
	u/WOi1S89c9eoOKq/SaRRYyZ3/6eKc1JTjpHr+12cKNXi9JFpi9u5rUhcKvUVncYlTr7ZikG9yt
	Vrt90A6FUYuA86r60AUJOnwL9K+nJmoTXgpb6ZAlo14XYOSza8RFa/2Z6IUDBDzc64p4uHY0RJ6
	m/QugKS5sgN97aV9gc5sI8LPODJaJEVzKiZyksbtVbXu+l+pffKBTDc5QiyJycMwJQ==
X-Received: by 2002:a05:620a:191b:b0:7c9:23d7:6dd6 with SMTP id af79cd13be357-7d2199090a7mr174139785a.13.1749042006670;
        Wed, 04 Jun 2025 06:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn4xJuvGOLTe7ZTBVF2ik8xPdkhjFGFOvWwDjwbyfQtIsf2eqrG3bthpaWtCLfw7+RR9Tkxg==
X-Received: by 2002:a05:620a:191b:b0:7c9:23d7:6dd6 with SMTP id af79cd13be357-7d2199090a7mr174136985a.13.1749042006140;
        Wed, 04 Jun 2025 06:00:06 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39565sm1094145666b.134.2025.06.04.06.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:00:05 -0700 (PDT)
Message-ID: <aeda0cf4-fd8a-4f3f-a3ea-922d5b0ceec0@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 15:00:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
 <4504e16a-f4c4-1f68-fa91-d3641a3decbe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4504e16a-f4c4-1f68-fa91-d3641a3decbe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=68404358 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=beIa89I-peMrsPrHJCYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5i0D93dA1xvZXkzrkXaERSmwg8gW2Qaj
X-Proofpoint-ORIG-GUID: 5i0D93dA1xvZXkzrkXaERSmwg8gW2Qaj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA5OCBTYWx0ZWRfXxJ8T1RbkXfId
 oS+8tm3h0Rpl1duHCwJrR8rTQLkyyQPQ20SkjXJtOevrkSq+QuNHwwzpOIAIiJ0epgU4Ac0xAWZ
 IORQ9ACQxaizxxkpyXYMTyHaawCv4RF4kz0y0pH7G4iwcegQuBNzHNY1DO8qE3tMtqayrJXRY7T
 CBlnKeneUg4lKQwUVJ4mRzOcE41znaJW4xC7w8vhzCuPttVvJzMA8ulQ3e1v7xBr6Hf0+ZHgF3f
 i+aLY/jDnzvdYxzAHStVou+BOCz3E5D4rAmF/AfYWEzez+RNhmrZ8v+G+LjhemUikzZm74gVtRk
 sop6PFfmuEDm5lpFtG5/reYe2NkAu6Zl9QUZaIPUZhWrsZYVr6Yk/WO+JZx0BnuCu2pmYciw6nF
 1jSDyuDf0aHQWUTCEsCdrKzLW5ueZNAwowgYw+FuHlSIGAC7cxgQ2WJovRtVXeInSSDr/FqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040098

On 6/4/25 2:35 PM, Vikash Garodia wrote:
> 
> On 5/31/2025 5:52 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Fill in the correct data for the production SKU.
>>
>> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index d305d74bb152d21133c4dfa23805b17274426a5c..2bb514c322692475ed58198e17f906f894d81cf4 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -709,11 +709,11 @@ static const struct venus_resources msm8996_res = {
>>  };
>>  
>>  static const struct freq_tbl msm8998_freq_table[] = {
>> -	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
>> -	{  972000, 465000000 },	/* 4k UHD @ 30 */
>> -	{  489600, 360000000 },	/* 1080p @ 60 */
>> -	{  244800, 186000000 },	/* 1080p @ 30 */
>> -	{  108000, 100000000 },	/* 720p @ 30 */
>> +	{ 1728000, 533000000 },	/* 4k UHD @ 60 (decode only) */
>> +	{ 1036800, 444000000 },	/* 2k @ 120 */
>> +	{  829440, 355200000 },	/* 4k @ 44 */
>> +	{  489600, 269330000 },/* 4k @ 30 */
>> +	{  108000, 200000000 },	/* 1080p @ 60 */
> What has ideally changed in production SKU which led to this change. Pls add
> this info.

I have no clue what's the root reason for the clock plan change, probably
some hw bugs were ironed out and higher clocks were deemed stable

Konrad
