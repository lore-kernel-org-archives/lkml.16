Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346BF20F097
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803983; cv=none; b=FArl4+w6Yn2HPKNNkGpgPtEZOnu8YNq/FF0vabvLaczLOkx8Kc+R1be4MV0USqT9R57ArG6KDac9/9xyOVGRpPPdvqEduSu+DGQDZNegi9Mr7cqhwAZQJRkifFy3OCqJtaJkja+E+1ThhltaJ6HjTkUJTGne1LLBMbzjQxBlqwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803983; c=relaxed/simple;
	bh=+QfR8Np8mmi9dnZBXYk5XMcsA9L4g7b0+Z1hkFIgtLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZN1zbPxoqMX+5zTqutGXSQk0XGl3M0Us3LxbniBbFOWBiFxwwSWHC8LCEwqwWKsagd5uEsVGpohZ6oxYk1XzyHl1ZxgDv8XeblnmuoMUL7YuePH8CGvm3Rhrpm61Yth2bK1ie+B6ZTY7QU4o2JThL8E4CMvDWshobMBn9r0mzZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVudo9SM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVudo9SM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C6BJ3022773
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 15:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTdhhYB6FCC5ZtrJ/082OOPt7NU3J5IYSW/Bpjk2brs=; b=GVudo9SMBROW5p8m
	HdJcRSKDOb8lNKAXW7PcwYnh6TA3a1JEWL/K9noFutY54pjNHHBgXFB+Dj1tNXje
	8VXChvnEYop18fYt4XmxSHbGXBzYKQJSGV2Fm4PtvdlzJ/2j562Yuxv+M98Vcr88
	gyc9WpZB5Ld8mSSKJxeFqIeWmFkDB3nDyGHryE13DfwEJF6Lms0rzo2uD9/NQ+ND
	YRUWJ9E0ZW+y0kgJwy2vKLDYRlYk0muv2unr/Cr14ozmaMUXy/DKvExiTE9G/b65
	TkXLheoaLz9xsb764K4kWi5WkhrkKyPUGGf+DonBXWsT5XPQvd8DJXwt7TP2Wdcm
	tpSI/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8550m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:19:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caef20a527so550484785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803977; x=1747408777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTdhhYB6FCC5ZtrJ/082OOPt7NU3J5IYSW/Bpjk2brs=;
        b=ki9JqHat1PANwBTZ2lslH1ikiqNg2kgSktazpy4pEbG/tmjPbLsZg4fqCEiB3wbHDI
         eqrqbNE7fjlGPzkN2d7etIkyPP5jkse84jTKVKtxpLZ4tmRvSDWzo18mRKy7evf2oZu0
         +nWD1/+kEcOQSAtoCXmZsDMvLbEzVUOEIP9/TBzkCEeBh+AesxTLh3sxU+EIbYkY5dL5
         ui4utfT7diLeLYhK/4WdQnSx/f+jBxS+Nsn9WE7tVmqy6tFBcD61IIoNOxFS9+D7uYoo
         R9BVHXhXpBMK6GXupM6pUPeYzBN2zTQYZgHWV4F2Rbh/TUWjV1k+fIBqm1KKf58tJG9w
         56sw==
X-Forwarded-Encrypted: i=1; AJvYcCWtKTFOhG3jKjdqeiimc4/NtKQ1yFa9t+V/Eb7RJ0xws20wJ3DwjSjbJZ/RT/YgwczGiCV2/FhVymNPGGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk92B35qUhuM8kZZDc47+4OWFeSJwMAkVkeHQQ5ZgO9d1k/Ptr
	DbvtAe1BWlX/6cpiQQbka3Vp6aIQX59P1CRW3+IwvwHw/XqTgxe5yqK8BF50ygkcGHkHQR75W4B
	I7ldxPhrIMBn5VY8V+TWOxLyIbpLWFjyoFSQtYtgWawZuE46ROA6zPQBFpNonMUPk8sSR8Mo=
X-Gm-Gg: ASbGncuNgKvKCW57EJueoBTyaLquMX2L2ukAMXNHnrShUlvVOLaoACEBMkIbDOdSpgg
	YYwqOC+YicMzi705glnk8eQZIL3yNR4FlgpTOt9FT1PXIIW972z4SQ2AN5J/cazfNuaHz/u6HnM
	p8aFW1Pg9YIcZBtbGNM/jwJ/4s4Ub9P8homI4ul9DARoHQt9gsV64l0fDhQ+68t8iQ3up06oIc3
	dJf/lf9fiCjToHrGMsfzTuoscw4vl7/7tp2+o0TBGWSa7sHoHEQNMM6pUSrMVaqYD1oRUv21BPI
	HATp0RPFuy4bkasDSgczzMrNiT3PqjNdG+Je1AR5cPStyEm7QSvtQPiYKyPcxhKQKktzIALd9Ml
	E5Sndtr2VO1lTTNLXAXmzt+7k+m0iA9qNR/kqE4ON95qzbcCmN/6Kb2u/AWGcNwHi
X-Received: by 2002:a05:620a:2615:b0:7ca:da49:192c with SMTP id af79cd13be357-7cd01060842mr549977085a.0.1746803977461;
        Fri, 09 May 2025 08:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxH7nrk/AqG3hrr28OmJOlY7nRUo0lL9q5nufep0/yH/q/o1vYXrEJA392S7p+PHBN12kSQ==
