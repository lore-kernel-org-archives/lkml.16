Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2BD5FDA7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690169; cv=none; b=UvV0r1UAKw8T2Yg6mdBpZ/YSeuzHCGHw9ug+HKi9/sm7BZyGITGJgAsNeunT+gwJjKAGQzGcGSoc+p2OJoYpjQVPPuunYe2MVyJiYzPUNsxZAAKtenaloRjHQlBIWuHBrCcHU0xxz0MgCE9ByJa2P7ndA62xCdRA7J26c1g92ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690169; c=relaxed/simple;
	bh=h2YybH+XRgDnI2PHptBq1+7EEBKWY5/FnF6uBAh5gYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umaGI1/vWbxHwat+xius0H6g7L+EgsQB+Ls2Us9VjR0MUPtF3yxkDdYyMcSqZRfe6Mnvm191tIx/y/uW7YyLgLOxgKuVJ0Xib87t3YopQ0G/O3OnRCw8gVcRhsE7cLOACXOsM1tVI7qafHahN6KjL13Zmilv5icqMFeFT5YbYNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfDyx9IL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfDyx9IL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9ZeFZ019573
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTeNRly5GELRCVnD8QU3PlAAS9wAsvY6SiSyNqNSSxo=; b=GfDyx9ILWf39m6HL
	y1ENwcnQaE5R7SQo+V/zyLyL0xeZBr8C2CjbAp0RGLq4wnJT8vNrCEDIF/QBeg6E
	y/Ya+cbQ2aCwTtikBY5imUs3qtd1vGZ3LVBTaNw13rz67eltGfeD5TUfAgPYC+PZ
	Nxf3CUEa7HMXznO+BG9kAbcOeVMXxlKee1Nsl+dnsm3ACHJ17QzCey7QObKNQ0Hv
	zkFj2I/5fyMEo5tiLJ9MOy91dLKgYPkz40oMwwBgnr2zhHdHh71wjaW7qO+xqPua
	CmJStcHhP+w452WBj0YX31XMUz/8O7vbnsH2ZwhpgXnq/gt0/LM5qkCapkqpl8zH
	VnWE8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4javx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:49:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so10541721cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690166; x=1751294966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTeNRly5GELRCVnD8QU3PlAAS9wAsvY6SiSyNqNSSxo=;
        b=XnLP8trJ5ofvfzimUd5+x+5sMyn9QEbyTrhU/SsR32c5GITnVXYKiH8z7FGh3aW0Gc
         KHyMSKMMmiCvHPRv850fngDxAz5nq34rlh6RwfEj0Rt8lyOsie11WTuFqZF6D4tDxewJ
         klNHrC7I+fxO6X9HkClQtT+2NrjlwhTSg68bHVI0wXREOgk6Hv1bXRu4hpYUbMNOIPlb
         NY2YDPccbubWbC10pDKL4zERHir3Ls7oNZ9IzdwqJ75vIpOH10R3trRrUKLKSZFq4u9b
         WJdWZDNwRbYPf228vdXu3vtz/LY3zbDPx5YtqB0Baf/YFlGUpfFVsWuOUWIV3K/rViLB
         rGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVPJ01e1tblToGMWZWXzSi2DDum+h4Oo61qPGO1CuKw9IAGnsMKfRhpxK90XFSpONygxFSRaU4wtQSPNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNXVHB6+a2HWC/jZQFrAEtkkmaNCWy8UGw8HHWrX5Ef2hUoje
	l96jrPMI4vH1kLnKCX5LJCYYmw26b7TpQf3fx6Uht8iFJpdgx43inC4RnB0PGLjVQGrLxLGFdmP
	gGNahTHc+87Yn2jAbXvX39sy5n+c3b+oOuaDzyqIf5TBsFGs3qZt0uGfmmx3yv6+HzVg=
