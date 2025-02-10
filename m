Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE562580E0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204873; cv=none; b=OXqLRPv8dGGh8j80ekqCkwd5o/RzwOufznpvUa62VcUt+5y8Q9F2op54R593G70lDM5n1f9OoK4Wj8OvakP9grqaKGFjW5izIjKlgmD4tXC8lPXrJahX3IpkphtNtoE/ybm+DVTyGyR0TUU577hvBqT9lIw2SsRnlCBmwXMHgoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204873; c=relaxed/simple;
	bh=FsD4evhnkUoMLs50Dq6npk9Y9vY1AiAsD7ww/cj7yTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tY3mTYvrYQye2WpXW2QFX9ES/AVTNcyXSiIxpOIVS9EVFW62JojuuJGhLbSthWBywjuW3frZS48Pt918pEEUYWOT7+O6AvU+xayI2/6WHvyQGzmIsVA2MnIug7gs4/4bDBQcpIEX3vlvk6PN9T7lYU2sXB2rB1Aq6zSZYWN9YGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzjENklI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzjENklI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43F8C4CEE5;
	Mon, 10 Feb 2025 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204872;
	bh=FsD4evhnkUoMLs50Dq6npk9Y9vY1AiAsD7ww/cj7yTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzjENklIBMBg84Qb+fvaKxnHUxy5AH8+6SMNyFRGZVXCGV3plEyNJ/K52UbX07qu/
	 eNE+ONE3/Q4UaWvsi4bP3YzLlLJyUpd5KwRY/t9rHrYQBsRwKscF5KhwFfdz01Bnwd
	 nIaTxFjLVSQm1CXtXY6C/9dYbu2U1Bk+KRoieyrgGBD9cUgfu8hCEPw03gQnmceGph
	 6uvp/aejxZc87qeuViwzaenvbwvEuDlAtfjZM0PHNmPmdVlNaAQAYnYxEIX+mS+q3q
	 gZ0u+SJNLRwTUJLipXK2EEE5w9pMMZn6eplMs/xp+pVfsfQX4UHUY4oKzSXp/rrOPO
	 DMIFE4qMbXHNA==
Date: Mon, 10 Feb 2025 08:27:51 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2] x86/fpu: make WARN_ON_FPU get fully optimized out
Message-ID: <20250210162751.GC1264@sol.localdomain>
References: <20250127224523.94300-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127224523.94300-1-ebiggers@kernel.org>

On Mon, Jan 27, 2025 at 02:45:23PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Currently WARN_ON_FPU evaluates its argument even if
> CONFIG_X86_DEBUG_FPU is disabled, which adds unnecessary instructions to
> several functions, for example kernel_fpu_begin().  Fix this by using
> BUILD_BUG_ON_INVALID(x) in the no-debug case rather than (void)(x).
> 
> Fixes: 83242c515881 ("x86/fpu: Make WARN_ON_FPU() more robust in the !CONFIG_X86_DEBUG_FPU case")
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> v2: use BUILD_BUG_ON_INVALID() as suggested by Sean Christopherson.
> 
>  arch/x86/kernel/fpu/internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Ping.  Any interest in taking this through the x86 tree?

- Eric
