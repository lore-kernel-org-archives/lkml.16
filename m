Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505411FBE80;
	Sat, 28 Jun 2025 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122802; cv=none; b=cgMhwbF5zuCviao5MBLGHYSHwaDv/HRdT8dX+1Xdxbsz6UUKzG7sOnajF0ettec9pMDg1bjL7x2Imq2MFVOVP/ITcZ5SlxTwKlm76kQBcjnzKZHzQurjrRERpOjLLnMk8vCMBtIkNII2OIHItYsGGVSRpBtqoCw1ID8sErlgs1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122802; c=relaxed/simple;
	bh=/nORueu+E/VVO56WfdHAYQMg0q9l9q7SiKKNWkhQly4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai9BOPRUpvDn+Gmn8CtMWXbjBLs4DH4jur1YrDXsagIbjEMRS9UhUy0GDriNLSTJJCFosRJEmlrfvtCgEqAmcuDnjJupnNRqaxmLweCHZwdV495ab4qLbKMgdjZW2bdsv/fwq/xzdz8y02T7kTZT9Qxfp0zxgTl/debz6CmsqlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UgNQjIlY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UgNQjIlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174D8C4CEEA;
	Sat, 28 Jun 2025 15:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751122801;
	bh=/nORueu+E/VVO56WfdHAYQMg0q9l9q7SiKKNWkhQly4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgNQjIlYmHLD6XG6SaVW4pdP+XeAJpiD/c3JxhB5Y/ACLEfwgeFk2IJLPQRVBFs3j
	 oEhxcWRex8TYuDDhZNoYRJNq5/G5A6ZW1vdghMS1GhxegSOuyIzgOACMFaMprcqj7J
	 krdSA9YXrE7CAbA4lSwNZZYn1p6FTP+MeVrmr87o=
Date: Sat, 28 Jun 2025 16:59:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Akash Kumar <quic_akakum@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
	kernel@quicinc.com, Wesley Cheng <quic_wcheng@quicinc.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Vijayavardhan Vennapusa <quic_vvreddy@quicinc.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Initialize color matching descriptors
 for frame-based
Message-ID: <2025062812-surging-defiant-934c@gregkh>
References: <20250625101639.19788-1-quic_akakum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625101639.19788-1-quic_akakum@quicinc.com>

On Wed, Jun 25, 2025 at 03:46:39PM +0530, Akash Kumar wrote:
> Fix NULL pointer crash in uvcg_framebased_make due to uninitialize
> color matching descriptor for frame-based format.
> 
> [    2.771141][  T486] pc : __uvcg_fill_strm+0x198/0x2cc
> [    2.771145][  T486] lr : __uvcg_iter_strm_cls+0xc8/0x17c
> [    2.771146][  T486] sp : ffffffc08140bbb0
> [    2.771146][  T486] x29: ffffffc08140bbb0 x28: ffffff803bc81380 x27: ffffff8023bbd250
> [    2.771147][  T486] x26: ffffff8023bbd250 x25: ffffff803c361348 x24: ffffff803d8e6768
> [    2.771148][  T486] x23: 0000000000000004 x22: 0000000000000003 x21: ffffffc08140bc48
> [    2.771149][  T486] x20: 0000000000000000 x19: ffffffc08140bc48 x18: ffffffe9f8cf4a00
> [    2.771150][  T486] x17: 000000001bf64ec3 x16: 000000001bf64ec3 x15: ffffff8023bbd250
> [    2.771151][  T486] x14: 000000000000000f x13: 004c4b40000f4240 x12: 000a2c2a00051615
> [    2.771152][  T486] x11: 000000000000004f x10: ffffffe9f76b40ec x9 : ffffffe9f7e389d0
> [    2.771153][  T486] x8 : ffffff803d0d31ce x7 : 000f4240000a2c2a x6 : 0005161500028b0a
> [    2.771154][  T486] x5 : ffffff803d0d31ce x4 : 0000000000000003 x3 : 0000000000000000
> [    2.771155][  T486] x2 : ffffffc08140bc50 x1 : ffffffc08140bc48 x0 : 0000000000000000
> [    2.771156][  T486] Call trace:
> [    2.771157][  T486]  __uvcg_fill_strm+0x198/0x2cc
> [    2.771157][  T486]  __uvcg_iter_strm_cls+0xc8/0x17c
> [    2.771158][  T486]  uvcg_streaming_class_allow_link+0x240/0x290
> [    2.771159][  T486]  configfs_symlink+0x1f8/0x630
> [    2.771161][  T486]  vfs_symlink+0x114/0x1a0
> [    2.771163][  T486]  do_symlinkat+0x94/0x28c
> [    2.771164][  T486]  __arm64_sys_symlinkat+0x54/0x70
> [    2.771164][  T486]  invoke_syscall+0x58/0x114
> [    2.771166][  T486]  el0_svc_common+0x80/0xe0
> [    2.771168][  T486]  do_el0_svc+0x1c/0x28
> [    2.771169][  T486]  el0_svc+0x3c/0x70
> [    2.771172][  T486]  el0t_64_sync_handler+0x68/0xbc
> [    2.771173][  T486]  el0t_64_sync+0x1a8/0x1ac

What is "[  T486]"?

And where did the beginning of the crash report go?

> Initialize color matching descriptor for frame-based format to prevent
> NULL pointer crash.
> This fix prevents a NULL pointer crash in uvcg_framebased_make due to
> an uninitialized color matching descriptor.

What causes an unitialized color matching descriptor to happen?  Do we
have that in the kernel today?  Or is this userspace controlled?
Hardware controlled?

> 
> Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>

What git id does this fix?

> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index f131943254a4..a4a2d3dcb0d6 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -2916,8 +2916,15 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
>  		'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00,
>  		0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
>  	};
> +	struct uvcg_color_matching *color_match;
> +	struct config_item *streaming;
>  	struct uvcg_framebased *h;
>  
> +	streaming = group->cg_item.ci_parent;
> +	color_match = uvcg_format_get_default_color_match(streaming);
> +	if (!color_match)
> +		return ERR_PTR(-EINVAL);
> +
>  	h = kzalloc(sizeof(*h), GFP_KERNEL);
>  	if (!h)
>  		return ERR_PTR(-ENOMEM);
> @@ -2936,6 +2943,9 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
>  
>  	INIT_LIST_HEAD(&h->fmt.frames);
>  	h->fmt.type = UVCG_FRAMEBASED;
> +
> +	h->fmt.color_matching = color_match;
> +	color_match->refcnt++;

reference counts are almost never done "by hand" like this, are you sure
this is right?  I don't see the lock being held that is used when
reading/writing this value elsewhere in the driver, why is this safe
here?

And shouldn't the changelog text be something like "mirror what we do in
the uncompressed mode?"  Or the other modes?  Why is this one the only
one that does not have this check in it today, was it just forgotten or
was it intentional?

thanks,

greg k-h
