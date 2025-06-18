Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA02874F5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252038; cv=none; b=eKGXH2j0eM4qixyI7T9uofFsUJYpbi9sdKBhvENL8KLamUtTeJEMKqQp85k9fjTMic+I1sFWfw927A0znYc4FP6xxYmiA1oH9CMoTtO4sLdAP2Q0QOmfcmINyEE4MWGBIgGR/CdnBOxTvOKW3i2uK3iwr4J4kA+NevYXNRiMCV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252038; c=relaxed/simple;
	bh=aA5LD0yZNfAlRiFQfSy4LfUnBmf76i3aBocEv8Iamu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOkh68ah32XWeVpHUI0Fx/KqEN1vJLRJ+D7YEeV6NjgAGhb8xbWYKWsnI+q5wulc0O9zj9jhG+Vmm5EvJm7Yg5sPP/I0lrMAG+XucsqZXvLthBIGG7ax7AZmvUqkluTiI6GiGtVScMdw8IEg+1HuNs22aa/+DarIirVZNtw3oPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpzzW+kk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpzzW+kk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IBumF5024580
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pEB3IBW7SqwbHALnm+Lx2xPg
	ZbrkAM8vQD8no4c94Fw=; b=JpzzW+kkQNR0fR0arMeveU/sDhXQsfV581HTRMzV
	mLM1WtZudsBRSdUIZWCGv45SWcAfzVNdigRnJsYy4XwFMm4m73c/V1kA/QC7vhwz
	vqf03ZIuucfAXSPWYTG7O3hdDKwmu0zZth14mPTJzRIYd3sN4TLNfMLk3p7EgEXE
	bS7MvaUP28bhmnwZIlGVsWvRAUYF/MOaHKzMNAItg2ARAW7mrtFF4b6voNIYkV4a
	Opzl2BFa4ZYDwsqrYdKs+bAr4SVp2B36YBrZkK1MQtMCXYTv6N2nU7TvdsQgpXpL
	JbPmL2bscma82A0kQk5NGb+cstfNykXj9BpRoX2dz0JmnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13873f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:07:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so163023685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252033; x=1750856833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEB3IBW7SqwbHALnm+Lx2xPgZbrkAM8vQD8no4c94Fw=;
        b=nxZ5Mc9rQMfGsWXmxHmb1m1z2XN2BLWvgoY6rvt7CT38WxmaIrMxgSfqBF0DqqX07h
         4oEWra253U3g0C8iWn+AH8nnPJX51D6/6AGUygilfdWt7HdAcXzOdraTO7XXyVxot62B
         1nCvfKOBS2XFu8LgF7a1vIHoETtHYbUZu26y1Dffl8ePlcFLMWeN3uT5gaZ7MjzeqsQC
         WvyJnAFMLbs9rdiRSmaSrsSoB+De2m71c/h6YYwF/jV77JmHysEWt1sCeaq+pHO+k8Lo
         4cfHo7zCQc5T/emlYO5YpmJal9WUnllNQGZOsp2r3NRoylfqbMb8BDX9GYWzoDmJjcDS
         dGZg==
X-Forwarded-Encrypted: i=1; AJvYcCXgXZbzAJAzGEcf1U3KWqCW8X1O4ZMm8M36Qtc48lQOOqXNnhFU/LGeMU41uCpXMZpVUMbHpQ9YfLG480s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGTerx4i0BuUzhvzEcUMAHOgFHzfT1dyAqfgAMR5A1eu+sJ/KK
	XKWUV6edF13fRJR8wWT++ycnD9EpBlJiC2b6i45/QAVAilquyGgwqgOcz1I/0xEQKJOIFfCK1Rv
	0i008Qc6H7GoOJi3ftjWssIbheL4piGuDLzOeupX2IY+KIRneB37enUKmSQrRpiz4Gig=
