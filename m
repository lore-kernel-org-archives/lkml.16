Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E0E1A840A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751800459; cv=none; b=f9tmDKrkeV8NEtI4vEnEQqDGFvKqjYpkfE9YC3a/ttWq50uC/MgjkYVnZ1/uGsbvnRayAyrK55UC2wvtqR/4lpEdU6Ayipg2O/czuz3j1coU/ZFcljxBm/Dy6dCe8UnIiE1iPYg9//MD/C2sGUbNAWSIpX8HL7wArGLpKJMtocU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751800459; c=relaxed/simple;
	bh=uuZhUIvreA4bF7pGZXOUB/dWe2RprMCXjDmVKLbJx9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxiPUqZuP3P3fVCQDGIIB1Qd/4tYi8TVq1PZvi0Z6qfq7yoZZgq4B96PkvBokb+TzdaBySTcOjK+jAvmnY1tlU5rpmJboXwVfAUMNjln05j6PR3AiF1kO5z4BppNiho71UXLt15veEByXYBRXrri5s3SC670I++FzsKpdv/uYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjnccWlv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjnccWlv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5664JwTf015686
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 11:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lrSM8BW2HndVBSoj7s7FhZs7
	d3IX6Be7fW3wKRsVstY=; b=NjnccWlvZ8Zf9Dbyco2U/mrZHDEEAioTaJOyCe3D
	u+V3eyM4TkHJebOvk7//wbMExSPq16IDbMcpFwK17Y9j48KQfU5dZbyNFl17rDxy
	zjQ/bZet1awHs5MMnEhOQpJw84S4MKYCqq2a0TgjHGZC3CmBhRBfSq1n+UnycpaC
	RxPIgJzNaVVCj+9sid3S9LAyKk5oZnJh7oJVNH4nmDXUHdNsn3rOqSn8tZc71f7W
	/qGxh9HNDGHK0xzs/5v/xT2whOLN5bxwcv070+z5VdJh7Zw1gA5axVq6HYRM8Gf4
	x79XOADbOYH995mU/SIq56xWoCr+m9FmG3eUN7REBHXt6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk3fb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 11:14:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fd5e0bc378so38625976d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 04:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751800456; x=1752405256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrSM8BW2HndVBSoj7s7FhZs7d3IX6Be7fW3wKRsVstY=;
        b=ISiysXvekrEaNpw+F7tWE7s4d2WLBMt/Yd444iFVbUjnfBh2FNpwdTd4AmFeVY3To0
         4raLpDZ8GZviq8d84RPfQOJt1vD+5OTKRQqUiOC44jbYxh8jLVRpjmYM72ZjmggppHx+
         Ya5FdAQjRL8FMgsfoS1kL0dLWkqcswstUaVfjazPE5AR2F9oh0tZ31TKeoEaU6v0WkCc
         iT8yS/DuKuQKUax7vT1D2+MU4Hdeuxf9I9VbdldLx+FsMjYsZgXeNPUkuMxrfdG9c48k
         ouKLAGFxi14+8bVD559x314Jmdj7UPIdehgFvREd43E53PskRCEa5OO27tEUKfbHk2Lp
         Yieg==
X-Forwarded-Encrypted: i=1; AJvYcCXoYKU1iD6z5JqOuhaE4MdafwEslPzT8aOscp1Rc8/Dwu+PfztiMwX+4eYNP/8eyDc+bDka9FZpzD5la/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/D3dCp8XcGxr8v/VI2a5FCQn8VxEsDF5P3qZWZgi0d7GWhFP
	4+70LhMi33helo3NlLm9qyLq3ib8iScRjfqk5Hu9CDODRpAgiJn6tdaYYmBKUByuLJqdT3JUEU6
	ar2RPbFCAPhwJDUnyDlvo3lEtg+Y3WsDx1N8WcGURazIfHxhPJygO2EAya3Rm56mabrY=
