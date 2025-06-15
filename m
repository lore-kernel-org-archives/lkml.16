Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F31E288AD
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749986952; cv=none; b=XnJgzds7uoJ1Mus3MIztffzH8AIo6Iqo0oKT9R2OcyjlmL2MJUmqvL9e9A9MbAd5uYSvx6/H7IJY7uIuHdRRe9MT3iGBlJjpXv8FTVPiXxfH8OD4wQb4f/gxK3d28/mvP3RoBoRRBnLw4dZcGceu99lsxi7Rj6s7TqYuY/Uu84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749986952; c=relaxed/simple;
	bh=G/+e21hifaP8bhyvW07D9vm1h5vZCD5r+TCtnsCQB9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQIl0zxemOI5r1X/T59HykRzoS19Ea4WJE5OmTfyogDxC2Yvj/JXD1tKKcLUPwJSCkmPeK27ThN920LHU6+irAblEEw0o6tkwiyWeHeuEGS7/gNV2R4tM2I7QFaDpOzBl24kacQx+e0b2V3e/h7HZWWKb8c/mWo2cA3NuGZXWqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lu7omQCR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu7omQCR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A1AC4CEE3;
	Sun, 15 Jun 2025 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749986951;
	bh=G/+e21hifaP8bhyvW07D9vm1h5vZCD5r+TCtnsCQB9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lu7omQCRuu3H/9WR2H0tGuUpYwPXnMmEDTwdZ8nVfjLj9jKsMYJ+WlVg3gMS+dHsY
	 S7fRAOtJ6o11LXFMxYg3X+yu+bnIZp/dJxvYQCKfAmYVhgWy4BAqXmNErOwJ+WERSa
	 AmP8tavuqRMge++iCzatLJkJhbC8x/f/ul9R9CZy5dw4sm6jRC7hY8U9FZDj8TFf5z
	 T6paCFzO3tHYqUmvCFPuihJKLGYeklZh6DxH7WaiUJ8jeAfO+BRS6nq8CsMkR8Mgs9
	 8eSmAq21Lt13ade8v7G5/4G0woYjRzrI5+6XpTvqRTILVew+09nXBKuhCxDWbahSnW
	 pH8g03qt8g61Q==
Date: Sun, 15 Jun 2025 13:29:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 09/13] x86/kconfig/64: Enable popular MM options in the
 defconfig
Message-ID: <aE6ughh6UCgRPFqq@gmail.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-10-mingo@kernel.org>
 <CAHk-=winzTt3SCzv8BWGMm0fzrXS0gb59gK0h4dAe0L6hj3X_w@mail.gmail.com>
 <aE6tFoBkF3tl9aeH@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE6tFoBkF3tl9aeH@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

>    That a 'stupid' or 'broken' kernel option is default-disabled in 
>    practice has almost no relevance and doesn't help in filtering good 
>    kernel options from bad ones: almost all new kernel options, even 
>    useful ones we'd like distros to disable, are default-disabled, and 
                                        ^--- enable
>    stay so even if all distributions end up enabling it.

Thanks,

	Ingo
