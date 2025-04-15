Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0873E1BEF87
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709439; cv=none; b=mUcEJcq9badJhJTVEZmHiA2h2NBwJaJCNX3iWREAtyDl7fwaxB2Ohc7UmjI228tlo9q5hx9a044ozNPs30I3HlLM64bAhOoR14gHB1r+/VZr1YGNpc8F0rFkQqXu4Jq0P1FddwGfcpZIFoHUUpTPuKajReX2NasS0ySpm4M25Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709439; c=relaxed/simple;
	bh=Th7WriDiYrkxmx3/hBn6QByQtuMX0uB1qla4rW6g5GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFRPEmzKBopwuAfI+74PWjcaIhDvP12u2g9ai4Y3nhU62ZTf3SEBP1ijZeJP9hkUhn+xiIYpzRjyMUWFxNYImzxt44UHUdUtXRVHy25ywxg62ue4upQ7NO/+YixCpl1tDeoTNz9MRYAD+vGRU1+kjAbzUG0zTmopszcST8b/Qjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zha2cXVs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zha2cXVs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tNFN005961
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7rEIe9nkXGFJWd3ji5OvlykGCyqATfbb/4yOX6WSIs=; b=Zha2cXVsLk6EOw+1
	pWzvoQ5TlIRWzAfdm5c1M+TesYRoan9tapyeBb++xJb15uyaWa2HsEtvtIxW4ZKn
	G9KkGoAQIvCzM9dK8j6u5Q06/RriFiGlhkQ/ZFJz+Uc+7Jb34YlU4UdR6urUNFSg
	GT/0Sg1l8rZumkUuZYfpzQarn+GZ5H0VJ7CBOP4zur6PuGSCOEkOnEwd4J15F5SQ
	O8F26k81NDwhYKFo65hgqlOsoaINGhLXmWYiD3bmAbJemY5QU9U62/dH4Q1FjvSa
	y2qxQR+35Sy9pYNPOtl7hsFOI9cV0Tb2j3jd7X4gZVzYXG4PFCYRCkKK4P1/K8Db
	KwHlSg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7pjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:30:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e703so898886785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709419; x=1745314219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7rEIe9nkXGFJWd3ji5OvlykGCyqATfbb/4yOX6WSIs=;
        b=RVGcB2/z4EkHh7NDY180fF/XJcpM4Gqi7UlId6i+uyk+lTpTsbKAom2G2zbvSpwawx
         NzusFcPwXAA8S4Q8VnWTGFXtxztm+BqRwvExbEFQplEG4KFqTQ+u2jO4BzPKHBiKFlIW
         Lt2DzhmkWI5Ba7WwHMiqun1mRvzdHle+1X2w22PiAPPRE1ZWq9vqlqkY0nTFgnkkmDJX
         JtWWRuSD2RINAzPIlq4oSDOSgsDJZJxVFuPiSP0ORd32vqSetINoH/N+OnboGsbn92g2
         l5pgGMKLd5OpnJZ2SlVS+oTAIhxDnhl8AYPnODVRVHck0CLCs3QFiXxOOEJEUeway2ap
         qcNg==
X-Forwarded-Encrypted: i=1; AJvYcCVNHSNckc0+yOVn0TrDOfL5W0FKFQg9sXrk43c+KFZK7Tt+QXH5FOvey9r6OWqvDPeYziCaIyZd7L+nEdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAGB5TQpw48JMQdvyFTOtxgEJSmvw8flb5f3rB1EkhhhT8xRaL
	gzk3Lhwv3Qc8MI804sKp0loEq4lJ/+ft7vXoHB4bNIdh4MFb8zjWHAJyKrG/+UZGAME+eEN+Lo0
	d3yf8GkBwvP4j1B8b/tgW5m5FjrDb9vDc4JL8bleQJ0T+kBP7pMJOGgT+A2tVW2A=
X-Gm-Gg: ASbGncvgGRYQ6IRkYUz8Ihm7iUy7zGAQ0z6zadRhk/p2o9FeaJ6pVYG7p5NjnEr0K83
	YEbpHtLrPBaPzimSG/Q0gGyrNxlfFWKxc7X9ENsA8FpoJfsmkioehWFgM6oBy79XX0HNmh7M6hC
	H7claWJZN3O/lWxmadtjSvGooapTDMiyRaxTVSBuSf/PziQL/zGqtAhh02Zk20ekQ4q2VQ/1MdZ
	E5zXrHtcXmyHUo6woDsRgD9MiQPFK82nBQYvahRAN8Sm5gvyFKfpatFa8qZOAgKR3JU1au2FsoS
	wPcsBYyEbCUfinQ9hCeCPuTnrQEtDW1xOYUSvbJT17lza4wE1VVlpYvo2taY7M4Iei5Buuk/Eh2
	kb42WwIgajPR7vpcgSP8eiV7JjW9XswfvtQNtXlnir5HZhM/oLNEgqOc2z4Em
