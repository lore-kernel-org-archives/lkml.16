Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677021CC49
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495234; cv=none; b=OeKUbj8HYxIIqnanLt3yk6PA7lGfgtLXqBD3w2TPXiPGPxW/a/Qn630iasMJEPE2J9+nmAMGncgEuJrnHu8PVUFDr06s6ohfYROxZ8oqcu7Do0LGXneJkq/21rqyn7PAdLbU5vmZSkx/BdVAjZUfa43XEyBvSjPrDpMfgHcpeIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495234; c=relaxed/simple;
	bh=WTeTaiz1O8JErmK5BznjdGySVgRuOdYPHMA4/9ZcsQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWg0Z8d1hXZNif/fL/0Chf1v0xzcQSe2VK2osoMnHIWz72CsUBczaab8lTVIWlJYUZ2VKunmm78OFOR6JsEK6+ronc3RBIhjxr+DAFchtwOPduc8rSC2hGByUmuRLtvIel+Ta6g3l+O9+cwM8oIV6BFjzyf6Fq0J0gxRHG/iQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGnIg31z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGnIg31z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55993xn7016492
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 18:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NHliooAu2D4LpcWXHN+HBfm7
	iZs/qYaISZWRr/k1xUk=; b=JGnIg31zNhAteI1EkOQzp4XCkWV7assJM6tswIEN
	G54rLlP8u9WCaBoujComgmt4fcI5a/uzYVuvN16Gr4ftEv0dMnz7wxunpY4u2d/U
	EBkklWw0dQAV38jZDDGUYDG/+gtlLAV9h68AogPWpdVtQfcfsnqblyjQr6w34ms2
	RPy/n4+DJixtuJYeal0wCR2JEHim+V2UXSKHMhilf5xwl4CvLuhcIcQ3IVqduToI
	xNVRjY24K3OrDBx045f/MSttMpJI9EWpWXKhiwAwa3oMyKPaLFhZIToHzW2Rug1T
	6tQdlyvHHQz336fETTHuH814x+bD7vizNoOIhS5cbYsrSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcet2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 18:53:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so792754785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495231; x=1750100031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHliooAu2D4LpcWXHN+HBfm7iZs/qYaISZWRr/k1xUk=;
        b=oM16KIXEFssT77DVGsb1qMi6g45EwddTZfYTYtOmtjQ4AqQnGX5q3y74ECfbW6c+os
         VrT0sgSNIRdMfgNUvGVtUbdIFTvwtWM3o5230X6zv+kTufYf3K5h9YgxoVFsmlcKfXli
         KTctmaZzJnI2SIhh6QWrivuDze9LMku5r32KXToG/+1gYgqwrHU3tq5ScVhrgCImNA1X
         q0mNdEu7CElSvgeVB/Zik1CLcYVtvzwydBE4If4Xgpjct5VkvbZJrkIHLbPVeKg2M0oX
         BQ3VJVGlAjG8Q9hb2BiVEhaN80DuK4hHU8kIyxg8l/spxl3TInvGjLSaz3wksTlwIlHw
         XBdg==
X-Forwarded-Encrypted: i=1; AJvYcCXEDrT0mFCK1ql6dAqqHHZvo6X1K6z2R654zvX1RiumBzBG30Xj04xisGKSYmcgkbq1KExtYNydAleFIbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIt5gtcPCJs2uJX5YHVD+TzR0bq1WnZu2QFIfvvR+IUSY1Paw
	HogixRB63DKg7zdNr44Qr/numJpdus5guJ1LUWRvohZB2tXAso7EZsF/833YiJns0iUrDC/SWRu
	ksIR4hLAOJkI/v449WXdQphX48LQChHk+Y/Cgp3m8avAYBtAxfjG6UmwrFPMwrK1HCIk=
X-Gm-Gg: ASbGnctO1aAseHraKt9NAf7mIWOxsq6zI2K3XehnweT85+LMefsRiKb1kdWqESXqW5p
	vjuAQqOam1r5TeeyoswAavzW9Za43xVOOvVS0hUoZ8uO2VhTeQRL20Ib4SZpTynwi94FBZw5Rm9
	6xdw2NHk4KU5PTHDqlHpCwQx1Rbsf5T6eX5ElDSfNlXqSI/wngdPj+U7kk9bqhHzxdGtFmW3Qeg
	ap4qKrDDHakdZcDEt12WNgMnrPnG7PrFncA3ypjYXu89gK4m5PnF762tKsuuVV0FcZaoAW31pcQ
	8UnfYCBbIge9b3FHoc+V/FpqskFkJay7M713Zxf4FZWVrVXlBZuUYQKgF9HLDiLUUAc+oF5rGCQ
	=