X-Gm-Gg: ASbGncvViaUEFEYrGTy6oZEy9o02MO2tezXQSzMd/8KGYyt2pqDd0C4YTk8S/alKJRR
	gmUXdbwO3CoSwgJt5NrNTxKwwWM7tTFD/AmKQaG4X8dKqXDsEXKL4rLeKx7alVHAK2Pl+kYsAqu
	hcDH935S6utyf+lM37YJ1Wc5ckRgdnP8eohAAT8FLJtJidUPjnX2KVW6t0pa8Dg97GF43Z6JbBt
	Q/AGDXzVNDHh9yY/0WRddr1f45XbNjMCL105yZsacyVBJpNVWjvTxs1Cx/6meuha+cNyQmpjxYI
	q3Iyg8O1q6BG80V5nGvWsEVQrtfnT6ZPBMV1LDLF6dKO/zV4PwZo5Oblu8lq42amZhmVQbZHn/X
	FZKx0FHt9FCp0sk4BMVO+5X5j8JZmFSqw3eo=
X-Received: by 2002:a05:620a:3186:b0:7d0:9e8c:6fef with SMTP id af79cd13be357-7d3c6b7b64bmr2416845185a.0.1750252033162;
        Wed, 18 Jun 2025 06:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZYFBBGQhXUBuLVOvJiO43P1f2KVUStUccmAa1uQee7HeLw+oTe/UnhxWImacqUUL4x3Tnww==
X-Received: by 2002:a05:620a:3186:b0:7d0:9e8c:6fef with SMTP id af79cd13be357-7d3c6b7b64bmr2416838585a.0.1750252032534;
        Wed, 18 Jun 2025 06:07:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553cdef7fdasm529978e87.245.2025.06.18.06.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:07:11 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:07:09 +0300
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
Message-ID: <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6852ba02 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=uvfCOV_WgLjuMeome0MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5S2z0EPaGlwBjaP7VolYnBnpCTg1eWcY
X-Proofpoint-GUID: 5S2z0EPaGlwBjaP7VolYnBnpCTg1eWcY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExMSBTYWx0ZWRfX0kzlHB/OZGP1
 JF1nK6D9UeLc+RAwl0Az2l7gOVlIYwu6a2CzLBysqocC/KfRpj4f0IaxQksuRjFftIXKqJiouT+
 gi/yKWK5OxPOV+KFov+DsGKDEHMs5n5F15+HhoArafth65weFaRmkVYUvTwBHDsCGVDt1RfR7tn
 hvQ8TuQOG9DF6OL+ojIj8XLPViSaeNVDxeEQ1oIgev25nDrpVG4Cg2GtxM1Bz/VyAhN3+dc0MZZ
 SVCFw2iYSsoENRgLEdJCnX959shcRYQJlFFSXa1yL9gQgvwuSrHrIgmx85W2FmUB273eQ/EgFPw
 RZ85iSfs7ObNt/aWWBfpu11iWkTCkHf9dnQAVHTBEWM10q6I+tsU0I92fyNnbdbLzmNTiIhUDR+
 D1Glbnj2Ao9UFFL+fRnyGMra/dPNO9oBzgZSUBtSdyMH+1d8C5bk9YkpCfIL0PntGwe57k+B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=680 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180111

On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
> > On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
> >> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
> >>>>   
> >>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
> >>>>   
> >>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
> >>>>   {
> >>>> +	unsigned long flags;
> >>>>   	u32 data;
> >>>>   
> >>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> >>>> +	--pll->pll_enable_cnt;
> >>>> +	if (pll->pll_enable_cnt < 0) {
> >>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
> >>>> +					  "bug: imbalance in disabling PLL bias\n");
> >>>> +		return;
> >>>> +	} else if (pll->pll_enable_cnt > 0) {
> >>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>> +		return;
> >>>> +	} /* else: == 0 */
> >>>> +
> >>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> >>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
> >>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
> >>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> >>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>>   	ndelay(250);
> >>>
> >>> What is this ndelay protecting? Is is to let the hardware to wind down
> >>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
> >>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
> >>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
> >>> without any delay between them.
> >>>
> >>
> >> Great question, but why do you ask me? The code was there already and
> >> MSM DRM drivers are not something I know and could provide context about.
> > 
> > Because it's you who are changing the code as you've faced the issue 
> > with recalc_rate.
> > 
> Heh, the answer is then: I don't know. I think authors of the code could
> know.

The 10nm HPG documents a 250ns interval between enabling PLL bias and
and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
delay between disabling the PLL, disabling FIFO and remobing PLL bias.
Please adjust the code for 7nm and 10nm PHYs accordingly.


-- 
With best wishes
Dmitry
