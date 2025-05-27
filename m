Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389BF22541D;
	Tue, 27 May 2025 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335771; cv=none; b=Hy0lIPvGCBNp4UNXBQyUf3LltDF0WCkHBpSvDBhVjVEFjFjL8T8NXoz0S+AG40lHeX3f5knvkw35CTPDNQWjNNFfM/OdSxq15erO2wEv7ToN9jzXRS8cJLqNfIb5YmDXZAHa9buoTc4GyOdoe50msq9/hQE7X+QIon2OpPekod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335771; c=relaxed/simple;
	bh=5i3sCG0nfO7i+ZN1khqzuzH0v8A0as1jMTDBnkKO63I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzjDV0Il4DkqIccRJL0b7wMdlwtK99bA0G8CxUtXHLhMqwml3TRAmVMBQUpY2yiS+uUIIa/E+0isXxCg1RBXUCAj49oCHoMNkgbWOzyI5KK1HmN98vko8VGNVXrOJe7G7/WrBeaqIz3TGj2jRf4Yk/zcGxMCijKmOeQvpmZuBrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxHdnq5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxHdnq5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08C6C4CEEA;
	Tue, 27 May 2025 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748335770;
	bh=5i3sCG0nfO7i+ZN1khqzuzH0v8A0as1jMTDBnkKO63I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AxHdnq5xODhzlZbUSO/wzqCK/0Ekkx3AhRY/RK5fYL91PlpszcLJTYMN2ps/lNt67
	 N+F04as9ZRL0fZYwGgx5okT1F4EzQPBHD2smfIjzwJrPIN6gW0nq8Nu0RNnZCrmxXz
	 8YIaFBbjJKSyjH5Nr1G45fQr5E4spxXltAxbTvElivydqP2eDCXiQLjXMwX4JXNCyV
	 sotcR2zwzj6jpWAauIGDABfGqQGp6sazXphiWKh1u34+U3NQ6tBZYSPLajyxZSy7KL
	 ksyrM++arRXinnqozRpv0GJ8FFmSfEq5Ato4E1OAstrYNFIEvamsamtD7eQG8KS8XX
	 GxaFdfU2KNEdw==
Message-ID: <c9c08142-752a-4ce5-a723-9f50486dddb6@kernel.org>
Date: Tue, 27 May 2025 10:49:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] firmware: stratix10-svc: Add mutex lock and unlock
 in stratix10 memory allocation/free
To: mahesh.rao@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
 <20250526-sip_svc_upstream-v3-1-6a08a4502de3@altera.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250526-sip_svc_upstream-v3-1-6a08a4502de3@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 08:25, Mahesh Rao via B4 Relay wrote:
> From: Mahesh Rao <mahesh.rao@altera.com>
> 
> This commit adds a mutex lock to stratix10_svc_allocate_memory
> and stratix10_svc_free_memory functions to ensure
> thread safety when allocating and freeing memory.
> This prevents potential race conditions and ensures
> synchronization.
> 
> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  drivers/firmware/stratix10-svc.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index e3f990d888d71829f0ab22b8a59aa7af0316bea0..3d42d4b18b7299d0a9e5110159e06253dfeddf88 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (C) 2017-2018, Intel Corporation
> + * Copyright (C) 2025, Altera Corporation
>   */
>  
>  #include <linux/completion.h>
> @@ -171,6 +172,7 @@ struct stratix10_svc_chan {
>  
>  static LIST_HEAD(svc_ctrl);
>  static LIST_HEAD(svc_data_mem);
> +static DEFINE_MUTEX(svc_mem_lock);

You need to document what you are protecting here.

>  
>  /**
>   * svc_pa_to_va() - translate physical address to virtual address
> @@ -182,14 +184,17 @@ static LIST_HEAD(svc_data_mem);
>  static void *svc_pa_to_va(unsigned long addr)
>  {
>  	struct stratix10_svc_data_mem *pmem;
> +	void *ret = NULL;
>  
>  	pr_debug("claim back P-addr=0x%016x\n", (unsigned int)addr);
> +	mutex_lock(&svc_mem_lock);
>  	list_for_each_entry(pmem, &svc_data_mem, node)
> -		if (pmem->paddr == addr)
> -			return pmem->vaddr;
> -
> -	/* physical address is not found */
> -	return NULL;
> +		if (pmem->paddr == addr) {
> +			/* physical address is found */
> +			ret = pmem->vaddr;
> +		}
> +	mutex_unlock(&svc_mem_lock);
> +	return ret;
>  }
>  
>  /**
> @@ -990,13 +995,16 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
>  			p_data->flag = ct->flags;
>  		}
>  	} else {
> +		mutex_lock(&svc_mem_lock);
>  		list_for_each_entry(p_mem, &svc_data_mem, node)
>  			if (p_mem->vaddr == p_msg->payload) {
>  				p_data->paddr = p_mem->paddr;
>  				p_data->size = p_msg->payload_length;
>  				break;
>  			}
> +		mutex_unlock(&svc_mem_lock);
>  		if (p_msg->payload_output) {
> +			mutex_lock(&svc_mem_lock);

Especially that this looks odd.



Best regards,
Krzysztof
