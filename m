Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87225C812
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201695; cv=none; b=mT4VL595wT82nLXC+1yE94P95XMtBO34HiaP42cn97DR4DeAK4SrlfYb6vos3JwJ0ieAL3Wi0piBv8YfI4n2aTXOl7k1ADYM3lpgutcuZOxI4VAi+zBE4bnBoLV2mPFg9lU9hW/QMjR/heXmTIiPTPm6orat6O7lPJkb+q519zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201695; c=relaxed/simple;
	bh=oEvN69p8sBgWkmJUdXqCwtQw+r14F79DPd3s+SqCWqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPSYwaGXH75vPRGjR3QiYAn82QT5AkXY27UAhesVr21tOVtg7l/VKUiLaV/SoZSxd8Cl7HJ/Q6KQ9M+lXnIj2tx/Fm6TxXfHbtiNwB4YMkZ4hDO+pxnMXhjPhQBryKlIni3uQsp0KCgXRyP8g5sNqy53tj4Ui3x9hzlnZ5N+vHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aB/aR1F1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aB/aR1F1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Df95p015024
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 16:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoReAk4HgTq2VsfM4ooMcOtk4AFKsH6ALJtlrQXG0fM=; b=aB/aR1F10eANzjIY
	sR/ixTlWHd0ANoXvrWUHjtGL5eEj6dlk2O/HnenQs91SuOQ1HXgsQVQTjrL+ZmcJ
	DbT8YyFZ5lfpBVEQ2tcW1OjZn8zRX1GnnnHrBBPjhxTazhNz5rkRsnozaGIAbNFa
	PVUtrTTQLlrB8dY2lqWBWenm2pSph9wRFx74NSpFCDAkU82dYF9wMgBk5yDdUf19
	gAfChMax23Dtdy948wf98TVgZumjMKbpJaRwP2ygd8CV6eklO3W6OUs2XYFAtibs
	3ghT6Uie0Gz1zxDj/3rxRU82exkvGe/HwYUuNVGLAbANKYP3KW1ravUBveUz3yaT
	F58p9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0qdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 16:01:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2254bdd4982so31436885ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201690; x=1746806490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoReAk4HgTq2VsfM4ooMcOtk4AFKsH6ALJtlrQXG0fM=;
        b=QBhN0uJOkw+a/3wKZjhvgovlBHGj8hkMgyjbeh4nEnmqc0J1XFx+qmHfsSYgLwbhA2
         EOsA/NQL8qxekT88U2hTd3FuuZuzXE1KDo9Vkj7XmZQE+syx0j0gTiI0LdNdCw3AOHxt
         5YjWpVvniRnm5fzcTLQkszj/nfjj0QV1yOMM7xSyLekKzFHi5QSznCgRaiXCLShDNpTZ
         tBqkfVssAF3y38shcrk9hRjaTvAmI7JrrFdiWW5ZvrnXCKeFd4HsEX7bBpWiEyEJ6BpF
         7HKRUcqiSgRzpEN4g71hPirph5DGFJ+/IgO3aJ8WsTzkxsLm8753YTlq/PYw73VuTVUs
         3+qA==
X-Forwarded-Encrypted: i=1; AJvYcCWLcfnIRGkvDyjEfD+wOuzmdXGG2bX79FOIm8DpQLSLmhZxWNzcxYrDq85Ge1m2JgTLmo21mesWJ9bACFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiEnCZIEOcecJ8aGaiXeWVWVG+UhxCbSVZRhsW5u9TSyi9pAI/
	d38CRVBr/N5Ql4bDR0aknyk/DmFSXUoMaxLYjMLE6Y6xFnsJxuKs7sF8fF++kN3TO/QDXnToI4J
	0uzcQDzmBmYN3Oh2fRDHHrvG05OKFHv7mRlXjbvgD25w8CR12KSu0UtHoXOgXknE=
X-Gm-Gg: ASbGncvdfX1z3pOpdiOCCr37zAMv4kobH9ipXy55M1dMHb/8pT1s9NfstwGrRMrBWTg
	ru9a3GWYxc+SjQJuVoAQmyWsuyJ39IjkE4zT6FCjg/Xpvhss+vDPxrHz2jbwT6ZeAc2UCcyImey
	cLxW89TdmCMomeVt+psgG+o64vSzmCvL4WtNGdPJk0YcHBDyE+NBvpinrEI2tbmmOlh8IuCzuzi
	rr/4u+gSJvP5LIsunwBNacDVjSD5t1cLvEQc3Fklj+F04FFJS2lcO3OS+cTCq4Kfkg7etPX1Cq1
	h1YUFhFj90kkgjwT9YqPceLdBchd0BklSlGzeDejv49+iI+YuJC/
