Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C001FFC5C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742222; cv=none; b=fpiwT+exZ9GgfCU9RQba9Rb3HZnb+iVnV5U69zv8tEkOrEwTOC3meUJiy1ti/IP5UONNuk7P+u79Ce6PiSExORsz8mzcrW276iLnOuf4iNWaN7ktGNfNuXgQPyIpqSEwKPoRQuq83EptkjzSqjq95Tn/pvn3sFLOm67QhXtHuo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742222; c=relaxed/simple;
	bh=RfIuAGIj6dLl1DEfieXVuIFqQdC71MZ0VI+3LCuBIDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ0fBD3eBwyR/HO88frze0zWfwJFA9u5DNYOypkjHVVyNFMqMN4ZsqNZixQ3zPP6LDjEFZNOdqrZHJMnTLEJy8fcPwvOCFqjx0MrexGaCuVTTH4JVobMBnIyHN18bPU7JLsYHeqtmtjO8Pd+NQGXo8xkymqVPsNrSubMeWq1lZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0wv6lhy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0wv6lhy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565IpVma027537
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 19:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8q4VDNuv+lTz++Hj4cg3JRc3
	ES3pigSZR5L1Dth8S6o=; b=M0wv6lhyLOk9KjH+anExLUf3YZ8VeCwUOwdR3Bo7
	zAXwWPDqWFqoXejvzsO2a/7VzSaFfLt3mCK5PMbXbeXGjuJJ8j7woXhZNoUGm2DX
	vuxdMY708L5HqtCOCp9WvF94Q67g5g0koMVlbLXGON+VlIPd0KIGOAB9MO9U2G6R
	bD45Tx7nKuOWo2xZ35x1qcdK1JLTe0B28huBT6ckn9WMUeaHU6FWxU3UMTyNln0X
	Xm9Skzw070r5eqrHycvlI0UHPU2J9Hzdb87Y4lG4N6APE+4UYDo183TlvZc73xVJ
	x71VwsW2JGJJW9ssdr1WZp2PKr+WPRngoDSPvMS5n0WlMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun21vp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 19:03:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d44d773e23so479500285a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742219; x=1752347019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q4VDNuv+lTz++Hj4cg3JRc3ES3pigSZR5L1Dth8S6o=;
        b=wJlwDUSTCMdugwf16OXMtfSgiPe4TTnp/nLdF0XbQXvXpCS51S/uCZMHxIr868zU8x
         5sOcQq33dUa5FFmhebBS1m2GbyeaU7mJmbKD7gOYeU2wmX66syo3Pcj4zYhVbwWY6Kpw
         8Prgz6r6jdKlfRPmn/Rcy8VcFJzKgORSD1cDWtBWKFLtdtrufoUaSGhwYL9YB5erae/w
         J5vTN8g+OtT8Sp1c+A3lm0FuVWkPTbbGg5sOfng3lOJV7mPtzfHD7kyDAhRKgdPmOX2g
         14+Jj584f9XvWJ8vV30QhV4aw63m3vs0NDEQzRSaYAaMRSkGrZzIpSmEo1AMQudv+9jf
         YJ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxcuidmV14IzOq8a5/PRJicZKXjFvwFxshF+vCfg39fcOCu0KQJc8T+WxvwSiW9aY4idnlYOpt5nxvyqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqBDi8s4Qj3EoyVr8ssgEmlVZLWsYm6SUJ8OHaAzAvvt/1UF24
	mNa1C9JYx7wgA2SKaWn/9sXBq/gjx676gd0huVE7MqLk0vgPsZqpCs7+07/2V3LXCTAVAeK5KyV
	a3d2J6T+adTFqpzF5gE23tXRQsJYBPOsRpXd4pPML2UlMrq+T7miJQB22CLtKKMozQS0=
X-Gm-Gg: ASbGncuuUk60HNPlHZ3D6W3Dg2k1nFpjvGG25wqAI/EAUOVw9d8FjGE0N8ezCvIi5hd
	VPBhRbqs3iOhoXaKCfKQd/LZcecigpNh9Tlq1mAXqZUdQTd5zfTbnVcxwHNG/ks8/u49mDwz1mI
	mKOWWBw/6cOhTXPDpPnWMECXtTr8ir3VlAfcQarScYu9jI471LpwbD+ANToM7pjBGVX/u4n32sh
	0rGIvZVtR3oa1PJ67st3R4T5QAtnsZgA3G1000ICfMoZeDoWhJtHQCEprhQIpLO0awYMd3g3nlU
	2FoY7qM5CBNrOCQmVvx6SNH6JoiqPHtoMv9ebJpxWLNO7KbqEmVgsmMHXC75nO2aU+bjPy6btt5
	xml4keX7xwr9LAMxycUC+x4JtLgQ0cj3YHos=
X-Received: by 2002:a05:620a:bcd:b0:7d3:f0a0:ea5f with SMTP id af79cd13be357-7d5dcc7c62cmr1103491385a.22.1751742218979;
        Sat, 05 Jul 2025 12:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF19XFlEGYAHUbGIEthO/IOLfFvQhB8cKUCELKspVjO4UwVcaSNb9XwZOa0x6gNmC/3nkfiog==
X-Received: by 2002:a05:620a:bcd:b0:7d3:f0a0:ea5f with SMTP id af79cd13be357-7d5dcc7c62cmr1103487285a.22.1751742218571;
        Sat, 05 Jul 2025 12:03:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f78sm678524e87.129.2025.07.05.12.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:03:37 -0700 (PDT)
Date: Sat, 5 Jul 2025 22:03:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Fix kdoc comment for
 DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
Message-ID: <z4lprt3wo65mhnkptlrw23pd6m7coamtvj244zjwvltpbe2htu@bigyhe6u6x2l>
References: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
X-Proofpoint-GUID: FBUs6gd8UFKdO2DD7wDUyQxNciOeeiEN
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=6869770b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=wdqdDu6gfy1NOTDC_OcA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: FBUs6gd8UFKdO2DD7wDUyQxNciOeeiEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNSBTYWx0ZWRfX/OFkWEN4eAfR
 HPUpYB3tZYahcmeImc4nFnn2vcRXW9cdqrLyLxFa4nQfGn91g484msp+iAZ+2xFrPKSC0c7r9bQ
 g8jzxUa8O23XTqEAIqbZg0iQA9wu/KhDV5nkm4Tsk2sm+0B1D+9CpYLj/xncl5smG01gO+KpCeX
 hQQd19dJ/O3Gllhm2OuGYjEnq55z3i6l8+X7a0FIPWnoi0sLq1VDjnPeWJD4cjbf4Cy0SaZsxq/
 mgDZo4i8HDVFJrd5Vngg5BPS9C0l+gvcxcuEFTMTF7qs3XxTb72nGmGjpR3ooa9sg1UT3mO+hkm
 Tqq8J6b6X66pp99BH8QZUtt7/43ciQB7K7TbI4cc4UMsjSDfToIMgm9CiPkg01iMufAJ7O0Knt0
 TSQTmU97NQTkTF3cASpebe5vo4cD+SvRPQfSW4ivOXImS6X3EDq1aS2Q5amQ9xn72By87ZMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=811 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050125

On Fri, Jul 04, 2025 at 03:10:45PM +0300, Cristian Ciocaltea wrote:
> Correct the kernel-doc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER member
> of enum drm_bridge_ops.  This seems to be just a copy-paste artifact
> from DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER above.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  include/drm/drm_bridge.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
