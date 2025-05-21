Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6847264F8B;
	Wed, 21 May 2025 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827808; cv=none; b=b1b/mIj5hol584BHMV8NAaZ/QfqPT1HN/5RPtLqDFDExgB0Ul+fcmZBpw7a25GqJ9zZ1/fDWAkV7fTNC4r2XAcAcwzPUM+ePT/I9DdJOyBMADF3r7a5AvE0HCsp2SMJhhqJT9bqk2eeQLeQdlJr5Mx4cGGjXwbxSwdyY24mgqSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827808; c=relaxed/simple;
	bh=a3OD2KHaUMd0DW0PzlpA5Il6hgjYFCrpsHk0WHmloZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkfasRuSBp/X3p3/Ip7L9h66EyqfzlJe4it2LpLHr2vGRz1pI3vOoHMA+33ZLAPF9Q41C3uHT4JSW/N1zZP861i0Bm0LLk7lNPGO7f6LwB/ir44DDm+fwwUsgtdEG6lUWL5jrvWQIaFX1q1p5z7D3bAsclSXQimKAXZ7IyqJFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KdoyZSFs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KdoyZSFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F031DC4CEE4;
	Wed, 21 May 2025 11:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747827807;
	bh=a3OD2KHaUMd0DW0PzlpA5Il6hgjYFCrpsHk0WHmloZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdoyZSFssVDcmIhZIrpipzT+m3X0T6zoE8lHa3z9Fw6Gesm5BYKrUhAoRqU9bRy+1
	 HHindnh3NaRU3W046f6RC3aQ72o+BUvqrJ2Xq24YMjlJKWd0ypBWbZ6/vW642JCgBQ
	 +1siS1Do4VpytJPQoyes0oVQaLfbkQev/Xxx7FeI=
Date: Wed, 21 May 2025 13:43:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Heikki Huttu <heissendo88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: add missing includes
Message-ID: <2025052136-backstab-dork-de2d@gregkh>
References: <aCZDHXJTyfJRseho@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCZDHXJTyfJRseho@Lappari.v6.elisa-laajakaista.fi>

On Thu, May 15, 2025 at 10:40:13PM +0300, Heikki Huttu wrote:
> Header files use u32, size_t, dma_addr_t, struct device, struct list_head.
> Add direct includes to make the headers self-contained.
> 
> Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> ---
>  drivers/staging/vme_user/vme.h      | 5 +++++
>  drivers/staging/vme_user/vme_user.h | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
> index 7753e736f9fd..55499b240dc3 100644
> --- a/drivers/staging/vme_user/vme.h
> +++ b/drivers/staging/vme_user/vme.h
> @@ -3,6 +3,11 @@
>  #define _VME_H_
>  
>  #include <linux/bitops.h>
> +#include <linux/types.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/mm.h>
> +#include <linux/dma-mapping.h>

If you are going to add these, please do so in a sorted way.

But really, why is this needed at all?

>  
>  /* Resource Type */
>  enum vme_resource_type {
> diff --git a/drivers/staging/vme_user/vme_user.h b/drivers/staging/vme_user/vme_user.h
> index 19ecb05781cc..297b25fab164 100644
> --- a/drivers/staging/vme_user/vme_user.h
> +++ b/drivers/staging/vme_user/vme_user.h
> @@ -2,6 +2,8 @@
>  #ifndef _VME_USER_H_
>  #define _VME_USER_H_
>  
> +#include <linux/types.h>

Same here, are you sure this is needed?

thanks,

greg k-h
