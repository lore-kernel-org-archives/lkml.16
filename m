Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D5139CE3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874866; cv=none; b=Dq4Gi5LLWjtexp3nDDa3dqBMDpmTuY0UaSlbn3E0ZAtMlLcTz5ukuAoJncxS+jzzhKqpzHAvPv5tpEzYJuYKPwZCvPgwbFfpL5/YhQ4uo/q5tI19vhIJ4JWi0BE+WGzmEFG9R5VBAr0ogpS0k2MZMzYmjH0UVkRuM07iXuiB5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874866; c=relaxed/simple;
	bh=2sZ0l2epjf6MF3DPRfQE0LScLiTss8LpevA2DSjfUJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDcWC2+qEv1JFG6u5kKT41sCOMVTBV5h0RC849J6KMsXg9/8wGp09cNgfaCzb1Tvmh9JtwTjvTo26o2WMlR9ERoomWgZpFo90kZK31b8cvrtv7fkAQ+Gh1vXFr3T+nhrsmiisg8mvKv0/k+HPz5F4XwwVvyf+otEmy5n2N5aX8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAr8lVeM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAr8lVeM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SDKtuj014200
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41b+xfMaRsDIskp9rRi/qfONBM7yClOqcLLJmKg0FHk=; b=NAr8lVeMHAFKELYz
	lpKB2cjyUAw2GTSn6UW5nirmAu3KViAu0+ev4zeLSBxzoYE2chCThdN7Neq7Lngn
	PNFCZ3M6E4GLLhMkYl0vVcsX4foADclJXr7dRn2NiqLEU7HIFFdDHpu0cnt2KgNV
	rGnL8eACYBS0HIUWybrruA3XfQxW6r7tKmfAC/HHOrPn76ke5ueYgxNTIxZeX4yN
	KWssrHBS2ycjT1OfrfVyoTO1nM7v5W2nEKO/+jFOrCk5Uo7d9MFrlc5yqQj//sIX
	535agH9TzPwxQ+o5/2X1v3VuoCSYHqPRGzQr/7p2Lrh2D6PpSd8toIWL6HzRRZzk
	Qh8Bew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5hj84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:14:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-478f933cb4bso5388791cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874862; x=1746479662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41b+xfMaRsDIskp9rRi/qfONBM7yClOqcLLJmKg0FHk=;
        b=WceiO5GwwUOSSQc9myFov/2AxmUPkLMLHt25udxne2kuIZ/SatZIuB5mIxFayp8NqC
         ipqaUVuvzqg3J/YcdwTX60PkDEn7nT+j5ZYObTpJDAUYOGMOf8SP3nH/qWG+kuJY3qy5
         SbxlSoEsiRBA9+KN3PKL/y2K2Au9/JLBNho5Ta8NmqzraZxCv+nKxORw6gs+IDXlMsLM
         NZzfHuW2XoPqCVFtbfpsG7cdyZArikY0AAaixVhy6NqS4hqvPNckQ/R0QXftdM0yKJFx
         Iz63yuQ06UDeBWLQ0EZYMwMdrBWxoeYT8ruzgajhKNjsn0K8CcCLvGDRKhrXjSEOKDm+
         9eFA==
X-Forwarded-Encrypted: i=1; AJvYcCVacCrcois2MelKrxp2PiWl96uFOfJChAVjHfK/q/p3h7zuPZMrdJIiKFo2aG7cc+u2N+jm6U6McuOv2Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUEXirE2SW2qYktbVu0Qu2XVHqAJRYzeB3wi9MFjBGyD51mjLf
	yvoMOw/9swn0lI4bbdTYsYwYQs8UQxNTSC4YSZ74iy9TWKfAC6hc41IqZBhcN512mcvGszVgeVu
	HdNNz7Xr76mRCwQexnZUzO9KBhE+67vdFf+amNmAGZJYgI+T0RSKzrQXi832A1bw=
X-Gm-Gg: ASbGncsMQfj8xoeM1pwfHb6SXiTbSSgYzp1FvNFGOOJA1qgjNkHKEPi4Fr0xAoeJXvd
	zwI6IWcAbJpu7t/BpqnIMAkbkJwry6CCbuJ6xMwJdpU0yBeLW4ydfTgfSrZHu7bTDHuOodbePg7
	hGYF8OkY35kDN9YO2MHGFj9YNHS39ickFkFgbg/3f0B1Fr44Cli2NE7RPK6GgpZOJOAPuwuWGD1
	7nPOvGCocw2VWf8v421r9igUOAe2N633ZCQCFrCznIfonwcyQ7Ke+i834RUDyBJ0QyhRcgb3Pnp
	wK/oNRP2JvI5CeOkJ8mVhz5VIdWGttYBbhca2w83SkO6TJa/Ga9QSJxJoTXoL4LwUA==
X-Received: by 2002:a05:622a:118a:b0:474:f369:8dd4 with SMTP id d75a77b69052e-4801c98432fmr71421761cf.4.1745874861843;
        Mon, 28 Apr 2025 14:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjVrwoi/1hN99BLmpA5LGNolwBBr0IyLdtWYTa+BQm9ViRdogKeta990R2IFmjcH1MIGSZfw==
