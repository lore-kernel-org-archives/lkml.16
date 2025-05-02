Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845E72147E6
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746224017; cv=none; b=X7AHUfMDk4lyZfQVcwm1zatYMxCWpedd1DRrMRNOEOgwV6etT1xUyxxMIsaJzAeex87AiR6fP31oSO3DGYoIDobGv8hqxwNLJD1Fns1aAYZEI1isNeJFbOErlPquWcySoV6SKxfTtvD3u7UX50KbF8mMkjCGEYOSwzQ6hriAEA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746224017; c=relaxed/simple;
	bh=B/4oel2Jayif05luXBjTQ2gQHyrpYR6gHiiXrNHCI0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LV9q2WE6PD44oXv6RNcdqdMYCJd6dCZ6vFPRd+fVdlbcb2+gBt/LZJAJIq8xKPftrxarhvDQy5KC2SwxgOq/cx8g96eyhhL3nNi4d64A2v/pGTDXURSR8f4VKRpZc+EmtLehk+cjwRILDYRZGey/SxPrr5AMtDPqaLKqOzx4e9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9Cfj/vB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9Cfj/vB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KArWk009074
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 22:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3u+LFEbRiQNy3BBQYrtvebcgwT3QRI0neYbS9BxwHRo=; b=K9Cfj/vBlOqJXZVx
	TC6CuRfwOD+V/eK97Tn0wzE/vIL0n+KunPhYfkK+mOr0itWC6ZonZSyQ+W8XvKkc
	uIZzReHJuzUFWcuJFhOVWDBxsv5VgSR1ABCA6yQyBkL4mXcWcbyhm+qqrQ2eKk56
	Z9kFT5DKE8PQPOnTX5sN2cYjK+LnnqqU52LenT+Y18DTsvuMQM/qBaPuy2k4po25
	BzRW5obstt6drVgrtB93iDFSDINrNV6ELoQyMY5SCJg50nq2Tk2i+UmWEjFYfQqw
	gmzA+/ftvmf3W66dxwy2dWwp7+6aeaG9QCwr0fbYWEthI9sAxVuB5yG7M4pkFUa6
	1rEccQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u21hg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:13:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae537a9d6so4720531cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 15:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746224013; x=1746828813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3u+LFEbRiQNy3BBQYrtvebcgwT3QRI0neYbS9BxwHRo=;
        b=IyuowjUcXZ0r8WLxZB8K8oItFaXGe8S4p72oIyf9lE4/8aFoADe7KtZ7lfilmzUH34
         7jqSNiZnGJ4PXV2eFTYOPG4xF3iev92z0R4S5X/Ww7ISTAhlX+dLRrq7ed7rBr2Sc/oV
         2aHVih0OKZJYk+53z04SCzqOr+Iv6pwpN9zGyNS8BYgHTikAylHLgLKMTvIH43d06cqV
         S19MIyRUFQH0LxsyaxG2GRimo+AGAMxLfJEZDGgsRd9kiwnvZPZ6VA3TcBHi0W4qSs/6
         51+s4JrmCsSY9L/vUNwyw0iGaRas3Tu6aCiMj/1ZR9y4gJCzj38pl8taIC759YxY/nB0
         2Mdw==
X-Forwarded-Encrypted: i=1; AJvYcCVrs8inFuI9ie9W9n6DLn1JDgzkjtAueYgelaHB7gmnZcZOzDk3NJ2Ms8S1GWDct3wQjreuEcFuSArXt6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YypeNWdeY88GpX2RYlirx8bsuMs3LuE+OmcETQXd/TnBi6zHk/H
	rL2pto112k5PckBCh0SLynkDIpMlSvO91GB6EIRfLJkFaXO5finVtapK8EsbBMOt4xEHfDJvgUA
	CajPSLJ9xfKXSB3cYrFal/zvq7PCI2DlRwhwr9NFy1S1e2J+HnYu7pliej7ib0ms=
