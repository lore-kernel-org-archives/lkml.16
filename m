Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD679246BA8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561860; cv=none; b=EFKGa0bxexBFaD5QPOXXjqe9PN0B4EczPvpcZBxlhDC8XpnRxAP2Sle6Jt9re7joAC+OhDRTG3kU9B6rr7skLGNfLatgB9/PD5i8oGGP7DrZN3FF34vFFqUpAvWYrfFuZnLMKEkr789wBf1T3M3v/RLtWqwb6L4W4FpMDiy+uqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561860; c=relaxed/simple;
	bh=ubmc0E3DElK29TkGdRofug1lLiuw8WMG0knLOztL8zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3WWiE2j291cei6ooCJD8+0LXpW9CS9dADzVsm1KmYi+JEQVZ5cF9V7Ew9I6JkLsp7n6r2xt57dzqHQHSkWq/PzWftX2NMbSu6neZJ0X6Pt5bNKfPvIZbRoEfAXRF18Mn3tIcp5MaNuGij/cpOBPun1chcZAgMhN3by/Lb2/G28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGlFFhx/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGlFFhx/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A7eGs2014930
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dn5KKzDTTIKXjL+XAC1RBo/O2bQaEOF3N/dUCupBtXw=; b=dGlFFhx/SjmX3aWl
	M1cCZWvtd99PKsd5kjUbReRmNnzbMTzfnLOZOJfROaepOYFttscbKgjjKAwnWtrY
	bWgnC0ARWQPv57xY2L2Hn9WFdIS3WZUrdOouFCHS4zuAisczDR7tlqJRLs5p5zBF
	FY3l5wEPaX/O5rq5a1yJYujK2LTSa4JBJej1fSLop/fUQyueTBNhOzZscL31fXo8
	jUd/QsqTGM0O4Rg6+lUjp62+XM78Ve9jMoImvFZsTrVjVF+vnGilHjr1dSerpo+H
	WeiTxb0f4qtLd6BXZAqN6TKvIV+9EZVAY6hf4SbwpBop1auI8z8RNIPutWgTGYZo
	TjA86g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn69gbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:24:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0979c176eso95506585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561856; x=1750166656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dn5KKzDTTIKXjL+XAC1RBo/O2bQaEOF3N/dUCupBtXw=;
        b=C6S8SDY0kluurRzACBmlqC1aPbYb4m+bIzoJo40+VbbaecdAf7qAJ7FDpeg6BN+vfw
         xzygZt1ti3sw8nmQRd5NldkAAHIk/Swq8pF1UlPwWmppSwRDONn+HsXyuEU8kOrEPf0n
         KKCfCXGFBSOFucE/ncwE6cv11LuyiE+oh1n3DC45EjRqYI2ceRkBI6viyG7nmrJb+/Ik
         xIqiLnCEBJrlIHUNcdwK6oCQ/7PRgdldTBhRneR4JhhuJQ/cLhbFJYHTMfQ3zrolqMA0
         0dQRyHtMrz2idOZE9v/2yW7bqJvp4dLHkgZ3vxwzm5ukt/qwQ8lmcLnYTQF9pzCXAAn3
         rajg==
X-Forwarded-Encrypted: i=1; AJvYcCXucu9CwtXtbi0HYU3ahWvPTXAPgFGO31LRk6gIL1QVeaUAvJzt722K3EyVRVGUp+VPR+D44QW9Z9ROU4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HL83rbFiXdmnMK+NGhhUNQB6Iu8vURyftB0YjMVRsA+1Piup
	FCwiVMEyQ25Z8obO+EV0+AS4bYBgjkUSwAwyJUutXaSiTrUIJIvUAGEfiV3RIRBwVdkkdqjGPC9
	VJzlFtNenRlaoiLWXNQdQ58bOzrDaHznRgvfTGaEpj8Dh5n/ytJEEvUdyVVhIeWtRdmI=
X-Gm-Gg: ASbGncth4C0dYVBuKDcGt3LrBc31S8Vbs5ZQBA0SIg2m8xsXjvUNchb1JCVkZPh1yiC
	fhbXifbJxUh6yy2NfH814K0mEJWLNBzmyTwH2QhWu0BlEaPwO+rhbw4m8DPcS5PF4hQFM0EGLEq
	E+I/6YEkqZNPcW02YAaJ82Tp7OIVJa5LZDtSIY5Ml6MKjncoMZWy2Fgj6bSKUBzkS/Zr3/Gqa/9
	5QcxlkQoH+2x5giUPaMvzVzL03Dhr3ZThYIuouBBv1fbg+NU+VbO2YRITJI0zJO6QkuPsyRv3HO
	xWXo4e4ZfaXjwQCz/6BlqJrzrHBiIXyo9MN9t5OnlqsDFqB1JN6x5tL299JskN4hhZ/2/vaiI6c
	+
