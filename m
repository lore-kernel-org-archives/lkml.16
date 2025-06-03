Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305164F5E0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948598; cv=none; b=eUR0Kq28ROwXxFbbBE2iJ9RvNQDeWsY7UV7DogNlYTbxcZYJeG9fJGMrzTBEM+3slDRrky/LH4eUMceGKV023tjYznsLO3Z5soh1PEflKVYPqZ34Q9WjgOiEAkdwehYmnly1vxDu6hjUamA2Coy0laEAnREqGIKjW4C14N+WXeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948598; c=relaxed/simple;
	bh=jRXR8kzdySM9xkgizl1xoPwF9f9AzafRhUg8TYVNC3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8HDRE55t9pbqEyUoBh6tdocULgptNKNem1GyHksXu20JH/QahqySUyl6l+Q8nOKrvGxTBi02SNmpYYzNa1LN5bU7BAPsRcKxSXTo/0a7sfH7/QxEo+oSMrksZPRoCrS+SkoNTwnfiRV5DUaT8+begwqaCPXOnlmTOZcLb8SqWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyLE5II0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EyLE5II0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JLQi004284
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 11:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2budbtX+4GkxY9SWhxoeQY782u0Eld2myTPNaaYLuY=; b=EyLE5II0ILax67H4
	W/gdfBC5jJBckiaZZVLSW9VSZBTl3+IyZ9B70+SHVAeS/iCehQ56S5q2nzDULJ0k
	/HzVOnJ2XQJEWi9dnQxpZsGXTTD1YYjN/IthTWtQS8vyDCfOgXDuNg85mvrfMIyL
	TF8uqtZ4e2iaZ6+OGBU99s+hsgkSa7ONBf6vgU6d+tMn2oT2hTjNpOOvYvTkVBmw
	gd6j2tULjZoSOlr2P9h/Rc0wo10qp1zyAi1G2MbhNiCb2wnnHZ2iaZevq1GXE0gl
	il7he6D9gLBiEq5e57Vqnt6hc8laxcSYafh0oKdWRj5Dbpk5jY0H+fG6YLOde0T3
	zKXSTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rtb4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:03:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso141280185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748948595; x=1749553395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2budbtX+4GkxY9SWhxoeQY782u0Eld2myTPNaaYLuY=;
        b=Jj1vbFTVnY4Q+TLxAbe9WDdnqZ9YmAOooSWVn21qAPcQJLE3KxlfGMN3sTpkqmmQcO
         zwWPzefUn7TUbDZuh1k4i2yNwDw+paCsH/b4b0RX21SrTIq1Zw0IcEWaDBNs3KJ/NhpN
         TyWljN1yDYj6s9HRrWd4Q4GBibepWpi5rG5ANG/4Vx1m1fNb3iFBfERj8CfTwUz7xuX9
         BcZ1ohXjhOIgtgK8rWXB9xjKZH53gql6ydT1JDH1t19kH4wyWNrPtmPtSbuLsLB8OajG
         W0uZkXhJTaup4bTctgGrtYMmJhIlhPCYTazKj08lJ6yLRR9khXNXTv7jjjOq0/SaEq3v
         66fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZttyxSBmvAF0/6HdJt4n9Ig7FE1qprRfebLrbILAJct7H4CEKZPQUHcXJEPsv+gF1E4K9MMOiYmOzaPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfUPMcjYMonZtkfCBhupHAhUdm0RDwP58Nq68ib6xSA7Mcfm5
	URFFuQhPK+kWBcnCyzQidCwk++SoFyTwMdyuwkvQU4alb8/RHihl9NlCqvMqhdiu9Bq8cQ3mgVP
	fiwC0jeYjW+mtKNDWzj42P1ZzmUvChO0VDPGFrQ1gJpKpRQbxf7eQUaEWp8OcGlWMsjQ=
X-Gm-Gg: ASbGncudK5V0hJTZQXWjeE/7igbTaSeVb4cfDFdaxUEkixAR0JrZ1CRXMowNfMNiIcg
	WYYUPWM5/B16fovmR4+697T0bP1NazNA/xlvCpRkWqY6wNDx2i8vGOfA2/fkiBLltr2eBHgELt9
	OAjL3dIl8sNfqYNTlXoG4kadwVDykiYKJGn8D1JMHvMxhK0FhBrwM86/tmX7Te1wuV++pOVAWMs
	HmlDW7DTdgY+GgR5T76XgFBbAcw1YDzFaINGojXt8QwmzQWVMFR7Tx7nRl2cLMSVCJ0aZLs4Q2A
	2H9c8844LifiKLJn9BHc0FM8h5ExosqlKsK/vmlCFB5fDWOUxAnZi0GJJ8j5FwTBxw==
X-Received: by 2002:a05:620a:2a0b:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d0a3e123c7mr844827985a.13.1748948594709;
        Tue, 03 Jun 2025 04:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtm3NY/DZn1SMjFLRCGTSWpBqboxLE72cvQfLTvFh8ut5ZIK3YZpupNq3/K2W1eMBtg4xfDA==
X-Received: by 2002:a05:620a:2a0b:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d0a3e123c7mr844825885a.13.1748948594192;
        Tue, 03 Jun 2025 04:03:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff080sm948391466b.11.2025.06.03.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 04:03:13 -0700 (PDT)
