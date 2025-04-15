Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF091A3160;
	Tue, 15 Apr 2025 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729782; cv=none; b=qzDekq2qYheOFrK8m1z33oAeCGlpO0bdB7wf/DTAcAABlm5APYzJpRa9cyLbtRIxl3hMW1mu4U2sxt4RLVRd8MHRKUtogosxYeYGZ8+PR5582l/UXNbzWbpNfte5uFMhSNYwjdrJdbeF2IZ1iS6VFBu6EdCkCse+NeDUe3+I07U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729782; c=relaxed/simple;
	bh=T37Q0J3bd0JMMsOeZO3GhpdNsQhLsqE74NKeURsaiF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlNjfKU+ffclDom/Uc510oQW9tQtFRd9/jdo6Pf3Sjnu82l8zFsIYW8jEM+9aKeno2vj0CIC/p8yZmfAraRWWf8l8tycMm+Fm61VDdwIZ/5O3Jtl207jBT6YxmCbgP7yHH4zF0AgYzqsoHfheIBji6tg8wihqPspJaPwZC10d6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XHOxRdVZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XHOxRdVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE13C4CEEB;
	Tue, 15 Apr 2025 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744729780;
	bh=T37Q0J3bd0JMMsOeZO3GhpdNsQhLsqE74NKeURsaiF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHOxRdVZgDNKnOpafFd+ALkdGhTZnKG/Xukb4L0c86fNL4juLqYjX3+9swCL3qra8
	 VzkPpIsm4X7KaRuSEF6wPY5i+f7xScmAbWdzpza9hdYhBSfIMdmlSc4AR23gG8oc+a
	 gsZ4uK2Jbx0s7fUME8nlWxEE7P6bn1lMg8/CqWTI=
Date: Tue, 15 Apr 2025 17:09:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] uio: uio_fsl_elbc_gpcm: Add NULL check in the
 uio_fsl_elbc_gpcm_probe()
Message-ID: <2025041531-trousers-saga-ecb2@gregkh>
References: <20250401101602.24589-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401101602.24589-1-bsdhenrymartin@gmail.com>

On Tue, Apr 01, 2025 at 06:16:02PM +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> uio_fsl_elbc_gpcm_probe() does not check for this case, which results in a
> NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue and ensuring
> no resources are left allocated.
> 
> Cc: stable@vger.kernel.org
> Fixes: d57801c45f53 ("uio: uio_fsl_elbc_gpcm: use device-managed allocators")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V2 -> V3: Add Cc: stable@vger.kernel.org
> V1 -> V2: Remove printk after memory failure and add proper resource
> cleanup.
> 
>  drivers/uio/uio_fsl_elbc_gpcm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
> index 81454c3e2484..26be556d956c 100644
> --- a/drivers/uio/uio_fsl_elbc_gpcm.c
> +++ b/drivers/uio/uio_fsl_elbc_gpcm.c
> @@ -384,6 +384,10 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
>  
>  	/* set all UIO data */
>  	info->mem[0].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn", node);
> +	if (!info->mem[0].name) {
> +		ret = -ENOMEM;
> +		goto out_err3;
> +	}
>  	info->mem[0].addr = res.start;
>  	info->mem[0].size = resource_size(&res);
>  	info->mem[0].memtype = UIO_MEM_PHYS;
> @@ -423,6 +427,7 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
>  out_err2:
>  	if (priv->shutdown)
>  		priv->shutdown(info, true);
> +out_err3:
>  	iounmap(info->mem[0].internal_addr);
>  	return ret;
>  }
> -- 
> 2.34.1
> 
> 

How was this tested?