X-Gm-Gg: ASbGncsdlTrOMmRfu2+iKCecEj1AQolmi8P25/r2RtbwDqjcdIYUrgJB8l2Xjo8bZt7
	FgvgNrPoQhOs3s0zx2+t5S4TpKJwpHuoRjvAwuPDHdu9POBmpQDcjStwa2XYKFLB4EDA6OaySNv
	b9Lmf8YAxixe11Ge+1Is6NxQSFAlAFNmq6XWFon2Jyq0J7lS6guH4ZGIaTdSqt77t+M2Ien6O1L
	W6Y6u1Jmzo+2GxWc6ftcq783ABLSgcGKw6rn70IL+NmXkuUJTrAHCdsuyGf09l5VoTNShJEZGxU
	LPgt14dDv75KOTbRsd58pO36okM5KMTIk3vzuSf1r3uU17qMdJQy17ABmUE5h3K4J60Lqpb8wXt
	KcwzNtPFM2ClD2jc59TxVLglN2rMDp+GAplQ=
X-Received: by 2002:a05:6214:21eb:b0:6fd:7298:a36f with SMTP id 6a1803df08f44-702d171dc05mr80227636d6.21.1751800456066;
        Sun, 06 Jul 2025 04:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3tVpmWS6ULWjjoEzDvnHa4iP9ltUJU6hMVJCwNkucLTWgzKEQo0EkOAPEAKMG3p6BoF+iLA==
X-Received: by 2002:a05:6214:21eb:b0:6fd:7298:a36f with SMTP id 6a1803df08f44-702d171dc05mr80227316d6.21.1751800455658;
        Sun, 06 Jul 2025 04:14:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff4e38sm8826461fa.50.2025.07.06.04.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 04:14:14 -0700 (PDT)
Date: Sun, 6 Jul 2025 14:14:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/sysfb: simpledrm: Add support for
 interconnect paths
Message-ID: <ypjcqiyfzjobg4zsm5sowjtu6ctvzgd4bvt3wpbqbb7o7f3rcm@q454aob3wwth>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MCBTYWx0ZWRfX0JL6Fagmivuu
 4hyy1Y7I6CX+z01R6u5TyE/evV8O6JOzKjTvWRNqqY6XDGOiUgRMP5oVxC5YfmLOWf+Aun6z/lp
 2WuUDCs8Gqjy9BBYUiHVkqCvNLwTb2Zio1tQ90axkdzhvEr0SWLrS7h5Jj1uhNH5hh7U1d6uIT+
 zJ41A0vjZAlQYq7oEjZ9k1KwBzZ7+lzfgY8219grYEuVLmqz0ODlziCYkGpiehi7lFP2qBX9TVL
 gOngbySuaEcHLQfkuY1zfhNdMTLLzEqUCJsB1YR01IWeuqVnkalqAwiApzOUUEGJtuXcHLbNC++
 oqbCHUbTUCGuwfA2jzMh1vTZBeEWGU3wld1c0Loa3q0uvvH2ewxWJeoPxVbCnZIg157A6dvJTg4
 Xkd8swr1gnMV8ur+bP3nnBob/pngEHbUthGAQqJ6oatV4k+ijUBgEd8V+6gzJFBSRHSnU0hN
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686a5a89 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EMKPgfd9biIQv-X5rfEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Hkv6u1yrP_caELgUxdY9dU-VeBzFI_kf
X-Proofpoint-GUID: Hkv6u1yrP_caELgUxdY9dU-VeBzFI_kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060070

On Mon, Jun 23, 2025 at 08:44:47AM +0200, Luca Weiss wrote:
> Some devices might require keeping an interconnect path alive so that
> the framebuffer continues working. Add support for that by setting the
> bandwidth requirements appropriately for all provided interconnect
> paths.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/sysfb/simpledrm.c | 83 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)

If simpledrm is being replaced by a proper DRM driver (thus removing
those extra votes), will it prevent ICC device from reaching the sync
state?

-- 
With best wishes
Dmitry
