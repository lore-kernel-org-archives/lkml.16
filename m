Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56F4214A7A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745621311; cv=none; b=bWEWwJGFUgNgzeWbcvtareG8UmyAh+ZeJE2ku3647nFr4LMrKjONSFQz95xTGNk2OBfPz/N6ZVgdN+asCxGOsmvD4HEpx8OnzAFNhDm3Ad0Qn2ifJrJgwX5v1DQyA/+ZwOlugbahmcqImD5cRB2qRqdxuFmGj+QBY4W+msEBO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745621311; c=relaxed/simple;
	bh=uZ7Nij1He0NEHxrCoUqJ8etb02FXoOVlBiScFBXmcTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXzcbxumMvnlpeFRNOLytSRyxMiAfEbbRf3gplozVuGzuzCL8EyNg/Rl60FfCQzTK6qCd1W2dVwULPWNliVPe5fRXr4D3q3w6I5LNUBx5HKLUacOo4jAJKtaJ1Y42WDur0I2cG6qMyz6sA953mplw5lg/N6oie/1TdCazRbnsVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuF+Vo47; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuF+Vo47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619FBC4CEE4;
	Fri, 25 Apr 2025 22:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745621310;
	bh=uZ7Nij1He0NEHxrCoUqJ8etb02FXoOVlBiScFBXmcTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GuF+Vo47m67DiYMeumVcO4FoO3N+IdYgOhgA5lt1ClG52fex9iKKO/TDekvw7jCKP
	 TdnRYe5CnKWMna9pi9K5WZAN7PJn7004Vmm412j2RlKgGWbVuA1q6nQ5JgzgQBVvmi
	 pwyzMtsVsu1eNCGpz5hEKOO8IqPDcNBJ/r4eoesPUEKknn4NRPyRoYVuIZ5Sw8e14Z
	 Rx77qY+RnVKyeooD3IIX7ShvLd3fhePPOnhHRELs6mCEld/6hanBmoWD64PA+cdVnF
	 1RMs2+n+sZpY/XhGDc3QbL4RsjC7KXzHYhZjQ88hsQK4oeD5Z5a4P7UELTI6VOaa0V
	 Nl+rcLX+lGJpQ==
Date: Fri, 25 Apr 2025 15:48:27 -0700
From: Kees Cook <kees@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: BUG: vdso changes expose elf mapping issue
Message-ID: <202504251546.FC8A40CB98@keescook>
References: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
 <aAvWchSUlnAfg42x@arm.com>
 <202504251158.D3D342410@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504251158.D3D342410@keescook>

On Fri, Apr 25, 2025 at 12:56:21PM -0700, Kees Cook wrote:
> For fixing the former, the below change might work (totally untested yet,
> I just wanted to reply with my thoughts as I start testing this). Pardon
> the goofy code style, I wanted a minimal diff here:
> 
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 7e2afe3220f7..9290a29ede28 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -1284,7 +1284,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
>  	mm->end_data = end_data;
>  	mm->start_stack = bprm->p;
>  
> -	if ((current->flags & PF_RANDOMIZE) && (snapshot_randomize_va_space > 1)) {
> +	{
>  		/*
>  		 * For architectures with ELF randomization, when executing
>  		 * a loader directly (i.e. no interpreter listed in ELF
> @@ -1299,7 +1299,9 @@ static int load_elf_binary(struct linux_binprm *bprm)
>  			/* Otherwise leave a gap between .bss and brk. */
>  			mm->brk = mm->start_brk = mm->brk + PAGE_SIZE;
>  		}
> +	}
>  
> +	if ((current->flags & PF_RANDOMIZE) && (snapshot_randomize_va_space > 1)) {
>  		mm->brk = mm->start_brk = arch_randomize_brk(mm);
>  #ifdef compat_brk_randomized
>  		current->brk_randomized = 1;

Unsurprisingly, this patch was broken, but the idea appears to be
valid. This new patch works for me so far, though I haven't finished
getting Ubuntu 22.04 installed in an arm64 VM. Please let me know if
this fixes it:
https://lore.kernel.org/lkml/20250425224502.work.520-kees@kernel.org/

-- 
Kees Cook
