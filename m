Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625C35948
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922882; cv=none; b=SrTfbZnerwbBKff6t5u4LiHobmTqqnKt8wEmar/FbpwCK4KOtHlccilypJ/zloVSFuMNO9UvKxszuPNXBXBbhbj8w5NO4PZXvLuR9S0ZJ0tWCJPpG2knRmrBZyB1WZ/2EzBeuu2Tz294oQjWafENTqCkNHV+o4qTjYOCfp50xMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922882; c=relaxed/simple;
	bh=N0OtCQ/wmluZjDQF0XCwJk0ra5ZW+8e9DBlEWE49myg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wo774uwUaosy0EVmADOK6TmtRuHc1FW0CRTqHpNH2mfNbM8ImNkWUbn4qKLTM0ae4v0z4FRYpt+uxxngkoDpBH8oImWHXF/0Fqzbf7IaqXqjJYFN/oHPA5Fl46Nk2aq8Cqg1A20U59MWIVs2t0NdUpRj3aKqEFRFJJmSnR72z/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neHC3YGH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neHC3YGH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1275154b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744922880; x=1745527680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsyUznqqCfi4i2SQdmivlu5NHQdFlcXIhsGSIh7PHa8=;
        b=neHC3YGH+73QRycp9ngWRMS/8/U1wzf7ZgmGh9RN0GraD2L/SxStYEEHSGaO6isF0a
         B+S3vE+n/wPffzlxk4/3RlhvqE5fBiBb9TMnnLF10pRVQRT7m8Q2gxUCBj/pETzsyy/b
         zs7dY36IIT37yH+CFGnQjUx+n4+HgKpHmT7AomOztPRWhVgyl2mVqLDPUvrI4egrNNfA
         8fzBGfIF9QMdJVZ8NLyIrzYJXyMQut0wpJsUkt1DpL7MxA6MohPD2elMvOnM3zJiqCDm
         7GPoDieghZfL/D0D76mD8syadPQ20OtQCaC8GtcIWKrRZu2y8yof4kx4PZj0h9OW/cgX
         IKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744922880; x=1745527680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsyUznqqCfi4i2SQdmivlu5NHQdFlcXIhsGSIh7PHa8=;
        b=aVw62JsVFpgrLOr2IZIfofQrJkZV7s2k3GiM0MAdXVEZ0csZ6ts04TxRB4avPfpJYl
         JSN3XnC/nwLymAYsusdwyt7lR8V618C+bDC+AG1skvux/m/Of1RH/WZykhTOH+hocRhM
         pZrCrrhqMgJcrBHxax8X1SJn7xYiPHlM2sVlsfg9StQyy34WSn12awPH56lEpdcWiuKN
         xq6cvU6ioLRDa6hKvX2zpEA+U4mz0j4Uj9OjFadbNvW47b3G03OkmVsCB9StwY3UxK2U
         i/GiAvb5wRfd/thi0r9ipsq6fF+kfYtJlcnr3f/VmPfmycNzU4uyij6SRUhoSwaXRxZE
         J2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVbWW2RRHRhNWsd1Epz9LqwN8AY+z+sPBjxQ2vbQ9Uk2vYwhGKjWQSsy6hU6oKMVpcbg4MS6fgxzsREu8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGnLnJBPFAYTUy44UEGJgRTYxjU28/xIRWT9fGxpdnb4rWlta/
	F6UkN2qCJAUoScUgfBwCWPbEfMsGkgZt+FP/+zUAH/83WK51pbG88iGzrsIX/izm5gGkOtTvucT
	Yvg/HAVheg8Dly+0O+huSvjOh+Fs=
X-Gm-Gg: ASbGncvLxa0A5COYcDilSVIKKMBMDhSImtQDzn1ZAWuX+5ZBDCX+PebUcr82RHNsgBw
	Lx7VCK4LtKLzAOi4ZsfIRjKy8vIqKmjSSp3pIkNlP7Vvp0kMQFEk70Hh70JM06MdfHqeTQLX/jL
	OWhW3uhaHRrX/Aw96LdFX3ot/Y+j+t8d975NwZdw==
X-Google-Smtp-Source: AGHT+IGkf09SLgRPWC20TV11LMw4EqhtPcAEX96o2A9jKGoNu1a05Gc9kqv8Ppmu44QBbwoG/+CIiEwBFzlP40dlJN4=
X-Received: by 2002:a05:6a00:ac0b:b0:736:a82a:58ad with SMTP id
 d2e1a72fcca58-73dc156a999mr310377b3a.15.1744922880183; Thu, 17 Apr 2025
 13:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417152808.722409-1-mykyta.yatsenko5@gmail.com> <CAEf4BzbVPQ=BjWztmEwBPRKHUwNfKBkS3kce-Rzka6zvbQeVpg@mail.gmail.com>
