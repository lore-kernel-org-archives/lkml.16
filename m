Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCA217657
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323761; cv=none; b=cpoJIwawH/lhdnxkD1Py5axYV3G4MfCjsoEZMmCrQO0r73HzzAOUKzWRtTUzP0XNRjwuWZ126DntNAtRmFVF74r5q5Uel4C8QLcjP6ay0Ycrv9DuUk47rwmpsMvmAhTCYQRgmBRqDQVM96A3XpG+LcprJIyR3HgZyG948xKQgTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323761; c=relaxed/simple;
	bh=FEo6NTHasI2BR0LBYbvtpmuoiyrBx+Jq0hbw9nffhCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+XrexzFuRREJ4SIZw2b/jrZXTTJvKP6KKL4clgkGsNdROF61afMpiPRPSR2l8m6HeRZNSh9+5+dlUoJ0zdDiawHsvUTRV4rEcMQweg2wGc96BcmAKifUfN1EDWsc26WCy/XYkMWjpaWEw5pmKf/GMWpDhqr9WX5yGno1MlLlH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYXiuIxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYXiuIxb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDUF024326
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Gp+EaaMTwpM0ikpSFqefh88Lpc/kVGRVyoOOkW3KS4=; b=HYXiuIxbWR1kRIEa
	0J9gPCpFT7y5dr+Jyw6qlYLYMpIcz0wChUrH3sZ+YOaA+yBP0dEx+8btwj/aOGln
	KZM5l2lQeCFtIbvL3Yin+n1yh1GXkWDM1C65Rqc9XW/B9nN6jNHwNakbCjBUBG3D
	vyL6t1OwLl0xOgexGtOj8Kn7y5fSYmbwQStjxJ4td91LDD7qot5KVb9LUu7wkv5H
	KFq/a+tiO93am4fysiDbewBBMkDhLCdWhjYzFzakj/lm0lj6qkgEyoVAmRw0hTQo
	N5ixLMExmiw0L6rxjlWWVz17AwoeFgKUV23aDeqY6Yr9O1P4uiPKfLzN8cGVD6H0
	C90h7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmxvag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8aab0a94cso1377376d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323756; x=1747928556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gp+EaaMTwpM0ikpSFqefh88Lpc/kVGRVyoOOkW3KS4=;
        b=Z0exIU0OcQulRarPgTLRVlXhw/R/iGeJXdW1AvtJ084jnnWBouppM8iesxEO4cz0mp
         kzrs23ZqVE8oVfS6AKBh4ui3qIAIb8pAMAVm5IlLnL7Fj9l3qHS6bY8nblAyHEzXvVYd
         dXqgU0KvCIHNZgOMIUvteUip0ygAb5OmK1z5yM0ZYY88jLLIT67pVXcN307FUC3GWog9
         GgL7NuYiQaSy2rx0YjDC51ww9DNSD6TzBTSdMlTAAZUWV8sakpTVf82ZkzJNtZOaVmk7
         Qw+8/8RUAdiu6QZNjkkBeOk5c40a4I7ZoYI0RI098h4iBzTdZx0Dq0eq5q6mNvyJKJFt
         wTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwe1rsxMCp27FGFZ7Cmm8NRC3/Azq1yncUWIwN7dI1Pv5SS6z/txCg2hflAN7MdazcdCcjbSSAmvfY4lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdoYHVpIbmn5J8QljT8maa1j6PdFGx6svBJ51eYRkMKJLwwl0n
	+G30pLex5BT6oPtqK6woWsd7NEb9FCXYiesq4BJYaxWpygAkLlcL61LpNXUpaXxKaewtRZAZqU2
	eewyHCkc+ERq8VFZMxDb0x5Lk6rhrBaUTbkdfuTRTezKFe9DeLYZsNkCyfdRLn2mStHE=
X-Gm-Gg: ASbGncvhKF1IrCnzDoMhNY3zJS+AM384RArh22K/FQNOHON+88or5+fB30afILm4M84
	sY3nVqHBHN46loEiD9PwOWjstUwoq3EqR/eqWJubpnJZ4c6eKzo3cbs3w7+GxU9YHZMMEDi71vy
	WWd94NnSH9A3ZeU23MSs3fpeQVR/4uKZwpA1GPXa4phfcCthwE+VAHcHTaJseqZjFZ+O+B6p1Jk
	yjyqxt6z26QpktJOJytbEca2V531a6Am3kbV5DsF8tRENh5bM/ZK08NwjdivBacUVDSH5lULPAL
	WJyIdlGC6LvYksL6D4xkETUxzpZxTPDMfp3I43bQ8s0a/RXvoGrbICnX42IAW4MU6g==
X-Received: by 2002:a05:6214:2602:b0:6f5:4711:2987 with SMTP id 6a1803df08f44-6f8b082862amr1258306d6.1.1747323756485;
        Thu, 15 May 2025 08:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHycrvO/sWsH1BFm3roYJt54oQuAdB4SWzNxmk0MLSaYCohDOB0eaQ5GpCEYDaltbZ1ZS+nSA==
X-Received: by 2002:a05:6214:2602:b0:6f5:4711:2987 with SMTP id 6a1803df08f44-6f8b082862amr1258156d6.1.1747323756110;
        Thu, 15 May 2025 08:42:36 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm7133266b.10.2025.05.15.08.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:35 -0700 (PDT)
Message-ID: <19d32dfb-9842-4d5f-b9ee-cd5926e52751@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-13-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-13-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rkiSyx6Jx-c3OBZLThLD2r-U_aQ9W_bu
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68260b6e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pq9-8jp3JCCm2Y5_lFoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rkiSyx6Jx-c3OBZLThLD2r-U_aQ9W_bu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX+FYj8UKK8CKI
 dcpEJdG98rcl3D5OVMLLZH3q1REGZPCcIq2b6S1ObQR2noaWmFF2mQU3mqePKwqjcMDulezF064
 rRLgEO+oMu80ecDtMTi2VZaGWDPbyspcCFGcH1Utve92VzaNGqFx0vrtAkgsYGCgcoZwgr2ECiq
 L2RONnp2gw6h5qWA24qIaAXtY0UfpAT4grqC5exFe1l9O5GNufgC6cVbMZJrnhdKnHG9AAZ+G1R
 E3v7DVEXcDwC0q6HiuUrHP2UyAZ/VymtIl6kLDGih9Za4OJyk7J1jaUOCqv7jZoP2OMYuPQCYm6
 8TzEfsq1ttnkpMqeOqFoTmx/BcUTBB3apcQKr1i5lfRYnofaDIde06N8WoBU1P5W2OVDmCY30EU
 pqfuBlS/0vazwK98u070lerMpso2NMxX2uTPmdqL9xmHBP2roy2j0i319GKBi7C1VT5jSH35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=727 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8450 platform. Hence add MXC power domain to videocc
> node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
