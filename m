Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F413FF1;
	Fri,  4 Apr 2025 06:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748034; cv=none; b=dGyZnXgFB7JFCNsj5P5ozJAcN0jnCiUQqRAgQm3xOy6ymy2j7Xo61P8mCVZohQCOJKOtJtbWq//zmuJfdXSF8QWY8l7DHFrkofDjgrHBn7qkyabsnX7ctv7Z7a6NGh1vig73DPI3Lo+JU4uP8uzN0EJaRN3475v03J36P1NecFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748034; c=relaxed/simple;
	bh=JRIeRgHihwWnX+KcVhx/2uHUWwf5DjZ5IKnSYKxL/ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsTwtLd0+ZR6hhbzoExZiUe/4IBteb9rDFPHZg4mJOfeai9LF3K+xXVdi8z3yzhjTQGgU+17XtQszTrfGaB1ilLhJmxpPJ3wcGL2rJch3UuIEkAXNnRsC9E5RehvoZPjBOTTwhcgRiKVgAA99KBVTC99g40eI9bFVe19ZREbZTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QSiSokV8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QSiSokV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224EBC4CEDD;
	Fri,  4 Apr 2025 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743748033;
	bh=JRIeRgHihwWnX+KcVhx/2uHUWwf5DjZ5IKnSYKxL/ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSiSokV8HPUsosKuJNdUZl/WVORukfSGA70UIP/AVFQJllIDtmKjFrn6QkRP3XW7Q
	 vYDOezE1QkCj2ydJtayTMaSz/ro31EZ1weHB4fUZnddSYZEWkGrlicdCWKjOFD8Muv
	 RL/GVVP8K1iXREMtZTUvC01ERPKTaEpcKfgJDkPg=
Date: Fri, 4 Apr 2025 07:25:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: sunliming@linux.dev
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, arnd@arndb.de,
	niharchaithanya@gmail.com, everestkc@everestkc.com.np,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RESEND] staging: gpib: warning: variable 'nec_priv' set
 but not used warning
Message-ID: <2025040427-escargot-nanometer-6cd4@gregkh>
References: <20250404061135.330056-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404061135.330056-1-sunliming@linux.dev>

On Fri, Apr 04, 2025 at 02:11:35PM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below kernel warning:
> drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not
> used [-Wunused-but-set-variable]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503200532.B4rXNs0N-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/staging/gpib/eastwood/fluke_gpib.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
> index 0304c5de4ccd..6854a745ccff 100644
> --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> @@ -194,10 +194,8 @@ static int fluke_line_status(const gpib_board_t *board)
>  	int status = ValidALL;
>  	int bsr_bits;
>  	struct fluke_priv *e_priv;
> -	struct nec7210_priv *nec_priv;
>  
>  	e_priv = board->private_data;
> -	nec_priv = &e_priv->nec7210_priv;
>  
>  	bsr_bits = fluke_paged_read_byte(e_priv, BUS_STATUS, BUS_STATUS_PAGE);
>  
> -- 
> 2.25.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
