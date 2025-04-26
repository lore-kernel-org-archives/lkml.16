Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0313AF2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745638305; cv=none; b=rtJHoMvFWaYII16WVIHEhnJnkBAvYknRMn54zPpVnQXrL3JLgj/BZVOhz8YXFOyQVcyNONgx5lfZlED65u0dwzkE5jIf+TqDM2zFWxoLS0dIFc/DoCQARvMHa3UwssttAaZjA9mD1z9GDSE6K9Zwp0wlBiIFUG7f35jwp4QHZ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745638305; c=relaxed/simple;
	bh=QT50qmt+/CHcDj6XAg4Ojk9eF1Dgm84EZHhfEFLqk7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmtOKV7Y5pnPbgT1lm8wcqVUXIxY712Z+/CVY2jjcs4yXG6S06Up/RHam9FQ1B4+RoJp3R5ugmMdVVOQI5r9lIwwpfpzYi2fko10sVBoG3yfXALxga0XedK2xWaa20+RUVmMQnEZZaylxVp21Kx6A5SdFUY6tH6hZMokRce5TfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bct77xIn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bct77xIn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKFtW011555
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nb2+1xFk7BZuxdwzNv1w1PjS
	dGuUBpiFl52TtbVo8Lg=; b=bct77xInLU4F/Zg4JqSihOVKoczpiYloGZcTT9b7
	GNIKcMGKBkFPLIfubEngoYMtVx6tjfDkMFp/ptk0n7Yhgbs22m9tFYqxC5XdU80S
	u/wsvAZ2d0FI5rt6slKXUVpmXNLRxKQteHFZQAbaoZ5RJmiORV4/Sj4zJohztTPv
	DmxqVdWgFog10Y6Q1y/vnNiX2j4aoyvrW/RqHtPhEoVBfKeQlO35wLE65Wx6UuJa
	tT8b7cBVCobhbt8QgDayaFfA13c/ikFyzxRWMwacXpK6qYAhWCF25KXH/jNOX5oQ
	elc7CVBBW6uLyc4tmGtElF+959N7mtYyi8MLUJuslsMMnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0k0xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:31:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso475670885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745638302; x=1746243102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb2+1xFk7BZuxdwzNv1w1PjSdGuUBpiFl52TtbVo8Lg=;
        b=CIUM9W1nmckNYftrL73EE7y/zul328X0Kehfik2HzmYDBW4yxB1feuCDsrUyc+a745
         P71nPL67V4E5yKMmiV8Vf0eY23HXmFeDQMdoJG+uIFCTl9MXCFSYcKjCOvFrLLCGUtY0
         zYyOfhEtF/YyJv7Bid0l+L0EmmXushy9gmARkchKVX6gajDlmpiX4XgWys1jefMptrCR
         syaLd9Tdbp7pmv25WoLbrzKEpdb8YE1xx0DQwlhObv1C1xJDHTvNb87rPdLyKcQV9D4F
         Yqyk2PjHOpgnBf+WI5347NXsmuAmZerl4nPOicYbZ8e1nggenp9TEi0miRlDvGlpGDq9
         LGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk69WXRGwrKso4aRhDf/oqsaqryLWXRP1DVWSdqGJ9sX5GFXU3oYON4wRcT3VfkgJIrZs5HRTeeFbXhhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdIL+afJpQwHVMsF30lqJhIWjlHGWkXHXAXLvfrAPp2QyvE3It
	cvt1O6fCji2psiuXNhemHsWgrvhImT+JHVjDF0SNGN0+fFhJSG7k2/oqkTlRO68GnZzFZlEu6qx
	JZZ3MhoARZ+gXYrOLC6AvFa45PBBnrcbl/ZShYCKwVjEbPCX3dVHr58ldGtxZ6wo=
X-Gm-Gg: ASbGncuyvo/+4w3GBq4w04XbDsLwRgc7zFKx68GM9e8v83GyZqaD2gKuYCBZq4RWSBc
	RKJYmMjb6dA+xdm0ALcJlVFhYp2cpMGL6QszDJ8rvvvqY9GLF8LMz6LBVAfJZZ2PGkA3YLwUUKJ
	TqZgYjMkwS4IACgwkb3ii40mwBjDX4uTbRjvysAJqnasVfrtGMZraMv9sb+P14ncbjMreGwfOzi
	dyIaog2uGXZX0mE/QMz8crygGoQn7BiE8PorPgi08dSNOswY0jpWIqA1NiMGjsKTNsTA/yOdq/Z
	vR8IGI+sUYcD9tIggh1azM9J27vCf46OpMDCEuV18FfrPqj3CP84uhXElr3IcbTAnOOzH1cZmDM
	=
X-Received: by 2002:a05:620a:410f:b0:7c5:a951:3518 with SMTP id af79cd13be357-7c9619dee3dmr565507985a.39.1745638301764;
        Fri, 25 Apr 2025 20:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPsDVbT5wRnNn3wZRbjqS3ukXEBA3GuxdZEx/4kBmATEj4JvK+jgHrnp1useeN5CfFa4sw5Q==
