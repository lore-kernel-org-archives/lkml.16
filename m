Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27EA2BEC56
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923438; cv=none; b=QdGkezisfIuFHObGKMZPUDsD65oS8GaKtmYTR49RZkRxxmX/UX/53Izv8vXj3y3LrPum8MyDbGwUJBioj+8C5gjuR1N91KPzspg/0SXDYOuEowhwikmRxzWseJcocxjrn6fF1W4T83gz8tzReLYhKkEbWTAqhHz18AVbXBE+4x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923438; c=relaxed/simple;
	bh=Ps1ladXDvOye8i3Ucn1CJ7mSCxm14Lwd1rD0oUV1z4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWIGEczf+SvTaLsFyH2Vlw5kNKpXuV4E7L95YHphfDPyWqGgCbCRuyr3Gm9Dsuufz4Pj4lUaDJDjO8W20kNKFowOTAIe8fD2hY37HzU4JKijJC3vBiH4Rqd4+u0YdvCZWzj2EBa2JS7eypoeXL3Vb2iLB3FishHRkT4JOGkk7Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wILmygDE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wILmygDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA72C4CEE3;
	Tue, 29 Apr 2025 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745923438;
	bh=Ps1ladXDvOye8i3Ucn1CJ7mSCxm14Lwd1rD0oUV1z4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wILmygDEppplNzRrnjQaKV++fC7XW1slKa0iKp9c1iVDszI99jr6YMs++SFTmCZeO
	 wQ+eoOulEjRDjE2DZcdwI5c8E9biO4RDbP1delPdcSEi8YIKA0KG248z3B5/XWo4Rx
	 9PhvhJzykfb50puKPOqeC3IrEJ77s0RK8/tst+l0=
Date: Tue, 29 Apr 2025 12:43:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zhengyan <zhengyan@asrmicro.com>
Cc: arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com,
	surenb@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: skip dead binder_proc during binder_open
Message-ID: <2025042955-drastic-barista-0351@gregkh>
References: <20250429075030.305-1-zhengyan@asrmicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429075030.305-1-zhengyan@asrmicro.com>

On Tue, Apr 29, 2025 at 07:50:30AM +0000, zhengyan wrote:
> During binder_open, the binder_proc list is travesed to check
> for the existing binder_proc instances. binder_proc objects
> are async released in a deferred work after binder_release,
> and may remain temporarily on the binder_procs list even after
> being marked as dead.

Nit, you do have a full 72 columns to use, can you use that?

> 
> Without checking the flag, binder_open may face a crash as
> "Unable to handle kernel paging request at virtual address
> dead000000000140"
> 
> Signed-off-by: zhengyan <zhengyan@asrmicro.com>

Please use your name, not just an email alias.

> ---
>  drivers/android/binder.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 76052006bd87..43ab4350e589 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -6041,6 +6041,8 @@ static int binder_open(struct inode *nodp, struct file *filp)
>  
>  	mutex_lock(&binder_procs_lock);
>  	hlist_for_each_entry(itr, &binder_procs, proc_node) {
> +		if (itr->is_dead)
> +			continue;

What commit id does this fix? Should it go to stable kernels?  If so,
how far back?

How was this tested?

thanks,

greg k-h
