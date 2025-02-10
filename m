Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E465A46447
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739158878; cv=none; b=BTaKCpVqJW9SxbFRRlddx3IAnYHIHYQpr4XrOSvCsyWbvMampip7k03CRGOYbwcS46pVlr6bktKyq7jIsowmx2V1VFHovA297HEeTLDGwGh3sbbXY7t+Eft3/r0QXz1Hp/4L50EMqMj6sBK9VILjiPkwE/JP+ll5PK7bwOuHrYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739158878; c=relaxed/simple;
	bh=jmiUe51uVwfNO7Yc9rbiTw/w9FGfidwf+BX6y6QUDkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onKeFzGTeGpAMNPgawW9bhn3HOnOfWEmSY1LGO3Zkj2KiWseFlAH/+Ba/kUn+5dqDgmYMGFXH5gIxJWR4bfcyS4+fYOttTRa4YRFtgu/cxAcw8MHEKpYo8gE5cjbr3qI02LS5ZdHGzG9B0hM75CVXWVUmXgUaogz24+hwVYKFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TncuxE5h; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TncuxE5h"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-307325f2436so35950331fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739158873; x=1739763673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=npEs8jA07Ng6Z03mAEVt5n9zo6OF7AFtNoGrjJ2+5Mw=;
        b=TncuxE5hWC3f3CFYs/Scb2745g85rgawqUwjez3nHFg5uIHVQ+1+XxpxwedQkHLxMq
         9jFSOqoulMPwmMcdNdCMlSvdyJJQTYHyWVRqQ2nbfMEi5Q7BGox7Nj/oTrWq7UpHUwVD
         WN4+NujQUmXYKm0eG3Rk1M4l7k+Bpp457uDqVUCXX+uojzf1HA+X1smAKosZ1riv2i7A
         8IJkuwnVteFesEXJ5WOkpIja+cLYWVE3cl4hXdOKNulwp0k9/S8vGfB26Qc9zOD1kimZ
         W62b6g8qiuQIADuyePMzwM38rdhubNeP2Agq/b3mjs8ly8maUqSOnjlWernKc4kSzYTS
         2Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739158873; x=1739763673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npEs8jA07Ng6Z03mAEVt5n9zo6OF7AFtNoGrjJ2+5Mw=;
        b=MHCN6hZYAKnFCND3I8N1v0MVKv30tiq/H0dbnE0RJWivS3Nf+i14vPs0u7xreZTLQo
         6PM+tPRZvva5qzm49MvXbkiX1azrCadL4IVQu9z5ygRxWEztdFss8tKL4chxuli9iHJO
         hrP5KW4s0uAryYrbP+ZzkGzlx05vaVfCdYA+9JfCQrvpEzpd9cP8WL7kbZAYYeeVfNdH
         x/4guiJUBBO9lramArjHUfeChPy7tkaRhGCccLrk4TI+YDoz/XUBNAVMpY5+L2rWUXlK
         Y28vV+RSeMvIAX4gTTdtJiZoqZVXcQggc92IpwyC3FbvWxFYhPrFE0TO4s8Km7zOKO8e
         TjNA==
X-Forwarded-Encrypted: i=1; AJvYcCUkm0BLLUA8VupQMCqN+nuwnu4o7cUBXL0TYMcLJiAZQnOoElZHTult0IjBvM+W6/0xyjhk92rT3Pfh9XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEiezoLbFEnnDDUPnU6bkjfVFZd+hf/RbRm/jqlVt9Pa5uM8B
	rTt63fpYeH7+roq/ojpfGt5vKkcWkcU8ouRU2OiKvNK507QuDvLXYYwoKqy8QFs=
X-Gm-Gg: ASbGncuEcUeoxt78Maq61ApMJcyaiyOESX5Br5x6TT+gyvMfZI5HzdCB+msP/GqDb81
	hnWC+X2x3lwoCu5s7a2uHbnplrHqB1YZh6B8KVSfH/piT38BMtLxsVpnMAGwVx/VPYSJj55se+N
	iVdEW5CtKCkodZatKX+QgjMV8ykE7XZyMQY98d0u8z/6hteAbZzMm7GJH5i/74o6sW7JP2H/xlL
	eS3w8p5vvEcqmZJFF57Dh0iXhsE5m1FDJejnuzWmDcju2wPPnaolMLYuBO+/dLRoFtS5hWUQCiB
	8sg2sOjdy0tnbrZ78z+BIqWr9Ay6xpWZRM6GhHGzqetTG9/bTCv+yV86BhtPoPxfGrTY5Lk=
X-Google-Smtp-Source: AGHT+IH7m6oiasYVqnzqsfHHyi3NYn+WrwlbtgfZKMfhDxmQoU4N6KPHZD2MhJ82kLTvoCVN0EbGyg==
X-Received: by 2002:a05:651c:1986:b0:302:3356:7ce2 with SMTP id 38308e7fff4ca-307e57ca9acmr39237721fa.11.1739158872958;
        Sun, 09 Feb 2025 19:41:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308f2d7fae7sm567661fa.39.2025.02.09.19.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 19:41:12 -0800 (PST)
Date: Mon, 10 Feb 2025 05:41:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix uninitialized variable
Message-ID: <o7yqskbm6px5t2klbiid7dklogrchyn4we2radaoznopupczxw@imywm2ngpoc5>
References: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>

On Sun, Feb 09, 2025 at 10:32:33PM -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       unsigned int num_planes)
>  {
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;

Thanks, but I think it better to make the function return ret from
within the loop and return explicit 0 if there was no error.

>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> 
> ---
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> change-id: 20250209-dpu-c3fac78fc617
> 
> Best regards,
> -- 
> Ethan Carter Edwards <ethan@ethancedwards.com>
> 

-- 
With best wishes
Dmitry
