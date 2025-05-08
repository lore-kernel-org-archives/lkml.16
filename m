Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D70B1CAA82
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715751; cv=none; b=UEPNMKu2J41BMKyLFMKhezXCQllng34QNUADqzuyIOSQTJ9hdatlRpjDiyuxkoqcJZ8B0QHD67JQONR3veUxRsfF3+p3cNgXJj6IQ0y+Vd6tkoIJVLz1r3LcaA2mgY/9JJqDnJsd5FsNsElIbZqiWEwAw5HruZ2aTnEaOIBdh+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715751; c=relaxed/simple;
	bh=27WwVieidzn2BcATMMgaqpsgBUr/P8DLFcUueR8VGf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HsFMdWy8GFQFj7w+/G5T6FZ1Mr9jGsLM6dFZR+BQbzG0I1mkv9YZbBRCsfjjLsQkLeq68TYaV2S5iSv06yJ6MdXTv3ttmDrhWuupF0XLOtaXHktBNpP+C/09q0ZpNRHwCaDTRLFK5Y2zEbAZLvaAjkqc4NKlo/MpF20B4MSEmnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlXapdrF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlXapdrF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CYKFM016559
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qldyCRgOce72TXROsUhbcjpO3Xa1SeD/9OiSSUryuh8=; b=OlXapdrFr52ZcQAG
	IUKvON3UUb6FVXjlnlPcCQhK/zSEWjTkK5NyXehQXUiD+Wbj84mEUzsh2IHWo2aH
	9eEqljQGBXNRyAJPSFuaMxETvJ81HR9Xoc6cOTNvjrTn7OLnu9oShCw6quDjgmTE
	P3K/zsN136Mt+pmAgPUFpYQpz4P2Ywi83eFpGH8sduXaanXiGQBdFS+MHBvuo5ID
	/zjFO2GC82YEti6/F83L8v+oHKEdAnR2K802UDFIqQv7N2lFmP4V9GFkjkU/xDPK
	7C78GfM4hZqffL0s2elAJaJByEljwV83gf9HM+iiIb2hoLjrYAHHk8k3eDbyYsVJ
	DKY24Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8sngq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:49:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f541067fa4so2268006d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715746; x=1747320546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qldyCRgOce72TXROsUhbcjpO3Xa1SeD/9OiSSUryuh8=;
        b=gWXL5WC9GmKyQBepvOtIQPv6Mhi/Humjz4byDQNntzcJSSI6eDslIB7ZkHDRUY1e3h
         djrbwOlNEUimE8Q2PCLmYSMllzrIFMRfDcTAhoawesWSiO5oen6n3rwbINMWlc06IEd8
         slc4Nmxeb7Icicm9kdHL5uVoF0x0CM8GHHwPG2crusUBdRk2OEOlSjLtGj3JbYeaaZI/
         NIc2ryBnL8mnN5jFIP32HftHJ359lb9jFVvx+CW1CzITHJAsN0DwM3wYV1pZByG6rJ7W
         Oa/HIGpBshszV4Hsv90GEhJthHu6DEWKPZRvatp1pu4bHMHrkB9Q6bG85UdQdp7P1cY/
         2kdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd3EePFkYZgulze0sL5LyMLXsoZOCgM+Dp2uRK2ZW5BM13wX9B9Nc9C4Gqm0ibnVt9yWXKtNTQUd3wOAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpFHGJjqW/dnKoOyizD7Sc9jhG5TnXGgboc5H0Te0KqRJGQVXY
	UzWrPTX1iPAXO3zpuBwtDR9sPsTRXs/0HyBCaE65pEapFzgBYbq20ezA2UxDqcJqJan/tJp8hxu
	q+8daIHItLPTTq+bPOPVer9b/caT85ApXi6CGrjteKUdmFlJW7ZI6HTYAvNQzwLE=
X-Gm-Gg: ASbGncsNqT4FU/tKxqDY4i3pKpXNiGznh0j+1Xs6sHGN6i5i2fj4jLdc7Za0q+8yAvU
	XtkP4djaL39bh61XDxeY9OLMDFGlUBvsvSWE/tr+s3cjP7oI1NpnDkPo5jTnA6SHqenRXV+1RT3
	OL9ehAL2CxN/QgEbEU4slv38crogAf9JxMyXoRcxcvwAGFvkGa0ZnwOYtodt51AlGejb1fT/csK
	mMTg+zkv720grGxezd5khLR/wSZvGv9diNQPrDrTi6Mk5p+mkMnnqWwJR7nyMLnfIFjLRYYtfKh
	a4cv6RtjZyNL+np0gQFc+UcUeq19hBx6YAZlyfSiqtsoYKGN2lMuimzh/KHQ/ZQugDE=
