Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19D58F5B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749618344; cv=none; b=pyujMTPYdtzu9ecSCvJRbJ4OyUkPHrtuzg21NO7A6Agz9U/C/daQVSv2UdxOpBqrkCQTKPdy7e+sOM6OWufYuE7Pk/2AaZ6bTLYBUM+vu4M0xxDApL58aQEe7lMD1C3Dn/ZcmFZzooZdB3AF8Zs63P5mBxGnV4b+OJMx6iXopQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749618344; c=relaxed/simple;
	bh=aQYY6xCCcAYMYix4A5vJaId13rEdEFR2wIi9qkRVWTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUGkOqltmzSBfbs2wFdFCVZ/4e1xlUXqCgrN/El2L06gOS1MzhH0RLr12Jjf/iQMKaISO+8qj+RFhYjGFCBTrKSfOqgVYkaLQcj1lX5y4C7Xv/O9u57/2at31ODpNQaN+my1r+be2Ae/ncVyV2eUoXBi9JEjHplqM2c55Yz+MhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gceIcVzP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gceIcVzP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPrKB005825
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iI9NMDhEkMnV0ltFhVkLoW15tu5Nhk3mtinuC3YUV4o=; b=gceIcVzPl1+9oJHI
	QjtKp9RsK47gzVGU6HlHQ8EKdhG7O3j+Wq6vXEKJawePiZVooHKH5QuFCVYUF+aV
	ImCBHgoj7VoOaJCft632KoQ7CTvEGSp4D2oRha1h9W/VgDYKB/hppM6ydjwj0qX0
	04rHx6RGDiyWJtkr0Jn1kck757jed8kEixC1zChgkmoDxMuVNlX3NWRuwRFwz+kZ
	pnttwuywuGYVF2fX+AhQUpSruB5GjyO+UWc0gagVydQtCnQxGuRhCNtVIdyHg8uf
	8Xq3wjewqUNIsF3BFyXawiZSGQU3FrWQaSAym1zilyLuiHaz0d39oDU4aeIjG2Y1
	F2Iqlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6bq3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:05:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so6863871a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749618341; x=1750223141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI9NMDhEkMnV0ltFhVkLoW15tu5Nhk3mtinuC3YUV4o=;
        b=cS6po5qijjJYrGyiZ+XddTfQ6XTIP3Bh6G+MMEM4VPefEbexWzbec5bQPRKv8VbCCI
         6AgCWi5jKJ1yTJPYw+OxFwQJDpbeHFEf3Z6sKMi3BeDdAW0erU8fzAg8TykmWqHgC+FI
         Ndo8I7gOCuClYGGZOlZoFa+FjcKQG2yvUrh5BZOVLefeynDH3kzPFPvKREvzUwOydNZC
         jhU26FNkyfredjiBqHbLVrgqBRsbUuuYQEsY6KxtNUBJjpyAceto676m2XFjWDaK772V
         vFrdkcKv3DcQb5x+wP5KQwaxpGJUco11qXmz6pyfz02ujl9JdOv1nEKK6cm2VFgvQO4i
         z/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCULeZ0zl1RR77+zAngWheQ1wjZsgbyCz712iClqNVaIijLPLoh43BgMrBNIagt1UUCJkC56TDnF4aP9A/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxtXqG7o362OtUAP+zj+HDYNQXko+avYx+T8FdrkWrrNNA/jLG
	SgWMfPijz22yiQcRr7wMGEnaUQrurG1exWVeQaKSSa4GJJnjP2B4+jUSD0n1GeI5jfU3ev1Gnm6
	J4c0/TzN7BAbDLCrin+ZY58asYRO9kt5lGddb5TpCFyvqhA9XDWGtw0uJ0wm2Ej/n3Ec=
X-Gm-Gg: ASbGnctl2dTsG8GhKQ0o+pDr6sRQTLpljLMBZns9KHOifTXhnWOdeX8g88QYwhdoUB/
	xLos5P4J9TPPfWe9tKh0JlrPo3ruqJKK6uQXUP2axtl88KaZ9v3gy2Xs8RU5WW3dwSv/bPVjnw9
	/EI1iTgtF87Y/XIO33piAub1hwWjBog1fz6UtXwiYZ7Z4ZH/nbqmpWMCguBulbJeFQdgBEPdFOj
	rtRr7YP5JWBOhXJfS277RW0H6ksTVcjdWkdfzthHISi0NYiauH9l+xCk916oSP0HqvCewNS9fWn
	lmscwLaHBangiVDPCg/IG6dspPmCJctiKw/hVQ9BKEsMYVg33BvkKAc=
