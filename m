Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99148266B67
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707122; cv=none; b=u02KmG4R7RGEC3lQM7kFc5LTEBTBVBgqo7L4EQkFsgJC/1e5H8mnG6tTnoJySz8aLJ2iQ4O2IFcsLuLtNOFvuAokKy+KyhUxXc0hGYuCDNfsRjTksvMr1XxtWRi3qcJ7hrNy6L02Hp6MsT5HwZ/Utu6TzfaRbdJ3BuWIXQbYv9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707122; c=relaxed/simple;
	bh=KxBI2fyMN9/UXpw0fCbVj4HPgL+ZuvPpKn7rcgm7QE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFVVyjIcQ6AcxMalgWkD3yc8IjuBB/xArQc46RzBpAOqrdhbT0de79Xa4uf44JDTri7Ee1HdAv8ur/tzZvmaYaG97KmyKxQWLYrC9sFLuNuMxR0I4XYMSbXaXDn7hVP0t3N/QpOHmcz5kZ/S9gjjIdQMfXk79js/rJiyKGhlkpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcqAGf0K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcqAGf0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700AFC4CEE8;
	Thu,  3 Apr 2025 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707122;
	bh=KxBI2fyMN9/UXpw0fCbVj4HPgL+ZuvPpKn7rcgm7QE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcqAGf0K4VKBqlEZVz0Dl+9SNC55s21Mch/C3R/f0CNyvPhwFM2NqvIhI45X0VJnr
	 djLLUthEeSkjAQO4M1U/B+umNGQLXZ6SdzWVMp+kbbQoBk2hRQiECtPvzEr1yzCEqO
	 L0EHMHCCTRg2izuAzX7qfDcdmxyYApgAgUS97hv7x09S4n04anNQ1F8YDayfFeJKGi
	 0TYM3H2J5k5oau5xhyS1xDm/zX67eqpDmLYSLZwzTszsdlD66Wol6tN85tJn9IiGpb
	 KWtCpwc6+unV05FacJfyaT9grFeFw07+zcpETx+c0LNhX/TK0meBHk0K/Bzj7U085K
	 CqsEZpbsiigkw==
Date: Thu, 3 Apr 2025 12:05:18 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <kykaol3hdxxvpwa7drnlidgeqb5cgkrdpo7bokifihob73hwyx@cu6sfkz3z6ze>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
 <2970eb7e-030d-4257-ad2f-64e378037dd8@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2970eb7e-030d-4257-ad2f-64e378037dd8@citrix.com>

On Thu, Apr 03, 2025 at 07:57:42PM +0100, Andrew Cooper wrote:
> On 03/04/2025 7:48 pm, Josh Poimboeuf wrote:
> > With SYSCALL and SYSENTER, INSN_CONTEXT_SWITCH now has a sane
> > well-defined return semantic.
> 
> Do you mean "without" here?

I was just testing to see if anybody actually read all the way to the
bottom.  Congratulations, you passed the test!

> > diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
> > index 33d861c04ebd..628c2c8a0f6a 100644
> > --- a/tools/objtool/arch/x86/decode.c
> > +++ b/tools/objtool/arch/x86/decode.c
> > @@ -535,10 +535,9 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
> >  
> >  			insn->type = INSN_JUMP_CONDITIONAL;
> >  
> > -		} else if (op2 == 0x05 || op2 == 0x07 || op2 == 0x34 ||
> > -			   op2 == 0x35) {
> > +		} else if (op2 == 0x07) {
> >  
> > -			/* sysenter, sysret */
> > +			/* sysret */
> >  			insn->type = INSN_CONTEXT_SWITCH;
> 
> Linux doesn't use SYSEXIT, but it's conceptually like SYSRET/ERETx so
> perhaps worth keeping the 0x35 here?

In theory yes, but objtool will never support x86-32.  Note I also
removed retf and jmpf, I'm thinking it's simpler to just stick to the
instructions we actually use.

-- 
Josh
