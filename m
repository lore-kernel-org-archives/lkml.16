Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4550276
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747851132; cv=none; b=p1R7cjAxAWT4dPaJNz8K3CmULBlZW6UE1a/G6I8Fry9T+l3690z/Q87XJyWr8+ni2oqAkGENkTz8rzwAPFGh+e+7L0lCYy+eoSnd2QyGwbhP37RP4cE/WjirsDiTD3Rb+ZgYZ3U0VXe1DInzBf6xPas1wYmvUKvPMVIC/0FGu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747851132; c=relaxed/simple;
	bh=1/rlbmpip3OHtDCRMmmzJuRrkXmYRrgxBxQTEFo2rDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ba4TYww8lh5/2O7PAzqrhR+iEdWZXWXo8KbOEZKCb5hDA27Xm4fjqyZaXIYYexCuToQJ1A+0dMlafwx4FBUD33XqozscqzcTZbwPWYNsml3eurzG4fnVq96klv7pK/RlreCZbivW/8qeu05R84t739Ka0bgaQ7MoLIWwXzG7KHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Wk8vhHO5; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Wk8vhHO5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C925440E0163;
	Wed, 21 May 2025 18:12:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CfNDd266iFzs; Wed, 21 May 2025 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747851122; bh=ITlsTaQvJ6NxKw2uAp2SyP2tQEwhuzpdqgKr5uxyeoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wk8vhHO5LJg+RvgBQjXrJ3RmKlXr+5HQm2Htdn7AkPjE7j4CepvQ0XSX/lg7+j8/y
	 2g+bho+pJZ3Mr8hVtVvauOBLhnkEJc7lZGB+VDeqFyd+QhQiYIAG1xzs5gQS4OaMyt
	 PE0xbks0JH4r2DkPvyHeDIaWak9uF6ue7VmQaYkrg53eIzQvXRK95a711auEK23nJo
	 zvz3nYuHxQlibD6fcQ/2tnW3XPLDW9kTWFgNzMQF9aQRoCh0ERwk/aYkI3/ikDPwAX
	 bluv+UHp+G3rqqqEVm2XaSOwaTSgtDGM2FseUqLcmo0U//3IkpSZJCziD/Y2fR3CY9
	 SJdpv49rIQJ7AU8sFfdvkEiERAJY1b5ro9L8KT7tf2lm+JMLvKE8drvYjZAAA3hkVa
	 jV4ppegmw0LYuobbwBW0an0Db0qQkryUgO3muHBkdnPin+i/ZRBFTBykqZ/PA2rAo5
	 Dq3XzHYiXJ/oNUDCBpuYI4Bai0GqYdE9TAvOAFnTySH7mW7Bl8n/4jNvA2dJ1KX6xN
	 rJumigQ94o+IK1djbrz5wvauE5t0T8my31OpXK7SOe5mOfaNvbHltDzHpFwxkuX4yS
	 dnVvWj5xQihGMeOF2lyBVXUlRu9NFRXZ23Qyty0Ek2cs4SZImhjEqdRiJSIPqNYLeQ
	 BEmuu969EAWFOuhBblHc5RE0=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1BD5640E0192;
	Wed, 21 May 2025 18:11:52 +0000 (UTC)
Date: Wed, 21 May 2025 20:11:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250521181141.GDaC4XXW8BmtvJFy6a@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local>
 <874ixernra.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874ixernra.ffs@tglx>

On Wed, May 21, 2025 at 05:23:37PM +0200, Thomas Gleixner wrote:
> Now what about software defined (artificial) feature bits including BUG
> bits?
> 
> We still need them and there is no reason why we would replace them with
> something else. But, what we want to do here, is basically the same as
> we do for the real CPUID information:
> 
>    Create and document real artifical leafs (there is enough reserved
>    number space in the CPUID numbering scheme) and put those into the
>    CPUID database as well.

I presume here, when the kernel patch is being sent, the accompanying CPUID db
patch needs to go out too?

>    That allows to handle this stuff in the same way as any other CPUID
>    data and the autogeneration of bit offsets and text information for
>    cpuinfo just works the same way.
> 
> Coming back to the original question with the example of LA57 and the
> actual enablement. There is no reason why we can't have the actual CPUID
> bit and a software defined bit.
> 
> The way how this should work is:
> 
>     1) The CPUID info is in data.leaf_07.la57
> 
>     2) The enablement bit is in data.leaf_linux_N.la57 or such
> 
> The CPUID database contains the entries for those in leaf_07:
> 
>       <bit16 len="1"  id="la57"                    desc="57-bit linear addresses (five-level paging)">
>         <vendors>
>           <vendor>Intel</vendor>
>           <vendor>AMD</vendor>
>         </vendors>
>         <linux        feature="true"               proc="false" />
>       </bit16>
> 
> and leaf_linux_N:
> 
>       <bit3 len="1"  id="la57"                     desc="57-bit linear addresses (five-level paging)">
>         <vendors>
>           <vendor>Linux</vendor>
>         </vendors>
>         <linux        feature="true"               proc="true" />
>       </bit3>
> 
> As the "proc" property of leaf_07.la57 is false, the bit won't be
> exposed in cpuinfo, but the software defined bit will.
> 
> This also means, that we switch to a model where the software defined
> bits are not longer subject to random introduction and removal. We
> simply keep them around, mark them as not longer used and introduce new
> ones with proper documentation. That requires due process, which
> prevents the adhoc messing around with feature bits, which has us bitten
> more than once in the past.

Right, so in this particular example with la57, the CPUID bit which denotes
that the hw is capable of doing 5-level paging is needed only during kernel
init so that we can know whether we should even try to setup 5-level paging.

After that, the rest of the kernel will need to look only at "our" bit which
means, 5-level is *enabled*.

Because that's what the code cares for - whether it is running on 5-level or
not.

And 5-level *enabled* implies 5-level possible. So that first bit is kinda
redundant and perhaps even confusing. That's why I think merging the two bits
simplifies things.

You're already basically doing that with proc="false" but it should be even
less visible. No one besides us cares if the hw is capable - users care if the
feature is enabled or not.

I'd say...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
