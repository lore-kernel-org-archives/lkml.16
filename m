Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27F1F2B86
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739053943; cv=none; b=rFEwj0heJr8C5vjl/zHIp/jch9t2TTo9IqNCOQTKbwk3eOvo8CsfO1cnTENRA+mpcQJLyJ2wVb1KL+g9rhYD9JAxHlaRAdilbucOZQevuEJVK4LTeMcTv8TSI1nZZZxQpgj6OEqoZoYJf6lEKR4OgluMHZ+o49jmTAgzcQS1A60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739053943; c=relaxed/simple;
	bh=cmG/SbbB3cisojdaO+4uHb7XpN+HtDdeH9DqF1/z74A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpZBRNPjkg+PuY8X+y2xXxDs2QsmpXxbZfbluzqovMe1sffbJyUmpmZoGAmDoY/lB2XMwjVwFJLNN6/Y4OWDRJPVx+c99+5lfsI8pWTnWH6hg8wdzzSqYrG4cNVdu1xQ9caDSs4fsp9dKkRtsz3Deyp7V/bfw8OOxsm1lPm/jjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANau2tYU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANau2tYU"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30738a717ffso28874511fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 14:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739053940; x=1739658740; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OoAfmsggo7EidUtnQBiDbjVxpXFthZ69JupoUyDZEP8=;
        b=ANau2tYUun97pk+N4T5s5yD2tgPYjtXRwLMdW0dl1pZdrxRIQuUvkbyf49sd1G9JOe
         6bOpCTh9UPdZYDNOJk4ZPrTSeXDBnnflVsguDqZy+j9BsjzdoiXqC0+HngM67GTbK3NM
         jcm+hV2bTJcuhpnuumAU5yB72jwtg0yBLbREwQip/mxMUSsBdfnFYnQTYYrBMZ3wT5EJ
         tRYviQJLrDLakErMFMOh35e1BTEw43Hppzf1AHTOB52GnF5d22+ibPNP/1TA3SeUek/Y
         X1ID1OP5sVuouIR98xRCIxDBFFa8isJTyC1N5SLqaiQ8O2+2USvUFaUuPjrKv3utGBOs
         j3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739053940; x=1739658740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoAfmsggo7EidUtnQBiDbjVxpXFthZ69JupoUyDZEP8=;
        b=aNNEHTKGRRW8+ehUC6BIht8T28hgou+si8ZOcW5gZ1RKesz69DNJslo+i43LhEH8R7
         LTvaZMZ3K2CTo5kIhrvYthwd9OCRMDZYLqVQTeFmvm4+Zn9ZgmEzGyDO5IPcFNPWZcQP
         uTWM4tQRy0WFF63nYqfE9nOV4NBKnK5D64J8YG7IrYYbBeIWIRfnzOx6fGElC/wpCOLF
         fXoPq5KRRTkiekOFKbLvWAVnebKPeK3Dvy2DO7Tgox/8P2hwGgNWWYyKOjus1FnnFV2R
         Ls9DB2kfbm/XyBYZkKZY61k+lxj7rXZtLEHmG2ZJ88u+HYKvWiuOpVqtqvjx+v9pbjjZ
         FbTw==
X-Forwarded-Encrypted: i=1; AJvYcCUf7uChzIKz7jphfbdEGXHOkc5VggCiAJZ8Z9gW0kyl1qZIf1eHuOr4Jv5jb5dtzwlGUqNK9fvAX2vsAK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+5IBlIi3bZVf8ZNEAe0RRBfiEgWjZah4s2WKVE+dcuLd/6SJD
	7+QnFVINab6niIc8gkEzx6h0mmYvn6JuZ9VbzBdOjlpkGLRilW10w9FxaQqz48g=
X-Gm-Gg: ASbGncvJ7HBTr5Eq0cSj5FKvrROWtaI/zUToLgmr0bVkRnD4u1vO+f7mr5TUcBB9tso
	7CWVXn5rznL3tp6n+3vuy3GsygUC0FoO5kYVC1DmULnUCGnf1xH9GEGPt/5Cfu4RPcozppPaHpX
	ByR+MTW0s6u5Ae3xexS5u/kiLhlcTt6kkUCimXvk74ekKI4LX6wvajd1GyNc/izdB7Hl/Tz4tru
	qzkoDLHwu2DP1fS6TH0yZ/lBoLd1202MVl0+V7lUaL5PsmSlMNkuzkJTo+e4OzOYAA2+WYfvaZL
	USpH1PSQiEtow9eBqmSRzfo6BcKfN0YBmkIwvOCK2AY3AJGJuD5ooVs9IAWiyn+gmva6Eiw=
