Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878AC2E0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716752; cv=none; b=oap+zMFS+6JXmOhyNBvMl1u/I8X9qCwN+St+WoF0pCdjTIeG94A93B6pBD+y0Wx9ygQ45YwduFknffZzQEyJSMCefiLXmohKTIUSV8gPvZjIkiakXVEiqCtlyZ2QB+klsEhzgTqHxDBKL/frc8t/db7yX+bix6gHvenV3wa+QRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716752; c=relaxed/simple;
	bh=oXHPOR7TLuVJiF4AJ1mPKl17xpepxUuTb87IIvlShAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICRqlfXHy4k8rDM82Onc+6bXmy7zh+ODYy/zCJvtX8B3tQqOd+jIcrB+bPRpxZvxHn9iyd24c8hj9YczLTLcuX8mwyc7+zI51+q1MJey5rNkaWms6BvYp1n5GGdV7i4M4LQg/DXZjwdUnB9RiiZdXKM0KXFNHOFwtHCsGCLDlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mj9cOBzy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mj9cOBzy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHuKEJ025855
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lg9kP05buSmu9VAI3g+rOYfzC3a3xuABElAlMyKM+8Q=; b=Mj9cOBzyXlMx7w8I
	ndTERVXglPq09GszZZa54iNttLwY2cFab5mLBJAzDkOmNLrGUN8Knz0U7Pa9RKV3
	2GNJgFpeVJjXTqzclyYHH7Kus4Wh830nKVPglYDCA7SkHPO3SI9+uxKL7lv+AO54
	GEJEDAxWx8pkErm8QCnZ/sKtKxj9bPHKz7mj1MBtK5+J1InR1JY4vRcqFOveotuv
	tRyaKszm8mUOqHVAKXrcyQZkOJEB9XiSpJU7qiTRQCfAbsFALg7Mzp4xc+rx6gUW
	fDAWzvXf2uImKflF+6tqu6OrCsQvmhMNxah2fUfKXSWh4XIEpEZKfBhED7t4++Hk
	YG9ZyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmkq91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:12:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40d2308a4so296622985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716749; x=1751321549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lg9kP05buSmu9VAI3g+rOYfzC3a3xuABElAlMyKM+8Q=;
        b=GjlSTOOjf1x8tufxamUttO0bAqpcmchMiMwGkXGryD8h4qBWwrtp7JKk/bKf/TO+T1
         nLSBZ3FJcNFirE+P3uvD7tbbV4Jz36Qxpsgf6qg0a/G7SuI4jRwkwFcyHTkV/J+o7x92
         7YiAOcJGgovqEuQTbGYQzU/uIXc9FpaAqBaSsU8/wyU9BLQoI/vlolL6EQlKWkj3dWtu
         Z4wBorIMlQO5XUBm9tH4V0sADmThMhu8BdGr6JabcPRIKZQCIMqj5aIwCtVInca7z6EC
         vh23ndyuGCurrQkZpceDMAd2RbY58asp7cICTjdhyDKaaYDgJWKr57dDCQE3ErFehQvg
         D0Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWqdOCoC7OMXDEIrcIWn+1XbcXsIXpeitjtXc18NbPRAUeKulTlcBreADZgLorTiTF4XHCTL5Apoyc5+cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBAPafUMMM6xxZkWlX1+VRlmtv4CKu4NfGtQEu+y+3dbWddZfY
	AOqtoBQuJVR3yUOTSrUUWo+VrHyXgFyAu8jyDQTFAQvLK4dMNAw7pH+mwDnAmJvMiDt5Nh7SXUB
	0/sVE6Ht2ofZZeKTQhNRblcHB3aNTVeEqrysMto1zO8zZR91/5EoyqS8jJy3nzfPqwis=
X-Gm-Gg: ASbGnctYAjUtz5bLz5HfJIle1hewVfg4HzYCwBru++0qQ9lA0HUalcnsuUd5sR2RhEf
	9zvMcdUPG5B966JKX20m6DjA8DU6LJcO0UVMfyBaL8cKE//BolPk3mHZWVZKaHY3eWr/tbtZ6UV
	amTVu3cwlWt/ibvJgkxveIBHjy38zPcad315Z052tzcC+G8Y8+7XSwA6pw4yq71Axe8hkotBcTe
	9If+UO8iTrdyE4PJRI89+8mMR9LZVpYIdwD7ffPlPvELgxwrdUwmobfBC8Z+PkImTvFUew4imMA
	aQTsSVZZF/KkgNakS6xBmpA8xWAoii8IbyU/YdU+tbXq576bsPvE5gEbQ4d3kufk62HKvomeeas
	=
X-Received: by 2002:a05:620a:4720:b0:7c5:9788:1762 with SMTP id af79cd13be357-7d3f9938cfbmr2031239785a.45.1750716748701;
        Mon, 23 Jun 2025 15:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3fWlse6jUFEkXEfv8g/TYyqD1B6IL/3srb6MgVSJ90D+r/uAFrwOBMHUObcgRjBtB9QiUcA==
X-Received: by 2002:a05:620a:4720:b0:7c5:9788:1762 with SMTP id af79cd13be357-7d3f9938cfbmr2031235585a.45.1750716748280;
        Mon, 23 Jun 2025 15:12:28 -0700 (PDT)
Received: from [10.132.167.252] (37-33-208-94.bb.dnainternet.fi. [37.33.208.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d806dsm1579546e87.241.2025.06.23.15.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 15:12:27 -0700 (PDT)
Message-ID: <d48a235d-aad8-4978-b4c4-ed0b3fce14b1@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 01:12:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/bridge-connector: Fix bridge in
 drm_connector_hdmi_audio_init()
To: Chaoyi Chen <kernel@airkyi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20250620011616.118-1-kernel@airkyi.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250620011616.118-1-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lG_m-UEDJ8OckZojy75CsKNfkuMBc6cb
X-Proofpoint-ORIG-GUID: lG_m-UEDJ8OckZojy75CsKNfkuMBc6cb
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=6859d14e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=D+sM+DASzikqaCSeXxPSkA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8
 a=sDl0zNJMTKjEBXQ_4tMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE1MSBTYWx0ZWRfX5edK0oRMtdvv
 qmQSuRj7okV+GzuqpYtOUDI9ha5mp0csFBz8y+hxtMdue/dtY3QmzMapw3WOmwjwiEWwjGNaU0t
 arhohaFrjtNf0mN4vfG5StsF7sw1Vd8M7tDA2XarjndtBqKvJU6tFx9Esb6Nj0dl+6s/5COE8WZ
 r6suCE8yJ2ncRq/YctFw+XGtzOaBEayKcHARktXcY5ypYafIOWjzQtxAV6ssI4BVytZbB78gQD2
 6LXUTHNWUkyko7cRcRirgXGZcbKAAgKgrYcG8KbAR7m6/370tSLQ3xOat0MK5vOL4IIVSEzLPCO
 rSKXTfNOyCSRtqg+DoP3trX3vZvUTtjr4rQXMxEAQRcLWP1RsNpP3xDWIEg6x8Mh/mPd29iialG
 goi1dIQcAPMWlanBSsOWOCpmLxbp+nHh5XlTUyjY8eLF/mYUb0BeMZrUMqmNJBy0LIejLM7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230151

On 20/06/2025 04:16, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The bridge used in drm_connector_hdmi_audio_init() does not correctly
> point to the required audio bridge, which lead to incorrect audio
> configuration input.
> 
> Fixes: 231adeda9f67 ("drm/bridge-connector: hook DisplayPort audio support")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