Message-ID: <71196aad-6d80-4356-bbe5-3070f6b74bfe@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 13:03:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
 <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
 <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
 <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
 <htufwjvfgdtav2gtgrytc356py6xqhrffbwjg42sgo7k4zzxof@z4xaf35qz7kq>
 <aa17d7d4-b77d-4a0a-88c3-86255dfbc29d@oss.qualcomm.com>
 <75dde9a2-3c0d-481b-bc73-089ba89a77e0@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <75dde9a2-3c0d-481b-bc73-089ba89a77e0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lfortLeDsT5a8D0NSMAqi_EMp72bL70Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NiBTYWx0ZWRfXwjsCJC0+OWiM
 Eg/rsTSKD/dkDTQr20+JaLh7m+LBJEGkrb9N7aOjmE/qrXGqEL3PkZ42SBgdS90VXMtK6Sd08FP
 jiFUNXtrbK/XOhLwu+u2BM0Yx71JHgjQvUlKEoCKmAmZGJD621kcGHb7DCyru1ltHVR/pspiVsA
 IW9UO7tekcDbNYEqHTYSPBMaR7AM1vpgYujw5fG+xQzvlz2+OnrEJ+LDwpyDoMxAF5xfi1Oerpm
 3mXg28bU0IDjYlB3GqMSSPz8WZvrXCalVjTgjMdUT8ZZDPV3GzmQ3BnqEjZ3rROXxvryl1Kpmfh
 3eKKvY0u8K0NS8C5ZrRmejLOENDWN08YDcjCi4aKQID9f/C4ziUtX1nJxNcztUtF79GpMCR/n9y
 iWwhTTIzUANgwxtD61e5NIMmMMo9nIpigjIDqw1h03YrUM5gTPZF6JyntHwqr7U/YtQ83dp7
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683ed674 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=o0_FNGaLb_2qE7sTdK4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lfortLeDsT5a8D0NSMAqi_EMp72bL70Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030096

On 6/2/25 10:55 AM, Neil Armstrong wrote:
> On 28/05/2025 18:56, Konrad Dybcio wrote:
>> On 5/28/25 1:22 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 28, 2025 at 01:13:26PM +0200, Konrad Dybcio wrote:
>>>> On 5/28/25 11:00 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
>>>>>> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
>>>>>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>>>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>>>>>
>>>>>>>> The DisplayPort phy should be left enabled if is still powered on
>>>>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>>>>>> PHY is not powered off.
>>>>>>>
>>>>>>> This series doesn't seem to solve the USB side of a problem. When the
>>>>>>> PHY is being switch to the 4-lane mode, USB controller looses PIPE
>>>>>>> clock, so it needs to be switched to the USB-2 mode.
>>>>>>
>>>>>> I didn't find issues with that on X13s.. Not sure if it's related, but
>>>>>> on the SL7, after plugging in a 4ln DP connection, I need to plug in
>>>>>> the USB thumb drive twice for the first time (only in that sequence)
>>>>>
>>>>> Might be.
>>>>>
>>>>>> But there's nothing interesting in dmesg and the phy seems to be
>>>>>> programmed with the same values on both the initial and the subsequent
>>>>>> working plug-in
>>>>>
>>>>> Please try using a DP dongle with USB 2 passthrough (there are some).
>>>>> Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
>>>>> devices. Would you be able to see the USB device on a bus?
>>>>
>>>> I only have a dongle with both display and usb that does 2ln dp
>>>> (I tested 4ln dp on a type-c display that I don't think has a hub)
>>>>
>>>> USB3 - yes, USB2 - no (but it works after a replug)
>>>>
>>>> Are you talking about essentially doing qcom,select-utmi-as-pipe-clk
>>>> at runtime?
>>>
>>> I think so.
>>
>> So after quite some time playing with that, I noticed that the USB2
>> device was never actually kicked off the bus.. and works totally fine
>> after connecting the display output (2ln DP)
>>
>> I was looking at dmesg, checking for discovery/disconnect messages,
>> but the device was simply never disconnected (which makes sense given
>> repurposing USB3 TX/RX lanes doesn't affect the D+/D- of USB2)
>>
>> I also read some docs and learnt that what we call
>> qcom,select-utmi-as-pipe-clk is suppossed to be a debug feature
>> and is unnecessary to set on USB2.0-only controllers
>>
>> The USB controller programming guide though doesn't talk about DP,
>> but I'd expect that we may need to set that override for 4lnDP+USB2
>> use cases (which I don't have a dongle for)
> 
> Yeah basically we need to:
> 1) power-off the USB3 PHY
> 2) switch to UTMI clock
> 
> In the following states:
> - USB safe mode (USB2 lanes may still be connected)
> - 4lanes DP mode
> - DP-only mode
> 
> But for this, the dwc3 should also get USB-C events with an addition mode-switch property.
> The flatten DWC3 node now allows that !

Yeah, I got even more confirmation this is intended..

I hacked up something that boils down to:

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 7977860932b1..e5a0a8ec624d 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -464,6 +464,11 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 		break;
 	}
 
+	if (dwc->mode_fn)
+		dwc->mode_fn(dwc, mode);

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7334de85ad10..ea56f5087ecb 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
+static void mode_fn(struct dwc3 *dwc, enum usb_role role)
+{
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+
+	if (dwc->usb3_generic_phy[0])
+		dwc3_qcom_select_utmi_clk(qcom, role == USB_ROLE_NONE);
 }


It was easy to tap into because there's already mode switch handling..
But obviously it's a hack - should I register a typec_mux in there?
Should it go to dwc3-common or dwc3-qcom?

Konrad
