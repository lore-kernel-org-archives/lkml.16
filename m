Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC31754B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750381868; cv=none; b=Mk/2SPMj5opcIt28YpSLyxXfj26qVey6nmmJGG62RAct9UPzJZ6BIidXiYD8glV+is8gHsvdGIhCyGcyluRU7Tw2BR36aEnmIFPJt2cI+rq7J4w1XcKQJfCQ0KHt54mCY9H8DzG9Vg8ED/kV3hbc+c8ZKcJLH4/G+FekdWePLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750381868; c=relaxed/simple;
	bh=4M6BxHlO54reHk0FZCn3FNxlXmjiIM3p4c6KKZd4aSo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WxBP/y1jFnLoBrzoRzTktOpxji2pbt73NpyIgzVOrFyV2Brl0vLXROaGA1vsbuD8QXTvpx5JsQcRoiHCnAEJ+Jo7fI9gAP5HbCdo3AfizkGXQwXFkMut/oN4NPp2+0Tfv3LJNoF3AC+EmKkue016m6O3PFvXcHzz384q/1ndLWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=cgC4IJ04; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="cgC4IJ04"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TTBj/lcxgMyBvpuopn6/1vO2byoJ3KWGXa+WfQGjt+Q=; b=cgC4IJ04LZSjuNTZMQ57geyD/n
	g8nKZ1Of0uh73GsMPknRKEVfwCR6naz5W8ct42ZLGS9uDgVTl9nB2UQkJR4egm6YYTolc/oPVXCes
	6yecPWbCpctkUSk2iPSZtJV4i+JwiX4W7tmFi/mAh8g82xigrci5x5WRHZPRCWbDikL0khO3KRDwA
	uDW9fDVx1lwZkuMHLwWTyoESSrg1lREB6PrvN0D/8tdkuoxWHaB6TEUJvwo7bG0kQmCcp4oshP6Bf
	UGRu7uJ/YydllXPvU/+QCRJIo7/FtwjGjJWbyg/4gPSd/Ei/zeGjrdCKBJCXMqYUBlPvL1njmt/Ea
	TJ2mRW6g==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uSQHH-000000002UI-0XSI;
	Thu, 19 Jun 2025 21:10:47 -0400
Message-ID: <49eee1cb79b75b02b8ed19a7f6d39e1ee8fae171.camel@surriel.com>
Subject: Re: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
From: Rik van Riel <riel@surriel.com>
To: Nadav Amit <nadav.amit@gmail.com>, linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, bp@alien8.de, x86@kernel.org, seanjc@google.com, 
	tglx@linutronix.de, mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
Date: Thu, 19 Jun 2025 21:10:47 -0400
In-Reply-To: <6f9d7c86-9faf-48a0-b7b9-d58bb21ce948@gmail.com>
References: <20250619200442.1694583-1-riel@surriel.com>
	 <20250619200442.1694583-6-riel@surriel.com>
	 <6f9d7c86-9faf-48a0-b7b9-d58bb21ce948@gmail.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-20 at 02:01 +0300, Nadav Amit wrote:
