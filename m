Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1519C560
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749746019; cv=none; b=nWZp8sl1j4assqe/hchEYsm/wS/X1ieM/Hyxqyo3qG8aMFiIpt2m1fDCkLRrpVww/kH0PNOPAq7eVn2c030IJO/jtXVsdFmHbvHzpXoE7PfljghGtRpdnqwNKRslOeJZMUsRHB/nlU9sCMMc/paX/AbaC8QM2HU7KsMXnJUYe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749746019; c=relaxed/simple;
	bh=diFjJs1nQRb1BPTEubUXqeZGGrUpYO3F3j0LaFXBmSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRcxJ1d3PGOP4vL+zK8bpQ/F+/pvuw5JJP82gGQm1DZ2QD3s1XtbCedwsCWaM7oVBcTowt7st26Pw8w5JShujSK18XeGsYfQWa8PYb+1KFF71bkY7aMNvbyt45Ck1Vk3S5lsgMgCY6hUy2Vl9LQFCXWaE56Xr/CeubURpniaZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUwqfIsC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUwqfIsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF76C4CEEA;
	Thu, 12 Jun 2025 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749746016;
	bh=diFjJs1nQRb1BPTEubUXqeZGGrUpYO3F3j0LaFXBmSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUwqfIsC1hk8kjmFa8eAR2CdlnFZnvYqlJHfk+WeVwESl7vRXX7IjDwMvsH5VUBwn
	 S4h9ue2XxR3nh2YDD8CESkSC9CR1dv2JpOo57eSMqjDrus/7Z17+wIDqWlwWwiyp3E
	 V9BsNW4VSzDgYRom0Lq4sTIcT3kf7sAAEiX5QOHihy+j4nmt3Ak4NNNXyOVqWYQJwd
	 CjMYsr1z+aiGbViOyXoOzU8hIGpgkCCPLp+dwm0pF6OKeYmFRuKCq4sr+qQICduh9k
	 7mBt+c1neFaXXwmCNmZvPetf+0ozGFNjxeVaXGPFys+4bUA8hBEFMqIuNp14ZzSq+a
	 LDgfyvVoWV2CA==
Date: Thu, 12 Jun 2025 17:33:32 +0100
From: Will Deacon <will@kernel.org>
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David A . Long" <dave.long@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in
 regs_get_kernel_stack_nth()
Message-ID: <20250612163331.GA13384@willie-the-truck>
References: <20250604005533.1278992-1-wutengda@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604005533.1278992-1-wutengda@huaweicloud.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jun 04, 2025 at 12:55:33AM +0000, Tengda Wu wrote:
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index f79b0d5f71ac..fe3f7e554d14 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -141,7 +141,7 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
>  
>  	addr += n;
>  	if (regs_within_kernel_stack(regs, (unsigned long)addr))
> -		return *addr;
> +		return READ_ONCE_NOCHECK(addr);

I think this should be '*addr', but that makes me wonder wtf s390 is
doing...

Will
