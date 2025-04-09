Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B91143748
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226387; cv=none; b=a9CgoNVRC6iJc7suIHXSfrExs7sfvFkNzXoJTNrbYgq72GktjSILGfFBZUsDEKJRspE6slluwaYXkwD7pjMf7JcD637iS43D3ao1Lhs5+rsWZKJRjzOZ904xYc3LwqODeY+7RBPrcoYlXiwyhpmz+KL2FaUtmu4VOPcckOwLX84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226387; c=relaxed/simple;
	bh=QU9du0Iwr7u+qh1qeCY7ThmI4QLPaRnSuhooOfqKa1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXshvVz8LWpqYCZJ2CEileL95gU+Jrhkm8JTaq+ZBt3xWZZDcVTf7nczB9sh63Ow6XqJsha3/3vSWT4lZ9TNi4oaLJXX/ijNY9MA9YbfyL7JHOwX8shlEwnynWFsWtRUJjYjBva/0HRBBb/4SbF7pYfFag6VjaGj1fZZ0wty1kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AsdShJ/s; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AsdShJ/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1744226380;
	bh=QU9du0Iwr7u+qh1qeCY7ThmI4QLPaRnSuhooOfqKa1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AsdShJ/sOv/iNUfKpU3z7mKXU/yhfnTp4lJGZvbCkrgKBNfL+pfDF/4tt/MJTzhbV
	 U5N1xx+pSlgQbl7tXGZsC54R+LuXIzvz53XCpH28tjf1qybMSJenYsSvUUzIJ5YI/L
	 nkIQPSGqvsuvBP9ztXQ4q254nDy/CvkF63D8ZutI=
Date: Wed, 9 Apr 2025 21:19:40 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/nolibc/types.h: fix mismatched parenthesis in
 minor()
Message-ID: <c232e7ec-9e39-45e8-9d90-c8e4d16c77a4@t-8ch.de>
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

On 2025-04-10 03:14:36+0800, Jemmy Wong wrote:
> Fix an imbalance where opening parentheses exceed closing ones.

Thanks! The patch looks good and I will pick it up soonish.

One note: When sending new revisions of patches, please always include a
changelog of all differences in the new revision.
I can also recommend the b4 tool for taking care of many workflow tasks.

https://b4.docs.kernel.org/en/latest/

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
