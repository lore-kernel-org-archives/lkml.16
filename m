Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293701EA7FD;
	Sat,  5 Apr 2025 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743860469; cv=none; b=MrTuzYXZETWZ1soEf4jRLgPsNh2+ac9uN30xg6bQKnzKcSfB0TTi/h8aJD76xiTr3615h11m+SniLaSRjr5s2KAs23EuCcJQTSMTAb2w6/BQcdxUvk5QUt1Onu4jkUWcmWj2H3BKrXuoZcHEUuhwKoJk9kb0TO0y+Lnmfh/Qs/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743860469; c=relaxed/simple;
	bh=Ut2N5p6wy4nRVl7/hlQk94z0ObaJeSBksKHiL6EUyDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ0WiNGI2Vi1t4hZDXRygDKuf3dGvd6FhRPWhQf+AWwnaiC8g3INqA6vPXh6TjHVhghRfWlAFF/jL8IT5w+oDoIQiK4bnDhN2j/SbAz/FChk4T9QQMtLB69edvcULiUfnJFkphhgBxDZvyGzGuAw9/9nNqHdb373j4/4OB/AeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dfIqjbM3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dfIqjbM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C08C4CEE7;
	Sat,  5 Apr 2025 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743860468;
	bh=Ut2N5p6wy4nRVl7/hlQk94z0ObaJeSBksKHiL6EUyDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfIqjbM3G2Ca57NQCP2/e1luq9dKMYYmsgJhhqc1ltzmVJgrdKWNex4BUaN6C/Jxk
	 2Dp5hn9bfJY11M+VURR+Hf1aUm5jvJEaQurKCbnSem5vdWWzvN2mbHrucUtwWWrwZW
	 mlcj7aMvAjh0dIm2ec74q/sRA/cNs+6Wevof3WAg=
Date: Sat, 5 Apr 2025 14:39:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Add error handling for sd_read().
Message-ID: <2025040523-absolute-defendant-131f@gregkh>
References: <20250405130642.2255-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405130642.2255-1-vulab@iscas.ac.cn>

On Sat, Apr 05, 2025 at 09:06:42PM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling to the sd_read(), ensuring that the memcpy() is
> only performed when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
