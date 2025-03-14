Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A111953A9
	for <linux-kernel@vger.kernel.org>; Fri, 14 Mar 2025 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741991116; cv=none; b=Kg/nmA6YvG9f0JEXays9kGu+WtQMMTujBaXHj+y9U4qJn/cB3lzHsY4N6SFMbuopB5OaSTGMEDTmdE5F/CULWpJXz1pKhrgbkMTCnZJvJ7N4fkg/1QB7gF2zk5uZr0502Jo/4dgJu3SWOzKEWpczWCT3qImaI1fUtBch5bn4U+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741991116; c=relaxed/simple;
	bh=eauF56c391tHLzKpWgANfyOwSYxYihpfxMmqsDFNMeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3ZcOfaMRzOxDggoto7pG79vRrZAJysHu7FlfWXvo7eeKsRkj6I9eqNJ7uzm7bqn52ubhSmeO2BkziGygLWeK6pOZGISRhF15Wq/H+rJFetRqdndArW++R3iBts990o5ZpzzbGhX751fbx2d4e03QjOl+c14beqI8Cna2j0l55Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiwCextC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiwCextC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48187C4CEE3;
	Fri, 14 Mar 2025 22:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741991114;
	bh=eauF56c391tHLzKpWgANfyOwSYxYihpfxMmqsDFNMeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IiwCextCpwt0WEaoTGHKcJ3pIbfNcBAE0TS4pZBMYcQdQ2dsOuXtNcSOpJZ7WGC/y
	 TJ1/jiPeypw3ouAromBGXmFthl3r2GSOt+GiPzCk55BDy7xITBGZGwQ7gSC8NTLKOd
	 kE0F/AXrOz3fC2lGovlvviH+lGKVCo+JL3jNncoetSWy5c2G/Y43EE3gpgZaar1Kgn
	 7/Aw/lfcLKgtCDYAY1Wmqo8gu7IYqhF3EoROAnb+6eMGrsMqYMyvNq4dEo221xFeAN
	 zGDLC99aSoI7g+bGU0QQrETaRRkzPXSzW7oHEJ7SPuflb/ahJst0UmtuZj/8/tB5ha
	 I918WzkTsCi6g==
Date: Fri, 14 Mar 2025 15:25:11 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 00/20] x86: Cleanup alternative_io() and friends, prep
 for asm_call()
Message-ID: <tcizy2pikr4nonjo3bi74fr63kctbh6333rxdkoeb4bnnnwffn@qpd7igl33f2e>
References: <cover.1741988314.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1741988314.git.jpoimboe@kernel.org>

On Fri, Mar 14, 2025 at 02:41:13PM -0700, Josh Poimboeuf wrote:
> Make the alternative_io() interface more straightforward and flexible,
> and get rid of alternative_input().
> 
> These patches are a prereq for another set[1] which will get rid of
> ASM_CALL_CONSTRAINT[2] in favor of a much more flexible asm_call()
> interface similar to the new alternative_io().
> 
> [1] Additional 20+ patches not posted yet to avoid flooding inboxes

The rest of the patches are here if anybody wants to see where this is
going:

  git://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call

-- 
Josh