In-Reply-To: <CAEf4BzbVPQ=BjWztmEwBPRKHUwNfKBkS3kce-Rzka6zvbQeVpg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 17 Apr 2025 13:47:48 -0700
X-Gm-Features: ATxdqUEfmguRvvXaFJojHSceTsB5sS3hyibIXzxDMwO9_tjc8wqpOgu1m_hMy4Y
Message-ID: <CAEf4BzY7a2LadR58yaNAEjoXTFZuAEHzC=gDwv7-8D9y5BsRag@mail.gmail.com>
Subject: Re: [PATCH mm] maccess: fix strncpy_from_user_nofault empty string handling
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, rostedt@goodmis.org
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, mhiramat@kernel.org, 
	andrii@kernel.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	Mykyta Yatsenko <yatsenko@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 1:44=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Apr 17, 2025 at 8:28=E2=80=AFAM Mykyta Yatsenko
> <mykyta.yatsenko5@gmail.com> wrote:
> >
> > From: Mykyta Yatsenko <yatsenko@meta.com>
> >
> > strncpy_from_user_nofault should return the length of the copied string
> > including the trailing NUL, but if the argument unsafe_addr points to
> > an empty string ({'\0'}), the return value is 0.
> >
> > This happens as strncpy_from_user copies terminal symbol into dst
> > and returns 0 (as expected), but strncpy_from_user_nofault does not
> > modify ret as it is not equal to count and not greater than 0, so 0 is
> > returned, which contradicts the contract.
> >
> > Signed-off-by: Mykyta Yatsenko <yatsenko@meta.com>
> > ---
> >  kernel/trace/trace_events_filter.c | 10 ++++++++--
> >  mm/maccess.c                       |  2 +-
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_ev=
ents_filter.c
> > index 0993dfc1c5c1..86b7e5a4e235 100644
> > --- a/kernel/trace/trace_events_filter.c
> > +++ b/kernel/trace/trace_events_filter.c
> > @@ -800,6 +800,7 @@ static __always_inline char *test_string(char *str)
> >  {
> >         struct ustring_buffer *ubuf;
> >         char *kstr;
> > +       int cnt;
> >
> >         if (!ustring_per_cpu)
> >                 return NULL;
> > @@ -808,7 +809,9 @@ static __always_inline char *test_string(char *str)
> >         kstr =3D ubuf->buffer;
> >
> >         /* For safety, do not trust the string pointer */
> > -       if (!strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE))
> > +       cnt =3D strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE=
);
> > +       /* Return null if empty string or error */
> > +       if (cnt <=3D 1)
> >                 return NULL;
>
> I wouldn't touch this part and leave it up to Steven to fix (if he
> agrees it needs fixing). Current logic seems wrong already, as it
> won't correctly handle -EFAULT. And, on the other hand, there is
> nothing wrong or special about empty string, so I don't think it needs
> special handling. Let's drop these changes in trace_events_filter.c?

Actually, you are not even touching strncpy_from_kernel_nofault(), so
yeah, definitely let's not do this (at least not in this patch).

>
> >         return kstr;
> >  }
> > @@ -818,6 +821,7 @@ static __always_inline char *test_ustring(char *str=
)
> >         struct ustring_buffer *ubuf;
> >         char __user *ustr;
> >         char *kstr;
> > +       int cnt;
> >
> >         if (!ustring_per_cpu)
> >                 return NULL;
> > @@ -827,7 +831,9 @@ static __always_inline char *test_ustring(char *str=
)
> >
> >         /* user space address? */
> >         ustr =3D (char __user *)str;
> > -       if (!strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE))
> > +       cnt =3D strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE)=
;
> > +       /* Return null if empty string or error */
> > +       if (cnt <=3D 1)
> >                 return NULL;
>
> ditto
>
> >
> >         return kstr;
> > diff --git a/mm/maccess.c b/mm/maccess.c
> > index 8f0906180a94..831b4dd7296c 100644
> > --- a/mm/maccess.c
> > +++ b/mm/maccess.c
> > @@ -196,7 +196,7 @@ long strncpy_from_user_nofault(char *dst, const voi=
d __user *unsafe_addr,
> >         if (ret >=3D count) {
> >                 ret =3D count;
> >                 dst[ret - 1] =3D '\0';
> > -       } else if (ret > 0) {
> > +       } else if (ret >=3D 0) {
> >                 ret++;
> >         }
> >
>
> This part looks good and does indeed fix the issue. Good catch!
>
> Reviewed-by: Andrii Nakryiko <andrii@kernel.org>
>
> > --
> > 2.49.0
> >
