Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56322D9F7
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832387; cv=none; b=KWKxfPxp/dyJwfR0iiLC+ubN6E1RQlRqJWuwdapTOPALB1aexBZ6S5SVkjAiN7vm/zCxflcBTIaOQuTKf/5efLiikC/sY5Po2cVNOYElP2PlmizG9d43nIzjPItpIx+vYfjia2xDECi0lMzyKCx+uwkXZHrPJbs5smniWcirC4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832387; c=relaxed/simple;
	bh=fNLPFd4xKlr3/lYdDZ86ImLr1zSXSvfTKD+9/Z5sUPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8BiNCiv1L50oGL6vLEh8gJOfd7Kr5+bmc3AkQ/P7OZL28BIRb5MqzISgWMhAGSKOQhpFuhTjcx3CpvD0+hSB9PZOIMphXum2YrydB300ONaBmuxvaPi8iv1cgu4WhRGJtlrlLfRO15tH6TgHWAyPaPQsC41Tlolx8D3MYZ95FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHLUsocq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHLUsocq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XIan013410
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PQ8FelBJqVusuKqI01bafP6p
	gE/hxiJzISLHy0HpwSk=; b=OHLUsocqu+9QxrOtGR5b1KSyVIms2jesL2go7drl
	2ooIQ74FhKamY66Q2+4rbF/CcVtFhncW+d7IjQGlfS/6WxyhWco7BJM/fZfSbJSQ
	/jtP+SKQFdAmBjeaHs4qKhYeafhEr8G0H0NOpSco7EhBK61YtcRHRiy6zORt3dFA
	R9jpsIOb9YKPn99a/MzAs5bTku9R5dGOMcCVGZxnRFu/ajVq87JZRvC8SmJaygPo
	TturjWUKQhInUc8Xt0Jqc29IZc4VAv/Iq++KpDV7DW0hmSWfAULknkUOFReShf3y
	1wbqL4KTNLWE2IJXFHKjvMkZuXuJTuF077AiM2JOiy1cwg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5b1mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:59:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c9552514so69238906d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832383; x=1748437183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQ8FelBJqVusuKqI01bafP6pgE/hxiJzISLHy0HpwSk=;
        b=jZKqF+JJ+s4h0kbt4ZYV6xF9l83LPPNRvLiVrj9f1qyCZ4MIFXbbrkEFVD8oVzQgWh
         RZXEonw9WTPLkNXmvqtyHFpMTZXYf2YmDC536ft8tU/kV/IgCgv0tsefK+CkX+wFqWbc
         /jHao4SalEmS5emwLeNw61fOc0rWg+Nw9UPkZXew9X85J6LxVg1+9bq9wZNi3/jDVFiz
         1HWbJIgOx7qjWD+Y1KH65slKlFw9bPjfoMDneDdJlAA6qDTy96OWbmGOV8tn7oVfbMBE
         54goPnUJT6PJIsnY2j/p5e9o+wGxit/2O8ilGXNc4+j0P+twFphjs/81OBsv7WUC2GFS
         Gu2g==
X-Forwarded-Encrypted: i=1; AJvYcCVpQz2eFjYujuYawHFZMQd3ZiSQ+w8k2fwu9azYtOiOmMclDSXZaIDxfaaAP0T2/hjXXiqZYyAA4p3knE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhSGmIXAXmYS+jg4ggff6a6KwNJpKK8bXyY7h7ofsKau97U8K8
	Pa3a9xrDH6B7qTc/YAIVsweKSQDHr6FP+ymvupadnLJFELRqFDY5Opi7j9m324kVQNfgh+DcZLC
	nRx8iQlUumNGJ0BnZJ+tqx4RAYa16BaBFkMCnF8SV68ZLMPFNPLqMMJvHKttv1CLCPpY=
