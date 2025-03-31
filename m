Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5C524F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425362; cv=none; b=ulUrUHfPKx6BxBYCT2VWybNHcivyf8gVlqCQKBSstorZdHVp4u9yw6e5PPrUyNJKg2guZooGyzqEpjaF7wk66DkB4R3s51J4Ou+C9olgjiTiI94Uyyn86ix3BUPqxMV2c9lFpyLhiwsCC/OQcSm+2R3bGoPqrn6/3qRJBI5rOow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425362; c=relaxed/simple;
	bh=e8e+ZLCe1/BC7oiKkwQqMWbwKPF2Ef+vtU3RbkXYK/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsIHP85zLs/kUTKLI0Q2tesW2UQgKa6BQE6FFc70XpueXIMik6d005Bi1+KlB+jBHODkj1Tfm2ZyUmYiLTuCnDobOTrUYQ21IF87SwC6hzYYXWAKMb5sKPhtGHl2xZtnyqO9OJerpBU1IZNhjxvMbNw6H8+XwgBYZ+VXBIv9H5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hwyAq8sz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hwyAq8sz"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so6978932a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743425360; x=1744030160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXfK9/CzmvNOHSqXAuOrYNlbjmDJeqXQ4wjHvzz2BV4=;
        b=hwyAq8sz5ZPTKHU6sDVnz8AKS5XON1P7bD5/wHQ0OZZUzmu7ScQK5jbO8HP2rm29dF
         8PSpSAmtpCXohWiheVoFvaQlWbdIekLsbnhiOQrROaJaWLfdkYP2Im32FYY2tuph0wu2
         c9m5G8BV2tAL+0prFJMH16+rB3MdjjCwKH4E8psnNP9J6XyRNf/KEGzCd/ltVJBkefK4
         xjQYYe42Uq1n9sk09yNGFndMerU7qA9re3AWrcVSMpownwicn/UN69TZ8+o43/69dtzl
         cJd/BuQEfRYn2rBsZnHdKBSiGbd3DQYb3FJVlUeg/TQIgZjgdOpBVo8YcwA6v2R/YU0T
         mmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743425360; x=1744030160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXfK9/CzmvNOHSqXAuOrYNlbjmDJeqXQ4wjHvzz2BV4=;
        b=Wv9OUI+3HAMvUOTZaitjRYxUIo1Dy9BcP7Y1g5znrCddhn0N5A3zB1hHPfmrUzXIi2
         3GRS5bV9n/qXZnrFQzDMXMruX9BUHBZjHVLJPs/343/wknZdViKyWobXI3zJPiP3eG1i
         ewxkAGKrW7Q6eKgZt00AucTF3p1broxfK2jtlr+0BxFtCdswGrzNNkCp5ZLIv1aXVH/p
         AY83LrfCc6oZny2La4eunuMMTTNBbMpCt4isMukblTloMeolI06OSY8pYVFggU0ZZrU2
         mgdRM79JtmbgzArjcUaAI48YCCtJ6a+He1vTcTTIU+5IOCjtyNDyP/RzOq98t4/MTuLp
         CERw==
X-Forwarded-Encrypted: i=1; AJvYcCVKximuBieyJd6Iaxo5t3UpJwCcFmSq6x7AKg4HC0L4VOD/2GS01WAVMr2A/5CC3tcRdJtjaTZ6j84yjV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFz5awQ8TNHNn8nvR4P7peq4fc6w4sUamX74ptD26Dk31uy3yW
	o/ePHFdNb6j0+NP2zj/EsN/egas5BXYNhnoTo4IlyduaaN8DC+8MJhuJWs+W4n3qOVmo7hHO4JT
	R1Hol+R6K64CAhaB+690IBazWm0ZZHA8Psirq
