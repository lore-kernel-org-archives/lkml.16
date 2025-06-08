Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6711F7904
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749396182; cv=none; b=XGvPNr+2qgh/CLRMawS7SxXhIO1gh5fkwcAgxt5SolL150lR2Su2WjzSc6HJbtuXmsQsE/dREIIPgLV6ewV5JKw4b48O+VE+veJ8NrfoL+/Bhcw3H79NP4cME4Zn1nmNBZOWFgcuSScuSOJxRMv0qe396lIvFTCJT7XgmOrrJgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749396182; c=relaxed/simple;
	bh=ptQFao/OofQlTfqLItAwl+GhxtDOI0XRBcE6Lieou/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEDStOhExCjkKAHOrO2TP7w97CSxE7TUuNJM/4/8WLLqewpqMGkgiH/LbiO2L6d8lWGxTbz+lfCKRlqN/3B2cuEsSZUb35JYwHgbSUn0YociqZrjmaAlFsaoKMeTjqJOrCXkmbgVF+E3Js3nLApnwgbBrFaCgQwZhKzF11gU7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVuFddRP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVuFddRP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5588eLmx023589
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 15:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	13P65ulnafQqWcDpy1/wER8wngffFs27twU25vBaqvs=; b=cVuFddRPlSAGRaz1
	T5lZpRUwacP3P7VOp8cw+vUU5FaUnLcX1hx7O6T+R+d2lJs4symDIKwM4dWakOIe
	hPh8DtJ9CFRqUMgZknPDV0CveDVL04DdQ9tAwYc5qjPeGBBdcq8ZwcacNL1Yet7t
	KoFncOBxCUdCJjpOcLFsIwms0v+JxX3QQf/57DGSpZ+zZe9V4JfmJOoav2PV/ee6
	PRKZkcOgeD603ZsOcULghJMHz8/TJ9Q+ewxAfU82jkzsKc9jiPYFW6johDAxh+15
	lCB2NauGw2Y15s7WuBuf5ilsJIR4yi56pNbf44xF4KxcJKs51OGg8yBVyxtNjjAx
	xFARsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv34yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 15:22:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38c5c3130so199656485a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749396178; x=1750000978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13P65ulnafQqWcDpy1/wER8wngffFs27twU25vBaqvs=;
        b=tUPAdeMNhaeomG8lw9x5utn4Dtxk51ntW9bgR0eIb/wEti2IMTag3SvYhzXnoweyFj
         FNqN8UQxBdNvB8jSACvgdU4HCIcUthlHXZgRL4+nwvZrpa7iZPaPh+x+wBIgXLnsrrJG
         f/5rHQrhkU2PmXqykWhYX+RTjvP22cwJ8igcPx1o0/s1DQCwU9ig4WZpDvX9Uzv5ZvaI
         FEqEYQY66I5Y9GKC8ZNWkwbEeJsHxWkoG9vMV9KMB5dpsGelwARsP+PoDsAQkg9CV1T+
         KXQkyEvmKSj+MekrHQxcV6MtDlrWw03mAfHZkxDCR43wr1pzA+JyiFZobkDWotg5qIvB
         5RBw==
X-Forwarded-Encrypted: i=1; AJvYcCUK94YMHiuVovcX9KoEGrHygpfnjpRR2k7RvT6Q69d8Symk4OTrgIrt89RHGbazgR+LCnz0ZF4N7q76d90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Ef1nuwgz1/RjH1z91CEmzCcuR4OT+5YGzuo43EJ13PomYK+X
	zdMKRE5NEVN8ngffD0bK4jx99bayVf2Rr0o69hg/9bLFIfsgsTPpb6FFHfY3WCpdooSRhypA0tt
	WtprOkcijcGYSU8nLIGUk6JSrZQBvGjOl23jcN1IEUh33f4xzT/WQRcDdB+24vsjOCUo=
X-Gm-Gg: ASbGncvlnB9sJGsHapv2XI7TR05BLX54sSpGfDHKLABGY9X/OD0xEuH17I8UhSBzHOd
	mbIfTXfx/mfoIiQI1XDmcH0u0FAgPjICiw+fEasiSj6r/THsI26Q4WDjqN7rVLSRnlIRL/pQOZr
	xX4yS+STRLzPeaLZHPQSMe9gdoGeRC3jYet0vr26gvMo05+vuqkl8/fwCo0jGEiz5epSGztAIzW
	I+MIH6vWkodukBc7xa4fu7UrgMCpBiJ6trvs2KdlQ6O57JWg8ifMEZ1gsgeYwP8e7xfcC7e8at6
	ZjV95qUnH83D83hDb5J+VwY8KvwrmvRosW4FMItQklyTMa1DqhIoXQF+6BnOtCofJhgIsfsBLkQ
	C8+H/KPL328jhGg==
