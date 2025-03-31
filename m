Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C9D1C5D4E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407857; cv=none; b=NbBVDSplc8a8XsCdrofsucV0KFWCzyzZupdPDfOlPfz9G51jMKa3GChtzdvp1v6xu5eSuIPppgIV4Icv7+dNABic1GiOiI8zjhrEd4aSRtFEkmNsBRVDLCYFNGSzlAbhc1IgYcRm2k7daqF2sued+dGCoigRYt0iGUblmQgqkVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407857; c=relaxed/simple;
	bh=fUsxsPC9UP66IzkEgJcJ7AVxWAEsJ2gAbChjjX37GbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVRznRKI9Suk1S5UEXC5RT3FBe2c7Ey0awgPwkqwk/VTvkB/jjET0AibFWTM1DhJio+hbipPlpbD8poX99IGxU3Vi9N1OanuJOIwp8y8P/cLYLKIWuvZhvD/ESD04DYYapqH/rKs93rrAfahN/0DuTtFBdBA6WiwJH5EssYvYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i32qeaX/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i32qeaX/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kejC025008
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UQUfwxbWQJoPScmuoyFnHwlY
	fQezW98abT3Z5XlPkNs=; b=i32qeaX/MaZziJgQcRaBmI27JxMGpTwvW4Gg/HBr
	8hYPiK5xalqDHB9iH3TUBXZHAK/cdxgvqSwU3MR/PNDQgD7AdyrGUAMLEkO5PScF
	SmsQIF+gd8eS3afgso6ib1jFrssgKpUk0d3MCnLlgxVCHJf9cAD7Z0JmhyrirbsZ
	vRimZrqj/QClTq/ws0yDouonG1cWkyfYT2/ZLHrPdD3HLYN9ZdrgmNWTOGlySM7F
	3sBdcpblETjGElGb7ogpXUvHzRPpRh8jo7VPz8sWR+M9o04L82eGYbBVPhkUiv2H
	ie9UJIbvPVzYp2LSHMh3QAkAiQOf4vTQWVqRKzDcEoezKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1bvnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:57:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so854777785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743407853; x=1744012653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQUfwxbWQJoPScmuoyFnHwlYfQezW98abT3Z5XlPkNs=;
        b=d6UhiOAlTdIBXKgj99Pc6xnJRiXEpXPZ3i8YyaaGCsfLvYt9VmRRa3G6qTy0LKkmIe
         fB8ma3gCnyySdsN8Z1LdD3h8t8lOoIZjqjLZUW9/SgjARh9NCkO/MSdmU5OJDs9qyuDk
         StfiOpAZjzi6L7ciw65rr9SwOEvUdBD/OEN2C1s9a2X6HjIwZg6OSI5TxWogm/aLaNv3
         ZyWYbOz0DA1wi++pBZFBX+AixMNeiUud3+RbpP8OL2qldPL6T41EAVKiQtT0GhniZ0HG
         qHGPk1D9UnQZZCB1b+oqsdQfpXzE1mfyCq8XeWc7EIYodAZaW+UMT0iddVaNNJRbRe8R
         TycQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNeYyTFdEFyH1d+eTV5qFxR0kp68NY+olxbT8fjCwrtsfTto4KNL0+JPEP7Ll46o0umCRGut63gFVCO6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzofsMhBPO5dd6myApBNkcM1hLtmpo0IoJlOIVlQrzG7ZmlYF+s
	Qunzn1X2wR6yQAynOzumOQ/BieiAaTwefMj8apIGmw5DdqnyskYMgSmWkGwh11JzxCE8QZZnrgb
	+mO6vDNEAiFC1l+sRrCVErO0vkn5RL6bKow134XV8tHPjGbfmPolrYox5pgpzIVI=
