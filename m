Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27D1DE2B4;
	Tue,  1 Apr 2025 18:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531588; cv=none; b=SjgJH3O8kP3lXkX0AtVqbCjp7eRdPb9K/naXAaw7tllC2DDk7sbUyhHq7UGmM0+XhsDlEEHSZhM5c534pJG77AscGAOzqaz4i7BuVaDC2QemIfpBPtVnQkAXl7eXRPPZkpBmL79qn2A9xtoMlSmlV1MZ1A1HYUjq7KBGFNZJlFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531588; c=relaxed/simple;
	bh=ClhLBqaaVAVwuLwx4kJiSRWeU6HgIOPkC9lnkchsc9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulwkldzzfG8G8pEyUqdcT5Yq2a/QMbsJv3bzdfWr3PWLSG+cjMLEnoulokqet5jTc+kWXBm5QojjO142uWqhxYQ8eVEt0fsxge9+ksn5y5i38ml3HYAP4c+BjIKDCv4RGGM8NxpFvOAFg5hC8Qwa/UvbkwO46EnBiHerdy5ui+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HFik6kdn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HFik6kdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F205FC4CEE5;
	Tue,  1 Apr 2025 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743531587;
	bh=ClhLBqaaVAVwuLwx4kJiSRWeU6HgIOPkC9lnkchsc9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFik6kdn543No8iUJKzXH8F7Q76TXOTw2X/EJM8kK1QhGCrVke6A3tvO17lQ/O1tC
	 DEw8zhMkk+YTfnIHemBnIhyAhl2OA+ooQaGkwKX95/wsNMfV9X2Ojg6ZGnGR5spYcz
	 8QQRzSO6Q26WW/ZC/GH0kK3raTZVc/KztZwi2AI8=
Date: Tue, 1 Apr 2025 19:18:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: outreachy@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] staging: rtl8723bs: no space before tabs
Message-ID: <2025040127-unretired-veto-b056@gregkh>
References: <cover.1743524096.git.karanja99erick@gmail.com>
 <4e39b1295d68aea947aa5757e3148a2e401b72bc.1743524096.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e39b1295d68aea947aa5757e3148a2e401b72bc.1743524096.git.karanja99erick@gmail.com>

On Tue, Apr 01, 2025 at 07:59:37PM +0300, Erick Karanja wrote:
> Remove spaces before tabs to comply with the Linux kernel coding style
> guidelines. Proper indentation using tabs improves code consistency
> and readability.
> 
> Reported by checkpatch:
> 
>     WARNING: please, no space before tabs
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c | 33 ++++------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> index 9105594d2dde..44f73baf1cb4 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> @@ -9,14 +9,14 @@
>  #include <hal_btcoex.h>
>  #include <Mp_Precomp.h>
>  
> -/* 		Global variables */
> +/*Global variables */

Does that look right?  (hint, it isn't...)

Always put a space after the /* and before text.  You removed the one
that was there already :(

thanks,

greg k-h
