Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE01243951
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618160; cv=none; b=CArNg7gKdkdBvocbviFWIHKYmEt96/8hekX9EIoDefnr1twZZJ0IYzoAQ7JoAx0dceU2l7nKQPzf6z/cwZCbKCOza8qRqFW7LuEyU2viiwsKHAVBOFpTnmLVCwN9ycfaAt6cu1k/E7k/oNzNHjQghQhDjbseMt6nRkLRgTB9rug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618160; c=relaxed/simple;
	bh=Mh5ONYQAaIxwhfDiAcBJ2ep+eU/1VKQfzw6VJVH6Eqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKKrWkV3B5ky+/o3UXwlf9RDv5npgxxjojl7sGcVYS0CKLGL3W9gR0TvRzV8hn0KoWElN0B5LVQdffUPPBX72v+eMcyKtda9t4VzJIGk5pbvWGYDFTa0BgMq2ivxU4SyCJ+HR1/CreBlmx45cpb2HMFAq044bdR5bjxHS8ICu5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1VATUE6; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1VATUE6"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f6970326so70013246d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746618157; x=1747222957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rg3f/Tg5SjzCfWpyeO6mKlvZkFNAOCxWB2ctnK8uuws=;
        b=m1VATUE6KBpPb3hBc0TNdJbiX1n1/zv3z0ubOXrqU71+e8gvLDRH+co1M/ncKHBsg0
         Y14maJZQQLZCFDnHDgEXH03am2/kQbJhvT/rsG1BsTHdMcP9VJxRDpFk6VXLWzmA+XxG
         4qBqssegwAbhMUxYDMP4gw+Dg0SWQ31IH6rPkgPFj2p9NfrxgMcUjXqY/n0CoZx7bTWa
         YLMoFpLjRlSJlbcsrkzh4SCmBZtVSrE1RMEEoM3NxFGCLR0JD3eE1kTBQbMnnMHUL1o0
         3myV6XUZM41t9OjK/14NmNQAV6f3Pb0kZDEgXEogB1KgLiG70+MXl5ZHr0l/UrTq5qV1
         IPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746618157; x=1747222957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rg3f/Tg5SjzCfWpyeO6mKlvZkFNAOCxWB2ctnK8uuws=;
        b=F4Xtgm5u99P1JVoCM3hUwKPH52+9I5aUPzTiL0qJaSLCNbdE69WZSv7LAVQ3/1moVz
         b7jirmvAoQf//YAOfItAwba+J4OaiJ3Pyc6XVAPz+Mx5sMU3y+0vCoMkFkI+eQkC5JbZ
         usjjGUTWr7zssaKP172rfkx5h5xJzPVQOusKy0t1QV5G29qGLSUCDIZ2DxvfrWiFghW5
         XtJPM9qDrgtgUnU/wJqWRdilLnLKLqYn8vCjUxmmoljc6X7JsEOVURRQFjCIOd1hlo27
         eU15pQYfTmBtbUp9b28XM4SjQBPhQf0Uk0OEOFtrgfekr9LQ3lLNNaJO1NrLsOowQq8b
         FBTg==
X-Forwarded-Encrypted: i=1; AJvYcCURKi1R0cIXmcM0ADAk85wiB5LcDHVhdbSZBrkPt5B0hmKS9jHbej3fFwHr+DB4IEexVn4vneYdMdnxmNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGgX8f0YNFrnzHlpJh7Fuw6t37rgTOVAM0s46BNPA5S3LDdG/W
	vxBvJ9Z6MOudicukscpUUBWM/IyrZh84FKvg71mnp2J3sulNqiDMiMISUhbvfmH0PVzyNvtZJJb
	HcnTghys14MuG/t96xReF5Tjn9VxyTctkp+Y=
X-Gm-Gg: ASbGncsCuv9T3jIGx92KPMfqt3A2bTA6apZMc4hHkbLdqVZ6olCDbLvGc6SHwQTjxiZ
	3cxwTt9M8AxNWKylxZcNJsZEEMAy5geotDV2wh12vbvdyNvQ0QqkF49qXpxDlOzqilcoUepl/OG
	cEIFuwVpZcSC68kLvsNmDD7Ds=
X-Google-Smtp-Source: AGHT+IGhmGCl/Qabfe6PF2gVG2FCXlv75JhOYiHCAmg2KP/kTgXiDpq2L5Oqn7Mw6g4ZxBz1ascOoWHSoGFt3D66+Dw=
X-Received: by 2002:a05:6214:caa:b0:6f2:d264:aaa8 with SMTP id
 6a1803df08f44-6f542a661b4mr46907126d6.19.1746618157189; Wed, 07 May 2025
 04:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506170924.3513161-14-mingo@kernel.org> <9b31f1df-7dc6-468b-9418-0b13239df8bc@gmail.com>
 <aBsGXCKX8-2_Cn9x@gmail.com>
In-Reply-To: <aBsGXCKX8-2_Cn9x@gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 7 May 2025 19:42:01 +0800
X-Gm-Features: ATxdqUEtyqfJKw_PG_rAbh1TtHCwAdQSdIY0FbZtDOs8b0D97olgkHo0RcguHCM
Message-ID: <CALOAHbDGSpDnzQ7AKiMci0708DwYr8gmruVGdJZ_Nt9rmnbxNg@mail.gmail.com>
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups
 and namespaces options in the defconfig
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, ardb@kernel.org, arnd@arndb.de, bp@alien8.de, 
	dwmw@amazon.co.uk, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	michal.lkml@markovi.net, tglx@linutronix.de, torvalds@linux-foundation.org, 
	vkuznets@redhat.com, yamada.masahiro@socionext.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 3:06=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrote=
:
>
>
> * Yafang Shao <laoar.shao@gmail.com> wrote:
>
> > Hello Mingo,
> >
> > > +CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > > +CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> >
> > Enabling CONFIG_IRQ_TIME_ACCOUNTING=3Dy can lead to user-visible behavi=
oral
> > changes. For more context, please refer to the related discussion here:
> > https://lore.kernel.org/all/20241222024734.63894-1-laoar.shao@gmail.com=
/ .
>
> Yeah. I actually agree with your series. It (re-)includes IRQ/softirq
> time in task CPU usage statistics even under IRQ_TIME_ACCOUNTING=3Dy,
> while still keeping the finegrained IRQ/softirq statistics as well,
> correct?

Correct.

>
> The Kconfig option is also arguably rather misleading:
>
> config IRQ_TIME_ACCOUNTING
>         bool "Fine granularity task level IRQ time accounting"
>         depends on HAVE_IRQ_TIME_ACCOUNTING && !VIRT_CPU_ACCOUNTING_NATIV=
E
>         help
>           Select this option to enable fine granularity task irq time
>           accounting. This is done by reading a timestamp on each
>           transitions between softirq and hardirq state, so there can be =
a
>           small performance impact.
>
> It only warns about a small performance impact, but doesn't warn that
> CPU accounting is changed in an incompatible fashion that surprises
> tooling...

Yes, this breaks our userspace tools.


>
> But I think we should probably treat this as a bug, not as lack of
> documentation. Peter, do you concur?
>
> > If we decide to enable it by default, we should clearly document this
> > behavior change. Below is the patch I wrote earlier but haven=E2=80=99t=
 sent
> > out for review yet.
>
> Note that it's not enabled by default - this patch is just about the
> x86 defconfig.
>
> Thanks,
>
>         Ingo



--
Regards
Yafang
