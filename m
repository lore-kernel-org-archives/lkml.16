Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B037145355;
	Thu, 17 Apr 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880985; cv=none; b=BqSDU9I8W4QA7PLYwGIUDGDjB359/QxjnsR8rexijswDTBBWIzdk5cn2tnOMfFblFv911b5t8KeI3DxSnOrdlqSgsgGx/oDL/6X99UYP/hPiijMTVnbq0Ls/ChCtMlYYRVBjMYc4iiBIuS5FSIDgNBqqbI31/gUhVnjG7MlgHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880985; c=relaxed/simple;
	bh=ft3blv+xedgR2GjguyCK+HIe9PLy7Z/DG7T7oPjuxhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtniK1IprBANzVvrf0v6INFp/o1uivJ+XNUKA1sD9QtbU+zelJ79GHjP77F9odpyFjsb8Gp4CtQ6bnhFAeUku84CwmseCEag2XzBdV8n/zYjU2VEYIlL9evgPE8xOZ/OMqfTMQcFg7LOubKE7aQMua6liQ6QiZrKyr0HefO46i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NxCs0+A/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NxCs0+A/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102F3C4CEE4;
	Thu, 17 Apr 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744880983;
	bh=ft3blv+xedgR2GjguyCK+HIe9PLy7Z/DG7T7oPjuxhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxCs0+A/RqRfOW6jkO7V5w22jGjIKNQM2inSDo8ptkkV0w46XVtq4ruWvQka2yeNT
	 jKoQnbF0INwy/nnKn3ijL8Zxuil1LFuQmkBJq5aRkROTHMlzrjFvUqBKKn/fmBnI1l
	 dTMICvvfagSOM5i+3+o3YGCbWqlMSXp9fZNys1gs=
Date: Thu, 17 Apr 2025 11:09:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, rmfrfs@gmail.com,
	pure.logic@nexus-software.ie
Subject: Re: [PATCH v2 3/4] staging: greybus: refactor gb_loopback_fn into
 smaller helper functions
Message-ID: <2025041701-purgatory-thievish-3e79@gregkh>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
 <20250413073220.15931-4-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413073220.15931-4-ganeshkpittala@gmail.com>

On Sun, Apr 13, 2025 at 07:32:19AM +0000, Ganesh Kumar Pittala wrote:
> This patch refactors the gb_loopback_fn() function in loopback.c by
> splitting large blocks of logic into well-named static helpers to
> improve clarity, readability, and maintainability.
> 
> The control flow remains unchanged. No functional modifications
> are introduced.
> 
> This aligns with kernel coding style guidelines for long functions
> and helps future contributors understand and modify loopback behavior
> more easily.
> 
> Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 152 ++++++++++++++++-------------
>  1 file changed, 82 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index c194afea941a..1e3644ede1b6 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -832,105 +832,117 @@ static void gb_loopback_async_wait_to_send(struct gb_loopback *gb)
>  				  kthread_should_stop());
>  }
>  
> -static int gb_loopback_fn(void *data)
> +static bool gb_loopback_should_stop(struct gb_loopback *gb,
> +				    struct gb_bundle *bundle)
> +{
> +	if (!gb->type) {
> +		gb_pm_runtime_put_autosuspend(bundle);
> +		wait_event_interruptible(gb->wq,
> +					 gb->type || kthread_should_stop());
> +		if (kthread_should_stop())
> +			return true;
> +		gb_pm_runtime_get_sync(bundle);
> +	}
> +	return kthread_should_stop();
> +}
> +
> +static void gb_loopback_handle_completion(struct gb_loopback *gb,
> +					  struct gb_bundle *bundle)
> +{
> +	gb_loopback_async_wait_all(gb);
> +
> +	mutex_lock(&gb->mutex);
> +	if (gb->iteration_count == gb->iteration_max) {
> +		gb->type = 0;
> +		gb->send_count = 0;
> +		sysfs_notify(&gb->dev->kobj, NULL, "iteration_count");
> +		dev_dbg(&bundle->dev, "load test complete\n");
> +	} else {
> +		dev_dbg(&bundle->dev, "continuing on with new test set\n");
> +	}
> +	mutex_unlock(&gb->mutex);
> +}
> +
> +static void gb_loopback_dispatch_operation(struct gb_loopback *gb, int type,
> +					   u32 size)
>  {
>  	int error = 0;
> -	int us_wait = 0;
> -	int type;
> -	int ret;
> -	u32 size;
>  
> +	if (gb->async) {
> +		if (type == GB_LOOPBACK_TYPE_PING)
> +			error = gb_loopback_async_ping(gb);
> +		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
> +			error = gb_loopback_async_transfer(gb, size);
> +		else if (type == GB_LOOPBACK_TYPE_SINK)
> +			error = gb_loopback_async_sink(gb, size);
> +
> +		if (error) {
> +			gb->error++;
> +			gb->iteration_count++;
> +		}
> +	} else {
> +		if (type == GB_LOOPBACK_TYPE_PING)
> +			error = gb_loopback_sync_ping(gb);
> +		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
> +			error = gb_loopback_sync_transfer(gb, size);
> +		else if (type == GB_LOOPBACK_TYPE_SINK)
> +			error = gb_loopback_sync_sink(gb, size);
> +
> +		if (error)
> +			gb->error++;
> +		gb->iteration_count++;
> +		gb_loopback_calculate_stats(gb, !!error);
> +	}
> +}
> +
> +static void gb_loopback_delay_if_needed(int us_wait)
> +{
> +	if (us_wait) {
> +		if (us_wait < 20000)
> +			usleep_range(us_wait, us_wait + 100);
> +		else
> +			msleep(us_wait / 1000);
> +	}
> +}
> +
> +static int gb_loopback_fn(void *data)
> +{
> +	int us_wait = 0, type;
> +	u32 size;
>  	struct gb_loopback *gb = data;
>  	struct gb_bundle *bundle = gb->connection->bundle;
>  
> -	ret = gb_pm_runtime_get_sync(bundle);
> -	if (ret)
> -		return ret;
> +	if (gb_pm_runtime_get_sync(bundle))
> +		return -EIO;
>  
>  	while (1) {
> -		if (!gb->type) {
> -			gb_pm_runtime_put_autosuspend(bundle);
> -			wait_event_interruptible(gb->wq, gb->type ||
> -						 kthread_should_stop());
> -			ret = gb_pm_runtime_get_sync(bundle);
> -			if (ret)
> -				return ret;
> -		}
> -
> -		if (kthread_should_stop())
> +		if (gb_loopback_should_stop(gb, bundle))
>  			break;
>  
> -		/* Limit the maximum number of in-flight async operations */

Why is it ok to remove this comment?

And why was this function broken up?  Is it confusing such that it now
needs subfunctions that are only called once?  Now you have to jump
around to follow the logic of this big while(1) loop, making it harder
to follow.

Remember, we write code for people first, compilers second, and I think
you just made it harder for people to manage this code over time as it
now takes extra work to determine how it all fits together.

thanks,

greg k-h
