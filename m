Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA242A87;
	Thu,  1 May 2025 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746060283; cv=none; b=eVIadN68mCIjABhL0FcK1SGdlLWw/seERoCsseSFV4AibbSkabXqDCstWy1sSnRNwiSY4Oe4mTg70fvH6RrP0lh5ZvpZy3zyFfLIGHTuDb1nRYmyjffyQrBzH4/8TvCgSzdbevfGUNK+AxMIK8ErNpsfPPOvV49zmJLjCjTCJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746060283; c=relaxed/simple;
	bh=Ab7M7H7nRmNFNWh96Fia/8+mn2FgmJJgEuGJ617QAdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLrZ+jsNlsZMlitWxQ+KcTDvSJNJftvFvJzY+t+mwZ9wpmZWPNR56CRmFPtq7x1oopcgb3u3XDNqlEtVQQF9vTVK97jA4b9ci9hPIZkjhElOmzCAV38WVlkrbRwN/6JfI5081Vr4RHQJ48wprlHC1Ek2UA5rFkyIw3u7AWVc4cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhv+D+ZN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhv+D+ZN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B197C4CEE7;
	Thu,  1 May 2025 00:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746060282;
	bh=Ab7M7H7nRmNFNWh96Fia/8+mn2FgmJJgEuGJ617QAdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhv+D+ZN0Iljf1UblLJSGJqBr54u37Uo1lwFXZoyEMKxzEpCkG7wm7Zv+VEkJ27ms
	 orJ9BxGfG6BBP0eLm6K5VRxwu1vRfCyZbIY+drVnCL8BGge46Be2bBwQ3b8lqBN1Ah
	 hUPY8mB4xiDJAv4rmkejYqKm2M0NW0noL26jB4+nv8ltIBKfur0PJxFRLgTuaK0/kl
	 qEWknnjo1noEg34CDZvJzmItSL1iqRYCL/J5ONAmpf+De1WfpXaGHIBuf5BSqGyEzw
	 H/uC//BoPmZCuQNWSJd6U8UZkmNSYKF6KCL2tuM7oHECVC/zUmyKaM0gJHnizJXSuY
	 Q3Sh4ncb6FGKQ==
Date: Wed, 30 Apr 2025 17:44:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: naresh.kamboju@linaro.org, anders.roxell@linaro.org,
	aou@eecs.berkeley.edu, arnd@arndb.de, dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev,
	masahiroy@kernel.org, namcao@linutronix.de, palmer@dabbelt.com,
	regressions@lists.linux.dev
Subject: Re: next-20250422: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic
 relocations are not supported
Message-ID: <20250501004434.GA3762678@ax162>
References: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
 <20250430154845.795993-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430154845.795993-1-ojeda@kernel.org>

On Wed, Apr 30, 2025 at 05:48:45PM +0200, Miguel Ojeda wrote:
> On Wed, 23 Apr 2025 20:15:45 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > build errors with clang
> > ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
> > '__vdso_getrandom' failed: symbol not defined
> > llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No
> > such file or directory
> 
> I have also been seeing this too in my Rust-enabled builds for a few
> days at least.

I forgot to follow up here and say that I sent a patch for this, it just
needs to be applied by the RISC-V folks.

https://lore.kernel.org/20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org/

Cheers,
Nathan
