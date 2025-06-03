Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230F514D283
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 05:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929699; cv=none; b=gzSGQvFCZZfYVjUeUHFZojg+ioJBiZurMZzi3k3MRd1pNsbmlff2U/o+94OlyCB9XT79lc+mSPM4dN0MaJ+S4etBesVsHxhp8IMcc1X8rUPVfFsR+/7UnSD1M7eyKQrDalOxn03Ph0PcDCn/8B9V6Qpxg9izRqUjP9r9Q8/041A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929699; c=relaxed/simple;
	bh=aKj4GZ6PPp/Nz5rkizthBgyRPAg8m37h2Nts/v5Lkpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEHJmKl8eL2z1xolId2J56b2+TSNkB/2SOJDPlZcadRtXpsmcpQ0twCZe08BmRW3YMa3nLiNm5GBrkrCLsvcYSNM6TTaRoepv10npIKFlmasC1gFa7B9sDgJIFk5H0bNte2zWwgJrR+ErfKFXPmTWI1eK2UtFiVZ2EDU4NHM3P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMMeDjDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMMeDjDY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HKNA4013344
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 05:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x60maCMmz6HZ7Ug8+bGFKM1JZXBpI0KP2xH2KVmpU+w=; b=PMMeDjDY3puQMxys
	t1Ii+iOdBbmKvmXBEdyK7nxAO1FI5EEy1lEK5F7d/3S+HNBMYgjxlJjGGW2XLnid
	mFtD4lobaqq2j8un3/a3hsdtZcZmOpkdkLNJKInyHbOdqilKPbZztW5sbfgqxE3h
	uhyo0uxCRH1yn6tnRcWn85vPhRklBwxGZWBsoFkymbgg++MVFN7D5qdaR1TbNC9z
	P/GtNcVK5v3p9XnxdpLILzQ4NkTKWqpgLt0nk5hScwd1TLpzB8BtCdMU5OwBt4GV
	nA5tT/7lcEtvzYQYo9xQnGX1IhGTryeCjD5F4jXfN7IVThU8qsKZcvoGH+0e8FQI
	2bUDfA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t1fcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 05:48:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747d125bb9eso1106277b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 22:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748929696; x=1749534496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x60maCMmz6HZ7Ug8+bGFKM1JZXBpI0KP2xH2KVmpU+w=;
        b=qhHM4hCQBlQoYkmWjxR1TBuqqVFn/gJF9CodJv16dmV7yIJoM8+rzXCfgj9BflgZtJ
         O5FDTO/KkX99u2tz3A817suUAf5FD8Yn8H4t48EaXwQLkxySU/D+NF5FyrbtvdhG0pDx
         GjfkorfCixlHjRPauJdt+kqFOJT/5dGq696goUFQGN4ckdpI9vEu0lISoa6yDvo8N693
         f7+rMRJ8N+7q4zuKYoJnpwr0KhflGtlTw5BsKxHNh5kCIlnnUGOkEPOfjmAqfM6hdfrX
         EEpYyo2HzxGvz9bR6dlVjzBuADbPuT7lrTyFiOm3cUqG1FAOhsqiQiTeMVjQOyjxDQca
         ZA1w==
X-Forwarded-Encrypted: i=1; AJvYcCVEVqK3actWUkeR4beZTk8D1+hEkPOWz5tBgPZ4JQ15PMlTgnEAa2st6vrg3vjct+0kj9IT+NksyEDJqJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSY2MR3wd9zrCVmnnxK4IeO4g4UjBIf30S8xa+5w0JklL52TRA
	/vUc7bQsuwktX/jjc2kfl/8d+gLtobLttmVa8bu94QlOLaGOqYw1M/bkRwL8uKkzZ7YlsdIyG9v
	XHaJVqpcoLZYWwvMWhoo6VbOmZDzr47fCHxN3dijpUguSY5lA0FDnf43OfwCnechviho=
