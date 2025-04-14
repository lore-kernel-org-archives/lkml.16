Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DBE2E3396
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637082; cv=none; b=Olsscm2Gcz/f3ySxaxIdqIFAEV8fypUHJGDiBTnVJuBwRyr2Zf+ZvkQ173xIksbLKtLZRnvlVq717uUFOnLEORpavNsc/YkKDlKbBMhZwBApdUYcem0y61YnUKymJLIl4t+UB2ybeSzo1zG98yfstDhOmobVlKvfrWtzYQf8h80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637082; c=relaxed/simple;
	bh=aY/1fKbaFYeuZIqGliNdGJUKlTqEKs5abT4Ep+BqkFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUtIlM49VsLkSmt/q3d99t0oc/RUrhR79gvzQXuBDvA2UrB85HuLJspHBctn4+E6Z+jSTn1tJqqUAM/5PftWJRcVONfsB0fb0jdj7gKHo2dQdrSMJS05wVnYkJ7vHiHLeTfwR7jFL+ntEsol4Ugd6J+twzFS1BUwgfYyPkHiLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnckoJTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnckoJTp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99o70031333
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	02Rkx6hdb4JQY/Ijn44NbhfuIINmFhZjL7KXmSEDk+I=; b=jnckoJTpdLjpb92R
	JFE6CQZuFy5FrMok02UFOGe39o5eHr/O4vdLekD86iTaGixkr3UAupYSa7X+ko4X
	kS935FECRVHxhGRohZ/cHpad1IENgbI+CoIICMwj9LlyqNV+HigOZ7d2pkOphFhS
	6cEyipqXxZIej1AF1jZIxlScxe64BQARe57PZZsLOW1pauEsDca+OWWMprT1xo8P
	WbtOQcrAraALT5jVU1cV6lV1ocOaGwxc4xSPmGTVyQUEr0LDw0OaQ98yGO3WlTwI
	kdgogWcGA3UMAco8EXt4V5fu2AWKJnBkP+DXkF6dkDD8ES/KhTHRpPSkOMVH/WCL
	I3v/RQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjvjaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:24:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5841ae28eso100784185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744637079; x=1745241879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02Rkx6hdb4JQY/Ijn44NbhfuIINmFhZjL7KXmSEDk+I=;
        b=qL1xngB1zB+qZcYb5fmGYZDZ4FJuYt9a8arW/txFQ4hGz6Wydfv1h8L9c+PPwPXbvB
         LQnRpnL6Hg2XoOmAna0OAkmRQHTtpw873OzQTVKcXguqrT74POkR7Dz8rmyba903EGTd
         d/qY/H49ct9YALreDjzn+uxtjWOKaUHQsMDMLAv4W5GSbCK4c9i/hzKEGQiV+ecLE/d2
         N4sxj07B2lponhgliyrlwFZdOvrCoqgXswWpFyiQI+EsteLMJUUFsCEyPVjy1CVJ22LF
         3FxeUTpyan+NUyFXCIxHXLGMD5x5hygBGuv4Sjhf/Ls/uqQxC4S/1/xvNhUNbJ7iBF+p
         kJUA==
X-Forwarded-Encrypted: i=1; AJvYcCX19Tiz+X8wKUMhWcH7jG1EIJdnprMvVjurdqAP92oxOZP5ov9j5nQ0/QjvzedLCIDQq2C05M+/6Xy3rIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhIcfrrXKHDum18zh1Spv4jBkA8cFBHCpaLtDgSFyAv/gzaF6Q
	9UuBDVEutgAl+LYbcfEOqLZXFuy4XkvfZSQpKUSUDc3i5z20CxTjOxMCpDP22dyyjWSrjW7q7JZ
	cWbmKBknXS0BM6o+8Hr5vdcpaIbqGAcSnhbiYVU5cWqmhn5LUZMigvsOewT+YkA0h1e6h+so=
X-Gm-Gg: ASbGncs5VLn54nOqXFxQtyu7JqVVXiEUaVUazvH5qF8bEstGR8cfrs96kLEnNEPrUbQ
	1EfsMqJzecxb8vJCvpFkgll7hdHiatDm9FhgCIEUvUFOz62MZCaUkSi6/iA+xrInT+NSp3dtsYs
	45cFE8l7olA7YSejSC8IYKBwSWoNB50kCqQdDdOrpIIqxaCDkQGhkBRFnOEa5L/pEv3q3NqbQRP
	uLRnQbBwamzjbS7KsgKHj1QW4w4va/BRAVSCLgpC67NzUhs13MjMT+BOCGW4ZDqm555PvQpPrIj
	qbp6zUwMSsFB9QsnYejyFT2y0jir2gman3w7xvnunQ/CjEKt0kAE/krcVfVG2g7Jng==
X-Received: by 2002:a05:620a:45a4:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c7b1ae7e0bmr568800285a.11.1744637079158;
        Mon, 14 Apr 2025 06:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRa/QUfGBb0tF7zkWM/E/7q8wcm5etsdwSv+/cstcR8oAuNHxCD10hAM4FInQktT2x4+YUZw==
X-Received: by 2002:a05:620a:45a4:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c7b1ae7e0bmr568798885a.11.1744637078599;
        Mon, 14 Apr 2025 06:24:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be8d0esm896745566b.43.2025.04.14.06.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:24:38 -0700 (PDT)
Message-ID: <1b783592-e59a-4e85-b727-d38b11411a9c@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:24:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] soc: qcom: llcc-qcom: Add support for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
 <20250324-sm8750_llcc_master-v3-3-2afd5c0fdbde@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250324-sm8750_llcc_master-v3-3-2afd5c0fdbde@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fd0c98 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=qAG6vWTBVeFq7agocEUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HdbPypEzZHtIYUl66UaQV3Pyfvw-FDi9
X-Proofpoint-ORIG-GUID: HdbPypEzZHtIYUl66UaQV3Pyfvw-FDi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=869 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140097

On 3/24/25 9:29 PM, Melody Olvera wrote:
> Add system cache table and configs for SM8750 SoCs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +		.usecase_id = LLCC_WRCACHE,
> +		.slice_id = 31,
> +		.max_cap = 512,
> +		.priority = 1,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,

This should still be .activate_on_init = true

otherwise lgtm

Konrad
