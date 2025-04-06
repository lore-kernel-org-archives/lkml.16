Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28971186E2D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970457; cv=none; b=XCc6j2yQmL/f1bPNM+R+m4ESbbPI6M2Vg/NfVBaRO8Lya/R6eGnNDtJ/pidQ9pgH1KzSYbcL1FQdiKwR/JrTyPHfLacuZ/tGisMBnu5QwayhB290VWLUYlD5HogQOHeKBna1jdSnJADUn8rFMKS2LtGkGMppEnHAeaAAuMnB0Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970457; c=relaxed/simple;
	bh=Uam0zLMq7HpVozbh5ufJC2Ny3ITek901NdcSMUYoIig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxQgW2pmoKIRoK/LWjE9OBzXvZen1nyUV4p83iPtAc+aCLEAVaWNAaYTVAVemAaLkpEIcU6mXeFHSlT5LjF/sM683BmjlqIYI9u6c6P8oZfFbUS0IStOUfoKgneccSgaaZdmnHkEISGYwD/o8DWOfTdePwKCOzym4bSjNAv6oJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLixNEpu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLixNEpu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536JaO16001924
	for <linux-kernel@vger.kernel.org>; Sun, 6 Apr 2025 20:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O8hv9mePop8METDLs+nG1ezB
	BYJSkLemzhlRHzLHAPA=; b=bLixNEpu1IvONcIqZK/kVrOKgRLen8p3lTBq2jhI
	dUFySD44d0WTWUIZVnTdOJN8dp+W0Cv9Jk85np/wefr1OsSAEv4/5SKOBA2SXxdW
	h8G0o5cPbYiOCL3UXR8BttI5vUcETfyheZDt2+kn4YWuWRhp0+evPOLYsDHFWzYy
	cq9piUHaQ0TsGaI0F3XlbNq/q6lXq95KGHCYU08rKtZ6azNPyp3m8rqkGdJaHDT2
	ulEoJwz+RPwEn+W8I7WEsYx/kaCOLQe9eSkkOJBNTaofVUVNpLsF91y0a/SsMlhw
	cmFvjblyRJnwGvn7bhCnXQVOQwNO3OG+AqnvucNtWPQT3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbua9s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 20:14:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f7210995so664749685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970453; x=1744575253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8hv9mePop8METDLs+nG1ezBBYJSkLemzhlRHzLHAPA=;
        b=l1h4iTxQWHg5+J9GkIZnaC3aakBygEPiIcIAxhObz9aXWjlZ4rk0f4/heKGvgOwQAs
         ItQAxbKn517xWC8Kl5C05duq6QkR4RQHQ/NRcKEn4fkEJQo7e0dIyg19rL8/jWF6q0XL
         DppGc327ahh1ecLzdcdachlKI/PwX56cxQy1D6u1j5yFrlk6uvDC8vWLQBvtWZ6kloI9
         4u8ZJsMkTgxt3av0oEhN/FR2v1mDHIAiGNnUjcCCGpGmaDrNcicHSbACM5pfsXVajWjs
         Yn83Y1F8KhScpAMEjwxjS78lKeHV/j7Zyku/ug4/7Gx4ehPqgbggE+0PWnx+cO15KE1i
         hVpw==
X-Forwarded-Encrypted: i=1; AJvYcCUzRnUcfJcDOsjw/kCekbXTkMk0BlOCOFJaFfz6bm6fAD/8zLY2OTeyRDqnswcHRK/0sGa4a0YB4oBH4P4=@vger.kernel.org
X-Gm-Message-State: AOJu0YybGb7P07fBIAvEr7RCalkfSAB7K64PDB51poQd8/1AC9GhDIpo
	7KeQFFK+H3j5yeZ+bpUYwPKMATp24mf2m2jUa6qr9/XojiD7OfX8GCfs2BOYvhLl+EMhIjNEvje
	kYQgiKkEuTENO2/nz5JV4ohBUr45Gw1tq0rleH5SY4V3dRo9s40vtQo+gxcpAdgA=
X-Gm-Gg: ASbGncvDESpavTtMUzDCHeUZ942BxqroXDe+QvX5TJW1bgzNTWUg5dDeqNVFL98vMC1
	BQXdtR1qS64Qfs+WCvGno5vy29B47vl2XDUzXDCecxuHafSU3DKvgNLtRItsHMbJOzIwnrnllB9
	uyEc5JvCiIM2xsZzKUhU37fIjjBkVcUo9pnrbEGCDSMuDpG1/UmCs2PZIbQWVCfb3FE9W8I8jB0
	cyq10jXTk2qUx9vCRwsnK4gKU7Xqz8UId0HKu7a0+IoWdUWzu5vqu3lP9FbnzN6bAO2NZmXYyFF
	eOWkaS/Qjtsg+F9VGSEpgyxSt8U7sdvijQH8Aeo8HQoz6PuhzCg2e/jv/PrxHJ1zNdP1wMN2KQB
	uZr4=
X-Received: by 2002:a05:620a:f14:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c76c9c0c8bmr2276343485a.18.1743970452769;
        Sun, 06 Apr 2025 13:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6bE+uyjd5ifLK1IJUj1GerX4vOxW/2WADmTBo303FxgyqDrXW1FVehmfIGpQRQAfnLqr7vQ==
X-Received: by 2002:a05:620a:f14:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c76c9c0c8bmr2276340185a.18.1743970452444;
        Sun, 06 Apr 2025 13:14:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c1f95sm1043850e87.83.2025.04.06.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:14:11 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:14:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 09/10] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
Message-ID: <ctwzoes6or6nmezz24t5tekb5ovxoh3bylqtiwjjvkcrz37xeh@hclirezl6o5t>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-10-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-10-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: K4YtM5xQolrpNECOgsWqfQ6fXbQBMbil
X-Proofpoint-ORIG-GUID: K4YtM5xQolrpNECOgsWqfQ6fXbQBMbil
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f2e096 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Qhp2PSjbNHdjP6JHm_UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504060147

On Fri, Apr 04, 2025 at 05:25:38PM +0530, Ayushi Makhija wrote:
> The anx7625_link_bridge() checks if a device is not a panel
> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> the bridge operations. However, on port 1 of the anx7625
> bridge, any device added is always treated as a panel
> bridge, preventing connector_detect function from being
> called. To resolve this, instead of just checking if it is a
> panel bridge, verify the type of panel bridge
> whether it is a DisplayPort or eDP panel. If the panel
> bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
> DRM_BRIDGE_OP_DETECT to the bridge operations.
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> like DisplayPort. This way, it verifies the hpd_status variable
> before sending the status to the connector.

This commit message describes two separte changes. Please split it
accordingly.

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 99ef3f27ae42..365d1c871028 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>  
> -	if (ctx->pdata.panel_bridge)
> -		return connector_status_connected;
> -
>  	return ctx->hpd_status ? connector_status_connected :
>  				     connector_status_disconnected;
>  }
> @@ -2608,9 +2605,8 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
>  	platform->bridge.of_node = dev->of_node;
>  	if (!anx7625_of_panel_on_aux_bus(dev))
>  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> -	if (!platform->pdata.panel_bridge)
> -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> -					DRM_BRIDGE_OP_DETECT;
> +	if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev))
> +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
>  	platform->bridge.type = platform->pdata.panel_bridge ?
>  				    DRM_MODE_CONNECTOR_eDP :
>  				    DRM_MODE_CONNECTOR_DisplayPort;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
