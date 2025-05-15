Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7D205AA8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312520; cv=none; b=MAhCEJ1OsJFFvfjxUR26YpvTM2oTKO7+al8WO/6PEt2dLkHa4sA9wGCLFg8HR8sybjmE2xvVuBUYpUbuzoLRwBJVmHPpO/m3ub3U1Avv14mex8qW7i+Kv4ruH0BOO9Krf1Ev4bYOJr9NeEQPolpn8rk9pyYZhQ8hXmEkXn5Kcq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312520; c=relaxed/simple;
	bh=MUbCZqUB5rrdAciYkNl9Iv4mPTHwH2AJxr1lqvATqwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfBFKmcS1jJJwBUXzSJgNU6JJEQIKSPaLG4kecOWVwudWWTZlz7LCrm81vUxw9wTGqQyuFL3Ejo+3Fs6fvdoNFSQP1OKaBkODqNUuA5S2klj+2GSMuXaSAz56ivk87Ljq0VkfiiME3tPgzOnPVdRlirwu8r8SJpYrM8vLUPChz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAZyOyNm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAZyOyNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8F0C4CEE7;
	Thu, 15 May 2025 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747312519;
	bh=MUbCZqUB5rrdAciYkNl9Iv4mPTHwH2AJxr1lqvATqwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAZyOyNmBp6zLtkVqHEwsbmysP6S4n9FQKiOc0uldgc+HWSUgMnlZcKckfQoLKJmC
	 NMGxM1qTfU8z5r0/Yivq37BDpbU19C1oJPjZsyruhdJUfOL94SRKf3MlStgNNvtYHs
	 c45lDxQJPsZ+BPVJaYPu2ertTWGcrsnEnStvOjB30s0bQG+RExi09IHxU9jeMEO130
	 R5E6b8cCr5FpLQJ+Pln0Sw3idS2j5lvN8xi+JFTETMAaz+noW9jAyXQGOgPfict4PH
	 eUnGeIddFCRh/czc/jasSxpntHB+vk88by3t9Ng2BFz8zher77a6CfJIGUEnfDgtk6
	 /jeXrd9BTvJLA==
Date: Thu, 15 May 2025 14:35:16 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/14] bugs/sh: Concatenate 'cond_str' with '__FILE__' in
 __WARN_FLAGS(), to extend WARN_ON/BUG_ON output
Message-ID: <aCXfhFOclFTQ6fEs@gmail.com>
References: <20250327102953.813608-1-mingo@kernel.org>
 <20250327102953.813608-14-mingo@kernel.org>
 <CAHk-=wihuzRytaFKr6b_pbi209JW+GWiNMtb9x-XhQdstxPuMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wihuzRytaFKr6b_pbi209JW+GWiNMtb9x-XhQdstxPuMw@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> The patches look fine to me, fwiw.

So I've changed the series slightly to add a new Kconfig option to 
trigger these extra strings:

	CONFIG_DEBUG_BUGVERBOSE_DETAILED=y

Disabled by default.

This should address concerns over the +100K kernel size increase that 
some have raised.

I'll send out a -v2 series, which should have the Cc: problems fixed as 
well, so that all architecture people see it too.

Thanks,

	Ingo
