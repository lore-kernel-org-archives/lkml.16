Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B3328B407
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426865; cv=none; b=P8hgTkl+EZ5wqIAwHWFdTZxnGRiQvsbpK1nPlzrrp1i8kdDYF8OceX2inOtEFIEXDuATDBnR34HtixlD43AvTewj0HnLpnyYZe6lchV6KLYgxJjPH+syt5ODTlerpeV/K2GIqujJ5cXkOsPCA3qro7s0/MyaL1ouXgsWFWlLPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426865; c=relaxed/simple;
	bh=n9lamK2M4jeoV3u+ch8DUguzgx5u0p3/AcTzsc6YeHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpeU3Y+JDkwhfUYFDVnyDpx/vQPwcwoPN+Z5nFGXMpo1jESDsq2iw452sphZem/kZV9LmPb/g7kHKi0PHhxsr/VMmethLryrzsHOKOPoG2AiRIt50tH/25eWh/e1XxoLfhnlHRcw6sJgyYDmCtTdB74/p2hRyLAnHdC0zz+zMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3E6a2dK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3E6a2dK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad93ff9f714so331894966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750426862; x=1751031662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpVfOGJFxIZYsmMRUwFwqfFQVYB9k3K3K32rB5+Q7vw=;
        b=T3E6a2dKO6EJt/ZGMyVidGSHj1EUtxwE22SI3/jIQ/uAT5pMzEaEzPVUfNxNcF01xa
         CLdo9gPcMO5OXPPEv6n/m4jRblrnfxJbHd+RcP3PLJC2u2dz+D67T1znsh07sPeBABLp
         K9a1c2r7Mk3pVhkpxegl/R/Ro4avbfSQEAkuDYvTSMYY7jGswN/xmcmE7699J+rAtx5t
         yDhUBvvxMxdzYpL3N9bT+4Wmaw0HsYXfPTj/dhqfUFRcrYX/fSUM4P2AtA5QuBXu2SwB
         pPTwGbdOZYqtllHLej3UTc+UfAjYgEGbUX4gFfVsrvHny3CzNobJkFAgE/YUiUWAKLoE
         E7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426862; x=1751031662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpVfOGJFxIZYsmMRUwFwqfFQVYB9k3K3K32rB5+Q7vw=;
        b=bt8oeGtp1XYRB1xgjmeYFMgC1hfqeYac7kgrb7pxX6Er2VQZN6zmDhNm+cy4EhHv5c
         CSxKdyd5hX1Y2Yg/nYXqhZ01ImNSSyYGjSpm7ezPC8Ab/ds9iLp0R7sMoxnn5AFpGBlq
         KTQUr2++Drd9LVVx25ROQzMbN958U0oASmFcRLi8XWyHo8QPHUUyz3V6S2uFLV2JOZAX
         gARmJPVmbuawOD37Jg6VSne4DgaqU4nCz8kkzHWcuxMbjbBpoiMgDcohsgERZrn1R+1P
         httu0Jfn6JxaQlviobZ0mh8dpPsHdInWUMpFsuiHaJGE3b8zyCslePZD5/lR6NSW9+Gn
         eQGA==
X-Forwarded-Encrypted: i=1; AJvYcCVoXVxM0hfhHk1e9UJOeTLllhIo0P6mkK66zYvB1HQ2Q/GS8/OWoNmCscEoQ2eDNx1cH0F0KakGhkU3Zok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtkpOEQ8qaHrdPl9/JC9M4fdyUYJy7fS5ULPsSc5Aavlfd4to
	IuXQv93nml7nMtMjnpLMJHgBJQvoCd2iWboImb4/23Kri8f3jjTPevfpWqMjTE5zpt0=
X-Gm-Gg: ASbGncuboZVXey0KwoFn99Gbu3xCJWdsCmMJLjzpTsNU85OZNCV0NxOe9Xf8VrAkOAh
	VEPamTBHzPbhFaT4JrvdM6nQ7PW3VnGoY39go/CN9u/w0QkXx75LA3DDA2ZV+G2GUhtp+x1f0Rf
	S4z57kuNXzcREbB/4ee4GVmXgDiAPv+wRIObbI3GGFHn7oFzZLfcl7oQpve4fU+ySWs8oClsDXt
	piLSkrPQML3YP1S0gLyeZGbHHKUtr4/RamRIvkySVsgbh8Byq1Q/3euFGnmZfcBB3OT4oMhuHBW
	h8UvSu8g9AwzF4myP7orI9hbdqgAuxwiAm0il1UidWJSe9N9G5l79xwl0VM=
X-Google-Smtp-Source: AGHT+IGYKKslvR/1stzFoNBWMle6YgYw/c/0QW8ncwoZLD0lcIICIhoOzA/vRygSUJ7ruQCVGYAWdg==
X-Received: by 2002:a17:906:6a19:b0:ad8:9466:3344 with SMTP id a640c23a62f3a-ae057b98feamr276291966b.43.1750426861719;
        Fri, 20 Jun 2025 06:41:01 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a98sm168650466b.90.2025.06.20.06.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:41:00 -0700 (PDT)
Date: Fri, 20 Jun 2025 16:40:59 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <swboyd@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: include linux/io.h
Message-ID: <aFVk6+4pIMQs2imz@linaro.org>
References: <20250620124747.1928114-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620124747.1928114-1-arnd@kernel.org>

On 25-06-20 14:47:43, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver started using readl/writel, which are defined in linux/io.h,
> so this needs to be included here:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c:33:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> 
> Fixes: 9d47325ee063 ("drm/msm/dp: drop the msm_dp_catalog module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
