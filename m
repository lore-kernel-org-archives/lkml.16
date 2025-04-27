Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8C72512DE;
	Sun, 27 Apr 2025 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743726; cv=none; b=IAgQc2unD+YY2bw+UTJyG2g6OSyCo3QHLi9aPbzkxyFLFacM2fLMlGwbGdC1NxgSJDxZBzFDH6XTUtdVUL/i/Yv6E1G2vRQz/tjqRD/KW95kXHcuPOzAOitHU9yJoPzFKZDXNPEfBcA3tERCp5zlE5+kZZPUBlyQCXAI2V9ALfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743726; c=relaxed/simple;
	bh=15FMzlfStK45Rpjqc5cLPwwLDse8Vx1zpDlpVvSCWrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPDrIBdzJ/dShd6riYQOvT5+8JRuMIecduy/ih8p6Awiw7W+QseEGk1QePvuJvo/7NsA1t2eWDQuLDBuwO8QqCH+bFO7hoANVIuHut8s+KMS5PRzsBNqx04mKxqGZ6xDK2xjXPXsuj5uchwxJiIe6toMeQeWWHr/Wkmpr33Ei4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8wsd-0007Kq-00; Sun, 27 Apr 2025 09:56:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 82F1FC0AFF; Sun, 27 Apr 2025 09:55:40 +0200 (CEST)
Date: Sun, 27 Apr 2025 09:55:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: ptrace: Improve code formatting and indentation
Message-ID: <aA3i_DtFobU8KhCX@alpha.franken.de>
References: <20250419102744.136697-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419102744.136697-1-thorsten.blum@linux.dev>

On Sat, Apr 19, 2025 at 12:27:44PM +0200, Thorsten Blum wrote:
> Use tabs instead of spaces in regs_query_register_offset() and
> syscall_trace_leave(), and properly indent multiple getters.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/kernel/ptrace.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
