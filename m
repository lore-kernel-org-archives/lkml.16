Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218B1632F3
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738893994; cv=none; b=BcuzbTqe60qGfRPjwM8TtmWjgbtJqRlbGGaIwNUn7Ucd94cM2WMlB2RU+lipsKsDYdWujc6xzC42RWtgV3QjcQIw9YrADymDQlPlLv2RBTBzrv/qKuY86wkIsgX6HL4zHJp3RKUIYq8OuGwe9Nnh5b2tmop79X4hF5h6oJPB06U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738893994; c=relaxed/simple;
	bh=JqUXIcXk56HCeBpiV+ND4dzTwsPm0TGrW5Qo5O5sG4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtCk3mbc6uqWdAczOJ4XI3QhAVcUx++1qzB08TPt7ECo2KB/FAZICiAQcCKP8lwUITUzsIkJuC2wobMlj4n0NntLFxACcyUejefrZjtpW2YjBxGKnhrll2RXLJ0GC9DQRZTjwlnmFe7K68lwwplPaArcPpNwslvdhBmAsG46jhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9YuIOn3; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9YuIOn3"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso1688877e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738893990; x=1739498790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ujQXMd3f5rR8lvPCe761XT8r53CWwMCKlPO4+SHJsQ=;
        b=a9YuIOn3Yuov2vHPPInmDrRoK5+ExFRVWftla5W4+yHp1r6Iwd1wJJE1u3dLBRNvor
         0ZARhHNgQhjPTYxnFrPw17ewm8xAw4Vf7q0XRDyK4dG2Wow2YW+IgDE07lCQHevh2N9T
         0sWjCcKGwN0NeausVmsfyoy4/Fp36i0V2tWl5OL7lOKoJQ4svB5XvjevsZYwFtb9+mbK
         tifDI0RpJtWBTgCvheF7akbnGvru+fGMnBXNGhi5U4in+U66Wv0jSnjAXCxqv0TlhO9r
         FuaBs9uY6kvJrSIRu/mHjXCE4mBKc84X41JFvE6dMUfSDpqRVNW/34yQ4b+FHNgPME32
         lycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893990; x=1739498790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ujQXMd3f5rR8lvPCe761XT8r53CWwMCKlPO4+SHJsQ=;
        b=JBtsyKD9ia3oikTkNnEz24Tsa/l2s7CXZW4F9Q4J63amfcIUw99WXk77syVCh0hYRy
         l6EUpc6Uxw6gl0564YpEH05bh6l21Nce+vsObYM9tUJS0PWsv3avwsJAF6OpHyhXznJY
         3/0Ta4iK3N2ManPc9U2nqqwb9Bb61s8PCqPeQUaa3MXdJaN6Bdd4doRK6owcT4DQ6iXB
         tZh32QPR3v89f+ssXdY5D9SlcPtVBkk7cUkz+jp660iHe6DK/KpSNjHptlIgrcLUdd27
         3LHwpb4d6TJroczdHGZNOtJ7m5mV7Ohu8EvmXxU7zVfOfgR+/V368ts7yZoCjspQb+9o
         4ezw==
X-Forwarded-Encrypted: i=1; AJvYcCUcOTN+yuS/lDHLwI/2OvYzaIShUAJ9ubMt4nsOSFHyuh7fi68yqTyE6A7X4zmOd5mnHRXvi3/C3B9ynXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8o5Txuvk40l2L7De9lj9Q52TZMusxXx0xdcY4HH7FnMhT+ADo
	YsdwWOH9n5eGfYoYlo9klKNjBbL7ctvCNNnRjquOuwXy9ZnVpQkyKy3XuVWK030=
