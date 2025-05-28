Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DB28CF68
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449042; cv=none; b=HnUXakNOaQEVOiwVQ+Exa0v2RKlvQfDMnAot06L/RmAMRhj3G3PJkpH2qFBdPDq+uA1uDZrKfTqL+jko2ePYZicqCz2XVkmKmoZQD79H/CuWYC+nkNz307mJ+BXuvkE65UDwUPCahpyeN+9VqmpUWpQl0fW3DC792GIz9Sg4cOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449042; c=relaxed/simple;
	bh=8y2x+LUkxHKZ9G/Vq2dyw6iBXf3X7n+haN5ROVzStoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWA+lm05+oGf4cHciIVgAHn7lK1riWlxFeCmPIMlrh0mgq6bci8nJpRdpytMRM6MJgiNTtTd0pyTiuet8OHfPEVlAxL9bL8szmfcZHq5XNRwbdwpu331r6GlVhkkWeMgUns00y3y4fWkCLT4cuP1MxHJMtZcfHtnCCWmT4YYTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQG8jL2K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQG8jL2K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SFnaeq028874
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VxpVLFBQGSAU+ebxYoQdGVlC
	qZnUme8PP63pkL+w6mw=; b=HQG8jL2KEaz3iRI7+/X70BOGq0pySi6cBM+txh6p
	wwfS2VZ87Whfg9qHLepHGDouRDd+QwZHiq2TCtS3T5HrXpxyPZ4/QUEwG1Qq0fTy
	qcwoRgB2BVUHGd1rP6AjofhexVwRmoH7LbceKGqCzOdnpXm4PGvlkanS/+sB/21l
	axt1rK1+T7z6M6WJy+zTGfImJxTbM9Zpgoh/siYhtXDu0qbQdbOslqAp7G76ml6j
	rDYYX8YwkfBsRCS90CxTlvEEhsz+yeiw4L+z0UiAOa12GFDZdpmpBLl2LvL3snPu
	yQUgCx/hRIHs2NMtJdRMO9qC3SM5ZBbcgDo7iq6hVtIgHg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf37k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72ecb7f4b42so2988a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748449039; x=1749053839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxpVLFBQGSAU+ebxYoQdGVlCqZnUme8PP63pkL+w6mw=;
        b=C60I/q7LlWEEGNmLU/T0zNp/e2va175uaCvOiajpdVFZBvnIXtj8GrLm9FcnwdvW2H
         4XCxxVpCUtW3KY3nQ9F/XY9z+o+B2X89emkd6BgZ1vG9D8Ff1xlFjBp+kmBdBSK1a0Z6
         nzmQaRvOJ/qYkzXfkxlEfq6rW6FPPSec4mGlCB51hVp0vuBig7GWwqY/BIEqckZgarD0
         IC4j+sdB5drDztBw9udIFbKUMIlAXwrAuoZjMzUBIPJFH8GRFtkSlum2ZMjYcYPdIpLN
         PKbxV6XT7aKrjiiWbCrxVm7D2A1G22Vu1oDtm//+4RjcWDbsIijwyoSGfeOX505UbA9r
         kqVg==
X-Forwarded-Encrypted: i=1; AJvYcCVqDlvNAx9I6ewnZ+4jtk1ZdVn5OhmPG3h/ZvKzQ/Od3q3yMILnYfATxXctbRgmnxYMemXSz+o+5As1OOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJgMkmQhfSEDkGgvRlgTddYHKbeGroaJnL2KIyBVhyIYWZFdr
	eVsJzXj2m9S4w52NdqTjKyExTtiQE9DDinTwscm1UhlyU/0FIaGJ4hM/qF20xd2eveOs6dVUaCY
	ZZlzd5F0MpU6c5REpB3paruKIGi4Ku2wq06tiF3vE6MvOf/oYNNXxTZ4wGAa9TInEQcw=
X-Gm-Gg: ASbGncvpkYLYsxSG/0z40b+4qMlUJSfp81hLaq8dJxMV3Fb6jvgHdQLJMii2D9z/ms3
	TuHdHpr7gfR40ouPJ2xjHcZ+8rT7HQXsWwN1j+wonc7dwk9+W0YyqXqOer3kHGW5qZKpom5GLhC
	JRJVcXp5qAVfiX7L47q2yj3oxy0bEImhoiaMAC74N22d6UOJLoc1kDCokN0VBRwiE9iBKGoXIlj
	YOTfoprHr+ySmCvJvT+cUBd2WxieIPF2Jqyir2NCE1FUI9m3QqGri3xmqysn8iamiNwQBjGlnJ9
	39j7CJ2JSskXRA7yOn2mAwomP3XebWgYnTM4T5Qr/SVkeNObJ6iW6gVgO91JsH/Ua5GxfdN+A9w
	=