X-Received: by 2002:a05:620a:25d3:b0:7ce:eacf:2de2 with SMTP id af79cd13be357-7d39d916949mr99771785a.18.1749495230959;
        Mon, 09 Jun 2025 11:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtIIkeE+jUOKg5twgQNoVG4HlZHhIGny3CGSf0sfM60CLgazcDQ7e4YRQfO6mYFdWtw6DFeA==
X-Received: by 2002:a05:620a:25d3:b0:7ce:eacf:2de2 with SMTP id af79cd13be357-7d39d916949mr99768285a.18.1749495230583;
        Mon, 09 Jun 2025 11:53:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367733280sm1276221e87.240.2025.06.09.11.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:53:48 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:53:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
        chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
        shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 05/10] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
Message-ID: <s3vgjus34zsksqptaeuwgvjfxnnqp4ccdmhhhjpo22vzprqdly@kkohmzkriula>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-6-shiyongbang@huawei.com>
 <j23q7vjp2s2gfautba7hcbvd5vrrycr5akl3m24eu4nlvy65s7@5uytzwucogxw>
 <28d7d9c2-8498-41a7-ab37-821d574fbb2a@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d7d9c2-8498-41a7-ab37-821d574fbb2a@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfXx7SMlNYhSBjr
 gm/mDCGlej6Z6o/SgRMvdtKt6A3szm278jW8N9BvWkFiXCOqWmVsA3JEsq1wIAcPR0Pdqu7SBJW
 gAHILu9rn4CV4S/QB+7kW06nDKJ3PdM6wi8ZGhEz/OyI0FMX6ksgnUblunRwBcRG3YD4oV0oleX
 YMYWc5GC0ZbhzzsThtSecLXAS8KxqsuRDZUqm8e9s29fP3rv514vnYqSSmuPbGoQE4F9mn4Mdq7
 Pc3Frf+byWKpC9XI32iyR1q2Kt0W9Qs6bou80ZiiqPB0pWXLbSUjUS8wLre22XkztuK1xeY2ySV
 9tolGgOH/syDe/JgUS60WYcCzxEDjg2XauonjscIZOQjMmbQILc7iO9MnJlV7je22ct6iJ8pQQd
 KB9CS1EoLKDc93iSRZdmUhPA0BASVEwxahoN6HCVpDcpI7PhR63L+i3be9f6vucteGnKVUgl
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68472dc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=JItdSXAVqBTXEc6tNJ8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZyHlDF7LT-vJeDXQoctoFmO-aXUv0jJn
X-Proofpoint-ORIG-GUID: ZyHlDF7LT-vJeDXQoctoFmO-aXUv0jJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090144

On Mon, Jun 09, 2025 at 10:56:09PM +0800, Yongbang Shi wrote:
> 
> > On Fri, May 30, 2025 at 05:54:27PM +0800, Yongbang Shi wrote:
> > > From: Baihan Li <libaihan@huawei.com>
> > > 
> > > DP Link training successful at 8.1Gbps with some monitors' max link rate
> > > are 2.7Gbps. So change the default 8.1Gbps link rate to the rate that reads
> > > from devices' capabilities.
> > I've hard time understanding this message.
> 
> Sorry for misunderstanding. The problem is that dp link training success at 8.1Gbps, however,
> 
> the sink 's maximum supported rate is less than 8.1G.

okay, this is better. Please update the commit message.

> 
> 
> > > Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> > No, the tag is incorrect. Mentioned commit is not related.
> 
> Ok.
> 
> 
> > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > ---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++-
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++++++++------
> > >   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 -------
> > >   4 files changed, 27 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> > > index 676059d4c1e6..8191233aa965 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> > > @@ -57,15 +57,3 @@ int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
> > >   	return 0;
> > >   }
> > > -
> > > -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
> > > -{
> > > -	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
> > > -
> > > -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> > > -	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
> > > -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> > > -	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
> > Where did these two writes go?
> 
> It's the same as the cfg in hibmc_dp_serdes_set_tx_cfg(), and this function will be called certainly.

ack.

> 
> 
> > > -
> > > -	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
> > > -}
> > > -- 
> > > 2.33.0
> > > 

-- 
With best wishes
Dmitry
