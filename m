Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C51271446
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645369; cv=none; b=sqg6LsXMcV3jFvovHICXYmjN7xBROTQnraDvq2p0HMGub3D0ZEsd02PNdbX86kpMl0zrt6XqEA9zlXwkksc2qUSjfQZky0QokLQW/mt91I2i3ytCg9pNRiRyidN5fi77T4GyE6YvFd8Pq0/FxJO8ZrBLqIzzkc19kp1WR9MIjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645369; c=relaxed/simple;
	bh=DrBUTn44Zt4i4j2IzfBX9fV1hFit3GAeNfb3pYs26DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEh+nyXYUQHNkMA89IxUBpT0C/6SgOcSoqlyBYNlAj2wtc0IzXRKpu0TC24+BErexMPNF4Rzv6/FTcYu3TiNDcT/FFAzsiCKze2Wgw6hBw4vVuMGJmns4H//ufAY69ZOo786cHBmfixGKP+exSsuVrG88M90UlkSpGhcxSTq/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWrfTS+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWrfTS+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D95C4CEEE;
	Wed, 11 Jun 2025 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645369;
	bh=DrBUTn44Zt4i4j2IzfBX9fV1hFit3GAeNfb3pYs26DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWrfTS+VIlBMUJjfxDheQ8gP/iGRNOF8GhLfUBIqzar3HF2vaB5C+UODE33eP2sGv
	 9xO38o770X9mWUpRoi0mfc8QFpRVH54wwRtMkhKfCOF1hf1VSySHd8nqGWINEk7f5Q
	 +3n0/bwSzUH1Di7AXaa69pZ37b+m9uzyjpe6Rl/hbGYeH5uksfgtg6BDIcHXre0IOa
	 Qv6Ox54/6XQU4AKlNW2hMd+5ybRRQm8JvdSpbhNORX7oPgut0O5RQLX1UTwXY0eDmm
	 l//FLaP0FrskCNoHf5QiILg0ysK0yGoxbYlC5VRoJjqKdXibfKVVmRO4gj6YYcYCRf
	 TwJTpTC587wVw==
Date: Wed, 11 Jun 2025 18:06:03 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	Jerome Forissier <jerome.forissier@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] optee: ffa: fix sleep in atomic context
Message-ID: <aEl4M0-xig8DbJvI@sumit-X1>
References: <20250602120452.2507084-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602120452.2507084-1-jens.wiklander@linaro.org>

On Mon, Jun 02, 2025 at 02:04:35PM +0200, Jens Wiklander wrote:
> The OP-TEE driver registers the function notif_callback() for FF-A
> notifications. However, this function is called in an atomic context
> leading to errors like this when processing asynchronous notifications:
> 
>  | BUG: sleeping function called from invalid context at kernel/locking/mutex.c:258
>  | in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 9, name: kworker/0:0
>  | preempt_count: 1, expected: 0
>  | RCU nest depth: 0, expected: 0
>  | CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.14.0-00019-g657536ebe0aa #13
>  | Hardware name: linux,dummy-virt (DT)
>  | Workqueue: ffa_pcpu_irq_notification notif_pcpu_irq_work_fn
>  | Call trace:
>  |  show_stack+0x18/0x24 (C)
>  |  dump_stack_lvl+0x78/0x90
>  |  dump_stack+0x18/0x24
>  |  __might_resched+0x114/0x170
>  |  __might_sleep+0x48/0x98
>  |  mutex_lock+0x24/0x80
>  |  optee_get_msg_arg+0x7c/0x21c
>  |  simple_call_with_arg+0x50/0xc0
>  |  optee_do_bottom_half+0x14/0x20
>  |  notif_callback+0x3c/0x48
>  |  handle_notif_callbacks+0x9c/0xe0
>  |  notif_get_and_handle+0x40/0x88
>  |  generic_exec_single+0x80/0xc0
>  |  smp_call_function_single+0xfc/0x1a0
>  |  notif_pcpu_irq_work_fn+0x2c/0x38
>  |  process_one_work+0x14c/0x2b4
>  |  worker_thread+0x2e4/0x3e0
>  |  kthread+0x13c/0x210
>  |  ret_from_fork+0x10/0x20
> 
> Fix this by adding work queue to process the notification in a
> non-atomic context.
> 
> Fixes: d0476a59de06 ("optee: ffa_abi: add asynchronous notifications")
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/ffa_abi.c       | 41 ++++++++++++++++++++++++-------
>  drivers/tee/optee/optee_private.h |  2 ++
>  2 files changed, 34 insertions(+), 9 deletions(-)

