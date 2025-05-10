Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D7378C91;
	Sat, 10 May 2025 16:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746895482; cv=none; b=YPMq1ozQQOUWpuwqt07rOm+SaGgcJpOw4xuCF2y5idMnkd36cahVqAGuWn8+fzntrtftZjk4zQdYP/dqvUwVIGATMvKWiZY8TqsktbonQjB2Lo/Bs0b7+enuYGifqXD+zYN0IKoQliqYiF2VCSFN9h2sgNcIzl/ZnZ8hyLIcHUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746895482; c=relaxed/simple;
	bh=5zf+Gmp4BkStSzRYoo8kl/40BTtK0Nx0b3ScZiIdh+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqKUcJgTXaGdrgGc2oaBSPTyRy9vwPWhGkDP78Ke+iH1cymaohjOcIz4Ef0iPa2e3S5dEl3hNfGAzQdpD3MbzkSyp72uDDY28+sNoc/XR38gx5U0O98iMucD2V81X2DaFzVMjB/RDuS0mpy0BxNs35L9aNzklskGmumnUnuONjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M7tn7YkL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M7tn7YkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DF3C4CEE2;
	Sat, 10 May 2025 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746895481;
	bh=5zf+Gmp4BkStSzRYoo8kl/40BTtK0Nx0b3ScZiIdh+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7tn7YkLlNoiTHIVV3YX84ZenqG+fsuIdJKn49y38GRODx0Vb1u4pG7CykJc9X1Rl
	 NOgPdfdFWPcRQn8JOPUulic6gCz3cwQTJsJJXZs2UV7WLlYkaA0dvm0/WikBMN/qjn
	 IJufrUbWk0TNU2CU0F4DlehHX0YQsWrWP7il6EnM=
Date: Sat, 10 May 2025 18:44:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: dpenkler@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH 1/2] Staging: common: iblib: Changed ibrsc function type
Message-ID: <2025051025-slate-grape-37ce@gregkh>
References: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>

On Sat, May 10, 2025 at 05:37:59PM +0200, Thomas Andreatta wrote:
> Function ibrsc type changed from void to int.

You need to explain more here.

> Returning 0 for success.

Yes, but it can not fail:

> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/gpib/common/iblib.c       | 4 ++--
>  drivers/staging/gpib/include/gpib_proto.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
> index b297261818f2..8b4280309ae7 100644
> --- a/drivers/staging/gpib/common/iblib.c
> +++ b/drivers/staging/gpib/common/iblib.c
> @@ -418,12 +418,12 @@ int ibsic(struct gpib_board *board, unsigned int usec_duration)
>  	return 0;
>  }
>  
> -	/* FIXME make int */
> -void ibrsc(struct gpib_board *board, int request_control)
> +int ibrsc(struct gpib_board *board, int request_control)
>  {
>  	board->master = request_control != 0;
>  	if (board->interface->request_system_control)
>  		board->interface->request_system_control(board, request_control);
> +	return 0;

If this can not fail, and request_system_control() can not fail, why
does this function need to return anything?

And you aren't checking the return value of it either, so why change it?

On another note, it's not a good name for a global function :)

thanks,

greg k-h
