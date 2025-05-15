Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFEC205E2F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320206; cv=none; b=K+HBZ6GO1Um8zRiK6jIdfFgRGgXhXtmvP61PV/uvCDhL01j68QAxoiPFzW90Q9LmL+9WYv1UAea2DrDxiRNAP54u9vHHI0QtOciqbmqDN6SukA4EHhQFAOsYS7IxjyxK2N+oaAT5BBRa7Y/wefgJ/jsLv+V8GazjRyjDIdV5U7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320206; c=relaxed/simple;
	bh=k7+W0i39WdRl8+FNoIWV12spyCIOO2TyZ6JMN7brH0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHZknyNScvIf3hRWVEg9HikyXGcvimNJeo2xLXZmpwdknuD/VM0ctnQjxL68UZzfxh21xnCjRC2fdHmsDt6UXYp1tIQI8gxN/qCu3WzqYM+DFz8/aoKNPzXvaQd2r3vFcWUxcF6NqPOccO/dpu8/cob6Zn+TpuGn2cF505hSlhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owiwUM2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owiwUM2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2637C4CEEB;
	Thu, 15 May 2025 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747320205;
	bh=k7+W0i39WdRl8+FNoIWV12spyCIOO2TyZ6JMN7brH0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owiwUM2FSn/6vaVrA/J63v3yjkt2QQdbuSJZblD8TbSnHVkm+28BB+EpIDWBpiQpg
	 oOHV4kP1JZbgZmQIdw6g39FSnKlLOLnNelHSEgNDvXeqiCQTt4JcTI/mr0TjjjPUqs
	 5CLKlEXFePrHCJaPh+wFvEgsH8Dl+KtPCi7md53fSjNnmfrwl1JgXDFKcOq+k+QSYq
	 R6m9hol49/oFTpFOLSorrDLMfM6AIyVQEHYxDh7XMz/BNe3gclthPT+RyWwclXm5rQ
	 F3vG2iLPk2TZjof3Wv9k/iofn4oaM1WqQTovU47vjWH5zqF6VijM4zqL6KY/me2J1N
	 scf+WsCNbsOMg==
Date: Thu, 15 May 2025 16:43:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH -v2 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
Message-ID: <aCX9iN5BxitdozwC@gmail.com>
References: <20250515085708.2510123-1-mingo@kernel.org>
 <ae2478d9-640f-4c42-86ec-31cbe5955a59@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae2478d9-640f-4c42-86ec-31cbe5955a59@intel.com>


* Dave Hansen <dave.hansen@intel.com> wrote:

> On 5/15/25 01:56, Ingo Molnar wrote:
> >  80 files changed, 47 insertions(+), 14117 deletions(-)
> 
> Thanks for doing this, Ingo. A lot of this code was sitting off on 
> the side and not causing _too_ many problems. But that was (I think) 
> mostly because it was being so lightly used.
> 
> I've been using Linux since the late 90's. The oldest systems I ever 
> ran it on were i586's and they were old at the time.
> 
> I suspect this is going to throw a couple more compile issues at us 
> to fix, that's par for the course on something like this. Ideally, 
> we'd wait for v6.16-rc1 for applying something of this magnitude. 
> What were your plans on when to apply it?

Yeah, so the good news is that the bots have been build-testing this 
series for a few weeks, and besides an UML build issue that I fixed 
there were very few problems. (knock on wood)

And since Linus asked for this and semi-acked it, I might try sending 
this in this merge window, if it's quiet enough from the x86 tree 
perspective. The diffstat is large, but as you too alluded to, it's 
99.9% obsolete code that got very little testing in practice, so I 
don't think there's an elevated risk of regressions. But let's see how 
the v6.16 merge window goes?

> In any case:
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

Thanks!

	Ingo