X-Received: by 2002:a05:6a20:a11e:b0:215:de13:e212 with SMTP id adf61e73a8af0-21f88fd555amr2079345637.15.1749618340590;
        Tue, 10 Jun 2025 22:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlfmx/FndYaMxUj1Mm8zVA7Xx2NEooQKaHlG/FisCHiAXfOwLHC3oXYqQPC02W8mtcz+1vmA==
X-Received: by 2002:a05:6a20:a11e:b0:215:de13:e212 with SMTP id adf61e73a8af0-21f88fd555amr2079311637.15.1749618340150;
        Tue, 10 Jun 2025 22:05:40 -0700 (PDT)
Received: from [192.168.1.4] ([122.174.137.154])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee6f1dfsm7587129a12.18.2025.06.10.22.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 22:05:39 -0700 (PDT)
Message-ID: <9b8ad81f-28e1-471e-a8fc-9e64578aaf4f@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 10:35:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
 <sy33khkakjxi66amjbuugnypjnegvd4z4dyfzvrp72qkuv3roh@dxaymdc6cfad>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <sy33khkakjxi66amjbuugnypjnegvd4z4dyfzvrp72qkuv3roh@dxaymdc6cfad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA0MyBTYWx0ZWRfX3gtaQW/V6Ypa
 ZcLXcQEykJ185un5JzhTQI+nFaNy2YTiiyqM/FveZUUGT4u2p//RoxzqecxkYAvAejRH5j6GsTD
 +kvTSuvoQTKYa9ROX+s/98PT9i7d6NHRleBQQSTCXF9fFL94BlZoYfa3OqjZ+HhYG+m1DZshfQb
 I2HZW/fmGRsjyOTPVa1F/RqFf2PWZj2nIYNGB99fddekRDs6vNc88/Qa+EARcdB8rMJXSyM6hv8
 9blpRag99NIZF2Hwsbf85E9I62x0KNiuy2uJ6xgCqqHrj7DpMUCmgOMtTPq4HOnFkvkOlUjqVUj
 wXu1qz/wHLGL9JQZe2+iPydbH0OVqdck7/eglfBVMs90Gzrh0CKBM6pNb1hn9zi64OT1M5dkzOa
 uI9iFSuVL4X8Dn1ypNd4JWeBYDOt6Y/DOMPRnSWDEQ9ooUB8h2WJSvXIG9zP/HjGduy/ratd
X-Proofpoint-GUID: xOXExrLd37LA_PXWHZC9XU_eauUZrtaM
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68490ea5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=oYmrSCt18pvj5yoFrZalCQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CUOy4OKjmV6SWOl3eY8A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: xOXExrLd37LA_PXWHZC9XU_eauUZrtaM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110043



On 6/11/2025 9:12 AM, Bjorn Andersson wrote:
> On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
>> When USB controller enters runtime suspend while operating in host
>> mode, then wakeup because of cable disconnect or a button press of
>> a headset causes the following kind of errors:
>>
>> Error after button press on a connected headset :
>>
>> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
>> [  355.725844] usb 1-1: device not accepting address 2, error -108
>>
>> Error on removal of headset device from usb port:
>>
>> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
>> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
>> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
>> SID=0x0
>> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
>> PLVL=1]
>> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
>> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
>>
>> Enabling retention on usb controller GDSC fixes the above issues.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>
>> Note:
>> The above mentioned issues pop up after I enabled runtime suspend after
>> applying [1].
>> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
>>
> 
> It makes sense that the BCR issue appears after the flattening of dwc3,
> but why would the suspend issue pop up?
> 
> The change matches what we do on many other platforms, but I've been
> hoping we either could drop the retention or clearly document why it's
> needed - so that we know if this should be on all or none of the SoCs.
> 

Sure, will try to root cause why we are seeing issues during suspend (on 
sm8450) and come up with another patch.

But I remember on sc7280-herobrine (and IIRC while testing multiport on 
sa8295), when gdsc was not in retention, after entering suspend, we 
would see a disconnect and reconnect of connected peripherals during 
resume (probably because controller was in off state during suspend). 
When I tested with RET_ON in sc7280, I see the re-enumeration after 
resume never popped up.

Regards,
Krishna,

> Regards,
> Bjorn
> 
>>   drivers/clk/qcom/gcc-sm8450.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
>> index 65d7d52bce03..f94da4a1c921 100644
>> --- a/drivers/clk/qcom/gcc-sm8450.c
>> +++ b/drivers/clk/qcom/gcc-sm8450.c
>> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>>   	.pd = {
>>   		.name = "usb30_prim_gdsc",
>>   	},
>> -	.pwrsts = PWRSTS_OFF_ON,
>> +	.pwrsts = PWRSTS_RET_ON,
>>   };
>>   
>>   static struct clk_regmap *gcc_sm8450_clocks[] = {
>> -- 
>> 2.34.1
>>
