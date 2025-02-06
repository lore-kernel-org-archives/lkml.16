Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FED1F4184
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858963; cv=none; b=qysWoIakNe8WnL5xLJirFjm/UXUhXUNLKIMPGc3QMoa4cm1Z/D4G07u2xK2tIimKIh9321OZ3UdG0tSgOFnD2VQzUz6xu5h6TU6MT17MIywd08PS3rYKpY3aqmy3Yr8ybipRozLBsWNWbRNiXwukyVXP1qerdJNDiaDRhmI4mrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858963; c=relaxed/simple;
	bh=oJ/CEeO/y31Xa/N7LnXo8dj8B/drp63eh+v3L1lnfQ4=;
	h=To:Cc:Subject:In-Reply-To:References:From:Date:Message-ID:
	 MIME-Version:Content-Type; b=f3uq+3T832kAoIfhfoA7oMtRR+Qj+l5e/gaweA0Qqxe218DIahTMIn68VDf0bBMIWx5y2t5KGVJw3x8R/YidcABViAQ09B2KqoU7nlkEkkOmbHfErCMvrFYiwr0yaipWCQYuf7r3F2v8EO7VbtnEpEsB0hcnQdUlTumdwMI3CzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lJ5nb0gY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oxadQtsK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lJ5nb0gY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oxadQtsK"
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738858958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7qUbvLDBPgSgTvEM05+6AJd+0joqLoWTY6OS4Yqz2g=;
	b=lJ5nb0gY9sLjDuri4ywxl+koNTS+9jRVCrX1d2anjaFPq5itSjwmePq2iqm8bZP67yE70F
	K50nbSDp/90v02kmsN9uLfXk+9jXsGnaPr2zQOgbAtIhZpFjYW2BVi3DHXGC2j41hlQR2a
	ClgcsjZaT6q/ljSu/jj0hrZlTOOTN83ev/Fe2qxSnQWtG1b/xPpQWuAkqMVoLDf3XiMIfG
	LNO+SDQLxvLED242zYkJGPT1iCl1OcIPKOVzHTAklP6/082f/ELFCkmgq4nO/9tnO2HXfs
	+j385f2ijzq+jL4NIA4frE6719ZOAGOOkl0FEw4egu784YM9SYHYnXIEAITk5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738858958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7qUbvLDBPgSgTvEM05+6AJd+0joqLoWTY6OS4Yqz2g=;
	b=oxadQtsK4nr1s1oqr2yppxVD3imMEjhcOt7EezwUE7+tQ9ykXGrpaCdcWmtajfBN638A3q
	BcAy3LKUulogjJCA==
Cc: maz@kernel.org, linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>
Subject: Re: [PATCH 09/18] irqdomain: Rename _add functions to _add_*_of_node
In-Reply-To: <20250115085409.1629787-10-jirislaby@kernel.org>
References: <20250115085409.1629787-1-jirislaby@kernel.org>
 <20250115085409.1629787-10-jirislaby@kernel.org>
From: tglx <tglx@linutronix.de>
Date: Thu, 06 Feb 2025 17:22:38 +0100
Message-ID: <87wme3m4a9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jiri!

On Wed, Jan 15 2025 at 09:53, Jiri Slaby (SUSE) wrote:
> For readers, it is very confusing that:
> * irq_domain_add_*() functions are dedicated to of_nodes,
> * irq_domain_create_*() ones to fwnodes, and
> * irq_domain_instantiate() to the universal struct irq_domain_info.
>
> Neither _create, nor _add designate any of those nodes. Despite the
> naming, the functionality of them is the same: add an irq domain (by
> generic irq_domain_instantiate()). So the source of the confusion is the
> naming proper -- making the distinction based on _create, _add, and
> _instantiate.
>
> Therefore, here an "_of_node" suffix is added to all "_add" functions
> (of_node ones). In the next patch, "_create" (fwnode ones) are switched
> to "_add_fwnode". And finally, "_instantiate" is renamed to "_add".
>
> So when all are applied, the interface is much easier to follow:
> * dom = irq_domain_add_linear_of_node(of_node, ...)
> * dom = irq_domain_add_linear_fwnode(fwnode, ...)
> * dom = irq_domain_add(info)
> * irq_domain_remove(dom)

I'm not convinced that this _of_node() _fwnode() churn is actually
valuable. I rather go and consolidate the code so that the core
functions take a fwnode argument, i.e.

   - irq_domain_add_xxx(node, ...)
   + irq_domain_add_xxx(of_fwnode_handle(node), ....)

It's not asked too much from the developer to use of_fwnode_handle() at
the call site and the resulting treewide churn is pretty much the same
as in any case all call sites need to be touched.

But that brings me to the question of logistics for this overhaul. As
this is a treewide change, there is quite some potential to create
conflicts all over the place.

So the obvious solution is to consolidate on the existing
irq_domain_create_*() API, which is not the worst naming once everything
is unified, i.e. 

   - irq_domain_add_xxx(node, ...)
   + irq_domain_create_xxx(of_fwnode_handle(node), ....)

It allows to distribute these changes (except for the _nomap() oddity,
which is OF only) right now to the relevant subsystems and I can collect
the ignored changes in the irq tree. The final removal of the _add*()
interfaces can then be done towards the end of the merge window.

Thoughts?

Thanks,

        tglx




