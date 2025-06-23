Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C3136988
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676806; cv=none; b=F754NB/EZsYa+qerMBzaXvHPIS+/C5OW6qjkEEpXhnqh98iOrewBybqukrYCXi61EgenDPZQ0O+4mYF6msP+kGariiNzN0rGF9u8e05cBGCvhGxE/Uimo5SAECYXphXS3WVfyFXsZ6I/hNEpKAOOX8kNtRTXrIA+1Y12F3FtXmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676806; c=relaxed/simple;
	bh=L1yuBsZwdOMdw21vyhvmsFpGB+hn0R2/B/Gw6Kt4POM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHEC5vWGbwTF3j+mRcTjd4Xh6SbBK7jeyBp9NpFjwMwiigrzwK/YcP+VUqMLkoQYI6gU0fyOFdNkq+TgQwZqXHfz0TE3gOH6hRI85prNXufHVaM6F37R8HiZFgC1fo6fh4nAntlv0dGZGwqTXW21DArFH3XRukGR7XVpVPMxLMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iepwuq6C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iepwuq6C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9jsHZ007763
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/SblRjynm556F4JCCkpMzhFlMahL7TZAtWLt+OcV1Ds=; b=iepwuq6Cyh5zLaFQ
	s6S5DsMtY160Fz7DiSpFAGjmMrnmaMYM6N7eURNPMSlkqiTXKWxOjRt4LeUQ21b+
	ZmeSwD4jwT3qQ1I1gZfMZIVPS2F0MT15qenaoHI6XW2MV7OMOlhjXqLbVwjjXDca
	JdqKrem0JSj3uCle29QwExAbG7wmGRzsOvzanmdZEV2vUmuwzZ3cviXgFdlYFBdk
	TKLZ87DaML45pHqYeuelyQ3qLzz8lNjG4baM9EbjGUMfNYS7EngbXkbG5Hv/f5l8
	Ow9AJD7b2e6l4S4PKk8gyozCcqKnab40gIby8kBcHYwPdTqaMfne1q3L4gOC1HPo
	SQJa9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eccdjgbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:06:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ceb5b5140eso608618085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750676803; x=1751281603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SblRjynm556F4JCCkpMzhFlMahL7TZAtWLt+OcV1Ds=;
        b=hMwNIw97c8pt77yWR96WYqXZtRwDUIOkiniYa/avMqExN8FHyTlnKGl+NjuQfz2qSZ
         a8PYCT4tKxZEvdYgHO58lFSeO5Hj18SiAgRYzvb0I+jYwzCWorQLQ36qtTX5TvP58EFm
         LMeTPX6qt4x6j6+hPb3XdEwbL0FcP6R58JEgeFGIkpbXOqOH/kHobTPt/XcNjJ/6LTE5
         552VZw6D9BDGJHWxRo3GQW9otq7D8csHwRH/7G+BQZE4nlXdZakbF8btTKe5jmbGvk0a
         WqR7bvztkz8jToSf4LmlDIBEA0my/ntgMTQyshuPYJIuYoRhPovIKUi4K97aVfcBPwIo
         CxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmAqKEnNTuaEry/znkXFzVfI0huF7AOVsy/RmKyLds+vHCsIAQkqp3lhEGNskdWv95N4b6+Wgsql9+fIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxChRYj1seO5BVve2rmNn51VgdvDxqLWgCgrWPJei58o0O56OLW
	UyaTBsLCkY2Cn9JAzJtP3GcCSKIp8Iugy4Opyx9/7X8raOmWOcl5bd14XEmYV1Fp21wNOQ0tSdV
	cCoTp7CjT9Y7b0Ou8uHHjwlSdTGGlDuDL+3EvqR/ws9Ul8PAbXWZmBZbW2a2vD6dHKqs=
X-Gm-Gg: ASbGncvbVYVT0+S/xjDqdv45ZpmaKIjPj1IZM7Z4t0N31KVnLHmNa1ayF+RgQ5ZpKFG
	sH3aPkTbm8MhWh0SggVza29WySwKyGYdOzhdiEf6YqmrQ65F3ZY0rHZYk/swpLLvFwEEIPG3hxg
	HLDQ7p09F6Q+tXg6IH9yLWjR3dWlJxo3fD4rA3yTS7vx3hSTG99ZBzaEyPa1UjPiKOLPQvfulwv
	cxj0Ax4Ki9i4dgQV1GccxNZioHQN7AVK9sNrQ6etT9zEhXs5SPbjNin9h864yf+Q4rmrnYRUFe0
	C7IUij7TMSthHSp5Y6Sh2hSpWF7iKw0rKzPzMTdO8yOF6vM51D6oGVh5Mn5m5sS2uMAjq4LwY/8
	=
X-Received: by 2002:a05:620a:1a27:b0:7c5:962b:e87c with SMTP id af79cd13be357-7d3f993a806mr1811151785a.44.1750676802607;
        Mon, 23 Jun 2025 04:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCAaI32difYeUGqzguwGOyLLcEd4F3LnFdlw9PHpbqM5K6DPV7l+MzhhUJ1GJr5ec23magXQ==
