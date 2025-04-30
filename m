Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9625A352
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014983; cv=none; b=YYM4CR/jggBz7G1kkXi33n+DXwjN6Gf8JsT5GB+qZ72UmYMisjK1sB6eV1EQg4HIHJ8D1o3KfS7FwO/Hsake3De0O0I1lsNHH39XZx3Xvf7QLaW21q9Fm2T2Jm3kpYSH+9gu/sruLw0dQzYeEKDrsUuMkm7JkfEc5HSVseqke6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014983; c=relaxed/simple;
	bh=8KldIvPyeyrNxgTI0ZsvmXUIoixPtf61rxatBYhk6W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYwlnMK137o0nBmfxhmqWfCwqkRjLD/IBAOLfKZShwXpQJdD7rpJ5nCbL5LbqHjei06EqfVbGnqCL+19JJhOmZzoGCBUWjG+HNO63l7JGiTx2Hy9PnLWrSA84aY/r5oeocUKITxG47oVVSx9mxO0oUI6snEJqeKnahE1JKiBXCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=hBoCpDVJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="hBoCpDVJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so1056769266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746014979; x=1746619779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yomRrib/ec+S+xnoz6mogpRGq964XEY/6Terik8eUrY=;
        b=hBoCpDVJmgXyJNqRnv5u11KkvKGC5kD5oLl6jEdhu0UB5CVSwp5S50aMwdx5yKMysv
         lR/hdsmAtvX1XnSgZ6bWsI2l23r+RvhmZrQBn/X67aRZhy917Iu6aoKdhYk7wQBMiwat
         RV8ibiNpOs3eKGgAI+Lh3Ru/RjkH5QZjZTqay/VNlrO1//523F0mtwS1C0o36mbIjNNV
         +gWayRe8o+wM7qOMgANlnLl7mV0tpnX1Dh9FedwLxQ9sQRzNE7tVZLOBhhyQW4/PH0lI
         VFKYhJDYOqU0AswwBRnjapU6GB8eMgW7bHXEiGvNEoFKo79fgYJLAdRbY8wxBPxWyD3t
         yDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014979; x=1746619779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yomRrib/ec+S+xnoz6mogpRGq964XEY/6Terik8eUrY=;
        b=gQNHge8FWzg7HcKZiVhiaEQopimBqCxAzT155//0vxZMx399bCQzf3VKrq3kK96m/E
         eQxzf3bG5+nrAcI3eM9G1KRdK684W+9dMvePhQo5svq1Lx1K7ngbgP5amR/1cpXN6FXO
         fnZDKNmy3ygTcqi8dt8YOF+JeruvDfcYzs6qEJWlECiUVUtAjnnxSEyidEkNAavdLObO
         /YSXs6/9lw82l8oPfZawAdRV2sO3Cgvdj1NDon1RKrnGg4znOI5bDd4pyXlEDJfpVLWF
         T3iYsswGFjLhiAEiMf90YlAyt8CtKDmXXWEBOfjTJ8QiOU8ucr/XfMmOHdkHxISS4U/R
         c9OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjNKA0hiF75t1f/lzkxzo2nGdjxcmKeqCv6um0iiOicAz5+jLXQnlGy4THPsLPFNhB0KUCOef3mCbNlq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6AceKYXWlXs3EZNM4kryfWgM1Cq6FC+G4ZxK/FLnZG/X29nq7
	V+axnV0SvurIOREq+e86xxYn2Py5P9pU0nadskEI1p0qWtSJcTJwIuvVsFtTuG8xyDiCneiLAL7
	v7E9mreN7t0GdEi8AVzGkj68hHp+BCg4Wj45VjA==
X-Gm-Gg: ASbGncsUK5CEyGMMH2PE0vPOE4vjQ6PQuUDhsclMm8TfFnJBd2/+Zp5/SOVqW0YOwXC
	xdtEl8sJ0dQgxUTXFYK7CYDTMQYjtlCaUEN+y4qwPDr25SI+QhkrGZar5RFg4MVKOexhm6yXsEm
	xtlaehAbLk0ian+wFTRu4d
X-Google-Smtp-Source: AGHT+IF582B4BNpnAWPeBIgXyE1DCKVvQmVItfAo4T9ZANlKsGl3EhfCKe59cp3JmShenfkdYaGJGiTgLiPA+rnFf7I=
X-Received: by 2002:a17:907:2da3:b0:ace:3a1b:d3d with SMTP id
 a640c23a62f3a-acedc57504amr337067266b.2.1746014979210; Wed, 30 Apr 2025
 05:09:39 -0700 (PDT)
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
 <CAL3q7H5Bzvew9kGXBRLJNtZm+0_eMOyrgUvC1ZK544DunAPEsA@mail.gmail.com> <aBIE28WHbC2jPkpz@fedora>
In-Reply-To: <aBIE28WHbC2jPkpz@fedora>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 30 Apr 2025 14:09:28 +0200
X-Gm-Features: ATxdqUHxbZOqrlJ4zSj6vUkQey8LaW6Z-7BefegTh3VgTrkADgDumoGT3bZ8PZc
Message-ID: <CAPjX3FctaJkUwv3ZsEfuamBhLwD5=MzoyWAotV2CN9-eJrxWZQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: remove extent buffer's redundant `len` member field
To: Johannes Thumshirn <morbidrsa@gmail.com>
Cc: Filipe Manana <fdmanana@kernel.org>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Apr 2025 at 13:09, Johannes Thumshirn <morbidrsa@gmail.com> wrot=
e:
>
> On Wed, Apr 30, 2025 at 11:26:08AM +0100, Filipe Manana wrote:
> > On Wed, Apr 30, 2025 at 9:50=E2=80=AFAM Daniel Vacek <neelx@suse.com> w=
rote:
> > >
> > > Nah, thanks again. I was not aware of that. Will keep it in mind.
> > >
> > > Still, it doesn't make sense to me to be honest. I mean specifically
> > > with this example. The header file is also private to btrfs, no publi=
c
> > > API. Personally I wouldn't differentiate if it's a source or a header
> > > file. The code can be freely moved around. And with the prefix the
> > > code would end up more bloated and less readable, IMO. But let's not
> > > start any flamewars here.
> >
> > I'd disagree about less readability. Reading code that calls a
> > function with the btrfs prefix makes it clear it's a btrfs specific
> > function.
> > Looking at ext4 and xfs, functions declared or defined in their
> > headers have a "ext4_", "ext_" or "xfs_" prefix.
>
> To add my $.02 here, it is also a matter of namespacing. There's nothing =
more
> anoying than having two functions with the same name in different subsyst=
ems.
> IIRC we did have this with the in_range() function, that is available glo=
bally
> and there has been a btrfs specific as well.

Yeah, I've been there. Unloading debug symbols of some module(s) from
the debugger due to collisions/aliases. That indeed can be very
annoying.

> Byte,
>         Johannes
