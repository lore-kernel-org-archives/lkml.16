Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250AF28FA9B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558005; cv=none; b=utDM96SCq3eY6k/y3rtzQnP89VrPz10VutXTzNwrCTvhR9sZL64PQuJt1DhlDc4OjbiCyLsVjvgLYdpkjWH1OpcmG6P3pdmuy3wI08LeDy0Qp/wIJqSDvzkmwb5qmXZF4aWMNhkTXgBZ0uEy3JTJrOE/OBHb8q4C3MZst1KMYd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558005; c=relaxed/simple;
	bh=GnMINJ+rcQerWjj/m73j4gOd+J0Oo877g1bdajEn74A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6dp1oVvHQfFSw5tyIuSCwSBJFbt6HWW4vQ6TWkBJf3hXVL4nSur+Bl5whrexh+/cgGjiLNnpebefEhyPtyjFqZ5pRs6Urag7W1snpzVhhm/HeK6RQYsLfKqpKByprf0fUkyWVGKjzyzNMHMy1mFzmAVu2frR4X36Xrb25VU7qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gb5f+v3w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gb5f+v3w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9t6j7021751
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vhau6mD0BxB2kfcVfZ6o+4OrKjXeXzy3kAMgYfwD+6c=; b=Gb5f+v3wiAXBOjWm
	U3/Z+qc1ffSG11W0f7W/Quc4XETq5jiRUQb1TG1U7qV8tsfoQdsjZzTMywHCFIPi
	dKiK52++dhjN90+tHo9F2Z6e+TaW3b0LkZmc/R1B7GFfdUjaFcuMt7E5z+fmVKA8
	wvShmWzIdVcAohoyLuxxzBZCHcvlKGEDOKMqU9sSZncRLA0sq5SlyaWJ9bcv7da7
	7vmS5r34ZIQFrgV8AITons19LyYvgjMwLuj9M9I+b87NOoj9RWgxi6Iy5Oayq72G
	d3mR4DSp4Xg53G18kSTsq9XiEPWqzu+HSuFzN1b/UAnPYB1Jg48MzDfJ5yqMf8jp
	4B6/Mw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9sejy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:20:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0a9d20c2eso107777385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558002; x=1750162802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhau6mD0BxB2kfcVfZ6o+4OrKjXeXzy3kAMgYfwD+6c=;
        b=w/YEV73acCgA95+mElRUqwFsCJit+/YslsDaVHnpvYOb39lt84gy3klXlaBBJvemd6
         uSBet6ghKf8qF03MHi2GX2L85vWXQRQ0ZzAFfR7VksFNnMvfvGA8wY/pjos9cPH7QeeS
         v3MAUemvZa/pCHcEYqQ+pmovUyAO8WQgnGO+eP2PYwtEy2J6JzaOcCHwK5IvgPd3ZsFK
         Ezt60+i7sN2/e3W8W2YO4cRYxfoWSplOn8483fCnRj5ZaEZ3vA7i0YdrBJMykoaXmsZl
         mywpg04aW97onf/ciPL5zhUPzXSA6+7VZB/TUBc+6v4ofiY9OYQ6R4LiaN+nIT716gFF
         RQew==
X-Forwarded-Encrypted: i=1; AJvYcCUXMxMGG68SRXWdgbrtM5QaEznGEKLnJgxGmVKeZjjniaSBp8feoco0NSC4B9iTAfF7C62PYqkOGRTVPLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5b4dMaBPJnRY3U5DDbdoklGVj2aiDo2Ea8u+AWsw2UVEcFrFT
	87M/bUYFZTE1Uduo6LivV+F95ZtXBpuAJUbzJ7ZT7SmpMkaTjn04Uxcu99xZxf/aohpQlrGuOi4
	OhMQKfWr/f0QDeDCSE3BILR3Bja+fcXC7gchU50vQA2HYidmjZG3N0YH9JCRw4CzQSVM=
X-Gm-Gg: ASbGnctjLiviw3rLIdmW/CMC5GsHvxuGnDFdy2tKAdy3KSteLW7yHosv4+UQuR45fUl
	C/4Dq7ywrXoBrpVYUwQpHcUil/0n2HhrufhXj94qTDyp99qEgVRjocjXWTMRx+DoB92TXJPOAAF
	XuohTjw92B3PWpBo2tdasPqvSjvODhPdbWrund36ha+IkSFJv0O+mpAyjIWmdrPH6KYsoUD1hP2
	M8lx/9XApk9GTGwWMJlsa6984iM4Bcc0gSn7hjSrxBqGOxCLPYHIZGEiwmZfiu6kIme7x5hiyoM
	QZkc+AiE7PaILnBYl0NLdvdY63SYk0bvuX1t3WPtpYK1xNpnuKzsXQyf1gIkNNKFws/ByMJtxL0
	s
