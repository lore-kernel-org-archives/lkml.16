Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004A27FB38
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452605; cv=none; b=PU6Y3edJhDd90bGLXTQFYSVZuY/la2LIVAZJmMN35iXUKk5GRL6i/fFK92LcoQR3P+WtAnBDMulRoOHtQekFSbOrn/rxH0ZOR7YiH1k/ustBVbUNApto/puLLoAwuoTXZ1OpEinYsbkeowdulw+Hl8xwMYC0wDR3TBbHabdtlmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452605; c=relaxed/simple;
	bh=rAIUwE+SteEONfGEH8/2EWu3SKgU8HvraH4SbnWqTn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AA8gANHDo2i3lppe3biHga6tAOi9UTT84AICn3PI6LQ7Tuzx4OFfdycRXNV5Wwoewk34L5+c0UQArAoLrIDFGfjFGnYn0fk0HYpGhfSMch4Git2fCRngVnGXR/9T3hc/qQe4QA50kKLz8NUfPEUtOZZtZJyhd79+jah401093jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E2dZUTgm; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E2dZUTgm"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8731c4ba046so356683339f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 00:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749452603; x=1750057403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxn0gf5DjkiekmGDoc8f+jiCNw9RjSzuhtY2t6W/Yig=;
        b=E2dZUTgmYqwPpY0sJYfla/6Y0U06iKq80AB2NfmHG+L7bCv1EiA3hkMDijGSjHy2jk
         iC+cttcRAmdJ9sEwUFrL7/XQ63nN5JeyQNRomG0Q/djl6wxaIAUETmEiSV7/nNa4UsqZ
         I4ZJKL4dcFz2cn7gOlXrYcFw1DvPYMMs+ZTlHRbRxA3ao1UmKpcEHAJBNg3eX/IT7cqz
         I7+gf+pu3pKvxHrfRU3ijWb8GIO8mWPwH9Z3OG2uL2VmV/ErChAIaw9yZw8NhT/SGLH0
         RdGHriuPPHVmVC+4firN8xaEvkkB7RiX6zE/QlTdhckfCXSnIUlVNFrgPWLqG4cMtE4l
         93pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749452603; x=1750057403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxn0gf5DjkiekmGDoc8f+jiCNw9RjSzuhtY2t6W/Yig=;
        b=BB/ibidd+aabHsNu43lRcx2Kaa6Bvreh2UscB2XAhuMQFMqfbgXU+f5i9h3Ekz7zo+
         /DVo+BEtT4wJwpWfBHjyURyJugmEqcMkr9bhcEZAsjRUR6TsoB+oP8LIYfmP8dZxDF5p
         IUKchdBFbd7Sjl35MnLSd561HuBeh36/rtOZSLMRdpCmu33dbBRtGDTYihTRF4f/RD6X
         U8fJoGUzS968qu/QAT6hDAd5WDGhIswH2Fpcw+F8bKWjc7dplkq9HhVLZaIw5r1UNsGq
         lz+xk6FEGjR8Bxtj6fDQ4U9USX0YUIn7wzQvVi+iowwI+955In5JRmYyYN7EBm9n+8UR
         EbHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXyfu3JAXMf0vqNVlbNnyC0YogUB3zr+Fcy/2pYG/AdT7zlTFpaJLQpRbJ/+/iWYwNGhd6excK8+CDpLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlZ05OvWUzFNLULU/os4uTGb9Y9BTwgrbCMu2JZvrCKHSB1BRB
	Tb1ml5XhsLI9wE4ITYZZt3+WugfewxAdqJQlLaV50WWjQLjJMlest7raqWQchM6e1OeiEbEzkoQ
	P1gcWXqHC8ODQEsbxWMriObrk0kQgUq5x0x+D1iKe+pllYwYiDAGhB432qow=
X-Gm-Gg: ASbGncvkqZ69hKN02x8Y62Q4iKOgP1MsS/wtICscC8U3yeem3J4qwv1dgv/Zj34FG2l
	BTyGsRTn5/3yOw538dC6ZA20+NPbNeG9oPPDOpvFwV17ErjtLe4QVd3SseTeMXTjl+B5zl+Are+
	hspGob6Jubrli70xRtsRHr2PDJCXGSqNWWshZhwKsnQ+G0C4RgNEFpaICXnqHoK/EvjRDgX0d2m
	Pj6
X-Google-Smtp-Source: AGHT+IGe/4/44D/ghxEowOkcRodziGm99URjyJEhwDGnJ1beM5CL7lH4P2Iro03Zrvx61SWSJqecABON5p5OEInqeUs=
X-Received: by 2002:a17:90b:224c:b0:311:e8cc:4248 with SMTP id
 98e67ed59e1d1-31347797dc1mr18023465a91.33.1749452591283; Mon, 09 Jun 2025
 00:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6745a8df.050a0220.1286eb.0015.GAE@google.com> <684650c6.050a0220.d8705.0018.GAE@google.com>
 <esjz6hewatxgaiqdluqf2sdorpybqxcwr4c77y2fozs6plj3yx@bkpt7rrtzdid>
In-Reply-To: <esjz6hewatxgaiqdluqf2sdorpybqxcwr4c77y2fozs6plj3yx@bkpt7rrtzdid>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 9 Jun 2025 09:02:59 +0200
X-Gm-Features: AX0GCFu11bVvrlwk_kziMotGT1GDhGmAjiJrfo_A6N8T_GTNzVdIJee0BK1Gteg
Message-ID: <CANp29Y5Ew-7FCrSmCXngSJ66SeWMMX=bgztUZP99i-tGX=jMbg@mail.gmail.com>
Subject: Re: [syzbot] [kernfs?] general protection fault in kernfs_dop_revalidate
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: syzbot <syzbot+e37a1730d63d207fe403@syzkaller.appspotmail.com>, 
	bfoster@redhat.com, gregkh@linuxfoundation.org, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org, 
	syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 5:19=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Sun, Jun 08, 2025 at 08:11:02PM -0700, syzbot wrote:
> > syzbot has bisected this issue to:
> >
> > commit f7643bc9749f270d487c32dc35b578575bf1adb0
> > Author: Kent Overstreet <kent.overstreet@linux.dev>
> > Date:   Wed Apr 17 05:26:02 2024 +0000
> >
> >     bcachefs: make btree read errors silent during scan
>
> syzbot bisections have been looking _very_ unreliable
>

In the bisection log[1], syzbot has run the reproducer (that mounts a
bcachefs image) on the original commit 20 times and it has got lots of
very different crash titles. One of those was actually the original
crash:

run #1: crashed: general protection fault in kernfs_dop_revalidate

but the others were in quite different subsystems (net, block,
bcachefs). They look like different manifestations of some memory
corruption caused by the mount of a corrupted bcachefs image.

I don't see where the bisection could have derailed later during the
process - on the tested commits, the kernel either crashed 100% of
repro runs or none of them. So the result very likely is reasonable
w.r.t. to some bcachefs bug, which has apparently been fixed since
then. The reproducer no longer works on syzbot and the last "general
protection fault in kernfs_dop_revalidate" crash was recorded almost
100 days ago.

[1] https://syzkaller.appspot.com/x/bisect.txt?x=3D17abb20c580000

--=20
Aleksandr
