Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE31DA23
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673305; cv=none; b=s35w7LINmKBGtrm3UJkC1greduaAL8s/d9FCMnEs8ubYkBs/puaj7riOPBFrnJVsH6hBGMKcrejmFpJ+RsbhmQa2hydpML6XxASHwNgYykIY+Ar9K5ZBb8vFNbK/Dhj2pEgTo/0STF11irqL1M05UcTN8y3zdU/88qTOFk0VAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673305; c=relaxed/simple;
	bh=eIeyqlTM7XajqirG2GsOm0mN2EPqcedROiQ84CPbzhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdKAHbVbSW81GEtDzjTxiNqYKXW4oA76tw4G+gYcT52OGFmMQ3fJadgRa4set/86znVYDkElqFnfZEv+tPj51eVjcaukGSfF+x49/H3jCqODbq+rMdf4xdQdwbkR51iJGZoMZgKO4RF3q6/iFT6LVD+tKEcQTwGL/ifkqEEdwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuaRtJ34; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuaRtJ34"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9QZFh015731
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PnyKX1fEcR6bJxd/pvho3kDJwhwkeyCLZI3+nIr4TFs=; b=WuaRtJ341nFVLWVF
	qEi25tLMfnDbbQWDZvBDnjAD/oeCWQHYZ27+sifMW1HhX4yVcpwoad2i8TxBZnWE
	zVNQl2cc+/OFzYYXJ7ZwKaeKIDgE3SCepFvgaZmEZckXyVA5QT40OOKrxZFcOIMn
	G8qFoqlvQl6ogmDf+UMgw/jAhKz27i5C8X9rVEeh+VX5PVnv7CfptJqYyEGB6YPc
	ljFYs/pX1ZtduDBMMnw8Cm01L5KHiUWeFZ7Tvb7RiJV9JN/NOVWqj2pIOvz6x+vO
	08w46rxAUlNPVpq0uOIp8qD1kSZFsYP5vdsiRpp0FgOdELsx9F4XRGX1o1Lo2UlY
	R5JL6A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5hbeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:08:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f539358795so4157636d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673302; x=1751278102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnyKX1fEcR6bJxd/pvho3kDJwhwkeyCLZI3+nIr4TFs=;
        b=nEG1dYPBay7mevKog89epjNq2qG9wdFySr23JRvCEdbhn3EWJwM26i3tuXKmtPtQ2l
         9qMFt7zpkY5bJRNOZ3Tvt4eEJMeAENGQqbPk+jSFW9YWSO+t3TEZb4kFQOWhA455z0oV
         rLRmRV2SZ5i3jGe7/eHlQayzZlxnGcpKkOmN/Ht0sEiXrYLnvxIUpD7X9d4a5Mz2zDEU
         +c34oWCbtTH12FlcjyJojiP+ppd21T1mUjjaBlmh/Y+07hZzst/xNVN4i11TkTZSdubW
         BypS6D9h5ACzALCfB0uorRUo5Ja8OCv/xOMf9NxLBAEZa1/FQLxnwGF0/xxLHLsNBxO4
         RPWA==
X-Forwarded-Encrypted: i=1; AJvYcCV3TP7FVVYao2UbjM19vUEUH6z3gC4vz0ixXJo42H2YQgE/gf1pIv4v7Wjma466wO4HZmbQzbPLSUBkRsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXKut/P+Ty9Tas7YUezqBdgRdFOHv9nbYpmqP45AhpWTI7Quse
	74uFKlPAT6eMas6Mg5udxFlWW8ehruXQiilTBYZuE4Vf2c0hgUOqC1EI5VPGPEfNQVaYAbhzeyh
	2inC7xiVnznhGvBrLwqLtLzW4KRgBqflRWhkwUB1IikXIcmYlufOzdETQS2zoqBxYkl4=
