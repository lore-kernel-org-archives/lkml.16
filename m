Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9A25B1E3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017638; cv=none; b=nw1Ig/b2X/jgIuHIalk5mBwtJWzrVqblNiLob+zK7wnPmcFJq31YyXMMvIy2mzC4C5l7wzqAm7T//8yMwHktgH5NAbUFd/RyJcA3lYweKMUxUxbBHuabH1A9suXLcwBkkVVqSgVTVMfnvTEEc2nyvo5JGOLCgBE1ukZxUrIhONM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017638; c=relaxed/simple;
	bh=0Gcyv0t7u3IFe4ds+zRFzU+eMDj6dYuG9QCJ+3jJn2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0pUuLs1qsbXBjQ/A5dk1XLKwU285VI9HM3x3XPZoFk+5qW2w1pE/C6ikQk5F64uEhkrczQiqllvR0T2Z/mHHWA4P+960ztT4VZfLKBNHS1Vb7u+j9UlMEIXHae1ujNLzREzKcPQFYjZzb2DwatIl4J6gaHk+h6r51ADwwKIVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gDEA+84Q; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gDEA+84Q"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so1806099a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746017633; x=1746622433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU1/SOmNaSIoaOP5Y27zEp7SD6Xio7q26DsiVHZeov4=;
        b=gDEA+84QbiZBRrmRjLqiJ0p4e1w3lHznRInkERl8sy+ZIh1UxEI08qXPaO8leuIBDB
         RdGqD8HSCErKPB3p8YfVgiONfXc1A3C/CPS12bhoCI8pQXGS2N8b0hibBLgXhhojcgqR
         tn0W6WI9D3VzmFBf2bIbo7UvWJvO3C7eDta4uqnexx2KZBCgFPk7l2UmJ6LO/qoTvbr4
         TJWNGmjuDe3wvJ9o49G1RK0A0qC6XsaCP12K8r00pnRFBlCa+P0+QsFX67rfCI10EqDF
         2publKEpaeat24k2yCWVY/UP+1Pi/1eaH5kEbShB5TF4MdYaIWSeynWaRFHYJByChctb
         6pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746017633; x=1746622433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU1/SOmNaSIoaOP5Y27zEp7SD6Xio7q26DsiVHZeov4=;
        b=jvvVgMNExQxGmkxSAUl8q3LIjLfy9WmY8ducU0zpSlxsmUJ2Ig6dwFtD2LDPR9JlbU
         Z9hX+5GubnSJCEBR24iPjD3GxPcI13PRYUWblLQT6NJHWEwRO+QY2NtZIKWKtjUkIuhw
         xhw1hthM+YEKAr15uYhxW+CjBuyhGHBXe3KK8yMq/Yjjh7llbZdH84nZ0/8Xf23OXJIZ
         yEBFCuLBHFYQ1dh0K6+qOiQESVa5ts+mDSes/heOkQCbgL8kl8mhT+d6CgGJO5VpyEPD
         x3XLrMNuaeTDF015JnGRKtX48XQJuIoKl9mBqhMwBwqSJVCrrRNs801cgBj7DttSM6/h
         UGkw==
X-Forwarded-Encrypted: i=1; AJvYcCUNfqwGFKjraKO0MVuLgsx/BKFxWVZJbRMH4VASOb7HiqkuFSOXdyISS66iSimf1Qv6YR8WKxxea0UlyHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJ10DFhf8iPn1x5Yx6fMXfKYpC7yCR4fVeV3+A4aFgn24cliJ
	l9gWmbqZV0wwIiVkhvj8VbGANNkWJlYPkQihSYILbUvC1LyqBOG+MgGI1wSY9h2qgWKHPQnh1B1
	MaF3vsBKqfaOIcHr89MPNiu3GJaXq4IWvicsCLg==
X-Gm-Gg: ASbGnctEnhDP2IjCJ1sNSSOGy0mTgfInSgNE7o1B4N5mWQD01e/4oczWVVIh/XebJyr
	oD87Xb436tyOnlnvhSeMRXT6284j6c6wfOFRoGZ0bG+iQrsqyODGQF+0EFlZK6YzNsH/At5WUeW
	5zjs29ry1R4ZOrmqihf6QI
X-Google-Smtp-Source: AGHT+IG9qpcftd1aayWu9vFb4z/gWoKjR7q12+JoPdMxvKpLqxOLyOzue9OLcoE6x4sfYxG3ywWV9sCyO5W7RkUtb3Q=
X-Received: by 2002:a17:907:748:b0:acb:aa43:e82d with SMTP id
 a640c23a62f3a-acedf65b742mr271332566b.3.1746017633009; Wed, 30 Apr 2025
 05:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429151800.649010-1-neelx@suse.com> <CAL3q7H7WPE+26v1uCKa5C=BwcGpUN3OjnaPUkexPGD=mpJbkSA@mail.gmail.com>
 <CAPjX3FevwHRzyHzgLjcZ8reHtJ3isw3eREYrMvNCPLMDR=NJ4g@mail.gmail.com>
 <CAL3q7H56LC5ro+oshGaVVCV9Gvxfnz4dLaq6bwVW=t0P=tLUCg@mail.gmail.com>
 <CAPjX3Fe3BZ8OB2ZVMn58pY5E9k9j=uNAmuqM4R1tO=sPvx7-pA@mail.gmail.com>
 <CAL3q7H5Bzvew9kGXBRLJNtZm+0_eMOyrgUvC1ZK544DunAPEsA@mail.gmail.com>
 <CAPjX3FcDrr7D7nwh3=fyyOCxnp0iv+jeyPcGRX+gpw9zGHJ3vA@mail.gmail.com> <CAL3q7H5TVPG-KiwZfEmndAQh8g+CT1tMPSYcT1Omhc3om6EHEg@mail.gmail.com>
