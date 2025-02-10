Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6CB24394C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205146; cv=none; b=ruNDSrQEO4fjKpWURJDRsCg+b8d2Pj6Xr+lDR0TdgBQ+L9AAT98PDWTz6H0KDMAC9oWVVSCmsWyUmeF5Kt/o9k4cVcb3wyvxWeANCdD2v0D8YgJNgLSJolq0t2gVszw8jrYMDpMbeZbmZQU1s8WXdVpLJcQnYWrDeDQY/01o03Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205146; c=relaxed/simple;
	bh=3JiJns+OUPcfmrUNS7GyiLy03TpqRQlFAZ/nTjInXaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbxaoCNwGtCYoTWRGSPlmixRRHxwSpg5ff1MhhSAHVPaogLNXjdr7xCOC7usBGhpAZW1ZaFM2ntp3zMVIPxJiEV3SGhBtwNmyxB8H9GRpQyoUoDPYRtGcxMJLDAUdTe21VQ3qNmyRGPHeJ/nDfwPL4v6ev+JpHIkIRky5tyGPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cn0JoMwZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn0JoMwZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A8lRXe028752
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PllHdGFA8xSW0690rPMUrAEqzelfEIRuIJxgSYa+UlQ=; b=Cn0JoMwZEOyoPkef
	61kkoxfOO8ACryC6Dz0YVUUIuK/gbvwFhhTs6OuNOwazixlUJJCm+GW+Sgz4Bdev
	NI4OlSvfNmM0ilNyUagm/sBmSUnPrAb2ze7+t2hxVxFxsFLWp67rrppA5TtYa+aD
	5PwSa/SmbQLC67e45REnAoXtBBJnbXEXdLOMDqG2xYNI3I9pxn/ERV9iHyhF33yf
	qba+zQ/kZxr0L9AGSZw+SE8XImfJZ9wqxIHz0+dgB/B191xN9/fUGG/3dTC+9tVF
	zTjQcFrEL0y7wmafcq9tspH64NgPEzOok3vR9QuYI1kla+ullsQK0Hb1f3Ro0tYN
	uOaC9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxmy4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:32:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4719173db00so2300351cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205143; x=1739809943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PllHdGFA8xSW0690rPMUrAEqzelfEIRuIJxgSYa+UlQ=;
        b=Ngxa5M1B8UzHs/yU88B3873UwZxPQIZGyJ7fVJ7wkEJHRlRHgRGCYl5g5QUPMeud/l
         OOT2hlgW4L/49JNuh6wZ611SvKsSioOeXPhRNIlPD9+gMQLSvjjpfbbbVzBlaYS2WsHi
         ZKfF8yq5XXThtSWVohtU18Z+w7tb2RlLt8ovCqPT3zFVIU5OjX3MSTJumnMnPkEz1as8
         ouutNC0tKSkyz1XkDrsVp/J11FHIsiEOsNmFTvDiqLm/eT5f2DanLUejFRF8VkYl4G1i
         hAG04g3chRro0AZU1CYfs250BCR0Sis5TwDDTn/vx3yGmclPXEXxfXcnp0sK0Is36SnX
         bxjA==
X-Forwarded-Encrypted: i=1; AJvYcCXOFgudS107aEoWL58a7wG5a0V5k9E1EdTQLPkzXAW1QQkyYoRAfTFiQoFiBNb+DU77vnD1zHCrxZnqKTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUU7ez04o6jV6N6BFz37Yd2otADwCNga8GnniIxk0CeMrG2HAl
	ogGKlQNjOb/tWY5RAC5pK0kex2YC81GTnSWd7ZZTyEylnkL2/75liC9lvXShY0llQN0a6FIjBku
	hGSrTRL38gGDZ4sAgjc7Ewq3ulf5BEZTSPX7Q0clE5PluAJrzipYvLl+QmLl1K1U=
X-Gm-Gg: ASbGncsGYfN0aEpbMf3hEzY2vNtpCr/rHKb36nqhx60Zk0lFBdNEPVscUwJhG945xg4
	tD+/8XDBsi++DPhbsRLYVTlPEZBthWGm7LIxr3UuuYoXjw3TNxv6Xe2gOxDYqa9baBb12nQe3sa
	FlZIbnJhmiRsFr5rYXMvpYbfa6vtSk8l4IRIPtnE7zl8+guO+/mOpVLK5o1KJ/Yy2WmxHjkg//r
	0QDThc5AOcANjAtlKPZhC/faKxsuEOT5UZOKLK3KiajwBANxPXI9x4wiYhe5rrEkK3SyQPBpBQd
	cQDtSH9psll2OP74uMR6BlXXIflk0X7y+YJjiVkYjC/kCs5d0UD0v6WFDw8=
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id d75a77b69052e-4719a289dbfmr10935721cf.12.1739205143357;
        Mon, 10 Feb 2025 08:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5IbZNKFe36TXsRdBve9RfSnI6zfiiQRD265XZv9cUtcHZVy3F19fELt4eG6KVJYmaMFNtpQ==
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id d75a77b69052e-4719a289dbfmr10935441cf.12.1739205142905;
        Mon, 10 Feb 2025 08:32:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa21sm8114981a12.68.2025.02.10.08.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:32:22 -0800 (PST)
Message-ID: <1ffe8c68-3668-413a-a289-51a0b6bbc8ca@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:32:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h27WbPOkLyVty2O56kBmimxacRll7XfX
X-Proofpoint-ORIG-GUID: h27WbPOkLyVty2O56kBmimxacRll7XfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100136

On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.
> 
> Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
