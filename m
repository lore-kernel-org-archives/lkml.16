Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B31A55;
	Sun, 18 May 2025 05:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747547414; cv=none; b=Bno92A36Ue6RDAl4YhE5Thf6AcbuXy+3+uGg9QBlEBhBAMauGgifftPHFS6II95F9mhNLerDlFBwejToYksVeHIDHYiF3qt14j4rlsb9IL6S6vDOvMqLjAG7fpYGLNjwyIdz/4lYAyr+orp/EMXrb1wrV9h6XiwYaAteeoTIIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747547414; c=relaxed/simple;
	bh=Ojdw8Yl768e2LgUcEH9jKmLyyuUuIBWtVR+uod5hSQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxYmCKXUW6cBH5NvPt5VGMH+cgbwqXyPlN5DasoMLxyHPzZZbBBIWjRuU5aDzOUg79ZDA1hgGIGK8lDli/b3ToqMY6g1u4DT/LoA3C+tMU7nSm2bkz4U9sFw5DEyTKz0eXLxM2MmkbUjAjX4qT8kUYL38uF2MvqIHWVwmGme5+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hhQTEfVd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hhQTEfVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9821CC4CEE7;
	Sun, 18 May 2025 05:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747547413;
	bh=Ojdw8Yl768e2LgUcEH9jKmLyyuUuIBWtVR+uod5hSQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhQTEfVd9iDC0t8Kg6f56OCoDfcI+DY5rjM0LQGh46vavTpbH/ikUAn3x3zUUMri2
	 H6k+xVIksOy0QAfGnRPHMZlSBYM+Pi9cUAWKSbiEn6ua4swbhTHRmiCzTnFPyk7/O7
	 B9cl65j3PxljzVRxwIq5y+cV7bjTe3r35K9n3d0c=
Date: Sun, 18 May 2025 07:48:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Velez <jonvelez12345@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in
 dwc3_request struct
Message-ID: <2025051804-cherisher-rage-d7ad@gregkh>
References: <20250516235447.17466-1-jonvelez12345@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516235447.17466-1-jonvelez12345@gmail.com>

On Fri, May 16, 2025 at 11:54:47PM +0000, Jonathan Velez wrote:
> Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
> ---
>  drivers/usb/dwc3/core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index f11570c8ffd0..bb140dde07d6 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>   * @request: struct usb_request to be transferred
>   * @list: a list_head used for request queueing
>   * @dep: struct dwc3_ep owning this request
> + * @sg: pointer to the scatter-gather list for transfers
>   * @start_sg: pointer to the sg which should be queued next
>   * @num_pending_sgs: counter to pending sgs
>   * @remaining: amount of data remaining
> -- 
> 2.43.0
> 
> 

For obvious reasons, we can't take patches without any changelog text at
all (and you wouldn't want us to.)

sorry,

greg k-h
