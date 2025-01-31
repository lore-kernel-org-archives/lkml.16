Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519241F0E5E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738344186; cv=none; b=JwDqre3y/eMQHsRI3dkC3CWVzwY0HrRq56SxPtpB7EaCVU5muqC9T/CrbIIjGWUjQU2TDtaKb84iSFF1jHkDLkZ0mBZdrTSSLeduHdEQJ8k7R3AFY3dzrENDgTd2nfkPFMTeDSO7K7+Patx/o1pAX6v+QYP6RbkDZmTylNTCUQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738344186; c=relaxed/simple;
	bh=kme+XPg+cuiUjsUHBIxrAcU2Va9lng0EAL+26Hj0OsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/hdG+ak2lQasLMkw1jJBECiYyFQ8rMtTO5qwMaltSPJWmpn39IyTDW7FoBQ5kknmvrcH+seIeIr+JsDa6B/1o8Avp3u8l9QYA9dKS/ybHxIvlNvCaCn6Rj5vPq8nbA7iBj7NTECbU0mEYHupAlMjwwitYu6jHY8EsIAnSrJvOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u6pNC8m/; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u6pNC8m/"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a04so21023761fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738344182; x=1738948982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjFe7vrxU6YEM1DATv1IgiJrIlKHUq54rhWlLDCXyk8=;
        b=u6pNC8m/M6hWuaNsAw6iUhP4uEFln1Cj09OdSpfwnM0Qg49/9o0GvdBMSNB1lK/TZG
         PxHSAHxFemTr0zi8bMYjreqJluHWu9x35riBOIq5mmusRS7PRCxOKhlz3SeQzBYFdKal
         W2dqwFTFDLtHy2S9gUESrRbEHA1mAUYIcjrmE2M7NM36PQn86WwLXCedBkH7rSkBGiSH
         +KczK7lKL2etHlK+72fIIb9DUPyzegh/CHscMd+uT7+jGRdn/Syj7QJcYRLbMKFzIlQG
         hVe6s/WFJqkNYatZcRHzg1qs5ytgGnSaLdjW0KQKpCoaMKsmg5fs7dnG1uRm7tX/lXRz
         GImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738344182; x=1738948982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjFe7vrxU6YEM1DATv1IgiJrIlKHUq54rhWlLDCXyk8=;
        b=b+rFICMttDwOIzvWjygoAkKVRREc/C0L3v8/wWWWredB8zEtZHDR7rvxHQnbMhbwUG
         MJd/zrsYZUfw+Trb2+Yj6AWr2LoVACRTuf430A3yRxmACd1zp9YsuG57SID0MoI0bqIB
         N9JaIg5s/dHhlZnInafpLcDIoyKv4cJXs/Nv9Zo0ybBfssIYPVbWx9Y99JZIVWRGgvyl
         rkEIx8ZzI4gikgRtyTzG11O/yEno038abaQKItYsEKTaAUOXMReORzpvvLNicBivCEQy
         ffs3bUtHC+AwUz3SnP8HCdK+hkaKDjixB8FwsPrQV+jke7eYEPRC9eHUFUJ7ArxTBakM
         tmMw==
X-Forwarded-Encrypted: i=1; AJvYcCVXEgKQjYRK6KyHNXeTrNpT8N5wWR2CKFdpzUBeXydIBlEMdSQLDaBDkLbd7LjLw1BJ6q7VGXvrmnwCTR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdbV/1/ClC/eKqFjNbCZKt0gW7Vw4gn3MctwsneD2RXXqzXKS
	r+aJEXK9SPZ55XZrxkiJpA4/ALFYENbsZsig6whqziyYE1eeYAUQ+G4mCO1XojD+jVPyNoeEaAq
	SNaVDYmXqZ0J6J1JexisT1mPPPFp3iWdkIvtOgw==
X-Gm-Gg: ASbGnctk3U4bNJH4uuMsJJO2bEWEFHen11f+Ie7mtUW5X6SiDvk7O0FPPXlH5AUANlz
	ED0zOv47v8c76VAKpbNkzdQ9op80LXX1z2DaarrY0EmuK4KYFHLLKkoo6ClFtmEzuVCpKdkk=
X-Google-Smtp-Source: AGHT+IHxXoKtKpfWmHiyCkmDOMffgXB2luyZa9jFQPi8dZzp+nNVT/3VlAaiMixKow+4twrU3G/pSVUWwpEVrrMSCWA=
X-Received: by 2002:a05:651c:b06:b0:300:3a15:8f22 with SMTP id
 38308e7fff4ca-30796872c96mr45396891fa.21.1738344182267; Fri, 31 Jan 2025
 09:23:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com> <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
