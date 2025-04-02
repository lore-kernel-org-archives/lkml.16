Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF47C234994
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589813; cv=none; b=srBGf9GFe6matYqrxaWO7uO7D2yKc+tb0rIjsIC8YrRIEm/dKogdcwLleyJP7AQUdQEsxn22bt/ic/MR9uFJg5+R2MYJg5t3nI6L9K6zE7CgZDVdjWfUrQ0IX5n4+UyiHD/TZeq1lcnhcuKwwoMlzPFuoA5V/8wPY8IOhpHpR7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589813; c=relaxed/simple;
	bh=If0B7uUV6NX2+WqaXenFUnwPJoOh/uZsu2Z2/sdyBtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+9oTr8LeckJRLO075/lm6Bo/9PUs0huyWmYe554TmPnU1rGRVKkYvqz/YEc2cwbLDSOjqtcSxzIzoXuCSRTKbE9wfNUPREej7TlewUoSkb+mSOm7+A+KB1/cu8VhXiT1gbceNi+AyI+oC8yT3f0PI4bgu3kKVIUjPqnEYnoV/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JqncWQHg; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JqncWQHg"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac73723b2d5so806546866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743589810; x=1744194610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=If0B7uUV6NX2+WqaXenFUnwPJoOh/uZsu2Z2/sdyBtM=;
        b=JqncWQHg5gTg5dzhmg0MBRSzwb/834GhVmDO4iMhgfAOSzOKtfnB1RH8AkymCrcr1p
         oOkTuMHmRmGjvMMTF9/Xub4ZqsmUN53nl6ERsizjAd7AloYzFKWXWr1Y7JDCLxerknnr
         2D/Pt+1Q4zippXItDkWm33bsvqZmZOjGgfWZY93cs3mCfa0jtSeDqcA5Tb2UlYgfMzZu
         rqngZLTohqN5/t8gp4tzs7cgufGR4PiR6Wpmyi7fRC9SPq3wY/fAuTieqRVWK/E5G1Vu
         BOM+kJHiOOA7n8TcxLLglojyVTPyqyNzaW2loI/P8rNtmlOXHBx1yKcaAtNShvLcqnoY
         7tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589810; x=1744194610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If0B7uUV6NX2+WqaXenFUnwPJoOh/uZsu2Z2/sdyBtM=;
        b=tspWYW4x25IBm8Qorw+3GeF40x6ZCRzyEZa6s0PiYTxZ8Wy/4R4nTVj15KdZIRfezQ
         CdlM9MENQ5XAqVkwxb91vDINT1xxnREDLZO5QA1ehJfrpfpnK5EK/ImEkp9WenOyFuJn
         g0o5SdjfAcuxq9CJRMZlex1T9Sogl6Ye0U8edzrgU7p5Xz4hXkr/cigt+N6IXaqvI90+
         L92UepSZZD6Q7M76M9YXKCBfqpTWe7clze5HbwTl5Gi169wevmyPM5TYGeKS5L6y7230
         jEh1DnR6x8O4HkCAtVvzNkmtEi6nXy+TLVGBYwIr/MSUdwVyqoS1L8ctkh1p2bYILQeQ
         ojdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Kd/PXk8sC7QHiHT3vCKZumP+p7o7MSHYVe9mHt0MY8Vq45l8IfDOb87cG7mgbRWSzH4Q2NX5W7cgncA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPyTzawseCQBwNkmtkqKaQjgIrqUh2KtVS929DV17tB6UCF3MM
	3/9zSrx5UbmtQt9Z7A+nPl14augR0GE9nGAWiUAj5xM+F/bLAMnxn/hdVlflADppuYL0PQp5Sr4
	ynUge4wrQx4XHXyuMFTo7JhSeK1X8PmIE1GJmFg==