X-Received: by 2002:ad4:5dcf:0:b0:6f6:33aa:258b with SMTP id 6a1803df08f44-6f6e48222e6mr62260126d6.45.1746803965858;
        Fri, 09 May 2025 08:19:25 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a6:738a:e519:cad2:e720:53eb? (2001-14bb-a6-738a-e519-cad2-e720-53eb.rev.dnainternet.fi. [2001:14bb:a6:738a:e519:cad2:e720:53eb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645d03asm306482e87.95.2025.05.09.08.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:19:25 -0700 (PDT)
Message-ID: <83ba11db-9a9e-48b7-afe0-9df7b5de3e85@oss.qualcomm.com>
Date: Fri, 9 May 2025 18:19:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
To: Andy Yan <andyshrk@163.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, hjc@rock-chips.com,
        mripard@kernel.org, neil.armstrong@linaro.org, knaerzche@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
References: <20250422070455.432666-1-andyshrk@163.com>
 <9503607.rMLUfLXkoz@diego>
 <nco27hnwykffzgirhocskltrkcds32tefkix23nfknf3e5m3zd@mkrrbw6kogsi>
 <1a07d69.1e47.196b2c3aa12.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1a07d69.1e47.196b2c3aa12.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e1d0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8 a=U4mCzpOltDhEmR4TI6sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: WtMHLGkUUVrJjM144xSxVrI5T9FlSHo1
X-Proofpoint-GUID: WtMHLGkUUVrJjM144xSxVrI5T9FlSHo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1MSBTYWx0ZWRfX9h3pOfuXYRP/
 A8i9PauO0efAqB6Fm3kPpsPm1ZqA4vXj++YrnorF9lmoFrKuFfaTIxUyQipOXjxeUr4ymSOWSUW
 vfAFzYmTUz9aop081dmWz9w7DawVD4D8YS0tcZCa6uw5oT7Va5n0EDDXIX4uFFIrLBq1xnPD1tW
 sOn9N1TDykVk0aZPf9LtSKfdl8nSZ875vJsSohwyiHn7opnnvb63VCn/4DUThKFrkUmVL+/hZzO
 Y54guJ9EkByZxbe1DSCEZFL2zxzqwSHF5eaIzpeyp+9bP7MOQY17AvFt8AJjU6K67oz/qHWFGU1
 w5PE4sGUHusIwb7BKV9pcnTVhNOS0DWbDCxM17Qw27X1c35khpvedEMp/Ab49eEV3cC6Rtgn/Nw
 K+Q54JuuBGmd/5qEFRtoXsVan8wV0DWxh3cD0jifL69Oj5Eic64GrepPLOkM0qqANe93D+H4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090151

On 09/05/2025 04:58, Andy Yan wrote:
> 
> Hi Dmitry,
> 
>   Thanks for you review.
> 
> 在 2025-05-05 00:16:35，"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> 写道：
>> On Sat, May 03, 2025 at 04:42:04PM +0200, Heiko Stübner wrote:
>>> Am Dienstag, 22. April 2025, 09:04:39 Mitteleuropäische Sommerzeit schrieb Andy Yan:
>>>> From: Andy Yan <andy.yan@rock-chips.com>
>>>>
>>>> When preparing to convert the current inno hdmi driver into a
>>>> bridge driver, I found that there are several issues currently
>>>> existing with it:
>>>>
>>>> 1. When the system starts up, the first time it reads the EDID, it
>>>>     will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>>>>     reference clock to be enabled first before normal DDC communication
>>>>     can be carried out.
>>>>
>>>> 2. The signal is unstable. When running the glmark2 test on the screen,
>>>>     there is a small probability of seeing some screen flickering.
>>>>     This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
>>>>     by GRF. This part is missing in the current driver.
>>>>
>>>> PATCH 1~6 are try to Fix Document in the dt-binding, then add the
>>>> missing part in driver and dts.
>>>> PATCH 7 converts the curren driver to drm bridge mode.
>>>
>>> After resurrecting my rk3036-kylin which hasn't sucessfully booted in a
>>> while, I could veryify this series, so on a rk3036-kylin
>>>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>>
>>>
>>> I'll probably apply patches 1-4 to drm-misc later today, as that solely
>>> touches the Rockchip (and only rk3036-)side and patches 5+6 to the
>>> rockchip tree.
>>>
>>> Patch 7 should probably get some attention by people more familiar with
>>> drm-bridges, so I'll let that sit for a bit longer.
>>
>> I will take a look later, but on the first glance it looks like there
>> are too many things going on in that patch, including some unnecessary
>> fnction movements and define movements, etc. I would kindly ask to split
> 
> These registers were initially defined in a separate header file(inno_hdmi.h),
> but they were only used by a single C file, so I think it's not necessary to put
> them in a separate header file. I decided to simply merge them into the inno_hdmi.c file.
> If I first create a patch and separately carry out the merging of this register definition, would that be possible?

Yes, just create a separate commit, folding the header into the source file.

> 
> And I will try to avoid function movements in next version.
> 
> 
>> the non-functional refactorings and the functional ones (splitting to a
>> library, etc).
> 
> Will do in next version.
> 
>>
>>>
>>>
>>> Thanks a lot for working on all this
>>> Heiko
>>>
>>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
