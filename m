Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3FA1DA4E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447952; cv=none; b=k9zouT7BjQXlmX2aCWgh1JYFtyJM35LaHB1IKPFPpHe10cF+bIw68rqKxntDrOv0afEglap9yDmOZ+Y4RBWzAXnnEyY/vLZjGrUUuBPHV7r/fXwAFzPMLZ9Hsyh+7Z8qO4jzVGpirpog9S6FhIMLvTnh3KPfToGep/WvNUZUfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447952; c=relaxed/simple;
	bh=WMl20F6JpmqJilOJfkGLEHer+duH1E6nC1WJZj7VejQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n/aiYJztXzdJI5BbjGDSYliEvR/5hH42Rxs+5B+/f56IgeT3Ffi8mBL+e1zpTZnQXeave6P1Dcn00TC894BIZyu3UHfyv4MHn4Cd4NKh7BSvBcMDyUxGl4UCaqLGoBXEReAvvXTEhS05V4Nm95dtu1ig8yFWYL1fsEoBolyVbjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=abnPhXJg; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="abnPhXJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sihKOfS8lYFo9Xhf2LxC2A7NzXIY9IgPrC4IE7FxJ40=;
  b=abnPhXJg9t6awNZhXFUU6NGdo15lhaaq09LNiW5iLyo3F/EElb0yApXM
   Tfxa8hnCXOwGWnKseX7Pd5KO5FZZ59K8iSLHhXAVySvl6/tXHTSpbKetZ
   I+EaBaOdBOZlPWsiZMUTnRg8H4H5iyzq4wABgz0JKWKvak3/S3wU/w0R0
   g=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,291,1736809200"; 
   d="scan'208";a="215667369"
Received: from static.ip-78-108-136-42.signet.nl (HELO hadrien) ([78.108.136.42])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 21:05:47 +0200
Date: Mon, 31 Mar 2025 21:05:46 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: rtl8723bs: replace kmalloc + memset with
 kzalloc
In-Reply-To: <d68a05a05966167f8e54f2fc779af2f1cfe32e07.1743434232.git.karanja99erick@gmail.com>
Message-ID: <ef73e566-5a1d-961-73b1-839579811ba5@inria.fr>
References: <cover.1743434232.git.karanja99erick@gmail.com> <d68a05a05966167f8e54f2fc779af2f1cfe32e07.1743434232.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 31 Mar 2025, Erick Karanja wrote:

> Replace a call to kmalloc followed by memset with a single call to
> kzalloc, which both allocates memory and zeroes it in one step.
>
> This change improves readability and reduces redundant code.
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index a00f9f0c85c5..be46132a533a 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -24,12 +24,7 @@ void *_rtw_malloc(u32 sz)
>
>  void *_rtw_zmalloc(u32 sz)
>  {
> -	void *pbuf = _rtw_malloc(sz);
> -
> -	if (pbuf)
> -		memset(pbuf, 0, sz);
> -
> -	return pbuf;
> +	return kzalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
>  }

So _rtw_malloc calls kmalloc?

How about gettind rid of both _rtw_malloc and _rtw_zmalloc and calling
kmalloc and kzalloc instead?  You should try to figure out if GFP_ATOMIC
or GFP_KERNEL should be used based on the context.  If you search for
those constants, you should be able to find some explanations about when
they should be used.

julia

>
>  inline struct sk_buff *_rtw_skb_alloc(u32 sz)
> --
> 2.43.0
>
>
>