X-Gm-Gg: ASbGnctbSR6/B9jxUsM6NN6AwN6y+ePqOAytm7FcIWSR+o+FjzlbbFInZjEFPmyqIqr
	ioy2hU0eK0ktfJhCHYTSFu6Uj80Cd6OJFQPXah+wI1scpOE1MZI74jNPj8wKJQEyc8DY9UwY0A2
	2eHC2WaBxoqpzVFcLKXcocTEgWvfnirHQr+IjftrftcuB1GPU4KIOD63j/Z9a4EmY9zUSmfBoWq
	1pv3mKQ2XjipNSIrgCrEosy+4khZ5bR03ckiLXKGKWS7mWhf4xxdKYbt2craUAVGc4JfLPoLEdu
	O2CoVeCGUX92LTaF7McUWOUYYaw21u+UtN9td+ri4CiMW05B6HQWwgWe44vg0yYUiUvM7EcGNeD
	LwJs=
X-Received: by 2002:a05:620a:4693:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7c69072a7f6mr1123804485a.27.1743407852824;
        Mon, 31 Mar 2025 00:57:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmVeLNB6QE5Wo9bRNTZE6D9nuKmD6hCsYsvINsaxYkZv2N2XpulRNCJzrIwbPHrxrn+siXQA==
X-Received: by 2002:a05:620a:4693:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7c69072a7f6mr1123802585a.27.1743407852397;
        Mon, 31 Mar 2025 00:57:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4c82dsm13786981fa.72.2025.03.31.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:57:30 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:57:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bernie Liang <bliang@analogixsemi.com>,
        Qilin Wen <qwen@analogixsemi.com>,
        "treapking@chromium.org" <treapking@chromium.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/bridge:anx7625: Enable DSC feature
Message-ID: <wbk5c34lxywu7h6ffi3j372mmax24w7umxke6pun2nqceug6gq@yxlp4fxezkno>
References: <20250327115616.1271635-1-xji@analogixsemi.com>
 <gs2pn7o33hjzfpljzjprorof3xehhui5mvsrbnnpu4gwyncw5u@zvlez4dpgv3f>
 <BY5PR04MB6739BEDCE701FBC346106E21C7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <z5uepwsk6t6j5zlkrfrkcuodcmx477b7wr7smziwj4nf3avhv2@p7bqiun4yxb7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z5uepwsk6t6j5zlkrfrkcuodcmx477b7wr7smziwj4nf3avhv2@p7bqiun4yxb7>
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67ea4aed cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=bbNUuHX0AAAA:8 a=gQ1vUiXQCP7qibTZQrYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=3b-t3vAtY4IUXy2q2Ylb:22
X-Proofpoint-GUID: Jj6Ckp_7vsiTRbs94Ck2mYOhTyXn0VdY
X-Proofpoint-ORIG-GUID: Jj6Ckp_7vsiTRbs94Ck2mYOhTyXn0VdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310055

