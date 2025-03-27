Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8C20E326
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072063; cv=none; b=LAlQBPqfBgRsAlFx6Jmjr/ru+S0TADcXZ+3lDReKCBnpd/J1kREwAS5rtMXooqmXrv1OroKiSFmB/pbHb9PJX+NUnjzehFdIx1iMAU4tL0iYxvpuhxC3RiMqjIMhgaVO6vdNirTZwArughT/UjyYOBU+nGHVsVBju7/vW7wzJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072063; c=relaxed/simple;
	bh=Ezoe49kR7+OTzs5Hu3HjQWUKC5r7LalD1FQSkG40hI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7OwqRXJWADz4g/Ns7StuyOp2+uCjZuFzbnFsWjQ/Mjrn3xROccx5+QL1ipKTsPngle5QDnXLsf2cHrca82jkM38fFRPjcVyy4XMnU2UTEZDW9a070ASYFCAaHY0P5660XlkBFQzybFqk4bOboEdoJiJOzCLLNujjbF5YeAZ6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXJ0SesR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXJ0SesR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7FFC4CEDD;
	Thu, 27 Mar 2025 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743072063;
	bh=Ezoe49kR7+OTzs5Hu3HjQWUKC5r7LalD1FQSkG40hI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXJ0SesR6wUH4598bnHQ4Ur78SiVbJfRciil3jI953+nAb4Wnh3eJLJy4F/P2Hync
	 5K0d05eliuk9rIvVoojlzmTCF9zhNTTxnnhJ7dRX/F2na+imaA4BGiPKPObQFgs5+u
	 GkcM3nlweZsZabZ5DWHnqht7mEMuz8ri5mg40+GMRgDfxmE5zCvsPteFnMtTUy85DE
	 cREaUCUdPx7LrM+3SDxnRy97zQBESYIIq4qAI6cC1ZGErpki/l4m5mohbUOFpmNcHN
	 Bs9I6pJ7quPYXjYXjp+Swh4ES6mDY/niq1vojGp7rFrYrn6Hh4e3ASkD5MZ0ppfZFP
	 c4FiAdHIjjikw==
Date: Thu, 27 Mar 2025 11:40:58 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Balbir Singh <balbirs@nvidia.com>, Kees Cook <kees@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Subject: Re: commit 7ffb791423c7 breaks steam game
Message-ID: <Z-UrOtLLMTNFLRfU@gmail.com>
References: <20250325101424.4478-1-spasswolf@web.de>
 <64945196-f05f-478e-a2b5-f0bd58345136@amd.com>
 <c66e2c03648370d5e5c0745f32ebd58367bbe48b.camel@web.de>
 <CAHk-=wh5Suzp0z7AnK0NgSKfEAWQJw7Dgv5eku=rzBuM1ugQDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh5Suzp0z7AnK0NgSKfEAWQJw7Dgv5eku=rzBuM1ugQDg@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 26 Mar 2025 at 15:00, Bert Karwatzki <spasswolf@web.de> wrote:
> >
> > As Balbir Singh found out this memory comes from amdkfd
> > (kgd2kfd_init_zone_device()) with CONFIG_HSA_AMD_SVM=y. The memory gets placed
> > by devm_request_free_mem_region() which places the memory at the end of the
> > physical address space (DIRECT_MAP_PHYSMEM_END). DIRECT_MAP_PHYSMEM_END changes
> > when using nokaslr and so the memory shifts.
> 
> So I just want to say that having followed the thread as a spectator,
> big kudos to everybody involved in this thing. Particularly to you,
> Bart, for all your debugging and testing, and to Balbir for following
> up and figuring it out.
> 
> Because this was a strange one.

I'd like to second that praise - Bert went above and beyond what could 
be expected from or even hoped from someone who reports a regression 
that broke his machine. Also, Balbir diligently followed down the 
regression to a root cause that was far away from his original code of 
interest. It was nice to lurk in this thread.

Thanks,

	Ingo
