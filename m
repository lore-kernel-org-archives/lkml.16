Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403E2459DE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 02:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749436781; cv=none; b=Hr9Av6P3OJL2jESf4qSFaQgjK7r+CEz2ttY4HNqdWViCw44VITphb56mgzIljICffTfo2Lxw0sH4jHdqGA2wrcVTYZJ121/jks1kJrpPRhkvGuKnr4P7drYYAG0WyFcee6TyDN3ECW+W8W5Nd+NJWS1bNvNy1STV5h3i4GZs9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749436781; c=relaxed/simple;
	bh=W1QQ8EhK3mzfRDvT+gNkm/YvjT2L1IbpLRckPRMZEXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evDXlXm85rrxJFxTR+7zB9FrPkHPnZOfrjZBJZ+N5wkX+AarSZ3myhVIjnHqBzDWr8wsiQy5koHlMKw2hKfpHFAoSpcrtTSKpLfDq2qUNfbCin7ki3mrr0YuSOvzc7hXWECXoh05bjMx+0qkNFCsmU1eG3tI9RpUlW1wE+hLUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4sPMCxa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4sPMCxa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558L040r011530
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 02:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79gimwLuIKakCRJhBaQFPvGydcA6kRtFQU9q5zp1ZW4=; b=n4sPMCxaDd1XQG3N
	00EpkiMhQYDs92W2FfGRxakPOUnqHvpy8ShPNNIEl5Un0KEbFCyqhGOf355rSw8n
	DQCVSF1Kkp8CqsVdqK/JuR7LZfMgVsNKKWotAfWH8XyyO1Lq73JES3S7qUdl4KPw
	X1GK62kk5thB9v77x2y5YTOjXOWjVigLF1A5+8ZMArKvvouz4sZJNlfW7t4IxFW3
	KK4xDc7pCgRXw2WjiFnFMwL5SX5UgXeFH0A74olRglRRuhotek0jLczGrYh0lbpB
	YCTitK12bXdKBKQqMiucPgzTqNJ0xDJOtf/8OrIhwSeN6ynONb5Jhj4wFkzK0xEs
	WNDhcQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxmp8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 02:39:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23505adcac8so33629035ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 19:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749436777; x=1750041577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79gimwLuIKakCRJhBaQFPvGydcA6kRtFQU9q5zp1ZW4=;
        b=Y6QHMoSupeBdaAMnyscZSPlxxaqGvJG7o2+AviGKlQaQusU9vbYoGze1P4ioheZ2uh
         bxfbsSkquTF/5vEB8GdIiZLt1tX9bUqNPwC6HYJC2TiBgr8Lr0j7WZfMPKKO0CzgcyF1
         trhwmcrOdkXvQS5M3/+ivWuEi+xOaRCHgibMwPvXh2yfxS0puR5QE16nfGKKkuPxdlK1
         cO7FPHIullMPljlM5XUw2nLJZuPRHS5uruM9ff5Tx9/kJ5xO9rlZEgI5zhujSx96rflV
         6JpZXF/DJcnwvPB6I/qEiqySrdYddsb6J1YD0G32aizt8KMfCcQjzuZYZ1ziaak7EY7g
         kRPA==
X-Forwarded-Encrypted: i=1; AJvYcCXgQNe0SLqM/5KtxSXEz8av0rm6mk2UgsZhT5ggZS/s8FuP7B8MB0ZTnlNgthYsPGy8J7dc1i5vzbWPzXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6VOfC8eNeqfXQQs7hIyHIO+ZzRakd3sceqX6kzuTPNkJkfL2J
	33Ysqq4LKaCWvZ+FRcP8mBcg2dn8KikuqSKpjgx7e/B+9wLDLU0J0KzActid/SkQG8P6bpdIN/o
	GLYd7l8vLLEPAENjg4VcHrh8AVCihfWlKlpfOb1HCOuigqNPCx7JDBEhIpeLbTxSCIac=
X-Gm-Gg: ASbGnctwhCeUheNJBmEHn/EkMekXEOryiftk2CDNuJ/Nl6FrViPfXBW3ktEVwpn79TV
	kFAKC+TodaF+y9G0PCzlLK4CMm87tJmeaNYrDwmW6wuikVXII5uxupupwhSsiBcJrTG5UbK5aN+
	gfuk8/WZ2+0bRqYBLB4rQt0VztYrXcIfbIcaIG761yPbf72et5zxQC9CkpXHcaoDxyzWkbahlWT
	nNhur4L06QSrCkkw5zpGzsSA8/2IKgDPX35WQvpG3lsri55l5iD2eFOaWQXMAEztGcGFW579oKJ
	0f7IxzO+AobNtmA3m0v/MdqfJIJVlqa3013QSnJN7tZDbecABozJgwwdYY40m+Yh+bJ2V9yQwgW
	BJDMYeZQL178=
