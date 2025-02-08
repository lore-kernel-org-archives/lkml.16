Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E5246327
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 11:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739015503; cv=none; b=J9nl/HUFUiW+dXNDloXDe8awORoCPNeoeSyQ706XeGlUHjMdr/gMQqj8/I8h3JjsEsZFCP9xb+2lRPlWti3mnru1Q5peWvhjHpaJ/N+IRA7nHlJ0h9ackeJm+oKWYSwDcFf77g3pnYK3PqImtjFF44ln21T3Tm/kHpGQ/xmjNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739015503; c=relaxed/simple;
	bh=kLBkZCjUhu5Rc0uFvXeF+EVZ/UvvOlU+3MJpViOlL08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8HwIUtqLzW//NyT7npAZZhO9gHL0OwiMOEeKxb/bnV8gvBN07WXgCn+25ts1pYpRi6kLp6sfcM4AfAg/Uycj8GBfIRbNnYmj9so2v1d/zycCyRiiBrl1NrcMMpRFiNLY1jB2oNCpjQIk9/58Nob5WcDxisiH07btFPDuy/rtgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LqlH9L/b; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LqlH9L/b"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-545075ff6d5so95514e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 03:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739015499; x=1739620299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/KWkTtSxyAD0TycOxsbaDEty+yUoozFaWimwQpzkH/0=;
        b=LqlH9L/bUrUQtvDsmvx9001QCgmeYI3kSZxbNWnnYRDax+cTGtVIrAUfu+ZTedeQAo
         RIH8O0n5i/4cAOIAcNs+tqd8wGBmNii6gXLwGrJFkPL4KFBz0GM198V7GM9hGCslCEi9
         t1Is1sBrZZFTDDwzC5fnGxC45dWpUqmSjO6rmuGkl7izYOqoxAlNTfbFSSzasYj9m0h9
         ztce31hOcP6YkEbT88znXiKNJPOxZ/8A4ld9chgBIwAgvuSMRjQqKUrT6+qDUSXEsa5o
         4RDXxaW9OAuwa+LM2L09wcFXbOTKBkz73N49XNoMWQZ9Tc40yLxQZLSWS3F/Sh4DQvAG
         vdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739015499; x=1739620299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KWkTtSxyAD0TycOxsbaDEty+yUoozFaWimwQpzkH/0=;
        b=uBjEOkQ44smlAO+tKsFPpsu3FONtacKVXh7RVeJNdpIwZ/S77mZc9TZnFZm2jY7WEW
         AtqxGjqtQumJZZv8ZkRWVmA2b0lXD4o//k7YU2KOxsU5EJJdjGj9oou/46w3eIXesj85
         voOStQ9PpE/ZFpnDGcTPwb7MBA6DdXwq3yBYJU8Hd2stuF+YA4KO2N6yvWP67h1TsKU6
         fQS6MyYcAsbugQ1ghX1goUxfpXJmtRG4EgEgBKhZI0d5qVRQkSBc8AsROROV1EGmn0l9
         +joraVEoFS/TTPt7G95gMJRBEjP9jywCSCrXY1UObXGgpdc4NyIf+cxDa+gSzOy5+8kr
         Q8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6+YIQGUbN/ELYpl2y719Mz9emCvGFXROf1F336OSWjkfx7k5M2kyz3Ajjhab/ppGjk1GcFfOsRF4Puxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDdDMRrgAUPQVwf8sr+GQDiVvNEq8GNTWgLotwKANhjr102kvj
	9PmwhbhCLiLC4kcp9hLKfarmSjoorq3lFQ0Boqc3OJd5TfgOXwuXTWGDatrkpj4=
X-Gm-Gg: ASbGnct9WuREv+vaRPf8glicADpdM01xGeTWe5eH+6v8vlhlwV2SPpaX6jguQfW8Gnc
	ImZ8Cl3SkV07yryxTs3LysDau9Ca0cs/ypIg1WeiMnK/l9VvSfEB8nUObtv/EaCHcIvtas5TFNJ
	fxh6OLEPfNck0y9LL+9fx+4ZeCpMhJgo1LbM6+bhyMVOgqZGXnNnVNI1NEx/ol59MPXi9f3GxYS
	/BErX4G35O2FBHvT9oFMIm04omgUBa6E9tN7LmHON1gWQlpgys4yR0NoXHpwdtYVitXOQNSvZcM
	i4iUBWKo0MYh32/CsUV6iXXJWNJhXg01F/vhINh9oT7P1GpNOr0LHrHGha+9y4zAXFa6s1o=
X-Google-Smtp-Source: AGHT+IFVANwHEGEIiKS7ESzLOzalgWZ88CbKZgKjivaqeSCA8Ol31KRlZDcLcS/X0/BdWQjJ+9RDDA==
X-Received: by 2002:ac2:5eca:0:b0:545:40f:575c with SMTP id 2adb3069b0e04-545040f58bcmr699914e87.0.1739015499109;
        Sat, 08 Feb 2025 03:51:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54412885e19sm628967e87.152.2025.02.08.03.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 03:51:38 -0800 (PST)
Date: Sat, 8 Feb 2025 13:51:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_jesszhan@quicinc.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: visionox-r66451: transition to mipi_dsi
 wrapped functions
Message-ID: <2yesnamgb6haoy3xxxvlb4d26a44incl2k6cpyl3x4nnf7qhok@b66pfkcxqh7p>
References: <20250208051541.176667-1-tejasvipin76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208051541.176667-1-tejasvipin76@gmail.com>

On Sat, Feb 08, 2025 at 10:45:41AM +0530, Tejas Vipin wrote:
> Change the visionox-r66451 panel to use multi style functions for 
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-visionox-r66451.c | 179 ++++++++----------
>  1 file changed, 76 insertions(+), 103 deletions(-)
> 
> @@ -187,25 +181,13 @@ static int visionox_r66451_enable(struct drm_panel *panel)
>  	}
>  
>  	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> -	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> -	if (ret) {
> -		dev_err(&dsi->dev, "Failed to set PPS\n");
> -		return ret;
> -	}
> +	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
>  
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(&dsi->dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(120);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>  
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(&dsi->dev, "Failed on set display on: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(20);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>  
>  	return 0;

return dsi_ctx.accum_err;

>  }

-- 
With best wishes
Dmitry
