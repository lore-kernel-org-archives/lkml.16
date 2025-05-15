Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F02580D0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330503; cv=none; b=Le3I0iK3wxPrDQgELJIwidjODi7K3R72L15VwFf+KVa/Wlo+zXBBawC5EaNdC54e7LQlA9p7sE3Qpc9KHgM0exXWNYRcsHAX1biRDvakmYk8n3HNqWtafJU68rphKbYwP2Cexaj+3vAY35h27Hvs1fte2/UcVEvA9dkA5QZHxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330503; c=relaxed/simple;
	bh=20dA3Yak1zly17JJrTVf87LtKnoL8cgLJndYaVqUMmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjrVZz9tde/O1vZK2yaxELytHkMlcPU2Fx0sYAIyveRtKi2E7pFKnxDhIGnMeFjpKSMtZGXE3cd7PPlkXS9kjOHn8kS3BD4gr67D550A0hIAZONXMA7aI4kN/fIEoQAPVClBQEGkv9aNeZyHx+nsCxOCNjBGxtCU6HJMPH5SCFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmKreAMg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmKreAMg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99C4C4CEE7;
	Thu, 15 May 2025 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747330502;
	bh=20dA3Yak1zly17JJrTVf87LtKnoL8cgLJndYaVqUMmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmKreAMg6y2+Yb6xLX7ps1oCAlccAKZCLZ4EHXwm7ooy5FmYi6ELFxgY5t8oPb23M
	 qCThct+lDWcI0UWpOehEYsqCNeNh6FoDtysi1yLA8u/aufo72PrSm+fwrbNWLmM/HT
	 mDgcA4iR9mnemivcSKNzSGoiXiBdPIWd2DLgdadSRGsejrqRxb1HjFrAuWi/egS1GL
	 YrJFzzWb0Dpf8Qo1rSXSd3VWQGMuJIRQMf/c/gfPxXqzZ9PmVlqnq/WKkgWeMcO8XF
	 SC8BNA4/I3/SSlkHeiNZYhUmrg14WR0x5SvBJr+iGR8SX2gXHkxXQ1enfnCNXxlt5A
	 EoQGsIbyw0kGg==
Date: Thu, 15 May 2025 19:34:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] fitex: Fix kernel-doc comments
Message-ID: <aCYlwqAUsaU8ybWZ@gmail.com>
References: <20250515171641.24073-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515171641.24073-1-bp@kernel.org>


* Borislav Petkov <bp@kernel.org> wrote:

> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> Fix those:
> 
>   ./kernel/futex/futex.h:208: warning: Function parameter or struct member 'drop_hb_ref' not described in 'futex_q'
>   ./kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wait_queue(). Prototype was for futex_do_wait() instead
>   ./kernel/futex/waitwake.c:594: warning: Function parameter or struct member 'task' not described in 'futex_wait_setup'
> 
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

for the title:

  s/fitex
   /futex

:-)

Please also add:

    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Who also reported it three days ago:

    Link: https://lore.kernel.org/r/20250512185641.0450a99b@canb.auug.org.au

Plus:

    Fixes: 93f1b6d79a73 ("futex: Move futex_queue() into futex_wait_setup()")

With those:

    Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
