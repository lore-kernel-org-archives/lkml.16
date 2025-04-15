Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE610F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702009; cv=none; b=OSrjAcwIfDhXr65gcIX/W29JXAruFue6NXXFXWhMJZRvjOL4vZqRHdph56z+w/P9u0FxXtddxft5vIUjq0VMp0ZCyf1TqizztnHdW0UFkY+/UOkmZklCbckHVfq0o6LBqpLfN/fqYxe7lk2pGCy74siMdfBSnQQBAa8nCcXu++Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702009; c=relaxed/simple;
	bh=ndmBc8dT+YUFbZUh8JSUskzkgEjtafSmthf85hpWieE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJhXE9Ne9kCt8PUiyZFQK31loGZpl24KG6lvozfmB1muBDnIs5EoCqOm+zPSpkMIQCzZ79bZV37fquJX/2Uhxw9W4DnJTXmgunTgBnG6O6+8a/6WBDYnFPhScfEQgDKtR9hoXFVFJLmPI4O70NixPClmMr/NMWVlMjcN6Osfhcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+soWiVh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+soWiVh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2279915e06eso55144915ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702008; x=1745306808; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCJNaeHH0qeNbjhZ4y2YJBf4Ih9X6gqwUBqd6D7xbtk=;
        b=s+soWiVhFQrvqTx0PlOvSWQB0LYI6Dkq5xgIaduyCsfnVJa13I13EqbaI4VC6PcBl3
         XjNA8/BCKPVDBzf5YW3dvfaAb/yI31loHO61jR8cOy1YgDB0/EI6wlfQ4cGvlf9kFBET
         rt6szD6Qh4uanOiCoab3ZWaE08xdAyXTcaL0gPZPMEQ38AWbCgEUQ2dl1HB9MXNGVfQ6
         NUcdpdNo3jFORAKu+xvPntisZSk8qhKJhcGLbsIkFvz4kKyYrSNxPmDyhfIlLVki3J8f
         /yJ/LGPRZdTnh8BC+PeXpyfWlIxRetl1g27htSY8jMg8/5b4/UoAkR15iYWbpcmHhA3g
         kfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702008; x=1745306808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCJNaeHH0qeNbjhZ4y2YJBf4Ih9X6gqwUBqd6D7xbtk=;
        b=i08Uyr+8azkdD+1mMfilKk9auwmdnUT/HyvZ/QQ0ElPLdayhMwkZkMtY6FGeJjHNUB
         AfmNjAe/70/Oab6jOiaKn572fjmU5aYmF6zvTfAZ5mTlW0QKQXnRN1YaQCcfkXAJWHSP
         smQp7Ry4/BYHURyls+Te3b9v0jbx0pYbsaWWQvAIoBJ8VSmfOQ+H7YUOYgqf3ld4ziGY
         Ore+P4ynIQyVVMXcz28uAG9ReAzWdrnuuexgmAzHAd1NdRaSHDaBEsez5fBXq9SSBhZR
         jrZeGmlNDgKcKz5qQCJmy78pSYM152XPLA562EsOyGRbIqNQL0FFG89RkEgHX6DJu/3g
         gdfw==
X-Forwarded-Encrypted: i=1; AJvYcCWpPar3QFsXkNnUGp5W3y9OEYlyS61NBISUae/E0SsMpwCzbknAW4mCwjySdgTruOUoEmyltniBe8nN9s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUg06IciAH36zvVnQbO4d0u/ja7lEJLfJ3rqps97K8IePtLgtn
	y7hwWk3f2ssLIZvsyzbC+zuqIm9j0xt29dZn1e30ygIjczxUQ/Qp2Gnsqx1UNQ==
X-Gm-Gg: ASbGncs/K/CxV2K85z4Nc2lenCK0bqNjjZAtGBjKt5bWBhawsToNF54iwxrkOyZ3O+M
	flRtCCthIknNJrXPx3xMlwhylCjnaavm860QoVoIgNYfbVRhtsY1f91TLaW7DU1hqDOi9ZH5yT2
	u0qhGkqkIWIhc1k3Q71e5E0C6OzVkhLkSqjMOhxlKycnYCANpTD367OmHrQT9PcR+HG4ohlJPW4
	1euDjcPziYtWuMyCNMpGtJXn30AiVv5tmxh17xOHIFk1q4cp6LYVaq/+/81kCf0deoc4PC12WhF
	T2iu8TDBduUE9opBPcsOYRG95d6ifzAo9n8AtLcPx3Y33rml3A==
X-Google-Smtp-Source: AGHT+IHguLmuMIGRBsFlyspehfjQDN2w8AskD61wkAT+OvpAWkCdIa3KMt+LNv9RjQaYs4JZBwB+yQ==
X-Received: by 2002:a17:903:904:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22bea4bd870mr208246955ad.23.1744702007792;
        Tue, 15 Apr 2025 00:26:47 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93aa3sm110866935ad.149.2025.04.15.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:26:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:56:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Sumit Kumar <quic_sumk@quicinc.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_akhvin@quicinc.com, 
	quic_skananth@quicinc.com, quic_vbadigan@quicinc.com, stable@vger.kernel.org, 
	Youssef Samir <quic_yabdulra@quicinc.com>
Subject: Re: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
Message-ID: <gq4s5je4grjjqwhrmrqrurglm4kctnsslwr4kllxdyphy4re4d@kzacgpg7k3xj>
References: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>

On Wed, Apr 09, 2025 at 04:17:43PM +0530, Sumit Kumar wrote:
> Inside mhi_ep_ring_add_element, the read pointer (rd_offset) is updated
> before the buffer is written, potentially causing race conditions where
> the host sees an updated read pointer before the buffer is actually
> written. Updating rd_offset prematurely can lead to the host accessing
> an uninitialized or incomplete element, resulting in data corruption.
> 
> Invoke the buffer write before updating rd_offset to ensure the element
> is fully written before signaling its availability.
> 
> Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
> cc: stable@vger.kernel.org
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>

Applied to mhi-fixes!

- Mani

> ---
> ---
>  drivers/bus/mhi/ep/ring.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
> index aeb53b2c34a8cd859393529d0c8860462bc687ed..26357ee68dee984d70ae5bf39f8f09f2cbcafe30 100644
> --- a/drivers/bus/mhi/ep/ring.c
> +++ b/drivers/bus/mhi/ep/ring.c
> @@ -131,19 +131,23 @@ int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *e
>  	}
>  
>  	old_offset = ring->rd_offset;
> -	mhi_ep_ring_inc_index(ring);
>  
>  	dev_dbg(dev, "Adding an element to ring at offset (%zu)\n", ring->rd_offset);
> +	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> +	buf_info.dev_addr = el;
> +	buf_info.size = sizeof(*el);
> +
> +	ret = mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	if (ret)
> +		return ret;
> +
> +	mhi_ep_ring_inc_index(ring);
>  
>  	/* Update rp in ring context */
>  	rp = cpu_to_le64(ring->rd_offset * sizeof(*el) + ring->rbase);
>  	memcpy_toio((void __iomem *) &ring->ring_ctx->generic.rp, &rp, sizeof(u64));
>  
> -	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> -	buf_info.dev_addr = el;
> -	buf_info.size = sizeof(*el);
> -
> -	return mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	return ret;
>  }
>  
>  void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)
> 
> ---
> base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
> change-id: 20250328-rp_fix-d7ebc18bc3be
> 
> Best regards,
> -- 
> Sumit Kumar <quic_sumk@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
