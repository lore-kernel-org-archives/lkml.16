Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398C24DD0C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560643; cv=none; b=PoL07eYY21UkPasfwYQ+WzTEYN7ZynH5AeXM3rWxwS1vGzK3O5J6rsz7kQvEN/Umr0XcvyWKCgE0sDten/YdzccP482vvo6jYQW4Jz/+TCwZ71DNLTRJvO9sY6unSfPF4VLCjL1BAUpDOk5Lb3Cq2S4fB9maNw2yBJZacC8SRf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560643; c=relaxed/simple;
	bh=HoSZQvuVCpqWZpJ242iajwBFjcCc0TGUuKTY9xVgSkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=didGH3syo45QPRC/SPZ50us1EmgMnHAacxq8JDnh7H+8FWQR07i7AYL+/F0QbaTFSCrYrOYBZnwN8sGHaO4kRZ2go1pUBaZEvcVn1dq52zdDRuchvMdUQL/p2QvQgo5AtPoJJyzVY8CXqS13/fwj+VQyK67eGEMGpskYQh9ODjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jTJhALoz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sZAPoNN+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jTJhALoz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sZAPoNN+"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751560640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNJeWSeRcHeJYp56ea0icbMw4D9OJYF8Ft586dydoJE=;
	b=jTJhALozm1XSZmVKfGIYmaK+SkyCaAt2Om3QT/cEPLVbMBjvna3p9xaQHEBf4d5bSIlARr
	PNsZVISnaP3GA4KHOQJSqcZYBeFiegi6MAsiwMHrf1gUbOcsAmnUrWA3zsOlTVoSAW5qOM
	MpsbVQ1gBDbs9LmAOwbWeKo+KU54GzwPsomVjgKshq9sfLzC/eF8Cl/bgwlNxdyDod26Dg
	i6IMs4anElx0GWHeUVpNSbA5eQNent7afauN3ucsuGKdBgwVMxZ5JjlFGhCMmcD7FuJOKp
	uI22IfhrwBkj+oafUjL1PGQxdSgABLt4S8s67rc0pCR931bFL2XCaxalRcD3Ow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751560640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNJeWSeRcHeJYp56ea0icbMw4D9OJYF8Ft586dydoJE=;
	b=sZAPoNN+HzM27I6PWIqMYVMZiFPSh/b9hFaed8OPF4y/bXdM+aW8i8kUCi6AEZilOvCEiQ
	c26ZKjLOJQCddZDw==
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 0/3] powerpc: Cleanup and convert to MSI parent domain
In-Reply-To: <cover.1750861319.git.namcao@linutronix.de>
References: <cover.1750861319.git.namcao@linutronix.de>
Date: Thu, 03 Jul 2025 18:37:19 +0200
Message-ID: <87sejdtem8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 26 2025 at 16:47, Nam Cao wrote:
> The solution is implementing per device MSI domains, this means the
> entities which provide global PCI/MSI domain so far have to implement MSI
> parent domain functionality instead.
>
> This series:
>
>    - Untangle XIVE driver from Powernv and Pseries drivers
>
>    - Convert the Powernv and Pseries drivers to implement MSI parent domain
>      functionality
>
> Nam Cao (3):
>   powerpc/xive: Untangle xive from child interrupt controller drivers
>   powerpc/powernv/pci: Switch to use msi_create_parent_irq_domain()
>   powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()

Gentle reminder @PPC people.

Thanks,

        tglx
