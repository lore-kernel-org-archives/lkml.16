Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970F1F2BBB
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748185158; cv=none; b=NN1m06L7aoBr1t9FJFpzPGOVnuGYQXPrYEj5MH9S1uyqkqFUFqaZkUnYl7UMbVKmzEYbYnfHrjEUbl7TT4rqdDNnwChb3EhHkQS1fUL3RzuF1cFrvdpoXocu0oIFR0fnm4+VgGzYo58LEf/PDFxd6zC3xOasbWyfmeOo+1jrgjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748185158; c=relaxed/simple;
	bh=xE6fy/U/Xd1619RdwrGW1EtBH0i0QH5wRVLULZkRiRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwP0o10a2l5Gf5/YcGwAmISp0LO6SwNMr+MLEI/0PI/7Lh+KRbx1PasIxmRnsFnoNubwgOzA82NGmGXnqSWmI/V/s5MUv7PlnEPzrLcndeQrlEJp/TbJfb2wT9UFeiDdFVlXC/Z/ZkJrs6CB4AqnhyMv1kJ8+yTHJRaP4MVHC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zo0A7hPF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo0A7hPF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P4xfSF026450
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 14:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdalSeioBM1G34Y2JK7jb6N363uwzkJxNYsn+lcRl2k=; b=Zo0A7hPFN2hNe4Gf
	3hQA7K4KlWUEe54SAU2RfJyfwrsSVoqSAMhYyQNGtllv58nhSuAmP9EpnIU5LIzW
	JJ0XLNkUWVBaWx4amj0RxzKRdmLoNOY/KqBZLGyX16LgnCdZ49VanYGk01EEfkf9
	Lc4SRjcqajEXo8nWgzhFl0wJfjLBQOcL24ia2Oy9BXu6iaGQcdRB61+H0lWCxv03
	s8dslNcYBze3Q1g4NiFkTwWjfl1dB1UgTCqUdRflhIZKLWSiRuyJxgM5N9R45UM2
	OYPtl28J7pR2c454kdY8CbYSHdwRpw7uZJJez3dvhuaAYJb37mIQlqHmbzidFoar
	UH9tUw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8t1fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 14:59:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b115383fcecso745378a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 07:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185155; x=1748789955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdalSeioBM1G34Y2JK7jb6N363uwzkJxNYsn+lcRl2k=;
        b=Sma0pBe6IN0YmMF2aOv/DYdRuqgkaQXnknBCCkXwiVyThKVHvWYkTN+DWeIrOZQFe2
         cwQiendyYMOqX4Z1KUIbs8N+I3cmwbm5//u9hZZm07XLMQG/rDGE9PZjZeYLauXmChLC
         Jil2Qw9fQw8d5oa4CKJ8ehBcp8BtiEb0qxcHeOo9UAsSFMUA3wcMBKOcwx7HlpD8wdzk
         ng0obxkTnyZtZdQfywtIvIfabBAb2ws/M9/KQQiVpa66N3qJzfpEoYZn33elRdXu8y1y
         NaiSCJs+ORfi/JuSuIz0+Jt0sgHj+3m6/kEVjW1RjeiFLNvrwIhRs/ZA+eHmey8B0iYb
         ++7w==
X-Forwarded-Encrypted: i=1; AJvYcCWKjxmTeVKqMgUgs4V+pUa7jubtk2YdJeu+G0mDFAxWKS3iX+Q5ZKapNai+TcU4GWbJUwNnVadSCd3S9dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Cp4PDXamyb59HWtzANM3sj5VGHvyB+TIqGrqtASIqxPDNVYx
	fBHf8rVIXJReDnBNppetusEl/IrBOT9WwtChWtPGLKpTBOx9rSLu2sabkrvbIMHugTOJ8Cvx8Ux
	zRynGf6PgZZuCs1AF4tJMZ/GyBIn++T8xnnooStVsxWnMxPO7q1FAzcOPPlaiglyBvDUmTsqCyR
	s=
X-Gm-Gg: ASbGncsoht/kg3VIk0xjcbaJn/qfD9+gr4ads9l6oTlfalKLah4mwsqpo+UyFSgcjMQ
	wtmJKDMhn9NxLsIGudNm0cJT8f4gsZbK2Sl8uubRr9HJQdaMDP1lfweiaMFZwbb1PU1Nd49ZrCz
	q+0rYPWApcrbNBckYUzqn/ZdXCf3Qmlrrn0vjK+va0Fw1+HX52vhKNS8TeD/rM0Tx8JU68SaBVc
	DAYWlp8a+QhrDWXfo2bU2dyNX0hFEvXoTSxCYHi83BEXjLJmn3BZsDWqlYKf5boti6Fdw6tUvSS
	EchqQalF7cFK8cFYLHTqM7R20r7YFfCraq9fNmc=