In-Reply-To: <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 31 Jan 2025 18:22:50 +0100
X-Gm-Features: AWEUYZljrTXtp6VdTg8U8MI4zsCzrgDx5TFvSWaWs-N0kRXVKgUx5Ql-znHgiZc
Message-ID: <CAMRc=MeRBABW6JCScGvsRR_4+W6u5QMWJwA7yMB9gj7=uOeD0g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 3:36=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> On Thu, Jan 30, 2025 at 09:47:47PM GMT, Bartosz Golaszewski wrote:
> > On Thu, Jan 30, 2025 at 7:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > >
>
> (Small reply to the previous comment:)
> Yes, I understand your point about why you think 'num_lines' is
> unnecessary. What I meant was more of a UX (User eXperience) consideratio=
n.
>

If anything this sounds like worse user experience - having to provide
duplicate information.

> > > While at it: there's no reason to impose a
> > > naming convention of lineX, lineY etc., the names don't matter for th=
e
> > > aggregator setup (unlike gpio-sim where they indicate the offset of
> > > the line they concern).
> > >
> >
> > Scratch that part. There's a good reason for that - the ordering of
> > lines within the aggregator. [...]
>
> You're right, that's exactly the intention of the strict naming, 'line0',
> 'line1', ..., 'line<Y>'.
>
> > [...] I'm just not sure whether we should
> > impose a strict naming where - for an aggregator of 3 lines total - we
> > expect there to exist groups named line0, line1 and line2 or if we
> > should be more lenient and possibly sort whatever names the user
> > provides alphabetically?
>
> As Maciej pointed out:
>
>   (https://lore.kernel.org/all/CAFGk_a0U=3DjSQD85UKC1e=3DpSWr8W9y_MMAFyPV=
FOcE-fUZry7-Q@mail.gmail.com/#t)
>   > [...] if free form names were for e.g. [1, 02, 10].
>
> we would need a well-defined rule to avoid ambiguity, which could
> potentially unnecessarily impose burden on users to understand how to
> properly use the interface.
>
>
> Regardless, the point is that we need to make it clear to users which GPI=
O
> line a specific line<Y> of an aggregator forwards operations to. Since
> requiring users to explicitly set the offset within the aggregator for ea=
ch
> virtual line (e.g. besides 'key'/'offset'/'name' attributes, by adding
> 'idx' attribute, which users would need to set explicitly) would be
> cumbersome, this RFC implementation instead just makes use of directory
> naming. I believe we agree on this approach (i.e., using directory naming
> to establish ordering). Correct me if I'm wrong.
>
> So, to move forward, let me outline the possible approaches we can take:
>
> Option (a). Drop 'num_lines' attribute and:
>
>   (a-1). Impose strict naming rule for line directories
>
>          Users can only create directories with a predefined naming
>          convention. This could be 'line0', 'line1', ... 'line<Y>' (as in
>          the RFC implementation), or simply '0', '1', ..., '<Y>'.
>
>   (a-2). Allow arbitrary naming for line directories
>
>          This would require a well-defined rule to avoid ambiguity. As
>          Maciej pointed out:
>
>          (from https://lore.kernel.org/all/CAFGk_a0U=3DjSQD85UKC1e=3DpSWr=
8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com/#t)
>          > if free form names were for e.g. [1, 02, 10]
>
>          Users would need to understand these rules, which might impose
>          unnecessary burden on users.
>
> Option (b). Keep 'num_lines' attribute but:
>
>     (b-1). Prohibit manual creation of line directories
>
>            Users would no longer run 'mkdir line0', etc. Instead, writing
>            <Y+1> (Y >=3D 0) to 'num_lines' would automatically set up the
>            required directories.  convention. This could be 'line0',
>            'line1', ... 'line<Y>' (as in this RFC implementation), or
>            simply '0', '1', ..., '<Y>'.
>
>     (b-2). Keep manual 'mkdir' for each line, in the same manner as (a-1)
>            (as in the RFC implementation) or (a-2). Seems that no-one is
>            favor of this option.
>
>
>     Note: (b-1) is a new idea. Considering what really needs to be
>     configured by users, this could be the least burdensome and simplest,
>     especially when configuring many lines. I'm including it here for
>     broader discussion.
>
> Personally, now I'm inclined towards (a-1) with the simplest naming schem=
e:
> non-zero-padded integers ('./0', './1', './2', ..., './<Y>'). Or even (b-=
1).
>

I too think a-1 is the best option. However, I'd go for line0, line1
etc. convention as for computers it doesn't make any difference while
for humans it's more readable.

Bartosz

> Let me know your thoughts.
>
> Thanks.
>
> -Koichiro
>
> >
> > Bart
