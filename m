Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A92882A7
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440019; cv=none; b=nA5NRMLr78LJfXNwv37Eqxu3BFHLgKT0tmRaeO2kqzJnSltyCZXqPHt8CtgjmeFahcgd/Rif7r70B1fhVW/ETPDNoj2Bew4ozOZ7IM2bN/SQjK6sugisEcJfCVX5V9d5O7KF1jbQAcodOFnO3cnIIB3rDmw5Bl74oVqHdheJA84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440019; c=relaxed/simple;
	bh=RBVICSM8RX282qeCWOc/Wd287XW8yna0X4/TtLvIEf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJiAle5I1Qlr9NG9Q7Hz4d46l9pMK3FRRLGb6Or+vUpnIVDnUxtxdIQRfh2528JRgXTTKi+bSJ0pPAv5OMyiu/dihDv+t5mbKOQiUiK3JMUkXBjGyAsRMwoQtVQ2Ms4D9Q7uUYpH2QLjHwAfvkb26Wlf4Bsyf9VKGPDCFE0EX54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzYmNNTg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzYmNNTg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5ANdq028239
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5hzV+dhuyMo7C+u+YPUX5zpP
	lQzTgz3llouJ+CsCBVw=; b=fzYmNNTgwrqs0DoPvI0SKeeE3FN8BfECbJvsi/Z0
	uH7iK415EphqNWCfHB5TRcHFrkbN7nRluHqUOU8QEHi0YwxFE6feQdPTqeZ7Xxgp
	NQhQgZ8m0PEhoIzygOwYGNjhbSbDOMo71rbs9Bzo3UdHLXB+sSvj+kZStzHFRGTF
	d4/wEcV8cpRYPFEd3HRjLtP0uoVL3qOX0kb1V6JJ4uImYJwWuHzKNjPlX3zf7H/X
	ANwNfNbKPgHDm5k8Laea/91SWlDCaNF6a8twZo4xEmdr9k0bKaocMDKPZ2U/x/Jz
	lvQibPYNLzdbZ+RhisoY4mwSgZ87ZuM/7GTdELhKsJtdHw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992mdqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:46:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabd295d12so13413786d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748440015; x=1749044815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hzV+dhuyMo7C+u+YPUX5zpPlQzTgz3llouJ+CsCBVw=;
        b=txZSrKkzXYWRV5EYfjOy4Lr8/wLJEG34V19su+eKAsNDVo/DPPo8g9+9HZtHP5fMXG
         pIilP94Rh+TDtjVmkNd3ZRCLmWdc6UQuuvUncrHtAkCAh9+8mw1TbKSPgOeLl+OT+gof
         mDf4djoWCbHrMmIRjVGDJjnBe0UcsiM2bYm47rqIt+nHE9rzs7Pe9a4oaXQOcYRQEPzC
         2xC+M8iXlw+dArjz2CeOwh5k79Rl2E32Zl8ygUQTQYj4ZNTxXaHzYwIQ491nFGEZ9I6V
         czWG0jTWLg3e2cqzrgAypEugfvRI6cYbdibAE2ba2RRrdas5husyAf8Xid9RHcLH6Ki3
         N0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmq3Kn/9jfSdh61aeaZ0U8SGft4KK3NO8/In9lNDYhfPRbqUtHb5hjgsh2dOfPqFp4qWvAAuKYjUviQYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLBwCf6IckSk00zcAy8mGRRks0UryzSoi54g7Nl+sngtgIqf45
	6/0aXegfUzK2XnjjCyOVWtlQ51O+KpSXNn+9OaePiVQ8zQtpZP41oJEAyK6GzkUeD9JVQU8CryX
	IWdAgOprOvlCn0FaYPxkpJZ/C5NSyw3ZRqpfzLrxX81paod6ULOCDuytA99lnsMydJg4=
X-Gm-Gg: ASbGncsGHR3GpG0EvZF+zusuqT/XRt9Rng/zsoLTTbhr5IZjbN7CSPpRvcRHgvlQpvp
	QiRcOE4JfAjpNuzaSo/WBSR4nIwe/CORPlbpos+k50wvGQi2546PvX9FbOk5V3G1vR0i2dWj8Xf
	xApmBuVElxdntdAn9fdc1Pxrt44ujPw8NzbPGSHk/ACxe36CAACgTs5lN65ifFuwoHG+SZZjI88
	ZtY34Y/BdumFjf0k2fz4pNpvHurscmpoZNPFOrY30NdiukFbMf7PljGLXLtlT9CYGh2jqYkFGXB
	3hc6EaGQeCNBA9+4cA0MXvQowt4hdMgGNYXGgWe3dYBhkoQ3rghcwWzvnb786lcqX6mzyl6EGoc
	=
X-Received: by 2002:a05:6214:2264:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6fabedbda93mr35115086d6.0.1748440015375;
        Wed, 28 May 2025 06:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX8saC8JowDgKFJqADUdGr+8GS/y//V7WI+R18oHaifS73zDbALgMCfKIS/VbxRoERUhg0rQ==
X-Received: by 2002:a05:6214:2264:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6fabedbda93mr35114386d6.0.1748440014911;
        Wed, 28 May 2025 06:46:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62b0a8sm294266e87.82.2025.05.28.06.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:46:54 -0700 (PDT)
Date: Wed, 28 May 2025 16:46:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
        biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Adam Ford <aford173@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Improve adv7511_mode_set()
Message-ID: <wbja4vmaeqwuoyvfayra6tzik5n477yqaq6v2dmasgtvjlp6wp@bxccfh3hwc55>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyMCBTYWx0ZWRfX1jNFkNNr9RWe
 YgW1KCjz3TVfPegE/ICNq+oPTyob8DernjtjcNr7Tl/A8b3T5aMoURC1MvJcx01ikg0fFDuWQhF
 Fz4hVNFwQGt0uv1u2nhAT0r2g4pkzCfNGDC6OC7H175DJ6tqCHh8Z93fYzeEstA+8lS5907YUbs
 9vn+10t4ALWOvNABG09ErV9cUT2PFpu/Ut46kHRZ0kKisEqOOlry+iiZz+lEMGWRmGL7V02a5iE
 nC+5+lIdvF+HOWTgL9AfYQ8oSOMUwXlW34E/mTKa5XvcHiOc3BdO/UQp3Nv743WDEZ6Mqymx9r6
 meIW7rsn1IYKzed9UCXW3cEg7mDcZcbwpLDB/wLm7UJcggokss81tw4e8WVd75yjz/eD8nuaW5L
 KDCsd3snUm7EVEZQf/qpsjyBwpPRW6SXCi2iWRB0fwgJY1KkUSZWmhj0WObzxX688ieCV0B0
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683713d0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=mDXOUA0a1PfOXZ9ygMcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: E4KXIP734w2EZ8iQX2vfMsCZms6THcUm
X-Proofpoint-ORIG-GUID: E4KXIP734w2EZ8iQX2vfMsCZms6THcUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=963 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280120

On Wed, May 28, 2025 at 09:04:36AM +0200, Tommaso Merciai wrote:
> Dear All,
> 
> Currently adv7511_bridge_atomic_enable() call adv7511_power_on(), then
> adv7511_dsi_config_timing_gen() that is responsible to update h/v porch
> params.
> 
> But during the adv7511_mode_set() adv7511->curr_mode change and this is
> not reflected into the h/v ADV porch regs, then h/w porch regs are keeping
> the old values.
> 
> This series fix this issue moving adv711_dsi_config_timing_gen() into
> the adv7511_mode_set().
> 
> Thanks & Regards,
> Tommaso

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
