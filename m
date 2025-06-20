Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998C28368C;
	Fri, 20 Jun 2025 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413607; cv=none; b=oTP8/O0HOiauvudjpFM2jsW0vmYm4tqjBFSs/+DPDrWzP3i492XJCs6yFWBChhzDnBbr95vibOEs0z2m7eOQE4jIOFc6DZ7a5jB5bn1p4ThKHSylyAqmPm5IDVPCGF11oZ7DrHwQuaXolagjV0YeACMAPrf0++AtUDqvTqo2ZbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413607; c=relaxed/simple;
	bh=IRZCB8GMoP84MKUn9SMaAGQ9qpgXhcZRKOZp86qZfno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSkO8U45oCrFqayz1TmWhszDCVWYC+ojnd2/YGa3kTzDeVIGdUSsjOZmBaNnqydx1Eruch6v132VQfRSyeABUmu4mNM+7j/yB1mDw1sZhH+k1wfKS6blvfVxjuUyvOOkNLu4noqiLYQf4ZPUXaicFzRdyD3mla5kOpqCy+C2qyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+TqVJ89; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+TqVJ89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A4EC4CEE3;
	Fri, 20 Jun 2025 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750413606;
	bh=IRZCB8GMoP84MKUn9SMaAGQ9qpgXhcZRKOZp86qZfno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+TqVJ896c/dwB23Q2KDA8VvHqx5c64JMtk/c7PBTuo+CgFnCRzmEd9WvcX4A8ZXm
	 5IOUf6CBnN1tkRp+QnUPBo9NJrbX0WghyUZLZzdiPnQ4U9eZ0KqLVY7Gwd30CF5Bf6
	 46jqE7295eoeG+BecPycXAsXFcr+QNPTj97VEqMsrPqsfpm3Pvng2s5h2YSeac3DUB
	 ioF0oFStcf+vyMkIAoY44tO5C/FjObUuuqCyJ96+SqE31DrF/tSKD18xOMkJRulGYj
	 DzuS/Q2pZCIs5ne1SIod+H/w0R/lCPGvJy/rwDA8tEad6ugP9RuGzrLYeogsGo0bRI
	 DcgFkDXOHLAPA==
Message-ID: <fdb9c21f-aada-498a-92ec-bc48aceeb76e@kernel.org>
Date: Fri, 20 Jun 2025 12:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix code style issues
To: Xiang Shen <turyshen@gmail.com>, acelan.kao@canonical.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250620003849.54442-1-turyshen@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250620003849.54442-1-turyshen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Jun-25 2:38 AM, Xiang Shen wrote:
> Fix checkpatch code style errors:
> 
> ERROR: do not use assignment in if condition
> +	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
> 
> ERROR: do not use assignment in if condition
> +	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
> 
> Signed-off-by: Xiang Shen <turyshen@gmail.com>

Thank you for your patch, but this change really does not make
the code more readable.

The contrary the suggested changes are making the code harder
to read, so NACK.

Note checkpatch is just a tool, sometimes there are good reasons
to deviate from the style checks done by checkpatch.

Next time when submitting a patch to fix checkpatch issues please
take a look at the resulting code after the patch and only submit
the patch upstream if it actually is an improvement.

Regards,

Hans



> ---
>  drivers/platform/x86/intel/vbtn.c | 38 +++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> index 232cd12e3c9f..bcc97b06844e 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -160,30 +160,34 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  
>  	guard(mutex)(&priv->mutex);
>  
> -	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
> +	ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event);
> +	if (ke) {
>  		if (!priv->has_buttons) {
>  			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
>  				 event);
>  			return;
>  		}
>  		input_dev = priv->buttons_dev;
> -	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
> -		if (!priv->has_switches) {
> -			/* See dual_accel_detect.h for more info */
> -			if (priv->dual_accel)
> -				return;
> -
> -			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
> -			ret = input_register_device(priv->switches_dev);
> -			if (ret)
> -				return;
> -
> -			priv->has_switches = true;
> -		}
> -		input_dev = priv->switches_dev;
>  	} else {
> -		dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> -		return;
> +		ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event);
> +		if (ke) {
> +			if (!priv->has_switches) {
> +				/* See dual_accel_detect.h for more info */
> +				if (priv->dual_accel)
> +					return;
> +
> +				dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
> +				ret = input_register_device(priv->switches_dev);
> +				if (ret)
> +					return;
> +
> +				priv->has_switches = true;
> +			}
> +			input_dev = priv->switches_dev;
> +		} else {
> +			dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> +			return;
> +		}
>  	}
>  
>  	if (priv->wakeup_mode) {