X-Received: by 2002:a05:620a:270f:b0:7c9:256a:953 with SMTP id af79cd13be357-7caf73b0bedmr396225585a.9.1746715746262;
        Thu, 08 May 2025 07:49:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+9khCG7eGq/88sPZKGFtf3XVBpgywWjKfmMdZg7HZIVqD++J88V95vrN5PbIP3q6Vz717Bw==
X-Received: by 2002:a05:620a:270f:b0:7c9:256a:953 with SMTP id af79cd13be357-7caf73b0bedmr396223385a.9.1746715745796;
        Thu, 08 May 2025 07:49:05 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950b5e6sm1110884666b.148.2025.05.08.07.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:49:05 -0700 (PDT)
Message-ID: <bc3d6d8a-cd3b-40b6-8f20-24a28d0e85ec@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:49:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, neil.armstrong@linaro.org,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
 <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
 <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
 <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
 <4lmt5cgg2tanrughooxw73h2brwyyc6ifqgo3ju6iz4enkvkic@umeijjk4ijxg>
 <651f1421-b471-485a-aea0-1b1ef92f8331@oss.qualcomm.com>
 <32ktmnjhrfrvpi5glipex7qfrcxa5hyl26em3f6xos5l3n2zl4@b7rmzx6wpsj2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <32ktmnjhrfrvpi5glipex7qfrcxa5hyl26em3f6xos5l3n2zl4@b7rmzx6wpsj2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4gKCR4JWRAhhTM9JnGzcAYx3up3cYlws
X-Proofpoint-ORIG-GUID: 4gKCR4JWRAhhTM9JnGzcAYx3up3cYlws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNyBTYWx0ZWRfX9gVqKyFwYtCn
 LxSgge8NzFIHBCxU2nRkTU0o2CGQqr73mQ6xiA5HRnxpMfXZe4PQQ8+bD6AUZuClBEe+Uj+wLU5
 KD4Ff4sMKB/XBe3ZQVpkRYRiZCBLZ4PjcaRjty8sY4Pd1i8hq3K+bea505e26Ydp7onC+7XKc4x
 ixLvQExuEjrEp/mvhMuSJMWWeOXGb6Kl0GpoHlr4Ywcr76hElykEs58FowHw+2SO5mr1zschxuQ
 2eEfYHbl5QPZBDvYBq6/HK2n/wXZcB3+lcA1bQTjMHsYxtogSnbbuSMyz3cLZg6wfcZWXSfmvKE
 BOR9ZjXx09LxePDX2ekRHfYVcz95YKkJSr/2/4uat85P+tFMz/Pa+IG0bDu5czgtB5mbQgIMqZB
 H8sZRHYgI+XOZxciNu2Cj1HHGxl7Xpcxk3IMO3aCVEPQ/kyy+VxHEFjxnqxJio66GPkyVoEP
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cc463 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=A6KFluJds7oaKCUSWh0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080127