X-Gm-Gg: ASbGncumZCWygIgdKyCGllrfAp0Wq7XikO8qKVpkqZY8prRSe+mUv5FiyZwogBw9K6o
	9yfweV8WI/aOYjzx/Bc/KCl/hmEzWoYtHOqtOfhgYKaNR1EQjZ1lOhmPAwU08ne8iKIoBC9afDs
	M2kMpumGatExdg6ZJbKs8/rVq9q4YxP6g4QwvAfOeI9tJUuMWRwLmwycbPF0fRSEV+y0j5Cc4Fr
	sv4CncAsEES2Cl7AVXRZvFiHxfDdQ+LzeGptEkGRRBtzTp9lmqPLMUyzNYN4MDpF4da1qdRzLvj
	NTKnhrFcXM7hW42yYRdEaFE+NSCchL8D7Vswd3lNJgWJYCv6LDhgJf20HZ+nnwCHNbs=
X-Received: by 2002:ac8:5d14:0:b0:48a:4c52:bd5e with SMTP id d75a77b69052e-48c31b1878dmr26360351cf.7.1746224013232;
        Fri, 02 May 2025 15:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIB+E/EBRSm2CckOBaiga8MoS0NtnV1KFVCJ4k4ISPBAkdwIYAzWP5vXAN6u6EtdsUp5XAjQ==
X-Received: by 2002:ac8:5d14:0:b0:48a:4c52:bd5e with SMTP id d75a77b69052e-48c31b1878dmr26360061cf.7.1746224012721;
        Fri, 02 May 2025 15:13:32 -0700 (PDT)
Received: from [192.168.65.170] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm104865366b.138.2025.05.02.15.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 15:13:32 -0700 (PDT)
Message-ID: <3333cfa8-381e-4c10-898b-a3c4cf8159e5@oss.qualcomm.com>
Date: Sat, 3 May 2025 00:13:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <f8b57c99-2f6a-496b-a6fe-3e2aa6b0b989@roeck-us.net>
 <83c427de-c678-4408-9b04-2f3d2eef9fac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <83c427de-c678-4408-9b04-2f3d2eef9fac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6815438d cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=i7H99Igfn1kKsJUMNAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4MSBTYWx0ZWRfXzuRGnLuCEF+Q +N3Jddv5xUzbwP/hgoevtGP1NU9nuj3ljkCbl75EVXRlWgzoTaQGzsfNkeUBuM6ulZCL48vdMZp XiuPcgI11G9Z14xJec4LCi7FKtOAJC5zJgO7E0t1JjjhOTS3enjNmrlNmL/xfwMfOzdZfyPyHrY
 7DZEbIiphUTMMqomI2bomn9rKjP3Wx4B2gg4hOu405e8t/qm4EkEJn9J3TZRZkla0SSA+EtyOUy adLrrlV3tsQWH5G7WyUcy+Gh+xxNk9k2grFSK8YrXtRYl4km+RLAbWV8HrPw6XV7RSmHhfgVkF2 ztSHhUFeMeORSvm6on7CDmtsPjiM33nz+oQ3n8TmatOi6Z53j4aH/NSwdkcgHjXhjzwAAUbDxm3
 3pDacsTv2dvmDJOPJcmzc2wjfnIz6JU0+wta4bZ2VLzedH59zG0hk4kFZIuSYKq+H8vXxGct
X-Proofpoint-GUID: kxgU742gvsH_amT-ypHtJn57Gsf_vGRa
X-Proofpoint-ORIG-GUID: kxgU742gvsH_amT-ypHtJn57Gsf_vGRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=759
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020181

On 5/2/25 6:08 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/2/2025 7:03 PM, Guenter Roeck wrote:
>>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>>   {
>>>       struct device *dev = &pdev->dev;
>>> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>>       wdt->wdd.parent = dev;
>>>       wdt->layout = data->offset;
>>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>>> +    ret = qcom_wdt_get_restart_reason(wdt, data);
>>> +    if (ret == -ENODEV) {
>>> +        if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>>> +            wdt->wdd.bootstatus = WDIOF_CARDRESET;
>>> +    } else if (ret) {
>>> +        return ret;
>>> +    }
>>
>> Seems odd to me that there is now a function qcom_wdt_get_restart_reason()
>> but it doesn't handle all means to get the restart reason. Maybe I missed it,
>> but what is the reason for that ? Why not move reading WDT_STS into
>> qcom_wdt_get_restart_reason() as well ?
> 
> 
> No specific reason as such. I was little hesitant use "goto" statements and such as. So I thought this would be little cleaner approach. Please let me know if I have consolidate everything under qcom_wdt_get_restart_reason().

You can try grabbing the syscon handle, and if absent, fall back to the
common handling

Konrad
