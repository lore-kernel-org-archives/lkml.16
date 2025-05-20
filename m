Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1741626460D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734969; cv=none; b=BBGr4CtYPqDjiGVYzEKtkq0EClZOZmm8iGioLh8F49JepXu4Dbyzy6iskauutokJHojajGyUJgc81vAcz86u0QvYrBKvn8+Uqzo8X6nVRWjhug+VmR1AC3wWokBtAefSvVxFRT+SiI8iYiU69c0naGcHcBcLaCqTB4I3Y5lMeWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734969; c=relaxed/simple;
	bh=lydJCPfDF+Y8xYT9SxfHUAuxF9fHAKVBJJJryGlb13s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhiEqvaUPDrHApm5KM9N96PVz3sZ47T4n76GY6uVWJRStlqgHW9DljQiBRqMsNSo/FPrXQvmY4+mwmtQ4B1AJl33sdOPLgQ91ypjsoN+gLD5aHD5bzrK7EtFzg34fogXBPm2EHM8zGmHMUZTqT4cLasoWVyiM+Xf0JP1O7dQsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gd53YKcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gd53YKcX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8XOZv006521
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjX5/V+ctXqdOjMw8zTg4Nlq+ms4eh9Km8lSRzO0p5s=; b=gd53YKcXimle9d3G
	TLt+k8OPw5A8nqqG91P8ZQbIa+RAAvm/UdMenyJ7XpVTm21PUhqKpWKb8A4kHNnY
	J7GOxNSiryLJBLdMutPkGPqEYz1J3r96HRGl1h8QsK6etyv/iXRZaaplJ3nq78xt
	e00rgLFfrx+am7GZnZHjgqFWnJpwy2W9kmki3vt01n9JadlB9t6OpOjaiutDxTwn
	srg/KBg6mwTSWzSjBC1FYDL7FNApO5vRZfefu1tqJU+nyTnPGxl/vMWh1Qv88BNl
	uPK+Dio5ZdvLqXOuY6CSfeI5th8ZjzavH6WUStYqlr6dRlMB/oV8IfLk7Eae1Qxy
	ic/pSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsy78p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:56:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2322e8c4dc5so21654085ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734964; x=1748339764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjX5/V+ctXqdOjMw8zTg4Nlq+ms4eh9Km8lSRzO0p5s=;
        b=IaNJsm3OZkJXkNy95Z56u5xYqOhmMNA3TlE7oElJuCuBWiI0FlQGZCCZIZtB4gu2ZP
         ApJvb/QObmWz8QvFvD2KB89YowC875p+Iqt+KbAB1xebWuF5tUkKkYiuBmBkYMB6sdEt
         b6/criWWCeY7BzWYYotwFhOzMCFLZo1l1gBzmpjrAaQVRWKWyXt3uwGAddv4nlDGsd/G
         jRdjVe/qv4K17WKFSGs0uW9Eu2BbnkyyJhziroOkdrHd6mz7G2e65u8ZEwxZzV/8DlNG
         VGmduNHs9uUCGuvrNooEDH7CqJokM0ZLypfl/34vBzk423+MPqJE9qUiOGpiKA2yoZm4
         t6Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVLM5QeBFSNUKVQ5YjEweJLHk0btXhpqfIMvTg9VXTdvQ/f6JLUJBSRRfwlJ4lWM/oDiPd/rD5gls1Ran8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWlgf73/+4esyxnAqv1gtfZLkEHRzF8EVkOVoOIeE+S1DxtiGo
	KtwC2dKoAw7HsVCJ6Sbo20oUNiyKIxdI2PvSJmyrfpYsjBjN+p9pxTNcpzDH7GEFly9PQgt1sGq
	J3vE80bOvpmmMiiy71qX9lTw2tSuRaIsV28Lz7FIohg8fkdpYlz6NWQO2n3lF6GZpKjg=
X-Gm-Gg: ASbGncsq3weQ2tdOSPcsz618SsBTzHgQrO/jCGJowgcsSX93uF5mkauYSH2cZS+Yb7O
	5jPrHX1TOf3Wr6SCiKvTSoAReV3tTkjn1m8y11J82RnR8Y1RGmzRfZuXrmZQeY3oVa37XAKnnSs
	JPM2QThbIgJzXMjSVmI/65RVVnCYkawJMU4PKzSjwwpaV1MFFNDZnFxxuwzKs7ja6TrVlx2BjPR
	QA/9HGWhzA0Fc+h9FyJCh7ObDdLQVAvCnuWIlwN0Emd2nlHD4CoU/7Md5vHZhQ9BeSwWZISdVvo
	4ikFqcIBTZ28oFfS+OQp1aAEu1VvHfA6kF+Z