X-Received: by 2002:a05:6830:7010:b0:72b:8326:f0c7 with SMTP id 46e09a7af769-7355d1ca50emr11492058a34.28.1748449038817;
        Wed, 28 May 2025 09:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHymD5QPdG3sq4BRZVWcnUYrodeFvRGV9A9NykcrdI34F0kJ6xyyBvUoKiYlRqJdH2mRLZZDA==
X-Received: by 2002:a05:6830:7010:b0:72b:8326:f0c7 with SMTP id 46e09a7af769-7355d1ca50emr11492023a34.28.1748449038359;
        Wed, 28 May 2025 09:17:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b39dcsm340216e87.215.2025.05.28.09.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:17:17 -0700 (PDT)
Date: Wed, 28 May 2025 19:17:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 17/45] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <ujrlphqfh6j6n2qz7wslapidmwacnj32cgdhwahmqpjpylmmk4@daraslg4fdk3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-17-f8618d42a99a@quicinc.com>
 <45awcx2az5m5v4etpuaycqx2dolzjkrcjg6ehmooivwuqb6ac3@euo7rsoccqup>
 <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6837370f cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=aWFAwB44HXOIBnsjnyQA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -wM7JMRqsIYBis-XIVeGLDNHdk-HWQcZ
X-Proofpoint-GUID: -wM7JMRqsIYBis-XIVeGLDNHdk-HWQcZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX/e/F4LLQr53d
 cJHdawOXEajSVtiHxTHEuMVM3s0Fq8AvXcgbjKfDP7OBXpypE48zw/nl03I3zmGhzBRUMvWKB04
 T58FNXcsAO/NvCo9zwddRZ0Wjl4tcww/IhnSXILeccxIC29yqg+ZDXcH52wgws6WdMk37R2Jwl7
 IhTyo1W1urnOg1Ub6Ex4jgqHcx7sHVbVmooHZiXXF2Um4vPXogyl9TDMwz3SP9F5rFNoTgrdCaC
 KRu3QdooeZTtN523+oHM2kZc42oKaK23W3v/S9GB75UwGay9i6W3OFmaWnZzJquxrmfUxQVQNr0
 Joxz9dLYdKKHCsySJqrsrTJN19PzgAoamJEU0RgRxMqbp2ruIJtWsKaQrqeRh1RmH4kQGYgZSWb
 Z6tXxixsH2fRXSGTxNzk2jUJqCMOc5F7/7ZiMP19DU8i1FpOorPuiHq5DlHvSLVlTTVVVZJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280141

On Mon, May 26, 2025 at 08:57:35PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/8 13:42, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:48PM -0800, Abhinav Kumar wrote:
> > > Use the dp_panel's stream_id to adjust the offsets for stream 1
> > > which will be used for MST in the dp_catalog. Also add additional
> > > register defines for stream 1.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_catalog.c | 99 ++++++++++++++++++++++++++++---------
> > >   drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ++--
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  3 ++
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +
> > >   drivers/gpu/drm/msm/dp/dp_reg.h     | 13 ++++-
> > >   5 files changed, 99 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index 172de804dec445cb08ad8e3f058407f483cd6684..662bf02b8b1a5165f927835bef3c11ac091ddce6 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -309,7 +309,9 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
> > >   	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > >   	catalog = panel->catalog;
> > > +
> > >   	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
> > > +	catalog->stream_id = msm_dp_panel->stream_id;
> > 
> > Why is it a proper place to set catalog->stream_id? It doesn't looks
> > like it to me.
> Ok, maybe msm_dp_display_set_stream_id is more proper place. Or can we drop
> stream_id in catalog totally, and f the stream_id is needed in the catalog
> function, pass it as a parameter to the catalog function. just like that:
> int msm_dp_ctrl_***(struct msm_dp_ctrl *ctrl, enum msm_dp_stream_id
> stream_id,***);


LGTM.


-- 
With best wishes
Dmitry