X-Received: by 2002:a05:620a:4115:b0:7ca:f3d0:e7c8 with SMTP id af79cd13be357-7d229902399mr1639045185a.52.1749396178129;
        Sun, 08 Jun 2025 08:22:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnSqt4f5d27nfmpGHazAr/AHomdNBLRlQ7g+WSi7FPRafeIv8WYiG9jip5qK2a13UFctyKXg==
X-Received: by 2002:a05:620a:4115:b0:7ca:f3d0:e7c8 with SMTP id af79cd13be357-7d229902399mr1639040585a.52.1749396177705;
        Sun, 08 Jun 2025 08:22:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536773896dsm796917e87.254.2025.06.08.08.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 08:22:55 -0700 (PDT)
Message-ID: <42a69fa4-48ac-4a2f-a2ff-b4e1fe3a228a@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 18:22:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
 <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
 <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
 <rwjc7zkitubi6cdre5a7owmo76nopavkgifvvn6yq2mv2hrth4@bhwbodchd2gx>
 <CACSVV03mNkELWDB_uxdjEa5GeWZUY=42O8QG4qTrg6zquT1Bgw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CACSVV03mNkELWDB_uxdjEa5GeWZUY=42O8QG4qTrg6zquT1Bgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y7TKpTRsVjBtWDxvh7g0nOmvZfCwEZpN
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6845aad3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=qMk0qIXPt1Ot_Wd-wSIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: y7TKpTRsVjBtWDxvh7g0nOmvZfCwEZpN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMiBTYWx0ZWRfX5NdbOWWy7yFE
 iGC1eFAU/cz0F0dvmqg1zwl6YApceDbV3ZaA8zOc6gwZjqd6G/usQi3qLNjPJoHcISlsVIPuNxh
 0lyQrgGepFDDZYsjQMj+WiHRxfsxoTjV6hssaigcoJaMr++Rv3vtt6E18woyHbLRA7zOf0nW7Ao
 dcITlvlJ6uDFZWRsFtWfqPquKq6y9V1PjAn2xwJ+R2CZ/mBzZXJNTyi8EIiZ89Swz8RlfdQtnSo
 Ali+ZGgQQ4E2qfbZlzFi2jtkB2EY7FNRhdYG/9fgckp9Vao6IScsiJjw3gAijiFmQNPlWoPSKNC
 uhmfVwH3/8vl2HkOfQxmd7xLsysMHbWZY3GyTGpNXdppv6dNpgWYt6XmmUeWpQYobhEUIFcmfOr
 f5z2DJnJHf+Uq9y2hIRzGFb/6AJb+iGNOANnSjgYalaYTRvLT3xzmKsmxD9l8kKui+/5I2Jp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080122

