Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F741991CD
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743358630; cv=none; b=mYGoT64zQ61a8B+tTywj7w+lBJpxxGTyPiZy0dNDYS5ZEVLB6zO2yyeSSUFLvXsiMbiHa94L0W8Wf0nO90i+T9xeiBrLdYWSaV9+nU9k+mqJhORLc0V2hlKrcAlB3oCLvvJZ8YJrJ5uioAs1F6B18ARUGccVxamc03DjZ2c7PWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743358630; c=relaxed/simple;
	bh=6UylvYop+OEXgnhp2SlA5a70VJf2UCbf7wjxmu0fM84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjNuTPWDC74fDU1jMUU3CNua6RAdEqduBdGZZhrLHW0l1IfUWsE1V8jD7wJN2C5pt+guhuo6mEocdXvmlIwxk5oDBAK658mUeacbbob4ToMgbwl+ZwcLrkp3dYD5sf9TIGyovxG9ORnZ2c7WNehUU6vjHhts4dYqLKuMsShIENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a298Ave/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a298Ave/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9rKEZ014451
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dcSksA11RlOYohkA60SYzmtV
	b9G/fNoYNF/FlKhWLUg=; b=a298Ave/aiaZ62Jo76qt4r3+hYH5USThmjwt4Idk
	7MYrE8ogftZH3RMVB0dRC2oVCKJM5osebYZsAu2Lr7/MlVz7x1p+HQccxGfwpRz7
	BwTFmXdrSeCcZLZ8WEQioiN1+6Y/zRMikdPWMSQA54DTCqOs9Mjr86RPF+irb7Bo
	vgD9wtaRuKMJAbEc8yN+Sz6zF+pVxzAf7wgkzqPES3uJppMDokgseur1AdW6rrvV
	fB9lhcs5uLya6DMZxDzu5GnDO2CGYO+yXGDU8DXBjIGdGKl2d/lMRmgBOxqE++9w
	L//Spgf2s4pgZxBNdMO56RsyVBCFoYSL/6wzIvGQIX37cA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bjh79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:17:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so698658885a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743358626; x=1743963426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcSksA11RlOYohkA60SYzmtVb9G/fNoYNF/FlKhWLUg=;
        b=dDeiXYpt5B56Heyj4Byds6C3Sf0Ix/EVJUC9TLAWQkemhOfrth7X4BBjsPwnDb4Y69
         guWVBQmBtxMXhInXEbc/Si8f2deoRSVwqE/6Az8eswplsROre2je7hWEUCRix1igtyl8
         MTS6sTLYk6V7bQ8CtxXiC2TfnzTGMQ3T6YxDh7yTkfVhvmEg8vPeXbL6LZnkN0U0OxWI
         b3fWpph4QY07BH9GhsUPm9iFTbf7V5UYeVfe1gyLfQOjyfUuWoqdGCvtcrgY6kCevheU
         DvFJIfSfjKYZzRaHuFLmGHg95kNjSMZ9rEtCi+wRdX5gbymXrWwBcGNBTbkuMC+ZXp1B
         TPOw==
X-Forwarded-Encrypted: i=1; AJvYcCWslaND/2DNEfehMNBnu3wz4OT4Hr0YmoKPeK+pu+mzzXaVa2BaD6Uf59XK/OFH86pxQYnT8H+R74KozIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEB+WY+IU+BzWFqckh0BujzomnAWCEWf5HoZK9Mu8oCPACvt/l
	MwkWvpMzGvGkRN14vwAGjO+nalM1uYCU1oI1rTHoXgOw6JCNj7vjXRbZ/ZNxqA/HtfdXKEYZtvD
	UJ8ILl2zKkcQro+Y+8DXeNJnVMNSj742pKsdIf7E4iSqc1k7nh7ZfCvOdXmg1Eek=
X-Gm-Gg: ASbGncsvkc82D/XjCmViTHdg2KPU27N8WiVxCE1tqvvnZ4eI0Jx6uingWi7JLs4GDyG
	kjrFNB6WridOiZ9EMXykrdQ6MhD2HWc9H86m1vdvXxL7+H8S4If7R0cVkUEaavc/KtlrN7fzAnC
	nM8rdazJ6Y7af18VAPcVca9hGyFE0+qsGyaXdjk6c9kYuLQ/CF4S1GX791f/gf7031vwH5v2QAU
	vXQUY2zT5TK3UEUqF/jaw2+k5KqeeSXDa8tvQ+tjl7zP1efQI0OaLMzyYZs81LlnIJui9p+93CP
	f8C/sa2YQKSZ+hFr3/9I7kofq+lwY4GLPeMBFF402gaPKdVdCM/cO4+lVEqSc25Yhqkpe5QaFS5
	scDU=
X-Received: by 2002:a05:620a:3186:b0:7c5:50cc:51b3 with SMTP id af79cd13be357-7c69072c8ddmr825385985a.33.1743358626630;
        Sun, 30 Mar 2025 11:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjrCySJld3XG7/AgsGbLsMX1lIvdoId2dpO0+vc7j49p/kntZmwsaPQy1MzMkMt0UlMwFlzQ==
X-Received: by 2002:a05:620a:3186:b0:7c5:50cc:51b3 with SMTP id af79cd13be357-7c69072c8ddmr825384885a.33.1743358626387;
        Sun, 30 Mar 2025 11:17:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09580011sm935682e87.149.2025.03.30.11.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:17:04 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:17:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
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
        Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] drm/bridge: it6505: check INT_LINK_TRAIN_FAIL
 while link auto training
Message-ID: <afnywa3x3nheteid7mt7u6hljge2tensmelj54ztamassmfpj5@7vyxzaprijoc>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-2-756c8306f500@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-2-756c8306f500@ite.com.tw>
X-Proofpoint-GUID: oZWZ2D2kI-f3tl-oMAdHpru0cntEqWOE
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67e98aa3 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=_LDb0pKpX-kM06tvKcsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: oZWZ2D2kI-f3tl-oMAdHpru0cntEqWOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=745 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300128

On Wed, Mar 26, 2025 at 01:34:14PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When start link training, interrupt status INT_LINK_TRAIN_FAIL can
> use to check link training fail and no need to wait until timeout.
> 
> it6505_irq_link_train_fail() remove from interrupt and no longer used.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
