Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83071AAA11
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206048; cv=none; b=LOz5h0ubDiHWPNEuXW1tsSE+3C4AHg9f55tYsBM+FspBk6W5uG8vnkmBIgb3q6Fb/MNCPwSOc4DofO+GeVBUtkP0qVyxCBqk2ypIrkE0cMxiTmi+WfpfW/vIoJfb2A4GjIWEHYyQblsNInDF7GiarMumGC2+RvUOl8ys7Wpx/Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206048; c=relaxed/simple;
	bh=+tisnOclVQsYHBIjvjhwRd4abflWNX1BaIctjNGACVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4mc9ZEPtkUUeg+d+M9+6DC4Pbrg6VONSYx2xMDilC2lhemvYVsQ/x3vHvuy0mgQVOnv5lQ4z5L+K+41qSY5a9pxGhAZcz4/W+OOOLarnlzDFxrMVzT9GbWq1cl4Mrecbva13C6ylTXp1YKCSDWH0PIjKsi/Kwkfov2vDYkC4/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T5+d4s/P; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T5+d4s/P"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d8c4222fc9so9395ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746206046; x=1746810846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV5fuvy76SttlH7MdkhQWcs11FTnH359sbCYn+j7GwQ=;
        b=T5+d4s/PSLG6uSFTrfuYmyT1obXWs+bhFtWGZfk5NKmpb+LP3ydyAP3r8yAGcTcNER
         odF09y7VrqriGmV1ReQ8Js6/3ufgp9jtq6NVNmafkCwBF/+akhWn+uf0YKeqoXvFHgG7
         VeK77siIxehyJobc6wj8EHuKyCsf4JmSFFzjVJ5j6/fz/Ja1vmJwddRDmcZ4bZaQyOpp
         MJM6rIHc7oQv44bDRcWvg66NipNdP1Y8iIEtjWgfsTfZsaGfZOcxh2JqapdbO20ZMmSv
         RB89QQZ9o5Jc4M41rQX/s5683XyPACKNqhs4zZNv6+n83kmC0TVjMTNhWaQ5F0E3ANQk
         eiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746206046; x=1746810846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yV5fuvy76SttlH7MdkhQWcs11FTnH359sbCYn+j7GwQ=;
        b=oX+C1vu0sXPaNM4Wc7s6+s5Km3NmmC5wOs/33ahZDSKcah2550cxMZen7FaNDQBzGe
         SYf3EIDW32vsUug2+1qXgdpLD01yxI+TtxuGm0FbYG3Xoi38pSuOVCrqpqpUbIr17IC6
         c0adrZfXyblQnSnvoiDflRO1P2fvtqc1fIHsEY8wVSJFkFkmBwATXXx8TuIS4lC1iKKF
         Sa41rEJtEG5Q753Eyac5nyNgo0N9IzrTnhfnxBaCAnhOfU8RBepMU9gvdgPtGBIe+RtC
         qA0E/dJpcYuE1nbdLlKXmGjkK9dI0jsKpmXPeBxOmkcul0w3fwuHZrtTo5UjvGMqenzo
         aQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX63yV5vOdUSlhJLZRp7ApJQxYCVl2k5wYkklQW4yBBWb6C4Qyreq+OB/uuYxbZW2XlZly8uwTGjTXJS6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YytHmIdIu8vCXu+qpLks3sbESNIxM4As1sl6yI94IRbHXkrlJpw
	jj6YqO3bW1B5K4YfkS469Llp3M1BjXgZuJHoK5v4lh/1ol0I5h1u/k2nTx5kg+hL9bhaBmsK9l9
	9T4boeQcaYLo50GMWgiQ0kRv9N878X0W/i1Qp
X-Gm-Gg: ASbGncu7AVLz2HRnE0SiyHF3G6AZu70OCEKOv4DfCTvGD91B6+8VfOzzeXMZvcQ003+
	HqLr+30h2LpeYuTNuM+GybMsU7hLTKRgTAG6lpTvkUwBncK9Wz1yeYHMnX5lVyNsxEObQ6coF5P
	207DA2b3UhA3DQrHcbMqnOnx4=
X-Google-Smtp-Source: AGHT+IEub8QLzlaj65mxSGIeiFRXLJKydTOlpAm79ouvwbr5ORL/zUo+cncmiiwQVmkVHQM5sAir9AS3HVmLnAQCYEc=
X-Received: by 2002:a05:6e02:18c5:b0:3d3:d806:c65a with SMTP id
 e9e14a558f8ab-3d96f2f5315mr7883055ab.28.1746206045626; Fri, 02 May 2025
 10:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com> <20250430171534.132774-3-irogers@google.com>
 <aBTs6yvKlCYYgU2O@yury> <CAP-5=fXqLh7RdUok5oqVwyGOWCH3fktmVeECdi4ENBWnEHeJYQ@mail.gmail.com>
 <aBT5C81se-z-eQMe@yury>
