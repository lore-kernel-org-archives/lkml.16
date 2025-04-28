Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A825D54A;
	Mon, 28 Apr 2025 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859574; cv=none; b=OeSA1644IqzQ+oT226K5lQTXPAayCbDooHJ172lnff4N2wYId6mG5FVruEneFc5EOxukTnAiLJ34gtSAFeHFYB62jeytGvtCKurmRT36nCDL2q7RWDN4PM0NtDmUxEJ870INRN62Yxf7EVuJgS9Drfc9Lhftqug9aOI0ULRVjcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859574; c=relaxed/simple;
	bh=d8cyzXNFYXAQzduZRMl4KjypHV68mdn7yBogCCTQEZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDZZ0p4ftu0+Ea1OEFYT/4s2swHCZU68N9JYScTGtHi+YH5TAes/yOjv0PbMSJ7K7PEXxgBD6WmoemzW8EJgph0hiD/IQR2L6IMMW8FIBrMroKqnHCEiAclLT02Sj2MBXSOSoNxIzSzgHt5ekSoSS9GU6J/sInKqiZTjBnMWSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PJMaom9K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PJMaom9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21811C4CEE4;
	Mon, 28 Apr 2025 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745859573;
	bh=d8cyzXNFYXAQzduZRMl4KjypHV68mdn7yBogCCTQEZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJMaom9KFE2bw6RAamcAtXzeN+5GCNzgm6P+P7phVvQdCLdRptO5AONrhUcSU44FD
	 tLShdqKa/wkfq/WceCCW5Q9nNZYd06wHiKilhMBE0fTPY+LsiMHNvBTv+lfrXn/Hox
	 Ir2/xQQn/gNYPshwV6lFTM1+DH0Ujzi8vVLPVv9o=
Date: Mon, 28 Apr 2025 18:59:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sridhar Arra <sridhar.arra@yahoo.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] [PATCH v2 1/2] staging: greybus: fw-management:
 Add detailed mutex comment
Message-ID: <2025042819-manlike-stratus-4c78@gregkh>
References: <20250428160837.664000-1-sridhar.arra.ref@yahoo.com>
 <20250428160837.664000-1-sridhar.arra@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428160837.664000-1-sridhar.arra@yahoo.com>

On Mon, Apr 28, 2025 at 09:38:36PM +0530, Sridhar Arra wrote:
> Added a detailed comment explaining the role of the mutex
> in serializing firmware management ioctl() operations.
> The mutex prevents concurrent access to firmware operations
> and protects the 'disabled' state flag during disconnection.
> 
> Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
> ---
>  drivers/staging/greybus/fw-management.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..56725b711a17 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -28,6 +28,19 @@ struct fw_mgmt {
>  
>  	/* Common id-map for interface and backend firmware requests */
>  	struct ida		id_map;
> +	/*
> +	 * Mutex to serialize firmware management ioctl() operations and
> +	 * protect against concurrent access.
> +	 *
> +	 * Ensures that user-space cannot perform multiple firmware
> +	 * operations in parallel (e.g., updating interface firmware)
> +	 * for the same Interface, avoiding race conditions and reducing
> +	 * code complexity.
> +	 *
> +	 * Also protects the 'disabled' state flag, preventing new
> +	 * operations from starting when the firmware management
> +	 * connection is being disconnected.
> +	 */
>  	struct mutex		mutex;
>  	struct completion	completion;
>  	struct cdev		cdev;
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
