Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279ADC2EF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009686; cv=none; b=hXng262JmSnmfToN4IEQslboNKfcroXUZudM5al3flOwxY2KkOgN6YJiNUM480IpNRe6SK0FX+e4W9+p0M5pJdNo/Vlx5ISqcjKAFXYLs47KblyJZvFN8VCwqrS1eYJWvnaQyDT9mXdaWPxSyNm/3/fssPxh3HsoKD737DeH7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009686; c=relaxed/simple;
	bh=TxrRigaaQtTcvnwQkYAqoD0dKJengR3Wpw3v2GchDJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQXuQLsVsj8Hn7FO1mD8wyTAop7RLngLSob90y0I6RjCQkbqdKSqg3RWhIsUGKX6/EGrgjfEU3Gr9PCl89U/mg06EN/p4V8ogy+XZ0BrEc1MVM7YmFdj4Ynl8Hmf7LpZgM59su9MltyfJ74tKjq5IaArV/6KAS4q2vTIVzj+pGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2XbhYHs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2XbhYHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E03EC4CEDD;
	Mon,  7 Apr 2025 07:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744009685;
	bh=TxrRigaaQtTcvnwQkYAqoD0dKJengR3Wpw3v2GchDJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N2XbhYHsZrFjHZM0EusmIX3dhoM2XQEuXfQAwM46JXVxXsejA3Huo6J5KNdtZPZVj
	 hERohe3Y4JU6nyntzoBbZvH+1hWGKTmVQSSorXP5PdjaCN2ADFJf6SsWzW+hmFEEZ0
	 V5uXmBKqgCkjdAqAV+rNwHav28Po/DOzbhhGlpAWfpD3KA4Fx9UV8Q9+7K/v71C66k
	 PwWn/+ahrbJ9vMwuAmWggOZdOwLrn2x4rwYWkgWho70Vjw7y1B7fu4DWgnJ32QQomU
	 ytWcSuyb5+nwJV/C9lLiEnVMLZxb51hQE3U5zpN+jZsUPmnLuqcKsHaA0NXfOa3Xbm
	 uRUNT4SsSKw7g==
Message-ID: <4b6f5678-5313-4f67-b5ea-9c4a58d5dd8d@kernel.org>
Date: Mon, 7 Apr 2025 09:08:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/57] irqdomain: um: use irq_domain_create_linear()
 helper
To: Richard Weinberger <richard@nod.at>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-2-jirislaby@kernel.org>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250319092951.37667-2-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

@UM maintainers: if you have not read 00/57 [1], please route this 
through your tree.

[1] https://lore.kernel.org/all/20250319092951.37667-1-jirislaby@kernel.org/

Thanks.

On 19. 03. 25, 10:28, Jiri Slaby (SUSE) wrote:
> um_pci_init() open-codes what the irq_domain_create_linear() helper
> does already. Use the helper instead of open-coding it.
> 
> This needs retval checking modification.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: linux-um@lists.infradead.org
> 
> [v2]
> This is new in v2.
> ---
>   arch/um/drivers/virt-pci.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
> index dd5580f975cc..efe8b474c07b 100644
> --- a/arch/um/drivers/virt-pci.c
> +++ b/arch/um/drivers/virt-pci.c
> @@ -1000,11 +1000,6 @@ static struct resource virt_platform_resource = {
>   
>   static int __init um_pci_init(void)
>   {
> -	struct irq_domain_info inner_domain_info = {
> -		.size		= MAX_MSI_VECTORS,
> -		.hwirq_max	= MAX_MSI_VECTORS,
> -		.ops		= &um_pci_inner_domain_ops,
> -	};
>   	int err, i;
>   
>   	WARN_ON(logic_iomem_add_region(&virt_cfgspace_resource,
> @@ -1030,10 +1025,10 @@ static int __init um_pci_init(void)
>   		goto free;
>   	}
>   
> -	inner_domain_info.fwnode = um_pci_fwnode;
> -	um_pci_inner_domain = irq_domain_instantiate(&inner_domain_info);
> -	if (IS_ERR(um_pci_inner_domain)) {
> -		err = PTR_ERR(um_pci_inner_domain);
> +	um_pci_inner_domain = irq_domain_create_linear(um_pci_fwnode, MAX_MSI_VECTORS,
> +						       &um_pci_inner_domain_ops, NULL);
> +	if (!um_pci_inner_domain) {
> +		err = -ENOMEM;
>   		goto free;
>   	}
>   
> @@ -1070,7 +1065,7 @@ static int __init um_pci_init(void)
>   		goto free;
>   	return 0;
>   free:
> -	if (!IS_ERR_OR_NULL(um_pci_inner_domain))
> +	if (um_pci_inner_domain)
>   		irq_domain_remove(um_pci_inner_domain);
>   	if (um_pci_fwnode)
>   		irq_domain_free_fwnode(um_pci_fwnode);


-- 
js
suse labs
