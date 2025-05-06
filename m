Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220992797A5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541626; cv=none; b=Hz7Tw8NTDBQVkQnilF2/j/AC5ial4DI5kI01mPD3NbH8iT9o6JxUSqkjT3ATxSea8iFE3W9zcsb8mxhq4Ad3kOO8bOnCLKqWV6FZVJL58wvmRAIIAak3LWR2lhrptYKRH+nsu/TdmSvPKWoIAv1gEVvsLN8A/5Sa7I1Zd2cZSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541626; c=relaxed/simple;
	bh=F4tirR/FModHhmOrU5e+bMq3BbXul7NwOrD/8nnIYS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sM8p2Nu3f4It2UdWRhq36NebIK63k6XxWm0tdkUrK8QaVrpOOx9aRvvZ9pqPulc5f3959q9ZV8dxuP4brZYV0WQgzdPs0MtIZOElHNAFYOlLiAL1fs1MVNKRzAruASEA7CGXsMiqMCsStg4Tgf3ySOyv4H/IXmvdGv07kRdV8dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=QKbIqUrb; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="QKbIqUrb"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29031E765C;
	Tue,  6 May 2025 16:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746541622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7Z8ekOws5ceZSDeuKNA/jrqzyK+kkBRvWnE+01tElr8=;
	b=QKbIqUrboYkS2eQwsM1bEn4dTHFedLb9PHBIGFYbLOC6jA91GW+CSFYcj5PqHnyP0TlWcd
	KKeDwpo3x+bi1fEc2AscBtmWRyci6/VMXrz7ygrGtpvcQa5039SNxSyyc1i5XauFgXlx48
	XIg8y4bIFQgfPl6RBXGY98C0ufFIk4RiaQcUnEB3FiscM6PrCWOu/cQqg80GEzrF8iPsGZ
	aKIMw3eix++oWEbpY+K65orUweKIMY2P8VV9Fwjgp7haDRupZEr9VVcMaotVayY5PZlU8j
	xmePudMX2jenR8UBfpXe9Nl6FiibL7Jgca0j+G0MqltiVU0ctiF6rqBn7eUM3g==
Message-ID: <14407cb5-58cf-4989-8892-e937af0b07ae@cjdns.fr>
Date: Tue, 6 May 2025 16:27:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] irqchip/econet-en751221: Switch to
 irq_domain_create_linear()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
References: <877c2top39.ffs@tglx>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <877c2top39.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 06/05/2025 15:17, Thomas Gleixner wrote:
> irq_domain_add_linear() is about to be removed. Switch to
> irq_domain_create_linear().
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>   drivers/irqchip/irq-econet-en751221.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- a/drivers/irqchip/irq-econet-en751221.c
> +++ b/drivers/irqchip/irq-econet-en751221.c
> @@ -286,7 +286,8 @@ static int __init econet_intc_of_init(st
>   
>   	econet_mask_all();
>   
> -	domain = irq_domain_add_linear(node, IRQ_COUNT, &econet_domain_ops, NULL);
> +	domain = irq_domain_create_linear(of_node_to_fwnode(node), IRQ_COUNT,
> +					  &econet_domain_ops, NULL);
>   	if (!domain) {
>   		pr_err("%pOF: Failed to add irqdomain\n", node);
>   		ret = -ENOMEM;
