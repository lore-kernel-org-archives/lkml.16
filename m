Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3311FF1D8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226101; cv=none; b=jXo91VwBmapzWRxBSSvdpfZj7HXYJWljE6AsHuep37CE2UTxVVYXVOk2hdfJJaedLODPonh7mSFBtChk9w1sbjbQUgF2a+LuU8MoPHMi2iUwkiPX0DCp3lIrorJu42HQjSTd+CseHnpVB7qmR0Q4sO8kucdPMreTCigwuiKp7KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226101; c=relaxed/simple;
	bh=Yzfu3tcE7pGAm4ed9l1L6RZuyGcZnvl2Kch+QsjHBgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYTHhsKblVevyPNW8oorWVpFDk0JkZBgfIsTZ5BaYVnnP9v6DJHxs/sprT7c5C6RKBNy7lEIz7SoeA4/jDr14IrRdflxIThwIrTWbjGZACwau3fvEpR9eh8ZTudPfCANS6Q3zb2AogWdbs63AaOrmIN7rl3NS4lKw3iDojsMbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLsXxWq/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLsXxWq/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KBBsc002272
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 22:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eleFOyC3fOtiERUR0ch/uTI7
	FND8UmJHhoCAGFzcQJU=; b=eLsXxWq/CovyGDefzgsC83Ma03HfEVHyVuNYVy6L
	yPDK82DlulowW/tsmLvam7BTRo1DdnJxxGJB91LGYdzH6/7g1dqkus/cYjeO8Z/O
	lJxBwSqnAsGHA0KpQEoFAHpkGW7sRjbV5EgdqhP+eFy/wlzm+J9w7dBRCmesjILA
	4f6kgbAs29w8V5CTubgnQjpCSe2auxetfeV37XeSVRKWbi+rAwuYWI3H5iEMabzg
	g0UH/UTARw3Mtx/cyRd9DJBeiqLQjaR1qyb9+RC9IXb9cZbQt9xEOloowIgmAnhM
	V+m8TTAdE8OM8TjgYTwo5cBBJTu2Dh1FzumCo9+mK7fxiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubskpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:48:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so426371185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 15:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226098; x=1746830898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eleFOyC3fOtiERUR0ch/uTI7FND8UmJHhoCAGFzcQJU=;
        b=Mr5JTzCm8gjb/+Bg/Bi7F6EtsHc3nDAkNxnu+qdxXxkIPAQTz3sh1HA2dBHM+C6OeQ
         1+OYuExTHQSAyBh39kkdELUx7/GaICNFOW7cq93YXhcglTTMu787HGyeUpCRC5c46fN3
         H2oLB6O1OV51az95ycpTz2fmKXL9gOuT0wmHX7uhEhcSmFFSCIBMScYhn39CpF51sUEV
         dXEc3zJ9wf3sGHuvN+9hcRwc9Jdq5sqphX8rUunTTbeIjBDgH4AAsnY4w/h46v5YN2Jl
         QHxcCVk8t7Aa17H2Av1jmCitc7GYqNFSj7CIQ9UT9nO1UUAbwwqmhgy/wUVbLmZvBPBi
         HwOw==
X-Forwarded-Encrypted: i=1; AJvYcCXxonaKlHLRWd9PQ6dlywICoLQbLoZxBVyNACJVxTaE873J8Nk2PWv8t2T0NXKaaUYqYnJZK4TFji+Z6Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRudfpc3D3zVfXv2/isDueBjVGWIb1s4xo9eobJjK49kBBn7PF
	FaTZbMm6ffpXpmjn3ao3ZOFWz7sE60ZE6RjZcfL4emZdfVOjbtzHxQ2OWdzUlVpc9kNTA7SZgG8
	9gSNuuZUy/OcoeXvi7RlHMGEm2nu7aNKF8mRMc7CHLi4oo589Bh3ThRWgOa5j068=
X-Gm-Gg: ASbGncvDKE+oeIl5K8ueQwZl0/hq5K5mClvhzodoTQmAfQiuTtZnVGW3Z/EMmF6Cbjl
	nSQz4zxweX3m2zg76i8xSzKTmDlJDAl5QwRxteo0XFM5aCSydkFPi4Ym9gLk/2dgyLGji7JynxK
	FO7KlSIj9yFP0q9PmDoIr4xJRHiqhaowdAMxrWRKfH/wc9g4VFR78M4iyoNXF8UXIpdIPsHRQUt
	X5n7rtQTokAvI8DcrrOQlaGxeecjJz15JfcpI0AEhvCeMlD+gHM0emBgxXSJTk+nT6g3EDvl1NJ
	jFtAJf2YPNRPHwAWU14En0pfGTD/+egOqvvR5YDPSDUwskazD3R9ZlRaHky0zNkWElLmsbtZx34
	=
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id af79cd13be357-7cad5b2093dmr658531485a.8.1746226098381;
        Fri, 02 May 2025 15:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxvVUCE28kLO4ASUoCbxheAfyetz9Jt5+OUgHDim+9B4loVIqn+DtUk4rE7DTKtJgIyo0Arw==
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id af79cd13be357-7cad5b2093dmr658527185a.8.1746226098052;
        Fri, 02 May 2025 15:48:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f69cfsm511823e87.227.2025.05.02.15.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:48:15 -0700 (PDT)
Date: Sat, 3 May 2025 01:48:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 17/24] drm/msm/dsi/phy: Fix missing initial VCO rate
Message-ID: <sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
X-Proofpoint-GUID: Bnk9gHDj_sX3i8ZzaadB1pkw-E90OgLU
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68154bb3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iPOKqzCR-5T2sWUWG0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX2pP0EP0ouaSm VsP0fKRk+q8bkri7h/sTIKvtgmYc1Vp2HFNVZtCXI55BHDe9arn5AuC8tKadnpAJyJmSfOpyqh4 LoMt2xdMjDTcFO0+D4baqu9Z5IwGtdHwZuET2QrYSXsfp6TJ/7NDEOcYDlxf/Hy4ty4oiG6FuRJ
 c2AS8lhxWQmjNxAC9V6D9K6xpfpNzZx9RpQYLNO87ozO/feBIezK0T/4q2SCI9GawHHOspPt4z5 /DSO/ubGHKetlwrOefV+dlPhxaxVorsDDQqA1+g+10AYKz8n2hPunQlv9dReeEh5hfb30r0vARe 0f74p1nv9pyFnQEmZpjqiM0nrtHEy8lqQ10kTo0bf26iI+/40xQ9cm0rcL2kHqmbLdydy72DLnS
 GX0+v0Hkw6rX3ij3eexwAU7/r1NrmF4IC3cmidLOUoyeuaq/iQcbIzX079fLf0VPJGSdjKfo
X-Proofpoint-ORIG-GUID: Bnk9gHDj_sX3i8ZzaadB1pkw-E90OgLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=650
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186

On Wed, Apr 30, 2025 at 03:00:47PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_7nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_7nm_pll_restore_state().
> 
> Restoring calls dsi_pll_7nm_vco_set_rate() with
> pll_7nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please implement similar change into the 10nm driver.

An alternative approach might be to do something like (14nm):

        cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);


-- 
With best wishes
Dmitry
