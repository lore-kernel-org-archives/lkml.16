Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963E4217F40
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 02:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749262125; cv=none; b=Dm3PAIit8kEYWRo+S1XOcOjVLRSpTfb64uI9dt+jRjHcB2go3Bx5GhYS7k6tDfMzWiHPoYqsqdLHmUoSs4keIsEIcIDptYDud17/8YEL51LxgTMWhW5kn7wYCT58AdL6ItxtbEQol8rcQviRJEPaXzbjr1/I9RXC6YOcxExu4HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749262125; c=relaxed/simple;
	bh=1wPBp9mn1Yt2Yh31Y1H6YFb0Bxf1nyDWQ8/uWhDjpd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9uOSLa22IICp5Lt+yfgKNCql4FE0creDYalDD3qAWJKsLW8IcA0VDSWXleW61qkrk3KckoXwC4Sq+y/vVm8l0jUXhtiASEYe5DTqBrnKelaXl3VH3l26qej6+6s+xr6S6AOoKmy/FNBjGrWWYROfJNer5BqGsfoXc5PYNhBWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg/iHtzg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sg/iHtzg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9JhL018807
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 02:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4d2TUqwOZCp8hCOyVsn5//7lj8HaxFyUEfEqmF7yDXY=; b=Sg/iHtzgqBxeA4HR
	+CvW+2ghX5pOzyDtIrPBEdn/PuJCNKM3CcnuD0jHhxipR9aw9pMP8FfS1Nl8btlu
	KQTDq8YKIa9o2l4hDmpO46avS0ZibebYNS6H3eJ8fLUUjcMpNSZ9EqODTb3792DX
	jYZZ5DxxyNa83xtrRccp6jdFO1Wej/TdS43JiyGibu4VKcqE3KBDP1C1ZyJ5B2SR
	Xjz4bsGK7iIIj2heJOODS1XbHsPddzsrC7jyr88DdunJjy8/yB7V7xZQSkIPhqn1
	iBEAtsoPU6X9D8UMQ++NmngjKj+EymnjCxYcdfFeywL7m2Q1zYX/lFrbMqpRtAoC
	wfjX2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nx4qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:08:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so489481585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 19:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749262121; x=1749866921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4d2TUqwOZCp8hCOyVsn5//7lj8HaxFyUEfEqmF7yDXY=;
        b=vYu5Q9QVTu6P1OmtAiPIM2+CZsg/brzl6tT7slw5Z5V87hxrHbD9TRf0kAbOZH9LCi
         0whatWInSvDKEsr1znf12QcSuqshEPvzaK17jfUQNlas4xMDJpWb60idtf+g2YpWQzZo
         hAv1F11rwr3hyTYuwwJXQteAmPriGswcUms/Ds9bFe2aKNIrlPHqdwvvRaHakAOduH3/
         PD2VVFYXKmNUs25JYwYEKlOFqc6wSFvzzLfKlKG9fdIIkDlZWgtEk0hx5pSEVdcXeuUE
         kk4qQwwLSoHZTjG3kAEbUteQjPehPNQtZ4qdym6Vd3WuWw/jZ1agFjtb9zzmJeISbO7K
         SxRg==
X-Forwarded-Encrypted: i=1; AJvYcCX8YG89FdEjVVYo4e79V1X4aMgZ2bQ+VlmvKMeMRFP0Tw+DlrDrAo6aodSC2U6Q/zAK1sWEzUTmX6xnQro=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXBqdRe5e63wlNkK2gZavCrYAbCUjvKkJfPcnvqMfjSS+iHwOP
	hG7Otrhh0qWg/NvQXq56l5bvp5D5u4WGb46O4/Cst8FFfDUBXNsHO6a2hnAYLTz0QFTUPsiikp6
	as2nmubIgMR7D8rz4HLhuHovrUiAxwEs/dxdqTgF2vkmsZugJ5JNLp6tpQ/lAnYVZ69m1fRKQQD
	zqww==
X-Gm-Gg: ASbGncsGkAevfKC/evCuW2aJA+YCjOlXDa9qWkwQCuEW+YLRsdohrDOkvmVG16YAkbR
	gZn1H4sVxJ1IKWyCCbYofGcKCltUlbRawXet3iGq3j6nS/ZVgmukwawLz+EiFYoxA5xfXvZi865
	Wi7LJR+NLAs4SA4dzE+uLda8M0WIpEWaNwuTXZqdXvBrydaDaVjNhkYS5W0F8w+673h4Hxrbd0p
	C8X9vNKR2Oj4MfJJ4xTlAQCyTLRj81lg/Mi4ZGL/brmc4QunLNKJhFdyUfIBwv7/yXoDIhPj9xr
	2sFpmSbL8rijTpxDbxNq+iFiyDEDPUBOT/fXZqvdpMPoYaP9WcQhpWGE9USgzIrhJSTWoYA2jOI
	YJ0lJ00KXPET4kIaUgRsDwdal
