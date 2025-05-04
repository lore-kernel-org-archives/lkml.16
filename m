Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C39B28EB
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746347779; cv=none; b=Ov+MtqBB/OMNx6lWk+CtD4Vl2DhRJ1JRKVaOI70vwF+N9qITnTTEKJPAeaDOsDNoBYdvtsq4OwY+4F9cxrHXLPw2OenWlAbIkGF5346QFdnJsbm//TDeL6+NzKYLTFycj1L1NEsdMQvR58ZsStao5hJr237g5cmyY1HU5Oy/orQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746347779; c=relaxed/simple;
	bh=O5JdFr6SmshlR9BXolNfD9RHUnloKZIv1FHtVpg4k60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNex6nkMEUEv/An/vj+JMsb8+E/U28/7sAjF6guSNSvAd7NkcwcT2sHXQxGtgVUYkcZ7TPf8Md3TqxwPjkYbNIwC5BGxBjbmXk8dq3cEXGmnatmUh+TzeZIHZiINh1GHm2Ko7PIK/isu7W0afv5wFwfDQdCz2Qo2YujFB3hXjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aafD7kGw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aafD7kGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EB4C4CEE7;
	Sun,  4 May 2025 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746347778;
	bh=O5JdFr6SmshlR9BXolNfD9RHUnloKZIv1FHtVpg4k60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aafD7kGwM3bpZCrznabESphhc7IsHUONfIfsymzyygTJAHX/mmzrXkDdOzh0KAcKB
	 XEYbqVQBwNvCyYdtIJ8WhLxhOwidi+sNtz8YAem1pYrxoBSeMs9QNJQyZZgpdgq0Nh
	 f4DwTj+a5a3cFUE0j2160BWQDP5DpQh1kFno6S2qX4YJBAD81wb/wJZuE6udQaZxKp
	 87tSzp3J8sJYteOU2SS/S6nVpjj4eu1cgPp3qfkbQeTjavTV2Pqu2sS45d2zWIW0yY
	 YL+R8WR6zmFYVelUrFg2kNd7wVe0O0KBw/ILqlPKpMGbgVP8TxTg0lJsmD1ZRzYPon
	 tK1rVV1cy565g==
Date: Sun, 4 May 2025 10:36:14 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH tip/x86/fpu 6/6] x86/fpu: shift
 fpregs_assert_state_consistent() from arch_exit_work() to its caller
Message-ID: <aBcm_kkkJi8zGV6W@gmail.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250503143902.GA9012@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503143902.GA9012@redhat.com>


* Oleg Nesterov <oleg@redhat.com> wrote:

> If CONFIG_X86_DEBUG_FPU=Y, arch_exit_to_user_mode_prepare() calls
> arch_exit_work() even if ti_work == 0. There only reason is that we
> want to call fpregs_assert_state_consistent() if TIF_NEED_FPU_LOAD
> is not set.
> 
> This looks confusing. arch_exit_to_user_mode_prepare() can just call
> fpregs_assert_state_consistent() unconditionally, it depends on
> CONFIG_X86_DEBUG_FPU and checks TIF_NEED_FPU_LOAD itself.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/x86/include/asm/entry-common.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks Oleg! I've applied these improvements to tip:x86/fpu.

Note that there's still a 32-bit hardened-usercopy regression/crash 
that Boris reported against tip:x86/fpu:

  https://lore.kernel.org/r/20250503120712.GJaBYG8A-D77MllFZ3@fat_crate.local

Which may result in the subsequent rebasing of your commits - but 
otherwise your series looks good to me.

Thanks,

	Ingo