X-Received: by 2002:a05:6a20:4320:b0:216:5f66:e0ac with SMTP id adf61e73a8af0-2188c37f114mr11557834637.34.1748185154797;
        Sun, 25 May 2025 07:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLU3aT24fVKyftQI2U1zjvuWMrdqq3KuDLzkuv5c2nU1cnAm+B55PnJU37yWVODzRE2GDVnQ==
X-Received: by 2002:a05:6a20:4320:b0:216:5f66:e0ac with SMTP id adf61e73a8af0-2188c37f114mr11557804637.34.1748185154333;
        Sun, 25 May 2025 07:59:14 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.200.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b7bcsm16027466b3a.52.2025.05.25.07.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 07:59:14 -0700 (PDT)
Message-ID: <bb87014d-cdbb-4dba-8e80-7e9d3a1dd66c@oss.qualcomm.com>
Date: Sun, 25 May 2025 20:29:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
 <20250525-ddr_stats_-v3-2-49a3c1e42db7@oss.qualcomm.com>
 <lt3p3hqh657rx7knpvoxl5il7uohrcllmi5lk432st6nap3vqa@jkgpj2rb6daa>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <lt3p3hqh657rx7knpvoxl5il7uohrcllmi5lk432st6nap3vqa@jkgpj2rb6daa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68333044 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=5lH1I92KOXiYj6Rk8d+84Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ARcffcqOct04O5k4gLUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: jdBx6OIt1irFSsPVAsUaEB1_Iukx1xBs
X-Proofpoint-GUID: jdBx6OIt1irFSsPVAsUaEB1_Iukx1xBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEzOSBTYWx0ZWRfXzgMENjyIx1D7
 1hOeWKfczyYQewx3qPyTI9JbzhIZZ58z/BjNMK7uViOek34XbyajHlWz9NENiHzEKT9MwgPMMpc
 th9kWyu8X/k9uWlc87jQtxIfesh/Gci0iAhOth8Mzt22/8h5dy29JnRiewtGEq/k/XbDRdL+tUM
 Ulwoqr8QgIpPx3OeTb03tSPrpv4+TfF1AvuAK3N4YF3OslB0x+B6Sgc1W/yqejbY31U3oiI7ULk
 mHE9WeWbRGIN9/4X1bWNdBqP/5uLuZ4HuSFbze6EXLRTN5pggyHFH7h3JKD1zOfs26pj65AlP4I
 NZvbqGn+fjcbkKwxNL8hniNyAVDHs7HjhTx61G9QLyKmKLxVSuGhrTU5BQ3186DIogx2WF0ri8y
 cZIaohOb8v6ahcpaCZqLk5GJrnqHRLICJx5UIc2/0F4WHUQ3ANvMXxR4GDfHsR8C9N61Z6LR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250139



On 5/25/2025 6:57 PM, Dmitry Baryshkov wrote:
> On Sun, May 25, 2025 at 02:25:58PM +0530, Maulik Shah wrote:
>> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
>> ddr stats. The duration field of ddr stats will get populated only if QMP
>> command is sent.
>>
>> Add support to send ddr stats freqsync QMP command.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/qcom_stats.c | 34 +++++++++++++++++++++++++++++++++-
>>  1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> @@ -310,6 +329,19 @@ static int qcom_stats_probe(struct platform_device *pdev)
>>  	qcom_create_subsystem_stat_files(root, config);
>>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>>  	qcom_create_ddr_stat_files(root, reg, config);
>> +	/*
>> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
>> +	 * The prior SoCs do not need QMP handle as the required stats are already present
>> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
>> +	 */
>> +	qcom_stats_qmp = qmp_get(&pdev->dev);
>> +	if (IS_ERR(qcom_stats_qmp)) {
>> +		if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +
>> +		/* We assume any other error means it's not defined/needed */
>> +		qcom_stats_qmp = NULL;
> 
> If you return here, who will cleanup your actions? At least you've
> registered debugfs files...

I will keep this part ahead in probe in v4 before creating debugfs files to make sure
no clean up in driver is needed in case of probe defer.

Thanks,
Maulik

> 
>> +	}
>>  
>>  	platform_set_drvdata(pdev, root);
>>  
>>
>> -- 
>> 2.34.1
>>
> 
