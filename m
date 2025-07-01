Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5124220F4F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359832; cv=none; b=sfdVIZDjFGEq8Qu9xw/SxNsNgSTzkjDuuHqBvYU+WgHKsucROcBSwR+0YFVx4re+wMQme8EPgxO9sz5s7K2AB3VAotQX2XdmKjpHvD36ef4nefJWc6v/3n/lAHw4Pl7Ne3rzwwITi5T+ZQ9ZSH8KcnexZGefSS+DYeIvxTeOSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359832; c=relaxed/simple;
	bh=7VWffLYp/5JzoHGHAqiHQaV/1rpYb+lDQUQ4g0pcvcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3gk2Gw6Uye44ipH9giiDOXg2bHJi7nQcPGmnq5R1uXo8C3jaD5nfUxST3D0jIG9tQYW+otV29gk0PCa4gE8Kon0NVU8177uJUs1lm2MrC3sgs9wNQBphY9n+lBtd4Zu/sIe5pS7ISnbFniU8Tw7cBoWJtINtWPfIPD3ECp8lCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PKCDd3wE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PKCDd3wE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9F4C4CEEE;
	Tue,  1 Jul 2025 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751359831;
	bh=7VWffLYp/5JzoHGHAqiHQaV/1rpYb+lDQUQ4g0pcvcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKCDd3wEXm29SJcVurH9+m/uW5A4keQOlXJTla4aTXdGUjj1H8aHgANkWJlf/CD3Z
	 8XK3JEcPYZ912uJQ0a0SID7bDuQBxxTNJGNPEFbapRbk0F/sSbTkpV03pRlhXrSR2q
	 HRQvkVC2Mkf2QqU8bjSKMOuR99cA2IUnCmku9KXI=
Date: Tue, 1 Jul 2025 10:50:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, David Jeffery <djeffery@redhat.com>,
	Jeremy Allison <jallison@ciq.com>, Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Subject: Re: [PATCH v10 2/5] driver core: don't always lock parent in shutdown
Message-ID: <2025070157-undaunted-curler-bda3@gregkh>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
 <20250625201853.84062-3-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625201853.84062-3-stuart.w.hayes@gmail.com>

On Wed, Jun 25, 2025 at 03:18:50PM -0500, Stuart Hayes wrote:
> Don't lock a parent device unless it is needed in device_shutdown. This
> is in preparation for making device shutdown asynchronous, when it will
> be needed to allow children of a common parent to shut down
> simultaneously.
> 
> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> Signed-off-by: David Jeffery <djeffery@redhat.com>
> ---
>  drivers/base/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index cbc0099d8ef2..58c772785606 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4823,7 +4823,7 @@ void device_shutdown(void)
>  		spin_unlock(&devices_kset->list_lock);
>  
>  		/* hold lock to avoid race with probe/release */
> -		if (parent)
> +		if (parent && dev->bus && dev->bus->need_parent_lock)
>  			device_lock(parent);

What about parents for a device that is not on a bus?  Don't they need
to be properly locked?


>  		device_lock(dev);
>  
> @@ -4847,7 +4847,7 @@ void device_shutdown(void)
>  		}
>  
>  		device_unlock(dev);
> -		if (parent)
> +		if (parent && dev->bus && dev->bus->need_parent_lock)
>  			device_unlock(parent);

Same here.

thanks,

greg k-h