X-Received: by 2002:a17:903:1d2:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-23601cf2febmr150513655ad.3.1749436776965;
        Sun, 08 Jun 2025 19:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdAMZcQZB+gjb2bkDYnCpUx//bQkJ+IMD+7wz3jyE7yFtKOaFJOuNjUmz081sjRi+XdKnPOw==
X-Received: by 2002:a17:903:1d2:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-23601cf2febmr150513435ad.3.1749436776554;
        Sun, 08 Jun 2025 19:39:36 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b13addasm4592062a91.34.2025.06.08.19.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 19:39:35 -0700 (PDT)
Message-ID: <cf3479b4-5f02-4d19-8164-306214966248@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 10:39:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
 <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
 <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
 <219a46d0-446c-4eed-8809-4f2400de0ef9@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <219a46d0-446c-4eed-8809-4f2400de0ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o9ZqPIyvKr_BeANR-olTfhYxrZPQsoEI
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846496a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=g7_sT98hAtsvE4oCy4kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: o9ZqPIyvKr_BeANR-olTfhYxrZPQsoEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAyMSBTYWx0ZWRfXw0SnJfEVW23h
 6ZCvCr/AE7GyecKtcjjua+LK40x6+TGb2nwCsqYS+gsYAepLQPOhjGZrHEBWeST9gCYawRS4fba
 t9aHevfYhmvYGRt4eFU+R6Icrly/5TqMMjG1KZljw794WQKjOrB2TXRA00RHAr6FZST3kw32SYu
 trdcpnO9cs3bG6z3v53TWAtXt1GOTm9VymVR+Sg1+vHGO/7EvlRux03nX3pnnqJsC+faDoUGgbT
 YjRvtn9Z6mqhTC3l/x6uyPGfZnbh8UpbtUF03cDrv6OEW5k9epnQvjsHHQoL7huaX0nFnjovfaH
 CaIGneFKjgdMIRGI0+7gG+2bzhjMIsAP1yXxfWXPP/aVNRI0qQ2l+nrYRxO7iMGp1IdrJdoRsI+
 X0SAtH2q9BOlzMJNEkZWVV7hm/W08PDuA3e5aN22iM8BSBHg8sJKyeQ5xIB2E17X/lusYll9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=907 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090021


On 6/7/2025 5:46 PM, Konrad Dybcio wrote:
> On 6/3/25 12:37 PM, Dmitry Baryshkov wrote:
>> On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
>>> On 5/31/2025 6:36 PM, György Kurucz wrote:
>>>>> Add charge control support for SM8550 and X1E80100.
>>>> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works
>>>> well, I finally don't have to worry about leaving my laptop plugged in
>>>> for too long.
>>>>
>>>> One small thing I noticed is that after setting the sysfs values and
>>>> rebooting, they report 0 again. The limiting appears to stay in effect
>>>> though, so it seems that the firmware does keep the values, but Linux
>>>> does not read them back. Indeed, looking at the code, it seems that
>>>> actually reading back the values is only implemented for the SM8550.
>>> Right.
>>>
>>> Based on offline information, X1E80100 doesn't support reading back those
>>> threshold values in battery management firmware, so I can only use the
>>> cached values for sysfs read.
>> Which limits usablity of the attribute, it is now impossible to identify
>> whether it is enabled or disabled. Is there a chance of fixing that for
>> the X1E80100 platform?
> Is there a chance we store that value in SDAM and can read it back?
>
> Konrad

The thresholds are stored in PMIC SDAM registers by ADSP after receiving 
the set requests, and ADSP reads them back during initialization. This 
is why ADSP retains them upon device reboot.

I spoke with the battery management firmware team, and they have no 
plans to update the battery management firmware for X1E80100 further. 
Consequently, they cannot provide any interfaces to read these 
thresholds through PMIC Glink.

Reading them from the existing SDAM registers requires adding 
"nvmem-cells" DT properties to specify the SDAM registers. However, the 
"pmic_glink.power-supply" device is an auxiliary device created by the 
pmic_glink driver and does not have an associated DT node. Is there any 
method to create a DT node and add DT properties for an auxiliary device?


