Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993202701AA
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740603; cv=none; b=aZSzq8/vlFzdMdVvopVJ5eGtzfjNH9Mk8pewCU1qS36j5h7psNjOkWliAnM6MRKpvh3pJzlx4KJ1cHuyUDK8mDJxAN8B+YfkFfssPx/y9+BxVtT3mflmM/SFH2RdYrrRO8cPUxBrgWLggRpHwkTO0coxd4mLZIH92qtcB17EBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740603; c=relaxed/simple;
	bh=jFnYWDnEGjQwDd2gLR9uDiOWEyDyzknYhlUitzuDj/0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LXV6c/FH7vg3m9heGVp7VZ50QFDc0vrUUyT6HKnBAB56PC4q5JMfXOkPEVzouvHCMLFBFqminyc5AP871vVpIeJN3TBLrGNUccZ/XuRECrU0BY/UItJHkepBuLcHY++Fb9WTCsEBhtIEsJ7wuXWxuYl4xoXJ7PlrODCoLNWqsh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtpUo+JX; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtpUo+JX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-601ed5e97e9so3400117a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747740600; x=1748345400; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNSWdVp0pCGv6zZlGqB2G5Ypt6F8CERWSTLAliUg2NE=;
        b=PtpUo+JXmKMgvTGkgzwZvWY6aJFPYOQw/ciYFUuvUmQK5FITDVJjZPWWs9vF7Uh0qb
         j3i7lJtijieZxLXGQ/oooZSKnHpZWlT1TvXzHc2cH5TJs0P4LVvpGKf5e2EfqPXlC1my
         ZvtbXf9RQyUrGtj0XrdVuf/ACLxonU9OCBxAd9DexX1kG/iH8vlBHTBYImEGZFEb6rDA
         /x3dg+Sc1VZ2onIhTT5T7PWBXmy1ImHuQhd62eL49xTPzEeE/c7HvsKCo+apTOza9DVw
         QPYZioTY/31nkWeuvJuIHa4QCUIjGjYS/62M4YJUjN02OjUb3JlFjBHIqz/VyekDWePz
         HVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747740600; x=1748345400;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNSWdVp0pCGv6zZlGqB2G5Ypt6F8CERWSTLAliUg2NE=;
        b=TCoTugdPdVbeOEajuvON6LZOws6ENyuyhCpJU5WfKe6LxNn16mamQAzv6KNUZLWb6H
         p30Kkty+5hEETmjJUWxHRTPENHjRan4ABN8uFr2n8rDmHFCyXf8dlO0wTtzsDEH2lb7J
         bkYQL3SKno6Y8ts+qosOSKwe+YNANc2pFMoUP5/iwACPyfca8pHUzjTBcnLmi6OfzzYP
         bdDiBkfxXqAAeYVtuIli7/cifZdF4f0TP4hhgIvleScBD3zokotOUVtaPr7j2JVNpHSc
         pe2e0loFXRmuP0XhEgxqO+VkJEa7RO06b4pjpxdj40OaAgP0UXWfZ0wv9nwZPjQnZ03f
         KJ9g==
X-Gm-Message-State: AOJu0YwTMhW5c1/0j7VNaw/Lbkkxj0rSA2+eVPTmwmwG2KrpGzdZC97r
	wdtAUVV3SutF7jMChNozHnXypAZ5GXSVb+IfFJVGlL53OwrwJc0SgvfJ
X-Gm-Gg: ASbGnct/zQvsoJAoSwIPqmXyws5vVUUAkM4RwsSnCiW4yMAUAWrAmeKXiDVHdDfmvQC
	fsUQRrjdrnV6ZBdN0qlAd0xHNwlsmlNslPD6VoNukdEJrQwBHJ3YIQ6RxSgJZfvedWih2UfnlqH
	qJCM3iRxy+QxaFEUoD9CU+WXFSpBLIMVPcrPFZzmjMarsR5dxInAv6BNOGxsoQ0m1wAjZO0Y+gm
	B47MmuYK83BGuBVAs7nZ9Dnnz3XDM+jCpcf+z6Ws3ALnadoN3Ipkai9CUJdkZmV1o754AwgXHqa
	V6hzQ++WTj47ie9AJ90polgHTRRP5fM8pExaqbXAMfNFNjoFN9R7OR09NPgfsGXm4GivL8uAUvm
	6P0A=
X-Google-Smtp-Source: AGHT+IFHkJS1TgytAIFMsB6vO1Cu5EW569Xn4PZHR3u4t0a3HsI/YxGapJU2ZnEmP8JJG2H20JPt0A==
X-Received: by 2002:a17:907:7da2:b0:ace:5461:81dd with SMTP id a640c23a62f3a-ad536b5a0cfmr1500424866b.3.1747740599535;
        Tue, 20 May 2025 04:29:59 -0700 (PDT)
Received: from smtpclient.apple ([64.176.163.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e816sm708660766b.23.2025.05.20.04.29.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 May 2025 04:29:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20250520010350.1740223-8-riel@surriel.com>
Date: Tue, 20 May 2025 14:29:44 +0300
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
Message-Id: <4A879001-E213-4239-9D25-CDA8EC3E2CD9@gmail.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-8-riel@surriel.com>
To: Rik van Riel <riel@surriel.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

Not a full review, but..

> On 20 May 2025, at 4:02, Rik van Riel <riel@surriel.com> wrote:
>=20
> +/*
> + * This is a modified version of smp_call_function_many() of =
kernel/smp.c,

The updated function names is smp_call_function_many_cond() and it is
not aligned with smp_call_rar_many. I think the new version is =
(suprisingly)
better, so it=E2=80=99d be beneficial to bring smp_call_rar_many() to be =
like the
updated one in smp.c.

> + * without a function pointer, because the RAR handler is the ucode.
> + */
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

I thought you agreed to change it to make it use lockdep instead (so it =
will
be compiled out without LOCKDEP), like done in =
smp_call_function_many_cond()

> +
> +	/* Try to fastpath.  So, what's a CPU they want?  Ignoring this =
one. */
> +	cpu =3D cpumask_first_and(mask, cpu_online_mask);
> +	if (cpu =3D=3D this_cpu)
> +		cpu =3D cpumask_next_and(cpu, mask, cpu_online_mask);
> +

Putting aside the rest of the code, I see you don=E2=80=99t call =
should_flush_tlb().
I think it is worth mentioning in commit log or comment the rationale =
behind
it (and maybe benchmarks to justify it).

