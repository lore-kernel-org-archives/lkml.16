Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0B1199E94
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749400133; cv=none; b=ZIz0rEYTbKBBvmLs35/XUC0KTd2A3iRJYAwxm6ZY5R4ojmLxt+ET61uYboCp1mBiCBfME5S2I18iIAOa17vf590XMouHP1mQVd8KvIDKGvS6TYnOyYsyfjQmFqF2moaYiischU34TfpswbQa6UpsU58O/lmOUp9PoVu8RSEzorU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749400133; c=relaxed/simple;
	bh=zH07MD5lavw2sa/Ex/WOkPBnN7lbIpVlBw3u3pB1vgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FE/2JXZ+tlHg41eM2a70CElzLBMOc9hhZl8zgJyw4JQr4pGaIR5ofSUSOitsScehp7Oy6HWI7MJvDxZQJJdFGZlG5l2p2sPK3OP2aOmTMr5I5eUWz4I7c/43tuKNB77sIjamONSBb9R4SJ+xkjlG50gC9knjc41fUkNd88lII2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkEbE8E1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkEbE8E1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558FLZ42006650
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 16:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jWRkmGUO0Z0naTDE1aGeIyoD
	ro0cg0ulqAjDzhrEvgI=; b=TkEbE8E1hyFCztL3ybV4bvCjY+k5ELgHFw/NBdCt
	dSEUUCCWxZK2E0R0yKdjLvtca2stAL6U8Bd3nJE0tzwgr5P+61TfIWquqfTppFiR
	nuixxSSsQp92Wxh/7H6NOJ5mbsbRZD341RJX/2H6MdqPrVPU50sfx4qlyaLO66fQ
	fvPpwvty1YghSIWOEMg5u61aL5keBiUEPakmDbLRUp5dshsRr4jZGNDNbC7KEV9o
	ehI6tKnkzU6vlDWF+DX2tfMTpONYXABjmNK5Q1DZE48yIQvieonSj3RZP+O7Aq+n
	gM5i27zBSkvu3DUVIazd0Oo7TZgb4Qok+ZlPGSlYPvwRQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6364j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 16:28:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9305d29abso678580885a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749400111; x=1750004911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWRkmGUO0Z0naTDE1aGeIyoDro0cg0ulqAjDzhrEvgI=;
        b=iWMdMAeTFfuWywMyfnxjdFHT8td5+vgwnH7WljeTSnW7S5KkAo0/t94bBHd0/pAASM
         7dNWE0MG7Gje83vTBR6WtRs6dQ9zcgHjR9fH7PEwZ+d7vBdSAfFGU1m9gUGlXyNSDiEI
         OXQ6zMOrVfy6JCQeBvXMRyWyNEcAeDHVFqnPnASpn7we0w8Fg7i/7Ru+Nn4NyZYD1O3U
         8EsepFCt/vbESOXO+hFXspwinLWzP9915md7KGg1O4Lxs04zNkg5EKOhN36UX7IePK3c
         91K1dsl7sTeprn8TDrwzBoOmMYae4xW4omZEEprICennn+vyVrqYG0KUUvYcmbufYe7T
         HhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUEb78uhQWP06YzF1nsI9SnZcc+VYt38YR0W1xADIC2uVdAtw7A1eFxHDIyzaGpPmF4Zm5CBEJardv0eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTMg3NAXk+JVIev60iOYWyOUEJt+PUKnSprWHQtozFZL6H/O+7
	gVW2Ep6ilapkrR/o+x/z+vvolAMCXK7u2OuPXwdWFVX1deD8OLR4xV6gcy8IG8mfOKMFZznIEXV
	i3FjXnrnaFUGatL+1VCLocQvwllsKDu5+4Q2QWzx+vTbJ6J+HLpfKDCL4URAdAtDCABI=
X-Gm-Gg: ASbGncsJYiU4MfvbK61mUsVmWXKWooNOwvM0g/JnKQRwqZrRyEmqAJwTsNeBnCkQKUz
	o1vBg/yOh1oPqN8Od+7fQ5trzAOHd+uQ0OSL7s6Nl1O0oWoozitv43dGMmLkEtGXEmf39JYtR6e
	w/rF92tFOAm3EO9UPajL97L8KJXp3PhY4bYGGZlsy0ryB8H1KnVL+VOGww/ZsQzKubyx9OR0W3F
	EUQ2xNWGriWCiepd+hKx4RDTj2o/crElscl1p/1OF2QfICxm1P0pxRyeQR7FLcvqvd8+8WNHNXu
	UAtqsJ1mz5CmM/uKg9tkrG3PSa8XXhXxm8xGM/vB/yV4Nda4KH1aBWb2lvNNj5mDd+WLV/oP2MG
	FYQKh91j51w==
X-Received: by 2002:a05:620a:6002:b0:7d2:15e:1f9d with SMTP id af79cd13be357-7d2298e09camr1663711285a.53.1749400111670;
        Sun, 08 Jun 2025 09:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWEVhJTgeAz6GkYxg5OuHTjWCXP5unAZCBf7CnVI5/FdXNXAgyPWDZnu1N/SSMsH+pLdql6A==
X-Received: by 2002:a05:620a:6002:b0:7d2:15e:1f9d with SMTP id af79cd13be357-7d2298e09camr1663709485a.53.1749400111341;
        Sun, 08 Jun 2025 09:28:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cdddsm7492251fa.21.2025.06.08.09.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:28:30 -0700 (PDT)
Date: Sun, 8 Jun 2025 19:28:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/bridge: analogix_dp: Move
 &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
Message-ID: <a7elluf2tvemsrvdomzb7mfiztpjcsqjlruorcf4ua63rzq4ut@4dwnqdv3qins>
References: <20250526120742.3195812-1-damon.ding@rock-chips.com>
 <20250526120742.3195812-3-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526120742.3195812-3-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEzMiBTYWx0ZWRfXwUVtH13Msetb
 R6uUan8cETfvVFQDsfth5GBnwWZ9U1sWPzedENQrDQp4os8GSb7KyU1mkLwg41MuiA7G0ieidhj
 9y7fZn8UOFKc3mnWI2FY7le1B32JCtXeHn5VLAabnKfLriPZXwI9KKHCx16DJgWy2Q4+UpzwdID
 1nUtAFkxX3OQLcXQyPmCD3nMyHybs7YvbjQyMa3eOljg0Xd+V1dpWUFY6t6fWFrRqNm4qKvJ7yL
 NyCB+Q0P0imrlBY0fDvAKvutrAQRpRrpNnOV7aW/oyxbLZdeyJ86v8oMUOQigC+3OazRwuBtzVh
 ExEjy5LT74ynPlA/91UjZsx5/TgWUvo0xaVeZB8ZDpXtNwfOyzw7c8AsaXPrmvWDujE1TD598n3
 HG2pbRuS1M8si9r3Io9mo0sk6dAzJcVPClwLuhWcTdLtdAbUmbmxw3sw1swmVqyeKWTVrHNY
X-Proofpoint-GUID: SlHHP9aUJ8yDSSe52XE8hHiBDPZRbU9S
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6845ba42 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=cGmNtDV8R6BPqPJYracA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: SlHHP9aUJ8yDSSe52XE8hHiBDPZRbU9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080132

On Mon, May 26, 2025 at 08:07:41PM +0800, Damon Ding wrote:
> According to the include/drm/drm_bridge.h, the callback
> &drm_bridge_funcs.mode_set is deprecated and it should be better to
> include the mode setting in the &drm_bridge_funcs.atomic_enable instead.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 161 +++++++++---------
>  1 file changed, 82 insertions(+), 79 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