X-Received: by 2002:a17:903:3b86:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22e1031f4b8mr53002985ad.12.1746201690560;
        Fri, 02 May 2025 09:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErV0e0vKI/fgoke9Y2Vn/UmFB0sglBHDOVAnYcG02t9Gkratp9oD7qJCWDutzkAvG97npa/Q==
X-Received: by 2002:a17:903:3b86:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22e1031f4b8mr53002545ad.12.1746201690057;
        Fri, 02 May 2025 09:01:30 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920e67sm952740a12.7.2025.05.02.09.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:01:29 -0700 (PDT)
Message-ID: <6d8f31ed-daaf-4ba2-9e84-227ab798ec5a@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:31:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] watchdog: qcom: introduce the device data for
 IPQ5424 watchdog device
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
 <4fvlhcztwqw3sp4wb32rbvdra5ativo5zypeokpglzezkmjfmy@vogadyshroix>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <4fvlhcztwqw3sp4wb32rbvdra5ativo5zypeokpglzezkmjfmy@vogadyshroix>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gdAdh2au-wGeH00t_G3o8_U1yoz_uMAQ
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814ec5c cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=--xdvnZNnXTZpBI9SIwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: gdAdh2au-wGeH00t_G3o8_U1yoz_uMAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEyOCBTYWx0ZWRfX44j9TuijGK2I 0pkD59DCcuNQnl6x5IXea+NslMoDpbNFwBBjSV3eZ+K4f80FregG68lUc78PkQrWIIVYxe+6v/P 4Ot17fTB6RMxcD9E3xNNYeqzVyLHtuUflye0BsbsVD1yKMbVgYv4eF4M4wWSK0TObV45n8+/RXg
 LtarB0XOVfI3xhcr+PZpOSnUNmqd250h6EPID5VjNCAoUkcmC0WuGmy//I/+v5SK6qETdOPilqG f4IoGyCTlj54drWpCRS/Wo2b50ZjzLeFLUaE3F34AYC8MyvUcmmqvhH6s/fXlLmzmCuHLMbLQOb HJnBp6xhL3v3dYW1yxnmxdaD+7HeELZjXIpkGVjvvqtpq3hk/kAD+Zrpq7fiqq8fO1dDzdov0I2
 EdfnRQHUUhOQOQHU6c1kv9WABYM6qcNfM+zR7UIl/FVjiEmpIrbYWv4MvwrRzq4mFRlcESJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020128


On 5/2/2025 8:23 PM, Dmitry Baryshkov wrote:
> On Fri, May 02, 2025 at 06:47:51PM +0530, Kathiravan Thirumoorthy wrote:
>> To retrieve the restart reason from IMEM, certain device specific data
>> like IMEM compatible to lookup, location of IMEM to read, etc should be
>> defined. To achieve that, introduce the separate device data for IPQ5424
>> and add the required details subsequently.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> 	- New patch
>> ---
>>   drivers/watchdog/qcom-wdt.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..dfaac5995c84c1f377023e6e62770c5548528a4c 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -181,6 +181,12 @@ static const struct qcom_wdt_match_data match_data_apcs_tmr = {
>>   	.max_tick_count = 0x10000000U,
>>   };
>>   
>> +static const struct qcom_wdt_match_data match_data_ipq5424 = {
>> +	.offset = reg_offset_data_kpss,
>> +	.pretimeout = true,
>> +	.max_tick_count = 0xFFFFFU,
>> +};
>> +
>>   static const struct qcom_wdt_match_data match_data_kpss = {
>>   	.offset = reg_offset_data_kpss,
>>   	.pretimeout = true,
>> @@ -322,6 +328,7 @@ static const struct dev_pm_ops qcom_wdt_pm_ops = {
>>   };
>>   
>>   static const struct of_device_id qcom_wdt_of_table[] = {
>> +	{ .compatible = "qcom,apss-wdt-ipq5424", .data = &match_data_ipq5424 },
> Shouldn't it be qcom,ipq5424-apss-wdt ?


Currently, the compatible string is "qcom,apss-wdt-ipq5424". So used as 
it is.


>
>>   	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
>>   	{ .compatible = "qcom,scss-timer", .data = &match_data_apcs_tmr },
>>   	{ .compatible = "qcom,kpss-wdt", .data = &match_data_kpss },
>>
>> -- 
>> 2.34.1
>>
