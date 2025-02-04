Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CD6201027
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687481; cv=none; b=reKzMMBA8Zo8a7cV2XSgITmKNbMSKN6QoliT4ZlT65t/Jfi8R0hNg2o888XSVw3sSn3SBEquI2Xu3I1BisOeaHQ6j0op/lTS5gwaTELu14m2qu+IklKt6fhsnJUa2mixFJBrQXuLkv90IZw267ufcGiN0OrkwLO4ccMG1/r8JvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687481; c=relaxed/simple;
	bh=KgmbZcJYyVdTVK8iJXi4qpAutM2yZCwygr8P1xxL4kU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oLxHWddQAgcKwdgQIKzfDDABH8xrxlElsF9im7Avhkug613YEzftMfiN4ZIGXbihwGwn5hX2ec2I1w7TsJTrDIHvvpzKSjwDxBT0ZoKSWyaAs3t0m+Y3zrshW6RcXSrN1BFKz/lDhKx8MqGMVc8MQhqTbjSTLBVksMgJyOumiBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E851D92009C; Tue,  4 Feb 2025 17:44:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E289092009B;
	Tue,  4 Feb 2025 16:44:36 +0000 (GMT)
Date: Tue, 4 Feb 2025 16:44:36 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jessica Clarke <jrtc27@jrtc27.com>
cc: Andreas Schwab <schwab@suse.de>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
In-Reply-To: <0DF64D04-D609-4790-8279-7DFE24D1FB2C@jrtc27.com>
Message-ID: <alpine.DEB.2.21.2502041508520.41663@angie.orcam.me.uk>
References: <mvmed0k4prh.fsf@suse.de> <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de> <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> <mvmwmec2t7u.fsf@suse.de> <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
 <alpine.DEB.2.21.2502030510390.41663@angie.orcam.me.uk> <0DF64D04-D609-4790-8279-7DFE24D1FB2C@jrtc27.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 3 Feb 2025, Jessica Clarke wrote:

> > Umm, that would be a compiler bug then, as inlining is supposed not to 
> > change language semantics.  IOW the compiler is expected to explicitly 
> > sign-extend the arguments of an inlined function at their evaluation point 
> > just as it would at an actual function call unless the compiler is able to 
> > prove they have come out sign-extended already from previous operations.
> 
> No it’s not. The calling convention is there so that each side of the
> call know how the data is being passed between them. When inlining
> occurs there is no such call and compilers can do whatever they like.

 Right, I guess I got influenced too much by my MIPS experience here.

 The contract here is to pass a 32-bit integer as an argument through a 
function call boundary and with the RISC-V ISA saying the upper 32-bits of 
an input hardware register are don't-cares for 32-bit integer operations 
this contract is still met if inlining discards the sign-extension madated 
by the psABI.  And consequently a piece of inline assembly cannot expect 
an incoming 32-bit integer in a register to be correctly interpreted as a 
64-bit integer of equal value instead.

 Although I find it odd in these circumstances that the psABI mandates 
sign-extension here.  And honestly I think an explicit cast ought to be 
added to the relevant assembly input operands (or a temporary variable of 
the appropriate type added and used to convert between the incoming value 
and the input operands); it will be a no-op for an optimising compiler 
when it knows the value has been sign-extended already and will carry the 
semantics information for a human code reader even if sign-extension has 
been implicitly ensured by the psABI despite the data type itself not 
making it evident.

 Thanks for correcting me overall.

  Maciej
