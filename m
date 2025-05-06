Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC6E21B192
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572016; cv=none; b=chpHwrGZ1+S0/WG09Ss6gfvCVQP/F1Ta3Hr97BbhN2FThde+rz16YVvG1ET8K3TAzGGXczEhomHfzRZ9cPC7Zd76GOoewKyIuFkbE45+B6uYPrKCeFQwfxAfrh1XITjecDw57OChRp/XFOo/Xy/c0+z43E5D9/m2TfxCFBEYGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572016; c=relaxed/simple;
	bh=WnMPpwg5JDjp5B8VN00/1xJ4Cen7riGSv0Wxd6c0ZG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OT0JhjJVU48Cll2vDWUxyg1lyXlUbxZNgS6MhWtPFqtFYSXIE39Z3JtzTlIW1xN+d4tsrOC+SQGkU0JpzmMHHhpntUNZ2w5KQ8bPrXClJ4e09h3K8kYf7pWSe62foQp8wZ5tYq2ufOQxy002tJqYAkSZPZ2qEd7zWWCnRfe+lDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShSjCFLo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShSjCFLo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546G3RN1010247
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 22:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygofsMCIB0jAe4SjuNSFtVbwkj+wcUa/4Hu0Jd/IzCc=; b=ShSjCFLoNtC+bO7H
	kpSDfPhqfkuBmEepArQEgKU2v0smbJN1omencgfMxQC5D37JAUW/cMfJ/ncrlJpH
	uWcTT9P40BRlEZjaiyq+q5L9H6l00N+63h/EKmwov79qwdcFJwj3ag65RROKfEGg
	MD3Mqq/vGSdLR5nU/+tlIg8DPW2kzeGaTt8lrrVd7qowj3uNyXbvIQBmo/3sNxji
	UlCk9bPVNrpg+Z+LinpadsDWjHRYqr54oBDRzZ9RNNiqse2HPBsLVPGu3NYHomvy
	eCEddUpAPxIRb461+w2Ki94Ann47aAVw8xIaE7/TKHjPj3F6BwA5AzmjXyIUmseh
	Vk4wpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1gxd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 22:53:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f53a60f449so2093336d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 15:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746572012; x=1747176812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygofsMCIB0jAe4SjuNSFtVbwkj+wcUa/4Hu0Jd/IzCc=;
        b=qz4pNJmbyTYjS/orjZGV/qGd5Zbxl1lU9SYe0rKwVSOypjzZmsDhwizMsxN3mOkc85
         mouDDWEFAhyE/fiMK9TKPNhAUCIFCY9491kU59ev/jjrcpN/sGRbHEhDhMAa35uDBzPO
         Ph9TRRLbg0AGfSpM2NJFfskHzHNmfLA3uisu9Z7do0QbpEYYe/qIpaa5MdrcygZ8DBCZ
         ITWMWDP2WfSQ8RWwGj2esIyT6E5QgfK6eRIrgWXNDwWSCpu6QEtW2q7Nf8wQn9d+fM6h
         u4SqaNhs34sw6ScmjH/3qgm1Hg8/QvDMV9UaQtCheDcrkOHK46oT1wBchw0SsshIo7tL
         VoPg==
X-Forwarded-Encrypted: i=1; AJvYcCXUv1G77DHkyt3gHI8L3AbzTlX0OYPNPBNxe30yiwYfNeAcpyJy8V64U7dA1QkBcCSC3GLCMpOOrmRyhdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxg0+kvUXM0mo+R2DqUgEkVxJMGb/68Rqmml0MM1TCLutW1OH
	BaZ4VCnbMClnIAAToHyoUbRTNIixsdpSKtt+QybGjN6U0SGwRTS5+3KUfSBYDag6N7vCNdPCb45
	WOi1jgVhmQKyGJFr3IaSuZRqPA/SSEk+hngmnOIZML7Ve/jchGTyWn/VIKbNbStc=
