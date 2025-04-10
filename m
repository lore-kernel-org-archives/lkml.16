Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BDC25A2C2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277622; cv=none; b=SNEtGa99VJIUhG3CunVzD5yFKCvIOnKIabGrUFS8IU2MFQAPGMDBHg65FuO8cqr3T2+53a9nqREFL4g7K5I53Y9IeyRPDGLZPELGx4+P+Qn/69yLyuGDcTtfttV/nCCby1tTPO78ADFBvUadBYNuBSFkaitjpYGNOfzDdtUz0Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277622; c=relaxed/simple;
	bh=VNQuY7QrHC1LxihtmKnHObDiJBPSMa/La45R8PU3xSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKChuQ0ji/jqLzsN+9lHkxR5jtWc33fT8NxmP9qW75YVK+SPYWxRf1C7vRRvWiQY2kpdLknpP1YEnUZIcEtzSEPpLqoko8hxrxvj5Y91R0vaHiTYkTjS+KMc5ps+h6Op1aFGPSgYxt6zzweJi0Jovor/N+nTA3+LdIWiE4fMFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJV6jdFC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJV6jdFC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75atP018319
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u+gVxwz26K/qShfuyUAc83vdluYu5rPi50yWOzhmWjk=; b=JJV6jdFCx/rlOPlM
	HQgh7kFd3d8/3rQko/y8/ghh+SvAF/VUNcmYILTOiVUNCOQVN+T8MGj0hehfXI2N
	nRO6UPpt+gzDyMSWll59eW9esnBZD02R1MlGt5MPJlJvjAz4DUlP8BEjIqhMxLWm
	vP6pRDkQRjEekRnR3yUVFcuttaR4rEm9Bc+065/mHw59djO8jWA9VuKZLKCGWc7Z
	9op6G/BXVEAb9fdCmIAp3QUjnbWn2gOdUiq2YaWzEnf1t/s+F7PpW+P0yrDMwoWQ
	Gqp66ivdPEJBWaypYj7JenFk+tyJQwe15BkHnr7OvC0jTBXPhiT28LRBBMdzA5pu
	zzyJ6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb6gc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:33:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so118029885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277618; x=1744882418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+gVxwz26K/qShfuyUAc83vdluYu5rPi50yWOzhmWjk=;
        b=gdqHwW7j/5YP+WMXlhMQyzPrA4vhfWL2iG0QrRX6NNJVmPmKvFTLkLTvj8yWnLE8ga
         BndRDOLQsa7yW8xhLgMW2NauMBgop9Pj7i86zmIHRSNB36x+adVOCbtinE/9ISryGjXO
         4y5wgv98LFU4RcpXgkrThUOibWUR30A2f2BOTqingHFVcnQJu8pyYjok6ZJB4ubyNjPr
         XPiiPbL8Dfeaq3m73meEfCS2lue98gEXBheBj+SpeycYdyR0H7g6X2nMLOVhdGRlQt5g
         NEodvT1sC9uKRu/TJg3JaajiS13Wl5/mWTpBsv+bHPh2vW+9I4ZUmJRpWMcrxvqcWGNq
         Hqdw==
X-Forwarded-Encrypted: i=1; AJvYcCUlxg3YCadjKhZreRsizLRYaGj30myzfNCdORrKs+t1c1KKk65UWhtkamIsMHgXmk/ZV6xvBp72ES+30vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6z+RywJcFCOcAjMOiFKqvm8HLHQf1xglDzDH5wbCwAFQJGcL
	59s1NylQfuO3RUx7lyMyXRROR5BdGSNC9V1Ot+7tmKVYv1X7Pbf8o1TrXClKWQAYPyISR3XuiuS
	lXm+nsXc7OFKADCn9PZqe0w8AmHHuv2dVhvhppID/JoaCzQzCHwnTGrJeGrh1KaM=