X-Gm-Gg: ASbGncuCyZsV9/e8arO9hb1LC8H7Wu6TGU5lnwMTKFOdoE5ElqMSSnb66kP1Pq+cVoQ
	kE5V+HxiC/atZyuxspvOCSqgHBbArXzBsB2NEoDcyslUD5o++RBBcqBrWXB2vUOo6aK0l4GHhI2
	sy4ziEvvTMBSabcI4iiRgmK2mEiYgSGiLKg4mYImI7TtUHgy7PdWHx2J9r5fcJCs44/MBPY47iC
	Fpe9fdfQ6Aj0CWea5wm3MCFWFX7HaD9nqifPXZ6mVSbGgxQfOWyifFVIMzAaRJf+sFnInlwB4wV
	hfV4MrWa+vpTi762O8ixg7VnralkvqBem55PVG1Suqd0tH25dPtzx/4s7KmP6+7hSwhmF9DPMuM
	QIMk=
X-Received: by 2002:a05:6214:2c13:b0:6fa:ba15:e86 with SMTP id 6a1803df08f44-6fd0a2fd7a7mr77471136d6.0.1750673301742;
        Mon, 23 Jun 2025 03:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS/1yCegb7N0aHHgiVh72Q6EJAth0MgnKHXXG+J9DtMg+J5O92x5oynT6QeF3XgvXxs2uA6A==
X-Received: by 2002:a05:6214:2c13:b0:6fa:ba15:e86 with SMTP id 6a1803df08f44-6fd0a2fd7a7mr77470986d6.0.1750673301349;
        Mon, 23 Jun 2025 03:08:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a61sm693438466b.106.2025.06.23.03.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:08:06 -0700 (PDT)
Message-ID: <b5d181d8-26bc-4855-a8df-ab352837e800@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:08:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Add video clock controller
 node
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ezNib9-7BlAJr9ENScoOyGsgQfEYZaSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MCBTYWx0ZWRfX39rS0mAFBQGl
 SLqe5flXQfTl0JNo24k4jjGEtNfcDe/KPkGxXyKutwkBXa9eQh/yZRvnWYleNzQomNfsa7a+pSI
 qNTTF1P36DIv59/YtT5X8kM7A8GiQDP8nu1RKqad+N2RiKVAZa8t7i4p0BVTCLUOH55X9451X4T
 lBOWT7tYfxK3N4MRKpJA5nJHVDCAO6zLC3VN26qQhQvNocK5Ck87iwIY3L4Hw02NMVd5qzSMo77
 O9M09R6aETLIxlITTKzXFgFV81NgPHbdUg6fEDoYLdk0NyIuLsrd3wblPsABfIGFi4rJCVAq2TU
 VHmecmhtc+kb9GbileoD23VMEYMzXPj5HMA6uqPNyGU7wPFz5EM3Dhoc2SfyvS40V9eX6yc4PKP
 e41Uh/Kh2hMHnuepDeg5BrjAtKVAo5MCoQ/DcdpQUzwHKVtZQ2Tl2wpXDIH0PMtStubVQ5oa
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68592797 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=970yK1cPiZu4FA_SsT4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ezNib9-7BlAJr9ENScoOyGsgQfEYZaSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230060

On 6/23/25 10:14 AM, Satya Priya Kakitapalli wrote:
> Add device node for video clock controller on Qualcomm
> SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
> Add device node for video clock controller on Qualcomm
> SC8180X platform.

Because you added this text under '---', it will not be included in
the commit log (and we want it to be there), please put the message
above your sign-off

> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> index b74ce3175d209b569e634073662307964158b340..4590c2ff68a9885d8047d728bbf2dea0236d5b8f 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
> +#include <dt-bindings/clock/qcom,videocc-sm8150.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sc8180x.h>
> @@ -2943,6 +2944,19 @@ usb_sec_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		videocc: clock-controller@ab00000 {
> +			compatible = "qcom,sm8150-videocc";

If the blocks are truly 1:1 shared, with no additional software changes
required, please still include a 8180-specific compatible in the front,
with a 8150 fallback:

"qcom,sc8180x-videocc", "qcom,sm8150-videocc"

which will require a dt-bindings update

Konrad
