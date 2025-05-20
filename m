Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B55261596
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732606; cv=none; b=A3AnDc6B0yhHOuBr873sPkrSSv6+4BDvrXnvbUO/SWjp/ij6OiJBGvRiZf4vFHjoqr1GAGUrdaJzgH+xD7GwXVFvjBz5s06tDxTCnZVV09ybwxxDvYhGGWI8BCOaw/czikTkTxOvWpcTCLF0DrGptI6NHYuj4kuxv8OLRV/hlgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732606; c=relaxed/simple;
	bh=jR9xi//7cPiQ1oa8OB2YAKg66WDWujeTFTpQ4irEdFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORA4aZPioW7UUFQkfOFKkXliQr6nB04y0oBB3RAetVoKx9vf5MUUbwyLYttEWmTCezEFXlgeatjbgiz9de/Q5SqezG+Pzd6jl/vRE4DvX5dNaEUwzGl9uQr4eZ0qzW37kC59EoG77wZ/wdGxMFXCDDcrMu3OC9rSiEJQtacTp0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdUeFYZd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdUeFYZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A853C4CEF1;
	Tue, 20 May 2025 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747732606;
	bh=jR9xi//7cPiQ1oa8OB2YAKg66WDWujeTFTpQ4irEdFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdUeFYZdAPx4l3pLlT0kN66mBtZc0dMevUzQBThOQevhw30IsgFgpdlVgHkvI7pjM
	 lPw9fEO8QkiRyENlpP4Wr9IU/5itTt1hxJDf5wbAPX9ck9TGgvlDbUmkeGtuHZmfIW
	 qaTUZrl2ce/AfsdVoOFpRq7l89xiY+xVzZaNb7yjhZlJP5/JKAWeMno8oQbL/nVIrH
	 l20m93esjYKpMXia5mAa1ldA3zi/E0QukO79pefgOzYv8PQCumR40qhcVHolnr5JFs
	 tn8Q7J4s0N9Bq52WAnJ7aTsqirmVapOPtmm4XhcRB1a0gm4Qabfwh45GqcBRHf84gp
	 g4SCMjGXURuIw==
Date: Tue, 20 May 2025 11:16:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, nadav.amit@gmail.com,
	Rik van Riel <riel@fb.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 6/9] x86/apic: Introduce Remote Action Request Operations
Message-ID: <aCxIeJZjdSEMi__f@gmail.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-7-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520010350.1740223-7-riel@surriel.com>


* Rik van Riel <riel@surriel.com> wrote:

> diff --git a/arch/x86/include/asm/irq_vectors.h b/arch/x86/include/asm/irq_vectors.h
> index 47051871b436..c417b0015304 100644
> --- a/arch/x86/include/asm/irq_vectors.h
> +++ b/arch/x86/include/asm/irq_vectors.h
> @@ -103,6 +103,11 @@
>   */
>  #define POSTED_MSI_NOTIFICATION_VECTOR	0xeb
>  
> +/*
> + * RAR (remote action request) TLB flush
> + */
> +#define RAR_VECTOR			0xe0
> +
>  #define NR_VECTORS			 256

This subtly breaks x86 IRQ vector allocation AFAICS.

Right now device IRQ vectors are allocated from 0x81 to 
FIRST_SYSTEM_VECTOR (POSTED_MSI_NOTIFICATION_VECTOR) or 0xeb.

But RAR_VECTOR is within that range, the the IRQ allocator will overlap 
it and result in what I guess will be misbehaving RAR code and 
misbehaving device IRQ handling once it hands out 0xeb as well.

So you need to lower NR_EXTERNAL_VECTORS for there to be no overlap 
between device IRQ vectors and system IRQ vectors.

This will substantially compresses the available device vector space 
from ~108 vectors to ~95 vectors, a ~12% reduction. RAR, under the 
current device IRQ vector allocator, will effectively reduce the number 
of vectors not by 1 vector, but by 13 vectors. This should be pointed 
out in the changelog.

It probably doesn't matter much due to MSI multiplexing, but should 
nevertheless be implemented correctly and should be documented.

Thanks,

	Ingo
