Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3B524A079
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752074; cv=none; b=VTjUPWJiKrIwnI5pCQz/fXtajqFBnnBKPCiuTx30wZOdFa5ljRJMJW3y2G3LTW4EQ8DTOqzfxWkG2DnEMWZTsxxcjgLCm+lQSYs4Ov4D6KBlaIlgNgrUlOBQy4wu3xFvAwJd5Nyts/LAGPrTNJV3EalUhflsP5XnNm0uPHy9ETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752074; c=relaxed/simple;
	bh=qFi0PJjY/GA1ckQYhEy9BBKu3FmQYIbZut6fOgyE9AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sK4UCfaTH6L/mTlrm6qV+97PAIgojXFGFIlbXbH0YU3rvl0LG1dA9b7Kk3kRRe4A4oVwbQAi7Es3aq+gYCBUVvx/FrCupysn71heuj/GqV4eTcGKg150+9lzJqgVkJNk+xK4sQBd2hLKu3jLzvVavMRDJ1PO6QTOnHyWt1f0DA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFryM423; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFryM423"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KE7WcP023299
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mlNLJPj3keKy5AFMk6a+E68XXmDj4hPUVAPocc0XyY=; b=FFryM423ca3nRm9G
	9EWVIkfKHYKFJf3qZI6nG6kJEqZwqnhOjG5ve7C+E3K9PEn2SjplGrhAtR883N0U
	T9rh2oHx/HQSR3Cbg3yd6nd8QXRHfd6mT/4J7C0sribVshIsoKtvXGMLpKO8Xt5o
	rhKZZuNM0xh7n8tdy5/T0T5/OhKIxJXIpUOAZCBt3Nshlv8/k9+TrIrh9ZuALrMF
	rLLscKbHuSIy9jpqRkCsupsOolox2rbRg+i8if/rN237QEKxqMlAYmSNMEBEE0zr
	op00AaGrC9jRtb28Z1w58E71RnP/K4nxHBaH+E7OiBdMHflSDKV9dNUjNU/uP98X
	F9BBPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041vnw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:41:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so160181785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752071; x=1748356871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mlNLJPj3keKy5AFMk6a+E68XXmDj4hPUVAPocc0XyY=;
        b=QkiKlzkYxMEf1IPf2dxWe2auKQ1vg/TqQyQSGxupPrHRZouxm+QPWiwO8xWpckuVN3
         svZg53oR55boG+5p5ezHrC2Hmu9f9YCQrBGSqpUhuAogeMFu4RgBv7vVnAWVcwdWlv73
         7EaQjZEd7h4ywzcLfOanbl/UY0IRjm4gSYGEiOzpguCj3S2G6bxJLU5fh+Vi58MEKIrM
         VK1/0FO396svGDSdyErTWQuGQnD5vqf8kXiswX5dHi+1BYTPTLxy+3NzDrCjscznx10l
         yExw6QA+LJtBBVKbxOj8YZB3X4s6MpZZGPkMHMfWFwmmsM46fQJBhH9VUQ8u2kcAYJ8P
         P+LA==
X-Forwarded-Encrypted: i=1; AJvYcCXkXjKRrvQ/kCqrkR49ALBzVzkok2KvfnXhOCY8yflEItuE3ySFSKFdlzeFXXfLznMDXoob+ykOp2/Yz/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBcsSaqIYbBpoSEZFtqtfsaKnnEg8hpE9QXx6uJW67eQ02xxK
	MSCwcVMEdNWnHKYih5nLSnN2yHF83l8iuw/M2eKfqs4n0ItvglzgvpwX/w6mEzP8jNxrhzaBp7V
	mu1GX0lVeMDfJgKMO5JYUw06sc+DT9UEB1jFe4DEEACGg5l+GqwJYeuH8HDGTLcH5hAs=
