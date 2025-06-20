Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9473B25F7AE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415478; cv=none; b=GDSvhQy/e5y8z1BzWanNFkEKzfB0I9yVJIIWRLZ0jj99/MmbohPkJsjWTA0hdHepPsQpGUNnQPRY9ijNRV7ZwAPWVVz5I7kl8jrk8RZ7MwuIu8r/oMixH9UbMHquty6L7y/nk9TrkXCjYMEnzhQJJja8E599qepMN0/UPLhXOUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415478; c=relaxed/simple;
	bh=c6IDS8T9wHW8s7QkDM4UrKxOliUno9y9BDqIPf7LWdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fABX641ioL9ihoHOJmqVtRk0Ron+X29Hu4iANuRzGYi1vgEUTqZ9wcO2tjFGSSmQKARstLv4vj2Kom5v4+I6wzW0z4soAK+2VtOxObQUL6+9+nhhqtQd/Rg+QJ6BlsBlE1ckR3UFAUV7/fHJ2bW05DUiR28Q0imG0HxZnnH84Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0S+Cef7L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i89kE8Az; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0S+Cef7L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i89kE8Az"
Date: Fri, 20 Jun 2025 12:31:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750415471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Sg9GHCRtO1sQUXysbcDzzLew2ed7aT71YjB8Gf6mqs=;
	b=0S+Cef7LEhicLOEn9qty7sqRds7ZTDpj0TpQFp+5nUx+XzU3QV0bfOW2vwQg6oRvHdQaXy
	OTDCFL8KUchCfEBAylvXk34SpYHaudZIUdtpZdrxNoRRoY7DzWcMlw46FHSPZbu5is3LNG
	rdJ+zHkDF40rwrUF+Ucx48ReAha0SzR0v/YWjCfAYLszNYw7WkAiYh7Ty8J0Wb/X2OSgmZ
	O1TDBqaoJTC4L2zqHDw3pHPQL1Qte9U9FzLlkfkR1ZNGnLKmH6DQUeJsl+nAJFqkGVbuCW
	vWbzSYp/z4G5NncwG2Juchd4cmfI0eL8MaGyfrVpCIbpOQD2uFQNU3aJD9oQWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750415471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Sg9GHCRtO1sQUXysbcDzzLew2ed7aT71YjB8Gf6mqs=;
	b=i89kE8AzW4ItP0s4BfzzHB9pqCgbw1Hdm3+Qiow/TyN+OniVUua3jYR55sEV494xEEbk7s
	jN41NrjnW9BRYrAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <20250620103110.xd5CEFDs@linutronix.de>
References: <20250617071628.lXtqjG7C@linutronix.de>
 <aFEz_Fzr-_-nGAHV@mozart.vkv.me>
 <20250617095037.sOnrJlPX@linutronix.de>
 <aFGTmn_CFkuTbP4i@mozart.vkv.me>
 <20250618160333.PdGB89yt@linutronix.de>
 <aFLuDoX9BGBUC3tW@mozart.vkv.me>
 <20250618170924.Z34OXf1E@linutronix.de>
 <aFMoDcWy-OzE3yoV@mozart.vkv.me>
 <aFNCHS-5LLywIAC7@mozart.vkv.me>
 <aFR8EuMg82aMCvjo@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aFR8EuMg82aMCvjo@mozart.vkv.me>

On 2025-06-19 14:07:30 [-0700], Calvin Owens wrote:
> > Machine #2 oopsed with the GCC kernel after just over an hour:
> >=20
> >     BUG: unable to handle page fault for address: ffff88a91eac4458
> >     RIP: 0010:futex_hash+0x16/0x90
=E2=80=A6
> >     Call Trace:
> >      <TASK>
> >      futex_wait_setup+0x51/0x1b0
=E2=80=A6

The futex_hash_bucket pointer has an invalid ->priv pointer.
This could be use-after-free or double-free. I've been looking through
your config and you don't have CONFIG_SLAB_FREELIST_* set. I don't
remember which one but one of the two has a "primitiv" double free
detection.=20

=E2=80=A6
> I am not able to reproduce the oops at all with these options:
>=20
>     * DEBUG_PAGEALLOC_ENABLE_DEFAULT
>     * SLUB_DEBUG_ON

SLUB_DEBUG_ON is something that would "reliably" notice double free.
If you drop SLUB_DEBUG_ON (but keep SLUB_DEBUG) then you can boot with
slab_debug=3Df keeping only the consistency checks. The "poison" checks
would be excluded for instance. That allocation is kvzalloc() but it
should be small on your machine to avoid vmalloc() and use only
kmalloc().

> I'm also experimenting with stress-ng as a reproducer, no luck so far.

Not sure what you are using there. I think cargo does:
- lock/ unlock in a threads
- create new thread which triggers auto-resize
- auto-resize gets delayed due to lock/ unlock in other threads (the
  reference is held)

And now something happens leading to what we see.
_Maybe_ the cargo application terminates/ execs before the new struct is
assigned in an unexpected way.
The regular hash bucket has reference counting so it should raise
warnings if it goes wrong. I haven't seen those.

> A third machine with an older Skylake CPU died overnight, but nothing
> was logged over netconsole. Luckily it actually has a serial header on
> the motherboard, so that's wired up and it's running again, maybe it
> dies in a different way that might be a better clue...

So far I *think* that cargo does something that I don't expect and this
leads to a memory double-free. The SLUB_DEBUG_ON hopefully delays the
process long enough that the double free does not trigger.

I think I'm going to look for a random rust packet that is using cargo
for building (unless you have a recommendation) and look what it is
doing. It was always cargo after all. Maybe this brings some light.
=20
> > > Thanks,
> > > Calvin

Sebastian
