Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EBD7080E;
	Sat, 10 May 2025 16:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746895556; cv=none; b=TJJzDWqEBaGe/V7gFcHPnaKNmoHcOSyr/YzralsLqNHksU9EeiGHHqc/YBIJcl/LhBVfJ7Lwcr0vcZZQxMxqv6kVbM0ffF7TW1VUGBZ8CsXm17hC/gHEodqnjI9nJglmIjOm96LXQDVP18JTl0cRR0oIiaLNUnMI99QZMakp5FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746895556; c=relaxed/simple;
	bh=n1ylkyD2uz+lFTixrrsZblLHrATbrmmZxdx3avzCvjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTkQjJjLIdDHl3rL7LF1DFJoeP4jlG0dtihkySWSq2Sr0I5XgBBpDEfsaRg1s2y1VeSPOs1wkiJBqq7Xl54Lv2ZW/4D80F7Lo9Lva84RcYtT9FCq/kDL3AWjB4ur6vI16VcFpZk2Vm0VAik1swEtFKPzxZQdHYl38gBItbaE+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AQiQoMmW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AQiQoMmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B0AC4CEE2;
	Sat, 10 May 2025 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746895556;
	bh=n1ylkyD2uz+lFTixrrsZblLHrATbrmmZxdx3avzCvjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQiQoMmW0cvsni5eM6E6iO5SppHsHVUGHAZPD4Rpw8nCRJCS732UH4VxWRk+9rFC5
	 lxhqw0gqrcFQoZuAOL4AxSDF26+kOYN9/74KU/HcMdnJ8YCxaQ6IH39BkyJz2LyFfk
	 yGHnK9xDuNEUuxmae3jO4DYLXmnV2JMjMqtbaN5Y=
Date: Sat, 10 May 2025 18:45:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: dpenkler@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH 2/2] Staging: common: gpib_os:
 `request_system_control_ioctl` return value
Message-ID: <2025051046-ipad-overdrawn-8890@gregkh>
References: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
 <20250510153800.130974-2-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510153800.130974-2-thomas.andreatta2000@gmail.com>

On Sat, May 10, 2025 at 05:38:00PM +0200, Thomas Andreatta wrote:
> `request_system_control_ioctl` now returns the value returned from the
> function `ibrsc`, now int.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/gpib/common/gpib_os.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
> index 8456b97290b8..dddf7a70084d 100644
> --- a/drivers/staging/gpib/common/gpib_os.c
> +++ b/drivers/staging/gpib/common/gpib_os.c
> @@ -1970,9 +1970,9 @@ static int request_system_control_ioctl(struct gpib_board *board, unsigned long
>  	if (retval)
>  		return -EFAULT;
>  
> -	ibrsc(board, request_control);
> +	retval = ibrsc(board, request_control);
>  
> -	return 0;
> +	return retval;

Why not:
	return ibrsc(board, request_control);
?

But again, as this can not fail, why is this needed?

Start way back at the "ends" of the call chain.  If they can fail, then
start propagating the error up all the way to here.  As it is, your
patch series really didn't do anything that I can tell, sorry.

greg k-h
