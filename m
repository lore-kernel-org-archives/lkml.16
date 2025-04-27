Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300E124633C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742229; cv=none; b=kPMJlqe16KkktzLL0uWwV21VWzQtmfb2MQYSkznc/CPreB+8ofJkCwUjwe0aXU9YG5xLkyK9SZeyFPe9Md4xsFaqg2n1s14Iimeqq8fR2O7NNvem1n5s3VpKkU9cJW/Jz/BYGt1kV+QrKqZXB3aLW9ryvFYap4XaL8QOaF/OTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742229; c=relaxed/simple;
	bh=uu3Id7BaKiuYp8X7N0f2NYbS+RKebNKAqxJJZ6XhhCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibdSXrMA0ojdawtvqLTxaMhvW/xyQo1xpR2oNYGjuu5Z739tA9yO+4haJL7a946p8gQwzfrWAFVUfrLhT3dDD/b1dAzOV5DQ3/EJxspUvtpMlc6zYIlipzc6zAYPYYxrkwX9l66vtGBD432NOUpzVkABZ7fbA23FNpVPGlN6wJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8Ej9x7v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8Ej9x7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C318C4CEE3;
	Sun, 27 Apr 2025 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745742228;
	bh=uu3Id7BaKiuYp8X7N0f2NYbS+RKebNKAqxJJZ6XhhCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8Ej9x7vx4aCVDUecNowkfGymxTbc3JCx1kVL5AXWzu4UX17ZwV8+Cz+AezTKmDSn
	 zzsGscK5DcIZG0K+aDXEm+3sgfb86WSEa4ulPXdmTywFBAaQn5qjIA/nmLw5XzL2GW
	 ugFspVWuCJJWHu3UlaiuKsSo+Ybey8XN3CVOlOcWrla5yB3U4pjT3LZWLw9uDQBJmZ
	 02G9yPPmZkjl6NVFLV4pmb9CmRn/CC8wMIWtnMvLSl/GI+oKg1HWp74fd3zb1U+f3l
	 djrsoKQRMZXZl343PI389Wdp/soX2o8libGRY3Pz8tQ3kan/GH0Y57JRpoy9PQENtH
	 omwE4i3BkRwDw==
Date: Sun, 27 Apr 2025 10:23:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Brian Gerst <brgerst@gmail.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, linux-kernel@vger.kernel.org,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 15/15] x86/atomics: Remove !CONFIG_X86_CX8 methods
Message-ID: <aA3pj0yVIizZPRxT@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-16-mingo@kernel.org>
 <5c175b6a-e9c8-2546-a4fe-98572c3f4935@gmail.com>
 <CAMzpN2jNPxAF75iuNwNjz7PqYygYgLeCM77rQV2ZCj=o6-qJDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMzpN2jNPxAF75iuNwNjz7PqYygYgLeCM77rQV2ZCj=o6-qJDQ@mail.gmail.com>


* Brian Gerst <brgerst@gmail.com> wrote:

> On Fri, Apr 25, 2025 at 10:30 AM Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> >
> >
> > On 25. 04. 25 10:42, Ingo Molnar wrote:
> >
> > > -#endif
> > > +#define arch_cmpxchg64                       __cmpxchg64
> > > +#define arch_cmpxchg64_local         __cmpxchg64_local
> > > +#define arch_try_cmpxchg64           __try_cmpxchg64
> > > +#define arch_try_cmpxchg64_local     __try_cmpxchg64_local
> > >
> > >   #define system_has_cmpxchg64()              boot_cpu_has(X86_FEATURE_CX8)
> >
> > #define system_has_cmpxchg64()          1
> 
> Or just outright removed, since x86 was the only arch that defined it.

No, it cannot be removed, x86-32 *is* still the only 32-bit arch that 
enables it.

I.e. defining it to 1 is the correct solution, and that unconditionally 
enables the SLUB code optimizations. It depended on a runtime 
boot_cpu_has() check before.

Removing it would remove the optimization from x86-32 for no good 
reason.

Thanks,

	Ingo
