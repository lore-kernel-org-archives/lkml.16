Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E212BF01A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089205; cv=none; b=ANcwxPJHWBmBwVTMMIQz1+PN4ySwQmfWj1CsgNfV0KcSej+DJNxP5bVN9HiNd7SNrLD14yhzr66Gn88QqNLdFrHw3Zrbk9OjGhgOzXNFDqtQMglXfasbP752MeQ1BfhBurWgVGV3Ces6op0k7rHMEsr5y5ZRK/aQhsiUOfa9qmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089205; c=relaxed/simple;
	bh=xe8kV5y3CWGlDnK3dNNThBhNLUjz9DxmDV86Vg2im7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LISDkZiWjbU/XLpQw8XvnBRfTKf8QtbTnteLmQHl00LWDfajfGok1pzxajgnjNE08bWfKcXFkorO/WtDyL3kenovScxkK/GzTkjcLAlKEG44w60gko0KKD7SAp5z5Q7GbsjjX9X2HJK0ctvv8zZ1Y1ChU+9/IOWwtj/PzenEh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjXswM0i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjXswM0i"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8knU0003269
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ls5lBrZa1Chnre4Poq+4r9uvpQzSemOb2h+RYlU45Y0=; b=YjXswM0iC/mXVieN
	JntauwXDL0Yu2WWS/tTdJieZzcK9Jsfu0rhDapgiisLOHCsvfNnpFjVMdSAYutZG
	3+kCinjzgQgseveOc6Cy9J062wHe+nG/oQmRrm2+smJK+d/3gXUWYk2N3ChJts8U
	6hh9TGiAWxtjdu4tvilSwi2xV/1L96Dd0DTqcRyfh4gfEFvvN3nnfjWNcbKaHlE8
	Ns5m5+Isl+qDNHK34gSPeEhQMYmWtpM+uT7KtHqesbu1xShK1q5ZG2sYr+SkA87d
	2kI7AZqmsc4jRisbRvhIgKERvM9ZDIHU9I1LbhCM2aeKMTIF0m04lYSzmbWn0ZF2
	mzEsvQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2318th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:53:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad29c1b72so66722876d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089200; x=1750694000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls5lBrZa1Chnre4Poq+4r9uvpQzSemOb2h+RYlU45Y0=;
        b=FWzNfCJvVvUfGjFAMGgAKUQgRiElXsnq0nB+XkfjunN2PDBNfOIJZEUKVT5P4C3T2S
         ZFju2QAny5pEfiJgP5NfhcuMetASZ+IabD68DFQxRfNfiW3wx08kZFPWRKGqgWk1c+kn
         eCxplPkur6OswvFt/pmenBxVcD2jslxGXy2zoqkcAnNrUhcuqGYiDqPIaM/spk+H6l6G
         DP7ck5UDHFv6nFRUGc4nRGyig64SZXx18nldUwPtCTikjtaRcqo4GB7SeclU0ViOifmk
         uQwDeGhQySVTUDbfSScHBClUE34dsje3vyVO53tbFAGqGKQLQkzNLBleX2xE5XmzeK9G
         66Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV3XaBS1aRCDVm7z82s+3PKcKMTfTZdoMaHbjZepvLaLhg6f/D7HTV1RYvEZwUSc9VRgdGhiPFNfd4b1a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPqRe59TNGlCISav2nJ943Cevb786KofruIjEVMr1zYP7MrQKv
	+3qFZ7t2vUt39n+8rVWH71anMceLBH8Bmo/Vx3rnG5nql6NAxYNlUvkUwTYRJP9F+MHwr/oCbC4
	wesnSP2uG8Q+5DMC90SLJqH2JAJTBW/Dm0Akf5fzDwueFOGwtGHyrTAAG0eRTfzvLwcg=
X-Gm-Gg: ASbGncv7HssINfu236nWSNbH3CT6Af+jGbsB1h9I/SYh5FYaBMjfVS5Hf0V8havGXf9
	uzTcl07cYWj4XSUuiIu1m23meoFW/DZOhM7LWNp5O1fQaOU103WAHjHOwJLS7KoUi6RHTJ1qpkS
	mAHEArPWsSDg/IVholHpVzggiH1hlQV4NV2/sH4WSDxjVWOSFehzk23PwYME+1WIJOyJgMRyZFz
	gY/ynmlr/YMlqIeByglrybrD1j3YoAtNOwQ9qEzZfVrdUpf9KLqGoJhSYnuVoHdz+iLcNj6ehW1
	sGGFUlivGeEdrfSrtAzAasDJnwgyj5j+T5XXfhQqQXVtSs9HyHXefJpiT2FoRz1P1l6utfpyyso
	cebaM2TpsNFMMhay0RmaPXLiRlqEYHBPspLmC3KfjJACbNePQgpTzCg0EWMAw+yRvq/gHpr+NWk
	I=
