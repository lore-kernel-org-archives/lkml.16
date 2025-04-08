Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172B48488
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101029; cv=none; b=AZOqYv9K5xMSPBotJbjzkp7w3sZ8IYN4byXnLCHefm7gd3x8Cnxp5mYoaSLvL2h3JmQjpOJpFrBSSMi/L+Kg6MDYkjP3H/orD1HV8UmHR8MadKmE+Hw2oRZ3IwjxpeBXAxtFhG/9q36LbyMdvFzH+GQJLqIrLA162Dz2+rbHPVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101029; c=relaxed/simple;
	bh=KY8eqpSZSL2ejUW+DL03KcgssW/4F8yuDgQ6k2zPzyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7S03kzn46t6XgGKI8wB+tfVOl0y4qO4VO4vOP3022KPDgmfM28FVRQgJjoqWu5L37mozc/KXYHKf1Ua3v0xcTToA7G0f2YjoesO0+t4lEG3ldsRRiFVBSzEIaN57qfIDBMAyNHs6yFopDFKnkveLDL9cWMAGLHu7j3TiOdVOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=al8aTuVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="al8aTuVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59B5C4CEE5;
	Tue,  8 Apr 2025 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744101028;
	bh=KY8eqpSZSL2ejUW+DL03KcgssW/4F8yuDgQ6k2zPzyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=al8aTuVv9eV9MqMEblsJWD/xfzz1I3eQ9zFnN12RN/Wu8A2dyWnqV/PWDMLUpC1KZ
	 rLS87n2GUERaGR0Ac/ZY3SJdFgCnJgOrEtMtIMHCCm+0JUN/Hmv+dlmrCcWEfJHxJJ
	 2jDdlhHWcnhHM9qfIW7hNqeyzOeYpraYnQgFmNqQrUTVRx6PvLhZWOj+SDl4x5euK4
	 Gt0H1jGRVIwlgw92aMP3mbRrYeVkOjyCbKclhv6m/r4Do4xeqHtIobFKD7fpI1uB0O
	 NSQNNLKdx8z0EB5yqXV5oYnZ33pteqJvJMPaeZDNOijggyJweDsxjjMEQGoWlYIIAf
	 /Yz+jKN2iOU+A==
Date: Tue, 8 Apr 2025 10:30:24 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH RFC 3/5] noinstr: Use asm_inline() in
 instrumentation_{begin,end}()
Message-ID: <Z_TeoLQfZA858jk-@gmail.com>
References: <cover.1744098446.git.jpoimboe@kernel.org>
 <7cb41fe7e87a003fc925164d5cc18efd8e95fcc0.1744098446.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cb41fe7e87a003fc925164d5cc18efd8e95fcc0.1744098446.git.jpoimboe@kernel.org>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> Use asm_inline() to prevent the compiler from making poor inlining
> decisions based on the length of the objtool annotations.
> 
> For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
> 0.18% text size increase:
> 
>   add/remove: 88/433 grow/shrink: 967/487 up/down: 87579/-52630 (34949)
>   Total: Before=19448407, After=19483356, chg +0.18%
> 
> Presumably the text growth is due to increased inlining.  A net total of
> 345 functions were removed.

Since +0.18% puts this into the 'significant' category of .text size 
increases, it would be nice to see a bit more details about the nature 
of these function calls removed: were they really explicit calls to 
__instrumentation_begin()/end(), or somehow tail-call optimized out, or 
something else?

Also, I'm wondering where the 34,949 bytes bloat comes from: with 345 
functions removed that's 100 bytes per function? Doesn't sound right.

Also, is the bloat-o-meter output limited to the .text section, or does 
it include growth in out-of-line sections too?

Thanks,

	Ingo
