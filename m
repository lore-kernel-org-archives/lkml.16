Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9A26E14D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407435; cv=none; b=Gay6iE+SdanLHGQj5m00UeTRLBKhUS8WwjXrChlq9eDINMwWHhEsuHnJ9scOtKkoF7vIWS5IQQXkCP5jxiVCiRAO/1Dqg95M+hW10wYPg+PFzsdkd3KMHBL4k3OH2hyTftZBcRXGKkm21mnDdaFExb9nkxVsWC+CHadC8GRCCe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407435; c=relaxed/simple;
	bh=2z6jgr2mydmIuSZkOkN5LFizXc1g8MQjKJz15NS0Gtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpIdWwsENBRc3mUvNdwf8C/ZZRoQrDI8Tn/N0DyF66jLvtRVHHc91Mq78XvlZKQamAVDTMxCZsJRHlFzwmDJX0eiocr95Gq+ywaYuoDuMskis4hdcdZ09FveEK+venwIWETjBhXXB9vKhz94BMft8BeaPA4ZL7OCxbj+IrvHsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBKh4NWS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBKh4NWS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApUg7014055
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZ4ckw9phUjE/33TkefvnOiLJnkaspW3ubnn0WXfC08=; b=SBKh4NWSJXTdsQ/x
	R169j8ZWbp3gYKHHMSmHOzPn2rmDMTwDQWkI4cJzvCAcqAhDii1ffZXbOHQYgnMm
	Hn7wb+GpNmwkEQPqzlT/QsbH3Ef9IjmaxjLxD8llKoQY/bishKeZftBAQ/Kos7ug
	qMfljaq1Q2kstPjCwrg+1RRvJmQRpdP+Vd+hTUzPgwRFH5TVusZM2Ei+6D5e5ObQ
	F73kpc4AQfOReVoW4ZTmpK8H6izxkJOjh9eeuQDrjeflKC31xIxDMSnOlwGNoZxM
	syjhvVCQy3r3rqCRRw5WMB4e7UuqW5ocWxoz/Ok68ejDIPOzyizEKRdva2Gk2+CM
	/Vsgmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39wue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:23:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so121204385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407431; x=1746012231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ4ckw9phUjE/33TkefvnOiLJnkaspW3ubnn0WXfC08=;
        b=FhJMKprH0Ks0MChrlC3o64rNbN2sm5PiAHaZmZeUeF+Bd+esW37sCPkO8RISXQZFGs
         ECArDlCb82arPgbXNssP2e2+w9dsx/4cdoMm111NMrICtFHec440UpMvoQ4yJF8lI52V
         MkIYpHaLLfynAcIqyDHYwrk5gDQju2Pxrw7xqWXL9mHfdwlYseOPLREE9Mci9VYZx+WR
         5icYPgpshWwCL0ALD5F7naTf0Dl+N7t9XhvkDkMvK9qWMsRruHxsQFfwgwT4LIG3rWAm
         lDyGaq3OrjuWBTbnhIe4VGjEx54kBZdauiFrrpJFyIBflNO48F0MrUZ7z7l7GoRl5K0d
         5BJQ==
X-Gm-Message-State: AOJu0Yx8M88gfrpD1QRej20H5mb4i2wi9dnyo3KCKVcKAFmSHy4eInOZ
	43g71ygYwbm8rhkY6DDs+yiHl5jJlaNNOu7Ngq2/SkWsJP+vlncqFAldj37vtj1YRMU2qc6M1d1
	bk8f+awokW6pfEzAqXro9Ra2FnWxYorBg+pALWGtKPfwsZVPoSA5/qiH0ooxT7Ss=
X-Gm-Gg: ASbGncs/MxeECDsAm27XoRA3kN0s+S6i9zTLK1odf7qTu7hYJ9t1opOjIU7wW6Ny+H8
	9DrDFS8qz9/3J7kn64ctDMBIpsH0qw3DdsKQrJG7WqAtfAgokukMD7S236YkVEcfXvkMOg8Igfh
	olU0BzSz+q3QXScci2CG6VTfpiJbdx36KsTsgIKaD86dlpJpORGeDrWAq2kAvbEBaNI8gZDauJH
	jHor8rezrROa80LJR/gLYuZG4Js/gNoSd4HQl5LY3mFSMMQHCiEU3OH8tlB/62UAn4kouxthE+h
	H9SCELeC1/CKBlsuDzIvPE2d4DPrOecsdS+Mybb0KBr/1mYI3qWrYtq9A/TEzAw6I4I=
X-Received: by 2002:a05:620a:390b:b0:7c3:c814:591d with SMTP id af79cd13be357-7c94d243e9bmr190753585a.1.1745407430784;
        Wed, 23 Apr 2025 04:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdIHiXpPDkGGBJDXfBBBsFTvUdPXz6hDe/XrnRasquYh3mWBJjmxvRBRjElMM6IUIxVffCBw==
X-Received: by 2002:a05:620a:390b:b0:7c3:c814:591d with SMTP id af79cd13be357-7c94d243e9bmr190750985a.1.1745407430388;
        Wed, 23 Apr 2025 04:23:50 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b1d3sm785726966b.4.2025.04.23.04.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:23:49 -0700 (PDT)
Message-ID: <fc6b1fe6-7847-4aa8-838a-dbd0ad675412@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 13:23:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Set max link speed to Gen4
 for PCIe EP
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com
References: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
 <20250423-update_phy-v1-2-30eb51703bb8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-update_phy-v1-2-30eb51703bb8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3OCBTYWx0ZWRfX17bRzTFmBYe3 6O6Z9HdHnAkJscvThMDv3NpRcTk9GubGwGS9gFcKy7v0X1k3+aLN6ENo8/WXqFgoWFVNboHE9mi /kgo9h48ONVxeOZTUH2xFyLwLPJy3KAlle4oIYIoQYTJEUkc69N9mUrZ2crChwWF3YtQnh8PQba
 MIIxPc05SYFEjY15GBZ6TqiFngzuNVfZwVt9R1CcOhajHqIw89gxS1hmnSt9a1QvgJh3LF4auHD dakps4rWfwAvFA3HfRw47j8n2nTzvk11JKjqedyeWzrQZ0obk7lA58qMmCu7Eonfa2NOM7Mq6ex dEfwRWSjfschATVo54WsGgFTTOvvFWEtT+cTZrc/6eqhfBcexEt+y+0dBBe71J4XXcoWPXArufo
 CVwr4XvEoVHgerhUErFRW9WAz6SQ2If/reTkMppBJ1U8eofNyzsoiHr5e3PjB5EmqqJ+cr+1
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808cdc8 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=iRih2zsw3dMuVQupJ74A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LdVc-cRuGYDOoZfM_sfQa9bgLgvIOetA
X-Proofpoint-GUID: LdVc-cRuGYDOoZfM_sfQa9bgLgvIOetA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230078

On 4/23/25 1:15 PM, Mrinmay Sarkar wrote:
> The maximum link speed was previously restricted to Gen3 due to
> the absence of Gen4 equalization support in the driver.
> 
> Add this change to set the maximum link speed to Gen4, as Gen4
> equalization support has now been added into the driver.
> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5bd0c03476b143444543c68cd1c1d475c3302555..65d9433a298f80eb782439120ad9c3c74025b441 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6462,7 +6462,7 @@ pcie0_ep: pcie-ep@1c00000 {
>  		power-domains = <&gcc PCIE_0_GDSC>;
>  		phys = <&pcie0_phy>;
>  		phy-names = "pciephy";
> -		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
> +		max-link-speed = <4>;

The property may now be removed, as 4 is the value read out from
the hardware

Konrad