X-Gm-Gg: ASbGncvZoWI/H2Ms2B7q0kc4fg9/HynMECONfq7cNfrcIcxgVzscc6vFh9kXFqzDmMR
	o/JfvfUMRX0jFE3V5lmXCi4UhyfQjeakpI3uZalnf+jl+CRo3cfSY/QWwBSk3wI3Qggi+SfNsEO
	NzSy5VVZf2uQ+fuOBPS6NeGyq0qDb1tlEfqc7UFAG6x1kaRQOa0AJrcBI5n7vNG9XwlKYCJOgiz
	PzfROEaekzB8Xfk/sxNbLG1adpzZs02vq0VNLB0UY9jlPD/vYmakNnuBUmsMJChG9ms3U4kcqff
	OU0POkF1x5H3J2gzdw5awV4hx3xwArKP7XCs/EfNYqPmVbREtRZsNjGhnAmlAromdTw=
X-Received: by 2002:ad4:5b87:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f542a33ea5mr5293426d6.4.1746572011901;
        Tue, 06 May 2025 15:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE43cQIT9y8yXMQPh1E2nIEuYn9kHdGjFj3F2wY9ltVfAgob6dYvmnhqdTo3UgiQkpbsfe9cg==
X-Received: by 2002:ad4:5b87:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f542a33ea5mr5293256d6.4.1746572011426;
        Tue, 06 May 2025 15:53:31 -0700 (PDT)
Received: from [192.168.65.143] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fb61307074sm2741831a12.75.2025.05.06.15.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 15:53:30 -0700 (PDT)
Message-ID: <651f1421-b471-485a-aea0-1b1ef92f8331@oss.qualcomm.com>
Date: Wed, 7 May 2025 00:53:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
 <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
 <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
 <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
 <4lmt5cgg2tanrughooxw73h2brwyyc6ifqgo3ju6iz4enkvkic@umeijjk4ijxg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4lmt5cgg2tanrughooxw73h2brwyyc6ifqgo3ju6iz4enkvkic@umeijjk4ijxg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mVQN0dPXrhhmyY9Hf8azmCOCOngh0_uv
X-Proofpoint-ORIG-GUID: mVQN0dPXrhhmyY9Hf8azmCOCOngh0_uv
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681a92ed cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=sxpqNeDj30WxuUvu1H0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDIxNyBTYWx0ZWRfX6qAzW00xX3Jl
 Bc9Tq7GivdEje362BjqLymGiKRmLTHx558j8FFDkxv2LwaCRVpZVcR+uPO4mzvGBdntZjtlQW/8
 4apB168Xw9LG7/wllAppd7C3dXxjx40MfvOaEYzRiUza8qyIYpC51p0TgC/dq6zqBS2h+6sz6M1
 +uPt3aVT2Ya7jTrcZ4voaK8a0cqP3s0qa9s6pLVBn0eOV+LkUewV/LJcLUyS3Emfd2oUCTzHR2t
 ShNU0p6UDFLX5NEA+ZS4cenWLOsfX/6hF8fbNwE6CALVEfvDYyQfLHcpDq0mf5Bs65dIDAtoxVN
 xbt/KdY4Q/uTx/P2aN1DmvZO+/E5SBMA/O1YdrdGAa36HhytWY5gCcBjvh8Oxr6CDSl+wot3bxu
 OXSeQUSoMf5dilfTSbw7Y5Mz3eOCs+KZ34CzXixs41N362SdBoGGnwtQtuUYIhZxOP4qFgEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_09,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060217