X-Gm-Gg: ASbGnctkbU7UNVGS7U7T4mej3bivmL5li11Z2xNYBV68ah1JMhWaBlWy+hLjl2qAMcV
	dNmsy5/500jykuBSsNMsuzTDxTvqNiQNg6L+o/tgwLQWad0fjtN5aFdJGpoIIzeroo0s2cyqBpL
	+cMUxxnk/N2UDTO/RTujeMkZAJtlBqaX/YmBVw4BLDPLKXtmm5FHwjcOWI7XM+qVIn25phfSiyK
	/KkI3LAsnyrkE1SknjAZtuPUFPtbFgFx1n6Xl3iAwqQYKoLs4dEoqp5on6clVFQL0jp+wdk6aFI
	lkcfAO1pWrGU8HDFdk3uxaoLZdU6s9J1AFkOpfEPTfQmwBuENAlvx1fZY7qO+ADLocKB61kuEL/
	UQdoMsURrLF0=
X-Received: by 2002:a05:6a21:164e:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-21ae00ce7bdmr25596977637.40.1748929696383;
        Mon, 02 Jun 2025 22:48:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAtEPb0qgjBapOIIc/FVtRuoOheBabfhP2QQGPgPqaMfCZMRqkfWJocE5Xr1V3SkSH42ofug==
X-Received: by 2002:a05:6a21:164e:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-21ae00ce7bdmr25596940637.40.1748929696012;
        Mon, 02 Jun 2025 22:48:16 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff7464sm8636060b3a.180.2025.06.02.22.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 22:48:15 -0700 (PDT)
Message-ID: <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 13:48:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=683e8ca1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=g1VTAUynFBCLE_zrBTUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: BpDK7QMpf5DwsLM6EFBAh8_wEaKq_lEJ
X-Proofpoint-GUID: BpDK7QMpf5DwsLM6EFBAh8_wEaKq_lEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA0NyBTYWx0ZWRfX69QUQuIOj+3x
 I7D8/qHSShkpXt4H/Aun0jHgJIhS7EjRAAs0Pf6Z6WJ37QJPBb6gWkP3QsG3PE6QxnzwjUrSC8x
 dWt+C0tyE/2Oz81Ykwgxn1+qIA98hlWHj22mNW8c7ovByPrFd2FcTd/s2Dduw/g0WC2CsK5qH5x
 IN4bQ8z5MzaOvgomeiBl0qWV41ZGDZHpKdVgMLLBxCY3x99HO8i4iuDsJyDDs40ihFBFhWNRSh5
 1hgILWQg078EfCZ7bsWqfiJt/aWBkyeioYiBy29IHRlvfudRRA+WIyYuFLixOLYyUJfaF2H8bMj
 beKjlBFdQ7PkvGPWH702X7Td+Ik5Sm4lzcp85BmR3KkAUp8jcv7N1IY778QzseYFCjIqSYO/LuP
 lyJJptrLvSxCSLjeiKBl8zf5GJlI+BiISDsLXQMWQxbeWWqhqeuziHEOn6Mcuw2dq88lCl8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=678 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030047


On 5/31/2025 6:36 PM, György Kurucz wrote:
>> Add charge control support for SM8550 and X1E80100.
>
> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting 
> works well, I finally don't have to worry about leaving my laptop 
> plugged in for too long.
>
> One small thing I noticed is that after setting the sysfs values and 
> rebooting, they report 0 again. The limiting appears to stay in effect 
> though, so it seems that the firmware does keep the values, but Linux 
> does not read them back. Indeed, looking at the code, it seems that 
> actually reading back the values is only implemented for the SM8550.

Right.

Based on offline information, X1E80100 doesn't support reading back 
those threshold values in battery management firmware, so I can only use 
the cached values for sysfs read.

>
> Anyway, this is just a small nitpick, this does not really affect the 
> functionality, and I would support merging this series regardless of 
> whether the read back values are always correct.
>
> György