X-Gm-Gg: ASbGncugZtvI9AgrbZVVnJ+YCTb5tiW3lNO79moe0fz/ULRCXL1R/grkQin+NNJWvjy
	2JP9h0pVVsWEBUgBogwYDrxCYA4nacc7K/z7bHGuP6OzTEuhsUyxJPFkIA3UIE6yqirMbCCAMMy
	D0OOBLRxwvyX977e3UJYbioAvZi/xw+zYUuDzm9uVx2q68iwuU+iZPwCu2ASj5u+tpkwaH6xdsj
	9W+AKfRHTNESoNDxE18cjLgPVScBxtWP3sBl3ltNyvBqK+v1Kb5uDRgPTTcq0ApyJnHyS2L4o27
	ClyL8R/+CvxIzaLTKdZzx0/GMPmFfh3IZpot5K5bifEIbrSWdORNyAdxQoPYr7N710MX9Tnr9IY
	=
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id 6a1803df08f44-6f8d03572a0mr205090386d6.15.1747832383552;
        Wed, 21 May 2025 05:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUhnGy4gCGjXLtSemtXuIIR5DTpA42yEm9njhcNzOkanHSgLeUZ3VEd2gBEl+hjJ8sTmWA7w==
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id 6a1803df08f44-6f8d03572a0mr205090066d6.15.1747832383172;
        Wed, 21 May 2025 05:59:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c9d8sm2856946e87.181.2025.05.21.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:59:42 -0700 (PDT)
Date: Wed, 21 May 2025 15:59:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Message-ID: <ybbyhri7vydiyowr3iqrizefblrfpedk5it723o254vyklcd5c@cdx7rhx2f3rn>
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
 <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
 <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNiBTYWx0ZWRfX5ZfWnJv5guc6
 s+meY8JNeyPO5xNQj8xhjsANN7eoDkB4SEnMSFIb7I8DVAQrXmjX30F4ev2YCNAMy/XCRivH1vW
 JBFp1ynQLTz9k7r+kjCerbH2skCEBLFVspEZvg5JtUANitJQwsQS5x4sGn6v5UVEGAfy88fgIWT
 YlugkPv3j5X/ufQPgAGg8BzO+9X+cEYIh5XJbWEJYvZAH2/r7b4+EqvbF8YePw9TDR2uyRH9f9n
 jm5IropmffjeV+EXpneE5g6Vo0F+3WOR9cm0ARo/Pb3bvcKp6J9EgfQgKYnLjCqkuQevmmqik35
 uQhSYr3gYGVQiazORkIEZz46GCo+b2aC/Xjda3r2GIDgESga7oTR8FjtCFZridOtVR1yGNtudn1
 GZN/8J1zOG/hsSOvOWNhs9XT3PMywjS/TMC6NgOznA8hNBtHe+s0eC436JQioNgawJ/OOZTI
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682dce40 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=afxxqWxysUDinfw8BOsA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DSttNmL_y9MhdgrKK8nubQn-w1F50hkh
X-Proofpoint-ORIG-GUID: DSttNmL_y9MhdgrKK8nubQn-w1F50hkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=662 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210126

On Wed, May 21, 2025 at 08:09:14AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2025 22:06, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
> >> Driver unconditionally saves current state on first init in
> >> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
> >> divider registers.  The state is then restored during probe/enable via
> >> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> >> dsi_10nm_pll_restore_state().
> >>
> >> Restoring calls dsi_pll_10nm_vco_set_rate() with
> >> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
> >> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> >> tree.  This makes anyway little sense - VCO rate was not saved, so
> >> should not be restored.
> >>
> >> If PLL was not configured configure it to minimum rate to avoid glitches
> >> and configuring entire in clock hierarchy to 0 Hz.
> >>
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Fixes?
> 
> Probably:
> Fixes: a4ccc37693a2 ("drm/msm/dsi_pll_10nm: restore VCO rate during
> restore_state")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> But CC stable would not be appropriate, since this was never reproduced
> on this PHY/hardware and we only guess a visible issue being fixed here.

Agreed.

-- 
With best wishes
Dmitry
