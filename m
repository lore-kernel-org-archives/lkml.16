Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597BB2192F1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487214; cv=none; b=nh8zgJ+eEbDcrnuHTBMucfb1jDYI9MuXPnhPlO1Q2GffE0InD2T3dBraudSgqdOWWXTGb6xd/oyIRwgT0UprH6WOxYpLyTCVAGTgKPj5rdhtu8sKFAAQyXT9fpcMGt6ZvLJ/jwd071e4tI6vl8sBA9ZRbbXDOdb06PNq7MPDYu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487214; c=relaxed/simple;
	bh=p1cbnm7lELRjyhlcQZGUCOJo/wAk2+UyA+Fcy743fkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dx0yTRaxXZh8Nc81HHrk064rstK9X2eg1Zc+ubr+mS3RuxkOFxxYOO0Om0dbpG14yLvPq/o19e7yK0zSzXxXnDvCjkg8KVlbsUVwfdXI7SH02+xM0t/kwnNMCfnDbwKVDCrU1Td4Ljgb9h8FIm3+86gfOi1YvUQWzorkzmUiAzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X5I/KHdO; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X5I/KHdO"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58ef58a38so2821cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749487211; x=1750092011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HNgYVSmiUBr3AdVbd++DtBmjqiQDsT46XQ/07pVNmE=;
        b=X5I/KHdOxfhgY5zG2uCj6Oz39tXiDcjLlC40SFegGyxGj496x8hn6gyoHKUwc7h0LX
         tY5Sr35R3oWV3cwerEmNNigb6XKa4u70p32Cxe3eR3WMVvjSshAFKx9zDkxr7haSsruL
         BodXZJee0lnvG0t9L5YJbtx18pqc73KzeVLtwqeib/H2TaJ++n0Oz04qGMmtShNq+dYq
         i4cB01e0n32MPYyfrM4ADfObG+/3rrDs8CqTTeTTXhkiw4U57O/SgGdQyKSGxZTuOoiU
         YKI5jL2pczfWd3BOUAkZ9DEKhT2VzMMnvziF1N53zFnKsh637NxyAcPG6graIIPumWGQ
         KNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487211; x=1750092011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HNgYVSmiUBr3AdVbd++DtBmjqiQDsT46XQ/07pVNmE=;
        b=P/T73rxratbV9rCVqQZo+T+MGCFdKiOqr3xBENasT3iTZL51ug8LvFy6m6HagEkWNv
         zwx9KYKlCiTSt1FBy6nu1Mc3nXnkmYOgAyDGemyXX0OFkk0wSMwGNIICLB/7rZZ7SU9C
         wZgV4IBQERCONCWHn2MYfDkSFsBmHYu/iDtu9Dzg5WStZhgy2U7YDmVfc2m2WDqXkZeW
         Lu023YVdYPTyXn6lm+hnVEGlQDSqkJkTGzTJHT/Fq8vDi23jKMke1lK9RcW+9gGGgigj
         zc+b12gEmps4WSwJ0W2BOwuOa5F+yVwtm5o5JixIphWjUp4n95VxQzlbHZVFkNaw/JIK
         uPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO0bqKCiRfl79/Z2actYhaYAJ1HwEP+ZJVlIiqfIsCAJTdNqn3PGMb88q7colDsP3C88I2EUdoQXM4BrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQw2X+T2W3z1S3V26h+dODb7Gya3SqoB5K2TxM1JzeAz/MaNss
	9uhl4mZ7SdVZi4BnmDdYiZXibMT9mkatcTrLWF0Zw2QsVi/0Tr4zdDEUYveos/Nhp/USmSO6fLB
	P57MOPto2rWCOFfwPnap7P6XFroLiQnw2FnMn+LZ7
X-Gm-Gg: ASbGncuSHad5evAd4W3e/uMFmDPgZ3iQJBKZemJf6ttQYvvR5GA77Oxn2appYg9lnSk
	l7vH/15sQ2OOaE/B+c3cSTRCwJ+eyU5MBQ7AzXoFX/uRRuPKvo3pZcdAgc2rzjKqrH1yfTxITdS
	07KKMqx9iIWVgfvflZjXtVwiBBCNNaczROpHJ+CWdJvg==
