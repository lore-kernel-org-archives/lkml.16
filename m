Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42519DF99
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315752; cv=none; b=R+MVHt23C2fWdFT4OMxcma+6z9NKnmj1dcXrJlW2Zmrt0RHu5cG0V6EHKjpWcKsQ6I3kYTac+fW3Vq5sqCUs3l34E5pAFt6D3y8LhPObA3OADgJZFBXahvvaGTl3Ho5FayW4zm4qw9zlumI0nq0pDT8QFc/fQe1qxxCN8VNPDqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315752; c=relaxed/simple;
	bh=U/blswCDx6LPrkbGJg5f2+D3cnxgHBP7KBOWQXH/wcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaDeVAc13FXkcxS1ZV0XN9/CQQBDtDNfIJK9n91ARgOUnEY9315B1/q+yxmI51O37jZxa+2R3awrgCyHa3O5oEy3LlhatwoToGjlDZsTxTBf+Z2Spuo9QuWQ4NtwE2yTAuaWK592WLfMS9XFhXTlVxWPk1g42zby68tg5ZBXVTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=N+i1lEQX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="N+i1lEQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1744315736;
	bh=U/blswCDx6LPrkbGJg5f2+D3cnxgHBP7KBOWQXH/wcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+i1lEQXBM1a3mDGghM69uEvapghzAQ+vblteQwLzfVz+6uvtC1AYx4wvmhJLxlSr
	 hUzsDkc5YsS1/f4UI9cQuAojPkuzeinW4X0CVIiUk8rOl+uHOSMEVVRg+33IJdOcL7
	 /q9t1KaTwhm70CSKeoJlaG+RIAhHSM1IIb0PaKMA=
Date: Thu, 10 Apr 2025 22:08:55 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/nolibc/types.h: fix mismatched parenthesis in
 minor()
Message-ID: <747dfa47-2721-4d2b-ae15-2536471d57b8@t-8ch.de>
References: <20250409191436.75658-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409191436.75658-1-jemmywong512@gmail.com>

Hi Jemmy,

I fear this needs another revision.
Your name/email of the mail sender is not identical to the one in the
Signed-off-by line.
Also the Fixes tag from the v1 feedback is missing.
Now that Willy gave you an Ack, that should also be in your trailers
block.
The correct order is:

Fixes:
Signed-off-by:
Acked-by:

Please resend a v3.


Thomas


On 2025-04-10 03:14:36+0800, Jemmy Wong wrote:
> Fix an imbalance where opening parentheses exceed closing ones.
>
> Signed-off-by: Jemmy Wong <Jemmywong512@gmail.com>
> ---
>  tools/include/nolibc/types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> index b26a5d0c417c..32d0929c633b 100644
> --- a/tools/include/nolibc/types.h
> +++ b/tools/include/nolibc/types.h
> @@ -201,7 +201,7 @@ struct stat {
>  /* WARNING, it only deals with the 4096 first majors and 256 first minors */
>  #define makedev(major, minor) ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
>  #define major(dev) ((unsigned int)(((dev) >> 8) & 0xfff))
> -#define minor(dev) ((unsigned int)(((dev) & 0xff))
> +#define minor(dev) ((unsigned int)((dev) & 0xff))
>  
>  #ifndef offsetof
>  #define offsetof(TYPE, FIELD) ((size_t) &((TYPE *)0)->FIELD)
> -- 
> 2.43.0
> 