On 5/7/25 2:27 AM, Dmitry Baryshkov wrote:
> On Wed, May 07, 2025 at 12:53:27AM +0200, Konrad Dybcio wrote:
>> On 5/6/25 10:23 PM, Bjorn Andersson wrote:
>>> On Mon, Apr 28, 2025 at 11:14:18PM +0200, Konrad Dybcio wrote:
>>>> On 4/28/25 12:48 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 25/04/2025 23:49, Konrad Dybcio wrote:
>>>>>>> On 4/24/25 6:32 PM, Neil Armstrong wrote:
>>>>>>>> Add DT entries for the sm8650 iris decoder.
>>>>>>>>
>>>>>>>> Since the firmware is required to be signed, only enable
>>>>>>>> on Qualcomm development boards where the firmware is
>>>>>>>> available.
>>>>>>>>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>> ---
>>>>>>>> Changes in v2:
>>>>>>>> - removed useless firmware-name
>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
>>>>>>>> ---
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +            iris: video-codec@aa00000 {
>>>>>>>> +                    compatible = "qcom,sm8650-iris";
>>>>>>>> +                    reg = <0 0x0aa00000 0 0xf0000>;
>>>>>>>> +
>>>>>>>> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>>>>> +
>>>>>>>> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>>>>>>> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
>>>>>>>> +                                    <&rpmhpd RPMHPD_MXC>,
>>>>>>>> +                                    <&rpmhpd RPMHPD_MMCX>;
>>>>>>>> +                    power-domain-names = "venus",
>>>>>>>> +                                         "vcodec0",
>>>>>>>> +                                         "mxc",
>>>>>>>> +                                         "mmcx";
>>>>>>>> +
>>>>>>>> +                    operating-points-v2 = <&iris_opp_table>;
>>>>>>>> +
>>>>>>>> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>>>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
>>>>>>>> +                             <&videocc VIDEO_CC_MVS0_CLK>;
>>>>>>>> +                    clock-names = "iface",
>>>>>>>> +                                  "core",
>>>>>>>> +                                  "vcodec0_core";
>>>>>>>> +
>>>>>>>> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>>>> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>>>> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>>>>>>>> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>>>>> +                    interconnect-names = "cpu-cfg",
>>>>>>>> +                                         "video-mem";
>>>>>>>> +
>>>>>>>> +                    /* FW load region */
>>>>>>>
>>>>>>> I don't think this comment brings value
>>>>>>
>>>>>> Right
>>>>>>
>>>>>>>
>>>>>>>> +                    memory-region = <&video_mem>;
>>>>>>>> +
>>>>>>>> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>>>>>>> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
>>>>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>>>>>>>> +                    reset-names = "bus",
>>>>>>>> +                                  "xo",
>>>>>>>> +                                  "core";
>>>>>>>> +
>>>>>>>> +                    iommus = <&apps_smmu 0x1940 0>,
>>>>>>>> +                             <&apps_smmu 0x1947 0>;
>>>>>>>
>>>>>>> I think you may also need 0x1942 0x0 (please also make the second value / SMR
>>>>>>> mask hex)> +
>>>>>>
>>>>>> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
>>>>
>>>> I saw it in docs only, maybe Vikash or Dikshita can chime in whether it's
>>>> necessary. It would have mask 0x0 if so.
>>>>
>>>>>>
>>>>>>>> +                    dma-coherent;
>>>>>>>> +
>>>>>>>> +                    /*
>>>>>>>> +                     * IRIS firmware is signed by vendors, only
>>>>>>>> +                     * enable in boards where the proper signed firmware
>>>>>>>> +                     * is available.
>>>>>>>> +                     */
>>>>>>>
>>>>>>> Here's to another angry media article :(
>>>>>>>
>>>>>>> Please keep Iris enabled.. Vikash reassured me this is not an
>>>>>>> issue until the user attempts to use the decoder [1], and reading
>>>>>>> the code myself I come to the same conclusion (though I haven't given
>>>>>>> it a smoke test - please do that yourself, as you seem to have a better
>>>>>>> set up with these platforms).
>>>>>>>
>>>>>>> If the userland is sane, it should throw an error and defer to CPU
>>>>>>> decoding.
>>>>>>>
>>>>>>> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
>>>>>>> would prevent .sync_state
>>>>>>
>>>>>> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)
>>>>>
>>>>> I'd second him here: if there is no firmware, don't enable the device.
>>>>> It's better than the users having cryptic messages in the dmesg,
>>>>> trying to understand why the driver errors out.
>>>>
>>>> I don't agree.. the firmware may appear later at boot (e.g. user installs a
>>>> small rootfs and manually pulls in linux-firmware). Plus without the firmware,
>>>> we can still power on and off the IP block, particularly achieve sync_state
>>>> regardless of it
>>>>
>>>
>>> Not "available during boot", but rather "available for a particular
>>> board".
>>
>> I'd argue that if a device is in the hands of users, there already exists
>> some acceptable set of fw binaries.. but most developers aren't in the
>> position to upload them into l-f.. And quite frankly I'm not the biggest
>> fan of having a gigabyte of 99%-the-same files with a dozen lines changed
>> and a different signature prepended to them either..
>>
>>> We generally avoid enabling device_nodes that depend on vendor-signed
>>> firmware until someone has tested the device on such board and specified
>>> the proper path to the vendor-specific firmware.
>>>
>>> Are you suggesting that we should leave this enabled on all boards for
>>> some reason (perhaps to ensure that resources are adequately managed)?
>>
>> Yes, for that reason indeed.
>>
>> We don't generally need to load firmware to turn something *off*. And
>> most IP blocks don't **actually** need to be presented with firmware at
>> probe time (I can only think of external ICs like no-storage touch
>> controllers that need the fw uploaded on each powerup). 
>>
>> Telling the user "hey, this is supported but the firmware file can't
>> be loaded on your device" may also be better sounding than "won't work
>> on your machine" (with the quiet part being: "because someone hasn't
>> copied 5 lines of DTS")
> 
> Then we need to make sure _not_ to make a default path useable, so that
> the users know that there is no proper firmware rather than facing the
> cryptic error of "firmware something -error".
> 
> But... I'd rather prefer to keep firmware-backed nodes disabled exactly
> for the reason of "making someone copy 5 lines of DTS", which usually
> means that somebody has thought about how to get and where to put the
> binary.

Fine, let's keep it disabled

Konrad