>=20
> > +/*
> > + * Reduce contention for the RAR payloads by having a small number
> > of
> > + * CPUs share a RAR payload entry, instead of a free for all with
> > all CPUs.
> > + */
> > +struct rar_lock {
> > +	union {
> > +		raw_spinlock_t lock;
> > +		char __padding[SMP_CACHE_BYTES];
> > +	};
> > +};
>=20
> I think you can lose the __padding and instead have=20
> ____cacheline_aligned (and then you won't need union).
>=20
I tried that initially, but the compiler was unhappy
to have __cacheline_aligned in the definition of a
struct.

> > +
> > +static struct rar_lock rar_locks[RAR_MAX_PAYLOADS]
> > __cacheline_aligned;
> > +
> > +/*
> > + * The action vector tells each CPU which payload table entries
> > + * have work for that CPU.
> > + */
> > +static DEFINE_PER_CPU_ALIGNED(u8[RAR_MAX_PAYLOADS], rar_action);
> > +
> > +/*
> > + * TODO: group CPUs together based on locality in the system
> > instead
> > + * of CPU number, to further reduce the cost of contention.
> > + */
> > +static int cpu_rar_payload_number(void)
> > +{
> > +	int cpu =3D raw_smp_processor_id();
>=20
> Why raw_* ?

I'll change that to regular smp_processor_id()
for the next version.

>=20
> > +	return cpu % rar_max_payloads;
> > +}
> > +
> > +static int get_payload_slot(void)
> > +{
> > +	int payload_nr =3D cpu_rar_payload_number();
> > +	raw_spin_lock(&rar_locks[payload_nr].lock);
> > +	return payload_nr;
> > +}
>=20
> I think it would be better to open-code it to improve readability. If
> you choose not to, I think you should use sparse indications (e.g.,=20
> __acquires() ).

Good point about the annotations. This can indeed
be open coded, since any future improvements here,
for example to have cpu_rar_payload_number() take
topology into account to reduce the cost of contention,
will be in that helper function.

>=20
> > +
> > +static void free_payload_slot(unsigned long payload_nr)
> > +{
> > +	raw_spin_unlock(&rar_locks[payload_nr].lock);
> > +}
> > +
> > +static void set_payload(struct rar_payload *p, u16 pcid, unsigned
> > long start,
> > +			long pages)
> > +{
> > +	p->must_be_zero_1	=3D 0;
> > +	p->must_be_zero_2	=3D 0;
> > +	p->must_be_zero_3	=3D 0;
> > +	p->page_size		=3D RAR_INVLPG_PAGE_SIZE_4K;
>=20
> I think you can propagate the stride to this point instead of using=20
> fixed 4KB stride.

Agreed. That's another future optimization, for
once this code all works right.

Currently I am in a situation where the receiving
CPU clears the action vector from RAR_PENDING to
RAR_SUCCESS, but the TLB does not appear to always
be correctly flushed.

>=20
> > +	p->type			=3D RAR_TYPE_INVPCID;
> > +	p->pcid			=3D pcid;
> > +	p->linear_address	=3D start;
> > +
> > +	if (pcid) {
> > +		/* RAR invalidation of the mapping of a specific
> > process. */
> > +		if (pages < RAR_INVLPG_MAX_PAGES) {
> > +			p->num_pages =3D pages;
> > +			p->subtype =3D RAR_INVPCID_ADDR;
> > +		} else {
> > +			p->subtype =3D RAR_INVPCID_PCID;
>=20
> I wonder whether it would be safer to set something to p->num_pages.
> (then we can do it unconditionally)

We have a limited number of bits available for
p->num_pages. I'm not sure we want to try
writing a larger number than what fits in those
bits.

>=20
> > +		}
> > +	} else {
> > +		/*
> > +		 * Unfortunately RAR_INVPCID_ADDR excludes global
> > translations.
> > +		 * Always do a full flush for kernel
> > invalidations.
> > +		 */
> > +		p->subtype =3D RAR_INVPCID_ALL;
> > +	}
> > +
> > +	/* Ensure all writes are visible before the action entry
> > is set. */
> > +	smp_wmb();
>=20
> Maybe you can drop the smp_wmb() here and instead change the=20
> WRITE_ONCE() in set_action_entry() to smp_store_release() ? It should
> have the same effect and I think would be cleaner and convey your
> intent=20
> better.
>=20
We need protection against two different things here.

1) Receiving CPUs must see all the writes done by
   the originating CPU before we send the RAR IPI.

2) Receiving CPUs must see all the writes done by
   set_payload() before the write done by
   set_action_entry(), in case another CPU sends
   the RAR IPI before we do.

   That other RAR IPI could even be sent between
   when we write the payload, and when we write
   the action entry. The receiving CPU could take
   long enough processing other RAR payloads that
   it can see our action entry after we write it.

Does removing the smp_wmb() still leave everything
safe in that scenario?