X-Gm-Gg: ASbGnctomM3Xy+nzHcYhcCQe2Q7h/qyD0bZtaVGta+Mm21p8KngNq/2MKOrXvZ2qyuR
	sojjsJMl4zA8KYSVmjwAxeB4JBIGF6lBuimpcGmokUWbBmVfPiUCfy3HDSUI/jhgEYTm8ikZT8M
	+jDOUDKMYzn14Egd6Q3n1iti2uaRKOF5qYRs5pKt7E744x7xV5SxiBiy5bwbx5rfwcaRBEjN2wb
	B1HDrLeXkxmGny5sPH8ks66lBb9YqTlhoYPYO6OYft39BhFZIOKxl75Zs1muW3EYLchCGEtv4Zv
	Oae1u8VUrgU6ZAlSHS9K8gUidBJcsypof4wSmDOXFjETcpa4j+lw+D6I81uFGeqXr6a6iL6AP8M
	=
X-Received: by 2002:a05:620a:3902:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7c7a766c9d9mr229959585a.14.1744277618467;
        Thu, 10 Apr 2025 02:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1OPsSHyXATFxyThE+cAF/M1fETlQodoKCExWqBJG4ITEOVfiv1jehCySr4s/lSsdY80mBfg==
X-Received: by 2002:a05:620a:3902:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7c7a766c9d9mr229957085a.14.1744277618121;
        Thu, 10 Apr 2025 02:33:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d520608sm89193e87.239.2025.04.10.02.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:33:37 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:33:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: ili9881c: Add dsi-lanes
 property
Message-ID: <frufdok3oxwgv4bk3v6jkeq5zwf3pheffk6qkweulmyye6epup@ucdefcuqwapx>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
 <20250408-feature_sfto340xc-v1-1-f303d1b9a996@bootlin.com>
 <20250408-statuesque-poised-firefly-ed8db1@houat>
 <20250409112846.2fb20426@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409112846.2fb20426@kmaincent-XPS-13-7390>
X-Proofpoint-GUID: t_R7dg-mzFRGLGSAQ6Gqz24Ou0AN3v0t
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f79073 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=Wo4xcHVRBoO97_Wyx7IA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: t_R7dg-mzFRGLGSAQ6Gqz24Ou0AN3v0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100071

On Wed, Apr 09, 2025 at 11:28:46AM +0200, Kory Maincent wrote:
> On Tue, 8 Apr 2025 17:44:32 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
> > hi,
> > 
> > On Tue, Apr 08, 2025 at 05:27:00PM +0200, Kory Maincent wrote:
> > > Add the dsi-lanes property to specify the number of DSI lanes used by the
> > > panel. This allows configuring the panel for either two, three or four
> > > lanes.
> > > 
> > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 5
> > > +++++ 1 file changed, 5 insertions(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > > b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > > index
> > > baf5dfe5f5ebdd92f460a78d0e56e1b45e7dd323..e36550616f6aac86c79832a48132ce8c11ebcf7a
> > > 100644 ---
> > > a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml +++
> > > b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml @@
> > > -27,6 +27,11 @@ properties: reg: maxItems: 1 
> > > +  dsi-lanes:
> > > +    description: Number of DSI lanes to be used must be <2>, <3> or <4>
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [2, 3, 4]
> > > +  
> > 
> > We have the data-lanes property for that already
> 
> Indeed but there is no such usage in panel bindings, only in bridge bindings.

It is expected that the DSI host sets mipi_dsi_device::lanes correctly.
If it is not the case, please fix the DSI host driver. The panel driver
can then use this data field in the probe function.

> 
> You are saying that I should add something like that:
>   port:                                                                        
>     $ref: /schemas/graph.yaml#/properties/port
> 
>     properties:                                                             
>       endpoint:                                                             
>         $ref: /schemas/media/video-interfaces.yaml#                         
>         unevaluatedProperties: false                                        
> 
>         data-lanes:
>           minItems: 2
>           maxItems: 4                                               
> 
> And use drm_of_get_data_lanes_count in the drivers.
> 
> If we do so, maybe this binding should land in panel-common.yaml instead?
> 
> Regards,
> -- 
> Köry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