X-Gm-Gg: ASbGncukVv1T8mamzNByv1jpmxB9yrch0/BhKRMXx4v2012FzOIkWhMYDhqJrR5LuHZ
	4dz/RaEOu+Zhs9JZHzypHxKyNZYvD6HrkCmtkB1iV18RtUjf33CQTS4NcISYGCU/F7xpjuDXqqh
	AJ6jZHEY41iiexG2qK8iyL/Y2niC6prZW5G65t2Zhd3qMr6s5eM0G1
X-Google-Smtp-Source: AGHT+IEuo0GwyHsj1Yfg/oHEVZUEu0Eq1NSgwkxD8nIvU62R7F/L2ivlqyMpAatSmy/sTVD11f/BHYP+bF+iZz6REw4=
X-Received: by 2002:a17:90b:1b0f:b0:2ff:5e4e:861 with SMTP id
 98e67ed59e1d1-305321653f4mr14556436a91.24.1743425359977; Mon, 31 Mar 2025
 05:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67e57c41.050a0220.2f068f.0034.GAE@google.com> <241600.1743418721@warthog.procyon.org.uk>
In-Reply-To: <241600.1743418721@warthog.procyon.org.uk>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 31 Mar 2025 14:49:08 +0200
X-Gm-Features: AQ5f1Jq7LGEiAfaquUrRoAilTtpSdAXsBTPIoQ20NUDfCVi_3LPGk6RVYz2JPM4
Message-ID: <CANp29Y6gGYaQVeMHciMF5WrfueHZyWx+MJ_U4ccgJQrUyQUwog@mail.gmail.com>
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid
 context in __alloc_frozen_pages_noprof
To: David Howells <dhowells@redhat.com>
Cc: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thanks for letting us know!

I've left a note in our issue tracker:
https://github.com/google/syzkaller/issues/1020#issuecomment-2766118626

On Mon, Mar 31, 2025 at 12:58=E2=80=AFPM 'David Howells' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> Note to syzbot maintainers: the C test program contains a compressed ext3
> image and decompression code that I think is entirely unnecessary.  All i=
t
> does is provide a directory that the afs dynroot can be mounted upon.
>
> This is the only bit of the test that is actually necessary:
>
>   NONFAILING(memcpy((void*)0x2000000001c0, "./file0\000", 8));
>   NONFAILING(memcpy((void*)0x2000000002c0, "afs\000", 4));
>   NONFAILING(memcpy((void*)0x200000000400, "dyn", 3));
>   NONFAILING(*(uint8_t*)0x200000000403 =3D 0x2c);
>   NONFAILING(*(uint8_t*)0x200000000404 =3D 0);
>   syscall(__NR_mount, /*src=3D*/0ul, /*dst=3D*/0x2000000001c0ul,
>           /*type=3D*/0x2000000002c0ul, /*flags=3D*/0ul, /*opts=3D*/0x2000=
00000400ul);
>   NONFAILING(memcpy((void*)0x2000000000c0, "./file0\000", 8));
>   syscall(__NR_chdir, /*dir=3D*/0x2000000000c0ul);
>   NONFAILING(memcpy((void*)0x200000000240, "./file1\000", 8));
>   syscall(__NR_lstat, /*file=3D*/0x200000000240ul, /*statbuf=3D*/0ul);
>   NONFAILING(memcpy((void*)0x2000000000c0, ".\000", 2));
>   res =3D syscall(__NR_open, /*file=3D*/0x2000000000c0ul, /*flags=3D*/0ul=
,
>                 /*mode=3D*/0ul);
>   if (res !=3D -1)
>     r[0] =3D res;
>   syscall(__NR_getdents, /*fd=3D*/r[0], /*ent=3D*/0x200000001fc0ul,
>           /*count=3D*/0xb8ul);
>
> Basically:
>
>   mount(NULL, "./file0", "afs", 0, "dyn,") =3D 0
>   chdir("./file0")                  =3D 0
>   lstat("./file1", NULL)            =3D -1 EFAULT (Bad address)
>   open(".", O_RDONLY)               =3D 4
>   getdents(4, 0x200000001fc0 /* 5 entries */, 184) =3D 168
>
> David
>

--=20
Aleksandr
