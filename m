Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718A2566EB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214497; cv=none; b=V8gjok7UOuyfKxPxOG4UtfVpCWtE+6sCYOVrT3IFTCDHWtItoJkH60Q9EyIrG73YFv8itTvJFXpbz76y62BQjwVrtDioK6yHs6HrJa1lxk2qgFqhL0GXpvN/oPUid5SYd4/Xo23TWewFZcg/G+VDnI5gKplOoucTWyBB9K4DvFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214497; c=relaxed/simple;
	bh=lFnKDxv0G76ckjWRS+P/8GAJexYRrkQonD4dvIz4rsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MDTOm75NxLhVcuLtd67VZWgMuInLEtRxepra+6hIqzMVpFiQKRba2vz5esvDptDm0smkyjnEo9NNOZqbh3Da/VtuyiRGcgFNZedixd3t44t9JLh9A//kW9LYL+kS67K92oqJ/IvLlnoP7M5TyIA/8lcIOok0FXvGMcuOJFCW4EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYaDbhkU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYaDbhkU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AF22iI010515
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YVQummJi18RRKgEjlkYyDsqdubMOMEtbXT8Zzwa85WY=; b=VYaDbhkU6cOrLgdK
	E7YQfudcgTLtYUuZtxRlH+JgbjhIr6s2YXfK+wa4xvMm7Ekj6puxtRxyFHthgXS2
	Sh/vqarmP6RVZzqGXX5KBzkBVUieD5rY20p6VMuwrfcSSDJRuBxycJ7VrmwysKTg
	kXuqFUhlpPd6TFHfhCwAXrlTweUNO+sVxjqvykFh7T1fzGClxgCWoXtD7Ivt9R5N
	ooKUOLx7gLxrSi4jZgrkm3dfDPiWORT4vcx46mVxoyQCmX1YXPrUeQiaM5WECHdz
	Xk5vofl9gnoOF5p1LlXispgp2JZsRmp6Doiu73lpG2S5sq5gYzNKq9gRBbu145SV
	Gg0+RA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5a05e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:08:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47195dd8af0so2652241cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214494; x=1739819294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQummJi18RRKgEjlkYyDsqdubMOMEtbXT8Zzwa85WY=;
        b=tjXVwCq3FK4gSLJvPvCX9MiEIzVim/kx/Tez5jWFCRgNH3AMqKJfWY4MpvFDLT26Zr
         tIAj1OedfBgn5mtyG1SYp5hsqG0zAlEznpWgktgUigq3bSMG1m90X1PAjya2lESNsEVn
         OOUK2VRHUROSKZf74Mh4CTBCXbaT8b1UjK8NFiy1c5z2qSx2xz1W4ol1pG3uriOwh4Q4
         1OrwZ1X2nEqVoxalCGsdoEX2vdzLQ7KKuxnRDIpjS1ZQPnAWUY7Dv39nC8zgShgm1kjo
         AhNZGsgEIEWv1NAEv0W/92YgTeK/pisv/qdVvq7zgqHjJ6GLGTpW8cJcPTgb9sCw6oz2
         WOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6l/0Mmg4FGVIG/ft1fg3vuJElVGN8KIuASaj79s1s62fjFt31/pddTtoSkeKG5NIMkO7awwNAYiTMjlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3u3PyVMqgye2+eodiE7O7iXqSyqEtY23vrVp6QuxYVbRHJ68
	OM7w3WbgYk0ZUI5APB75d7CZ1PQE8se8hc10yQctrozC6phNA5Cvw7mt8vsMK66ZGRxNOcipsgB
	inSR+WIdQlV1qBUjR/Oabb1u2isslOaZM6+H8NfjdwFnl6B+8b5Qez+bSOo9ZrMUiL5ttsL8=
X-Gm-Gg: ASbGncvmzN2QL9zhJ16m8P76PimpDhejGf4zUE5znCWZiKYWhEDlWrr0SIBgoDqqFGM
	ftHJ0tlsuqOhuGg5n2jZwea4RdzYe8eVx6Z+J1se3dwnL+9Qoor0RnLAUP2bA0v1I3/fxU2RoJt
	wsMHnv7GZ+x7M6tjjMSs9+jmMbn58EJkycivDYnuKIuc+NYyX7rK5CPL7KSkvZPD3EuW/Uh1Nq8
	cp9za5BFbCorjDHcQlMb0bKipt/OPWmrfCg99foWpw1OsB093qOyvw9yT067xv3Z6U2YI7e1iol
	nbQEswbI6GencFJv9UXo5a4TfDSllB7L6Vm5wKVVkSEI4cq6j47lUcwEpfw=
X-Received: by 2002:a05:622a:2610:b0:471:8f79:c64 with SMTP id d75a77b69052e-4718f790f80mr35512331cf.7.1739214493729;
        Mon, 10 Feb 2025 11:08:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTkwXiEvT/05Lc0D0X5x0Q8wlm/2Tcq24SNR6B2wxGAwd40QntCphHd1k7lJawWB2GkgZxgQ==
X-Received: by 2002:a05:622a:2610:b0:471:8f79:c64 with SMTP id d75a77b69052e-4718f790f80mr35512131cf.7.1739214493361;
        Mon, 10 Feb 2025 11:08:13 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b43ee08asm381431866b.88.2025.02.10.11.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:08:12 -0800 (PST)
Message-ID: <63b3f08d-c7c5-4ba9-a74b-5a7e0b8e7eb1@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 20:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: ipq9574: Fix USB vdd info
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207073545.1768990-1-quic_varada@quicinc.com>
 <20250207073545.1768990-2-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207073545.1768990-2-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3AqsmiVuLJn-CIIs5gsoItM0z_ln06Du
X-Proofpoint-GUID: 3AqsmiVuLJn-CIIs5gsoItM0z_ln06Du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=793 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100154

On 7.02.2025 8:35 AM, Varadarajan Narayanan wrote:
> USB phys in ipq9574 use the 'L5' regulator. The commit ec4f047679d5
> ("arm64: dts: qcom: ipq9574: Enable USB") incorrectly specified it as
> 'L2'. Because of this when the phy module turns off/on its regulators,
> the wrong regulator is turned off/on resulting in 2 issues, namely the
> correct regulator related to the USB phy is not turned off/on and the
> module powered by the incorrect regulator is affected.
> 
> Fixes: ec4f047679d5 ("arm64: dts: qcom: ipq9574: Enable USB")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: * Reword the commit message
>     * Format to 72 chars
>     * No code change
> ---

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
