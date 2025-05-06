Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E78220F21
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746514809; cv=none; b=IkBqUs/PdMaR7CgdC2UJDD+jsWiciVM6P+piRJWzaORuE/1bU16J/804n+YQOeHIkkmP250loTqhL2E2My159W6Y6DJhwLbrf2e56RHjr/UaF4hylUk/TLoCvJmIEuFwIaRCzALXPEgPI6ns5g6FabF70UM7LoiCtPJRdE+gU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746514809; c=relaxed/simple;
	bh=OFgxPlEhhKGCY4dYltqlS4NBugA5xB5ZUikaklsK/m8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nxiTWMCvv+sNZnb2i+ZglMU2R+J6LR7lK7kRGSN/LxIPj2fSgv7BLZj1aIeHVfGO0L9L0gEcUmUnX6hEvPxo/ziYnhROmFh7XzS4XiPqlfLE5JZSCJtky8Ov8Dqz9VKIMj5CBbT9VC1RXqqw+ICd10gC2z6Lr7lUpP/BCMb9Cog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/8giLYK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/8giLYK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso22757665e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 00:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746514806; x=1747119606; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8W/zK0wbFRaqQMcIxNlkME3S0vuzKvpSCW5alz79aE=;
        b=H/8giLYKKyshyD2W2iKa9O3psfZEQcitVfMWiW5PIBBQcv8L8pOBuD2JjStGuEX8z3
         TRaMEJPKJJaz8KylLHunXNRr2PQsyiifBll699QwDdAv9jOv2kaGq5wKl1hUeZOGD6AN
         2WZFnDr1IAVT3CtUIKgyYkKqZcXSa2RW5rvx8782hBwpohPqzMGxej0pn2gK5If8jeHp
         U5YEnke+LSEbPzrzRhi8K8gu1/pWBGXVdjZr6RfolL+mSMcwqhR27M6km8ENgevSrDoq
         Nww1wxvH6yAetHf5veFVA7qvoinNsk/T9nFKqWaaDUH6CZB74OdiLobJiwhNMrdGQisz
         21aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746514806; x=1747119606;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8W/zK0wbFRaqQMcIxNlkME3S0vuzKvpSCW5alz79aE=;
        b=GfvhhLEq+rBChzKSRjrKlNJ3OP898IFuzImKIZFxH1Qf9PCDur3hDeSgpnN2wC/aPA
         CYAn2dri6TpU12l8KMKXH+OSZgZFNQq2rm7e8eK36784dmC9OeobeyjoUTtBi27m6WSR
         EVGhbpYpqQ3mpy1tM7qZoXZHryHlUVDnZOASCmUs/m1ebkzexwbSGjAM5VNGQzQJFyt7
         L2s5ZdR1zEe0+xqcHBEiDpeG8rcsRqlyiFseH/B8LeIpZs+IPIliNYfyKVlw07QC//YX
         yVQWv2EHD+vxItQudPXM7KX32tbz13p8aDkoDgVLCmkAlIdjpDPSSVptdyEfw3TYs7E/
         QiCw==
X-Gm-Message-State: AOJu0YwhJGpEYA78qF/hVuJLBysDDNY9Y3FJAAewvrCIU99Kwc56OVwr
	QgA+1Qd1+DBFmv6hKX/S83tc6cXeETRthHvceSjvlLsGEHdNGNnV
X-Gm-Gg: ASbGncslnWA98D7G7HPXSLzjt5E1FStRlESIgWBFdKAq5KDNlS1oXfPW056Vl8Pn/ZC
	niGFuV1/WU23+inLkq0tgurBmlhjc3YUyywaEbnuWGFDYRWTaRXv3spTi+2culTudr3ti5DadFs
	LUX+twLUrWBrDlmycUr0TesBnTg+VHUC1MNaHfQVsDBZ0VfQfQ5W0LntNRwX9PlLrCuhrgo2Otv
	RGgzyZbn08PO3xMLzUhVivADifphOGpi00JwW/Szbz5DfnyTpFW9vD63/NFiG/UzRsbTO8vYPa8
	DK5bv+Uu9QF0x3/ivXNOazVGKhX3ETAI/g/f88QaYdz95fYTeP2H+9R0
X-Google-Smtp-Source: AGHT+IGqtfXVfCThJ0EgiS/vbdS1mgUdEnBm0TGR9eBiAzaBJvc7xAqx9vZbwK2IfY31NFMRKfw/6A==
X-Received: by 2002:a05:600c:500d:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-441bbf3b4b3mr128466325e9.29.1746514805520;
        Tue, 06 May 2025 00:00:05 -0700 (PDT)
