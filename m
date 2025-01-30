Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B531A8F74
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738234884; cv=none; b=pLAQbRyjpriXVIvFkOFzlUAwlP6WOJi6pnnYRUZX8LtNZKeAfQglcgYuc62v6x+lJ8OL8NJTPdCcYgwn26Z9jTwXI4hjdrHxW0+Yi13yzNzDkR1ZnCi60zWCkPhESPJ4bN6enI+q9ozQALIvnkJAnfyMMdn3CTjyLZSShqogfYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738234884; c=relaxed/simple;
	bh=uTEtjxFBWxhrssyPGXwDQuCulRsA9KSYjyUq1oLYWqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNrXJOfREyVzOSeVlFqFPiv9eYT/6z+TFUX4/JSiQetNr2sLJr88H+QcI3emAX3mbZYe1rwfrxmO6k6/Kwii1IO3NyLHvR+JKkAfEaTKxJWnhalZ6AmvDg9/fO6WRkJgbNIEa5lh7X+JPEe8OTg3/47Bj5YnTODGchARHWsG9zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g++2xj58; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g++2xj58"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5db6890b64eso1218458a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738234881; x=1738839681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTEtjxFBWxhrssyPGXwDQuCulRsA9KSYjyUq1oLYWqI=;
        b=g++2xj580X7E977uBzzmKJFgrAp4NRAa1x7RpOIneIWro/MiGeXbXIIH/C7S1ni/9h
         T68JccGBspnVqUaTVhf5xeCd+9h9xo1/nxd0o4p2s/+bEE2vxjPxB5mDol7Ikk/202Ol
         cRVmHIVll+OIuAZiRyS+4IyKFuVoUiE8BylidnUKEpuVb+3EZGdXCy9aCSGE4vGPuJYb
         MkZnfIt28Qv6byodnsb0RiVPNFCLXKRvaIMTdEZgX4UHYIL6SEY6B3zOvW5iavR1mri0
         k/yZRWDTQRaP8GupJhZ0JESGNoYnH5VjmSiSnwW5d2G8JQbTmaA1uWRhMM9MZKeNp+YY
         5qLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738234881; x=1738839681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTEtjxFBWxhrssyPGXwDQuCulRsA9KSYjyUq1oLYWqI=;
        b=IMMvsY76GryH776Y0q4G6qp8691I+G2s+eKYzicE9UQv3czUIwj31Fsk5p4LE4bIkh
         5gu+am4/Aj7F25W3t+VC36RvCd2Z1bcBRU0AG1xKlqDfj4ADMvtgF3ulQ/qzLWAzsSQZ
         D0xcvlX9ufCXCMdv127TpURL8JYkJUlh3vXK1GGf5YM5YBrMD6lGRIvkVIYynShukeFN
         WoYEXw+oyvS0OFxt6/tHxZxNIdb/ORaR9ZicPEdL1LvpPDz0QY1HnWEEMQ4KYuRxUkH2
         FZ33cZ5aXeY2zikEMua/XbCasD8V3yB+2dnne1vw7s3p0ulvpub0ySG3SugvcG9Z+kG4
         mKsg==
X-Forwarded-Encrypted: i=1; AJvYcCWlquTS8NLf5zgK0KEOK8mROEXbAstTc1IruWAQtK8L1TBoHadxQeT5fge6+1NklqwzZJLoAcoMdPxYi8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzbMj9asWVijSwQeVlmpyJlNNi6el2PKuDv6WZoWL5obw0xWO
	dOZia/AvxMizVEAeREggYrNzeyZe3HuQkgMV9qsSLSIzg+p58C5PvwcnuuFjJCinDNjoB5b8wFP
	CL7StkaG8fdkvMLUMu2LGu5v6iTg=
X-Gm-Gg: ASbGncsW2Mb2ArNWTrnw/l+55JbHvtFKKfz02V7ta503Nwkl/TQ6ArURufOh2kv04rJ
	fmCWO8/IAWq8hlQCcJ8Vxv/gW9M2MwsgFzTIX6jWRR5ICXIDLP4/cTx2T67xRO6s05kdrRher
X-Google-Smtp-Source: AGHT+IHFTFYr4SZCDOGixDObyUCjGQinOKCsn1ZA2LR6h/mKi3JaxxP5Q5nsDvSNUwcjkFGuTJMuuxVl7p/pk50MS7Q=
X-Received: by 2002:a05:6402:1ec1:b0:5dc:100c:1567 with SMTP id
 4fb4d7f45d1cf-5dc5efc5e47mr6075154a12.15.1738234879131; Thu, 30 Jan 2025
 03:01:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128160743.3142544-1-mjguzik@gmail.com> <20250128182932.GC24845@redhat.com>
 <CAGudoHGqKgD+1VT2ELd-KZfAZn11K3=rGnhP8FwJJc56+-1G6A@mail.gmail.com> <20250128192224.GD24845@redhat.com>
In-Reply-To: <20250128192224.GD24845@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 30 Jan 2025 12:01:05 +0100
X-Gm-Features: AWEUYZllMDk_nuIEYPxhctRYXSKBiTMr_ALLK2SDC0mqnQ9op3s_ECgKNubF9rY
Message-ID: <CAGudoHEFoM0BaA+CVfuVgR5MGE9mmsWhu-gMaE3-iRcwBvvcDQ@mail.gmail.com>
Subject: Re: [PATCH v2] exit: perform randomness and pid work without tasklist_lock
To: Oleg Nesterov <oleg@redhat.com>
Cc: brauner@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 8:22=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 01/28, Mateusz Guzik wrote:
> >
> > On Tue, Jan 28, 2025 at 7:30=E2=80=AFPM Oleg Nesterov <oleg@redhat.com>=
 wrote:
> > >
> > no problem, will send a v3 provided there are no issues reported
> > concerning the pid stuff
>
> Great, thanks.
>
> BTW, I didn't look at the pid stuff yet, I _feel_ that this can be simpli=
fied
> too, but I am already sleeping, most probably I am wrong.
>

I looked at pid code apart from the issue at hand.

It the lock protecting it uses irq disablement to guard against
tasklist_lock users coming from an interrupt.

AFAICS this can be legally arranged so that the pidmap_lock is *never*
taken while tasklist_lock is held.

so far the problematic ordering only stems from free_pid calls (not
only on exit), which can all be moved out.

this will reduce total tasklist_lock hold time *and* whack the irq
trip, speeding this up single-threaded

I'll hack it up when I get around to it, maybe this week.

btw, with the current patch when rolling with highly parallel thread
creation/destruction it is pidmap_lock which is the main bottleneck
instead of tasklist_lock

--=20
Mateusz Guzik <mjguzik gmail.com>