X-Received: by 2002:a05:620a:410f:b0:7c5:a951:3518 with SMTP id af79cd13be357-7c9619dee3dmr565505085a.39.1745638301308;
        Fri, 25 Apr 2025 20:31:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a84a7sm10432701fa.80.2025.04.25.20.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 20:31:40 -0700 (PDT)
Date: Sat, 26 Apr 2025 06:31:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/5] drm/panel: ilitek-ili9881c: Add support for
 two-lane configuration
Message-ID: <ng2vjguqrfrxhw6vdzcrrlzegkepfvzwz24zj2fqddkt2df3mw@7biqwyndc2vz>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
 <20250424-feature_sfto340xc-v2-3-ff7da6192df2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-feature_sfto340xc-v2-3-ff7da6192df2@bootlin.com>
X-Proofpoint-GUID: BH33WGBdptZWJOgX_o0-ixzHg7VqwY7o
X-Proofpoint-ORIG-GUID: BH33WGBdptZWJOgX_o0-ixzHg7VqwY7o
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680c539f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=80Bd5mv2Iwua2QL-_kwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfXyqSPO/YgQuRt 3jmO+r/FFn/7Oj8y1YxUCT++bCIu7N61/+nBDmMOHSt/d7GL0lhIt7h3If1y6eE6LQ9QjesDTA1 5/HLHnT8pCoW8ot38N9wknSS5dr1pv5w52mi1W0k6k9U1x1cnWzttXXnxDVJUU/X1KgEZFyNAct
 SaILr63aBhlFOtHkL879MWI0tzzTdCMdL+FC4Amtw8u7D7vTrE0v2V4fYBfOZLUzZTs68gOR0Fs 313E/QVBuMsbxDT/Vu9ErBhcJiYWBuDDy99W3BrfWU8bICG+kVK/xwYqGfCCfdJfSB+h1vhZBQa /2SD9AKOLhcfELAJueqUDZrL5+NvKOG2xAGn3SgdqTQn/qqAcofZN2C+MKF5lW5KzxkBXk04WX7
 qovbeYJbO7uCC5B11rS9qKhHW+i8ZCnhfRVPDq7DK/21pB8QxpcAYUtsseGtNenqcWy6KYTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024

On Thu, Apr 24, 2025 at 05:07:41PM +0200, Kory Maincent wrote:
> Enable support for two-lane configuration which is done by setting the
> LANSEL_SW_EN and LANSEL_SW bits in the Pad Control register.
> 
> Use the data-lanes device tree parameter to configure the number of lanes.
> The default configuration remains set to four lanes.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - Read the data-lanes parameter from the port endpoint and use
>   drm_of_get_data_lanes_count instead of of_property_read_u32.
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 33 +++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 28cd7560e5db1d5734b10babdb4e4e553c6e07d0..2e38dea28336f445cb6a074dbbec006f0659287a 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -16,6 +16,7 @@
>  
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  
>  #include <video/mipi_display.h>
> @@ -1263,6 +1264,21 @@ static int ili9881c_send_cmd_data(struct ili9881c *ctx, u8 cmd, u8 data)
>  	return 0;
>  }
>  
> +static int ili9881c_set_lanes_cfg(struct ili9881c *ctx)
> +{
> +	int ret;
> +
> +	if (ctx->dsi->lanes != 2)
> +		/* Nothing to do */
> +		return 0;
> +
> +	ret = ili9881c_switch_page(ctx, 1);
> +	if (ret)
> +		return ret;
> +
> +	return ili9881c_send_cmd_data(ctx, 0xB7, 0x3);
> +}
> +
>  static int ili9881c_prepare(struct drm_panel *panel)
>  {
>  	struct ili9881c *ctx = panel_to_ili9881c(panel);
> @@ -1295,6 +1311,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
>  			return ret;
>  	}
>  
> +	ret = ili9881c_set_lanes_cfg(ctx);
> +	if (ret)
> +		return ret;
> +
>  	ret = ili9881c_switch_page(ctx, 0);
>  	if (ret)
>  		return ret;
> @@ -1503,8 +1523,9 @@ static const struct drm_panel_funcs ili9881c_funcs = {
>  
>  static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  {
> +	struct device_node *endpoint;
>  	struct ili9881c *ctx;
> -	int ret;
> +	int ret, lanes;
>  
>  	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -1545,11 +1566,19 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> +	endpoint = of_graph_get_endpoint_by_regs(dsi->dev.of_node, -1, -1);
> +	lanes = drm_of_get_data_lanes_count(endpoint, 2, 4);
> +	of_node_put(endpoint);

I think you can use drm_of_get_data_lanes_count_ep() here.

> +	if (lanes == -EINVAL)
> +		lanes = 4;
> +	else if (lanes < 0)
> +		return lanes;
> +
>  	drm_panel_add(&ctx->panel);
>  
>  	dsi->mode_flags = ctx->desc->mode_flags;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->lanes = 4;
> +	dsi->lanes = lanes;
>  
>  	return mipi_dsi_attach(dsi);
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