> > +}
> > +
> > +static void set_action_entry(unsigned long payload_nr, int
> > target_cpu)
> > +{
> > +	u8 *bitmap =3D per_cpu(rar_action, target_cpu);
>=20
> bitmap? It doesn't look like one...

I'll rename this one to rar_actions like I did in
wait_for_action_done()

>=20
> > +static void wait_for_action_done(unsigned long payload_nr, int
> > target_cpu)
> > +{
> > +	u8 status;
> > +	u8 *rar_actions =3D per_cpu(rar_action, target_cpu);
> > +
> > +	status =3D READ_ONCE(rar_actions[payload_nr]);
> > +
> > +	while (status =3D=3D RAR_PENDING) {
> > +		cpu_relax();
> > +		status =3D READ_ONCE(rar_actions[payload_nr]);
> > +	}
> > +
> > +	WARN_ON_ONCE(rar_actions[payload_nr] !=3D RAR_SUCCESS);
>=20
> WARN_ON_ONCE(status !=3D RAR_SUCCESS)

I'll add that cleanup for v5, too.

>=20
> > +}
> > +
> > +void rar_cpu_init(void)
> > +{
> > +	u8 *bitmap;
> > +	u64 r;
> > +
> > +	/* Check if this CPU was already initialized. */
> > +	rdmsrl(MSR_IA32_RAR_PAYLOAD_BASE, r);
> > +	if (r =3D=3D (u64)virt_to_phys(rar_payload))
> > +		return;
>=20
> Seems a bit risky test. If anything, I would check that the MSR that
> is=20
> supposed to be set *last* (MSR_IA32_RAR_CTRL) have the expected
> value.=20
> But it would still be best to initialize the MSRs unconditionally or
> to=20
> avoid repeated initialization using a different scheme.
>=20
Whatever different scheme we use must be able to deal
with CPU hotplug and suspend/resume. There are legitimate
cases where rar_cpu_init() is called, and the in-MSR
state does not match the in-memory state.

You are right that we could always unconditionally
write the MSRs.

However, I am not entirely convinced that overwriting
the per-CPU rar_action array with all zeroes (RAR_SUCCESS)
is always safe to do without some sort of guard.

I suppose it might be, since if we are in rar_cpu_init()
current->mm should be init_mm, the CPU bit in cpu_online_mask
is not set, and we don't have to worry about flushing memory=C2=A0
all that much?

> >=20
> > +	/* If this CPU supports less than RAR_MAX_PAYLOADS, lower
> > our limit. */
> > +	if (max_payloads < rar_max_payloads)
> > +		rar_max_payloads =3D max_payloads;
> > +	pr_info("RAR: support %d payloads\n", max_payloads);
> > +
> > +	for (r =3D 0; r < rar_max_payloads; r++)
> > +		rar_locks[r].lock =3D
> > __RAW_SPIN_LOCK_UNLOCKED(rar_lock);
>=20
> Not a fan of the reuse of r for different purposes.

Fair enough, I'll add another variable name.

>=20
> > +/*
> > + * Inspired by smp_call_function_many(), but RAR requires a global
> > payload
> > + * table rather than per-CPU payloads in the CSD table, because
> > the action
> > + * handler is microcode rather than software.
> > + */
> > +void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long start, unsigned l=
ong end)
> > +{
> > +	unsigned long pages =3D (end - start + PAGE_SIZE) /
> > PAGE_SIZE;
>=20
> I think "end" is not inclusive. See for instance flush_tlb_page()
> where=20
> "end" is set to "a + PAGE_SIZE". So this would flush one extra page.
>=20
It gets better. Once we add in a "stride" argument, we
may end up with a range that covers only the first
4kB of one of the 2MB entries the calling code wanted
to invalidate. I fell into that trap already with the
INVLPGB code :)

I'll look into simplifying this for the next version,
probably with only 4k PAGE_SIZE at first. We can think
about stride later.

> >=20
> > +	 * This code cannot use the should_flush_tlb() logic here
> > because
> > +	 * RAR flushes do not update the tlb_gen, resulting in
> > unnecessary
> > +	 * flushes at context switch time.
> > +	 */
> > +	dest_mask =3D this_cpu_ptr(&rar_cpu_mask);
> > +	cpumask_and(dest_mask, mask, cpu_online_mask);
> > +
> > +	/* Some callers race with other CPUs changing the passed
> > mask */
> > +	if (unlikely(!cpumask_weight(dest_mask)))
>=20
> cpumask_and() returns "false if *@dstp is empty, else returns true".
> So=20
> you can use his value instead of calling cpumask_weight().

Will do, thank you.



--=20
All Rights Reversed.
