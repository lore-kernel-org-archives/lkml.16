Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593861F03D3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669113; cv=none; b=RY1dRSSLxt59TE2C8aG6oKsBIyml3nm8PF2RBrNZZTjWRZIPjngqxcx2K42Y1jHLWZjppJr/frSJwPmL/M0ing69o+6gitmwrPdqlImhOJGT7vw5KOFcwPw1X3If3XYLxivTfQ9yM+9ePCzx2WWl9dkhsXWBKbFkQLYHSoX4T+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669113; c=relaxed/simple;
	bh=j2N0TLHxpGgSIRskiQ9rS62yU4O0DBbi9bK/VylmhVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uP/wBTGw1i06fWt41176jj4f75i/0/rl9myruyC3A1Ix81XM8Vp39JaQCn6t71CPvBbOBxqkyxTE2+tzOBUB3okvre3NQZEYfDExy+qZuFEEIfZPc+X49UPHlZoDw4pL5ixfB5ITvVySZ8CiuH9//N27RKSjLp4rN4XIgu9Hm2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MU6B6tLQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MU6B6tLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFDFC4CEE3;
	Thu,  3 Apr 2025 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743669112;
	bh=j2N0TLHxpGgSIRskiQ9rS62yU4O0DBbi9bK/VylmhVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MU6B6tLQYpT1epW1bo5tkwJNVLQriQ2n1R+D+AH2bK0LRTsBln9BWpVk6aFc5TBMK
	 UVhkD625p+3Nyqi1uCAnHyTrpnaFpd+8mALXkzKVRykttxHnuQTYtu9ICK0SRTS1h0
	 7EfhL1xf9fAsw1SHXt712iyLthn8kloi8PBEmqjbupDe8vdN+Q3xT8q61UbQh4rndf
	 4IhsN4k6Si9axvSFNDRGEQHiRuLLpNwd2rE0xP3o/P7PGOva4f/ESCwIhpedDrec7f
	 3rRwYfsp2xjYMYNUczrN5V7nXT0vE9WMr1UUdATRFKCSNNpsLyAL/bKVkdp7SnmgrQ
	 BBU9cBx9JK91A==
Date: Thu, 3 Apr 2025 01:31:50 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes
Message-ID: <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
References: <Z-xFKa5hiQ5urVwS@gmail.com>
 <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>

On Wed, Apr 02, 2025 at 10:58:15AM -0700, Linus Torvalds wrote:
>         911:
>         .pushsection .discard.annotate_insn,"M",@progbits,8
>         .long 911b - .
>         .long 6
>         .popsection
> 
> which is just pure unadulterated pointless noise.
> 
> That "annotation #6" is WORTHLESS.
> 
> Dammit, objtool could have figured that annotation out ON ITS OWN
> without generating shit in our code. It's not like it doesn't already
> look at alternatives, and it's not like it couldn't just have seen
> "oh, look, it's a nop instruction with a clac/stac instruction as an
> alternative".

Ugh, fragile hard-coded special cases like that are exactly what we're
trying to get away from.  They make the code unmaintainable and they end
up triggering false positives, just like the one fixed by that patch in
the first place.

-- 
Josh
