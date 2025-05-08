Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4B98F49
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677005; cv=none; b=O3k+F44VjPGlIfzi1ojq6rTaH2XB41dbrFVxV029vV3fQFzLQW86VgrqAI1Mkg4FC/ODg3VWQrNfx/o08fx1y9TFPJKhLeLLCvwTLGQ+sUejcHe1X4RzkknRPa/qF9vSQMf57vP7Xij4aN+je92RobrryTSrRbWLHqVyZVFYKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677005; c=relaxed/simple;
	bh=FdXcjbEbad1MvTLMck9BvVGpVGwxPcY9ao+oUboDcco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=up14gkKcvB/fAMT2HcADfjL5H1fwPL4BuPT4bJmUHK1PaD4Hq28Pqqz20/iUp4ngYq2+dPuvfzepPWqvMmwQpdx2/3PcqHVp2yqFaHqMS2XztRjs2rR1nTX4X8YUxQk/EXQ30vCVMkG1Ge/OibO9rtckekuNOi3dHIF3El2mgRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIr0Em04; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIr0Em04"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5481CwjK030164
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 04:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WFGwx5PZ+G/9BxcVBebd00iL
	tXeXpkwlaZ/P+6/sls8=; b=lIr0Em04WtZl73eIUNkTUGI0JaqxYlvgs/JLqJlF
	OJhiYw3N9NXkePvJM+V/qosXsoViXifU83bw3AIlcsfYzv5h/XR6V+aA7ckOnLPJ
	qjcHtdVMCZsAsHltv5hCpRvjIxk1Yv1gzW9ILZQFAEAKq1QsnZjzrkt7xEIaLDOR
	5tGH9wJ7jz+Dpb/dKf4PhG1HRWcaQJDlCdxvWZLaHEb17IEB8I294Ub8XbDcJ61t
	6Cp/7TkAlYnHUxjg30Rnv3OCFnKGgHKHrQLSbZEagbeooCm3GylYAawzhQmMH0rv
	Iikx67Uy8lFxRjAJf1kWRMw9YvzAD95kbXTTKfGs53omiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g0kh3dm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:03:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e9f6e00so298816985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 21:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746677001; x=1747281801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFGwx5PZ+G/9BxcVBebd00iLtXeXpkwlaZ/P+6/sls8=;
        b=fIwU3G7zPl30X7yKJCSbgOQT03bZQzBcgTianHuH51Hj2uRE1w8Wge/8eXgz8xnqtR
         TRMNNr6o4OfxV8tCpnALwdRrkVtkXPRpY9R9q/Tvj8QAHVE0uxVr1/2vi2OSVPfuNRtI
         vE7AP3bNz0EN7m/GpYjrunBZN7urAJjSNPMeciYNVEV09laMIpXSxhbtgucSs9LAceyP
         4wqKO++m+bPLo5/Tjj/gxPIpJx0N0/XfE8Z/xHpe/7jfllTUSIOvdxWqWOzfsR12Qcyy
         Ko9RQK0MYT5zwlfEp1Pb2t9JkzawsD3yKRFsMz8m8Obe7qXtw22yZOTU8HYB5Y08Uy99
         zikQ==
X-Forwarded-Encrypted: i=1; AJvYcCU16BeYQZPG4Q4UlSnr9ywW+FowZP0jhAfmm+oCpJZJPUYKPyoZBTNjyohDN+MaXKfo5nS3aBwx7g1WinI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKCw+pMlMUNDE2RpMg/yPCNx9ROUGKTpE0oL1sranAYZQaNfVo
	tj8WUEwD6zhI4Kn17eJm8LoEYySjWQvKi2jVfregTgStyJ5OdiQGGfnWYRl6aUL/LyD5+sef2GX
	MdvBIQfU7tpygiml9xzq+GY+rnHTVFqmaSNJrUwd/5xCPTobPA3C9NDqLonjqSKU=
