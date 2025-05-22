Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC11AA1F4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892932; cv=none; b=J5gXxtYcbTWRfQmF8sCo4+9IrQjx6/4gHQPchZloUERlykAjNPqr2fVHz7aiCw2fg1mnUzWUHgXOHMQw6gjbZBZvSOcdbfrJes5aBRtFWS6eOOD11RetBI2jggIkCHpKkyXOIwBy9qvw6ATiMjmTOYqtYPB8EQI7z9r9JnXbitk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892932; c=relaxed/simple;
	bh=4WjS3MBLsVQ0xHkhISeBISXe04qOs+58KuXq4fyilcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nm4P7ZRvIAR8Ua/+Xw3ZnzUOp/Re5i9N2c+oPpgPW0UT4VSYmw2bk4qcukpJy+C+Jb1bZmHXyQQ3ADzqga2syCUmcg8jte6Pl6gH0V9BaxfFirKD+rEeob32UzQxwv7fbx9a3gDCacJgtbyfkrJKaTom0//l+vwLIj5hmT6mJM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYfT3XNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYfT3XNT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIW9ML020574
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bou+gNCEaXL0XeXMvvAeOc95W8btQwmQ3Z480u1x1to=; b=eYfT3XNTyLlcHAdF
	P3z8pQKvHfb3KrA1ZBUuSVS8ZysKl5h2EL4qndGpsDzaYKIDhBqx8VjWuDVvk+B+
	Y6cQ0JXlj6HIg7fCBn8Qz4osev4Apmp0+FvB6OW2dpQArya5vb0sTkQTA+56T3Ud
	Pp2xzS79sx5/Ttxq/7AycEEZYc4yvLAncIWRhGhG3iyS3xYa5G0jKlcQUr+YdoE/
	xcIXwrM6wESr5Jk6sUCEh90KSTIO9Kl1ybFi5PV3c/oOczXrHL7ezhlAhgpVUQGW
	qRRfuWAs2eQUAifnLKJoYnwI24vlSbk/9ojpFaVL80oWFK0Oix50OWfOAqW0fbQi
	p7ILRQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb3fk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:48:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30ebfc28a1eso6722582a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892914; x=1748497714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bou+gNCEaXL0XeXMvvAeOc95W8btQwmQ3Z480u1x1to=;
        b=TeRVrpXoyflHDXtYSFkncZRcQMC1jxwJ72NKkw6SU/ShRun1gtCAWHx8B7LHbb8DZH
         6MYd7BfW0T++qtJwV9epf4YB2NAXTTGmqWMCTAbCKf2Ly1RH8WEtAIox7zNXwSW6XKEQ
         BDo+ut60ctbA74O2ohYT2gGmKlTad74Uwy23SouBNLSU3Q/nveKNSYTUnOGjvp8oLdnq
         J0tGv5tMu9b+PPXhnetZ3E0YMVfqtQUgrVeCQbNNWD+M9Xjz0HmTH+DvValESBtboO/+
         cvInSgy5U6N+A+Wn/0h1lkDbjKgXVx+LWA1zjiPPGRNCEUCsy5ka5AjA5nVSLzoWvVK5
         tmDw==
X-Forwarded-Encrypted: i=1; AJvYcCUjGC6pWj0k2krir8KRIWJXEfAhfanAy4zLfxVTVCZLnc0dMFHK+UhWT7my0qS/DNn4l1wwgFWHy7pAh7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnLmX2et1cgiMLj9oN2lZ65wobmUan9TU3jdyKlLQLKXxQY1i
	z80LrqPWS4LvUdr6fcpVUnxIA3q3/hv+sp3rFU3pcM3vmafuTA+1Hqj2zTs8NIpntZEzWpnpuPj
	ZAGWozyUAjdt0ckUPfyJm986z9oX1C3sYzrcqd1n3IlKDuf92HjS10Mx+WNeCkL/NPK8=
X-Gm-Gg: ASbGnctOM3LrSRsODWRcYa3qQrRlN2pu1MYxJFI9RMaIYHWPh7z4NjSDo0W+d4uI+88
	i0tMbV6pm6c8l7r/6AfMj+gTmamteVl6k37Q6XAzWsie6HkbnVAzn+4GTNxdzX+IqDgfZ38DGMZ
	VTmBpgI8kMlV8dc+R33E+OLLPdgtJ6+TzXCZU1oGbzNa3RKix4s4TTiSxhzweHsmOeSz36lY8EJ
	HoI1p+wOQopc94CGjlMmT0VaRGrPQlIgdn2nhPe4hi1Awo71wjx4eOj72PqOKh6mpTURshm34d1
	MJzM15VC7Bj+AncaMDuOr1rpsoV3V4jwJnAW
