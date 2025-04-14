Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082526B976
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625156; cv=none; b=tv+4O/2SgO5e5zynlO2+uzMWgGamIs3k4wKuAIDz4jnGZkV+u0dYy1dF8E4YMp2Zo5lsvdlXxXcejbGWLvDPge7At1Ad13Ko+Js8gjJXCtPp/KqBBswMLISwmCitM7ld0C+NIHY3oezbXd9NX3V9FfKsXIAPlutNGuBIiFT9Q00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625156; c=relaxed/simple;
	bh=jDs8thLNCqncuvS6eDO8362rXAxntviZVG8dwQeCguA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UbF9S/sBT26Xfe7BKyMoA6LRk9+/N3uRdCLcmG20Y9UaR2qIkLnLhNbDg/QxarfhwXs6Uqp906XaxIwGehqTGd5+kipE1G5Pr55rdNlBdlWkwMkk6Umh9Z/GAeciumRe9qao99p9ydtk/EcggdKtAuWytJ0acMA9UT7IHHagwSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGFWwjQa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGFWwjQa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99ojM031333
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMvb8N95/gaSyVsSWCc3DQiAI8CRlEgBC06NE46MZVI=; b=BGFWwjQa2f9cEjFT
	qbBrfWdM+RFdK0K9hdYfPuRteQ8XNaiYwx67b3Ohkbvu55nMDHsq/Vu1HliRSriu
	G8YP0GPLDLIhb/pRr+RCG7ds+150Bmpj6tF0j5w3EfAUhGu1egHaUHu5o6JwgAsW
	EX0UNu99uROjyJlAnmg5ljh5DGJOE374S2ttB89cFaW5GNlrnec2iQX2TZUM9LM2
	vVMbxndBqfFYBx/4KJnmDmmcAqD9aVQ2xC9+aA4aCFwbA/GX40vp8Gn9A7FdKEYD
	Wwz4eulHTX7xCMDig8iDUl0dMS54L7mummSuDy6dnWbx9JFL0RvvwLZSoaxe3BJ9
	BsFp/w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjv1t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:05:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so13196526d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625135; x=1745229935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMvb8N95/gaSyVsSWCc3DQiAI8CRlEgBC06NE46MZVI=;
        b=CkphiUm4epUJBIHOLtpNxN5BHM/eB45Eb3dXPBDEDK1YaIxEUaprdwvIHl9i1tRYjm
         9qXlkAdhaS597cn0mQOzQhuBBAcf0rkxfKZzD8I5dEg2eSNBxANy1pMvQUlFIDN6acyk
         ABxRL5E6Y312sOVwM2ryara0nxVlYtwhYBV1n0/2riydyeD2SoTlRoiAv+t2EfXZ6+OJ
         H1w4AXv3g/aZulSV0kKo+VjbEdG15Zm5ec1DtGT42xD+D/CwmqSaYlNZwPA1kLa5w6zH
         joiP2lK5OTww4wK/Fmt9wYL97Rrt0LC3/G9yG+FAlFHf1BRKWM8bbcmsj6K1ZdGX7cKL
         M+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFZR++vlRrIuBJAbfmLqZ6N1wHMi8T7z8O8dDMfeO4gli/U9+mBvmq72qhXPjKCJ2UvV3wnHBfq5a7X0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9zc0fUdG9vfbnu0G4E3DWFsUdonpKvmYMZlnqu+bknJq7yuz
	SXY1bvuMeoxTmB3KR0btqPf1Bc4my+f9C23wX2KBgfBPUBFRXVmcMdxYU03e2ftE09KsLZ8xVa0
	z3uwInsKPxuPKAI/el3PiSC5s3pNJ9nAoGWYynmSVXhXzOyCu51jsdvlKPaevlAU=
X-Gm-Gg: ASbGncvSetz6jR0qSlfw6ZU/lo+SkI5kBTqK/4lvUYF+VPGjxH43P3nX/q9tZm8CyFp
	u96yeHaWZ4RId2TSBapExCg2E7IJv2lf0IJyksJSsznT3bRCG54ZPTsq+MrJN2MGKfZSE9MvXR7
	+ylJj9Zu0tTsnIAl3wwZnvLiHGiMnd78ek7dS4UKkaB42+Loq6BerTjR5FYVnnwkjTneiEqGCU8
	th0nv05DRr0FcDGx7nlShIhpG5i/8cDsj4UCt1iM4ioC1XUcjTIB14rgrfPDrnzjeyJJTDHxxBy
	5vWFuFZmWrr2I3mnqA4P9FyFT0LllWYn0uRPMW78ju2HaT254M/ZairRRoiSOcqRKw==
