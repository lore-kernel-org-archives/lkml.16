Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A90023909F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076841; cv=none; b=njfYVmRC69RlMVfEwp7h3FikF5/tZcTopXsR3wDLfOScLVAK5HkjinYP3qDtvchPWz5oY/EJ+QFf6Yto95c/LvEu+9XKjXZDc8KUJMw2o6CFX1N1bDTLp9DkEFe8VCk+O6pAOAreFUuQNzTNAFvwcFERi+BugMmx+6Zusb9Kodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076841; c=relaxed/simple;
	bh=/a6XHnfQJpqytZkAVIQ+786g/mKjj+QYCrsfC6Jfamc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mgiRJ+2v67By34Qh3u7DCPWgvHfLg8Z17uQGo/gcMA8ofsUmgBiE3Slwy8RRarTjy0ENBQhf+gqG5CMi1P51kf0aEVKk1EMn0CJhnV9fc6sPuMbHvXHsOsyNrvT06sQvb3xQNhznyv9gZ7FrShYAR5LEAV1vGqpjQe4bq2sLCV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kq+KT1XG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dKMpQ+Zk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kq+KT1XG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dKMpQ+Zk"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747076837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khPZHF+I+GBH34KhXW0IkPgwSDpVW6k9Zdy+not8dLo=;
	b=Kq+KT1XG+qBlFEjoZMRNOhwRy2GtGaiBCvmEmfTyighcilbX5XBC1GTojERSRqdwwVJ8cq
	LNNvUqGTthdye1FI2ITImW0cF0/b604lxqPE2t7vGwbNr+95LuDwPBnXGfi61v7Ndew22B
	tIXyinrnqWSFZGW2lt62xMCVgZMzu3UQOGb1BS9QMOycQlEYixPr//iChrkFJdiKJK93jW
	6lHZz/NbMBMY7M4c/rXMhkFA00NU5G7HQqbPOH99SQqDtSIa1aOVnNBciDBK3FB5AggN2y
	r2NCsTvjTkj0YmLxQhU6v6+gzlq1gZqyh5izdZTgNjGNPWM6ONzOmrPKWKfCIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747076837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khPZHF+I+GBH34KhXW0IkPgwSDpVW6k9Zdy+not8dLo=;
	b=dKMpQ+ZkGLDPz10o4td5JPn0b9ozm8cZp07tJ/1WHMwrebVJNrdQdTJmELkSzcY2hZ/3Ib
	VPdS4a67gNwiIxBA==
To: Jiri Slaby <jirislaby@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [PATCH] irqchip/econet-en751221: Switch to
 irq_domain_create_linear()
In-Reply-To: <c2a92db6-cd6d-41ab-8431-28e5b69e455e@kernel.org>
References: <877c2top39.ffs@tglx>
 <c2a92db6-cd6d-41ab-8431-28e5b69e455e@kernel.org>
Date: Mon, 12 May 2025 21:07:16 +0200
Message-ID: <87r00tk5qz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 12 2025 at 10:55, Jiri Slaby wrote:
> On 06. 05. 25, 15:17, Thomas Gleixner wrote:
>> irq_domain_add_linear() is about to be removed. Switch to
>> irq_domain_create_linear().
>> 
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> ---
>>   drivers/irqchip/irq-econet-en751221.c |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> --- a/drivers/irqchip/irq-econet-en751221.c
>> +++ b/drivers/irqchip/irq-econet-en751221.c
>> @@ -286,7 +286,8 @@ static int __init econet_intc_of_init(st
>>   
>>   	econet_mask_all();
>>   
>> -	domain = irq_domain_add_linear(node, IRQ_COUNT, &econet_domain_ops, NULL);
>> +	domain = irq_domain_create_linear(of_node_to_fwnode(node), IRQ_COUNT,
>
> Actually, of_node_to_fwnode() is dying. I will send a patch to convert 
> to of_fwnode_handle() on the top of this one.

Hrmpf. Yes....