X-Received: by 2002:a05:6214:4589:b0:6fa:c81a:6229 with SMTP id 6a1803df08f44-6fb477a4fd7mr146959886d6.43.1750089200285;
        Mon, 16 Jun 2025 08:53:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9lFS4BlqFJWe80LkGYOUJy1z8hb3H4PDMo7stBR5xzLLNxsbI4MtjzfYuC4UMNrju/BVvSw==
X-Received: by 2002:a05:6214:4589:b0:6fa:c81a:6229 with SMTP id 6a1803df08f44-6fb477a4fd7mr146959496d6.43.1750089199802;
        Mon, 16 Jun 2025 08:53:19 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b? (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi. [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1fcea3sm1587702e87.254.2025.06.16.08.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:53:18 -0700 (PDT)
Message-ID: <8af6ce19-7aa3-4fc7-a963-d8ab0cd22b02@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 18:53:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] interconnect: qcom: icc-rpmh: use NULL-terminated
 arrays and drop static IDs
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
 <786e3337-4c14-4281-932e-6a93aac53cf8@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <786e3337-4c14-4281-932e-6a93aac53cf8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: --wV9OhnOXty4hPhRUKihqN9xMSNrwKW
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68503df1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=_0zWR6m1PiBrtj89O7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwMyBTYWx0ZWRfX74htaQBXB2uL
 1wGJMKIcrcs5vkcVolxJYn4bX8NgYhX6BiHEmAZJ/dm7tqB542U3nBvPpmmYlQdRPLAAxW3j596
 23XKbdKsW9+LjRhnbfENc4sn6nR6Fzv5lfDKdQ/7b9o4+DBQS2PXqWrfh5/1OgsTVhrmoeNlz44
 eiJRF2zopviSKStWvNjIyAqX0fkmzXQkluwBSa+BrDP/mxV+ib6t0/cldPB2toGmXAXgT/6l9zx
 iFo1Kk8pVcpZzx4vYjNuBxLfe5sQNJZwUEbEXUO4ijZqTR+0Up2OCqnQ0hvUVbcvgeEI9vPZcFG
 +t8omgc46jr3kgwaRDfWss3lDaUmeM0JQnOnRQ1G9jzXngj3Km+Iqfwykl8hBLQWEg58/1vpXXk
 4scxIAMk2D5zjz/Ayi+19XptF0mBMbiDj8v/pyvMkbBfIas/Xp2OoH7ifT8vBmh5yCwHhcNS
X-Proofpoint-GUID: --wV9OhnOXty4hPhRUKihqN9xMSNrwKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=853 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160103

On 16/06/2025 18:51, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 16/06/2025 02:28, Dmitry Baryshkov wrote:
>> Qualcomm interconnect code has been using .num_foo fields together with
>> the arrays embedded in the structure, which results in hard-to-notice
>> mistakes if .num_foo gets omitted or incorrect.
>>
>> Rework RPMh interconnect code to use NULL-terminated arrays for the
>> dynamic IDs case (as now all the arrays contain only pointers) and,
>> while we are at it, rework all the drivers to use dynamic IDs and drop
>> static IDs code.
>>
>> This series touches only RPMh interconnect drivers. Corresponding series
>> for RPM drivers will follow up shortly.
> 
> Can you specify on which base thie patchset applies ?
> 
> I tried v6.15, v6.16-rc1, v6.16-rc2, next-20250613 & next-20250616 and 
> they all fail to
> apply on patch 5.

I'm sorry, I forgot to mention 
https://lore.kernel.org/linux-arm-msm/20250613-sc7280-icc-pcie1-fix-v1-1-0b09813e3b09@radxa.com/ 


> 
> Thanks,
> Neil
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> Dmitry Baryshkov (28):
>>        interconnect: qcom: sc8280xp: specify num_links for qnm_a1noc_cfg
>>        interconnect: qcom: sc8180x: specify num_nodes
>>        interconnect: qcom: rpmh: make nodes a NULL_terminated array
>>        interconnect: qcom: rpmh: make link_nodes a NULL_terminated array
>>        interconnect: qcom: sc7280: convert to dynamic IDs
>>        interconnect: qcom: sc8180x: convert to dynamic IDs
>>        interconnect: qcom: sc8280xp: convert to dynamic IDs
>>        interconnect: qcom: sdm845: convert to dynamic IDs
>>        interconnect: qcom: sm8250: convert to dynamic IDs
>>        interconnect: qcom: x1e80100: convert to dynamic IDs
>>        interconnect: qcom: qcs615: convert to dynamic IDs
>>        interconnect: qcom: qcs8300: convert to dynamic IDs
>>        interconnect: qcom: qdu1000: convert to dynamic IDs
>>        interconnect: qcom: sar2130p: convert to dynamic IDs
>>        interconnect: qcom: sc7180: convert to dynamic IDs
>>        interconnect: qcom: sdm670: convert to dynamic IDs
>>        interconnect: qcom: sdx55: convert to dynamic IDs
>>        interconnect: qcom: sdx65: convert to dynamic IDs
>>        interconnect: qcom: sdx75: convert to dynamic IDs
>>        interconnect: qcom: sm6350: convert to dynamic IDs
>>        interconnect: qcom: sm7150: convert to dynamic IDs
>>        interconnect: qcom: sm8150: convert to dynamic IDs
>>        interconnect: qcom: sm8350: convert to dynamic IDs
>>        interconnect: qcom: sm8450: convert to dynamic IDs
>>        interconnect: qcom: sm8550: convert to dynamic IDs
>>        interconnect: qcom: sm8650: convert to dynamic IDs
>>        interconnect: qcom: sm8750: convert to dynamic IDs
>>        interconnect: qcom: icc-rpmh: drop support for non-dynamic IDS
>>
>>   drivers/interconnect/qcom/bcm-voter.c |    4 +-
>>   drivers/interconnect/qcom/icc-rpmh.c  |   20 +-
>>   drivers/interconnect/qcom/icc-rpmh.h  |   13 +-
>>   drivers/interconnect/qcom/qcs615.c    |  713 ++++++++-----------
>>   drivers/interconnect/qcom/qcs615.h    |  128 ----
>>   drivers/interconnect/qcom/qcs8300.c   |  911 +++++++++++-------------
>>   drivers/interconnect/qcom/qcs8300.h   |  177 -----
>>   drivers/interconnect/qcom/qdu1000.c   |  470 ++++++------
>>   drivers/interconnect/qcom/qdu1000.h   |   95 ---
>>   drivers/interconnect/qcom/sa8775p.c   |  493 ++++++-------
>>   drivers/interconnect/qcom/sar2130p.c  |  795 ++++++++-------------
>>   drivers/interconnect/qcom/sc7180.c    |  892 +++++++++++------------
>>   drivers/interconnect/qcom/sc7180.h    |  149 ----
>>   drivers/interconnect/qcom/sc7280.c    |  840 ++++++++++------------
>>   drivers/interconnect/qcom/sc7280.h    |  154 ----
>>   drivers/interconnect/qcom/sc8180x.c   | 1013 +++++++++++++-------------
>>   drivers/interconnect/qcom/sc8180x.h   |  179 -----
>>   drivers/interconnect/qcom/sc8280xp.c  | 1257 +++++++++++++++ 
>> +-----------------
>>   drivers/interconnect/qcom/sc8280xp.h  |  209 ------
>>   drivers/interconnect/qcom/sdm670.c    |  712 +++++++++----------
>>   drivers/interconnect/qcom/sdm670.h    |  128 ----
>>   drivers/interconnect/qcom/sdm845.c    |  986 ++++++++++++--------------
>>   drivers/interconnect/qcom/sdm845.h    |  140 ----
>>   drivers/interconnect/qcom/sdx55.c     |  611 ++++++++--------
>>   drivers/interconnect/qcom/sdx55.h     |   70 --
>>   drivers/interconnect/qcom/sdx65.c     |  577 +++++++--------
>>   drivers/interconnect/qcom/sdx65.h     |   65 --
>>   drivers/interconnect/qcom/sdx75.c     |  498 ++++++-------
>>   drivers/interconnect/qcom/sdx75.h     |   97 ---
>>   drivers/interconnect/qcom/sm6350.c    |  838 +++++++++++-----------
>>   drivers/interconnect/qcom/sm6350.h    |  139 ----
>>   drivers/interconnect/qcom/sm7150.c    |  860 +++++++++++-----------
>>   drivers/interconnect/qcom/sm7150.h    |  140 ----
>>   drivers/interconnect/qcom/sm8150.c    |  930 ++++++++++++------------
>>   drivers/interconnect/qcom/sm8150.h    |  152 ----
>>   drivers/interconnect/qcom/sm8250.c    |  977 ++++++++++++-------------
>>   drivers/interconnect/qcom/sm8250.h    |  168 -----
>>   drivers/interconnect/qcom/sm8350.c    |  901 ++++++++++++-----------
>>   drivers/interconnect/qcom/sm8350.h    |  158 -----
>>   drivers/interconnect/qcom/sm8450.c    |  823 ++++++++++-----------
>>   drivers/interconnect/qcom/sm8450.h    |  169 -----
>>   drivers/interconnect/qcom/sm8550.c    |  683 ++++++++----------
>>   drivers/interconnect/qcom/sm8550.h    |  138 ----
>>   drivers/interconnect/qcom/sm8650.c    |  713 ++++++++-----------
>>   drivers/interconnect/qcom/sm8650.h    |  144 ----
>>   drivers/interconnect/qcom/sm8750.c    |  779 ++++++++------------
>>   drivers/interconnect/qcom/x1e80100.c  |  819 ++++++++++-----------
>>   drivers/interconnect/qcom/x1e80100.h  |  192 -----
>>   48 files changed, 8655 insertions(+), 13464 deletions(-)
>> ---
>> base-commit: 410f15dcfe222c06f0d6379adec630061e88dc72
>> change-id: 20250613-rework-icc-0d3b7276a798
>>
>> Best regards,
> 


-- 
With best wishes
Dmitry
