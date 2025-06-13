Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1250E2E62C0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823522; cv=none; b=DMP0ZtEKOFRR+8nnLx6UrZC0SLJbewMfJekQDGVr9mJ6BOJI7ZiwXUYcVS8PmGrheBBz0k54JuhJ+IZyAUpBdN7GXkW67TAK1J4vPbE1Thy3uJjuzwCGrGzBS4iSa8vidSlzoFB3KEfeV0hgQd1vDLqso1rHE4py+ExpMRGNg64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823522; c=relaxed/simple;
	bh=WiPNgNnihh2S+/7TTHFaJMjiKhGGv6OSW5UWdjeBRiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBPxJkX7P5INCtJ4C4BSXxcS+GrXKiX2RLqVzcRpiY5fU/2MKgLbjZoY81INW9CxHY5Tu69k/oXOfcgE8f+FzzztsWkW9l+XkEa+YjxSKWo+cYzkq03d3myThZbg0Xtxo+8urQeobZiJ6UNQSsjk9b6n1Y31RZ+qUL7Eegj93XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DihtPqmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DihtPqmI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DAQk1t000673
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=; b=DihtPqmIpiFvuGhA
	StkWJqw1wzFY7E9AxU9jY/rNqYKAa/Q710ybRmEMn0gOAE2A0DfLnM480/j6KwYs
	kR4prcYBOTBKM7Py2RvPZFszqlcxpnHUS55o4pvSsW3zJttlPB1OseSN/e8tGLCd
	7Q85dAKVtqzsWgDsW3dzjKTH6pK0ZijRB5/75VcKnu8tunbXXK+HDg3tY/NJbwcH
	lVuzpMUm+4zo6/vljkgAgWKlaPk0N1g/Og+AO3xsohl9DWNjg34loiE0jjl5VtI1
	623rG3pHXJXqsxYFkWUPhP6lQwT92Szg6SW1lY9iV6bSvwntZrbOuMSUdUbZ1mKG
	LQjtsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdww6fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:05:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d15c975968so361776685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823519; x=1750428319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=;
        b=uj5GkGN67bXOtN4h+aETSrO1dhO2EAWBvA+6OzhotHVdxmJNZtHWJNIMqDbaClyAib
         EYvkkhhcmwZb+8F6d9LgLM2P1KbbQ+qTg1pJhQD8AQn4XA6wlGKlMW7qJg7JL3DBmkUL
         L8dQmbBC364TNX4wLIvKrV5AuoBJAKz1ymGCPQniRnA8QFPMDqB4RaVAHxgD4q1WIcuu
         1/KP2Xu1cAMwfixtbluoB6K0Oy8QzA2hIHzeiESumRJvIC8fiDne3lrlj1qguigUxy3a
         5ts9ydkBEJos9rmLfXjs0RSrhsU5wrw+ItMTGbksFio22pfMiDGQoSe1zSEpt9zVlBYu
         1VUg==
X-Forwarded-Encrypted: i=1; AJvYcCXSddmKOYaWL/SMjeFWbE1PwE/OIw5RZpHiC53ODjaQR+btIr7AtadnnkVTEbI34+IWSFYehXhT3h7cz5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyENTeL7yunhzVdgnzSLkfXHEK66nUOf5c1QHtobyJMXfQneDr3
	OkLALaWPnC5sd81dZ4WnkIixHPUbGWkwIjTlJ0yGlyF8g/2tI3lRaeMGkvz4HSyA3nVZcdpfNjR
	JH/Ka7oA/j5dmiKl9exJXaPHwJrD0kEz9RXqisvLeIOkn/krJWbKfK1K4f61GWKX2T9zdMtqyK+
	k=