In-Reply-To: <aBT5C81se-z-eQMe@yury>
From: Ian Rogers <irogers@google.com>
Date: Fri, 2 May 2025 10:13:54 -0700
X-Gm-Features: ATxdqUF9BCsiSEkGglaiG9Y2e76mPwgHhFaqnzzqxZ6ItKtUg0jsKsIok8y6QgQ
Message-ID: <CAP-5=fUx2+NaoHiNEqQzNPc7ODKaAM0e2fcf=O9XBC_r2HuPEw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 9:55=E2=80=AFAM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> On Fri, May 02, 2025 at 09:43:12AM -0700, Ian Rogers wrote:
> > On Fri, May 2, 2025 at 9:03=E2=80=AFAM Yury Norov <yury.norov@gmail.com=
> wrote:
> > >
> > > Hi Ian,
> > >
> > > On Wed, Apr 30, 2025 at 10:15:31AM -0700, Ian Rogers wrote:
> > > > The clang warning -Wshorten-64-to-32 can be useful to catch
> > > > inadvertent truncation. In some instances this truncation can lead =
to
> > > > changing the sign of a result, for example, truncation to return an
> > > > int to fit a sort routine. Silence the warning by making the implic=
it
> > > > truncation explicit. This isn't to say the code is currently incorr=
ect
> > > > but without silencing the warning it is hard to spot the erroneous
> > > > cases.
> > > >
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > > ---
> > > >  include/linux/bitmap.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> > > > index 595217b7a6e7..4395e0a618f4 100644
> > > > --- a/include/linux/bitmap.h
> > > > +++ b/include/linux/bitmap.h
> > > > @@ -442,7 +442,7 @@ static __always_inline
> > > >  unsigned int bitmap_weight(const unsigned long *src, unsigned int =
nbits)
> > > >  {
> > > >       if (small_const_nbits(nbits))
> > > > -             return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbit=
s));
> > > > +             return (int)hweight_long(*src & BITMAP_LAST_WORD_MASK=
(nbits));
> > >
> > > This should return unsigned int, I guess?
> >
> > Hi Yury, I don't disagree. The issue there is that this could break
> > printf flags, etc. reliant on the return type. I've tried to keep the
> > patch minimal in this regard.
>
> Not sure I understand...
>
> I mean just
>         return (unsigned int)hweight_long(...);
>
> because the bitmap_weight return type is unsigned int. Do I miss
> something?

Oh sorry, my misunderstanding.

> > > Also, most of the functions you touch here have their copies in tools=
.
> > > Can you please keep them synchronized?
> >
> > Yes, I do most of my work on the perf tool in the tools directory and
> > these patches come from adding -Wshorten-64-to-32 there due to a bug
> > found in ARM code that -Wshorten-64-to-32 would have caught:
> > https://lore.kernel.org/lkml/20250331172759.115604-1-leo.yan@arm.com/
> > The most recent patch series for tools is:
> > https://lore.kernel.org/linux-perf-users/20250430175036.184610-1-iroger=
s@google.com/
> > However, I wanted to get the kernel versions of these headers agreed
> > before syncing them into the tools directory.
>
> Yes, I'm in CC for that series, but I didn't find the changes for
> bitmap_weight(), fls64() and other functions you touch in this series.
> Anyways, it would be logical to sync tools with the mother kernel in
> the same series.

Ok, I'll add it. Fwiw, I'm not particularly fond of syncing the files
as it's not clear how to do it and keep the attribution/changes clear.
I've patches to do things like make the tools/include more hermetic,
but they've died a death on LKML:
https://lore.kernel.org/lkml/20201015223119.1712121-1-irogers@google.com/
Tbh, I want to completely change how tools/include works as perf and
other things casually use -I into the tools/include and
tools/include/uapi directories meaning strange things like the types.h
in these things is usually the linux/types.h rather than
uapi/linux/types.h. Amongst other things, the licenses on these files
are not the same. I think we should be building the
tools/include/linux and associated tools/lib files as if they were a
library and installing their headers as is done for libbpf, libsubcmd,
etc. The -I would then reflect the install_headers output path. I'm
less clear on the value of doing this for uapi.

Thanks,
Ian
