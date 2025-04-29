Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED19E2472AA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745946348; cv=none; b=XfpHhK/j/7EuFzVVIbMa7gtL63AHPRoASGZQBWqXDDcEfN7SL++Tl+KK7zZ/qa6J9GcNly2kUUK/zt/rzFd9/GlmvxForbS63RTcajPMhk6Gz7pq+1GeyJrFRSf0hphu5f6L+NT/ngbemxz9mTfLS7sic0JNocanhSlPUVEtJew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745946348; c=relaxed/simple;
	bh=ndyYgXMtb7/SpLwsS4MgsN9AVIBp4a8vdoyNnXRsn54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5OYRu8gFGOXJqNxGjqZDEAwH01FhYFjc6pPRMr8wxhT7Ete2194KLM+fsdWOAMoWkCNMUq0Yvt045e23lqLc7Z6xr2SLmRXhbLYNa7awwW4P/V1icMFStUDeKmZZ2wCjbSXItKw/0VJvomsxHV3vOq6KwqAYzRxTKDpvXAEhjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzQiXPx6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzQiXPx6"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so61814191fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745946345; x=1746551145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nixoEKveYRkijN72UU1tf5ZFT5NzXXCf08v3Ae/Qtxs=;
        b=dzQiXPx6tdEC1yDie99o/rL/X+118krCiuCi/H/7SM8CxDzJvaabvZK5/fLWnZrOsr
         RmPrt1twcIHtjHkxXkd3PgPj88ohoSGTjuZfW/0KmnyPirNTluaaJygRaMV7AkmpuEMf
         ZET1QoijKTKXLr3p3qLM3A5znYmVzeRUvGHvI4pVN9ye20fS1EeFiKfM28ybISKCRbDB
         KujRV7mIGPCKYBEJG1EvUqBD34IwXu4jXcJqKUizaJRE8XbF+TRlLohWVVsM4cjc6A7E
         7NElXjqxsh4nRggdW+ClFRNNWUkGKf1doYJXMz4BrN+vadK4t6Gv5YkECvNoEysMATBW
         Kkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745946345; x=1746551145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nixoEKveYRkijN72UU1tf5ZFT5NzXXCf08v3Ae/Qtxs=;
        b=vtlvNiS2U2rTw5LtpPsNFGOSihwIOZBkbUxEHS97e7I66SGevraAkGnrw1SB5q5k9f
         Tm7j9dGpvBwpGTIuIEzpLwhQvlpe5BzFkCM4BvJ/gxaFFad3WyvWniqnEYx6JAd7nMsr
         4nxsAr2JhWCC3YkYhzuRIqintjipab28qPU2UoXvKebrM1sy15eSYZHofkM8IW1VOKmN
         Eq1f24a5ralaef0Aes+mWhbqssngd0GObygfXbaD26WrJViGhYB/cHwaqjCzWbQLSV3u
         O1IgpkfYlkF9U6Ry0WpNgvhN83aiaH6sLc5fe7tHzFYFzCS9nZNcq2u9P7LOZKLTu2pD
         5wcg==
X-Forwarded-Encrypted: i=1; AJvYcCWUuzjQyr37tkWWJs2Pq4nrJ97v+TMjQGUq50X+t/bmIOm+zUht3wMa4fpJ5/I+/3giDiA+s0FvaZiHBrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7duz9baVoM2N1ARfBVGEZVdskakuN3KgxPlDbxguh8AlYf4pc
	d0pmXy+50lq8Qpo7hOUpkJP4CrS8eqda0mct4f92IJBtcRUr2BSFWlSV6on9Ijjp9Q7JPNa8nw6
	OQl07oFnzKGuJqLWsHHrcKlquBs0=
X-Gm-Gg: ASbGncvO34QZW7qsNwgRp24DnODUobze+VrTk64HeG0ZebSEWHqzk9LPR/C9u+RvbDm
	2yTNp00VP+UZFmPTBCBjGei+h3QJPYh9GGe6D3oJLSpmPJBUBD/MdweEQ6EPqNX31muGj5KCHlo
	WswN9qB7LYDX3YHGe7nS6s/w==
X-Google-Smtp-Source: AGHT+IHhbO4hQpJO+z+LjcPCFUIZuriAYuFLQ5bZ8IWzDDz+0w+cU6mtQjLfr9lHvCNIVChStR7SdqbgNapUdcnDnhE=
X-Received: by 2002:a05:651c:2222:b0:30d:626e:d004 with SMTP id
 38308e7fff4ca-319dc41c1a8mr41521711fa.20.1745946344851; Tue, 29 Apr 2025
 10:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231001131620.112484-1-ubizjak@gmail.com> <CAHk-=wg6P8pPg-x4BPUQj-wE0xC7HkGzFk89ftuji8MVo+RRxw@mail.gmail.com>
 <CAFULd4Y+HXuditB51Q0LznqiBsvxJr3BjEYvx4_224XmqrycCw@mail.gmail.com>
 <CAHk-=wh+cfn58XxMLnG6dH+Eb9-2dYfABXJF2FtSZ+vfqVvWzA@mail.gmail.com>
 <CAFULd4Y-gr+UAvi4m1-p4MnJyMv3NRcyH=TFLZfFfNngnE_Kpw@mail.gmail.com> <CAHk-=wi4ji10PR35r0FqiKA_XYO38gLbZmPN4SYursP9fiUcXQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi4ji10PR35r0FqiKA_XYO38gLbZmPN4SYursP9fiUcXQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 29 Apr 2025 19:05:33 +0200
X-Gm-Features: ATxdqUFRUBNfoogV2ETeevcCbRjSQ-oBEAumFWINtuarkGjR0jNUJfPJDK1TuxI
Message-ID: <CAFULd4ZfAjobU45POv0uSB73urVFa0kFX_35RNyHy3rf_kbFjg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/percpu: Use segment qualifiers
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Nadav Amit <nadav.amit@gmail.com>, 
	Brian Gerst <brgerst@gmail.com>, Denys Vlasenko <dvlasenk@redhat.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 6:50=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 29 Apr 2025 at 09:31, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > FYI, after GCC PR 111657 [1] was fixed, gcc-16 will generate the follow=
ing code:
>
> Well, that's certainly a lot better than the horrible byte-at-a-time loop=
.
>
> Did you verify doing a structure copy the other way?
>
> Because the segment override on 'rep movs' only works one way - it
> only affects the source, not the destination.
>
> So while
>
>       #include <string.h>
>       struct a { long arr[30]; };
>
>       __seg_fs struct a m;
>       void foo(struct a *dst) { *dst =3D m; }
>
> works with 'rep movs', changing it do do
>
>       __seg_fs struct a m;
>       void foo(struct a *src) { m =3D *src; }
>
> can only work with a loop of explicit stores.

True, the generated code due to mentioned HW limitation is then:

foo:
       xorl    %eax, %eax
.L2:
       movl    %eax, %edx
       addl    $8, %eax
       movq    (%rdi,%rdx), %rcx
       movq    %rcx, %fs:m(%rdx)
       cmpl    $240, %eax
       jb      .L2
       ret

which has some room for improvement, please see PR12000 [2].

[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120000

> And I see in the gcc bugzilla that some gcc developer was confused,
> and thought this was about calling "memcpy()" (which should complain
> about address spaces rather than generate code).
>
> But structure assignment is a different thing.

Yes, GCC won't even consider calling memcpy() for structure
assignments when any of the structures is in the non-default address
space.

Uros.
