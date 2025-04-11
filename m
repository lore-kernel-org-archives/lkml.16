Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0031E51E7;
	Fri, 11 Apr 2025 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379241; cv=none; b=P7hortZuYmE5toYINovV+GJ0PYxVmS7KGJuxm9oIdySDuTbDOHYMB4KGkomNcbFTFZLmfHw3B10KYbBQ1C0N6wrScm+epJcYLLYmrOJageSY2KsYjTrlPeOuSHqPbI77TKGNKUbwtWNbN6rUZqw7+MVIIdXbqgre5g86cSbHLLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379241; c=relaxed/simple;
	bh=+gq/NvDyBclUG5lQD7OHaapJTk3Id7Bevn6ruENvLMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+IgYBXakzqfH9IRCzKZ9PxUWWVlF1phQbjeyROcS+FF8SbFFMRO7sT6t7cAu6lJxIOvnGvjrdgpt6XC/s5pwHk3Z/ZXIHhsyVkK2Kgh/wfYs869vzkJCcuahL6XUmmjOWe8PVC2n5qS9XCKm3dSAAhNJrmQu1xspD3muiPz8RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iGZ1rQh3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iGZ1rQh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70A7C4CEE2;
	Fri, 11 Apr 2025 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744379241;
	bh=+gq/NvDyBclUG5lQD7OHaapJTk3Id7Bevn6ruENvLMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGZ1rQh3GWjmSzc+pjFMlXh4ajaGk2BhgzJjE/MRQSwMehH7FT9q/uMmOnhrID53e
	 VkfNMgnB/rGN2n/6O3uLDn/XS7rCWztlAudxFBbZhtdjD1U5fzsZt+Csbp6+ubXiTB
	 Sulieo0jhDm5BKBMfoVR8ZDTzoxJnNZwHPyKitW8=
Date: Fri, 11 Apr 2025 15:47:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	xiehongyu1@kylinos.cn
Subject: Re: [PATCH] usb-storage: apply IGNORE_UAS for Realtek on RTL9210
Message-ID: <2025041114-party-deport-cd14@gregkh>
References: <20250326022019.1593669-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326022019.1593669-1-dengjie03@kylinos.cn>

On Wed, Mar 26, 2025 at 10:20:19AM +0800, Jie Deng wrote:
> The UAS mode of Realtek USB_HDD is reported
> to fail to work on several platforms with
> the following error message, then after
> re-connecting the device will be offlined
> and not working at all.
> 
> [  143.361210] sd 9:0:0:0: [sdg]
> tag#6 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD IN
> [  143.372377] sd 9:0:0:0: [sdg]
> tag#6 CDB: Read(10) 28 00 00 00 00 10 00 00 10 00
> [  143.382908] sd 9:0:0:0: [sdg]
> tag#5 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
> [  143.394080] sd 9:0:0:0: [sdg]
> tag#5 CDB: Read(10) 28 00 00 00 00 00 00 00 10 00
> [  143.404610] sd 9:0:0:0: [sdg]
> tag#4 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN
> [  143.415782] sd 9:0:0:0: [sdg]
> tag#4 CDB: Read(10) 28 00 00 00 00 30 00 00 10 00
> [  148.437916][ 22] xhci_hcd 0000:ba:02.0:
> xHCI host not responding to stop endpoint command.
> [  148.462295][ 22] xhci_hcd 0000:ba:02.0:
> xHCI host controller not responding, assume dead

Please don't wrap error message lines.

> The Realtek Manufacturer's device cannot
> initialize properly using the UAS driver,
> so we need to switch it to usb-storage

Are you sure this now works?  Also wrap your changelog at 72 columns
please.

> 
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
>  drivers/usb/storage/uas-detect.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/uas-detect.h b/drivers/usb/storage/uas-detect.h
> index 4d3b49e5b87a..23579a2a1181 100644
> --- a/drivers/usb/storage/uas-detect.h
> +++ b/drivers/usb/storage/uas-detect.h
> @@ -125,8 +125,11 @@ static int uas_use_uas_driver(struct usb_interface *intf,
>  	 */
>  	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bda &&
>  			le16_to_cpu(udev->descriptor.idProduct) == 0x9210 &&
> -			(udev->manufacturer && !strcmp(udev->manufacturer, "HIKSEMI")) &&
> -			(udev->product && !strcmp(udev->product, "MD202")))
> +			(((udev->manufacturer && !strcmp(udev->manufacturer, "HIKSEMI")) &&
> +			(udev->product && !strcmp(udev->product, "MD202"))) ||
> +			((udev->manufacturer && !strcmp(udev->manufacturer, "Realtek")) &&
> +			(udev->product && !strcmp(udev->product, "RTL9210")))

So all products with that string are bad?  Why not use the product id
instead?

thanks,

greg k-h
