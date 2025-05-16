Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9E1CD215
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747410341; cv=none; b=AKdKEl5Aq5Iptnz9soE9oka82EBw/0DihQJyJuUEV/Vgo3DiSCnzi1ayYTYVJ0XUHWzeMGTnt+nWr2Rs155IoOUgBfAiNM5TGGb2uuFEi82CiSiDAx397B0MNMU3eAeyTWSgth8CWIlWZB1hOchgYcUSfGOrPczIomp8gRc73p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747410341; c=relaxed/simple;
	bh=jujzv1V5FoF1DLtFut6okDvwAGrioiNeTy6wRdYWa68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=me9btw2EXC18jn8dYIevY1e1TJSppRyeVrLRAJ1qN9EW6Y6HDNAgupy4p6Eq6pjQcD/nkUHUxsJ7nM/IfF/ELszU+4HUGDOHBZN/yQkUMNADSQPK+ywi9jT5AGH7xiY3mlTCvb59bcYhsa6y3GETB3WurEkNa2dDJh9s5ZeGrDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhWNTKQw; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhWNTKQw"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736c277331eso3138955b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747410339; x=1748015139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jyfabEg48G74deVXTHyeyMTZY+4ojLpW8QPxHyY6vtk=;
        b=YhWNTKQwaXWxaQictf5oy8L7a/hwUATxr1diUPzBs1S1+I34oDtWxmUKPWAzwog1Iw
         ISNUhaP5ws5l2ZCxerhA1VK7RJzLyjQOFJnEgLaOkSpkn29MxrcSNN62rKuiDvI+qnus
         LLwi6u2M9Ijk8Nol8lxELNEEn/AzuGuaH3IBGpVCUfFoWk9LXwouan9scEoDpX2nDeU6
         h6D9l3fG6hcM+/NTY41CXIJkpU/G9MPoPJX2jQCGoB2U8unB9K+PLkDmCNl7Etkdxcpf
         YWF8ZK35ZEunQp87m9dP0c1TLJm99F5rpFuHCxo1zfzdLLa9z9EcPG0PQDncEc7Qttlz
         yDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747410339; x=1748015139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyfabEg48G74deVXTHyeyMTZY+4ojLpW8QPxHyY6vtk=;
        b=o4Qipin04GNhCS/ff1UGimsbYCdQYX8lNjCIOJS3DN29/Hub+IlJqoTYXMEcAHSTFi
         a/stNatsvCw7S5/P/U0LHXU9jA38IM5NCv97Md38xTiwgK/kb5qUahmDzLFkbDt02U4g
         1P1eLIQ8RYTl4PdquNV55dZqu+txxaLIyhi9XeJTBOTomdGkr5DW3oMJI2aABxgaG9PM
         WzNAKst9fmJKnMUngRVKnoJXj6RxW6ATRsFEzUycpD+TezuD9sAjuGi2TPNLyIIIE1jP
         8jgi3NIgQs09WzH/dmn8GGVT0dxFnzqujVWftMamsPBs4SZfqFczVGMpTr2wpYR8eaW1
         4A9w==
X-Forwarded-Encrypted: i=1; AJvYcCU3F8bGHJB0NVySLVse34bxp1u1TTRqO6BLLJvjjRz1vCn1tVWtSCSRlhfdGo9S56jaXioTFzUFa+navrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHBewhY3hFgEcSThqvujCzM6w997C7a4pmK+EzMCbBPH+hIpO
	bxBaZLD6hVdpGrHN0FuaJfqorJQyMXc7/H1PFKNBJrCoJ9DjmdiRxSAdgv8FpOTDhro=
X-Gm-Gg: ASbGncsUnWYAKM+iH2M5mMyQWTqAXEWje1/tXX93C0KIp1EoBuUsM9cJ5UkXthbFcCE
	32bwiuDhC5dRSQQ3xBA8r4r063v+RxHdafB5RMIpbsO69OBSlTKNMlHoXGwFbVg/V4lKTkZzxPf
	yfyTrcGjnPsEDPaLhFy+DSFrtHIJBNUGOe5trA5D51OmfrcwCbGCXkRqb4Qobbzb/8GmTfiScm2
	hVNf9K2hBx/Hq/yHg33qUr2T3pcJDnwtc+BTRnpTT0OpUdR7kRIwa6eSy2H+An5e92phn4Lc4/+
	zpvTb8WrbzO9LhUORr7kshGd615WmQ1lU7eQYieTyEyTruO2Zd9FzfY=
X-Google-Smtp-Source: AGHT+IF7qGPz4GJBtmzZCIHFP6fMe3cGuzibtQz/jTyla7h3D463M0OhWgLhYsPbMJPUv6Yrvu3jnw==
X-Received: by 2002:a05:6a21:6b86:b0:201:8a06:6e3b with SMTP id adf61e73a8af0-2165f684437mr5348926637.9.1747410339080;
        Fri, 16 May 2025 08:45:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d663:63f9:913d:ba0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb09ffb8sm1701801a12.70.2025.05.16.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:45:38 -0700 (PDT)
Date: Fri, 16 May 2025 09:45:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	jkangas@redhat.com, eballetbo@redhat.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 04/36] remoteproc: k3-m4: Don't assert reset in
 detach routine
Message-ID: <aCddoCUIpIV1ZxEW@p14s>
References: <20250513054510.3439842-1-b-padhi@ti.com>
 <20250513054510.3439842-5-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513054510.3439842-5-b-padhi@ti.com>

On Tue, May 13, 2025 at 11:14:38AM +0530, Beleswar Padhi wrote:
> The rproc_detach() function invokes __rproc_detach() before
> rproc_unprepare_device(). The __rproc_detach() function sets the
> rproc->state to "RPROC_DETACHED".
> 
> However, the TI K3 M4 driver erroneously looks for "RPROC_ATTACHED"
> state in its .unprepare ops to identify IPC-only mode; which leads to
> resetting the rproc in detach routine.
> 
> Therefore, correct the IPC-only mode detection logic to look for
> "RPROC_DETACHED" in k3_m4_rproc_unprepare() function.
>

This driver has been upstream for 9 whole months, it is hard for me to believe
this but was just noticed.  Martyn from Collabora should be CC'ed on this, and I
will also need the required R-b/T-b tags.

Typically bug fixes are not part of refactoring exercises.  I suggest to apply
this set without this patch - you can then work on fixing this bug.

Thanks,
Mathieu

> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v12: Changelog:
> 1. New patch. Fixup a state detection logic.
> 
>  drivers/remoteproc/ti_k3_m4_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index a16fb165fcedd..6cd50b16a8e82 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -228,7 +228,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
>  	int ret;
>  
>  	/* If the core is going to be detached do not assert the module reset */
> -	if (rproc->state == RPROC_ATTACHED)
> +	if (rproc->state == RPROC_DETACHED)
>  		return 0;
>  
>  	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -- 
> 2.34.1
> 
