Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BABE25D1E1
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202110; cv=none; b=SNnTdDi5FDcdYkNsRVclL3b8+9+3eyvLX4P3ZvmxJTqnwTdwWC04JFpIgSJ6ian+/G0SZBMnkfXAXBYCmnDMHuqRa9CZSgrEp+VeJLjRtwKfCxYQmsBKkbMeAmWJ1qudjYVHrRQs1CcLfVeeEqVpSYmZ7Sr3Mg4jlAeks6aRCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202110; c=relaxed/simple;
	bh=Aiw78cv/p68kfnHm9huW2dP7/SF2x9C9ceZ11r4BIG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJBQYkEdYCI2qNtvheoMPaiIkkfY5Ubv0MmfxyEz3VeTYTOsGllo+hHzES/3daVusxRpxggWCQsfU/JfY47sXCpn0jbdNvAYmiwCBMIaSuyL3F+pA9/3B8Q21s1uefMQGqNurdhF4R3vMYBl2G0xoQsMnCIs1zPkkWb2ZnX0JIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzOEDFEz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzOEDFEz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Dxtfs015317
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 16:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCURuZphALca4oH54vQyehTX8P10HSrIKR7pzdxmoGo=; b=kzOEDFEzns8z6IKY
	VXiK3lU2R9FtEJXfIuXSeIuGjANAeIHkUaH7UZMchouRAl0MGM3yKdgFztz5vDVT
	cNrs06uZmUz4e4TVMRxwr4Erx7nVYobpvfzA5WtxA2d9Mq2KKQroX/rR7wnnjkKn
	8jLcSfrAwYqko1uSWk6ZTc2VGsADLOS3ofRt0ghC2q+rZJKNkvIP4SiurWTN+qt2
	ToJglBlsn069C2iZLRd/pIFNWUvzGjP2+4MNrHYclV0V54gf7hUXWocfzSNn7BRO
	bTKfxhvRRdBLyGU40DJ9CUDcDWQQK4dfDgLDOB6MKJ3eYLH71SadEwdhJTVcHg5K
	7Qgm1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u20v2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 16:08:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7391d68617cso3190904b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202106; x=1746806906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCURuZphALca4oH54vQyehTX8P10HSrIKR7pzdxmoGo=;
        b=RRNANfjrVsVyYdEfqDPtJXDRxgPeLGDJjjhyI2U3/p617HBKRPz/LO9Q4Lz3wRctKM
         YjLIVQXrBDEvJqyg2M8V2Ieu7XsKM2punbwOpXd1jhoey5mO8arGjsB4urvFDAQD/4K/
         D1e4IxN7YGCWAk3ILy56pr+acL0kevvruFXEznc7czd55RzqokNk60JtgXBFE/sBkwy1
         ubepGv4Yv+ZMgWbVZAndEK0eqRvy83TIalVu4iH+9FVVqaGnN+1ggwdn5jUgnodfFo3o
         GFH2lYEovcIHjzkO6Irqu5Zfj2M1C9VK16uXVG71C3L3PCC+9YoI4CO0LzwRe4chl52Y
         UC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvjfWCk8xCtzXNKuUOtdLoXSyEgd2r3enSMKWotosULnXvz59YVV6DM9NiZfwLRpL2BEvujeLvmCTXgKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ0Zi9o0QcQODpazZHgCr7iB+nV3PGuf7wc472YCpOch/NnFgY
	LTFX65DLl5FoYhZMQFf9TmJcuirMB2z6UVeZm7mKD6scrFMH4VccfME0uucuLOxJRUWKi1jq9lx
	Cm6HOU6N9HlJTrvDmBjCpaf8pswsTiu8msRop7CmYNDPwcoCKafH8ybLiDW5GXvs=
