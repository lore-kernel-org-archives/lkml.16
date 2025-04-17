Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295C5320F;
	Thu, 17 Apr 2025 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880546; cv=none; b=SBo167LDsZ2tp7xYdn606Lm8EcMVx/zWakBtUDxHKHJd3mcSohvSawQtHmcXlieguvwAQyn7+2oizaCTy7RxQSG0YDdePnWg5MaorQM4siAXwjRB9OQ0Pr8qXYgs1rTDv5fk1srHlJutwffp2sIx2S1bubBI0smgAZx4ENQVXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880546; c=relaxed/simple;
	bh=fZETOokQ9yFz5Am7vbAdLFemx+/IfN9pgm5+YJu498k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePPhNZRzMGzVIUplv2PzF8k19WTsThbxasLGdUJlZaFsfmuVavkcL4tALz46/FZKEw7WgbZHCisuHoHciia0ItqqqQhSKRXoay+pTwzABxyaa0FRVaE3qFcZlaBBccDHHS9YkoQpYjYexivSJ79oMgUwDtiVNV1zMX0iHoh31ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x1/g2sst; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x1/g2sst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D552C4CEE4;
	Thu, 17 Apr 2025 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744880545;
	bh=fZETOokQ9yFz5Am7vbAdLFemx+/IfN9pgm5+YJu498k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x1/g2sstuMxXaVbkzKi82RGV/P3AtOFE4jG1y68kXLyJl4kN52GYC/VIx9UhzGTT+
	 dlr32bhDh4bRnJURs2wFzwRJ/m6O8LJCb9RsNajXw+8OIbhxvtXAM9L/P0HEOmpz+n
	 JnpiLaTKElZuKWp83xftpAgrJqSqJpZTjzvy/8IE=
Date: Thu, 17 Apr 2025 11:02:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jules Irenge <jbi.octave@gmail.com>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Fix Kconfig
Message-ID: <2025041704-unmoved-foam-c8c4@gregkh>
References: <Z_-rcegWISUc6zhk@octinomon>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-rcegWISUc6zhk@octinomon>

On Wed, Apr 16, 2025 at 02:07:44PM +0100, Jules Irenge wrote:
> Chekpatch reports a warning in Kconfig
> 
> WARNING: please write a help paragraph that fully describes the config symbol
>          with at least 4 lines
> 
> To fix this , more accurate description is added.
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  drivers/staging/gpib/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
> index aa01538d5beb..1255035a995a 100644
> --- a/drivers/staging/gpib/Kconfig
> +++ b/drivers/staging/gpib/Kconfig
> @@ -41,10 +41,11 @@ config GPIB_AGILENT_82357A
>  	select GPIB_COMMON
>  	depends on USB
>  	help
> -	  Enable support for Agilent/Keysight 82357x USB dongles.
> +	  Enable support for the Agilent/Keysight 82357A and 82357B USB-to-GPIB adapters.
> +	  This device allows GPIB instruments to be controlled over a USB connection.
>  
> -	  To compile this driver as a module, choose M here: the module will be
> -	  called agilent_82357a.
> +	  To compile this driver as a module, choose M here. The resulting module will be
> +	  named agilent_82357a.
>  
>  config GPIB_CEC_PCI
>  	tristate "CEC PCI board"
> -- 
> 2.49.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