X-Gm-Gg: ASbGncsAJqalP87+rIjRNGFfOhCa+bnjlhUsGkasFRYgELpbQfZoiDIuRTO8FA9A9ds
	FML7KCIFWYaEjtWj9396VxXuXIPmyDsGABb89BtTgex2AcHWllXGoejICFr1vyspLIpVVyK7Ksm
	BtfDKtydZkjtLf5eEhXGYV96V+NgKrJ0GcPot6OBlGdyoHtUoIpAfRucrH0nrSh2RVrJYo1Rby2
	w7VSgYARC6lR/YV8eliWpqOFh55oPPvJYxxiv0GFrG61lcHdnt+2wSuiLNpaNeXD7P0kmxPas84
	asgTZ2UkMPoRgqOQQt3WyKGzLjl+cps38mAKADL2X43OPbtwbZD/3dffhuk2ABsF5w==
X-Received: by 2002:a05:620a:240c:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7cd4bd26e5cmr922855885a.5.1747752070704;
        Tue, 20 May 2025 07:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPo77pYRE2NGo3yezIOzCTbQgbl0QAy276sr1Zd5knvtytt7Q4ECIBHJ/yj8osKF+sAF/G1w==
X-Received: by 2002:a05:620a:240c:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7cd4bd26e5cmr922854185a.5.1747752070132;
        Tue, 20 May 2025 07:41:10 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04aed7sm742444866b.9.2025.05.20.07.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:41:09 -0700 (PDT)
Message-ID: <c9b1422d-46f4-467a-b6c4-27eecae95897@oss.qualcomm.com>
Date: Tue, 20 May 2025 16:41:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <890b9e41-d5a2-4df3-bb21-71642b4e6410@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <890b9e41-d5a2-4df3-bb21-71642b4e6410@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExNyBTYWx0ZWRfX7QiKvTShRW2x
 kCsaGeFWUrGDf3OfdGlElG1qEnhn/uJX4cSZ2Yal1g8lTxfQYKq32movPmx5XnLvSrrUCRArerX
 N9OBlZ/UPjNdZ8L87lA+8NJn0cDedLG+lbjatBgT4DyKGSp5Wsoz3c+kHN59zsjrkk0laune9i5
 bykhKtyvIohRgJfh9coG5PRVSz10VUY4EoYnv3xGmaRhwyDSQ2R29FWiee/kUVoWfBpSbGUKwN/
 rn/Xvexhz7LGA91S2wm2mNNd/f6mvzPxSQecSayvM33mX2+NOXhWK5hrUGv+IYAPwWsaDpP0omA
 k102Nig8CiaxdbhjJCOh6J1+yhf71PRIuaAitjAF1TEG0sCAXpLAxyT1431g7Zo352wfhX2zA0R
 m5G9H1K7Ze4ywec+s4R1JQjuMACNCDqxwh53IK9gW2aTC2q7Dj8ArckGoyCg7kl2wE7zSMoO
X-Proofpoint-ORIG-GUID: jbA3I9kV2r9otrcE_srGJqZdmOIxKiwQ
X-Proofpoint-GUID: jbA3I9kV2r9otrcE_srGJqZdmOIxKiwQ
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682c9488 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=1C6ALYQBLxPpYy_y2mUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200117

On 5/20/25 11:59 AM, Maulik Shah (mkshah) wrote:
> 

[...]

>>> +static int qcom_ddr_stats_show(struct seq_file *s, void *d)
>>> +{
>>> +	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
>>> +	void __iomem *reg = (void __iomem *)s->private;
>>> +	u32 entry_count;
>>> +	int i;
>>> +
>>> +	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
>>> +	if (entry_count > DDR_STATS_MAX_NUM_MODES)
>>> +		return 0;
>>
>> -EINVAL
>>
>> Konrad
> 
> I kept this return as success from details given in commit message of [1] 
> which made the qcom_subsystem_sleep_stats_show() function return 0
> in order to run command like below to collect the stats without interspersed errors
> grep ^ /sys/kernel/debug/qcom_stats/*
> 
> The same may break if return error from ddr stats too.

Stephen mentioned that the errors may have appeared because the subsystems
may only populate data after the probe of the stats driver.

I would assume and hope the DDR stats aren't affected by this..

Konrad
