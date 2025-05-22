Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C51AAA29
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892932; cv=none; b=T1wM9Tso9Piaj9MWK766htxDu5igPdBKWV8GJYokJ8PituG27zMiQiD9cE7kQSAD6tqYkwwWtfDxBv/1K8SD1wWkl0FeecTPPLDFSbJLN96zGJ231XBvvgpZJilH/JJnhmYb+SePE7jeYvYBxlKDFTGsrvkoy99UDG7e+R26YFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892932; c=relaxed/simple;
	bh=kHwGvfpRcSfgekebHrGvH+4JlYV+j4+tLz9hnEjO4WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIoWVnomhT97qEzk3EF4V2lkOlhsuqkK/pAPDS551L1U7h8u/qdusiASxBC9WrwiObPlqEmL9opHLWEZCpoFapmQ/2RFuG128qGrd0hAXWxuk31eLLy/YIVDDGEQDzLkgbpdt1mWXHrQ9G3J7CuCA7RyiU+1poNjBNNDjvjG/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjVjkGZi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjVjkGZi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIDGLU020957
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4vHLpr7qMld85Cpj9/eavLWpeLWA5gKA9GRNVpwlFA=; b=PjVjkGZiFT+gZgSK
	oNzDFUKAO0bkqGIznJEuFA42DqSAeh+YTQNOd8aWobD0w8lsQsv+ahr0tTHcURrU
	xQfOLhNWeIsSfaHCVTUINFdSxjViDWb56WF3TxGElGipkXmM/Fet20WV+ZJIOqIu
	ETUemrKbbjjAOWpw5XFVraEh3WWlB6Pn8n/aQv+RjQPn6W3pwc7nm1oeCITUCn7u
	WzC2ND5MLohx7wvIK8lC1cbXswlXj2Sh0r9HR/YsMH3gmKEtCpAa8lYih0S7DjgD
	CYJe8tRfs91wnhCp1SP26hxZbK2ZaU9Wh0LMxZGqQUhIy9P3T3eIWizE59C/yNPs
	vgpMcA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0590f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:48:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742a969a4d0so5126158b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892929; x=1748497729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4vHLpr7qMld85Cpj9/eavLWpeLWA5gKA9GRNVpwlFA=;
        b=iW3KOlMrjgP9xa32ERwdUJzC3DpShSISoG85geD9krC1kqYy/EwJv8V86a7HkxXE/1
         8jXFYeBbUxX0nfRO6XH63OsIrYU6v98+F9sBnix/IYZszbqq3IlPKgyp7Pj5CFAQU2yC
         1N/72UJA8V3Lc6f9uHX3Cd0uVTmMqcS9tNZ7WPyfZ0kfGryPi0AWuUS46Zk1BBUpjxa5
         kEVR+K8RZmRycurbsMsODnELlhu/Rb6EsJDhMcjiKNRLsphRkISGZr6XzRrtGEHFwbYW
         rscjTBRAlo6059ic4Motv4jnHNyfSeR3cdF63ovBT38Vuo/kgF2tS8mPhiZEUODKdgPD
         N5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcaMMx+KqZnVJOQedA+kHQLEMk0va+8xcR9tHdQH7ejLXVK6V09Ynq+aE6lrpDOGhpacm0qMdGhUcrGns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWi0XBdeO0tvrZjA0Va6R5eOpoxJ7cWJOwUO5Ut4/vcI7v7YQa
	ZlTS9FUYWv7xrJiiDlc07apAU+5G4z489yjpZ7X2wBZJSuiWeUFTPdtoYkeC7BChPJx2cA00SPz
	CGJyYWDkqKiLZVNJBTirJnsqHbeuogH6MWqCAPRE47kro9mEN0uw2hgJxNyvXbXZ7Wfo=
X-Gm-Gg: ASbGncsaXVYPxVigkgBqo/+xbdvOsVfUpaf6cJmTuWtL2P6Xfd07WbqmIq2tZGjRoAb
	bo28diQw5jPUhYvE3fJ3lRMJEvo9FS+/7notR6U0Yno51gJmJbARA9ZIldmjw0pcc6hDJwoXuw+
	o7TQlKG77fSAb69Zthl3DH5Z72wBbQKEle+A9HL/jz/pNPuW8L7SKIgMdlQONrQwds/7CJWRkfW
	n6h2xOHI2uJCVZQL9yhsJsLVd9IczanoHze3Xb/2dSTFRoPhIeK+v4dLHVRNPQ/L5DGBN3aEbzQ
	MLYKp0dspGZ14x08ok0bnh3cEyYJsRIIndsx
X-Received: by 2002:aa7:9ec6:0:b0:742:da7c:3f28 with SMTP id d2e1a72fcca58-742da7c3f91mr13611724b3a.21.1747892929493;
        Wed, 21 May 2025 22:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsY64kzMtwnXc1itvu5C3a9SrK0aV09w0OO5xp0bk3Iho6o+8xk1V5tkGCktoAWxnCoi79Lw==
X-Received: by 2002:aa7:9ec6:0:b0:742:da7c:3f28 with SMTP id d2e1a72fcca58-742da7c3f91mr13611696b3a.21.1747892929088;
        Wed, 21 May 2025 22:48:49 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8cc59sm10516689a12.40.2025.05.21.22.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:48:48 -0700 (PDT)
Message-ID: <7f1d0db1-bdd5-4d50-8880-c0a1d2df4af7@oss.qualcomm.com>
Date: Thu, 22 May 2025 11:18:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
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
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
 <20250521-ddr_stats_-v2-2-2c54ea4fc071@oss.qualcomm.com>
 <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: If4yLYeJhjFWVo1Sd3Ch_G7Wl3iAohYk
X-Proofpoint-ORIG-GUID: If4yLYeJhjFWVo1Sd3Ch_G7Wl3iAohYk
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682ebac2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ARcffcqOct04O5k4gLUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NiBTYWx0ZWRfX4g7IyStWjmW4
 OgtHwVzH9MpWExralAPfcaCcPKAZ7PHv9DJoWZh/qLZQ795b4rJUB1WOQlp3qewWa2mqtsOJJGe
 SeRov27GFwr4jqrel5QdZncLLrxJm7tMEEpE9E60HSm18lw8QNcGLejkL+SasbBN2vwueGaPsUp
 cSN1HxXk/8jaEe0L6sFlVaZjo/bQ7YYTeGHYpzG5+soldDP5AwMjdJ73em6BL+c46KnzK32dsSf
 2TVP8tVYOTqBN+XMWlf8X9OjHq3AwwilV7QXn+cLlHhQnwksQaE3y96bEalnoMq5gQnEjUOL+yt
 2DbvxKAs/hOI8H2HQR4ozuqkpXDNT2ZjO9OmBB23sj35Bw03UNC2fi7qCLQr+ih890LF3pNjjYF
 vtOypjELUD8C6kBAXbHKAFoJd4U1/1BeVzDxuFBKdxtK98g1sZgYonqNt0tJuzQnrtZQpwo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220056



On 5/21/2025 6:22 PM, Dmitry Baryshkov wrote:
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
> 

Yes we need to handle these cases.
I will update in v3.

Thanks,
Maulik

>>  
>>  	platform_set_drvdata(pdev, root);
>>  
>>
>> -- 
>> 2.34.1
>>
> 