X-Received: by 2002:a05:620a:1a27:b0:7c5:962b:e87c with SMTP id af79cd13be357-7d3f993a806mr1811145285a.44.1750676801961;
        Mon, 23 Jun 2025 04:06:41 -0700 (PDT)
Received: from [10.132.167.252] (37-33-208-94.bb.dnainternet.fi. [37.33.208.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2d71sm1341676e87.142.2025.06.23.04.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:06:41 -0700 (PDT)
Message-ID: <a506cff0-6a0f-44b2-93e5-0488aa041fa2@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:06:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LOVmQIW9 c=1 sm=1 tr=0 ts=68593543 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=D+sM+DASzikqaCSeXxPSkA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=6giXz7gn6WA7Rt2kLM8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: DInvfdbkUDlfHv8zEaMgTSc07I65AeZV
X-Proofpoint-ORIG-GUID: DInvfdbkUDlfHv8zEaMgTSc07I65AeZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NiBTYWx0ZWRfX+Z4wsd42Trpa
 6vNrrwhcsaFAt4qPKg+p8St2TY1mD+0MaCosX68vRXZxdEzYQjxcfOt/eUl74gb9DhX8I4TWFdQ
 G5Za9Ir9hMxivOe1UF22aKNckWBEfjg2/OpspxxZdlCw0iNG2tFFF0cjROfyAMnnT32wEQiePzQ
 9kMgr3FYVT6kes5kI8EJEvsZzWP9Nu1ih9MJ1LEDPlqA3LmgLP85/JdTy2S348fCJOHIc7+905/
 mD8pjuHDpuLb8KOwdwraHSQG9QdaLSR0QzNjOhkbxR+LSVCCPydkYS9pvgj5VfgF5MWIqAY4JaL
 MC0I+8b1S1GZscfuGxWoMXVOHOSVY4gNhw0TwJaRR5Tn0KANhjg0/QzRWCLkduwx7L3xftbIaaF
 W/YXJi8A0fhLEXRSoGHVmt+Z6H6qSLYBgu9IBU92c1siw7Y6Td0virMPTCdaQiDvVXKOGqUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230066

On 20/06/2025 18:59, Luca Ceresoli wrote:
> To the best of my knowledge, all drivers in the mainline kernel adding a
> DRM bridge are now converted to using devm_drm_bridge_alloc() for
> allocation and initialization. Among others this ensures initialization of
> the bridge refcount, allowing dynamic allocation lifetime.
> 
> devm_drm_bridge_alloc() is now mandatory for all new bridges. Code using
> the old pattern ([devm_]kzalloc + filling the struct fields +
> drm_bridge_add) is not allowed anymore.
> 
> Any drivers that might have been missed during the conversion, patches in
> flight towards mainline and out-of-tre drivers still using the old pattern
> will already be caught by a warning looking like:
> 
>    ------------[ cut here ]------------
>    refcount_t: addition on 0; use-after-free.
>    WARNING: CPU: 2 PID: 83 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x148
>    [...]
>    Call trace:
>     refcount_warn_saturate+0x120/0x148 (P)
>     drm_bridge_get.part.0+0x70/0x98 [drm]
>     drm_bridge_add+0x34/0x108 [drm]
>     sn65dsi83_probe+0x200/0x480 [ti_sn65dsi83]
>     [...]
> 
> This warning comes from the refcount code and happens because
> drm_bridge_add() is increasing the refcount, which is uninitialized and
> thus initially zero.
> 
> Having a warning and the corresponding stack trace is surely useful, but
> the warning text does not clarify the root problem nor how to fix it.
> 
> Add a DRM_WARN() just before increasing the refcount, so the log will be
> much more readable:
> 
>    [drm] DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()
>    ------------[ cut here ]------------
>    refcount_t: addition on 0; use-after-free.
>    [...etc...]
> 
> A DRM_WARN is used because drm_warn and drm_WARN require a struct
> drm_device pointer which is not yet available when adding a bridge.
> 
> Do not print the dev_name() in the warning because struct drm_bridge has no
> pointer to the struct device. The affected driver should be easy to catch
> based on the following stack trace however.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v9:
> - change warning trigger from "refcount != 1" to "container not NULL"
> 
> This patch was added in v8
> ---
>   drivers/gpu/drm/drm_bridge.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index f001bbe95559aabf0aac9f25f89250ad4e1ad9c8..0b450b334afd82e0460f18fdd248f79d0a2b153d 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -295,6 +295,9 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
>    */
>   void drm_bridge_add(struct drm_bridge *bridge)

Can we rename this function, making sure that noone can call it 
directly? E.g. adding two underscores might point out that is is an 
internal API.

>   {
> +	if (!bridge->container)
> +		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()\n");
> +
>   	drm_bridge_get(bridge);
>   
>   	mutex_init(&bridge->hpd_mutex);
> 


-- 
With best wishes
Dmitry