X-Received: by 2002:a05:620a:4494:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d33df21327mr843520985a.14.1749558001931;
        Tue, 10 Jun 2025 05:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf2HmxcJv0wsb0YZ7xLVm6b6ibXcsPzLTTHoRArwARqQqeSPVzstDTUy8hZeAaa52emy+X7w==
X-Received: by 2002:a05:620a:4494:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d33df21327mr843519085a.14.1749558001494;
        Tue, 10 Jun 2025 05:20:01 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c05a0sm6225865a12.44.2025.06.10.05.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:20:00 -0700 (PDT)
Message-ID: <bc1daec6-9198-43af-b5a6-c1057d7f2392@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:19:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <cf3479b4-5f02-4d19-8164-306214966248@oss.qualcomm.com>
 <b938b358-301a-4842-bdf6-93ec3c459d41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b938b358-301a-4842-bdf6-93ec3c459d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -xHe6qM1DjdRBRQDSK8aWnuCz5gnJqjE
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=684822f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=ZeCA1ImQhjoAQTjEC58A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -xHe6qM1DjdRBRQDSK8aWnuCz5gnJqjE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NiBTYWx0ZWRfX77BGnPCoHgrp
 gGa6NmtgDKGl3w9BTrB++3GYmICrbLCQPFuVyhIMjY/SLSvdMTc+o9jksen1/VLGf698o5yO0Zd
 sOQT8/Xo6g7fQc/m4CZE0yQ7zpIjvGClO40Qe4EmhAcOLrKcPiawuxzjlQ+O7cteIyf0hOe3XaC
 mDDXUpqaLGxwopKqwNsVdXAcVyHsPtoStvcwefxJ998rxQaGK7bVEoQE666IRrvtXiL300IzLqL
 uML0u85R9i2umbChYtpo4rNP0p4IzyC3iULGVZkaBbuM6vQndXg2accrk2PgDRUeqdxTcIkuL49
 yAM5izuQzipM1gxLKIQdnvqKOZCSHK+B9O6vorJq3x7nSg7ewXJFXGNhqH+lBkxxXuU6OED8hpf
 iCZYat4ptxlqp+hWw8T3SxtT5UjYQ8Atagcr6Yc97Fe/bxjFyz3tiPBX5LGDRBrdkVP+FSZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100096

On 6/9/25 9:17 AM, Dmitry Baryshkov wrote:
> On 09/06/2025 05:39, Fenglin Wu wrote:
>>
>> On 6/7/2025 5:46 PM, Konrad Dybcio wrote:
>>> On 6/3/25 12:37 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
>>>>> On 5/31/2025 6:36 PM, György Kurucz wrote:
>>>>>>> Add charge control support for SM8550 and X1E80100.
>>>>>> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works
>>>>>> well, I finally don't have to worry about leaving my laptop plugged in
>>>>>> for too long.
>>>>>>
>>>>>> One small thing I noticed is that after setting the sysfs values and
>>>>>> rebooting, they report 0 again. The limiting appears to stay in effect
>>>>>> though, so it seems that the firmware does keep the values, but Linux
>>>>>> does not read them back. Indeed, looking at the code, it seems that
>>>>>> actually reading back the values is only implemented for the SM8550.
>>>>> Right.
>>>>>
>>>>> Based on offline information, X1E80100 doesn't support reading back those
>>>>> threshold values in battery management firmware, so I can only use the
>>>>> cached values for sysfs read.
>>>> Which limits usablity of the attribute, it is now impossible to identify
>>>> whether it is enabled or disabled. Is there a chance of fixing that for
>>>> the X1E80100 platform?
>>> Is there a chance we store that value in SDAM and can read it back?
>>>
>>> Konrad
>>
>> The thresholds are stored in PMIC SDAM registers by ADSP after receiving the set requests, and ADSP reads them back during initialization. This is why ADSP retains them upon device reboot.
>>
>> I spoke with the battery management firmware team, and they have no plans to update the battery management firmware for X1E80100 further. Consequently, they cannot provide any interfaces to read these thresholds through PMIC Glink.
>>
>> Reading them from the existing SDAM registers requires adding "nvmem- cells" DT properties to specify the SDAM registers. However, the "pmic_glink.power-supply" device is an auxiliary device created by the pmic_glink driver and does not have an associated DT node. Is there any method to create a DT node and add DT properties for an auxiliary device?
> 
> Auxiliary-bus devices don't have their OF nodes. Instead they use the main device's of node thanks to the call to device_set_of_node_from_dev().

i.e. something like this is what we want:

---- socname.dtsi ----

pmic-glink {
	compatible = ...;
	[...]

	nvmem-cells = <&charge_limit_lower>, <&charge_limit_upper>;
	nvmem-cell-names = "charge-limit-lower", "charge-limit-upper";
}

---------------------

if you have better names for these cells than what i put here as
placeholders, go for it - just make sure to also add the -names
counterpart, as we won't be able to rely on just indices in the long run

Konrad