X-Received: by 2002:a05:620a:3197:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c7af113d7bmr603259185a.9.1744625134285;
        Mon, 14 Apr 2025 03:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmBUa5andw4pRRHVYC8/NGtkbW9c5vRVpeMF8s8vhz5E8trZWGxeC/sN+v6rRNhzWhNX/m+Q==
X-Received: by 2002:a05:620a:3197:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c7af113d7bmr603256585a.9.1744625133674;
        Mon, 14 Apr 2025 03:05:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3120sm868414666b.1.2025.04.14.03.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:05:33 -0700 (PDT)
Message-ID: <691a2358-bf5d-4f03-ae2d-97fb2e40952a@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 12:05:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
 <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
 <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
 <wzqct2y67h6bkazxv3se77slsheaw5rspgcrcfjm7ngr5t4alw@nktpqrt5woky>
 <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fcde01 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=ovN_W45TYzZQxDyi82gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 7Jo61CB2bWibS9oM9lc0-gZiL2bJJifn
X-Proofpoint-ORIG-GUID: 7Jo61CB2bWibS9oM9lc0-gZiL2bJJifn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140073

On 4/14/25 11:56 AM, Ayushi Makhija wrote:
> Hi Dmitry,
> 
> On 4/11/2025 1:31 AM, Dmitry Baryshkov wrote:
>> On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
>>> Hi Dmirity/Konard
>>>
>>> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
>>>> On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
>>>>> Add anx7625 DSI to DP bridge device nodes.

[...]

>>>>> @@ -517,9 +548,135 @@ &i2c11 {
>>>>>  
>>>>>  &i2c18 {
>>>>>  	clock-frequency = <400000>;
>>>>> -	pinctrl-0 = <&qup_i2c18_default>;
>>>>> +	pinctrl-0 = <&qup_i2c18_default>,
>>>>> +		    <&io_expander_intr_active>,
>>>>> +		    <&io_expander_reset_active>;
>>>>
>>>> These pinctrl entries should go to the IO expander itself.
>>>>
>>>>>  	pinctrl-names = "default";
>>>>> +
>>>>>  	status = "okay";
>>>>> +
>>>>> +	io_expander: gpio@74 {
>>>>> +		compatible = "ti,tca9539";
>>>>> +		reg = <0x74>;
>>>>> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>>> +		gpio-controller;
>>>>> +		#gpio-cells = <2>;
>>>>> +		interrupt-controller;
>>>>> +		#interrupt-cells = <2>;
>>>>> +
>>>>> +		gpio2-hog {
>>>>
>>>> This needs a huuge explanation in the commit message. Otherwise I'd say
>>>> these pins should likely be used by the corresponding anx bridges.
>>>
>>> Thanks, for the review.
>>>
>>> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
>>> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
>>> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
>>> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.
>>
>> Please make sure that there are pinctrl entries for all pins.
>>
> 
> Thanks, for the review.
> 
> While declaring the pinctrl entries inside the io_expander node, I am getting below error while checking the DTBS check against DT-binding.
> 
> Error : /local/mnt/workspace/amakhija/linux_next_11042025/linux/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: gpio@74: 'dsi0-int-pin-state', 'dsi1-int-pin-state' do not match any of the regexes:
>         '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+' from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> 
>         io_expander: gpio@74 {
>                 compatible = "ti,tca9539";
>                 reg = <0x74>;
>                 interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
> 
>                 pinctrl-0 = <&io_expander_intr_active>,
>                             <&io_expander_reset_active>;
>                 pinctrl-names = "default";
> 
>                 dsi0_int_pin: dsi0-int-pin-state {
>                         pins = "gpio2";
>                         input-enable;
>                         bias-disable;
>                 };
> 
>                 dsi1_int_pin: dsi1-int-pin-state {
>                         pins = "gpio10";
>                         input-enable;
>                         bias-disable;
>                 };
> 
>         };
> 
> I couldn't find any devicetree example of tca9539 which is using pinctrl. The gpio-pca95xx.yaml DT binding does not match with any regex of the patterns properties.

It looks like patternProperties should be extended, perhaps with
something that includes pincfg-node.yaml? Krzysztof?

Konrad
