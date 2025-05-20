Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBEF25EFBB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735173; cv=none; b=GzvXP3qjirskmpAoWLe7v3yOt69S6bbTMjJhL9HA1XGFTJ/FvdqMUG6lH5TO++6CfvpHK5oiV4xsne2eekWl45c96uDOIaHCPhQ26CiU5XhrkDyhAl8EvoL54YQ2mOSK86eOLmp4jrqoYD/fD9sCsrf2v+jnxAsHL27/T7MER6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735173; c=relaxed/simple;
	bh=lH7x/Wo0CZ05NHk7+smtqoWoLqjABA8L5UWZE3AonbY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iF5RMFNXaZXkosAQskR5Eb25wHQnKLTSQ+lGrwnqNngi1jSmuAyJI5TeINvG6R8nhJdQDz5OBpCqCz9KCopbedVf++Kjou/R+FNAEAZl9WGfbiXPqCQQuJEuUFhpRft5/ESOU1gaD7HBE271NUw5kOFH2+eV0DGdAEydEKC+XLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhBsdHFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhBsdHFJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7BANJ002214
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv3cua+BYR/31GrwxUJ8YoNbjglNl0IAz5i1xrlz600=; b=VhBsdHFJc68jk8CB
	S7abyPgti+NGobuuwFsxEsvmQm9ceXRyA36xP5ybK8FXjuo/jLTnunnuNWZNvVhK
	gdvLV91YEVUU960e+Z540NRzrcPP/E3GomdQuBqHWrDyN3P+KgZkO5EzDsB/fgT1
	7BHEkHcdkJMWEcq5Yc+mSS/ba6kJzCrfvpO2n0PMVahsmBij/xQ3g/BjredQx18f
	2UaHGjzZJfyHqsE6pAfdKSKp2M0ZUVDOAEiSRrIsVMOePP2z1+2/CKKgLVIKvkd9
	HDWCSyKfCMMozXC5W4EFqff++I1Wr72MJjfylYyFfEw/PLvdEyUJZh14I0XEgYgH
	p6geOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atkmkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:59:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23228c09e14so36853435ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747735170; x=1748339970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jv3cua+BYR/31GrwxUJ8YoNbjglNl0IAz5i1xrlz600=;
        b=PPJrawzouiIzmdE26dfq9oygdGnr4cLFmNOIS+OCzBiGpH6/TzXk0AlPG8FUA5jXlZ
         JwYNMb3P2YPjBgPahw5jLjHo5f0CbxVmq4fyD/xrOqoB6trMmUsSzo7OcYK17ZasP8K+
         CWcnYqj+618W2U+AkrA1LmVjBMbwo/o2oYjDOb2KZ2Lb0ASIdfCClQ+MMXuktpb1wh+1
         W5jfN2uhh1eOcpJJI2iL8a7KycDg2FJTBpujiyTk0Ekw+U5jucTgoWpjv3O1O4Opa8EK
         OY6e0TBKZSHIbqM5UGWasCXYXYzGAHlAj09LU5bqDAd8iOCEeNqY2mG1AHXJnGxUDNfR
         naaw==
X-Forwarded-Encrypted: i=1; AJvYcCUKQb8oHPdW7nj4cPbKPZR+gjvzQTvtcU/VDV7QRtVksdo8FprzlCpjI+Xr77bjCGSnbwy0Amltx8UqSjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5VzgZxdjGTD8S1sPGc1y6QELNBaRLOp8wD40wLQmyb8QR8JAy
	6RU2ACpQ+dx9Me1kadlek09dY+PAOZKKS3tI7Ls9pB30ooXOarHsvnvLZ6wtdKGiA2yJwpd8ejV
	1Pp6IhpP7smk/2enmR5DA9zbQO96PXbQfjBuV/5NlHCp/+EnqmZx56DnVlbes5qdHpCA=
X-Gm-Gg: ASbGncs2cOfa9L4H3R4Hfb/r3zA9e5hNOtP9ahxHTmVzETzFf2bRS1ee6S/9w/b+oY6
	PTFxoH8+36rOSdSQwm0oung6Ye751nyDP9vkxtPxWITnkbPI9Xw8guzi5gQQfyrxJXpj20Iee9u
	8Z6wcheq1CsT80PbBt2r/+UDuCZXNCETd/lN2RYMjG9XHPl4IGl0PvPSIGehJMC8GHmyo2QCVfK
	Tf+kmisW11IOqxXBE7701flot0H2vlb4dWRlNuDAO+/G4ruxWxxlGaKHLaiWHwbyrPnyte8mLYW
	W0nDsfePpd/duZKjCB0hPjnsmWWgKs8xA0lT
