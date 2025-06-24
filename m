Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7D126CE03
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780072; cv=none; b=QCXXo5VSpktoZwSCVGtAK9nY8iVXolcjb4tvcwWp8xsZ8gg9UQHuqC/P5+VtBqcLedyOKQMjZl/ujTZe7mbE/8inytFmAjWEQBiW6BUruM2WA5dHnKNSx0I+P8inWJe+BNGBWAAz2tfy42yORUIhB9P8npzwN3UP1os2aHbC7Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780072; c=relaxed/simple;
	bh=V12aEpzV/DOmJEBEoaRR/ZKo/PtjZw1phR40ONf9LIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeHkeVULcmCz3ZRTUyaFf/h9UUukHKyxKjp8ys91Z2QK5Dr2nQkPveFfAW0+o7XviTyeFp1suDUQ1c3lZTwSFSQpdJWSAXnhDiX+EwFfzOdYuFtIVXpiOKcaz+3q8lMUrkVVJjurTuivwbTw0sIs6JHoeZj9JN+UwP3WCJWK0Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q+IEGHmu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q+IEGHmu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE5AC4CEE3;
	Tue, 24 Jun 2025 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750780071;
	bh=V12aEpzV/DOmJEBEoaRR/ZKo/PtjZw1phR40ONf9LIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+IEGHmuimyQ4zYbDGnM9XFJSwYTwWvfO1sG0KZmtNEZL3PWZ1KKOU7LPme5Azb7Z
	 34ftbfJvxxBY3befXmiba4OEc6vhvlxzHHtkljRK7Tnhe+gT0j/amblL8+oLVXe6jw
	 /pqB76Vy3BfSoP+iA4S9+SYwA9ulsuGhIaf9y8eY=
Date: Tue, 24 Jun 2025 16:47:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] char: misc: Rename a local variable in misc_init()
Message-ID: <2025062401-prenatal-hazily-7fc5@gregkh>
References: <20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com>
 <20250620-fix_mischar-v1-2-6c2716bbf1fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-fix_mischar-v1-2-6c2716bbf1fa@oss.qualcomm.com>

On Fri, Jun 20, 2025 at 10:35:19PM +0800, Zijun Hu wrote:
> From: Zijun Hu <zijun.hu@oss.qualcomm.com>
> 
> Local variable @ret is not used for return value in misc_init().
> 
> Give it a different name @pde.
> 
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  drivers/char/misc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/misc.c b/drivers/char/misc.c
> index d5accc10a110098f7090dd0f900bc5fae5f75f74..f5ef8c175adb559e67dfe905d43d1404b249cc9e 100644
> --- a/drivers/char/misc.c
> +++ b/drivers/char/misc.c
> @@ -289,9 +289,9 @@ EXPORT_SYMBOL(misc_deregister);
>  static int __init misc_init(void)
>  {
>  	int err;
> -	struct proc_dir_entry *ret;
> +	struct proc_dir_entry *pde;

"pde" is an odd name.

> -	ret = proc_create_seq("misc", 0, NULL, &misc_seq_ops);
> +	pde = proc_create_seq("misc", 0, NULL, &misc_seq_ops);

Why not "misc_proc_file" as a better name?

>  	err = class_register(&misc_class);
>  	if (err)
>  		goto fail_remove;
> @@ -305,7 +305,7 @@ static int __init misc_init(void)
>  	pr_err("unable to get major %d for misc devices\n", MISC_MAJOR);
>  	class_unregister(&misc_class);
>  fail_remove:
> -	if (ret)
> +	if (pde)

Again, "pde" is a rough name, let's pick a better one please.

thanks,

greg k-h
