Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2333CA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009742; cv=none; b=kauIPQshpzO9T5XZt367Ukp6XM1M8fvZxfyix/y23TL5IDnDj90Vb4TF23wZlP9GCyuuZY0ItghS9bZgVcYae5edUWakiLOdY4TAZa9/UD0su7RKYrD/cP17ub9r4IXuydy+d2q60VYI7yT8FuAlDiirWrxFhjW76DM5ePqo3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009742; c=relaxed/simple;
	bh=truEkgk2NyX/AE2MRWqoZqEwdeJB1dg7jy0FXPzOFTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXGJW4F/cN39hrooxrui7KZ7+Hx2CxyDH4I5FTuFBz9M+08wC7MA1OYdEmylo3r4LJW8lYRxdocwuoHfz6uX/WLW44Q8urmaNnQwAVg6LVp2Fjm/lYQQtdmJEFM0NhvHpZn5fAb8gKWeWXmQnyfGoF8E9dbzDmGD2B9Ri2qng8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIT3ZMnO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIT3ZMnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A43C4CEDD;
	Mon,  7 Apr 2025 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744009741;
	bh=truEkgk2NyX/AE2MRWqoZqEwdeJB1dg7jy0FXPzOFTY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mIT3ZMnOOcbFswuwfGcpIYZTSTjmK0RIgcOnMh2+2oUerCrDgGNSiI/8+kNen9Iz0
	 9rEur0fGJLx7RhMuoLazG/g24IFnOOuUYbcBYAYLhKQ1J4mqf9NaOg1zWgHzYpLT6D
	 88Ge67OfDPfQVoXGgPhQ56jOKh5jGNaz0lYE66TZXHEGlMKWDzqjK5M4lPuVkPJ5yF
	 0cLlrWIuXJhATrTunmEg415vrQFdzKEvc/iDjtHPwEzyJltC7O14NRXATRm/TyXgqL
	 DacKkDs7jKjLpLyLUZKXthaZKfR7El8mUsMgc0N1ervDiZBzTo1PLc19EIH4zUpABU
	 aneNpAl9Ke3qg==
Message-ID: <ef69bf62-8ffd-435c-afdf-e36649df3bbd@kernel.org>
Date: Mon, 7 Apr 2025 09:08:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/57] irqdomain: cdx: Switch to of_fwnode_handle()
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, tglx@linutronix.de
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-6-jirislaby@kernel.org>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250319092951.37667-6-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

@cdx maintainers: if you have not read 00/57 [1], please route this 
through your tree.

[1] https://lore.kernel.org/all/20250319092951.37667-1-jirislaby@kernel.org/

Thanks.

On 19. 03. 25, 10:28, Jiri Slaby (SUSE) wrote:
> of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> defined of_fwnode_handle(). The former is in the process of being
> removed, so use the latter instead.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Nipun Gupta <nipun.gupta@amd.com>
> Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>
> ---
>   drivers/cdx/cdx_msi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> index 06d723978232..3388a5d1462c 100644
> --- a/drivers/cdx/cdx_msi.c
> +++ b/drivers/cdx/cdx_msi.c
> @@ -165,7 +165,7 @@ struct irq_domain *cdx_msi_domain_init(struct device *dev)
>   	struct device_node *parent_node;
>   	struct irq_domain *parent;
>   
> -	fwnode_handle = of_node_to_fwnode(np);
> +	fwnode_handle = of_fwnode_handle(np);
>   
>   	parent_node = of_parse_phandle(np, "msi-map", 1);
>   	if (!parent_node) {
> @@ -173,7 +173,7 @@ struct irq_domain *cdx_msi_domain_init(struct device *dev)
>   		return NULL;
>   	}
>   
> -	parent = irq_find_matching_fwnode(of_node_to_fwnode(parent_node), DOMAIN_BUS_NEXUS);
> +	parent = irq_find_matching_fwnode(of_fwnode_handle(parent_node), DOMAIN_BUS_NEXUS);
>   	if (!parent || !msi_get_domain_info(parent)) {
>   		dev_err(dev, "unable to locate ITS domain\n");
>   		return NULL;


-- 
js
suse labs
