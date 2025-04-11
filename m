Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B72E8635A;
	Fri, 11 Apr 2025 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380070; cv=none; b=WKfis/zmujnmev6THdCAJ5VRk5UKfa2Uq2L35RQ/dKFDdHJTk+UAOghOrDYgsmceJh7QykBISFl/xtUBlqzf++kTdnXnlYRSZigC+tb60kvzJUPnvq5lNdId0wuoquhTr844n+3maY09Cs4CeUwdpbdYZ2ZBG33wkehMli/oodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380070; c=relaxed/simple;
	bh=urk+8jTLaaBxcIVbtmSiUKTuFqpND3ByFDUrvvWBptA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pslW2WOsAkwt5CzyOqeiyFoBA7HBEdnJ4lVOnGY1pL/EzUXnJX/RRe33sK49BdCMBBs4NkK4L9S33Au6BelyXM/dY6Uv1Oo2R+c4JwYtOVMXY6KlJVyoq91RW7JrU+rnAXFJajsNpbD15VyTnk1ZNzJatbnJQ+ucBkLzsaaD+x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SjS/HrlG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SjS/HrlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544DEC4CEE2;
	Fri, 11 Apr 2025 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744380069;
	bh=urk+8jTLaaBxcIVbtmSiUKTuFqpND3ByFDUrvvWBptA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjS/HrlGe16mxal+he+02+l3Ekup3GwClH0gQ08+SQKhvrYQJxZHUEQ9koO5a5LsK
	 80W0fEvNWZGvK1t7s8AcI5gC572uM1iVzbmKdUbFvZhl3ds8LVHtQoj8+n70t3jpqa
	 Hgm94kCqz+B6PUDhnzcF/fjbhLBDn+oyTxYp8Sa8=
Date: Fri, 11 Apr 2025 16:01:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, elder@kernel.org,
	quic_zijuhu@quicinc.com, ben@decadent.org.uk,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/4] usb: add apis for offload usage tracking
Message-ID: <2025041107-guru-epilogue-a4b6@gregkh>
References: <20250408035833.844821-1-guanyulin@google.com>
 <20250408035833.844821-3-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408035833.844821-3-guanyulin@google.com>

On Tue, Apr 08, 2025 at 03:57:22AM +0000, Guan-Yu Lin wrote:
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -647,6 +647,7 @@ struct usb3_lpm_parameters {
>   *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
>   *	Will be used as wValue for SetIsochDelay requests.
>   * @use_generic_driver: ask driver core to reprobe using the generic driver.
> + * @offload_usage: number of offload activities happening on this usb device.
>   *
>   * Notes:
>   * Usbcore drivers should not set usbdev->state directly.  Instead use
> @@ -733,6 +734,8 @@ struct usb_device {
>  
>  	u16 hub_delay;
>  	unsigned use_generic_driver:1;
> +
> +	refcount_t offload_usage;

You now have 2 different "refcounts" for the same structure, which of
course is crazy and will do nothing but cause massive problems.

I know this isn't going to be used to "reference count" the structure,
and surely you don't need/want the atomic properties of a "real"
reference count, so why isn't this a simple integer?

thanks,

greg k-h
