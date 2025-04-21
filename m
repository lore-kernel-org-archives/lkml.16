Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7011015D1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745224735; cv=none; b=IgEFKrfLJEXEtKrxBYEjnvIIBQ6dBjmdFGTId7RWRCsT0ErR6YwcOBk5DrQpIDRqu78ED6Zv1mNkNvSnEArGCNbIBRKNdfyJJJWD+hZQrTbv14dzRfm49M34qzDjtjgwafC7ELHLIGOE42emashH6Ae1jTDj6Ic0Y2AQM4+iuh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745224735; c=relaxed/simple;
	bh=km2N/aIMMbRDxvHbAp9P3zMBkknYXReMVu/F4dMDeys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDF3VHyX+vwTW6JvoMJZlEe7kfxiCvkhPo1CgaYviUsOEJR/xj5QiXuj4sYFQvZ8cAS7YiCTAp4I+ALFxNr1Yxj7P9a1vPLGiysXvebu3YLpCAarRqIi2voAiC/9+C1cyxmxHTNpTf/TaoEQy8ZR/BotFt7JnnAIABy9++UliDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhU2q7K+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhU2q7K+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMtlEL011086
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ax4toDTbfRew2W1ICEa9lIo8
	jWxUgyyjE5FmJLig2p4=; b=mhU2q7K+FNgdKXEFmaZ4R/muJD4mgBJpHgcj6HtW
	yCoqqxIyoqAqD+ymHBhjMkWAvhahHWO+Xa1a1D2bXFL7PUF427kMMIB6soLeYBIE
	SIWeDHdcW9yK+lVhQMo4++ZbkxcZw6SdNh1ipVilEhB5XBCM1JXyIa/QhSXKYt4z
	taZJL1NzvFnUP9IWA7XgBLE8bg8NMEafsHeorssxfU2gv8E0ZRWXnjHKsTmN3g41
	3H3wIxAVX9m43dYhnCsS6mI8IkyVuhJ3DjQuvutC4uzTwMPCtSdVTbuWM8BDr5cT
	0i42wS5GhC8Br761eEmU9xmAqONlxferBMx/CSURFAqGqw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9bp0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:38:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso103423576d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745224730; x=1745829530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ax4toDTbfRew2W1ICEa9lIo8jWxUgyyjE5FmJLig2p4=;
        b=CcimJaVjzwtAwyNdbTvFO5g+otD2com9pz4XrMDC9Umwil5ZZVUyx20ScKy4I/ilj+
         nclYaZf1CNapl/3htMpwEnBJAENeae/+O/0zxmIzQVSRgBgqStR5mAWoxJMZ4pMrEEXC
         X8ZyIO0KKvP59pJMMJBLdssgtBEm70v3wlqhrFcuM0gM5PW7G5SHloiJfzFUorgw3vZ9
         xUHYCuyaOfdVb8FdLkSjP3PeBtarORc7Ybg/46iu0ISWPRB1qctCouMvIHc7FBaNgXk+
         HQ6YHBuAnSTuyfUqa3LxVFe4KHG25r94u+hRgEyI3/tddSBJHBOKSxr/A8x1SyQEnM97
         OT8A==
X-Forwarded-Encrypted: i=1; AJvYcCVCcdnMnRIP0BZFMAXw50k2C/RMT2fbhoooz19bkfeH7OCxtKzLn3nFDUSA/NfRnZ9OrpDxDl+PkHFv7uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD83AZrcyN0cwO9mNEzeRjSkSuAqY6hxvF/RDYvQDa3l3PUR+o
	GtlJBRrAgS0R8IOtI1bGaPTdelHgWhQXEKM0LYDnkI0oztJXpSgbYIodiwbHu/nC9ZR+tOokCgt
	Hm+3FR1VLydZccFKIQ72SOMcsxm5R8TgDde84gZJigTZ8OwfugUZyQaNv+EA+uto=
X-Gm-Gg: ASbGncsM0n0NQXvoxydQ81B+i39ucyy+lphrlooe4/By27GZuEGAquE7XM+tb9tYInm
	lKNhuvkT38LmhpC8BcKynBOrgeCTPtxiYAEluM8qSOmoYMzq9s7SSANOoxBLwtX6IQE3CVcGh1S
	d5dfyNGC4uRwduL2pJWYV/wFOSB9ZiwPb4s2tRbPZ1+Hr3kSIEGm9OLWx+wkTn5lsea17eLffAg
	TTPVLd1TpWoLTtubtYY7LtiLZxz/LO8QFJKFX+e53L9hzwDOoOcoU2IvCpJS0p3sgKYbD2ArsGh
	E5V1/9t9GNlz+m4Wr6SSSdqy690aYDbHYrEOY78Lxhvvpw1JJm+hi7r3Ae1AT3XaU3ld5lMlDRo
	=
X-Received: by 2002:ad4:5f8e:0:b0:6e8:fa38:46aa with SMTP id 6a1803df08f44-6f2c46527b9mr206777796d6.33.1745224730322;
        Mon, 21 Apr 2025 01:38:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF40++SY6SyUhHgwohwJQP/ezAB2infSDy3w/t56HhaTqCSHraLVTK/mrG5s/kw5dQ9HIHYIg==
X-Received: by 2002:ad4:5f8e:0:b0:6e8:fa38:46aa with SMTP id 6a1803df08f44-6f2c46527b9mr206777386d6.33.1745224729825;
        Mon, 21 Apr 2025 01:38:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a68c3sm11769241fa.50.2025.04.21.01.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:38:48 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:38:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        David Airlie <airlied@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744789777.git.mchehab+huawei@kernel.org>
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=6806041b cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=gjwTPFk3WlCVuFmdJm8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 664Gg0s8jYYeyWkD2ki0mOfG5EZ1T3-o
X-Proofpoint-GUID: 664Gg0s8jYYeyWkD2ki0mOfG5EZ1T3-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210066

On Wed, Apr 16, 2025 at 03:51:03PM +0800, Mauro Carvalho Chehab wrote:
> 
> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__. 
> 
> As one may be using O= and even having the sources on a read-only mount
> point, disable its creation during build time.

Would it be possible to properly support O= and create pyc / pycache
inside the object/output dir?

> 
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
> 
> ---
> 
> v3:
>  - changed the order of PYTHONDONTBYTECODE;
>  - patched also scripts/Makefile
> 
> Mauro Carvalho Chehab (2):
>   scripts/kernel-doc.py: don't create *.pyc files
>   .gitignore: ignore Python compiled bytecode
> 
>  .gitignore                    | 1 +
>  drivers/gpu/drm/Makefile      | 2 +-
>  drivers/gpu/drm/i915/Makefile | 2 +-
>  include/drm/Makefile          | 2 +-
>  scripts/Makefile.build        | 2 +-
>  scripts/find-unused-docs.sh   | 2 +-
>  6 files changed, 6 insertions(+), 5 deletions(-)
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry
