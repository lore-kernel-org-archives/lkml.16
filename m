Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDD628E3F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845081; cv=none; b=SG39YD5Ah6RZybxiOWwATOMxNV+QO+dEAbu7nM/0kSgDkb7DBr8m2ikcdg37VPgKSzfJM7PdhNJerH/V2oFijz+2qpelmeoFAhp9KVSi1EgblrGzjuuXgqqhzeAB+Vmckm+ZKvJJmo/IsG1D5eJ8Nm17eFBMiyZuEDDmU/avCp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845081; c=relaxed/simple;
	bh=as0rpW91v04dWz96xANBaVjWwQPe7B/MKLZsPUrij4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=krOokuUDrfb5+W52POA1BHeepZoRe60vDqOvRsY7p1X4Upf21dEGAzOcLKSojCYWXvTdojMuTjR3IJOptCE8eCsnYWiliEV2tb6CkONr2XXiD0hY7gJitr9ovmug0AO1yuHOPCz/PLHJt93A4aqP0L2PK5mcexnuFA9CYm1RTZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRnA2hWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRnA2hWJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMAo3R020755
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4K+WFxhxoQoMiBkaH2jjbXQBqU4EkxvFN1NoL0IIYRY=; b=ZRnA2hWJm2VICGJX
	XTp9deSvggFEoO8bfjASl+3c2l2OzSFOE3brhtxZktiAUrYWyVpZ/RzTdjdOMmTf
	Fu8/ICGzKvdbMdNwFBIYIwBGLOYhgc3lyi1HQdc+N4AtZNzuZ9igT12KHOKk6dil
	IDDWodyO8qFG3iRWwZqkJ8eiSpfmWe3h8vC8KrvW9cYHzidaBJklHG6p6RG8ZS31
	5gzMvg9L8vivGd4r8I77VXr+waoxjXD0g0rs6Bj7V0EGKcWSMwtM80CAUxR1w9Mz
	GUlVfhWcr7BqkLBZr0NUjkSHDuFP6AJseiHoR6SUo+2W0ikYQhFl9u/HXeKlnprG
	kiFejw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpvucr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f184b916so4755836d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845077; x=1745449877;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K+WFxhxoQoMiBkaH2jjbXQBqU4EkxvFN1NoL0IIYRY=;
        b=Yt0blfsfl6002kSlf+8+xNkWw4e+JjSw/uVoK1BHOr4w3qWinszaNtLJmW0Gngr/ev
         MKTcDrgbjpcXVIiZZwKBdXQFLQl0tE3N718u/V7HMmpRomMFAfca4T/xUVbbyTgdaIDQ
         XxI8p/0KSKiVPJegHTx7CGEjKNOznwHGozcJVdk2yQBs1asHY68gJwOtbeeFXTqSn0JB
         1lVuoFG6FHqRC8xp28MS0rK6W7ogaLycEDEIgEA3M+M0z5oN11Afl8gNrJBsEh9toBUB
         1JDBCK85eiHwPXnWcB62tNCeooX23ivCBz2yj8RQy2FAu1wUjUrcJ0DqsQZvtu1BI3f9
         2WqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUip/dDhT8eyNGY/9omUTTvxMl1s/PRiT9KaLjJmvr4a2Iyo40wxAtbjQbx4tQkB2aGCBBpWanNTplf17c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwqADPETe3h5ENzJqMYdQ50oPyEPoiJQSGUUpS+UcerVX29cG
	mdOYXlWGMRv1vfzlyRnBF16tJNP5mfpv7mJBRq6xvs5/UHP5Sj4k7kRXMqdL61VhlAjmtHI+HjH
	GcisegzN/wi2tX4kjHzO89nfMCRwMPNcOKs/H5Wqjj/G0tl9MbB6yX7U10LSMI8w=
X-Gm-Gg: ASbGncsxdmRhPghNh0ix+CXi3q5xJihJq5QjDfOnMXXbzaw6S6PsRcITFiRWgnTkRmy
	sWk8yw3hq1MvgqYdUzsb+Y7PZp865GGC7RNVZPwM36OxQBoV4ca8j0ZwBRqLNFG3PTJK1p8Zqq7
	dnIwoeM36yJeXguHyA5afehPZEHYK/T4FenLbdiL1Ws8EhHbcRYtWSgHf+WUodbCo4lzPRMcDYl
	weWMM9Vnp5k8gyx0abRwHQaZOl+JCoNMzfvyDiilbrsOwuMVgs6JY8sujvgyBPip3DLTSWEb6Px
	xnes8un5+vCFxjOz7/k1GBvG0CwLfU+YcVV+gvypsHW6OGtju5EAqm5F5hLHqax1Wm6XO8FeBR4
	=
X-Received: by 2002:ad4:574e:0:b0:6e8:97c0:76f8 with SMTP id 6a1803df08f44-6f2b2feb268mr54272286d6.27.1744845077635;
        Wed, 16 Apr 2025 16:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZbW61RsuDYFWg7JRdbm1/TXaerG5wFlxGsOZ6h9o3vx6IOSI1SDfABlIw0wQiRBwV3m3dtQ==
X-Received: by 2002:ad4:574e:0:b0:6e8:97c0:76f8 with SMTP id 6a1803df08f44-6f2b2feb268mr54271956d6.27.1744845077353;
        Wed, 16 Apr 2025 16:11:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbbb0sm25320081fa.30.2025.04.16.16.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:11:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com>
References: <20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
Message-Id: <174484507310.205743.14049404804802219096.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:11:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: dVN1CmYIQIxEuBqpZ0AJGGPRJGh3iUo1
X-Proofpoint-GUID: dVN1CmYIQIxEuBqpZ0AJGGPRJGh3iUo1
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68003916 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=TRtR8zIzb1nflcp3dq4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=836 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

On Fri, 11 Apr 2025 18:09:40 +0300, Dmitry Baryshkov wrote:
> The aux bridge uses devm_drm_of_get_bridge() from the panel bridge (and
> correctly selects DRM_PANEL_BRIDGE). However panel bridge is not a
> separate module, it is compiled into the drm_kms_helper.o. Select
> DRM_KMS_HELPER too to express this dependency.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
      commit: b12fa5e76e1463fc5a196f2717040e4564e184b6

Best regards,
-- 
With best wishes
Dmitry