X-Received: by 2002:a17:903:2ed0:b0:22e:7e00:4288 with SMTP id d9443c01a7336-231d459516bmr261366405ad.53.1747734964498;
        Tue, 20 May 2025 02:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh33sx6xak778kAhEweurUJhyiCBBd6ZzkgJMIBW8tS6ffISJATJB/IBlfQ5+JHy4btgFKOg==
X-Received: by 2002:a17:903:2ed0:b0:22e:7e00:4288 with SMTP id d9443c01a7336-231d459516bmr261366165ad.53.1747734964109;
        Tue, 20 May 2025 02:56:04 -0700 (PDT)
Received: from [10.218.34.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed576esm73392485ad.242.2025.05.20.02.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:56:03 -0700 (PDT)
Message-ID: <a14f58ed-fbc7-4074-ada7-3b9e50eb3047@oss.qualcomm.com>
Date: Tue, 20 May 2025 15:25:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
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
 <20250429-ddr_stats_-v1-2-4fc818aab7bb@oss.qualcomm.com>
 <c876ae55-a84a-436e-8c11-c0df236c1ea5@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c876ae55-a84a-436e-8c11-c0df236c1ea5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7TECulDF5rQBgQeAhoHnVyGTFxCDvknB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4MSBTYWx0ZWRfXwe+rtqjZmpSQ
 g2Eckvo0JdUzwZtsuE0rGMCXwS4+yEcosi5xqWGkQCFJ+G7tHdOfZ+NK1XiL4iiKouR2RPHwClQ
 G4ubt+8yLWSvQ8X8MBXhZriF82lwivKM+xTJsjTBSS9UAGYiNLKUnea0PYw4qFWhW4bAv3CHAFK
 1M70yPjN8WJkzgSZ2YxUJg884fPULaNkPNed56fm48Xa+TQCBIE4lp81+1jRmaL8KcjPFfDX8NA
 Ict2/oq+2OhhIN4QdOmVNHpCChYtey7s2VWFDqLgZyZ/PRqArSiJ+IQ7TTTHTwoldt7JMZnqMpL
 AJr/+G/vS04RG/v8CGuGZYLI9QCa96NtwU90x8lnzQFbVrc+pEKC/gGzVTm2cByYSyHlZSPEXPG
 S8KOQI9nY0q6uKboCCSkTVJwLeUkhUubk9kLGH3CKF6ntng5RMUk/vfcEsUnQIRLQ/F6vwwm
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682c51b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=Em_3BBobWHkwEKcIpuwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7TECulDF5rQBgQeAhoHnVyGTFxCDvknB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200081

 

On 4/29/2025 4:09 PM, Konrad Dybcio wrote:
> On 4/29/25 5:52 AM, Maulik Shah wrote:
>> +	if (qcom_stats_qmp) {
>> +		/*
>> +		 * Recent SoCs (SM8450 onwards) do not have duration field
>> +		 * populated from boot up onwards for both DDR LPM Stats
>> +		 * and DDR Frequency Stats.
>> +		 *
>> +		 * Send QMP message to Always on processor which will
>> +		 * populate duration field into MSG RAM area.
>> +		 *
>> +		 * Sent everytime to read latest data.
>> +		 */
>> +		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
>> +		if (ret)
>> +			seq_printf(s, "Error updating duration field %d\n", ret);
> 
> let's just return some error, instead of printing "error" successfully

Should i drop the print and also error, From details given in commit message of [1] 
which made the qcom_subsystem_sleep_stats_show() function return 0
in order to run command like below to collect the stats without interspersed errors
grep ^ /sys/kernel/debug/qcom_stats/*

The same may break if return error from ddr stats too.

[1] https://lore.kernel.org/r/20230119032329.2909383-1-swboyd@chromium.org 

> 
>> +	}
>> +
>>  	reg += DDR_STATS_ENTRY_START_ADDR;
>>  	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
>>  
>> @@ -310,6 +329,15 @@ static int qcom_stats_probe(struct platform_device *pdev)
>>  	qcom_create_subsystem_stat_files(root, config);
>>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>>  	qcom_create_ddr_stat_files(root, reg, config);
>> +	/*
>> +	 * QMP is used for DDR stats syncing to MSG RAM for certain SoCs having
> 
> having what? (you could drop that word and the sentence would still make sense)

I will update the sentence  in v2.

Thanks,
Maulik
> 
>> +	 * (SM8450 onwards). The prior SoCs do not need QMP handle as the required
>> +	 * stats are already present in MSG RAM, provided the DDR_STATS_MAGIC_KEY
>> +	 * matches.
>> +	 */
> 
> Konrad