X-Received: by 2002:a05:620a:2408:b0:7ce:bddd:7119 with SMTP id af79cd13be357-7d2299329bdmr812224785a.51.1749262121034;
        Fri, 06 Jun 2025 19:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz7nZzHZFUC4z+SxHCj3/apQ8BIw5H1t8RfplWUNiwQy336iHPVr/nvIPtH3vtjLYLC4dchQ==
X-Received: by 2002:a05:620a:2408:b0:7ce:bddd:7119 with SMTP id af79cd13be357-7d2299329bdmr812222385a.51.1749262120660;
        Fri, 06 Jun 2025 19:08:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677316d6sm352047e87.206.2025.06.06.19.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 19:08:38 -0700 (PDT)
Message-ID: <5d4c51b9-f4a4-46ee-a8ab-d523fa7292eb@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 05:08:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
 <3956eeef-2a60-4bfb-908e-5e3e32970b86@quicinc.com>
 <e18bdd88-3866-4aef-8873-b9b67f0cb9b7@quicinc.com>
 <85533e92-43bb-40dd-a8d5-13d19e859616@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <85533e92-43bb-40dd-a8d5-13d19e859616@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uJZn957GVPuuruqE0-7UOObBOSghIaS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDAxNCBTYWx0ZWRfX/zghEIVhNyJf
 29Rou/IOuMAC6inM1+6frJRlFA2ZgTOFfAXNtLDHxA8OqgZUm5iHfEzIAmgEeQd8R43CXQ2JASt
 Vhh0Yu3Ja0Ln8cOepKCi2A4EwEeZ12FVEvkvPII1qitpeOvdAe1CnfeySIuc3KKmbyPFc72U/+7
 qxw5K7lnDyZFv0JWwDohmk9GkUDqEoZbkICXe1IryScI7UVl5MFI5Lu1LyPgazVB9UX7RapVb9K
 hDKSUyNfJg4qQ2SY+A9T5beW7iU5swhfIlX+VBfN79rNtYo1+imxb0xm5h8V+46iOzcn28LFV+0
 VhOTNqYA9Oo/ZSsvFR2+XbkDXkLFYuHzy74k3nTcYKCuDfLT2a2ifwN4AnIxtTNhZ2LFhWUwDbG
 iCuhLOki+90VU/evDCG60CAj3K3wPlwU9H8zTlbkd0eaOlqj1G+2b3VZFRw4SHxemaKWf4S9
X-Proofpoint-ORIG-GUID: uJZn957GVPuuruqE0-7UOObBOSghIaS0
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=68439f2a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=_IlkK9eLdjtuzbIfdvoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070014

On 06/06/2025 08:54, Krzysztof Kozlowski wrote:
> On 06/06/2025 09:51, Renjiang Han wrote:
>>>>
>>>> Reading this thread, I don't think that is the case.
>>>>
>>>> I don't see how patches 2/3 or 3/3 depend on 1/3.
>>>>
>>>> The frequency table is a fallback in the driver and the DT changes
>>>> are completely straight forward.
>>>>
>>>> TBH, I think we are hitting an email comms/social barrier here, not a
>>>> technical one.
>>>>
>>>> @Renjiang can you please confirm that freq_table is a fallback,
>>>> qcs615 will work without OPP table and the DTS stuff doesn't depend
>>>> on the driver.
>>> yes, freq_table is a fallback. driver will use freq_table without OPP
>>> table. the DTS doesn't depend on the driver.
>> To correct my previous response:
>> For this project, the driver patch needs to be merged first. Since it
>> falls back to SC7180, but their frequencies are different which is
>> reflected in the OPP table defined in the DTS.
>>
>> The DTS patch is intended to enable video function on the QCS615 platform.
>>
>> The driver patch is to switch from using the driver freq_table to the
>> OPP table from the DTS. Without it, the driver will continue to use the
>> internal freq_table as before.
>>
>> Therefore, if the DTS patch is applied without the driver patch, the video
>> function will be enabled on the QCS615 platform, but the driver will use
>> the SC7180 frequency table, which can lead to an overclocking issue.
> 
> This means devices are not really compatible and DTS is not correct.

The devices are compatible: all programming interface is the same. 
Having the freq table in the driver is an error.


-- 
With best wishes
Dmitry