X-Gm-Gg: ASbGnctdTi+r+E6Kd8cCEXMf/9N9pH8X6D2LG2gq2GJT6nnJN+5BZ8k1eb18mun0YAb
	+0XfBKDYKcWmrqk0K2ClknuQf5+OJyLLQTmzz6Yhgt4NA8x0YNCAZ6jSRBygtPflJ+xEBXnvpJD
	ANRMaEY3pOktuIAKy9A5ZrKl9xnKhlCUSbPrNNqvmP0KzxDAW272geNGNOKyyIlbGfLXBy+i//V
	J/EOyFLswzHXB/kozUy0tfaFUSAZCwTb80Vrj/Hg6bUP4I8SW4r8r64IGBlVsFdpnbgGDqPnXGu
	H7zfdZ7f2As5FH0q30pF9H+tDrhDUy4iVk4kzC+NdctcOB+JlhRki1hTsTbnogMNr2wibhs=
X-Received: by 2002:a67:e709:0:b0:4e6:f7e9:c481 with SMTP id ada2fe7eead31-4e7e3853f56mr2565154137.7.1749823507774;
        Fri, 13 Jun 2025 07:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAabxiuRoQe/YqtbK2biWXOJsRJMOrPMmyOlfhlU9BuJsNPdIIiFtgHaougk+e0AABz+4dYg==
X-Received: by 2002:a05:6102:3ed4:b0:4e7:b8ca:e3bc with SMTP id ada2fe7eead31-4e7e39d8cbamr2083763137.17.1749823491378;
        Fri, 13 Jun 2025 07:04:51 -0700 (PDT)
Received: from [10.161.140.61] (87-95-85-22.bb.dnainternet.fi. [87.95.85.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac120167sm456434e87.20.2025.06.13.07.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:04:50 -0700 (PDT)
Message-ID: <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 17:04:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX63EdUsVMSYbq
 LtByKYw3piT/Meh6Ug6m5gjThgf8a9n5GXrHPBALEAwKUbLbsUWLpggFIF6TdERRVKRn70B9MxL
 gFuHysAZAbLTjhLUxtOoZlpIdpwD+eq0z2pBc3ArVkVpbiU6eVY1ZJ8P5PME2rE4m87ZFewPVv9
 FuDupwpqrVjMfYrWN/KFRkRml/SI+5YltsnYsIKgzLi1D2169d2dZoX1amnwvqt6F02+5hrHTP+
 p0PXooi/vj1jV7TRPlxzx3h0ROEqtgZuAXridWJlgJzOhOYrKygKWkFFCqh+nnj4sLmXdhzXGf5
 Rtoy4UVYz3gclhANB69xL+FPenqyzycjC0KHMso03/SukwwRm1GQl5ng1um0ID9wGQiDnXgvwxF
 Jle6x1uTp352eSUCEHB67XtDLo5ga2Uvw0L6oWolteUfvFiatYB0ZMIV8ZpE5k3CROzXfHIk
X-Proofpoint-ORIG-GUID: isGFsXqTwVN57xl0BBJq_WatE-MxP8qn
X-Proofpoint-GUID: isGFsXqTwVN57xl0BBJq_WatE-MxP8qn
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684c301f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=E+pfOR1jn8a0x6QusqFK4Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=0NLLj492lcDJW-k-HvMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=671 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130103

On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>   
>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>> +	unsigned long flags;
>>>   	u32 data;
>>>   
>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>> +	--pll->pll_enable_cnt;
>>> +	if (pll->pll_enable_cnt < 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>> +					  "bug: imbalance in disabling PLL bias\n");
>>> +		return;
>>> +	} else if (pll->pll_enable_cnt > 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		return;
>>> +	} /* else: == 0 */
>>> +
>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>   	ndelay(250);
>>
>> What is this ndelay protecting? Is is to let the hardware to wind down
>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>> without any delay between them.
>>
> 
> Great question, but why do you ask me? The code was there already and
> MSM DRM drivers are not something I know and could provide context about.

Because it's you who are changing the code as you've faced the issue 
with recalc_rate.

> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