X-Received: by 2002:a05:620a:3182:b0:7c5:dfe5:ea78 with SMTP id af79cd13be357-7c7af118cb9mr2148269285a.8.1744709419530;
        Tue, 15 Apr 2025 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD7KeYwZL5LASnn/RIXjWS4yY4pIenuEWMyr8YbWxKLXL0KqveiG1Fu/gAksh1TLOPVMlFyg==
X-Received: by 2002:a05:620a:3182:b0:7c5:dfe5:ea78 with SMTP id af79cd13be357-7c7af118cb9mr2148265485a.8.1744709419051;
        Tue, 15 Apr 2025 02:30:19 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd? (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi. [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cc096sm20862631fa.29.2025.04.15.02.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:30:18 -0700 (PDT)
Message-ID: <ebfbc145-eb8f-4354-b6b6-ad7ecec5856b@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:30:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>
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
 <7b876428-6f54-4c40-a234-57443eb97ecb@oss.qualcomm.com>
 <a2b44f41-bb54-4d88-bba0-f5b86b8186b5@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a2b44f41-bb54-4d88-bba0-f5b86b8186b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe273d cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=yQgE6wdlrsv_WjiXGEMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bmCYNLHzVEKnc8PCUxDFEYoKiyitynAR
X-Proofpoint-ORIG-GUID: bmCYNLHzVEKnc8PCUxDFEYoKiyitynAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150066

On 14/04/2025 16:54, Ayushi Makhija wrote:
> On 4/14/2025 3:37 PM, Dmitry Baryshkov wrote:
>> On 14/04/2025 12:56, Ayushi Makhija wrote:
>>> Hi Dmitry,
>>>
>>> On 4/11/2025 1:31 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
>>>>> Hi Dmirity/Konard
>>>>>
>>>>> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
>>>>>> On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
>>>>>>> Add anx7625 DSI to DP bridge device nodes.
>>>>>>>
>>>>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>>>>> ---
>>>>>>>    arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>>>>>>>    1 file changed, 207 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>>>> index 175f8b1e3b2d..8e784ccf4138 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>>>> @@ -28,6 +28,13 @@ chosen {
>>>>>>>            stdout-path = "serial0:115200n8";
>>>>>>>        };
>>>>>>>    +    vph_pwr: vph-pwr-regulator {
>>>>>>> +        compatible = "regulator-fixed";
>>>>>>> +        regulator-name = "vph_pwr";
>>>>>>> +        regulator-always-on;
>>>>>>> +        regulator-boot-on;
>>>>>>> +    };
>>>>>>> +
>>>>>>>        vreg_conn_1p8: vreg_conn_1p8 {
>>>>>>>            compatible = "regulator-fixed";
>>>>>>>            regulator-name = "vreg_conn_1p8";
>>>>>>> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>>>>>>>                };
>>>>>>>            };
>>>>>>>        };
>>>>>>> +
>>>>>>> +    dp-dsi0-connector {
>>>>>>> +        compatible = "dp-connector";
>>>>>>> +        label = "DSI0";
>>>>>>> +        type = "full-size";
>>>>>>> +
>>>>>>> +        port {
>>>>>>> +            dp_dsi0_connector_in: endpoint {
>>>>>>> +                remote-endpoint = <&dsi2dp_bridge0_out>;
>>>>>>> +            };
>>>>>>> +        };
>>>>>>> +    };
>>>>>>> +
>>>>>>> +    dp-dsi1-connector {
>>>>>>> +        compatible = "dp-connector";
>>>>>>> +        label = "DSI1";
>>>>>>> +        type = "full-size";
>>>>>>> +
>>>>>>> +        port {
>>>>>>> +            dp_dsi1_connector_in: endpoint {
>>>>>>> +                remote-endpoint = <&dsi2dp_bridge1_out>;
>>>>>>> +            };
>>>>>>> +        };
>>>>>>> +    };
>>>>>>>    };
>>>>>>>      &apps_rsc {
>>>>>>> @@ -517,9 +548,135 @@ &i2c11 {
>>>>>>>      &i2c18 {
>>>>>>>        clock-frequency = <400000>;
>>>>>>> -    pinctrl-0 = <&qup_i2c18_default>;
>>>>>>> +    pinctrl-0 = <&qup_i2c18_default>,
>>>>>>> +            <&io_expander_intr_active>,
>>>>>>> +            <&io_expander_reset_active>;
>>>>>>
>>>>>> These pinctrl entries should go to the IO expander itself.
>>>>>>
>>>>>>>        pinctrl-names = "default";
>>>>>>> +
>>>>>>>        status = "okay";
>>>>>>> +
>>>>>>> +    io_expander: gpio@74 {
>>>>>>> +        compatible = "ti,tca9539";
>>>>>>> +        reg = <0x74>;
>>>>>>> +        interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>>>>> +        gpio-controller;
>>>>>>> +        #gpio-cells = <2>;
>>>>>>> +        interrupt-controller;
>>>>>>> +        #interrupt-cells = <2>;
>>>>>>> +
>>>>>>> +        gpio2-hog {
>>>>>>
>>>>>> This needs a huuge explanation in the commit message. Otherwise I'd say
>>>>>> these pins should likely be used by the corresponding anx bridges.
>>>>>
>>>>> Thanks, for the review.
>>>>>
>>>>> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
>>>>> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
>>>>> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
>>>>> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.
>>>>
>>>> Please make sure that there are pinctrl entries for all pins.
>>>>
>>>
>>> Thanks, for the review.
>>>
>>> While declaring the pinctrl entries inside the io_expander node, I am getting below error while checking the DTBS check against DT-binding.
>>>
>>> Error : /local/mnt/workspace/amakhija/linux_next_11042025/linux/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: gpio@74: 'dsi0-int-pin-state', 'dsi1-int-pin-state' do not match any of the regexes:
>>>           '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+' from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>>
>> TCA9539 is a GPIO controller rather than a pinctrl device, so it doesn't use pinctrl functions. You don't need to describe properties of the pins that it provides. However, it can use some pins on its own (like reset-gpios). In such a case corresponding pin should have a pinctrl configuration under its pinctrl device.
>>
> 
> Hi Dmitry,
> 
> Thanks, for the review.
> 
>   ______________                  _____________________                       ___________________
> |              |                |                     |                     |                   |
> |       GPIO 98|---ioexp_intr-->|              GPIO 0 |------Reset--------->|RESET_N            |
> |       GPIO 97|<--ioexp_reset--|              GPIO 1 |----power-enable---->|POWER_EN           |
> |              |                |                     |                     |                   |
> |    SOC       |                |  tca9539            |                     |    anx7625 bridge |
> |  LeMans      |                |  io_expander        |                     |                   |
> |              |                |              GPIO 2 |<----DSI0_INT_1P8_N--|ALERT_N/INTP       |
> |______________|                |_____________________|                     |___________________|
> 
> 
> Based on the above connection diagram, I have already configured the reset(gpio0), power-enable(gpio1) and interrupt (ALERT_N/INTP) (gpio2) for first instance of anx7625 bridge. Similarly I have configured the reset(gpio8), power-enable(gpio9) and interrupt (gpio10) for the second instance of the anx7625 bridge.
> 
> bridge@58 {
>               compatible = "analogix,anx7625";
>               reg = <0x58>;
>               interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
>               enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
>               reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> 
> 
> I think above configuration should be fine, we don't need any pinctrl for io expander's gpios going to anx7625 bridge.
> 
> Other two RESET (gpio97) and INTR (gpio98) gpios, which is connecting SOC to io expander (tca9539), I have already declared them under tlmm node.
> 
> io_expander_intr_active: io-expander-intr-active-state {
>          pins = "gpio98";
>          function = "gpio";
>          drive-strength = <2>;
>          bias-disable;
> };
> 
> io_expander_reset_active: io-expander-reset-active-state {
>          pins = "gpio97";
>          function = "gpio";
>          drive-strength = <2>;
>          bias-disable;
>          output-high;

Yes, this this was I was looking for, thank you.

> };
> 
> Thanks,
> Ayushi
> 
>>>
>>>           io_expander: gpio@74 {
>>>                   compatible = "ti,tca9539";
>>>                   reg = <0x74>;
>>>                   interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>                   gpio-controller;
>>>                   #gpio-cells = <2>;
>>>                   interrupt-controller;
>>>                   #interrupt-cells = <2>;
>>>
>>>                   pinctrl-0 = <&io_expander_intr_active>,
>>>                               <&io_expander_reset_active>;
>>>                   pinctrl-names = "default";
>>>
>>>                   dsi0_int_pin: dsi0-int-pin-state {
>>>                           pins = "gpio2";
>>>                           input-enable;
>>>                           bias-disable;
>>>                   };
>>>
>>>                   dsi1_int_pin: dsi1-int-pin-state {
>>>                           pins = "gpio10";
>>>                           input-enable;
>>>                           bias-disable;
>>>                   };
>>>
>>>           };
>>>
>>> I couldn't find any devicetree example of tca9539 which is using pinctrl. The gpio-pca95xx.yaml DT binding does not match with any regex of the patterns properties.
>>>
>>> Thanks,
>>> Ayushi
>>
>>
> 


-- 
With best wishes
Dmitry
