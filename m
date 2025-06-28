Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2A71FECB1;
	Sat, 28 Jun 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122041; cv=none; b=pXCG0+xrjZXcOp2sbv6AS1ocI3ZK+1H2/fy9/vU9WQNbmC4KybxZlya6PJuSs9AJg6Hv3XhIlFL6qjP+R/94eZAMDmSmQxKgFfxflHdJy8IUOArhltdOJCpKdDohwDhs/KmK6RpUTb14+BT7iSzToTdnYGjrNrOwRj2UL75OHgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122041; c=relaxed/simple;
	bh=hLylioSzQgDU1OnhtndHvFUnS91BYfTenHU/Hs5TH1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiD5J1l3EvNgkhG1h6tFi+7Y9gSutK2w8Un7YQKorB0WQ7CtcGzufoluaM8o/xODO6lG856DzvryjBwi5ILFACGCRdqi3ng8Dkut+8p7sKVTesVWoXEipXZXfQ+BZgbJwBbnFBCGihlOV72zheJhHcX2UaTEx00RBnwoCA/qRHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SRyIbceG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SRyIbceG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36464C4CEEA;
	Sat, 28 Jun 2025 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751122040;
	bh=hLylioSzQgDU1OnhtndHvFUnS91BYfTenHU/Hs5TH1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRyIbceGBl4kRu8YsDaioR2mhUN6r+ZV63TItex0Uj605mKNuMFo/CBWtV57IVk+8
	 Hf1+4+/Yv1EzT39kw4chlUybAsriADgfI0vfcHETC/GwXmBg284XOKIAmWs1ieiGte
	 K69dlK+99Vqj3/lIpoxWsDRxSNC9FCMODLsZ3mKE=
Date: Sat, 28 Jun 2025 16:47:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: early: xhci-dbc: Fix early_ioremap leak
Message-ID: <2025062803-paver-octane-e038@gregkh>
References: <20250627-xdbc-v1-1-43cc8c317b1b@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-xdbc-v1-1-43cc8c317b1b@intel.com>

On Fri, Jun 27, 2025 at 02:47:47PM -0700, Lucas De Marchi wrote:
> Using the kernel param earlyprintk=xdbc,keep without proper hardware
> setup leads to this:
> 
> 	[ ] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
> 	...
> 	[ ] xhci_dbc:early_xdbc_setup_hardware: failed to setup the connection to host
> 	...
> 	[ ] calling  kmemleak_late_init+0x0/0xa0 @ 1
> 	[ ] kmemleak: Kernel memory leak detector initialized (mem pool available: 14919)
> 	[ ] kmemleak: Automatic memory scanning thread started
> 	[ ] initcall kmemleak_late_init+0x0/0xa0 returned 0 after 417 usecs
> 	[ ] calling  check_early_ioremap_leak+0x0/0x70 @ 1
> 	[ ] ------------[ cut here ]------------
> 	[ ] Debug warning: early ioremap leak of 1 areas detected.
> 	    please boot with early_ioremap_debug and report the dmesg.
> 	[ ] WARNING: CPU: 11 PID: 1 at mm/early_ioremap.c:90 check_early_ioremap_leak+0x4e/0x70
> 
> When early_xdbc_setup_hardware() fails, make sure to call
> early_iounmap() since xdbc_init() won't handle it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/usb/early/xhci-dbc.c | 4 ++++
>  1 file changed, 4 insertions(+)

What commit id does this fix?

thanks,

greg k-h
