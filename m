Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66A913B797
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428732; cv=none; b=WS2kPdPomlC/88BCslgxcB9rAdtuVsDfYihQYoVI3V4KWO+zy/u8YuPuqHycI65ZjfKCHQECYiwJ+/MVtFbwJxg1UbIyaWu52/eak8XDjcMbxrk+V0oKeTaMDXgzTaPCwKHFPHCKmYiuF7mopHBYrTZEmh0fsWyhCf4a5yeb6K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428732; c=relaxed/simple;
	bh=qNDoDvBB9n+ZrK24TBflV4QHGFR76p4DcEApsx5pxew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuc/wo22TwM7pCaFO5gMCnO1NZC8VBndECfF/KvZr0FSOlp4qePSOAQQNr7fq35KnfSKrXc2KLTVU1CjffyrSfTioGX9XjOsxH+vINqy/0XAYzBwJq9eCglLiwd/ULvMkpOv8k+I25TMvyljkI7Eci5zUMV1/qVSN70bhQCcE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IekQLsG2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IekQLsG2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApGND021142
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WDO88YLi7hpWsK2u0hPMTkEs
	gQvBzxRt+jPQGFOJ+w8=; b=IekQLsG2extxrqNLyKp5XBR0b6EvA524PJBBBKYR
	QEBc7W2dgxFPPFKocappfMI17JugezOKVFv1q0i5PgtRgi3QQD4sr4mXJof7uQV+
	+H7gEpHRlszCWegkZlyi1qRH01EnHuY+sanHCurwJmDK78nCF1Tlqs+du0HigG/h
	FJM6lFGCFvCvcLxMC9pkdZrV4ygOaX82rZHQQmgSNk1Blzuoad+mdywya3erwOwp
	XfgMlca6OU8lkgJuq98ORSXj3mvY0pFHyLF3b1L0m21EGgV/4bPtotEmyzjhx6Gc
	fgHLEZwGrIjzZ5jreKSGsLFHhwuxKEK81OdNKpObQCZSBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh22wfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:18:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53e316734so9914685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428728; x=1746033528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDO88YLi7hpWsK2u0hPMTkEsgQvBzxRt+jPQGFOJ+w8=;
        b=X0Z21lPZ85rlwm4shxKXOAQWxDLoa39aOQD0Cpa9lwewXMcKVkW9Eb26xGPWkzx2U4
         owdAtDb89/CqSLg7cLnuFM2+h4zoYqNZcoVgprxhBDHf7Nwh846WnRLFA4NNIXTE36N3
         0urKbfpiLhxHNGzVLZwPa0IAdFr5hYiW9t4oRx+iFgEHwnyZ6l6bbooMcIE3SRmi5DH/
         K9vXqAvTfle3JNFxs9qBTT98oKnrN9pMOWlZne62qGg8K6uFFZ0zZSFU0MkkQz77oG2P
         jmc1zEYvUpu/K2Qa/df0RkV9wsDVz+V37V79B7E9CHniOwHXRSEc52cAzLSU1v2HUEyt
         zWIw==
X-Forwarded-Encrypted: i=1; AJvYcCVqTEDjAZcvd19W3/JTZrO1pYSSaaC+dYm747pTdKGg01+ROUm3+Jr3YIEIYC0D7tkwF1gRbyBDox6P6XM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDh0h8keiayvq1F8/+r63BQGUvblUkHdER7fvz0u+eTjUmwSj
	MqIk9gfJ246e1YBUyoYc18xK5yTT7r0esndF5Q0HufaBZgKrAdLnmXhAemC0Xa4/d+uOXw0Sppg
	RhY6ttY5yxGRDUCgaXhrfvEF7DwWLvPDBYCQZSTUBnSHGJwkiGv5AK2cIoPkOELQ=
X-Gm-Gg: ASbGncsdsihibrCUaWQoNCSI5Gkw4dz2GwF0cVtrfZCFkvSWKtBykqzxzURb6+c3iTL
	pP3FXKcLEZ2MDQkBkHFZnSY9dNO3tTlU3xnDsMWZjmFkyDJ1jsLEeCB9xEntOHiPydcfLlDTkNT
	Rnr/Hy+Vy6aSkNmI3LDCvk0OpZ8oOxkFv3TbNYh0GAETxMgMr5nPDGZwC+Qd8YTHSwQl5nppZeJ
	WQas//+dBaHOo4Qc0GjglBbKZe9evOmQ8Awo5NAOYPoFyHj8ZgbIQylncZJyk47Ein3bObiZPfa
	+NPg2gsdWygxoY4PIG4ibtoBhWD65T+lRu/nbdUIWRTMVJPTYTWk2Ws8LgsM6xp9QurPY+qKxzM
	=
X-Received: by 2002:a05:620a:199d:b0:7c9:2612:32d6 with SMTP id af79cd13be357-7c92805fbe9mr3542964585a.48.1745428728643;
        Wed, 23 Apr 2025 10:18:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4YRFe2I2adKtjK/DTqagD31VvQyfxBA06e/fj1CyPoBrdGi/d4dL6lTARcuXkFMIqRSCSow==
X-Received: by 2002:a05:620a:199d:b0:7c9:2612:32d6 with SMTP id af79cd13be357-7c92805fbe9mr3542959585a.48.1745428728212;
        Wed, 23 Apr 2025 10:18:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090826cafsm18525361fa.69.2025.04.23.10.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:18:47 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:18:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Damon Ding <damon.ding@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>,
        Heiko Stuebner <heiko.stuebner@cherry.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: add CONFIG_OF dependency
Message-ID: <a4tcrxepuvvxixpab3txz6tdbh6janiedjqddl2ybfo6plhjcl@r5bxdabuhjep>
References: <20250423164422.2793634-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423164422.2793634-1-arnd@kernel.org>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680920f9 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=8SeTOrC02ZtG1eAnSgcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HuM0FHjJg1LqtSpycxIcfCw6K4B32n5A
X-Proofpoint-ORIG-GUID: HuM0FHjJg1LqtSpycxIcfCw6K4B32n5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyMSBTYWx0ZWRfXzwvoTJixd7CM WnZq4ZScFIj0ki/GIykeX/EhMjCSG8ELGvCfJbpskHQ+VpDz3tVsiG5OoD3DsutO/yCabuUv1eu RnxZig92ldjlByRzpPAVSBhf/+OWEsejn9n48fmmit44Fl2pDiiSIdFehNNfO+8dJ9Hc2KeiDm1
 Spxy7B95Xuf1+UPdG0QYDEy60FcpQE8aKqcMifbDls8FU+QZsE7tvqbQ/7+zywsOKqcPd/GjRJJ 4DXo+mc3BSPlyN+ouUiC1idWPZ8nNsuBhpEXijiK+vt4ewM8JhN/525EQM2BkrMK8C77Xf6pMiA 30NkXi9OxGTfD8TRAXnlQJOqit8Nu+pJdPKz/mPG3PbhVXwcXeaAQ568uUj+Gq/FiDOnbtHFjHw
 0YG+iBEX/CQx8r1zRzPCNDvlhoNgkkAMBp20DyZs84CUTN28u3U5mn/RIbGIL3EiTznqeciC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=968
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230121

On Wed, Apr 23, 2025 at 06:44:16PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> DRM_DISPLAY_DP_AUX_BUS cannot be selected when CONFIG_OF is disabled:
> 
> WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]
> 
> Rockchip platforms all depend on OF anyway, so add the dependency here
> for compile testing.
> 
> Fixes: d7b4936b2bc0 ("drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