On Mon, Mar 31, 2025 at 10:28:00AM +0300, Dmitry Baryshkov wrote:
> On Mon, Mar 31, 2025 at 05:44:58AM +0000, Xin Ji wrote:
> > > > 4K30(3840x2160 30Hz) timing pixel clock around 297M, for 24bits RGB
> > > > pixel data format, total transport bandwidth need 297M*24(at least
> > > > 7.2Gbps) more than anx7625 mipi rx lane bandwidth(maximum 6Gbps,
> > > > 4lanes, each lane 1.5Gbps). Without DSC function, anx7625 cannot
> > > > receive 4K30 video timing.
> > > >
> > > > When display pixel clock exceed 250M, driver will enable DSC feature,
> > > > and the compression ratio is 3:1, eg: 4K30's pixel clock around 297M,
> > > > bandwidth 7.2G will be compressed to 7.2G/3 = 2.4G. Then anx7625 can
> > > > receive 4K30 video timing and do decompress, then package video data
> > > > and send to sink device through DP link.
> > > >
> > > > Anx7625 is bridge IC, sink monitor only receive normal DP signal from
> > > > anx7625, sink device didn't know DSC information between SOC and
> > > > anx7625
> > > >
> > > > v2:
> > > > 1. Add more commit message
> > > > 2. Remove unused code
> > > > 3. Add more comment
> > > 
> > > This part is useless, it adds no information. It is as good as 'changed it'.
> > OK, I'll remove it
> > > 
> > > > 4. Remove dsc_en flag
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 299
> > > > ++++++++++++++++++----  drivers/gpu/drm/bridge/analogix/anx7625.h |
> > > > 31 +++
> > > >  2 files changed, 274 insertions(+), 56 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > index 4be34d5c7a3b..bae76d9a665f 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > @@ -9,6 +9,7 @@
> > > >  #include <linux/interrupt.h>
> > > >  #include <linux/iopoll.h>
> > > >  #include <linux/kernel.h>
> > > > +#include <linux/math64.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/pm_runtime.h>
> > > > @@ -22,6 +23,7 @@
> > > >
> > > >  #include <drm/display/drm_dp_aux_bus.h>  #include
> > > > <drm/display/drm_dp_helper.h>
> > > > +#include <drm/display/drm_dsc_helper.h>
> > > >  #include <drm/display/drm_hdcp_helper.h>  #include
> > > > <drm/drm_atomic_helper.h>  #include <drm/drm_bridge.h> @@ -476,11
> > > > +478,159 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
> > > >                                MIPI_DIGITAL_ADJ_1, 0x3D);  }
> > > >
> > > > +static bool anx7625_dsc_check(struct anx7625_data *ctx) {
> > > > +     if (ctx->dt.pixelclock.min > DSC_PIXEL_CLOCK)
> > > > +             return true;
> > > 
> > > So, now DSC is enabled unconditionally just because the clock is too high. Let's
> > > see...
> > Yes
> > > 
> > > > +
> > > > +     return false;
> > > > +}
> > > > +
> > > > +static inline int anx7625_h_timing_reg_write(struct anx7625_data *ctx,
> > > > +                                          struct i2c_client *client,
> > > > +                                          u8 reg_addr, u16 val,
> > > > +                                          bool dsc_check) {
> > > > +     int ret;
> > > > +
> > > > +     if (dsc_check && anx7625_dsc_check(ctx))
> > > > +             val = dsc_div(val);
> > > > +
> > > > +     ret = anx7625_reg_write(ctx, client, reg_addr, val);
> > > > +     ret |= anx7625_reg_write(ctx, client, reg_addr + 1, val >> 8);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int anx7625_h_timing_write(struct anx7625_data *ctx,
> > > > +                               struct i2c_client *client,
> > > > +                               bool rx_h_timing) {
> > > > +     u16 htotal;
> > > > +     int ret;
> > > > +
> > > > +     htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > > +                      ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > > +     /* Htotal */
> > > > +     ret = anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_TOTAL_PIXELS_L,
> > > > +                                      htotal, rx_h_timing);
> > > > +     /* Hactive */
> > > > +     ret |= anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_ACTIVE_PIXELS_L,
> > > > +                                       ctx->dt.hactive.min, rx_h_timing);
> > > > +     /* HFP */
> > > > +     ret |= anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_FRONT_PORCH_L,
> > > > +                                       ctx->dt.hfront_porch.min, rx_h_timing);
> > > > +     /* HWS */
> > > > +     ret |= anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_SYNC_WIDTH_L,
> > > > +                                       ctx->dt.hsync_len.min, rx_h_timing);
> > > > +     /* HBP */
> > > > +     ret |= anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_BACK_PORCH_L,
> > > > +                                       ctx->dt.hback_porch.min,
> > > > + rx_h_timing);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int anx7625_v_timing_write(struct anx7625_data *ctx,
> > > > +                               struct i2c_client *client) {
> > > > +     int ret;
> > > > +
> > > > +     /* Vactive */
> > > > +     ret = anx7625_reg_write(ctx, client, ACTIVE_LINES_L,
> > > > +                             ctx->dt.vactive.min);
> > > > +     ret |= anx7625_reg_write(ctx, client, ACTIVE_LINES_H,
> > > > +                              ctx->dt.vactive.min >> 8);
> > > > +     /* VFP */
> > > > +     ret |= anx7625_reg_write(ctx, client, VERTICAL_FRONT_PORCH,
> > > > +                              ctx->dt.vfront_porch.min);
> > > > +     /* VWS */
> > > > +     ret |= anx7625_reg_write(ctx, client, VERTICAL_SYNC_WIDTH,
> > > > +                              ctx->dt.vsync_len.min);
> > > > +     /* VBP */
> > > > +     ret |= anx7625_reg_write(ctx, client, VERTICAL_BACK_PORCH,
> > > > +                              ctx->dt.vback_porch.min);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int anx7625_set_dsc_params(struct anx7625_data *ctx) {
> > > > +     int ret, i;
> > > > +     u16 htotal, vtotal;
> > > > +
> > > > +     if (!anx7625_dsc_check(ctx))
> > > > +             return 0;
> > > > +
> > > > +     /* Video Horizontal timing */
> > > > +     ret = anx7625_h_timing_write(ctx, ctx->i2c.tx_p2_client, false);
> > > > +
> > > > +     /* Video Vertical timing */
> > > > +     ret |= anx7625_v_timing_write(ctx, ctx->i2c.tx_p2_client);
> > > > +
> > > > +     /* Vtotal */
> > > > +     vtotal = ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
> > > > +              ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_L,
> > > > +                              vtotal);
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINES_H,
> > > > +                              vtotal >> 8);
> > > > +     /* Htotal */
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_L_7E,
> > > > +                              htotal);
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXEL_H_7E,
> > > > +                              htotal >> 8);
> > > > +     /* Hactive */
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              ACTIVE_PIXEL_L_7E, ctx->dt.hactive.min);
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >> 8);
> > > > +     /* HFP */
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_FRONT_PORCH_L_7E,
> > > > +                              ctx->dt.hfront_porch.min);
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_FRONT_PORCH_H_7E,
> > > > +                              ctx->dt.hfront_porch.min >> 8);
> > > > +     /* HWS */
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_SYNC_WIDTH_L_7E,
> > > > +                              ctx->dt.hsync_len.min);
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_SYNC_WIDTH_H_7E,
> > > > +                              ctx->dt.hsync_len.min >> 8);
> > > > +     /* HBP */
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_BACK_PORCH_L_7E,
> > > > +                              ctx->dt.hback_porch.min);
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_BACK_PORCH_H_7E,
> > > > +                              ctx->dt.hback_porch.min >> 8);
> > > > +
> > > > +     /* Config DSC decoder internal blank timing for decoder to start */
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > +                              H_BLANK_L,
> > > > +                              dsc_div(htotal - ctx->dt.hactive.min));
> > > > +     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > +                              H_BLANK_H,
> > > > +                              dsc_div(htotal - ctx->dt.hactive.min)
> > > > + >> 8);
> > > > +
> > > > +     /* Compress ratio  RATIO bit[7:6] */
> > > > +     ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_1, 0x3F);
> > > > +     ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1,
> > > > +                             (5 - DSC_COMPRESS_RATIO) << 6);
> > > > +     /*PPS table*/
> > > > +     for (i = 0; i < PPS_SIZE; i += PPS_BLOCK_SIZE)
> > > > +             ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_client,
> > > > +                                            R_PPS_REG_0 + i, PPS_BLOCK_SIZE,
> > > > +                                            &ctx->pps_table[i]);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> > > > {
> > > >       struct device *dev = ctx->dev;
> > > >       unsigned long m, n;
> > > > -     u16 htotal;
> > > >       int ret;
> > > >       u8 post_divider = 0;
> > > >
> > > > @@ -506,48 +656,12 @@ static int anx7625_dsi_video_timing_config(struct
> > > anx7625_data *ctx)
> > > >       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > > >                               MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes
> > > > - 1);
> > > >
> > > > -     /* Htotal */
> > > > -     htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > > -             ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> > > > -     /* Hactive */
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min & 0xFF);
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min >> 8);
> > > > -     /* HFP */
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min);
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_FRONT_PORCH_H,
> > > > -                     ctx->dt.hfront_porch.min >> 8);
> > > > -     /* HWS */
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min);
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min >> 8);
> > > > -     /* HBP */
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min);
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min >> 8);
> > > > -     /* Vactive */
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_L,
> > > > -                     ctx->dt.vactive.min);
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_H,
> > > > -                     ctx->dt.vactive.min >> 8);
> > > > -     /* VFP */
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.min);
> > > > -     /* VWS */
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
> > > > -     /* VBP */
> > > > -     ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     VERTICAL_BACK_PORCH, ctx->dt.vback_porch.min);
> > > > +     /* Video Horizontal timing */
> > > > +     ret |= anx7625_h_timing_write(ctx, ctx->i2c.rx_p2_client, true);
> > > > +
> > > > +     /* Video Vertical timing */
> > > > +     ret |= anx7625_v_timing_write(ctx, ctx->i2c.rx_p2_client);
> > > > +
> > > 
> > > Please split this part into two commits: one refactoring timing programming into
> > > two functions and another one introducing DSC support.
> > > It is hard to review timing programming otherwise.
> > 
> > OK
> > 
> > > 
> > > >       /* M value */
> > > >       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > >                       MIPI_PLL_M_NUM_23_16, (m >> 16) & 0xff); @@
> > > > -663,9 +777,15 @@ static int anx7625_dsi_config(struct anx7625_data
> > > > *ctx)
> > > >
> > > >       DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
> > > >
> > > > -     /* DSC disable */
> > > > -     ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > -                             R_DSC_CTRL_0, ~DSC_EN);
> > > > +     ret = anx7625_set_dsc_params(ctx);
> > > > +     if (anx7625_dsc_check(ctx))
> > > > +             /* DSC enable */
> > > > +             ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > > +                                     R_DSC_CTRL_0, DSC_EN);
> > > > +     else
> > > > +             /* DSC disable */
> > > > +             ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > +                                      R_DSC_CTRL_0, ~DSC_EN);
> > > >
> > > >       ret |= anx7625_api_dsi_config(ctx);
> > > >
> > > > @@ -2083,6 +2203,7 @@ static int anx7625_setup_dsi_device(struct
> > > anx7625_data *ctx)
> > > >               MIPI_DSI_MODE_VIDEO_HSE |
> > > >               MIPI_DSI_HS_PKT_END_ALIGNED;
> > > >
> > > > +     dsi->dsc = &ctx->dsc;
> > > >       ctx->dsi = dsi;
> > > >
> > > >       return 0;
> > > > @@ -2187,19 +2308,69 @@ anx7625_bridge_mode_valid(struct drm_bridge
> > > *bridge,
> > > >       struct device *dev = ctx->dev;
> > > >
> > > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
> > > > +     if (mode->clock > SUPPORT_PIXEL_CLOCK)
> > > > +             return MODE_CLOCK_HIGH;
> > > > +
> > > > +     if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
> > > > +             return MODE_CLOCK_LOW;
> > > >
> > > > -     /* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
> > > > -     if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> > > > -             DRM_DEV_DEBUG_DRIVER(dev,
> > > > -                                  "drm mode invalid, pixelclock too high.\n");
> > > 
> > > Any reason for dropping debug message?
> > 
> > I'll keep this message.
> > 
> > > 
> > > > +     /*
> > > > +      * If hdisplay cannot be divided by DSC compress ratio, then display
> > > > +      * will have overlap/shift issue
> > > > +      */
> > > > +     if (mode->clock > DSC_PIXEL_CLOCK &&
> > > > +         (mode->hdisplay % DSC_COMPRESS_RATIO != 0))
> > > 
> > > 
> > > ... and there still no check that the DSI host supports generating DSC data. Nor
> > > there is an atomic_check() that will check if the mode can be enabled.
> > 
> > I cannot know whether the DSI host supports DSC or not. Anx7625 driver force
> > enable DSC feature if pixel clock higher than DSC_PIXEL_CLOCK.
> 
> This is called upstream. Please work on necessary API changes rather
> than claiming that it is not possible. Enabling DSC support when DSC is
> not handled by the DSI host is not acceptable.
> 
> Few semi-random ideas:
> - Add DSC checking callbacks to struct mipi_dsi_host_ops. Assume that
>   DSC support is not available if callback is not present. The callback
>   should accept struct drm_dsc_config and populate const and RC params.
> 
> - Add DSC-related flags to struct mipi_dsi_host, describing DSC feature
>   availability. Make anx7625 check those flags.

...

- Extend input_/output_bus_format checks to also cover DSC.

-- 
With best wishes
Dmitry
