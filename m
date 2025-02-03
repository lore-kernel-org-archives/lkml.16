Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527F9205ADD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591054; cv=none; b=dAvbdtyq9LYIRb+tijD5CosZekIrv8PAa64T+lp9gRD6it40C+XWxXwfJRgog3JZJh2q6R4is0ZBsnUK0yLvLTF5GwhnNbiG85E02otXOv6dTYfQm01aSdE+IxkGYIw5rd6s46nYeWyqGbO8sm5o6YZ1Vuf8t0cI38swppdsSIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591054; c=relaxed/simple;
	bh=FUiTVhdGGA3lJX/iqV5aadn6ZSiB0ojJUyNNl3PZRTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Sh/RTbV58A6WMgwrBlnou3InCF9g4Wmwwa7Obl4MzL/jJaoGaJTLFu05Lg8Kz709HIOydOjMInvVdQtwCARNP/oUQa3cS90NvUrvJICUDyIhPJVKwkMoMRn7htbtkVrcNzWiJf5W+saCBRNS/QvLUFdlpDEZY1NY+Z+rg68VyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id BA45492009C; Mon,  3 Feb 2025 14:57:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B7E6F92009B;
	Mon,  3 Feb 2025 13:57:30 +0000 (GMT)
Date: Mon, 3 Feb 2025 13:57:30 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jessica Clarke <jrtc27@jrtc27.com>
cc: Andreas Schwab <schwab@suse.de>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
In-Reply-To: <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
Message-ID: <alpine.DEB.2.21.2502030510390.41663@angie.orcam.me.uk>
References: <mvmed0k4prh.fsf@suse.de> <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de> <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> <mvmwmec2t7u.fsf@suse.de> <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Jan 2025, Jessica Clarke wrote:

> >> a2 is used as it is passed by the calling function, so we can't be sure a2
> >> is sign extended to me, what am I missing?
> > 
> > 32-bit scalar arguments are guaranteed to be sign extended on entry.
> 
> Firstly, the calling convention is irrelevant if the function is
> inlined, which this almost always will be.

 Umm, that would be a compiler bug then, as inlining is supposed not to 
change language semantics.  IOW the compiler is expected to explicitly 
sign-extend the arguments of an inlined function at their evaluation point 
just as it would at an actual function call unless the compiler is able to 
prove they have come out sign-extended already from previous operations.

  Maciej