X-Google-Smtp-Source: AGHT+IG3r8G7rEO/SJtAJH2Sf+M9+cusGNgtWYKAwS8SHW3xVPTsBaFewVLb9BvzjXZU7sjTw6x8ZCobV5ZE5zPOXYM=
X-Received: by 2002:ac8:7d10:0:b0:4a4:3099:60fe with SMTP id
 d75a77b69052e-4a6f072bba4mr6854551cf.21.1749487210760; Mon, 09 Jun 2025
 09:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529073537.563107-1-hao.ge@linux.dev> <177e1f6b-50f0-4c0a-bb0b-514283e009a2@linux.dev>
In-Reply-To: <177e1f6b-50f0-4c0a-bb0b-514283e009a2@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 9 Jun 2025 09:39:46 -0700
X-Gm-Features: AX0GCFtAMcIZQmcFpl5cLO0oNlYX2TZcwzfIFqTHsy9G4m9uCVB5_gLIqQoUurI
Message-ID: <CAJuCfpE9Y6iMt5sDd+NUuXAeqXiQXaYZOobGDvi7LYRqm=7-KA@mail.gmail.com>
Subject: Re: [PATCH] mm/alloc_tag: add the ARCH_NEEDS_WEAK_PER_CPU macro when
 statically defining the percpu variable alloc_tag_counters.
To: Hao Ge <hao.ge@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Hao Ge <gehao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:08=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
>
> On 2025/5/29 15:35, Hao Ge wrote:
> > From: Hao Ge <gehao@kylinos.cn>
> >
> > Recently discovered this entry while checking kallsyms on ARM64:
> > ffff800083e509c0 D _shared_alloc_tag
> >
> > If ARCH_NEEDS_WEAK_PER_CPU is not defined,there's no need to statically
> > define the percpu variable alloc_tag_counters.
> >
> > Therefore,add therelevant macro guards at the appropriate location.
> >
> > Fixes: 22d407b164ff ("lib: add allocation tagging support for memory al=
location profiling")
> > Signed-off-by: Hao Ge <gehao@kylinos.cn>
> > ---
> >   lib/alloc_tag.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index c7f602fa7b23..d1dab80b70ad 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -24,8 +24,10 @@ static bool mem_profiling_support;
> >
> >   static struct codetag_type *alloc_tag_cttype;
> >
> > +#ifdef ARCH_NEEDS_WEAK_PER_CPU
> >   DEFINE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
> >   EXPORT_SYMBOL(_shared_alloc_tag);
> > +#endif /* ARCH_NEEDS_WEAK_PER_CPU */
> >
> >   DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=
,
> >                       mem_alloc_profiling_key);
>
> Hi Suren
>
>
> I'm sorry to bother you. As mentioned in my commit message,
>
> in fact, on the ARM64 architecture, the _shared_alloc_tag percpu
> variable is not needed.
>
> In my understanding, it will create a copy for each CPU.
>
>   The alloc_tag_counters variable will occupy 16 bytes,
>
> and as the number of CPUs increases, more and more memory will be wasted
> in this segment.
>
> I realized that this modification was a mistake. It resulted in a build
> error, and the link is as follows:
>
> https://lore.kernel.org/all/202506080448.KWN8arrX-lkp@intel.com/
>
> After I studied the comments of DECLARE_PER_CPU_SECTION, I roughly
> understood why this is the case.
>
> But so far, I haven't come up with a good way to solve this problem. Do
> you have any suggestions?

Hi Hao,
The problem here is that ARCH_NEEDS_WEAK_PER_CPU is not a Kconfig
option, it gets defined only on 2 architectures and only when building
modules here https://elixir.bootlin.com/linux/v6.15.1/source/arch/alpha/inc=
lude/asm/percpu.h#L14
and here https://elixir.bootlin.com/linux/v6.15.1/source/arch/s390/include/=
asm/percpu.h#L21.
A nicer way to deal with that is to make if a Kconfig option which is
enabled only for alpha and s390 and then do something like this:

 #if defined(MODULE) && defined(ARCH_NEEDS_WEAK_PER_CPU)
#define MODULE_NEEDS_WEAK_PER_CPU
#endif

and change all the usages of ARCH_NEEDS_WEAK_PER_CPU with
MODULE_NEEDS_WEAK_PER_CPU.
Did I explain the idea clearly?
Thanks,
Suren.


>
>
> Thanks
>
> Best Regards
>
> Hao
>
>
>
>