X-Gm-Gg: ASbGncvz8MU3SEPtXwpaxhVCv12PP9W4gnfmNzZ2KH08jn4fJ2AcJXt2KhOIqGTgkEZ
	+AHU8TkVJWpuw/+Jxj2GYBphEyhY6cAsO8U6pl9mAcBPuuElbC6jMNlVgHeJjbrNV9f9bPcwS/9
	TntCc/swQhO7JqUzyK1Nd7t+vlY1+2rsvKKhzavEqNaX4ekpfncvu0BgfWkLW2OO78rQ7KSE+Cu
	60Yito4rsUi2uBxR8iJEH1UKyAQyNQTtm2ox1Hfv0Rh/pYE3U+6TNp4RBqde92JIqIoEyRXiSRx
	+o3HtTiWY7Tlw3M16vmqXnEmffzwM9oHievfU2goEGM3qcXTXU6z
X-Received: by 2002:a05:6a21:2d0a:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-20bd7662d30mr9078753637.10.1746202106428;
        Fri, 02 May 2025 09:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFngvS5zV7065QKg5lJ9bJgIZHUtGEmOAi1Tej78hd+AnKg2zkgE5D/a4yAbK+mQc/qiES88A==
X-Received: by 2002:a05:6a21:2d0a:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-20bd7662d30mr9078706637.10.1746202106026;
        Fri, 02 May 2025 09:08:26 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3922041sm956661a12.2.2025.05.02.09.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:08:25 -0700 (PDT)
Message-ID: <83c427de-c678-4408-9b04-2f3d2eef9fac@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:38:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
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
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <f8b57c99-2f6a-496b-a6fe-3e2aa6b0b989@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6814edfb cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=9TRSRwEFIUlA1hFsN1MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEyOSBTYWx0ZWRfXzguAJiqFCEaG Hj4JAJZdPNcvvQlBwbtovvMKMuniMJ5o+Hfe9xrLaTFhUpFFsOetVevrmEDflcd8Nh4jkl7B6G4 I7A8I8mqA912IWPeTyzU5nj4C7CvU44IFXThOe/WmcVb0Mi7wFImqQjzwk/SfhgypXQooK+s4Xv
 UqHsY15tbG8/iTooRP3RjgT0L1UdHuDSBz/nU0KTrMW50HqX/Q1W8US+cpoqdMn/Mjga3cv8Hm2 lf/k/oTew0Iwmh70E/9P2bUooWjj+NaqYIJ3W7wZKN0kyZKUptll4pwa7LfQsnqoIDvbHtTn1fa iTqmnw5QC9HjgnMjHhthg629+oaDoUuAde8tQaKDBfp49qOQMW0d5X4+KwZvjwprz7G5ySjifRD
 oNjNehtHhgOyBdyDPR8e7HhDRykwtCFuocHRa3xi2gHbIOy80MEdzYAw0TjhmS0gIbsyu+og
X-Proofpoint-GUID: ChKI6T_REjfXq9BlXll6XQRLCd4aCJbU
X-Proofpoint-ORIG-GUID: ChKI6T_REjfXq9BlXll6XQRLCd4aCJbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=956
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020129


On 5/2/2025 7:03 PM, Guenter Roeck wrote:
>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device 
>> *pdev)
>>       wdt->wdd.parent = dev;
>>       wdt->layout = data->offset;
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    ret = qcom_wdt_get_restart_reason(wdt, data);
>> +    if (ret == -ENODEV) {
>> +        if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +            wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    } else if (ret) {
>> +        return ret;
>> +    }
>
> Seems odd to me that there is now a function 
> qcom_wdt_get_restart_reason()
> but it doesn't handle all means to get the restart reason. Maybe I 
> missed it,
> but what is the reason for that ? Why not move reading WDT_STS into
> qcom_wdt_get_restart_reason() as well ?


No specific reason as such. I was little hesitant use "goto" statements 
and such as. So I thought this would be little cleaner approach. Please 
let me know if I have consolidate everything under 
qcom_wdt_get_restart_reason().


>
> Guenter
>
>
>>         /*
>>        * If 'timeout-sec' unspecified in devicetree, assume a 30 second
