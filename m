Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB602500DE;
	Thu,  3 Apr 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689465; cv=none; b=EKxXlg7VdircQDwmMsSpI5PnTYYc8INte/XRtrA9zeP7iqALL5brCuqBUobYn8FDpP0JHkhrV5gtCbulVoEG0xius+pDdPr4IHymjZOkI0Yd9Fqd3+FvfhXb3anbL+tKbxAWgTKS0sLdfsI0YhjVIT2Qm4X9Fdqfadf6lrCGoR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689465; c=relaxed/simple;
	bh=nQl3cTdTbatl1g2M9BKMpP0FL0R93Xmbz3gVBMTA+1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uF9LhBYVW1lh7STPBUgiXTl8KG6E/gDxm4uf/1IxE32BIy4t/eTZSn8e9lAN2x7Q8UeEgsB/QPQWwkF0ekKvwpqWtZlZWqyaGJw69TR4iEiTjSWql9I+cRV1RdsAsI5fTIlNt47Z2S/2f9oXhP0VIZh73qoEuNuiG0sKitYp09Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ck5Bic97; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ck5Bic97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1CBC4CEE5;
	Thu,  3 Apr 2025 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743689464;
	bh=nQl3cTdTbatl1g2M9BKMpP0FL0R93Xmbz3gVBMTA+1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ck5Bic97/mCQ3d+8QIehgZa4Qtq0CZK+lTbYWcWyWXKO+FV2tDN+OrRepgE3YK04W
	 zP4OuYcXZy6GrJKNjuI+oepwK1TQc2jzh6NxfflkN6Chdv9LEhtulY1pOCcKw+IsFF
	 qlRQTopj4nzPa3rTNBUvHfCXS3mOWhAl0Cqaom1A=
Date: Thu, 3 Apr 2025 15:09:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: nancyenos <nicymimz@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: Fix unused macro Argument 'x'
Message-ID: <2025040315-squid-gloating-e0df@gregkh>
References: <20250325100952.2956-1-nicymimz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325100952.2956-1-nicymimz@gmail.com>

On Tue, Mar 25, 2025 at 03:09:52AM -0700, nancyenos wrote:
> warning found by checkpath.pl
> 
> Signed-off-by: nancyenos <nicymimz@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 44cced319c11..0155f3c41657 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -8,8 +8,8 @@
>  #define OCTEON_IRQ_WORKQ0 0
>  #define OCTEON_IRQ_RML 0
>  #define OCTEON_IRQ_TIMER1 0
> -#define OCTEON_IS_MODEL(x) 0
> -#define octeon_has_feature(x)	0
> +#define OCTEON_IS_MODEL(x) ((void)(x), 0)
> +#define octeon_has_feature(x) ((void)(x), 0)
>  #define octeon_get_clock_rate()	0
>  
>  #define CVMX_SYNCIOBDMA		do { } while (0)
> -- 
> 2.25.1
> 
> 

You sent this twice?

And always test-build your patches before submitting them.  This
obviously will not build :(

thanks,

greg k-h
