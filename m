Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04803D6F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780583; cv=none; b=UB07gG791cVmKo9nLmo0j1sjPpS+JB/uGIL19MJUn2JvaDckWCT5b1nGgdChR+v4uz/j0R3ZJVV6okFD1ptivx4q1oWHTwVFMgfsV6i725BNWY5Hs2s3xvYW2cPhCGzmT+K+LwiG0StNEIRYshNBmrGUZusf/QxoHa0lffnmzgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780583; c=relaxed/simple;
	bh=HjdwWopL3+KNAiU+AwlxrvLUeWtJPmSCP1JudML+O20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9Jy8nmU8mkcnjfldVQpNqfzHSvz00XuYsD6rwiQk6NgQe8uYkfCrwFQmQL9xXqGj8X4oO9FzPgttkrJx4zioGiBMB3lECtO85HLj0VUK0d93ze3CyyhvNicydNurmdMdNWQDLCG4uTirRGP5ZNnZc3zh3lmEFG0gMeBDSTgOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKh5lpfb; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKh5lpfb"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c3bf231660so239882885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743780580; x=1744385380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZfJaXWQQXLNloYcFnObsdg4J1wfnipetY87c4ZgF5I=;
        b=GKh5lpfbG26Dla9CosqfXr2uldrd4zWv/y9uatoUawa4Dr9XGlprnp03Nn4s16HgOy
         /pAsxnDDkELSTHWy2gr1hr9ClCRTQlvCdn4gFl8En/hi8AsBFMlG6e0+lM5lIUYYGy62
         1RceCpiqCvXS/lO8eDTX9qwNM6H7UUnbUSkxyiGSVmf5DdsxnLTsMCHrP6TtR0h9c7MM
         30ajryFDMvF4shB+CwpBR3n8xgtc135dDu6rsBHPC6ed27XUQDNh7jNuflJ6yElfc6AO
         K+Fbc4xuq8XALk3wPKlMlOVxBIJIWYCdU6wChIQsqLDe1z+v7zS71UtSPHbamgrJ/xLQ
         gh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743780580; x=1744385380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZfJaXWQQXLNloYcFnObsdg4J1wfnipetY87c4ZgF5I=;
        b=WY4jb1NLZDvG0fKH4SaQSTW7l1BqbZuKIn70MKyahy+JkN/uNwwsVps3t/Bu82ksUc
         ptJLTGbss5bMpFmvbnJWY0/shmGYdigL3EJn4JE172fEFL6ZVTo1cS7pYVgX6BsgEPma
         QitTVkobd6g6JNb0S7pXDg/dY7zZ0YjyyJUPgFAJEvhzRNsP+9NGAAft4+aDnVRfWcE9
         vAIa4Y6fBw2sdZEcLqv+JPVOWOTTM30bIDnPsUtL785eNbegrKN9Zu0b6gfbJ8izXeQ4
         GKUQ6r5sCBIHft8NwNPl5RC0b3HkKw/Ri3lTUn/JSL4TZ1oIa7Rr5QCQDxfC8wWAJ3Ie
         EMbA==
X-Forwarded-Encrypted: i=1; AJvYcCXEHr3MJ1JDDatWbG1FR7i9k6pwHbqiWPeG7a22dDc2KtSowd7gZUxbV1QFuVQ4HTfFg0d5smcpFmkbMqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI7qPjAZkL82ieBrcUIlzlf4BiqEGPsUWiXk1fiOjSPKPrCP37
	0qE9RWr6nOVItygbswR+pPyFBoIdFmZBgkozFvvPqMsvW1uG6cwhy2C4u0bzlVkWu53kQ0cP6HJ
	/HFdE4zhyZseYumg9PO1gYTwUlP0=
X-Gm-Gg: ASbGncsI9wbCcqHDYGkjMRSqVMM1UEQccRe7G+Vt3Z+x0nWes6Dj/MJE2bdPVMcGDIy
	eyL/s0kEBc7ZVloBQxRqSJXqdaYTuBQnr+y9BwAFmVC1lTrXmObzgl29SZmVU5UEYC8E9oDCMAA
	mjRi66k8j+n56wRZgWoHOa0fcAfoTYVPggk0hgXHHvvnfFPA5Z4m4GPxn6Ww==
