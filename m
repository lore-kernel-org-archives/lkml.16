Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A45D1FCFE3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279267; cv=none; b=kzPEIVt9JLtBOIfM/7mnVR2T5ej4w5BFPSrjopSuD3faW90fnT/w5IGJUzVgk5WRtZgrTS9HNRxDRsj6riScjnJCrXwHq8kXbQcBT/gY8qD5Kmq2IcqB9TxlWWcRI1ixHj1q0D9T2fl2p64vV3VlVr+qsushu0e4YcIOY0T3sis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279267; c=relaxed/simple;
	bh=ugClV3eeqzKYRN5PsMUBkSZ3OrzpNqr4jdCip1GqpLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qcurT6jAmjgUCqn6pI4ls/bK2qL0eWwNDAYa2ORb5c1EpEA8u18vL0Vg0n7YXSj2YZbc507jTjOX/3Xttx/ZgGzlkWHd1cTrJXPzA0HgvBAYkD1ON2biBJibQ6JqbH1pFYYCoe6xlRzZ7QpNfvG8tLtcEth8/6CLxLomiq/wKj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oi5FWt4R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oi5FWt4R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BD4Ifh010356
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsqyhUimndYfhqr19Fi/0ypW4Gx9BRnINfl1VKPK4yk=; b=oi5FWt4Rjsn56DnX
	p7COLY6W2VIycp1i6bqXzsdKObkrzE3Lj6qRF66LeyRBj/QvSs+ZrXUuuuVqULmR
	sdHKFQzch/SkzsOCx+YwhgdF+Qn8f4qK39aBToV3qmTbdNZkqNlKhCWVbJPEvZoA
	kBANVCNwWaF2lL6ri3VnNBf1v/GcMqbTy+DKuIfUrZNqgKzlzy769VfYahCbe52B
	aimCTA7eKQxSO86PyuFJOpi+zc7jC0J3Fx/GRLvN2wMeSYmnib5i3kKI+bKRj7G9
	EK76X0dfgW87SCAzE6Gub3Xx0ZEslhz0zGydgsnY50LweGi3WV1efqeGPF08qqSK
	bBxKvg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5cgja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:07:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46e78a271d3so8110411cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279262; x=1739884062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsqyhUimndYfhqr19Fi/0ypW4Gx9BRnINfl1VKPK4yk=;
        b=taXBTvy2EcBOna7SzF1aLnxV0m296N+gq2yA838H6L3yjiTcWhP4qFgCa4zR2r7SGc
         u1REXKMiO8hCNNxv9LXovWXUqO4JvCagNHcYCbUmCDrbh1Ox7pPeTWgeqXPwU5nj7Hvr
         EIm+/mMHyn89GbR/ozPjAhUf8RE8u/BDzRAGVI3nLpQYdG1P9NIxzNGnJHu03Dfxlg1W
         sw2IZ5kow/X7cemRi+pO0wywtggPDekbzvPdLJJY2AB2Ky4KyWa9vxUvUWa/WTSX0RX7
         PzYM59353ovJ9HLXTGuJOj3kQr5yTR0fB0btcw57gUQWzsZMnhPnsnAvqq7lpLhYVuL3
         1K8w==
X-Forwarded-Encrypted: i=1; AJvYcCUnAhog4Lw7GXegf/sIDD2I4DcbA85JY1Kf29VJSOwLi8F6zqBae5YKnhB2JhYyCD3ZqixJ4rfRPfYMNfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPtZ/4GuPFKYs3j9ZKLsPHsHfTTY/IzHoI/wDVQ2cgO0mrJOBr
	B2uncUhUQnKZbY7f6ImaHev/frtSZYT1gX479eKmZooGAioO248DhXpdFSGQcfuWIxOSYv2IsMx
	S5q9eX/+ZtneikgXZsYriCFFV7DZaNTC/1FsUn4FumsTmj+XZbtEL61euy1DH9RI=
X-Gm-Gg: ASbGncvMBaT6lNsaDr5up19yKiL0fa2OMyKbu+A9+hseMQGJy1o5HRMEbI0qVAVEpQK
	QT+vwPj6nDTTZlxGh6B1JRBqJTWe+wmGBuv0DdwFwiiGdWSvgFiV6Ww7yKoedYmkQ0Qa2qj/jFb
	QwzPsgI7EckbGMQzG6cmyU3rq3b03XPV2tYlj+zLqj7iu6FvHr38Nm2VxOdylr8DuogOXlvMF8R
	5YfwUAE/cihHg4NEPuhR3rNg2B5Jc9fZ8peT8Vax6+QytP0SMw/jgtc3qTxrOn0Ax427xg4QXWX
	BTdNBqiNRfMohDSfwcU222+fqlGjXqOqLB4eR067yYltqyrkz+t5StMFBko=
X-Received: by 2002:ac8:7e95:0:b0:46e:12fc:6c83 with SMTP id d75a77b69052e-471a38cd930mr11392321cf.0.1739279261999;
        Tue, 11 Feb 2025 05:07:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf17TQcGeLggmbsVGrZz0dN+r0rFljR1fT9i8V4oZgVqeg6eTmzd49LgDFHMPdGNR01MCE3A==
X-Received: by 2002:ac8:7e95:0:b0:46e:12fc:6c83 with SMTP id d75a77b69052e-471a38cd930mr11392051cf.0.1739279261615;
        Tue, 11 Feb 2025 05:07:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de58404347sm7153814a12.9.2025.02.11.05.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:07:41 -0800 (PST)
Message-ID: <dad5bf75-d8ae-478e-8215-7d89db793dd7@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:07:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
 <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
 <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _W4z94OLU-CtRG4X4aoSWGGYmBE8CFiH
X-Proofpoint-GUID: _W4z94OLU-CtRG4X4aoSWGGYmBE8CFiH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502110086

On 11.02.2025 10:07 AM, Neil Armstrong wrote:
> On 10/02/2025 17:32, Konrad Dybcio wrote:
>> On 10.02.2025 10:32 AM, Neil Armstrong wrote:
>>> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
>>> add the missing cpu-cfg path to fix the dtbs check error.
>>>
>>> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
>>>                 power-domains = <&dispcc MDSS_GDSC>;
>>>   -            interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
>>> -            interconnect-names = "mdp0-mem";
>>> +            interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
>>
>> QCOM_ICC_TAG_ALWAYS
>>
>>> +                    <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
>>
>> QCOM_ICC_TAG_ACTIVE_ONLY
>>
>> w that
> 
> So it depends how it articulates with https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org/
> 
> I can rebase on top of it, it would be simpler, but then the Fixes tag won't work anymore.

The fixes tag is there for human eyes, autoselection for backports has
always been iffy with DT

Konrad
