Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB43E1FC0F3
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747505797; cv=none; b=DHjX6nQFpvzoFsJyCfCp4Xk8gNYVChPGcVBp4p1kROq/LftKxLFyDR8Ssw7qcvgLCVcCvX95AVzk3B7b7P+tsQ5ULVHQEV8tDIVJ0kDr/iWJ3T+5608zFgHleOHslRy8Dy4UhwEi4W0n6gIKacbrxatyqqXyxK9bzeT8B5hcQOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747505797; c=relaxed/simple;
	bh=M4m17yyuXbBVV9nswjASUOSO+8084mzbcNw1wJdCEDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpRX3hclwH+JO3SKXEkOJA0th8hyPupgsI3JHG9Zr0Lk9Fsmdnia/9pOb9oX9/W6g5sC2FGEqHDlhs4ysK2xR6I+0Yh5X+3yrGA9dLxYbRWf3e9kiSCTOAFY4iGsfDtDfxda383i1JQhiqH9WGcX+bfr9RohllxnMenQwiIADm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeklBNUO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeklBNUO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HCGDA1001057
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 18:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnBJCA42Fcz95KKCL7XfwOVPDCEaWi9lJaJ6xnj8QNE=; b=MeklBNUOJk+gzfaT
	wZOEtq9X+JzyiZ2sdefk+IEyy0yww3R5/vMXagzzRsh7QTuyzqDatRKqR9YEPWfw
	yX2Yiw9p/4k/pMGfKyXZHeAs6n9oQ+C4ubruy/bCBIZhQupUnTv2FdnELWCw9u7T
	w+LacuW1M0vCQ7mXsPs5cU3nVFiRrs/9GWFb28YnuSbRodLkdLh+ifSECm5K3f9T
	JEnVDzn63WgmHtuyjd586e2v+x076w1uTF+KqacytWqfxHiHPhdKYV4AR7Jmzifr
	UwT2qEJKbDAX52lR6J7xwo48TkrPkQV+SCuEGN1P0V4cWKPdcwf5xzdRPYuQVzT4
	i7Hspw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcs03r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 18:16:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8c263ba30so2342786d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 11:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747505792; x=1748110592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnBJCA42Fcz95KKCL7XfwOVPDCEaWi9lJaJ6xnj8QNE=;
        b=PB/C1B9uTOUhlN69MyzxWj1c+pIFu4Xw7S8cCxn9UcO/I77Fycr/9uzXSBphgtSej+
         2M1XB6nuyzEwkEzs/oYDwgc3M9ZGq2FXvXfYE8TQJAvMyy0ugiWtYb9ffEVx22C7gPIL
         iHhpl0R5WEXSUBboya4Ug8OsQtdFJXYJg3/bZ4oUJXB/n/mlkjmXcBM9f3cXJbSsUaLZ
         56ZQhK3zl0Kb7bgoAHW7zsQPWK3ls3gK5dX1EouqC7Yj0VUpKRMtXPC5aGuFs9qOAejw
         ViITQqBdeWv0oUR//A2jMF5vPHZm4U61OBRA3cOoXC5qPOcB6fNR7nJaT8VtnZegFXhR
         BFag==
X-Gm-Message-State: AOJu0YzCDJpnc6OyjcR/e1B98ijhg0IPh5Kaj5CEDKeEaKbWUdEwpk8+
	C7yCj9jGzFv90qxE0zdGUhqkvJfe5Agr1ATHSoUBVQOpKY88IuYL1PAPL/ZlyQsekiqk5jpUCg1
	q0lqpP1khpBN2pGZA+BDjnKyeZCFZATj2TwWJq4+vpFF4xLKffOsrn8KGI2eqH1WuvwCl/wifwn
	U=
X-Gm-Gg: ASbGnctrZis9ibMmdTljG9bxy9Yc9MGq6aJJM6GwbFIjiXCUUaVxB3RWkO76c9EFMf5
	4JJoA3nkX5H2NajsX/9AJqxthQmy1zultNLZbxJYpZ5yGHqBZSQiJgu5CsxnmNhzLobs9M0CSeW
	P86LA/1504sPtHJaayKrF5Of+UQNUn1pzmeJ2GlqgsjQO79JdkPURzE7G5MkKyrl2T5xjSjogJa
	XxCwrZoypZawl2ycKSotYbFroSBeNO1lnhHRzBViaow4XnGQm71lD7/MK96SRK52cz2et5BiSOg
	eQ+rTaFgy9sA1ei9igX3Ne19X2inETgaR3NBxeRSUZNnCcy1V9Rn6l0MYZ7cqP9shg==
X-Received: by 2002:a05:6214:e66:b0:6f8:c773:367 with SMTP id 6a1803df08f44-6f8c773156emr16307626d6.10.1747505792212;
        Sat, 17 May 2025 11:16:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPPQtbYciftNueP6WNh9ccRSDo+w+J7+XKx+nyCa4V5rw6SiuDQB/u7qA1Xq3T2ePW05WFQw==
X-Received: by 2002:a05:6214:e66:b0:6f8:c773:367 with SMTP id 6a1803df08f44-6f8c773156emr16307526d6.10.1747505791887;
        Sat, 17 May 2025 11:16:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fe5sm324919266b.111.2025.05.17.11.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 11:16:31 -0700 (PDT)
Message-ID: <8e900d20-009b-4cc7-ba1d-52582e414402@oss.qualcomm.com>
Date: Sat, 17 May 2025 20:16:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 SA8775P
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
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kaDcy3j3065bi563K2ODTCaw7-iJBLkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE3OSBTYWx0ZWRfXzUPUDG18JA1j
 B/f81fw772XiDS5ijzof2I4dYztjWlqXU6G6mNHEYjB3/XKoySaW65pN7DPbOscX3WEwhUZiDVQ
 EgHW4WUrD2SotlHmaOINohKjjL6pPZGcdd5qfgJjgP7KvpFPrO54Oc+LYF07e0Lqr+MQWDB1jbs
 GWwZHDTEsEK7vAZ1MUTL3zyDE8264YhYB37SGct7Gg6ksCwfit1IyQg6GFjmi+SPjOhvxNzzaAs
 aEO+Y38RyolBB6KKB0h4drAYbT71csbJhqDoLg3XVNMqf9rTcITCFXPe+FLn0n51JFFw1DbIVYr
 52p81c//Ugziz8C5VY9W/zAFrDQe0fAo4P858LFhfV0LlUf/8BdEX485N0f9cHSIo8hsJUL7+26
 /QaIwqL4bUqoV4ZZnITJyxYKyKj5Ef2/D4Za+8RjYxSWd3Yog+HGI6Qcfg/0WUUbSGln6f8J
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6828d281 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=9rkGdShBa9mjovGmxRoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: kaDcy3j3065bi563K2ODTCaw7-iJBLkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=535 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170179

On 5/14/25 1:37 PM, Mrinmay Sarkar wrote:
> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> 
> Make changes to update the PHY settings to align with the latest
> PCIe PHY Hardware Programming Guide for both PCIe controllers
> on the SA8775P platform.
> 
> Add the ln_shrd region for SA8775P, incorporating new register
> writes as specified in the updated Hardware Programming Guide.
> 
> Update pcs table for QCS8300, since both QCS8300 and SA8775P are
> closely related and share same pcs settings.
> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---

So I took a closer look and please re-validate the changes, I
checked one write randomly and it turned out to be inconsistent

[...]


> -	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
> -	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x03),

^ this should be 0x0a according to reference v1.19 for RC mode

Konrad