On 08/06/2025 18:20, Rob Clark wrote:
> On Sun, Jun 8, 2025 at 8:09 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, Jun 08, 2025 at 07:10:11AM -0700, Rob Clark wrote:
>>> On Sat, Jun 7, 2025 at 1:17 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
>>>>> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
>>>>> version of Adreno X1-85 GPU. Describe this new GPU and also add
>>>>> the secure gpu firmware path that should used for X1P42100 CRD.
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>>>>>   arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>>>>>   arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
>>>>>   3 files changed, 131 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
>>>>>                        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>>>>>                };
>>>>>
>>>>> +             qfprom: efuse@221c8000 {
>>>>> +                     compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
>>>>> +                     reg = <0 0x221c8000 0 0x1000>;
>>>>> +                     #address-cells = <1>;
>>>>> +                     #size-cells = <1>;
>>>>> +             };
>>>>> +
>>>>>                pmu@24091000 {
>>>>>                        compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>>>>>                        reg = <0 0x24091000 0 0x1000>;
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>>>>> index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>>>>> @@ -15,3 +15,7 @@ / {
>>>>>        model = "Qualcomm Technologies, Inc. X1P42100 CRD";
>>>>>        compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
>>>>>   };
>>>>> +
>>>>> +&gpu_zap_shader {
>>>>> +     firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
>>>>> +};
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
>>>>> index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
>>>>> @@ -17,15 +17,134 @@
>>>>>   /delete-node/ &cpu_pd9;
>>>>>   /delete-node/ &cpu_pd10;
>>>>>   /delete-node/ &cpu_pd11;
>>>>> +/delete-node/ &gpu_opp_table;
>>>>>   /delete-node/ &pcie3_phy;
>>>>>
>>>>>   &gcc {
>>>>>        compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
>>>>>   };
>>>>>
>>>>> -/* The GPU is physically different and will be brought up later */
>>>>> +&gmu {
>>>>> +     /delete-property/ compatible;
>>>>> +     compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
>>>>> +};
>>>>> +
>>>>> +&qfprom {
>>>>> +     gpu_speed_bin: gpu_speed_bin@119 {
>>>>> +             reg = <0x119 0x2>;
>>>>> +             bits = <7 9>;
>>>>> +     };
>>>>> +};
>>>>> +
>>>>>   &gpu {
>>>>>        /delete-property/ compatible;
>>>>
>>>> I think, you can drop this line.
>>>>
>>>>> +
>>>>> +     compatible = "qcom,adreno-43030c00", "qcom,adreno";
>>>>> +
>>>>> +     nvmem-cells = <&gpu_speed_bin>;
>>>>> +     nvmem-cell-names = "speed_bin";
>>>>> +
>>>>> +     gpu_opp_table: opp-table {
>>>>> +             compatible = "operating-points-v2-adreno", "operating-points-v2";
>>>>> +
>>>>> +             opp-1400000000 {
>>>>> +                     opp-hz = /bits/ 64 <1400000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
>>>>> +                     opp-peak-kBps = <16500000>;
>>>>> +                     qcom,opp-acd-level = <0xa8295ffd>;
>>>>> +                     opp-supported-hw = <0x3>;
>>>>> +             };
>>>>> +
>>>>> +             opp-1250000000 {
>>>>> +                     opp-hz = /bits/ 64 <1250000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
>>>>> +                     opp-peak-kBps = <16500000>;
>>>>> +                     qcom,opp-acd-level = <0x882a5ffd>;
>>>>> +                     opp-supported-hw = <0x7>;
>>>>> +             };
>>>>> +
>>>>> +             opp-1107000000 {
>>>>> +                     opp-hz = /bits/ 64 <1107000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>>>>> +                     opp-peak-kBps = <16500000>;
>>>>> +                     qcom,opp-acd-level = <0x882a5ffd>;
>>>>> +                     opp-supported-hw = <0xf>;
>>>>> +             };
>>>>> +
>>>>> +             opp-1014000000 {
>>>>> +                     opp-hz = /bits/ 64 <1014000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>>>>> +                     opp-peak-kBps = <14398438>;
>>>>> +                     qcom,opp-acd-level = <0xa82a5ffd>;
>>>>> +                     opp-supported-hw = <0xf>;
>>>>> +             };
>>>>> +
>>>>> +             opp-940000000 {
>>>>> +                     opp-hz = /bits/ 64 <940000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>>>>> +                     opp-peak-kBps = <14398438>;
>>>>> +                     qcom,opp-acd-level = <0xa82a5ffd>;
>>>>> +                     opp-supported-hw = <0xf>;
>>>>> +             };
>>>>> +
>>>>> +             opp-825000000 {
>>>>> +                     opp-hz = /bits/ 64 <825000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>>>>> +                     opp-peak-kBps = <12449219>;
>>>>> +                     qcom,opp-acd-level = <0x882b5ffd>;
>>>>> +                     opp-supported-hw = <0xf>;
>>>>> +             };
>>>>> +
>>>>> +             opp-720000000 {
>>>>> +                     opp-hz = /bits/ 64 <720000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
>>>>> +                     opp-peak-kBps = <10687500>;
>>>>> +                     qcom,opp-acd-level = <0xa82c5ffd>;
>>>>> +                     opp-supported-hw = <0xf>;
>>>>> +             };
>>>>> +
>>>>> +             opp-666000000-0 {
>>>>> +                     opp-hz = /bits/ 64 <666000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>>>>> +                     opp-peak-kBps = <8171875>;
>>>>> +                     qcom,opp-acd-level = <0xa82d5ffd>;
>>>>> +                     opp-supported-hw = <0xf>;
>>>>> +             };
>>>>> +
>>>>> +             /* Only applicable for SKUs which has 666Mhz as Fmax */
>>>>> +             opp-666000000-1 {
>>>>> +                     opp-hz = /bits/ 64 <666000000>;
>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>>>>> +                     opp-peak-kBps = <16500000>;
>>>>
>>>> This looks odd, why is it so high?
>>>
>>> You want max bandwidth on max opp
>>
>> Yes, but can it actually sustain / provide this BW?
>>
> 
> I'd have to trust Akhil on that one, but I have no reason to believe
> otherwise.  Just pointing out we've done analogous things elsewhere
> (for ex, cpu bw for sc7180-lite.dtsi)

Ack. Then I'll wait for v2 with no deleting of compatible lines (a new 
line here would just replace the existing one).


-- 
With best wishes
Dmitry