X-Received: by 2002:a17:90a:e70f:b0:30c:5604:f646 with SMTP id 98e67ed59e1d1-30e8322584amr37955908a91.25.1747892914342;
        Wed, 21 May 2025 22:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgNOxqToB1KHYabYJy9WhRgD+VYXNQftjQxJK1XEgME8dppZ7conz1MOF71gKpeb5L3SI3hQ==
X-Received: by 2002:a17:90a:e70f:b0:30c:5604:f646 with SMTP id 98e67ed59e1d1-30e8322584amr37955873a91.25.1747892913927;
        Wed, 21 May 2025 22:48:33 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b22a9sm4694178a91.6.2025.05.21.22.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:48:33 -0700 (PDT)
Message-ID: <d70da81f-29a6-487c-9781-c2fda6327a75@oss.qualcomm.com>
Date: Thu, 22 May 2025 11:18:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] soc: qcom: qcom_stats: Add support to read DDR
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
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
 <20250521-ddr_stats_-v2-1-2c54ea4fc071@oss.qualcomm.com>
 <c4442c3b-4f05-4031-8b1c-243e3028fc78@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c4442c3b-4f05-4031-8b1c-243e3028fc78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682ebac1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=9XHWcsYYPHk3R0Zu4VsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Z8cpJKgdAJhiSjTFeJqo8D_rsmSy2KVW
X-Proofpoint-GUID: Z8cpJKgdAJhiSjTFeJqo8D_rsmSy2KVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NiBTYWx0ZWRfX6BlbsXxaUqdr
 sB9YmhZHsolaUhicWq0QMPbcCmS21tRqoxtqqIbiYTvyCUnybN7jdpzYe83+MFaRjLIJiDgNyhP
 IqVQ//T5ix97Vgb6jtQnCQucyVtMvyQV3rtTT/WP6GMEUwveYqQGst/qRlu8kcEBQYZ0NmTchYN
 CX1HqtjpGiRUNXJ/3e9cJ+ebThcLWraVvrOXEInbWScMbV9g66viEZaqskfl/5MjOgfPLi7f1R4
 u4gSpg/HeRfaqJmqOEW0qsZqQdCdzmh1RQVtj0TrUIo5RtbRqAfF1yG3GLbtmxSZ2aQTrgx8ml1
 Gjz2TVxndo1qwogM65QRurF/i/lEfSNIOp2OVcmabIcXEV2fZ6jqzwWAjbmJA62mDsg8dl8d2ut
 2ueZkCmCPZgJHCmV12C6Mr4UEZlFESc2LxU5m9BgWpCM+BHUo29wLmZvyl49z1tLDqHcfuQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=825 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220056



On 5/21/2025 10:31 PM, Konrad Dybcio wrote:
> On 5/21/25 10:32 AM, Maulik Shah wrote:
>> DDR statistic provide different DDR LPM and DDR frequency statistic.
>> Add support to read from MSGRAM and display via debugfs.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	case 0:
>> +		seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
>> +			   DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
>> +		break;
>> +	case 1:
>> +		if (!data->count || !DDR_STATS_FREQ(data->name))
>> +			return;
>> +
>> +		cp_idx = DDR_STATS_CP_IDX(data->name);
>> +		seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
>> +			   DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
> 
> clang complains about both prints:
> 
> drivers/soc/qcom/qcom_stats.c:173:7: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>   172 |                 seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
>       |                                                    ~~
>       |                                                    %lx
>   173 |                            DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> drivers/soc/qcom/qcom_stats.c:181:7: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>   180 |                 seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
>       |                                         ~~
>       |                                         %lu
>   181 |                            DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> 

I will update correct format specifiers in v3.

> 
>> +
>> +	key = readl_relaxed(reg + config->ddr_stats_offset + DDR_STATS_MAGIC_KEY_ADDR);
>> +	if (key == DDR_STATS_MAGIC_KEY)
>> +		debugfs_create_file("ddr_stats", 0400, root,
>> +				    (__force void *)reg + config->ddr_stats_offset,
>> +				    &qcom_ddr_stats_fops);
> 
> else
> 	pr_err("Found invalid DDR stats magic\n");
> 
> (because through the compatible, we much expect it to be present)

The qcom,rpmh-stats compatible does not guarantee the DDR stats presence. DDR stats is only present if
magic value matches. The ddr stats was incrementally added over time so older SoCs like SM8150, QCS615
will not have the ddr stats and would end up printing this error during boot up but yes all almost all
rpmh targets do have the DDR stats present. If we are ok to print this error for older SoCs i can add it
or how about using pr_warn instead of pr_err?

Thanks,
Maulik

> 
> Konrad
