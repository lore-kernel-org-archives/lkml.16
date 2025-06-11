Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A060280CEE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645462; cv=none; b=tkEWP73QMz4A+JsDr3MEO4u6iddAEGKDm/mQzEYjxA07OmDLzSqSVvqLU3sIbpV4k2/Dhd7T0/sq3SrvSc8CfGmXWfvfua7N/pL8waAwCqxAS2CiRPgqUXkTLWXln65mhX582TDhyyNDI1eYP4/3RypfPNvm/ghiJFWytw5Dp0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645462; c=relaxed/simple;
	bh=4EzmxzBCbJgInyLOSkxEjHMsxWjtit+vk4OdnnH+pfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL/5XYO96Gc1431DAqUF+aDWdnVnQ9FKxYSTVHFfVhgbgLKKuuT3qe8jEIgOoQvQXq0Kjf9Y+khXCgz9zg4B/RP1bdBi7U23CUfZyhKt60Lly633PRBYCfhIlz0zHuwpS3vzYyLSZJdkbXQjm2MVjk11oznIymQvbfws8UQkNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEhL2Mfp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEhL2Mfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EFFC4CEEE;
	Wed, 11 Jun 2025 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645461;
	bh=4EzmxzBCbJgInyLOSkxEjHMsxWjtit+vk4OdnnH+pfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEhL2MfpnC7dqWyLnZkm0XEy7jMTHMt0bbvODBzEFxMQSQ2yw9n1UtUZqov0h7X72
	 q84mIMeXRb6H8JErd3YEdd0InUgpld8gJWElYknQwpt2MQ/sPjWeA0IXqzOj4yvBxF
	 1mjri+FYSk166FUbsdUNovrRFJKburGPP4JJfB20cAU58q5GdPRmdL/Pp4lkEpWBTZ
	 pMbSM+sQrkBze9vaqdTSN16PAIW2xe35Uv69iZRL7UXDaH0uQAtmkb0rw2cIWMJtdv
	 4b79uD9YVb+LbzPS5ueN88sX9RmSGA9d1OcKJh1XNEh/3ynmBYYbeGOIiHttXW7ikt
	 WhPB9NWD69FHg==
Date: Wed, 11 Jun 2025 18:07:37 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	Jerome Forissier <jerome.forissier@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] optee: ffa: fix sleep in atomic context
Message-ID: <aEl4kWxWexuskLGe@sumit-X1>
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

Forgot to mention, let's explicitly CC for stable kernel backport here.

-Sumit

> ---
>  drivers/tee/optee/ffa_abi.c       | 41 ++++++++++++++++++++++++-------
>  drivers/tee/optee/optee_private.h |  2 ++
>  2 files changed, 34 insertions(+), 9 deletions(-)
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
