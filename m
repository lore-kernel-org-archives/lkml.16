Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A975212D7C;
	Thu,  8 May 2025 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682080; cv=none; b=gR1i87zPwA844OO9y2xtuYH1BHW6xr8EVVIDR3UJzuipfoAVcLGBK2C1ySxCg3lAPYUXYNe1B5LNK4czNZlYcGywQlzqSaYw1aXgmJBSCmtDPrvk5Yt5rbXM/8bfpsCyJUY8Ljh+kWWku5QHJIN3DRCUExtXT0ix/2fLMojTofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682080; c=relaxed/simple;
	bh=FKCN+xZrHEP+zcN12EM0hglv2leVoahfKiHhwm2cT64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtAXkROVvBgR8yW5AvYOZBKDLAF/d2gUndoXLbuHNGzHTdOlqjjTMTlfhJKnnCYs3VGBc+XhSNScOyJQJRMWqvxl9UKDBxNjB2jHq+IkDczc3rsX6ct/5lOTKW7Iisju8O9Z7tOnD9CThLsnVxRjjfaC6QW/0GHqGfcpy05++jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QHX4nhr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QHX4nhr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0ECC4CEE8;
	Thu,  8 May 2025 05:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746682079;
	bh=FKCN+xZrHEP+zcN12EM0hglv2leVoahfKiHhwm2cT64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHX4nhr6QpIwmQ/3U+cImX4n5o3AWeFtkg/K7JUPUnxXWa5/e4GMcXlmseceAOXF3
	 0F+gWW+C3tqqBpewZj0348ScbF4KLeeomT1B3pbBGUxBU+mFpTS8E0qEJuyqSPgZ3I
	 HusN0Ik055WaHFJYvwU+xyXifcnvuCpVVVxKqbig=
Date: Thu, 8 May 2025 07:27:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: quirks: Add NO_LPM quirk for SanDisk Extreme 55AE
Message-ID: <2025050825-census-slum-6f37@gregkh>
References: <20250508033123.673964-1-lijiayi@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508033123.673964-1-lijiayi@kylinos.cn>

On Thu, May 08, 2025 at 11:31:23AM +0800, Jiayi Li wrote:
> This device exhibits I/O errors during file transfers due to unstable
> link power management (LPM) behavior. The kernel logs show repeated
> warm resets and eventual disconnection when LPM is enabled:
> 
> [ 3467.810740] hub 2-0:1.0: state 7 ports 6 chg 0000 evt 0020
> [ 3467.810740] usb usb2-port5: do warm reset
> [ 3467.866444] usb usb2-port5: not warm reset yet, waiting 50ms
> [ 3467.907407] sd 0:0:0:0: [sda] tag#12 sense submit err -19
> [ 3467.994423] usb usb2-port5: status 02c0, change 0001, 10.0 Gb/s
> [ 3467.994453] usb 2-5: USB disconnect, device number 4
> 
> The error -19 (ENODEV) occurs when the device disappears during write
> operations. Adding USB_QUIRK_NO_LPM disables link power management
> for this specific device, resolving the stability issues.
> 
> Signed-off-by: Jiayi Li <lijiayi@kylinos.cn>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 36d3df7d040c..2bb70a34d4c5 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -372,6 +372,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* SanDisk Corp. SanDisk 3.2Gen1 */
>  	{ USB_DEVICE(0x0781, 0x55a3), .driver_info = USB_QUIRK_DELAY_INIT },
>  
> +	/* SanDisk Extreme 55AE */
> +        { USB_DEVICE(0x0781, 0x55ae), .driver_info = USB_QUIRK_NO_LPM },

Nit, you forgot to use a tab here :(

I think scripts/checkpatch.pl should have caught this, right?

thanks,

greg k-h