X-Received: by 2002:a05:622a:118a:b0:474:f369:8dd4 with SMTP id d75a77b69052e-4801c98432fmr71421511cf.4.1745874861325;
        Mon, 28 Apr 2025 14:14:21 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5acdsm6378559a12.38.2025.04.28.14.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:14:20 -0700 (PDT)
Message-ID: <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:14:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        neil.armstrong@linaro.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
 <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
 <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oUhv5Us6HOyoL16Vs0CglUFQq5zhD8o1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MCBTYWx0ZWRfX91KoqEJkQG4P 2DcCdq35L8ZQHbtTdQ4crsQnCo770z9/bQupBpBGezH02FKdZiKMDyrU7l6VCXvbSUfn7M5EPTR Clt17QLL45xc4YInREgGdwykLevV+PzOtsLoVIOzOyu9YNoQf4PuIPvi3wFcWIAWUcuDwOmMbLY
 D39pF0jMy2S3T/90Sd7e73JoT5pHR7UUzL/0ztgWtCL7bUTREbVF4O3laJBx4xlJ9R5Firc8XmG As0iS7tftCAcsUyMFSEiCoPFAqelr4d5+ggGJ1JMT7q/zlzSnH7+1e0lK+IP4RORMNWrVxKZR3r Eak2suFmW2x2fCyVm3fUWusmncI1dvX7GRseLO8Pc2UT9hK7R+mLY6RcUa//IYd7OrQwZ+/V7Eb
 29RHpKLcTFD3hKZ0QousJPZWskHw1D2bkMSB/iYZ0RKvRnRruatbQUHph9n4dk3UmhsNELjM
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680fefaf cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BJ3RCuW7w23lwjs21eMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oUhv5Us6HOyoL16Vs0CglUFQq5zhD8o1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280170

On 4/28/25 12:48 PM, Dmitry Baryshkov wrote:
> On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On 25/04/2025 23:49, Konrad Dybcio wrote:
>>> On 4/24/25 6:32 PM, Neil Armstrong wrote:
>>>> Add DT entries for the sm8650 iris decoder.
>>>>
>>>> Since the firmware is required to be signed, only enable
>>>> on Qualcomm development boards where the firmware is
>>>> available.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>> Changes in v2:
>>>> - removed useless firmware-name
>>>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
>>>> ---
>>>
>>> [...]
>>>
>>>> +            iris: video-codec@aa00000 {
>>>> +                    compatible = "qcom,sm8650-iris";
>>>> +                    reg = <0 0x0aa00000 0 0xf0000>;
>>>> +
>>>> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
>>>> +
>>>> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>>> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
>>>> +                                    <&rpmhpd RPMHPD_MXC>,
>>>> +                                    <&rpmhpd RPMHPD_MMCX>;
>>>> +                    power-domain-names = "venus",
>>>> +                                         "vcodec0",
>>>> +                                         "mxc",
>>>> +                                         "mmcx";
>>>> +
>>>> +                    operating-points-v2 = <&iris_opp_table>;
>>>> +
>>>> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
>>>> +                             <&videocc VIDEO_CC_MVS0_CLK>;
>>>> +                    clock-names = "iface",
>>>> +                                  "core",
>>>> +                                  "vcodec0_core";
>>>> +
>>>> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>>>> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>> +                    interconnect-names = "cpu-cfg",
>>>> +                                         "video-mem";
>>>> +
>>>> +                    /* FW load region */
>>>
>>> I don't think this comment brings value
>>
>> Right
>>
>>>
>>>> +                    memory-region = <&video_mem>;
>>>> +
>>>> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>>> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
>>>> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>>>> +                    reset-names = "bus",
>>>> +                                  "xo",
>>>> +                                  "core";
>>>> +
>>>> +                    iommus = <&apps_smmu 0x1940 0>,
>>>> +                             <&apps_smmu 0x1947 0>;
>>>
>>> I think you may also need 0x1942 0x0 (please also make the second value / SMR
>>> mask hex)> +
>>
>> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?

I saw it in docs only, maybe Vikash or Dikshita can chime in whether it's
necessary. It would have mask 0x0 if so.

>>
>>>> +                    dma-coherent;
>>>> +
>>>> +                    /*
>>>> +                     * IRIS firmware is signed by vendors, only
>>>> +                     * enable in boards where the proper signed firmware
>>>> +                     * is available.
>>>> +                     */
>>>
>>> Here's to another angry media article :(
>>>
>>> Please keep Iris enabled.. Vikash reassured me this is not an
>>> issue until the user attempts to use the decoder [1], and reading
>>> the code myself I come to the same conclusion (though I haven't given
>>> it a smoke test - please do that yourself, as you seem to have a better
>>> set up with these platforms).
>>>
>>> If the userland is sane, it should throw an error and defer to CPU
>>> decoding.
>>>
>>> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
>>> would prevent .sync_state
>>
>> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)
> 
> I'd second him here: if there is no firmware, don't enable the device.
> It's better than the users having cryptic messages in the dmesg,
> trying to understand why the driver errors out.

I don't agree.. the firmware may appear later at boot (e.g. user installs a
small rootfs and manually pulls in linux-firmware). Plus without the firmware,
we can still power on and off the IP block, particularly achieve sync_state
regardless of it

Konrad
