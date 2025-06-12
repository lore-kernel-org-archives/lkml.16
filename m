Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5A23D2B3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734977; cv=none; b=insV1SQUR00q+Lb2ifBNYc/k04LuIwxTu7nPwq+R2Aawn7hcaJzXkiVTDjsoTM++30K6RA5WJS7HoTTJrd5MEjtkL0N9PjcI9y0iQogwJlOR9jiPNnm+6eJpesPUq7+f+bZwd1jhMoJSLzkjIFUQl4UjHO+SuJHhZ7ci6l1u/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734977; c=relaxed/simple;
	bh=tyaWXuJEscIM/pRJvevrANS+YajaEw5h4VbmA0cjUGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFqrs6sJ4qZHUjLXzKtWCiU+m/4kRwzJYTamb92QndYgSylxs4FkdU1PrC5SaxTpVBH2bgkNUaD9wMhXDp7glBJ1lFgqUKm0sEfYWi6/zb/cWbnbL3HMlT7oNa0Lf7/eTua3IVPPj2DIQ6MwOF+XJAM6QJWupjrczcxa5WY91X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N7QTZ2sl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N7QTZ2sl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad89333d603so199015066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749734973; x=1750339773; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OaCbwYcyztgsQSk4M0vxeNKM8wXA6XHC0XWXp5bFZsc=;
        b=N7QTZ2sl2heJpBsAnlU70B3xw5MkCUVa2MvooNCUhE7Ln74hN5Lc+G1rCcPnc/LHuV
         IuJwAqMvqFfqg1NeOMIoS3HMXSPyDg87dvTKRUdA1NbEj8Kz3lLhdscP2+z6eFkpD3vi
         8rDMzQ/0PMfD74Ck1F20lzQAQWo/ajiyft6XINiThKOOTBBxh/7se28A3wNUdo6ez72I
         slNe3nW7UvTVGOIWd1ryncu+5tBXvNGnNNXxZpmSTmErX0hGjtE3aoG0PrlvIZD4tynP
         brCAClikq8iRuhxBoEjlalPkospjrnH5HfpGeIwr/xpQFyIF7fqVcvh+lkXpKZtUZqXL
         5fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734973; x=1750339773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaCbwYcyztgsQSk4M0vxeNKM8wXA6XHC0XWXp5bFZsc=;
        b=LC2cvT8+82CjGvhJf4LMdm0kTzg5kUrWj1ea9zjT9NbyrFMof0yWkNGmYqdvHpdWxc
         33ocpqTJAO1m0FS9dWmSDN0iwjLLdflkqiKfajqme8waZLvCyfMuSllAz0kmbL0BolSH
         Oe5uAURVJsdcce9/PZBiJCkDjlqog1ViZEtnVlpdoJ5PymdfIgzKw0MwEzCCOQcMr42k
         oxjHzBALeH7Ep+PRhGnKFSDbikQmJW+g29armEUYiWl+rXEmdgMG2ourGGexM2YOFteF
         SqrIAa2w1SLyZfYnMu2iHbIlLG/r/mp/ip/Nnr9+nu5mrawYHQI+gSvcetUXJeyyIL0B
         Dyng==
X-Forwarded-Encrypted: i=1; AJvYcCXUbcIy93piSP0yhrRfkSISmH51XUITaBLnKEASRIsmCDBTosxCx2vM1pWAUiKVq80T19xdsUahV07E7MU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcgz69r6LtN6EjcfhNMef6ygFYgeiQOZ780zEG9cskEQciK7P
	Hywk77CUcDjc0BOM54UlxC9YA9xvCCE+zBAsaY5Ne79VJ2eVjGqk/19XLG9Npl006FC6bonX0xx
	BWHz4LHXSu92TPkuSLOBqj29aT/vrFuNybCRqObd/qQ==
X-Gm-Gg: ASbGncuwHlZJx9/9E+BTBb9TZpDJN7ENO0P9RaUkcPcdgUO2kLdQ47uvucm9bxArqE1
	Gmh6YaqXTf2UitHub6NP1TeucvHx616e2BBmqGZl+9Stqe0+SQ3JVb+txcgyvQA+KSxoYrS+lL7
	vqr+FktLGZPg52Gh5TQwY6n9nCZh24X6g60RPhOfgkpg==
X-Google-Smtp-Source: AGHT+IFGzGuDldvCwIGTPyVY/Q1f+5J2pGNKIoR0uw4vF1eEfVN2+qQHJPAY5DSSkd6e4ABDxQQq7ZK6AMhN3exyrJM=
X-Received: by 2002:a17:906:4796:b0:ad5:78ca:2126 with SMTP id
 a640c23a62f3a-ade89855d42mr727863366b.59.1749734973378; Thu, 12 Jun 2025
 06:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602155320.1854888-1-neelx@suse.com> <20250602155320.1854888-3-neelx@suse.com>
 <20250602172904.GE4037@twin.jikos.cz>
In-Reply-To: <20250602172904.GE4037@twin.jikos.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Thu, 12 Jun 2025 15:29:21 +0200
X-Gm-Features: AX0GCFsfTbBiHDmM72eeEGEjMZ4pxvPRrfO66llnHwT1xiVFoRv5Mu6oDVr90v0
Message-ID: <CAPjX3FdyMGKGFch-k=CmOD7wP_as_iaB9hmnbbui5=off+m+iQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] btrfs: harden parsing of compress mount options
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Nick Terrell <terrelln@fb.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 19:29, David Sterba <dsterba@suse.cz> wrote:
>
> On Mon, Jun 02, 2025 at 05:53:19PM +0200, Daniel Vacek wrote:
> > Btrfs happily but incorrectly accepts the `-o compress=zlib+foo` and similar
> > options with any random suffix.
> >
> > Fix that by explicitly checking the end of the strings.
> >
> > Signed-off-by: Daniel Vacek <neelx@suse.com>
> > ---
> > v3 changes: Split into two patches to ease backporting,
> >             no functional changes.
> >
> >  fs/btrfs/super.c | 26 +++++++++++++++++++-------
> >  1 file changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
> > index 6291ab45ab2a5..4510c5f7a785e 100644
> > --- a/fs/btrfs/super.c
> > +++ b/fs/btrfs/super.c
> > @@ -270,9 +270,20 @@ static inline blk_mode_t btrfs_open_mode(struct fs_context *fc)
> >       return sb_open_mode(fc->sb_flags) & ~BLK_OPEN_RESTRICT_WRITES;
> >  }
> >
> > +static bool btrfs_match_compress_type(char *string, char *type, bool may_have_level)
>
> const also here, string, type
>
> > +{
> > +     int len = strlen(type);
> > +
> > +     return strncmp(string, type, len) == 0 &&
> > +             ((may_have_level && string[len] == ':') ||
> > +                                 string[len] == '\0');
> > +}
> > +
> >  static int btrfs_parse_compress(struct btrfs_fs_context *ctx,
> >                               struct fs_parameter *param, int opt)
> >  {
> > +     char *string = param->string;
>
> and here

Can be done at merge time. Or do you want a re-send?


> > +
> >       /*
> >        * Provide the same semantics as older kernels that don't use fs
> >        * context, specifying the "compress" option clears