Sounds reasonable fix to me, FWIW:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index f3af5666bb11..f9ef7d94cebd 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -728,12 +728,21 @@ static bool optee_ffa_exchange_caps(struct ffa_device *ffa_dev,
>  	return true;
>  }
>  
> +static void notif_work_fn(struct work_struct *work)
> +{
> +	struct optee_ffa *optee_ffa = container_of(work, struct optee_ffa,
> +						   notif_work);
> +	struct optee *optee = container_of(optee_ffa, struct optee, ffa);
> +
> +	optee_do_bottom_half(optee->ctx);
> +}
> +
>  static void notif_callback(int notify_id, void *cb_data)
>  {
>  	struct optee *optee = cb_data;
>  
>  	if (notify_id == optee->ffa.bottom_half_value)
> -		optee_do_bottom_half(optee->ctx);
> +		queue_work(optee->ffa.notif_wq, &optee->ffa.notif_work);
>  	else
>  		optee_notif_send(optee, notify_id);
>  }
> @@ -817,9 +826,11 @@ static void optee_ffa_remove(struct ffa_device *ffa_dev)
>  	struct optee *optee = ffa_dev_get_drvdata(ffa_dev);
>  	u32 bottom_half_id = optee->ffa.bottom_half_value;
>  
> -	if (bottom_half_id != U32_MAX)
> +	if (bottom_half_id != U32_MAX) {
>  		ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev,
>  							      bottom_half_id);
> +		destroy_workqueue(optee->ffa.notif_wq);
> +	}
>  	optee_remove_common(optee);
>  
>  	mutex_destroy(&optee->ffa.mutex);
> @@ -835,6 +846,13 @@ static int optee_ffa_async_notif_init(struct ffa_device *ffa_dev,
>  	u32 notif_id = 0;
>  	int rc;
>  
> +	INIT_WORK(&optee->ffa.notif_work, notif_work_fn);
> +	optee->ffa.notif_wq = create_workqueue("optee_notification");
> +	if (!optee->ffa.notif_wq) {
> +		rc = -EINVAL;
> +		goto err;
> +	}
> +
>  	while (true) {
>  		rc = ffa_dev->ops->notifier_ops->notify_request(ffa_dev,
>  								is_per_vcpu,
> @@ -851,19 +869,24 @@ static int optee_ffa_async_notif_init(struct ffa_device *ffa_dev,
>  		 * notifications in that case.
>  		 */
>  		if (rc != -EACCES)
> -			return rc;
> +			goto err_wq;
>  		notif_id++;
>  		if (notif_id >= OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE)
> -			return rc;
> +			goto err_wq;
>  	}
>  	optee->ffa.bottom_half_value = notif_id;
>  
>  	rc = enable_async_notif(optee);
> -	if (rc < 0) {
> -		ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev,
> -							      notif_id);
> -		optee->ffa.bottom_half_value = U32_MAX;
> -	}
> +	if (rc < 0)
> +		goto err_rel;
> +
> +	return 0;
> +err_rel:
> +	ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev, notif_id);
> +err_wq:
> +	destroy_workqueue(optee->ffa.notif_wq);
> +err:
> +	optee->ffa.bottom_half_value = U32_MAX;
>  
>  	return rc;
>  }
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index dc0f355ef72a..9526087f0e68 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -165,6 +165,8 @@ struct optee_ffa {
>  	/* Serializes access to @global_ids */
>  	struct mutex mutex;
>  	struct rhashtable global_ids;
> +	struct workqueue_struct *notif_wq;
> +	struct work_struct notif_work;
>  };
>  
>  struct optee;
> -- 
> 2.43.0
> 