X-Received: by 2002:a05:620a:2481:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d331c4ebbcmr897728385a.6.1749561856563;
        Tue, 10 Jun 2025 06:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZDQUf98Q4fdDvEHwFwKWgGVh807ziV/MvTQbORZEqmYL/UEFzh9cRBG5EYwiG4QVxnOk8RA==
X-Received: by 2002:a05:620a:2481:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d331c4ebbcmr897726285a.6.1749561855990;
        Tue, 10 Jun 2025 06:24:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754632sm722896866b.26.2025.06.10.06.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:24:15 -0700 (PDT)
Message-ID: <a63ff3a7-c67b-4251-81f3-ce6cc3a3d068@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:24:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Jie Gan <jie.gan@oss.qualcomm.com>, Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
 <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
 <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
 <79f5e42f-f857-4247-abf9-d0f3f5c1a498@quicinc.com>
 <f3f8f446-4f0d-482d-952d-35c80d7d7881@oss.qualcomm.com>
 <405f0432-3f07-45be-8511-06235dcd84d0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <405f0432-3f07-45be-8511-06235dcd84d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNSBTYWx0ZWRfXxVw0RIDBbtI8
 ATKQJKYYUTbkAi/4Ayg+PWQFmQ5UJ4rrUuyuv2wRGTvFSOkH1ndOE6jS9j6mh/nWDMZj8eI+3J/
 hlz0Ggkq0HHo8IwHl22HcnCuvLOc7M31FrO9J89nlguXio/sinr3doREo1sRTZEz9Cvn7Tmbd5z
 YJ1oKoJN08VaHihol0AIusTIoNbEUinaypPA3a/KLg4+lqi2NsU8pPIAiRHmIBczAq5FH4xygxL
 YK9Q/pigPbY59l7pNG6owyWRtW0yvdLB3G30nSPAcDM6NBQqOLcAR8PR4L1qCw6PhXe7McEAPmj
 1Cc5xokZyHxqOmYJE9WNogeH7UL65XwPYwaQZbe4BjAfkJzbIH5F32nSMCHk7yx9Pxs+VBonRS6
 tEjgDssiifnXxQEuOdTz7J8l+n4G2UIvjJv80tuGOm2ZSOpgxczGS/v7lpAPGO26O2rlWJSa
X-Proofpoint-GUID: s71vAzo-9gEt250gSHdkbmULVqTQ40Q8
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68483201 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=jKJs8sBhnlDJ8AvWEW4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: s71vAzo-9gEt250gSHdkbmULVqTQ40Q8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=973 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100105

On 6/3/25 5:17 AM, Jie Gan wrote:
> 
> 
> On 5/31/2025 7:05 AM, Konrad Dybcio wrote:
>> On 5/28/25 5:02 AM, Jie Gan wrote:
>>>
>>>
>>> On 5/27/2025 6:41 PM, Konrad Dybcio wrote:
>>>> On 5/27/25 12:32 PM, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
>>>>>> On 5/27/25 3:52 AM, Jie Gan wrote:
>>>>>>> Disable the CTI device of the camera block to prevent potential NoC errors
>>>>>>> during AMBA bus device matching.
>>>>>>>
>>>>>>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>>>>>>> through a mailbox. However, the camera block resides outside the AP domain,
>>>>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>>>>
>>>>>> Which clock drives it then?
>>>>>
>>>>> It's qcom,aoss-qmp.
>>>>>
>>>>> clk_prepare->qmp_qdss_clk_prepare
>>>>> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280
>>>>
>>>> I'm confused about this part:
>>>>
>>>>> However, the camera block resides outside the AP domain,
>>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>>
>>>> Do we need to poke the QMP of another DRV?
>>>
>>> The AOSS has a clock control register for all QDSS clocks. when we vote the qdss clock, the aoss_qmp driver will send a message to AOSS to enable the clock control register, then the clock control register will enable all QDSS clocks.
>>>
>>> The QDSS clock is not a single clock source, it is a term that representing all the clock sources utilized by the QDSS.
>>
>> What I'm trying to ask is, is there any way we could enable that
>> clock from Linux? Can the camera hw turn these on? Maybe we could
>> trick it into enabling them?
> 
> There is a power issue if we keep the debug clock on with a long time.
> 
> We had a discussion with AOP to check if possible to add the debug clock of titan to the QDSS clock list, but they need time to evaluate it.

Changing the firmware is a band-aid solution, as the update will never
reach millions of devices on the market. I'm curious in whether there's
any way (or os-accessible debug register) to manage the necessary clocks
from Linux, as a workaround.

> From Coresight view, what we can do by now is disable it in DT to prevent the unexpected NoC error.

How about something like this:

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bb8b6c3ebd03..fc2ab750f2cd 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -2461,6 +2461,9 @@ cti@6c13000 {
 
                        clocks = <&aoss_qmp>;
                        clock-names = "apb_pclk";
+
+                       /* Not all required clocks can be enabled from the OS */
+                       status = "fail";
                };
 
                cti@6c20000 {

Konrad
