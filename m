Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98181CEAD6;
	Tue, 27 May 2025 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335475; cv=none; b=Uylvwnkgxipy6Ki4/wFQtDJ2U1SQm/3yFeVGiRvhZFtLlohnIN43J3Oi9wJ8DKEu5qUMpHTlFT5foEgKxx3gD8EWiSLq2FV4feiLLfLtUYJV4YilUGs53v9kcN9+wIlj4ZC/90+ky6DzuzVUnLTCCflcISQw5lEaqDXz92UTXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335475; c=relaxed/simple;
	bh=tu/Ta76Ml0gQqGnmCdVOydN9lwxl9NE68BkygeaRWyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YstKM4SV+zlAamG6DTYGLtMuybljAIXQIBtNvLZ2kUFeTrJuF8UMjuKwnfY3pXQI7bccs2j5cwMDgP7FwolP+boB/ZHM1dSLAE5u3F14JmiHSli/WPM/N/M7h54kIhB3mGCs0/aWQQJwLZpL+OBgSV+6dPC5d+LYEezBDdWjAYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMBLk28+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMBLk28+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578A9C4CEEE;
	Tue, 27 May 2025 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748335475;
	bh=tu/Ta76Ml0gQqGnmCdVOydN9lwxl9NE68BkygeaRWyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bMBLk28+3Bza/oHd1Lf8FtKmDw7v1BsxxwOIxLo5BsGr/eXz1hY5hVFlkPrTpQWBz
	 AZzvVzNYBqUJeABtTiV8yEiNBte8RSX9AsMFciqkh16ufXIwIROJuIj9drctvK1RPD
	 jx7TGAXutfPAxJQKqUkI0ZTfc85DKV+JFaa2jP5jbjSEgwGyLvNdwxtcikEjgp8CCv
	 zSIVmlKKbZBMgr5+MZqrKcXK8O7RyTyWExVcaUXiDE6KHlXJdO5spV9WYT/g++A6wx
	 o6ghMsEIJMqJTs8OTg54uxeie2/CQ3Gm7xEU76JkWSpzzbX23Qo6mM0uaPL6G8zqVQ
	 GlRgJ2nZDc21Q==
Message-ID: <3a76c7b1-ce02-41eb-a4c0-ae065e9b99f3@kernel.org>
Date: Tue, 27 May 2025 10:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix10 service channel
To: mahesh.rao@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
 <20250526-sip_svc_upstream-v3-3-6a08a4502de3@altera.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250526-sip_svc_upstream-v3-3-6a08a4502de3@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 08:25, Mahesh Rao via B4 Relay wrote:
> From: Mahesh Rao <mahesh.rao@altera.com>
> 
> This commit adds support for asynchronous communication

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


> with the Stratix10 service channel. It introduces
> new definitions to enable asynchronous messaging to
> the Secure Device Manager (SDM). The changes include
> the adding/removing of asynchronous support to existing
> channels, initializing/exit-cleanup of the new asynchronous
> framework and sending/polling of messages to SDM.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


...

> +	args.a0 = INTEL_SIP_SMC_ASYNC_POLL;
> +	args.a1 =
> +		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
> +
> +	actrl->invoke_fn(actrl, &args, &handle->res);
> +
> +	data->status = 0;
> +	if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
> +		return 0;
> +	} else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
> +		dev_dbg(ctrl->dev, "async message is still in progress\n");
> +		return -EAGAIN;
> +	}
> +
> +	dev_err(ctrl->dev,
> +		"Failed to poll async message ,got status as %ld\n",
> +		handle->res.a0);
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(stratix10_svc_async_poll);

No, drop entire function. There is no user of it. You cannot add exports
for dead code.

> +
> +/**
> + * stratix10_svc_async_done - Completes an asynchronous transaction.
> + * @chan: Pointer to the service channel structure.
> + * @tx_handle: Handle to the transaction being completed.
> + *
> + * This function completes an asynchronous transaction identified by the given
> + * transaction handle. It ensures that the necessary structures are initialized
> + * and valid before proceeding with the completion operation. The function
> + * deallocates the transaction ID, frees the memory allocated for the handler,
> + * and removes the handler from the transaction list.
> + *
> + * Return: 0 on success, -EINVAL if any input parameter is invalid, or other
> + *         negative error codes on failure.
> + */
> +int stratix10_svc_async_done(struct stratix10_svc_chan *chan, void *tx_handle)
> +{
> +	if (!chan || !tx_handle)
> +		return -EINVAL;
> +
> +	struct stratix10_svc_controller *ctrl = chan->ctrl;
> +	struct stratix10_async_chan *achan = chan->async_chan;
> +
> +	if (!achan) {
> +		dev_err(ctrl->dev, "async channel not allocated\n");
> +		return -EINVAL;
> +	}
> +
> +	struct stratix10_svc_async_handler *handle =
> +		(struct stratix10_svc_async_handler *)tx_handle;
> +	if (!hash_hashed(&handle->next)) {
> +		dev_err(ctrl->dev, "Invalid transaction handle\n");
> +		return -EINVAL;
> +	}
> +
> +	struct stratix10_async_ctrl *actrl = &ctrl->actrl;
> +
> +	spin_lock(&actrl->trx_list_wr_lock);
> +	hash_del_rcu(&handle->next);
> +	spin_unlock(&actrl->trx_list_wr_lock);
> +	synchronize_rcu();
> +	stratix10_deallocate_id(achan->job_id_pool,
> +				STRATIX10_GET_JOBID(handle->transaction_id));
> +	kfree(handle);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(stratix10_svc_async_done);

No, drop entire function. There is no user of it. You cannot add exports
for dead code.

> +
> +static inline void stratix10_smc_1_2(struct stratix10_async_ctrl *actrl,
> +				     const struct arm_smccc_1_2_regs *args,
> +				     struct arm_smccc_1_2_regs *res)
> +{
> +	arm_smccc_1_2_smc(args, res);
> +}
> +
> +/**
> + * stratix10_svc_async_init - Initialize the Stratix10 service controller
> + *                            for asynchronous operations.
> + * @controller: Pointer to the Stratix10 service controller structure.
> + *
> + * This function initializes the asynchronous service controller by setting up
> + * the necessary data structures, initializing the transaction list.
> + *
> + * Return: 0 on success, -EINVAL if the controller is NULL or already initialized,
> + *         -ENOMEM if memory allocation fails, -EADDRINUSE if the client ID is already
> + *         reserved, or other negative error codes on failure.
> + */
> +static int stratix10_svc_async_init(struct stratix10_svc_controller *controller)
> +{
> +	int ret;
> +	struct arm_smccc_res res;
> +
> +	if (!controller)
> +		return -EINVAL;
> +
> +	struct stratix10_async_ctrl *actrl = &controller->actrl;

Do not declare variables in the middle of the code. See coding style.

> +
> +	if (actrl->initialized)
> +		return -EINVAL;
> +
> +	struct device *dev = controller->dev;

Same here.



Best regards,
Krzysztof