X-Gm-Gg: ASbGncvhYOXn8a3t9qmcpVPr9cMHErTDn3gKMO+JmpS6G2WPPsA68yOWiDDk8RaE3mP
	/Mm24fBHFhPFjgxtmSfWxtF96rN+WrccZ3M1WZEqbTH2DMfn0eBBcK75zHsXsEd/KxTyk7ShBTq
	mnuVXUowlPpjlXMklnxE7OwsrkB87TKOIgK70IqajsO5d0XnEm90gsQjeFS0TphO05J82gPUe9G
	AvjGRgiFqlc2SmtjLMVlpko73fZB4q8QadehEHb/61xSo5gunjTAyE2OnoOn4e5Y/lyvs0f6YZp
	tioPasBMUc3pmKK4L67JWkzmRgY9aBdALA4b9HlRyxURaPfPeiE4WXFQEmoXYHnlKDyXwoHTqC2
	XB0s=
X-Received: by 2002:a05:622a:13cc:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a7ac3ce0ebmr4232551cf.9.1750690165899;
        Mon, 23 Jun 2025 07:49:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFq4iUMxAEsWMxXd+QwjHQmfB5D+jlVT8b0sgi5UmOplNqnAMPZZcGLJGamO0dbGXTtbT8lA==
X-Received: by 2002:a05:622a:13cc:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a7ac3ce0ebmr4232341cf.9.1750690165381;
        Mon, 23 Jun 2025 07:49:25 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0c8sm730875566b.64.2025.06.23.07.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:49:24 -0700 (PDT)
Message-ID: <2a37d3f0-a3f4-444d-8166-f85888a27308@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:49:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
To: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFloifxONXnQbVg6@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=68596977 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=mrUvwfk0kWqCIX3n2FUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: P4brEu1rm-nt8UKJ6eotxdrSf4ORldtJ
X-Proofpoint-ORIG-GUID: P4brEu1rm-nt8UKJ6eotxdrSf4ORldtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfXw1BUVSXGbF/x
 zOeU8FGQe9il6hVS1vHzjvnazTiVMQwWG6eJb3tgaWQaqyodGfwSQTX4Qr+YA7wD9v9pm7zqaIu
 2jdQg3cIsN0dOJNS97wNoOwQyziQfXewvp4xQmPU/IyPyvbgBW3jOMZXA7UqCWOSxYMyJTcqcdQ
 N7Y8uvBqb0EEdKCfmBuTSVU+EQWIy3Utd3FK4430DoShQWey3jhcEOl0mQ8FO4Thpsa4LYAY7sg
 FWBKTMgoevyhMKRxD6rBwQ2v6pXI+lQiDAjr3ex2EqzD1f0OL8c18Gqixwqw/R/+xG0XG2sFWEw
 zHlIdMFn+OhJTVLhaB/wPQ8J9g4p5Xua5j5rVbW/P9HOhJAdcebCdTlsSoa9rR0tTPZdjHzKcrA
 IN0JjOlnCkoGOmJQtBBzwo4QCZF+rIQzoEsWPhl9rREOOeqz5wzVhR/G6wPKDbXIq29HIege
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230088

On 6/23/25 4:45 PM, Johan Hovold wrote:
> On Sat, Jun 21, 2025 at 10:56:11PM +0300, Dmitry Baryshkov wrote:
>> For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
>> update variables in the permanent storage. However being able to read
>> the vars is still useful as it allows us to get e.g. RTC offset.
>>
>> Add a quirk for QSEECOM specifying that UEFI variables for this platform
>> should be registered in read-only mode.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++++++++++-
>>  include/linux/firmware/qcom/qcom_qseecom.h      |  2 ++
>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> index 98a463e9774bf04f2deb0f7fa1318bd0d2edfa49..05f700dcb8cf3189f640237ff0e045564abb8264 100644
>> --- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> +++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> @@ -792,6 +792,12 @@ static efi_status_t qcuefi_query_variable_info(u32 attr, u64 *storage_space, u64
>>  	return status;
>>  }
>>  
>> +static const struct efivar_operations qcom_efivars_ro_ops = {
>> +	.get_variable = qcuefi_get_variable,
>> +	.get_next_variable = qcuefi_get_next_variable,
>> +	.query_variable_info = qcuefi_query_variable_info,
>> +};
> 
> It looks like the efivars implementation does not support read-only
> efivars and this will lead to NULL pointer dereferences whenever you try
> to write a variable.

There's efivar_supports_writes() that is used to set the EFIVAR_OPS_RDONLY
flag which then sets SB_RDONLY on all efivarfs superblocks

Konrad