X-Received: by 2002:a17:903:46c6:b0:224:10a2:cad5 with SMTP id d9443c01a7336-231d43dcae5mr251623015ad.10.1747735169831;
        Tue, 20 May 2025 02:59:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1zNkmIzglmpHCldY51C3CQJv11RUYjL8aNcrJibJIP0RRhYEje06LWOqz1EVMX0ZVKwW1ug==
X-Received: by 2002:a17:903:46c6:b0:224:10a2:cad5 with SMTP id d9443c01a7336-231d43dcae5mr251622685ad.10.1747735169435;
        Tue, 20 May 2025 02:59:29 -0700 (PDT)
Received: from [10.218.34.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe887sm73495865ad.88.2025.05.20.02.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:59:29 -0700 (PDT)
Message-ID: <890b9e41-d5a2-4df3-bb21-71642b4e6410@oss.qualcomm.com>
Date: Tue, 20 May 2025 15:29:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
 <20250429-ddr_stats_-v1-1-4fc818aab7bb@oss.qualcomm.com>
 <b3119bef-d045-467b-91cf-37fe6832ff63@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b3119bef-d045-467b-91cf-37fe6832ff63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682c5283 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=gI0cpxkbm6pSp9-x3_4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: FdO39X0eifZUE2UISC1kZZPu5Cb9L0e4
X-Proofpoint-GUID: FdO39X0eifZUE2UISC1kZZPu5Cb9L0e4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4MiBTYWx0ZWRfX247ka4zrptmt
 bHsSTWDjnYf/fuh/clnLxT3nku11D3/PvAD0OfqM6qEVqsKojJmEE8ykynN7v+X/tfD3N+oJ2OM
 rhTA5dcFChZ8yGIOAfYi3nnN799PMq4WyJOgt3HNb/1Tg6az+kvGSzgty9exeYI+wkcsgCWVIWY
 z4oYP4hJOaCCJ67q8w8aCWaB+SesUH5z05R5a9Cf57znDFcJWvmCzxU0mC2AMDj9nEQ0fwU4KFm
 mgQiVbwjh72jmXQMPPjKJ+vpd1YX0fWlYJYfKG2r4HNEAl8ouQm+WVJtb9E676gb4vwaok8rQOo
 kPuiX1yTBjl40SI898dJ0WF9kHxSy1tXJhqqGoWQRdi/KJUhuegw+3ZXZCUtlVy2YUtrj78Zp5W
 LYgXgS7ul2LEk2DzfDhTGKO/DfxcOAqYM91fjYV7m8UvPOevXh9UrfRQ06WNQKXAex2GzO19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200082


On 4/29/2025 4:04 PM, Konrad Dybcio wrote:
> On 4/29/25 5:52 AM, Maulik Shah wrote:
>> DDR statistic provide different DDR LPM and DDR frequency statistic.
>> +#define DDR_STATS_MAGIC_KEY		0xA1157A75
>> +#define DDR_STATS_MAX_NUM_MODES		0x14
> 
> Numbers (count) make more sense in decimal
> 

I will change to decimal.

>> +#define DDR_STATS_MAGIC_KEY_ADDR	0x0
>> +#define DDR_STATS_NUM_MODES_ADDR	0x4
>> +#define DDR_STATS_ENTRY_START_ADDR	0x8
> 
> [...]
> 

>> +	 */
>> +	name = DDR_STATS_TYPE(data->name);
>> +	if (name == 0x0) {
>> +		name = DDR_STATS_LPM_NAME(data->name);
> 
> I'm not super keen on reusing the 'name' variable, maybe turn the
> outer if-condition to switch(DDR_STATS_TYPE(data->name))

Okay. I will use switch-case.

> 

> 
>> +}
>> +
>> +static int qcom_ddr_stats_show(struct seq_file *s, void *d)
>> +{
>> +	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
>> +	void __iomem *reg = (void __iomem *)s->private;
>> +	u32 entry_count;
>> +	int i;
>> +
>> +	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
>> +	if (entry_count > DDR_STATS_MAX_NUM_MODES)
>> +		return 0;
> 
> -EINVAL
> 
> Konrad

I kept this return as success from details given in commit message of [1] 
which made the qcom_subsystem_sleep_stats_show() function return 0
in order to run command like below to collect the stats without interspersed errors
grep ^ /sys/kernel/debug/qcom_stats/*

The same may break if return error from ddr stats too.

[1] https://lore.kernel.org/r/20230119032329.2909383-1-swboyd@chromium.org 

Thanks,
Maulik