On 5/6/25 10:23 PM, Bjorn Andersson wrote:
> On Mon, Apr 28, 2025 at 11:14:18PM +0200, Konrad Dybcio wrote:
>> On 4/28/25 12:48 PM, Dmitry Baryshkov wrote:
>>> On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 25/04/2025 23:49, Konrad Dybcio wrote:
>>>>> On 4/24/25 6:32 PM, Neil Armstrong wrote:
>>>>>> Add DT entries for the sm8650 iris decoder.
>>>>>>
>>>>>> Since the firmware is required to be signed, only enable
>>>>>> on Qualcomm development boards where the firmware is
>>>>>> available.
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - removed useless firmware-name
>>>>>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +            iris: video-codec@aa00000 {
>>>>>> +                    compatible = "qcom,sm8650-iris";
>>>>>> +                    reg = <0 0x0aa00000 0 0xf0000>;
>>>>>> +
>>>>>> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>>> +
>>>>>> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>>>>> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
>>>>>> +                                    <&rpmhpd RPMHPD_MXC>,
>>>>>> +                                    <&rpmhpd RPMHPD_MMCX>;
>>>>>> +                    power-domain-names = "venus",
>>>>>> +                                         "vcodec0",
>>>>>> +                                         "mxc",
>>>>>> +                                         "mmcx";
>>>>>> +
>>>>>> +                    operating-points-v2 = <&iris_opp_table>;
>>>>>> +
>>>>>> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
>>>>>> +                             <&videocc VIDEO_CC_MVS0_CLK>;
>>>>>> +                    clock-names = "iface",
>>>>>> +                                  "core",
>>>>>> +                                  "vcodec0_core";
>>>>>> +
>>>>>> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>>>>>> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>>> +                    interconnect-names = "cpu-cfg",
>>>>>> +                                         "video-mem";
>>>>>> +
>>>>>> +                    /* FW load region */
>>>>>
>>>>> I don't think this comment brings value
>>>>
>>>> Right
>>>>
>>>>>
>>>>>> +                    memory-region = <&video_mem>;
>>>>>> +
>>>>>> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>>>>> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
>>>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>>>>>> +                    reset-names = "bus",
>>>>>> +                                  "xo",
>>>>>> +                                  "core";
>>>>>> +
>>>>>> +                    iommus = <&apps_smmu 0x1940 0>,
>>>>>> +                             <&apps_smmu 0x1947 0>;
>>>>>
>>>>> I think you may also need 0x1942 0x0 (please also make the second value / SMR
>>>>> mask hex)> +
>>>>
>>>> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
>>
>> I saw it in docs only, maybe Vikash or Dikshita can chime in whether it's
>> necessary. It would have mask 0x0 if so.
>>
>>>>
>>>>>> +                    dma-coherent;
>>>>>> +
>>>>>> +                    /*
>>>>>> +                     * IRIS firmware is signed by vendors, only
>>>>>> +                     * enable in boards where the proper signed firmware
>>>>>> +                     * is available.
>>>>>> +                     */
>>>>>
>>>>> Here's to another angry media article :(
>>>>>
>>>>> Please keep Iris enabled.. Vikash reassured me this is not an
>>>>> issue until the user attempts to use the decoder [1], and reading
>>>>> the code myself I come to the same conclusion (though I haven't given
>>>>> it a smoke test - please do that yourself, as you seem to have a better
>>>>> set up with these platforms).
>>>>>
>>>>> If the userland is sane, it should throw an error and defer to CPU
>>>>> decoding.
>>>>>
>>>>> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
>>>>> would prevent .sync_state
>>>>
>>>> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)
>>>
>>> I'd second him here: if there is no firmware, don't enable the device.
>>> It's better than the users having cryptic messages in the dmesg,
>>> trying to understand why the driver errors out.
>>
>> I don't agree.. the firmware may appear later at boot (e.g. user installs a
>> small rootfs and manually pulls in linux-firmware). Plus without the firmware,
>> we can still power on and off the IP block, particularly achieve sync_state
>> regardless of it
>>
> 
> Not "available during boot", but rather "available for a particular
> board".

I'd argue that if a device is in the hands of users, there already exists
some acceptable set of fw binaries.. but most developers aren't in the
position to upload them into l-f.. And quite frankly I'm not the biggest
fan of having a gigabyte of 99%-the-same files with a dozen lines changed
and a different signature prepended to them either..

> We generally avoid enabling device_nodes that depend on vendor-signed
> firmware until someone has tested the device on such board and specified
> the proper path to the vendor-specific firmware.
> 
> Are you suggesting that we should leave this enabled on all boards for
> some reason (perhaps to ensure that resources are adequately managed)?

Yes, for that reason indeed.

We don't generally need to load firmware to turn something *off*. And
most IP blocks don't **actually** need to be presented with firmware at
probe time (I can only think of external ICs like no-storage touch
controllers that need the fw uploaded on each powerup). 

Telling the user "hey, this is supported but the firmware file can't
be loaded on your device" may also be better sounding than "won't work
on your machine" (with the quiet part being: "because someone hasn't
copied 5 lines of DTS")

Konrad