X-Gm-Gg: ASbGncsvoEjn+4Ig1BpSQrpy21C+M0DBLHxVJdiK1Bsl72QEYS9nrbtnn4B+8GGn2Zu
	qa1vMHJnGRw1WHA6xB4Djv8Ry+22wpBkeLGyV4u0X3BVfz1yxbSnHj09LB3hRaWIw6jRvjz72BK
	VaW7gG98G/G1LAtIUTqtT25+wYMkP7ukCuqF8SNJ8dMJdgT1M4uPMl3p87uJH1FOedQCoJnLoOW
	abZBZlFlPmNbAkO+dQnJJFhbYz+w0uJBznh8qSOgv5GvdN4UjRb59Roa04/BY7Xw1RSKeVDTmmH
	wW17gVgtWj9JCEOcUdiD/PNIB/9kWuga+6yrmdzl2g6H/vWBFcafpS59fBKU0JTsVsXIYl4=
X-Google-Smtp-Source: AGHT+IGSvbfbhwvFe2ZxA945w3FQ/WVD5eHjbkXKqsZNGZOOvNSGAyY3FitJEH9UmMivIMdxH8YSOA==
X-Received: by 2002:a05:6512:ea6:b0:544:132b:603a with SMTP id 2adb3069b0e04-54414aa8905mr250920e87.29.1738893990018;
        Thu, 06 Feb 2025 18:06:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105557ddsm292039e87.75.2025.02.06.18.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:06:28 -0800 (PST)
Date: Fri, 7 Feb 2025 04:06:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/14] drm/panel/boe-bf060y8m-aj0: Move to using
 mipi_dsi_dcs_write_seq_multi()
Message-ID: <mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrpcvdwp@wmvfvhaqhpkm>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
 <20250206-mipi-cocci-v1-1-4ff0c69e8897@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-mipi-cocci-v1-1-4ff0c69e8897@redhat.com>

On Thu, Feb 06, 2025 at 04:05:56PM -0500, Anusha Srivatsa wrote:
> Use mipi_dsi_dcs_write_seq_multi() instead of
> mipi_dsi_dcs_write_seq()
> 
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier dsi_var;
> expression dsi_device;
> expression list es;
> @@
> struct mipi_dsi_device *dsi_var = dsi_device;
> +struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
> <+...
> -mipi_dsi_dcs_write_seq(dsi_var,es);
> +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);

This is not enough. All the commands and sleeps inbetween should also be
converted to _multi(), so that there is a single return at the end or
even a return via the context. Most of foo_on() functions can take
context as a param and return void, having error code in the context.

> ...+>
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 36 ++++++++++++++------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> index 7e66db4a88bbed27920107458d01efd9cf4986df..640312096c1370c293c84431efa6fd17dc520f2e 100644
> --- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> +++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> @@ -55,15 +55,17 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
>  static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
>  {
>  	struct mipi_dsi_device *dsi = boe->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  	struct device *dev = &dsi->dev;
>  	int ret;
>  
> -	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
> -	mipi_dsi_dcs_write_seq(dsi, 0xf8,
> -			       0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x00, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
> +				     DCS_ALLOW_HBM_RANGE);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x00, 0x08, 0x10, 0x00,
> +				     0x22, 0x00, 0x00, 0x2d);
>  
>  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>  	if (ret < 0) {
> @@ -72,17 +74,17 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
>  	}
>  	msleep(30);
>  
> -	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xc0,
> -			       0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
> -			       0x2a, 0x31, 0x39, 0x20, 0x09);
> -	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
> -			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
> -			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> -	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
> -			       0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
> -			       0x5c, 0x5c, 0x5c);
> -	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x08, 0x48, 0x65, 0x33,
> +				     0x33, 0x33, 0x2a, 0x31, 0x39, 0x20, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x00, 0x00, 0x00, 0x1f,
> +				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
> +				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x20, 0x04, 0x10, 0x12,
> +				     0x92, 0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83,
> +				     0x83, 0x5c, 0x5c, 0x5c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x01, 0x2c, 0x00, 0x77,
> +				     0x3e);
>  
>  	msleep(30);
>  
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