Received: from smtpclient.apple ([77.137.66.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ee39esm156735185e9.21.2025.05.06.00.00.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 May 2025 00:00:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [RFC PATCH 7/9] x86/mm: Introduce Remote Action Request
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20250506003811.92405-8-riel@surriel.com>
Date: Tue, 6 May 2025 09:59:52 +0300
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 kernel-team@meta.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 luto@kernel.org,
 peterz@infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <03E5F4D7-3E3F-4809-87FE-6BD0B792E90F@gmail.com>
References: <20250506003811.92405-1-riel@surriel.com>
 <20250506003811.92405-8-riel@surriel.com>
To: Rik van Riel <riel@surriel.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)



> On 6 May 2025, at 3:37, Rik van Riel <riel@surriel.com> wrote:
>=20
> +void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
> +		       unsigned long start, unsigned long end)
> +{
> +	unsigned long pages =3D (end - start + PAGE_SIZE) / PAGE_SIZE;
> +	int cpu, next_cpu, this_cpu =3D smp_processor_id();
> +	cpumask_t *dest_mask;
> +	unsigned long idx;
> +
> +	if (pages > RAR_INVLPG_MAX_PAGES || end =3D=3D TLB_FLUSH_ALL)
> +		pages =3D RAR_INVLPG_MAX_PAGES;
> +
> +	/*
> +	 * Can deadlock when called with interrupts disabled.
> +	 * We allow cpu's that are not yet online though, as no one else =
can
> +	 * send smp call function interrupt to this cpu and as such =
deadlocks
> +	 * can't happen.
> +	 */
> +	WARN_ON_ONCE(cpu_online(this_cpu) && irqs_disabled()
> +		     && !oops_in_progress && !early_boot_irqs_disabled);

To ease it for the reader, consider using the updated version from smp.c
(or - even better - refactor into common inline function):

	if (cpu_online(this_cpu) && !oops_in_progress &&
	    !early_boot_irqs_disabled)
		lockdep_assert_irqs_enabled();


> +
> +	/* Try to fastpath.  So, what's a CPU they want?  Ignoring this =
one. */
> +	cpu =3D cpumask_first_and(mask, cpu_online_mask);
> +	if (cpu =3D=3D this_cpu)
> +		cpu =3D cpumask_next_and(cpu, mask, cpu_online_mask);
> +
> +	/* No online cpus?  We're done. */
> +	if (cpu >=3D nr_cpu_ids)
> +		return;
> +
> +	/* Do we have another CPU which isn't us? */
> +	next_cpu =3D cpumask_next_and(cpu, mask, cpu_online_mask);
> +	if (next_cpu =3D=3D this_cpu)
> +		next_cpu =3D cpumask_next_and(next_cpu, mask, =
cpu_online_mask);
> +
> +	/* Fastpath: do that cpu by itself. */

If you follow my comment (suggestion) about the concurrent flushes, then=20=

this part should be moved to be in the same was as done in the updated
smp_call_function_many_cond().

IOW, the main difference between this path and the =E2=80=9Cslow path=E2=80=
=9D is=20
arch_send_rar_ipi_mask() vs arch_send_rar_single_ipi() (and maybe
=E2=80=9Cand=E2=80=9D with cpu_online_mask).


> +	if (next_cpu >=3D nr_cpu_ids) {
> +		lock(this_cpu_ptr(&rar_lock));
> +		idx =3D get_payload();
> +		set_payload(idx, pcid, start, pages);
> +		set_action_entry(idx, cpu);
> +		arch_send_rar_single_ipi(cpu);
> +		wait_for_done(idx, cpu);
> +		free_payload(idx);
> +		unlock(this_cpu_ptr(&rar_lock));
> +		return;
> +	}
> +
> +	dest_mask =3D this_cpu_ptr(&rar_cpu_mask);
> +	cpumask_and(dest_mask, mask, cpu_online_mask);
> +	cpumask_clear_cpu(this_cpu, dest_mask);
> +
> +	/* Some callers race with other cpus changing the passed mask */
> +	if (unlikely(!cpumask_weight(dest_mask)))
> +		return;
> +
> +	lock(this_cpu_ptr(&rar_lock));
> +	idx =3D get_payload();
> +	set_payload(idx, pcid, start, pages);
> +
> +	for_each_cpu(cpu, dest_mask)
> +		set_action_entry(idx, cpu);
> +
> +	/* Send a message to all CPUs in the map */
> +	arch_send_rar_ipi_mask(dest_mask);


Since 2019 we have move into =E2=80=9Cmulti=E2=80=9D TLB flush instead =
of =E2=80=9Cmany=E2=80=9D.

This means that try to take advantage of the time between sending the =
IPI
and the indication it was completed to do the local TLB flush. For both
consistency and performance, I recommend you=E2=80=99d follow this =
approach and
do the local TLB flush (if needed) here, instead of doing it in the
caller.=20

> +
> +	for_each_cpu(cpu, dest_mask)
> +		wait_for_done(idx, cpu);
> +
> +	free_payload(idx);
> +	unlock(this_cpu_ptr(&rar_lock));

We don=E2=80=99t do lock/unlock on kernel/smp.c . So I would expect at =
least a
comment as for why it is required.

> +}
> +EXPORT_SYMBOL(smp_call_rar_many);