X-Google-Smtp-Source: AGHT+IHnMxSLCdxMnbDBy9u58ckrqNO9Jg2ChETCK+eCWlzlOT9M+YisygDlkTGNrNn8aaJ+5piFmg==
X-Received: by 2002:a2e:a805:0:b0:307:2bc6:5eb4 with SMTP id 38308e7fff4ca-307e57ce743mr25834061fa.3.1739053939534;
        Sat, 08 Feb 2025 14:32:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de18f728sm8231001fa.36.2025.02.08.14.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 14:32:18 -0800 (PST)
Date: Sun, 9 Feb 2025 00:32:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org, 
	quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	jonathan@marek.ca, jun.nie@linaro.org, fekz115@gmail.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux@mainlining.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <nx5zeueyifytvxpr5mm3njztt2npfbp7oczdc7zk2i7vulnoon@u2c5dfim5xci>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>

On Sat, Feb 08, 2025 at 11:09:56PM +0100, Marijn Suijten wrote:
> On 2025-02-03 21:14:26, Danila Tikhonov wrote:
> > From: Eugene Lepshy <fekz115@gmail.com>
> > 
> > DRM DSC helper has parameters for various bpc values ​​other than 8:
> 
> Weird zero-width \u200b spaces here between "values" and "other", please delete
> those.
> 
> > (8/10/12/14/16).
> > 
> > Remove this guard.
> > 
> > Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> 
> Should this patch elaborate that those "DRM DSC helper" don't have any
> additional guarding for the values you mention either, i.e. passing 9 or 11 or
> >16 don't seem to be checked anywhere else either?
> 
> And your title might have space to spell out "Bits Per Component" entirely.
> 
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 007311c21fda..d182af7bbb81 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> >  		return -EINVAL;
> >  	}
> >  
> > -	if (dsc->bits_per_component != 8) {
> > -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> > -		return -EOPNOTSUPP;
> > -	}
> > -
> >  	dsc->simple_422 = 0;
> >  	dsc->convert_rgb = 1;
> >  	dsc->vbr_enable = 0;
> 
> This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
> dpu_hw_dsc_config(), which has:
> 
> 	data |= (dsc->line_buf_depth << 3);
> 	data |= (dsc->simple_422 << 2);
> 	data |= (dsc->convert_rgb << 1);
> 	data |= dsc->bits_per_component;
> 
> The original value of `8` would overlap with the lowest bit of line_buf_depth
> (4th bit in `data`).  Now, the 2nd bit which will take the value from
> convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
> your new bpc value of 10.
> 
> Can you double-check that this code in DPU1 is actually valid?  I assume you
> have tested this panel at least and it is working (worthy mention in the cover
> letter?), this just seems like yet another mistake in the original bindings
> (though the register always had a matching value with downstream on 8 BPC panels
> for me).

Indeed. msm-4.14 explicitly names that single-bit field as
'input_10_bits'. The block is supposed to support bpc of 8, 10 and 12.
This bit should only be set for bpc=10.

Marijn, thanks for catching it!

We should start rewriting DPU register accessors to use generated
accessors. At least it will clearly show if the field is a flag or a
field which has some values. With the current code it is impossible to
notice the difference.

> 
> > @@ -1779,7 +1774,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> >  	drm_dsc_set_const_params(dsc);
> >  	drm_dsc_set_rc_buf_thresh(dsc);
> >  
> > -	/* handle only bpp = bpc = 8, pre-SCR panels */
> > +	/* handle only pre-SCR panels */
> >  	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> 
> Good catch - this comment sounds like it's documenting a limitation of
> this helper function, but the function does not have such limitations...
> rc_parameters_pre_scr has values for all these combinations.

I think the =8 part is a leftover of the old, pre-helper code.

> 
> - Marijn
> 
> >  	if (ret) {
> >  		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> > -- 
> > 2.48.1
> > 

-- 
With best wishes
Dmitry
