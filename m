Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA42BE7C7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929086; cv=none; b=I4mQ5CfHnGpP6OlkpIOgwDrRemuNcPfMfckt3ybj4P9JgpSEc2Vh3nMbWdO0VoiNV7U/sBDXA4daEf+zyGEStv+hWeJBUPmD1OvLrmgaUtsfp54DVPRaI59oV+GB0cL3DMWUw91GlQRhMxwmgZUAbiZPH+KH4A0x9zDohY0VrqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929086; c=relaxed/simple;
	bh=rEgtSqyYGjLOGamhHSrB0660Ic+9Hk1A+1wd/gOqKu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXlTN6LuVDE9H70vu99VMfPdZEOda9gWq27qcISL9j64Hor55yWR9E+k4bEHphFOJXudxiP6NaQRyUOWF1ihrtHxjHx2C/aXz4zxTZ23K3jVuOg/HpeKNxG6DPPzPmojj+P6nzhAc7X4aeWCqUoOuDtLBozndVLnjj4jKRVndfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aanI6jYB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aanI6jYB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA279W005256
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e34M8RUkxHX3ws0JPzoX/H5U
	B4Agn3FBLku0jSx4igY=; b=aanI6jYBt8EC9S2b9Rmv4trvbYfnQ8IKgLNvo4ss
	VTNzVOm3WsusRPVDLai/TsjZUbJPZSIAc0lF/d9DRQ6U0pfUWjkWpXw7eyc+lQOs
	A5qg91RLSrvVw77sVsDLMnJjtRDoYMHFPWT2CrsCE5/13hA0o92PhkULEuz9zCs0
	O7TNforikqZe7ogjdpnqzXodDrU6Sbp9NeestSmyOm3FpaJiTUNR/cr5v3CJ5/Fd
	rj0Xup6IgHNSj3b2z3rhbUSo9vF4zeYF/dUtmkgLCRmx5YTN+VXTQp073CDdXHzy
	GdUJFVc+wlop4zVdMu3wVssBKCa7eX3W32i0SYGMiWDqFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbbf1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:18:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so956013385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929082; x=1746533882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e34M8RUkxHX3ws0JPzoX/H5UB4Agn3FBLku0jSx4igY=;
        b=Q/d1CqKfcSzImW/LVCfygmS4mtbJtEM4tjQetU4v55T2dJI/7fX0vwEAbti8g/Nc9r
         DvH7ZfMk6ODIJCHBUHtZ6niel+qR54EcEIE0/RubtNEGXjJEnuDoK206EyqYNWiHLC+O
         kcXKrxoINkU68VomWtfAUVkAptqT98MY1aJ1K4R3lKzlAUH2KlqzJEXO3C/X4LQ6CA4E
         e4Vjsa/UKhhSdXnh8TiaNNXAa6tihUsh1Rfk45fE7Ja4yWp6BcwqKZouIUfFsXb3XCSi
         yQrZgfQj4P4DKbptuc6mq/AOkJv3rY9dRoClvrw9Y3k4aDINhcjIvwNM9IXuL+dhNsrj
         nrLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg2HMJNu+/PTVPt+D+0+RlQaGxrv/BcReZinu1GVApW5Ft66QBn7LIhheixrPcFuay7KdhD78rdjEzaFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNhjL6WhmdOQ+Mi+ZqV0gwc6PJ81b1xZ2PiNGoyzh2qb3VHPk
	gFHbvykzVgnxlVe+OnjTH6KLxpVrfv/7kMlrjtofnZFOtbWq8+yp+Zn9HHPMf04l7Hei0MaYHxV
	tIR6AvTOV2ulwCEW8MaNFbThDFTNoZeI6xbb+IKCvUQ/nHu1rCDmtYbNiDKJPHjE=
X-Gm-Gg: ASbGncvUKZBzuCnbrAbBHLKIoEenjvYfCTjzCgO5gPTqJNr1YpDzIGn+p+YP0lRmIMS
	I423blia8SEx3Q8tYGhIqYU05o61vYLHP3tl2lOQ64T1Njo1HhBpaFLyEl3Uo15WGIzW6qz8G1r
	j+IKtDlwsBVB5rvzf4YFqW+LzFP0ktmL8wMVUiRGmR5JlaX1pzjbE6g7EDstaQbQjur8tvA6EyB
	zEBACTu5dwqsG8pbsjvTQXvX16x2FC+fOi01meL/b7tSDHYIDtWaYeDa57bowkojWjDhEs6gXdx
	pwONmTRULvRfvjjBlsO53Ic7+NMr7VP2b6TC+7FIwTINEGqRkh8YpHmX5ZJ+xaM6j7YmXaB4RUg
	=
X-Received: by 2002:a05:620a:439f:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7cabdd88f8dmr580838385a.23.1745929082257;
        Tue, 29 Apr 2025 05:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKRgwJxnGPEi9AE9oxOgdj1eQEXEoG3oreJuhRujKZK92EugDebdPi02MSh4UZF+o36uxLQ==
X-Received: by 2002:a05:620a:439f:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7cabdd88f8dmr580835285a.23.1745929081954;
        Tue, 29 Apr 2025 05:18:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31a0127be7dsm15268801fa.106.2025.04.29.05.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:18:01 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:17:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
Message-ID: <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
 <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfX+e9phnT7cfVY rY1b6FinZ9fsoCu3vhwaodhZL8qUsoLQCvhF+fJCi0P+zp+gwi1KpJBIGuQKK5b2Z/fLrte6AhQ 2W+6jF/H9QLd4q9GCxZ3ymqGS1Ev191Y56YmvDJ2DvbIyyLCENa8Yy1WKZfBcp47NmRagE7I93+
 gHq2j1OyTC5EhRgkyN/3mNYyPRY6IUUC+4WxyWUzy63l2uNNwbjT8qCcwvggLQ4F9mAN+r5OMS4 qZfA3KX73lv8RTRUHCuKo2sDvQb40Xwo9MQzh9teI7Y4B7VtkbrizB+FGV00Gc/WDFfyF8ES66a kqRbhzv5yLaxQ1Bi9bDo+eV0UD7opJyby+zm3f3FpoKzxsjrfgoi+4SmHckF7q+eHxXfORbuHgS
 vJDUjDskpp6oWiHOXOIWTY0wBdf6uNndjSsDfIjgzTq76aRayc2l0kWsSic0+DyW3yaftYsc
X-Proofpoint-GUID: 1RIMsLv0sh8zJJjpmH5UD9ItE9QUbdTO
X-Proofpoint-ORIG-GUID: 1RIMsLv0sh8zJJjpmH5UD9ItE9QUbdTO
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=6810c37b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=AUxwy3R0h1HAuY9YvekA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=622 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091

On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> > On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
> >> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
> >>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>
> >>> Add gpu and gmu nodes for qcs8300 chipset.
> >>>
> >>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		gmu: gmu@3d6a000 {
> >>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
> >>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> >>
> >> size = 0x26000 so that it doesn't leak into GPU_CC
> > 
> > We dump GPUCC regs into snapshot!
> 
> Right, that's bad.. the dt heuristics are such that each region
> is mapped by a single device that it belongs to, with some rare
> exceptions..

It has been like this for most (all?) GMU / GPUCC generations.

> 
> Instead, the moderately dirty way would be to expose gpucc as
> syscon & pass it to the GPU device, or the clean way would be
> to implement an API within the clock framework that would dump
> the relevant registers
> 
> Konrad

-- 
With best wishes
Dmitry
