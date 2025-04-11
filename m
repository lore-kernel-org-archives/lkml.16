Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541527C864
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349368; cv=none; b=kHB1zByqYbUTzUQCAxgyF7wiNFWzavb3efwd/jPy6H/MIJtZXsGeSgjpVKe58/X/JqKRHE3YX4iJsnAR12YvvlIsVTwCGlomIxjaeXlmETJA3ZUC6BwdvMDso5GQzLPJ6WPbh0oz9k060NdQMMGwFIQBhXBxEBzaB9D7I0jGcpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349368; c=relaxed/simple;
	bh=TyvjaogtjTDx/T8QlFwk2AxVNIIPeTdvsx9AidCmtAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdJc303XP6fHoHyRtgfJcU1wCfEHdzN/zrDUWG/FVCpjcQIzLC/Zk9qbEJdvWdPA2xde6N15obWjgkgVUBZxVHZCvnFgVh45geAsYnwn1J5XVjjE88DXsZQlo2eHZNICIhTTIyWshaD8nP9rZgLMin+RI9G9lZu8sfeIXjotwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pi/no4Xy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi/no4Xy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFc58j016330
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUbjZYN3IQWyjpUUVwIb4CXGeBKGLs02G7FDkNMNVZU=; b=Pi/no4XyzIyab+op
	Y5QgktvJ4g/CjERWmNC8zs8ybBEJW9j0H0w6niTth9tfQHuHpwZvraMS0sC43Dd7
	sBhk/scAt6SsfeUrGne0tJWjpd6Zrj6L0b33C/+HEukdCMHfwpHyW+RIc+4cYREe
	5xAMwVk0dWXFdYcg0hWan9GHY4ub2bAWajFoz9YQvmJzjAkKREUjH2r+YwHUXUGT
	xA01nTWZRJK1eDTfzCW32a1tUaJ51cgboR6jVedoL9KpfTLuUcziFwNsmkCExkHx
	SiZps+z8JACvKyJ1h63O5tIqdiZdjIwNxNm9JyH0rtcNIqiAyl6VFmHlIRoTd+uE
	/5wIBQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1s312-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:29:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7375e2642b4so1208024b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349364; x=1744954164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUbjZYN3IQWyjpUUVwIb4CXGeBKGLs02G7FDkNMNVZU=;
        b=Hd636J4o1UIVmOZ86SgHCrfeAnhQcIpza2J3R656j6fQPwNulAJ80yjIBzEwZCeLaR
         +vlt3JYP+CVRMp9xI9WkhHB8PMaFuVhZa0ZywwuqfbEPe3QWIwD2fEhBW7tV3csl9NFw
         7CqE4ZuNAPJ1tQuAHQFYnKM2LtTVbO7Es/6vNmh12wgIFRTt8EN2p3gmV4RK26Sf1n52
         D+GLnz6R9lQhnvXLtcn7IAM+5jdnQNqTPqU+lBiLMZspaTPPIuCIK0pdalfQ2SxiIUlw
         ZcELaBZ1/wrPnyxfKl3qu13omDIOwtF6tbNMi1OudIYQkWuMTIHFGkR1U8OhuSTF+kcy
         X3gA==
X-Forwarded-Encrypted: i=1; AJvYcCX82K2ym/UPhXGyqRo4BJsAP7utiUmpikP4+exCYQyLVIsXRdwPJIcCIuP6ih2nypaKFsRGIo1p+A/hI5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEVG+PGU9pQDTi8ZzP79havDw2iCE8qeYvrYlj3JHCRhr1pCPD
	sRXWVed2glUmeffFEOgjUGlLh5hKaNDTdSNlNwqOJdsMZ1XcE+eb1Tzpt0wzXB8r8jhHo8SeTZB
	Ujqi+KJJBvDtWPFN1iFxT6mRiKsJg9ZLu7GkOq413fQPdT2AAGSiGupOyoGUYlJg=
X-Gm-Gg: ASbGncur88cyTl1OuMBGgd5zUh4M7MSt4puuy83o+aGimFXlWxL6qOqEBGXPGncWE8q
	DOYsSRQ0fXyNnnrANoDnDU56CUaZ7XI085n8HEf4i62k9Xnc6eExNsQ6pzq5duvumWfAne8u40q
	atcPc59bfko+aVZh9jdcv0T+bNnreBeNF/pwwcpCYmg2S0w8LIV3EMO+D4u10TyTaJWMVJFIm7A
	eL+fDD7yKUIRs+4T+DjTSpd1OUVRq6mxbE+lu8qM+wNDqoqVqSLKTwqeb93VRfntqcbkiSm4228
	QeYalqWd+6ZsJgq5BJ2CGVXEKKf36LBLC2BOTgeHVq4TYDAmWC9S
X-Received: by 2002:a05:6a00:ac2:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73bd11e6d4amr2204617b3a.8.1744349363888;
        Thu, 10 Apr 2025 22:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKdA+yoEfaH4SyvUyAodpSjhJ93TtNdrQMglLHoYzjAgSJgmykhbyYfCXYlFjunZmyz1dJbQ==
X-Received: by 2002:a05:6a00:ac2:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73bd11e6d4amr2204583b3a.8.1744349363309;
        Thu, 10 Apr 2025 22:29:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e34asm581481b3a.137.2025.04.10.22.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 22:29:22 -0700 (PDT)
Message-ID: <7ecc8079-1110-4692-a257-09c4ea2041ad@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:59:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] watchdog: qcom-wdt: add support to read the
 restart reason from IMEM
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-5-e6ec30c2c926@oss.qualcomm.com>
 <e02e7431-2e30-4e65-b04b-15fbb0bcd8d0@roeck-us.net>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <e02e7431-2e30-4e65-b04b-15fbb0bcd8d0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bAAjXwXLXbAsjUt50C49ASWYwFgm9ZYq
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f8a8b5 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=WtALBppYY-rU2wiDHIEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bAAjXwXLXbAsjUt50C49ASWYwFgm9ZYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=914 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110037


On 4/8/2025 6:03 PM, Guenter Roeck wrote:
>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -267,7 +303,9 @@ static int qcom_wdt_probe(struct platform_device 
>> *pdev)
>>       wdt->wdd.parent = dev;
>>       wdt->layout = data->offset;
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +    ret = qcom_wdt_get_restart_reason(wdt);
>> +    if (ret == -ENOENT &&
>> +        readl(wdt_addr(wdt, WDT_STS)) & 1)
>>           wdt->wdd.bootstatus = WDIOF_CARDRESET;
>
> This ignores all other error returns from qcom_wdt_get_restart_reason(),
> but in that function it generates several dev_err(). Either make those
> messages less than an error, or treat them as error and drop out here. 


Thanks for pointing this out. I will handle these errors in the next 
version.

