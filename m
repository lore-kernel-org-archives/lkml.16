Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F051C84A6
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308062; cv=none; b=S/3JTl57Ljg9cGxN1JTqLmzF52vaKywsml1UoGscF3s+bltmcmaja4hyOiVhF6t3C5wt3s0edPJo1CBEwqXWImOTzX9a6Yp1hNZSQzRMlBUIjsWwSI2t4x+zVHao2DqdQ4b6ArLZLMuHNr54Jv1Jd59Rh9GBV36OkojYQeP9adc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308062; c=relaxed/simple;
	bh=DRFFaPgAMK5wbRNIQNkVNzX5JjD2vrRTBMxGj6W1vQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzDTVrH0ElhfbcG4NwymjXJLievPH+okPP9z5Jupyj95oWk7Vff1y7QevnKTximY7MupmhmGw88T3gSTAz4qeXM5CRVYT85HaCls2QjmppOtnlosXUHnw0yM6bL81pfqEloGZpKWAuUlZzwQPMKfSiLC3lHp6NbE+klRqeKDQxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9cNtVCB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9cNtVCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53802C4CEE7;
	Thu, 15 May 2025 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747308061;
	bh=DRFFaPgAMK5wbRNIQNkVNzX5JjD2vrRTBMxGj6W1vQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9cNtVCBuXyfxApRKNU8GM/O0OIDaSu6UmqXESCMHzJdhM6/dXZ70+StXTdYsSxh+
	 2WNnk/emcRHJhUBOvWOXzVV2il/31yLodTJ7RM8JMYWjg6xdCx8f3FjFPpbcLypGrG
	 ywjRROSMuPO+9eigE3IT84yTb/9TBX4XM8l8zUekntavZgqiaTqmSCAQq17bXfR4FP
	 iXtmOp9WP2s+zIS9dcWwZ/tCff3PI8EL7q14BbU7txOjvaquQjM/YsXGp9GPi6DjEY
	 gKNEycDaDSdZAa0+KNzjqCq5ZtX45ui+dqGaTf2dlPl6bYVLelp8xKzSxucmlVR9lS
	 Ka9zL6+XmRDWA==
Date: Thu, 15 May 2025 13:20:55 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 10/29] x86/boot/e820: Use 'u64' consistently instead of
 'unsigned long long'
Message-ID: <aCXOF3q16RMQQagU@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-11-mingo@kernel.org>
 <aAc6teOZ3dgLIW-O@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAc6teOZ3dgLIW-O@surfacebook.localdomain>


* Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> Mon, Apr 21, 2025 at 08:51:50PM +0200, Ingo Molnar kirjoitti:
> > There's a number of structure fields and local variables related
> > to E820 entry physical addresses that are defined as 'unsigned long long',
> > but then are compared to u64 fields.
> > 
> > Make the types all consistently u64.
> 
> ...
> 
> > +		u64 start = e820_table->entries[i].addr;
> > +		u64 end = start + e820_table->entries[i].size;
> 
> Perhaps struct range as well?

I'm not opposed in principle, but that should be a separate patch or 
series.

Thanks,

	Ingo
