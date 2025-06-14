Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A18BF50F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749896250; cv=none; b=nS0Z4ZRdUK+rtQbqHs1e/bhOkFUI1AWF0Up6hqxCPucjYnqKpdDuvLxbh0KDh4X8KdwIZKj3kvWS+8hRh5dbLfmY9B2lumhinGfUS3Mb7sftOhjxqHSLd54MQN/XtU94U9xsKEKpl7X4xSfybGDLpAQwF+Vex6+DI4OYHMYUWfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749896250; c=relaxed/simple;
	bh=8MMSSOuV81jC9UC0e3mhk5q1uK3WJ+Q7Vb2Ibjx3I5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FStoKBuLlAdnDSHRhs+emrqBS7jsq16WDQMvhY93Hcn6+Xu0Qb6RPlLj2MFNQmiX5AEG0Ne5p5z7hFNeK4Nx0jyprBYoudkLGzzfN9guL4v/m/HoKoCpyyN3GV5oNtjUIpzT76H3CKvJ9P+A4synPEYx+sm7Cr3p13/6cE7ot1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgPvH0y0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgPvH0y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749896246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nWfzkp9DOQxWyynraH/ijyp0mDSRdle98rE+BwtdI/A=;
	b=LgPvH0y0LC9De8VQy/+T2CKF+QZQ6t74IbYQjYTiAclyWReSC3L3H9yBM9UkqnwdU4giRv
	iSktXyBIpW6eP8/dwt1WkbaN22ZU79xAnXbZyI+gGJSz+dZzLHxUZOn9cAFrLmk2qHFL0w
	0bs15uTqt8NMt8REW5s8fHO4u2JRIRM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-Z1GPSyG0PbuY6jr0qkK8bg-1; Sat, 14 Jun 2025 06:17:25 -0400
X-MC-Unique: Z1GPSyG0PbuY6jr0qkK8bg-1
X-Mimecast-MFC-AGG-ID: Z1GPSyG0PbuY6jr0qkK8bg_1749896244
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d1fso15905565e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 03:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749896244; x=1750501044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWfzkp9DOQxWyynraH/ijyp0mDSRdle98rE+BwtdI/A=;
        b=VhNCcp+hlh9Ke17A00ozV0ccw9h1Eabuz+hFKEXAj84CImnmmC2EL1I2DbntciqU0J
         cItDy8+7bFwEdXtzv/1DvrTKhY2toWcdxJx9n5KsBb9jBbhYgrn1XCL43qW5VNW0fWkf
         iPRF7twa5Cj3gx/AOexYB3UH5twMuRiKDrgZv25B0Zt/nnfoEq1QGxDc+QXXyh5XfS5O
         67uUzM+eckEPdfgnWeJnsyt6tObum/1RIg5wHDJ9e+qNrHO5osDvmpx8uqfh9K0SHRzb
         al7Q9CT8s3BFlm+DS/goePyZmAT9KYIQsBGrjpb+wZpxYcWOf7Nxy9JIwFi4ZBV5yrBL
         bDXg==
X-Forwarded-Encrypted: i=1; AJvYcCVIcPNxYEjdkNupxI2/l5gZyLldpAkEoOgN3a1D5N3FPTgtbsCguQt1t/8CE1SooQizLWfZF6wJhWdJIH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyenj3l/8n0EG5z7hvAyWBI0+tRVCDTpRwD2bljbTSx7jmAGgdl
	D1B9gyxkkFhe2yzchabhS6rZd0UZl2BejzEwo+gt9K9s9cXhhTt2w5lSCsMTKCezm7Sl42FHFwt
	0tD6CrL/uUlUv2HgAR7iMIBEJsyALFmtaq4k2nkGIe5XpaMbvAyLD/ivxww/R++hY1g==
X-Gm-Gg: ASbGncurfhy3zv20+2j78Q6Ags9peTtYowz1EiVSR6RR+Eru9+Gb+1A7aavvRqHhPmh
	ibNkJuDUy4Vq92FCOreNBnFz1yRUDc57sLvx6eVUmigrqVQ4jbdMtnAtTdJkSpukJXZ9HolRhqe
	XLH2mRtI6Yd3q4HuBYet4Uijj50ENYeH1kZ18D3LVW6Wcba3cXltzLLz2V7UL2PhOvjvE0Dw/f9
	5gr4vbLb6swl4NvDjCQXJvGdqlX/hDbyEDSF3mdrhJ14RcLIXAaZLWBNeLrXJx6pusHqCpE/9Z6
	AVySdfx7gjI=
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2653:734d with SMTP id ffacd0b85a97d-3a572e7a1eemr2781703f8f.28.1749896244135;
        Sat, 14 Jun 2025 03:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3biEpVOuRnqziHI3bd4pkeY+o+bBTVgVmJnrCTb1g1AU1PCZyfTJ+l+vhMsQAiXihkjOm6w==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2653:734d with SMTP id ffacd0b85a97d-3a572e7a1eemr2781679f8f.28.1749896243660;
        Sat, 14 Jun 2025 03:17:23 -0700 (PDT)
Received: from pollux ([2a00:79c0:666:b300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm80613655e9.12.2025.06.14.03.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 03:17:22 -0700 (PDT)
Date: Sat, 14 Jun 2025 12:17:20 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/gpuvm: Fix doc comments
Message-ID: <aE1MMHrTNuCFW2ip@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613235705.28006-2-robin.clark@oss.qualcomm.com>

On Fri, Jun 13, 2025 at 04:57:02PM -0700, Rob Clark wrote:
> Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
> and names.  Just something I noticed in passing.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 6 +++---
>  include/drm/drm_gpuvm.h     | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..0ca717130541 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>  }
>  
>  /**
> - * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
> + * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @priv: pointer to a driver private data structure
>   * @req_addr: the start address of the new mapping
>   * @req_range: the range of the new mapping
>   * @req_obj: the &drm_gem_object to map
>   * @req_offset: the offset within the &drm_gem_object
> - * @priv: pointer to a driver private data structure
>   *
>   * This function iterates the given range of the GPU VA space. It utilizes the
>   * &drm_gpuvm_ops to call back into the driver providing the split and merge
> @@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>  
>  /**
> - * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
> + * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @priv: pointer to a driver private data structure
>   * @req_addr: the start address of the range to unmap

Thanks for fixing this!

> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2a9629377633..0ef837a331d6 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1205,11 +1205,11 @@ struct drm_gpuvm_ops {
>  };
>  
>  int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		     u64 addr, u64 range,
> -		     struct drm_gem_object *obj, u64 offset);
> +		     u64 req_addr, u64 req_range,
> +		     struct drm_gem_object *req_obj, u64 req_offset);
>  
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
> -		       u64 addr, u64 range);
> +		       u64 req_addr, u64 req_range);

Not sure we need to change the argument names though, I'd rather leave them as
they are.

Acked-by: Danilo Krummrich <dakr@kernel.org>

