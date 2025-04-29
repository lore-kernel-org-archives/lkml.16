Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE381DF73C;
	Tue, 29 Apr 2025 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944080; cv=none; b=IrPGuGGhXuoGBxCbuYbMVuGBsA1tssIE0WYQKrTyd4C20r9tsYB9ZbZkN8dFKCtyRWjKyz3H7DL6wi6LVKhBFvVtOYNvlp4CviCVX8zEaUslFN1qYmn8D4mFcRrz43OflNpRTbGjusdJO+Hf8kEcSqRf9s+TTEQ0EXn7qfm8bsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944080; c=relaxed/simple;
	bh=N2yloLqzeCYmCLu5QV8WhOHX/p5K2Q2uHfqHQcwn9VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df0wJCmRLJc5JNHlFMXPKCDxKUOwiU+Um/LqW+GIFVqGPIC2Z09Pef5hekWstC8ZZwEJlyGJSbQXgUvRx1Ra4ZKJ46EiSDpH+23P54Thb3CUsYuUuAHlxyUVdFg4wAZ1xRo8KMwRqp9bla2tvCjD1Zwh8iNv3nVm+0EBkqrUIdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fax++9eo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fax++9eo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C15EC4CEE3;
	Tue, 29 Apr 2025 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745944080;
	bh=N2yloLqzeCYmCLu5QV8WhOHX/p5K2Q2uHfqHQcwn9VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fax++9eoc5gEmi/RxNw+zJsseUJgTlD/AJdUz9fH1BumzRBF96udkuEqNhE76I+8f
	 1bS8LbohlL+sSCpFY0h+ohk+xIhfQz1H/xUhP1jDXy3St0NzAVehHOgIuzye92kwYe
	 LKP8WTq5mFFrNHQp8cBvVFbYVzKJDMOrVaH5NhzHrvsvtZBStw2xbUPSQ1dJtcIlMG
	 oL+F3heySAMsaq9+k8iUqA3Z98MVDYlRkOhtIjuVfFacA+q49vTJ3/RyXW3uv8SRAi
	 YJpaJiBn9gZUbkLol1zxgH6T7bHayqifIfUYcylyJ3EHPNvOEvncFQNUnumeA1xx9m
	 isJCx55e6Kvyg==
Date: Tue, 29 Apr 2025 17:27:55 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] documentation: Add nodebugmon for arm64 platforms
Message-ID: <20250429162754.GA26677@willie-the-truck>
References: <20250416062706.2735563-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416062706.2735563-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 16, 2025 at 11:57:06AM +0530, Anshuman Khandual wrote:
> Add an entry for nodebugmon which has been used on arm64 platforms.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc2
> 
>  Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d9fd26b95b34..f4a313d6c0ab 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4085,6 +4085,13 @@
>  			/sys/module/printk/parameters/console_suspend) to
>  			turn on/off it dynamically.
>  
> +	nodebugmon
> +			[HW,ARM64] Disable debug monitor
> +			Disables the debug monitor exception handling on the platform
> +			regardless whether breakpoints and watchpoints are programmed
> +			or not. This prevents debug exceptions from being enabled via
> +			MDSCR_EL1 register.

Hmm. I appreciate the effort to document this, but I'm not sure that the
text above is really going to help anybody.

Firstly, this option goes hand-in-hand with a debugfs control
("debug_enabled") and so the two would ideally be documented together.

Secondly, I think the documentation should talk about the user-visible
effects that the control has... and that's where I get stuck! This has
been there since day 1 but I'm not really sure what it's useful for. I
_do_ remember needing it to use the DS-5 debugger back in the day, but
looking at what the option does (it mostly prevents the kernel from
touching MDSCR_EL1.{MDE,KDE} which effectively disables hardware
breakpoints and watchpoints for kernel/user and single-step for kernel)
I don't see why that's relevant for halting debug. The architecture says
that EDSCR.HDE can be used by the external debugger to enter debug state
and I don't see anything to suggest that MDSCR_EL1 settings interfere
with this.

Maybe the problem was that the external debugger left a load of live
breakpoint registers around after detaching, so this was a way to
suppress those? I don't remember :/

I wonder if we can remove this?

Will