X-Gm-Gg: ASbGncsywrNew/FKFt951179+Vg5q2c9AmeVjcZZkkIeas47DesboFDkA8VqeXWn7HH
	5L2AENsc6bnxgI44wUXopiftdr4uz2kt6AO8rSi/vjAiJ94ZqxRmLvygbYPDdrgnzWZdR6m3ShD
	gfINB59MB4feHTIYXD7ZiSVZJg2ZKacJmVGkM=
X-Google-Smtp-Source: AGHT+IEGnKNW72QdyCMjxaZ8GC6ePZQX6srGbLVObmGu9ZfiPq7G7S7fypK4kUkDy1p8fLfAnnEY3sauYvadR4VHGns=
X-Received: by 2002:a17:907:3e26:b0:ac2:9e1a:bf81 with SMTP id
 a640c23a62f3a-ac7a171665amr149027366b.21.1743589809964; Wed, 02 Apr 2025
 03:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331082347.1407151-1-neelx@suse.com> <2a759601-aebf-4d28-8649-ca4b1b3e755c@suse.com>
 <CAPjX3Fdru3v6vezwzgSgkBcQ28uYvjsEquWHBHPFGNFOE8arjQ@mail.gmail.com>
 <b1437d32-8c85-4e5d-9c68-76938dcf6573@gmx.com> <20250331225705.GN32661@twin.jikos.cz>
 <CAPjX3Ff2nTrF6K+6Uk707WBfvgKOsDcmbSfXLeRyzWbqN7-xQw@mail.gmail.com> <e3e5f96a-8b46-4e61-a66b-253d2dbe6aa4@gmx.com>
In-Reply-To: <e3e5f96a-8b46-4e61-a66b-253d2dbe6aa4@gmx.com>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 2 Apr 2025 12:29:58 +0200
X-Gm-Features: AQ5f1Jqvfxd2WBoECRKSnpbiM4SoVxH_a_gJi6NOEtLCNGoWC8ifqXlcsPXQRPI
Message-ID: <CAPjX3Fetm8jmPoaP84PC9ck_XtRch9TPny6tKcn2EJL6ZPaXug@mail.gmail.com>
Subject: Re: [PATCH] btrfs: zstd: add `zstd-fast` alias mount option for fast modes
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: dsterba@suse.cz, Qu Wenruo <wqu@suse.com>, Chris Mason <clm@fb.com>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Nick Terrell <terrelln@fb.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Apr 2025 at 11:08, Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
> =E5=9C=A8 2025/4/2 19:07, Daniel Vacek =E5=86=99=E9=81=93:
> > On Tue, 1 Apr 2025 at 00:57, David Sterba <dsterba@suse.cz> wrote:
> [...]
> >>>> I thought this was solid. Or would you rather bail out with -EINVAL?
> >>>
> >>> I prefer to bail out with -EINVAL, but it's only my personal choice.
> >>
> >> I tend to agree with you, the idea for the alias was based on feedback
> >> that upstream zstd calls the levels fast, not by the negative numbers.
> >> So I think we stick to the zstd: and zstd-fast: prefixes followed only
> >> by the positive numbers.
> >
> > Hmm, so for zlib and zstd if the level is out of range, it's just
> > clipped and not failed as invalid. I guess zstd-fast should also do
> > the same to be consistent.
>
> Or we can change the zlib/zstd level checks so that it can return
> -EINVAL when invalid levels are provided.
>
> But to avoid huge surprise, I'd recommend to add warning/error messages
> first.
>
> I'm not a huge fan when invalid values are silently clamped, even it's
> just an optional level parameter.

I agree. Well, one by one. Let's nail the `zstd-fast` first and clean
up in subsequent patches.

I already plan to fix another issue I noticed. For example
`compress=3Dzlibfoo` is still accepted as zlib, etc.

> Thanks,
> Qu
>
> >
> >> We can make this change before 6.15 final so it's not in any released
> >> kernel and we don't have to deal with compatibility.
> >
>
