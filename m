Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80632FC3C6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476358; cv=none; b=eu/JbXQIqkdH/Z71QbmVChpEARuMM/C40jMfAJeR3MjMwa6CK2EL6tuiSZrhzoFdGFc/1EiiBG6LJTw6bvK8ROoeG/wh4XYU6kxH7HYghtB3AzQO6xlNGOtc7RoYSkwukgXdloxPYbO8GGmiWNBVmxWIiAsH6RkIGyEEuZUNeLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476358; c=relaxed/simple;
	bh=uyk3nNKvwr6Kc6AS1ACdSIzjcmwLNF4UD3MrXExKwks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LxxZAVV9WLFhS2lQF5O3P2y7Tred8kuOJM54hYG8vI0JjGAIz1dOBD50A8FHb8zDybDgu0G3idIc1Rb7PHBxqIRHr1w5F4J0aEt+0TcWegEGRN1ZdoBwpE/x87cv0XImmdSPmD3oDlxlq1ZalSSe1pTyN93szeBF7V/3ZJciAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kLBfRa/z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+gj9VmfH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kLBfRa/z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+gj9VmfH"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751476354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qr+Jt0jvNc2rmYdxHT0LMmYAe3eQkw9Ib9EVKQj4Tw=;
	b=kLBfRa/zRi4pMTlPJ5PLzp0kmUsGmZrBHs+DL34PODPHelMUPdz7jx/vnfjRCsY2Hlisxq
	yJWFyFtAnlwn542P0dw5QExJVfeftTUGiFoGArsGXdSnbEDffz4qtUgajNWsMW+EUS2+6D
	xJSrxzSPvKrPOAmGhTnZnlCnDaC/8J6IxB44bHFYAUhXdCa4hGlYSAL2nSQdx6Yd7hfomy
	heXAvgCKWg8+2066GiPAKJJd+lWB4yG3c4AmObXL4VdAovf9e6sXnKlvvwQ4W/Y8F2QA61
	OFgI8eGLwBuy2+HxB+nPepWnoRMWLwmJe+F0VpEX2/MA1rF8AN6j8ODnYqr5jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751476354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qr+Jt0jvNc2rmYdxHT0LMmYAe3eQkw9Ib9EVKQj4Tw=;
	b=+gj9VmfHST1g9wivbS6hRm9JVlGlpCj1rGcTQqAMejDQAU86UR+mLURSc+9hvVg3XyGU+X
	psbQP3HgwvJLvhBw==
To: Jann Horn <jannh@google.com>, Rik van Riel <riel@surriel.com>,
 yury.norov@gmail.com
Cc: syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
 neeraj.upadhyay@kernel.org, paulmck@kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com, x86@kernel.org, kernel-team
 <kernel-team@meta.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in
 flush_tlb_func
In-Reply-To: <CAG48ez1VMw=aE88eTfk9BscrmS7axJG=j_TrTui+htLF9-4Wqw@mail.gmail.com>
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
 <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
 <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
 <CAG48ez1VMw=aE88eTfk9BscrmS7axJG=j_TrTui+htLF9-4Wqw@mail.gmail.com>
Date: Wed, 02 Jul 2025 19:12:31 +0200
Message-ID: <874ivuldog.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02 2025 at 19:00, Jann Horn wrote:
> On Wed, Jul 2, 2025 at 6:53=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>> TLB flushes via IPIs on x86 are always synchronous, right?
>> flush_tlb_func is only referenced from native_flush_tlb_multi() in
>> calls to on_each_cpu_mask() (with wait=3Dtrue) or
>> on_each_cpu_cond_mask() (with wait=3D1).
>> So I think this is not an issue, unless you're claiming that we call
>> native_flush_tlb_multi() with an already-freed info->mm?
>>
>> And I think the bisected commit really is the buggy one: It looks at
>> "nr_cpus", which tracks *how many CPUs we have to IPI*, but assumes
>> that "nr_cpus" tracks *how many CPUs we posted work to*. Those numbers
>> are not the same: If we post work to a CPU that already had IPI work
>> pending, we just add a list entry without sending another IPI.
>
> Or in other words: After that blamed commit, if CPU 1 posts a TLB
> flush to CPU 3, and then CPU 2 also quickly posts a TLB flush to CPU
> 3, then CPU 2 will erroneously not wait for the TLB flush to complete
> before reporting flush completion, which AFAICS means we can get both
> stale TLB entries and (less often) UAF.

Right you are. Well analyzed and I missed it when taking the lot.

> I think the correct version of that commit would be to revert that
> commit and instead just move the "run_remote =3D true;" line down, below
> the cond_func() check.

I remove it from the relevant tip branch

Thanks,

        tglx