In-Reply-To: <CAL3q7H5TVPG-KiwZfEmndAQh8g+CT1tMPSYcT1Omhc3om6EHEg@mail.gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 30 Apr 2025 14:53:42 +0200
X-Gm-Features: ATxdqUHcnnktzz_nyjFwpopx0IbJ2raQjutFLzw5OVpk3l9FdukKyXPjbNQFZag
Message-ID: <CAPjX3FfJqH9ErubwMkWfjYTZr6f0vFfShu=JghxHqZ4aVbNK3g@mail.gmail.com>
Subject: Re: [PATCH] btrfs: remove extent buffer's redundant `len` member field
To: Filipe Manana <fdmanana@kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Apr 2025 at 14:34, Filipe Manana <fdmanana@kernel.org> wrote:
>
> On Wed, Apr 30, 2025 at 1:06=E2=80=AFPM Daniel Vacek <neelx@suse.com> wro=
te:
> >
> > On Wed, 30 Apr 2025 at 12:26, Filipe Manana <fdmanana@kernel.org> wrote=
:
> > >
> > > On Wed, Apr 30, 2025 at 9:50=E2=80=AFAM Daniel Vacek <neelx@suse.com>=
 wrote:
> > > >
> > > > On Wed, 30 Apr 2025 at 10:34, Filipe Manana <fdmanana@kernel.org> w=
rote:
> > > > >
> > > > > On Wed, Apr 30, 2025 at 9:26=E2=80=AFAM Daniel Vacek <neelx@suse.=
com> wrote:
> > > > > >
> > > > > > On Wed, 30 Apr 2025 at 10:06, Filipe Manana <fdmanana@kernel.or=
g> wrote:
> > > > > > >
> > > > > > > On Tue, Apr 29, 2025 at 4:19=E2=80=AFPM Daniel Vacek <neelx@s=
use.com> wrote:
> > > > > > > >
> > > > > > > > Even super block nowadays uses nodesize for eb->len. This i=
s since commits
> > > > > > > >
> > > > > > > > 551561c34663 ("btrfs: don't pass nodesize to __alloc_extent=
_buffer()")
> > > > > > > > da17066c4047 ("btrfs: pull node/sector/stripe sizes out of =
root and into fs_info")
> > > > > > > > ce3e69847e3e ("btrfs: sink parameter len to alloc_extent_bu=
ffer")
> > > > > > > > a83fffb75d09 ("btrfs: sink blocksize parameter to btrfs_fin=
d_create_tree_block")
> > > > > > > >
> > > > > > > > With these the eb->len is not really useful anymore. Let's =
use the nodesize
> > > > > > > > directly where applicable.
> > > > > > > >
> > > > > > > > Signed-off-by: Daniel Vacek <neelx@suse.com>
> > > > > > > > ---
> > > > > > > > [RFC]
> > > > > > > >  * Shall the eb_len() helper better be called eb_nodesize()=
? Or even rather
> > > > > > > >    opencoded and not used at all?
> > ...
> > > > > > > > +static inline u32 eb_len(const struct extent_buffer *eb)
> > > > > > > > +{
> > > > > > > > +       return eb->fs_info->nodesize;
> > > > > > > > +}
> > > > > > >
> > > > > > > Please always add a "btrfs_" prefix to the name of exported f=
unctions.
> > > > > >
> > > > > > It's static inline, not exported. But I'm happy just opencoding=
 it
> > > > > > instead. Thanks.
> > > > >
> > > > > Exported in the sense that it's in a header and visible to any C =
files
> > > > > that include it, not in the sense of being exported with
> > > > > EXPORT_SYMBOL_GPL() for example.
> > > > > This is our coding style convention:
> > > > >
> > > > > https://btrfs.readthedocs.io/en/latest/dev/Development-notes.html=
#function-declarations
> > > > >
> > > > > static functions inside a C file can omit the prefix.
> > > >
> > > > Nah, thanks again. I was not aware of that. Will keep it in mind.
> > > >
> > > > Still, it doesn't make sense to me to be honest. I mean specificall=
y
> > > > with this example. The header file is also private to btrfs, no pub=
lic
> > > > API. Personally I wouldn't differentiate if it's a source or a head=
er
> > > > file. The code can be freely moved around. And with the prefix the
> > > > code would end up more bloated and less readable, IMO. But let's no=
t
> > > > start any flamewars here.
> > >
> > > I'd disagree about less readability. Reading code that calls a
> > > function with the btrfs prefix makes it clear it's a btrfs specific
> > > function.
> > > Looking at ext4 and xfs, functions declared or defined in their
> > > headers have a "ext4_", "ext_" or "xfs_" prefix.
> >
> > I see. Makes sense.
> > Does this also apply to preprocessor macros? I don't see them
> > mentioned in the development notes.
> > I'm asking as I did consider using a macro which would look a bit
> > cleaner perhaps, just one line instead of four. But it would also miss
> > the type checking.
> > So I guess the naming convention should also apply to macros, right?
> >
> > Finally quickly checking I see a lot of functions like eg.
> > free_extent_buffer(), free_extent_buffer_stale() and many others
> > violating the rule. I guess we should also clean up and rename them,
> > right?
>
> Haven't you seen patchsets from me in the last few weeks renaming
> functions from extent-io-tree.h and extent_map.h?

Yeah, I noticed and I like them. That's great stuff. I think we're
moving in the right direction.

> You'll see examples of where the prefix is missing, and this happens
> for very old code, we rename things from time to time.
> In those two cases I was motivated due to the need to add more
> functions soon, or having added some new ones not long ago, to make
> everything consistent in those headers/modules by making sure all have
> the "btrfs_" prefix.
