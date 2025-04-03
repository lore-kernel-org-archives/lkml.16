Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E53264625
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708057; cv=none; b=iqCEwT2Iqmj7OSa3S0rpdHviao6SkNqWdbD+X7lzWRFy/+JNWllLJKNPYleADvk3X1olSxAgKwFjuiFbONgG70GOZpl2T1IWsJl/bfDhBEyzBKmpDtDhzorDpbRW3z5a19GVM9zhR3OUuffQj3ussuOrdMRZKnYXXgWYG3dbOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708057; c=relaxed/simple;
	bh=UC/GN0D/E29X9OOv8Kp+2fmfvZyuyT4yu/kljwZRebo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEB/oHFi/ZfqDKRLvey7NkSKCqYWIWm6FkwyLgWjYvzERmi0BbMfsy5adTUmzHGAt/TkamapVYNzYWGFzscmRekXzY2jAM5XVQN6JsqNHUO/uHKcQBX0lSVEd8daBHq//WTY4EBDx2AR75ebB+HxzB2B6lD+Ef1zf/MdufwFF+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jp5Uv84A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jp5Uv84A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81C6C4CEE9;
	Thu,  3 Apr 2025 19:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743708057;
	bh=UC/GN0D/E29X9OOv8Kp+2fmfvZyuyT4yu/kljwZRebo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jp5Uv84Az9x4Q2LeIB0e89xVVcTqF17OvO8XlHXjm5kwAljD7q2OoRf9Ru0avnwdk
	 wzLfmCej6opNufmXKNgWIM52NdAp1cP1seb6/Yd+slicmlbPYYnV5VUL5Llik66tKo
	 kphIgjDbTU/89XV0SX6RyO2+2AhRE0MEcA6k6Lm7UYG5sejS8yFDn1JNHh7oBAdjrX
	 0nYjuSWw42Ma2JlB0/mkqTKpRIQoezhuxqn/pGyh1rEc4yX6FzrLbomuN5GVfeUyJ7
	 BYxjiifc827j16uarRMfQosba9cVC4TRxs0V1TgLWky7T1aEymkfLhH36l1qpA9WIi
	 U1pYg7e+oJWWA==
Date: Thu, 3 Apr 2025 12:20:54 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <rkxzcgnwmgvzycz2pndq7s6mwo6frocdpxwyangsamb7cjf2k2@ec67snehrq5f>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
 <2970eb7e-030d-4257-ad2f-64e378037dd8@citrix.com>
 <kykaol3hdxxvpwa7drnlidgeqb5cgkrdpo7bokifihob73hwyx@cu6sfkz3z6ze>
 <ea4473f7-fb94-4fdc-ad4b-9d9f1f4be5de@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea4473f7-fb94-4fdc-ad4b-9d9f1f4be5de@citrix.com>

On Thu, Apr 03, 2025 at 08:15:45PM +0100, Andrew Cooper wrote:
> On 03/04/2025 8:05 pm, Josh Poimboeuf wrote:
> > On Thu, Apr 03, 2025 at 07:57:42PM +0100, Andrew Cooper wrote:
> >> On 03/04/2025 7:48 pm, Josh Poimboeuf wrote:
> >>> diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
> >>> index 33d861c04ebd..628c2c8a0f6a 100644
> >>> --- a/tools/objtool/arch/x86/decode.c
> >>> +++ b/tools/objtool/arch/x86/decode.c
> >>> @@ -535,10 +535,9 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
> >>>  
> >>>  			insn->type = INSN_JUMP_CONDITIONAL;
> >>>  
> >>> -		} else if (op2 == 0x05 || op2 == 0x07 || op2 == 0x34 ||
> >>> -			   op2 == 0x35) {
> >>> +		} else if (op2 == 0x07) {
> >>>  
> >>> -			/* sysenter, sysret */
> >>> +			/* sysret */
> >>>  			insn->type = INSN_CONTEXT_SWITCH;
> >> Linux doesn't use SYSEXIT, but it's conceptually like SYSRET/ERETx so
> >> perhaps worth keeping the 0x35 here?
> > In theory yes, but objtool will never support x86-32.  Note I also
> > removed retf and jmpf, I'm thinking it's simpler to just stick to the
> > instructions we actually use.
> >
> 
> Perhaps, but they'll now become INSN_OTHER, won't they?
> 
> If they're instructions genuinely expected never to encounter, wouldn't
> it be better to make a hard error rather than to add another fallthrough
> case?

Fair enough.  Maybe I'll just leave them as INSN_CONTEXT_SWITCH, that'd
be easier than adding new assertions.

-- 
Josh
