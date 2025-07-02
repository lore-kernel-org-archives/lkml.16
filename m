Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C82DCF48
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475223; cv=none; b=jd0x9S1URKpSA94ix0+dlIarYTGa8dp8E5pieiPfExA2uD/AsQPHj7tCIxJ4LN6HScHLBEfn7SH9mPNwGnj/VAByXYjtCrml6LLgPp3VHIRcHW1PYD3mt0MF0b7WV6O3Af5YNyyKLbmdd3ot5I2386LOpzGu6HlrYvO7IB/uyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475223; c=relaxed/simple;
	bh=JzPj+lBsrJjnxC9nEGO/quwQy1NRR9A54nmusUQFIMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nq0ouGJh03py/bUHq2PpPIrdYFpX6CZXnmD1z0NM+4ZHSH+4DxJWrQtM3uP8oKfw627KLgcM66KHrd1+wH4wfvSYXaN0v6yk2/h7KyuxlGeXesmOduBGXz9T5i/ggbOWR8OazCnsn2QSL+Cvmm1cdvks1vjTXGEq4/vNTPyXclo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CzgaCTfj; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CzgaCTfj"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6098ef283f0so390a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751475220; x=1752080020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liNY5lgG36DzCMZ+evcHbizAVadWqApjCZaZxVVS2c0=;
        b=CzgaCTfjQ5WftE/1VoWolXD67Di8e5NUoT0mnHEjCm0ARTncQilaKiGYEVZOEG+scB
         dPsn61MyQ0co17mrRgv6FklwfKT+x3nHbHsOLj3lTg+i7n2Ty2YpiRDcXTLF25SvtvFF
         8+mUJcgPG0S+mK8bK6wO3apOnCjq2KABa6s1XbMt8VfWB1j/YbY7TCChT1hSvNhtaatr
         FiJtxgVsKoB9+7tt84XlLV5JBjZtR/b/VkDijvX4Ci5VmfuWy9xFQqwujImQSjR5cNsa
         sKtf7DmeBxlqSIWZo72h/OTvBNzCwr+pytw96TeAhmOZ7W2SOtCI6dhZdqfkN0Eek237
         HuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751475220; x=1752080020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liNY5lgG36DzCMZ+evcHbizAVadWqApjCZaZxVVS2c0=;
        b=MS1YQ+BfRQmgWF7/O2uJlGznHHCpIJZ3abhGdwArIVILhKrpQ6l/qUjOvv+skIZJ+X
         UXs0RZO/hTE/wd+FUouh81N20I69ovFalQi5Q3dzugxMDi0ECEQZGfgysxkPqCrMoy5f
         7qzN2ph/Rlca9PDxWblGrfBu9LBHQ4I6KhhqqMAzXzksC6TRCL2EhxY8QwwD+fbMh3G4
         4O32Qp/Es5rM8/htaxWswQuquv4yocyu1d7QHMqcqHbAv/LcU547eSdcswN9NSrmg1oL
         CAfArcjE8vbqg+QSAJV66boUBWUPcu8Fsf+qtWcPvFlFRm95eWbwQna8fU5uLaqywYFb
         vrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeFXk0N8M1U3mBzRup4xcwWi1/dFiy3B8AM7bnHzMEad2MQrI5T6bcnne9RZZ7RCuUHbCN/A8VUwMh1p8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+FjV2MHvP/3WRzb12bmFbEXxKDHE49iRA9T8WIcpFKwT4MPyn
	JrUKA6BkJC1K8JEWdNPybV3yoUnAwcbZVQNv3QbuNbldJKP9GWQZ5+lBA4mHdal1U5FkfLDgBud
	aleg8h9pow7ft2S698jzvByVvt/0gfuhkhW4hKw7i
X-Gm-Gg: ASbGncsJUtMjUuhYY++9B8JyZ8PzXlJmZs+8VA/5dcjfXl7ErrPkuPeDOVGr9I2Dj1z
	aSbZ0qTmY6cid/5u+jGWQa9PgfqcY+jyOk7+QAQYrhLp57OLOivPMACTnFid6v9+PCK0nlIe3C8
	AyNVtLfEOaPYqxx3VjQNB4L2TDHcanPPoTeC2kuhDBny7e16Qt0p//B+WR6BkRp3YbJ3uxAbQ=
X-Google-Smtp-Source: AGHT+IElFBpCw0NdN0t7jMdWSM70fyENDRD6qYwmhYo8pe+ItwqyjbAk9PZ3x9GEdbJs5GYPAFeK8PVw1rAIUT2ZhP8=
X-Received: by 2002:a50:d658:0:b0:606:f77b:7943 with SMTP id
 4fb4d7f45d1cf-60e38651f9cmr204636a12.0.1751475220059; Wed, 02 Jul 2025
 09:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com> <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
In-Reply-To: <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 2 Jul 2025 18:53:04 +0200
X-Gm-Features: Ac12FXyNL4CnLvDaMm6aTBXMhOT6atp3w0EvhJnXKS-5JlvKRG2-aaOnDp1_lic
Message-ID: <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in flush_tlb_func
To: Rik van Riel <riel@surriel.com>
Cc: syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	luto@kernel.org, mingo@redhat.com, neeraj.upadhyay@kernel.org, 
	paulmck@kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, x86@kernel.org, yury.norov@gmail.com, 
	kernel-team <kernel-team@meta.com>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:24=E2=80=AFPM Rik van Riel <riel@surriel.com> wrot=
e:
>
> On Wed, 2025-07-02 at 06:50 -0700, syzbot wrote:
> >
> > The issue was bisected to:
> >
> > commit a12a498a9738db65152203467820bb15b6102bd2
> > Author: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > Date:   Mon Jun 23 00:00:08 2025 +0000
> >
> >     smp: Don't wait for remote work done if not needed in
> > smp_call_function_many_cond()
>
> While that change looks like it would increase the
> likelihood of hitting this issue, it does not look
> like the root cause.
>
> Instead, the stack traces below show that the
> TLB flush code is being asked to flush the TLB
> for an mm that is exiting.
>
> One CPU is running the TLB flush handler, while
> another CPU is freeing the mm_struct.
>
> The CPU that sent the simultaneous TLB flush
> is not visible in the stack traces below,
> but we seem to have various places around the
> MM where we flush the TLB for another mm,
> without taking any measures to protect against
> that mm being freed while the flush is ongoing.

TLB flushes via IPIs on x86 are always synchronous, right?
flush_tlb_func is only referenced from native_flush_tlb_multi() in
calls to on_each_cpu_mask() (with wait=3Dtrue) or
on_each_cpu_cond_mask() (with wait=3D1).
So I think this is not an issue, unless you're claiming that we call
native_flush_tlb_multi() with an already-freed info->mm?

And I think the bisected commit really is the buggy one: It looks at
"nr_cpus", which tracks *how many CPUs we have to IPI*, but assumes
that "nr_cpus" tracks *how many CPUs we posted work to*. Those numbers
are not the same: If we post work to a CPU that already had IPI work
pending, we just add a list entry without sending another IPI.