X-Gm-Gg: ASbGnctu3I5e1CWfgDFhMgnEii2cy9AtjB3zlAR8QtT0oQNtodHGTV5LRSUa1JUMV0q
	GJDYMwIqbpCs5G4BAATfXrL6Tn6R/rdCq3pt4LQ9BKzb2Y2plgvjwQMlXIrvrIhVq0jwV+UdL89
	w6By2zieQy6N+UuPc+XKFHP2rfMY7vQ0D1Nf9UMpLzB50FR5Pu+3HVRbL+AfYo2XLNT+zRgShUA
	ZerlYukJ2Hn73aRhK+SlVnezYLb8vP4tLBwb3N2q+ULIiEXkaJ5G55HczDrc3d+hHQu40EASCCL
	p6MTqoTwWMfO2IInoQN4nBgK1fUnAz1gzHuJ0teDgTAHhpzyVqVPzfNLAqWiPHyx/ehsj84uBmc
	=
X-Received: by 2002:a05:620a:8002:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7ccf995e1a1mr366750785a.7.1746677001641;
        Wed, 07 May 2025 21:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCvb8VK0sMuvhaF34y+RLN/zFk90fkQ04v2q+mJ14cJV9oLuze4zWQomR2mbFMyLbVM3zhmg==
X-Received: by 2002:a05:620a:8002:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7ccf995e1a1mr366745985a.7.1746677001155;
        Wed, 07 May 2025 21:03:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b38ef2sm23996481fa.23.2025.05.07.21.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 21:03:20 -0700 (PDT)
Date: Thu, 8 May 2025 07:03:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on
 additional 'port' properties
Message-ID: <fvrvrcqilnhma774kkojytlgwglsvgaxgukm2fc3gennaii4jz@dufjv3obqc7b>
References: <20250507215912.2748964-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507215912.2748964-1-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAzMiBTYWx0ZWRfXyEqX1JxhOCN6
 isty4uvOrVRQhPeQFYAYOBSaZeGmbCvdyBcqgslhQeZxDd11Y5eo/yTHa+g7Cv7Yxq99zjK8DGK
 I03ly+MPweGEGi3zp2jH4Vgl7IZpZovzrE78eg7ZDMjlHIfsFkiP31UoFmxolnwGY1NVE4HCsql
 q4NnBOSjuk0xH/WTeyVTVuZ2PTrRhrYAo3ImfIA2tBun167o12d6be5C/z/2vKa1qxwY/17AIT+
 D8FcMn8rs+4Zua/G5Tdb9Ekzg6nxOH68B3yiyl3nuxXvRYpzzmN1tMbebQyzyG55G2xZ6a8YgBv
 3FtRqaqKMCbO53m2ZC750XVF53fsqLT+0R57tPq8BI0VYLKaEHgDilGFmNJGH71WzGZGaOrsoZ0
 R3a2iwrOIPZhz3oKaiZpvNDD8bBDiyEbN8tosPYOCfbWwEWghJrDz1tSAdrvj2xy7lrD67Vi
X-Authority-Analysis: v=2.4 cv=PNUP+eqC c=1 sm=1 tr=0 ts=681c2d0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LCLtBpLZ_J7SsqHOqrgA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eLbVk6VjoRZBhVgnGkzUNEyRgdsCvD32
X-Proofpoint-GUID: eLbVk6VjoRZBhVgnGkzUNEyRgdsCvD32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080032

On Wed, May 07, 2025 at 04:59:12PM -0500, Rob Herring (Arm) wrote:
> The MSM HDMI port nodes are missing any restrictions on additional
> properties. The $ref should be to "/properties/port" rather than
> "/$defs/port-base" as there are not additional properties in the nodes
> to define.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I've verified, it applies on top of msm-next and produces no errors. I
don't see a meaningful error in the bot's message (Rob, is there a
chance to fix the bot?).

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> index d4a2033afea8..099274d35680 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -89,12 +89,12 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: |
>            Output endpoints of the controller.
>  
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
