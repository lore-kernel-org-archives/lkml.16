Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D210C21506A;
	Tue,  4 Feb 2025 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676755; cv=none; b=NYB/8XOeDS5obK71Z3gkgsHagdKROYlftscLbp66Um2lrwfJ4C/bfk4I2fnofs/bC8gpgklkDoxW9Yi0I2KDzrXgxjxMxoS0mGKNfCnSBWqI0AG/m+CB8JaJVHl55GTygIzxkVPYA/SF2iB8jOi0qkfDslEW/2wK4CUwlhy+jxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676755; c=relaxed/simple;
	bh=K3mhQFPvSsIg2MlFqrynU/joBUbDwF2MzjRyIfvOggQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds0Lv+lmgJsV4fZmOyjQTrLaksYFzUEWPa5JABhE1iPUHjSW6Gp1KFTtkJpELACeEk6wGD2XDI9EAmNR/FtKC4em56dfEZRcMvmSG2ZTidtLBYwyeB6exnmVswpbXOIkEQ8wU05gubblxf0rE+cMwUQe34cYh2teiKFaRKPPCR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TK49Vu9a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TK49Vu9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF022C4CEE4;
	Tue,  4 Feb 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738676754;
	bh=K3mhQFPvSsIg2MlFqrynU/joBUbDwF2MzjRyIfvOggQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TK49Vu9a50pBGfYXwuBnF04CQ5lN0cyPwaAO4oFxzvFc28QMb7/f7esa/z8oic1kN
	 iI+uSmlq5Jb2DJAB4Q2i4JpDWu63AlWK8c+2HKpLGEo04wdKM4zEVnYT/QM5GXoVFh
	 5ADR9kwIWuV9VRrU8GOvJOPlHlj2Ex2+2OPAZj0Q=
Date: Tue, 4 Feb 2025 14:45:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: Fix kernel-doc warning for sg member in
Message-ID: <2025020439-bulgur-ludicrous-5071@gregkh>
References: <20250204134423.28051-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204134423.28051-1-purvayeshi550@gmail.com>

On Tue, Feb 04, 2025 at 07:14:23PM +0530, Purva Yeshi wrote:
> Added description for the 'sg' member in struct dwc3_request to 
> resolve the kerneldoc warning when running 'make htmldocs'.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  drivers/usb/dwc3/core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index f11570c8ffd0..5e4daec322b7 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>   * @request: struct usb_request to be transferred
>   * @list: a list_head used for request queueing
>   * @dep: struct dwc3_ep owning this request
> + * @sg: pointer to the scatter-gather list
>   * @start_sg: pointer to the sg which should be queued next
>   * @num_pending_sgs: counter to pending sgs
>   * @remaining: amount of data remaining
> -- 
> 2.34.1
> 

What kernel version/tree did you make this change against?

thanks,

greg k-h
