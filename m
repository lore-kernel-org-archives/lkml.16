Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F84C74;
	Wed, 21 May 2025 04:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747801200; cv=none; b=CHpO7CR4eVAfKp3ifaeypN5eo+Zahhkq354PwzjvbplfzdEZEcjen5KYjM9ic/xWa10mMi6lW4O/3UkTgpIS6QRNtfyw2cTcYsL1E28fOVfhthmiaf+14wns1tqnUSQMHGtrLbTjW+USEmuhhJb1Y5KoNJGZIF6VeazaLCUjSzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747801200; c=relaxed/simple;
	bh=t1/qES4I+LBZsUI9z/3mJ3gR2YlPHDqHcueBHQoJYZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emRySWnTcuUFN377hEx3b+TRQUwvxtSleTg9xojMNohbipypKUvT/QXjlv08gjWT9oZplwYsk/qtjFbEPGCkk701GwYc3EuRrT11dcM74DlBCoOJWZNVcY4spmezyZMV9N0aqPhsLfoS/tJ8jEoStyrCyfvphOCMSuy+vN02El4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DsBrsUXR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DsBrsUXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F53C4CEE4;
	Wed, 21 May 2025 04:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747801199;
	bh=t1/qES4I+LBZsUI9z/3mJ3gR2YlPHDqHcueBHQoJYZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsBrsUXRaeNklqCC3D+c1FN7AgtObNCNu8YWKUtc9ujeU1AVDj26P43VMtJB28rqH
	 M+PrS7tdrVc0rUITWtv70AY8wHz3ZxPjq0KzlGWYiKfSHOKZonj98tWeKvXcfBi2nQ
	 P1AEepg50+PiJQ/yzBDzZfkXoluXTs+5hWKzfO1c=
Date: Wed, 21 May 2025 06:19:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donny-Dev <donnyturizo13@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/rtl8723bs: Fix camelCase to snake_case
 style in core files
Message-ID: <2025052115-untainted-skillful-96aa@gregkh>
References: <20250521000150.11659-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521000150.11659-1-donnyturizo13@gmail.com>

On Wed, May 21, 2025 at 12:01:50AM +0000, Donny-Dev wrote:
> Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 557bfdf09..81f795a82 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -9,8 +9,8 @@
>  #include <linux/jiffies.h>
>  
>  static struct _cmd_callback rtw_cmd_callback[] = {
> -	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
> -	{GEN_CMD_CODE(_Write_MACREG), NULL},
> +	{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
> +	{GEN_CMD_CODE(_write_macreg), NULL},
>  	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
>  	{GEN_CMD_CODE(_Write_BBREG), NULL},
>  	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
> -- 
> 2.43.0
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