X-Google-Smtp-Source: AGHT+IHm7lyN0qi+1Nq0kz6GHTRjqT3eaA9a9CZ6vohCvgLExH0hf+Pe4PcXLc55uC7qXOyI+eE79CdP+mApgb81nSk=
X-Received: by 2002:ad4:5ce8:0:b0:6e8:fec9:87ff with SMTP id
 6a1803df08f44-6f01e7591b2mr62974286d6.23.1743780579696; Fri, 04 Apr 2025
 08:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fqj732chhrffec5hrvg5f7i5hqidgpdetldolyubj25jczq7ec@wj4bwu7psbwh> <20250404140628.2049848-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20250404140628.2049848-1-joshua.hahnjy@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 4 Apr 2025 08:29:28 -0700
X-Gm-Features: ATxdqUF83msa2ZHsH4C_adG3eFx7pC1hThgSJmpRBY5ApU5tqZZhLnneYHkWGYM
Message-ID: <CAKEwX=PWRefnvGEHE4=Peru88p-Y-351wgxRXV+POcA=m_kO5A@mail.gmail.com>
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Yosry Ahmed <yosryahmed@google.com>, 
	akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	david@ixit.cz, Minchan Kim <minchan@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 7:06=E2=80=AFAM Joshua Hahn <joshua.hahnjy@gmail.com=
> wrote:
>
> On Fri, 4 Apr 2025 10:46:22 +0900 Sergey Senozhatsky <senozhatsky@chromiu=
m.org> wrote:
>
> > On (25/04/03 13:38), Nhat Pham wrote:
> > > > Ultimately the goal is to prevent an incompressible page from hoard=
ing the
> > > > compression algorithm on multiple reclaim attempts, but if we are s=
pending
> > > > more time by allocating new pages... maybe this isn't the correct a=
pproach :(
> > >
> > > Hmmm, IIUC this problem also exists with zram, since zram allocates a
> > > PAGE_SIZE sized buffer to hold the original page's content. I will
> > > note though that zram seems to favor these kinds of pages for
> > > writeback :) Maybe this is why...?
> >
> > zram is a generic block device, it must store whatever comes in,
> > compressible or incompressible.  E.g. when we have, say, ext4
> > running atop of the zram device we cannot reject page stores.
> >
> > And you are right, when we use zram for swap, there is some benefit
> > in storing incompressible pages.  First, those pages are candidates
> > for zram writeback, which achieves the goal of removing the page from
> > RAM after all, we give up on the incompressible page reclamation with
> > "return it back to LRU" approach.  Second, on some zram setups we do
> > re-compression (with a slower and more efficient algorithm) and in
> > certain number of cases what is incompressible with the primary (fast)
> > algorithm is compressible with the secondary algorithm.
>
> Hello Sergey,
>
> Thank you for your insight, I did not know this is how zram handled
> incompressible pages. In the case of this prototype, I expected to see th=
e most
> gains from storing incompressible pages in the zswap LRU when writeback w=
as
> disabled (if writeback is enabled, then we expect to see less differences=
 with
> just writing the page back).
>
> On the note of trying a second compression algorithm -- do you know how m=
uch
> of the initially incompressible pages get compressed later? I can certain=
ly
> imagine that trying different compression algorithms makes a difference, =
I am
> wondering if zswap should attempt this as well, or if it is not worth spe=
nding
> even more CPU trying to re-comprses the page.

It wouldn't help us :) The algorithm we use, zstd, is usually already
the slow algorithm in this context. We can try higher levels of zstd,
but there are always data that are simply incompressible - think
random values, or memory already compressed by userspace.

Yeah we can target them for writeback to swap in zswap as well. It
wouldn't help your (micro)benchmark though, because IIRC you don't do
writeback and/or do not writeback before it is faulted back in :)

>
> Thank you again for your response! Have a great day : -)
> Joshua
>
> Sent using hkml (https://github.com/sjp38/hackermail)
>
