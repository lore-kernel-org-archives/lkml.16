Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7E7290BAA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746653361; cv=none; b=e7PY5nKfbi74YU6jnL1G4NLKtwjB/1qfHnzzXyRzY/pjNFEW3F4k8T01v3twpmvO2K6x7sUuCOycR5Py1CEHpIm9ifD+uObct9DtgabIDSIfdMxZ4IqdDkrlvNEZg7xFbRBXqm1m7uBFNKKs145u/nizjGiuRuGZKFZjyXAq3U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746653361; c=relaxed/simple;
	bh=itDl458k7uVLYbXS6omYEo2ddLIr7FLV+Vv/PapWcvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLUyBQ73yPKL8oI+57Z8H17XtRxKc3++ulr+JQdsnl7cpZKKi46KSSR7R+lnOjlbp1KFzK8vT4Mc1krjJA3BXneBnwTSc6uQVWDm7An9BCfJHHv2wzrj0B+ZKcUb1F4pZrCk6wMkAnrlmkRv31P8FYJoQ4K01pOKZfAXl88Sf+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH4tfE0Y; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH4tfE0Y"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30ddad694c1so2843701fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746653356; x=1747258156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhaqMRAckVsDjsW2PlQVXGzvL7XeevvsZgQHljLFVdo=;
        b=dH4tfE0Yt/6T66MHDVcdk63ca6KkCZXONDFFLWBoKT7xUWUXHQLdIy+bUWhuCwWIj5
         Gc3RPFd1AybVnu5686qZITUG/QXbFQi8Uu/4EDN3IDQSr+wbHSaOjaqlYuIAua8B4ia9
         SUcdBI5yqKYX0enUat+xywH36ifvO68+vXxQ2iC5RWSlu/fcuLF21xHPRJ7xiYQtnBnB
         jL92TUufIojCgrfFyEBIrFnzAk1T1uvp3qXi8Ey/RzOJ13scL7Dmxw67VSWEMDZRcEZ2
         tVp0Q2wQR8JXWZIK09Bt5y4gtymY/xzCmsCGTG4fZbHWR0MgyTIZO6kZdboF6Tl98P91
         p+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746653356; x=1747258156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhaqMRAckVsDjsW2PlQVXGzvL7XeevvsZgQHljLFVdo=;
        b=Uzn8ZqFTpbaei7JnENWFgz4Jzv/v8BTnFpZnHGh8LvZuagXoWmxLks/eTipmlUlb7n
         QUvzpZ+PbCqgjyqAZfMxV0Q3u4ffvputUsBMZ+ctt1/l3hLpEu8YKOn0q617TOo2xz93
         Mlo0eYx5Xdld/odCmLoUnZnkSViFkJ1sZvG9ZB5ZNwvj7NwaBtXvfXTnNxnB4OdnxqQt
         AbLoPL5idRpnA9if6Nwh5fWTfXwUxZqo9e4s0kNAXZsDT3I1sDg4G+wqaYhpsMSDDzPM
         4HB7q7lxcBu3ht26DxfgKaK9HN4OhQvYqLV6FSiK9ezaSSbKTjpuoSt8P7OGF8qMam5P
         ZHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzp0LXDLvS6SmW7Rav9QM7kWBm7A5QpZWbRvc0JgbU1uTRAXF5v4on0o+vAq4oQk4L3/DwJaGq2tAvosA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMTt6PkkJBg+qoZJgGp3ySqEnHjCVdff0QmGoVtmFx66uWR4Sn
	Qmw9SFoz9W9gmSp1SOVHMLOorWclbROjiceuv5UVyzaqkozowVtEQswVAlRNkfVeyaToJpqXFq9
	9Hvfo9KwGphMspW4Mroxi/8Xw+u4=
X-Gm-Gg: ASbGnctCyp46UoYbI+sF5YRvZa1S4tL57HSY1dY/shZzPkSgTmRv8EJtK40I5qhmyXE
	JKJCg46zaEZvnemAM/FY8GLvLM/xUar6Lt4+8vTH06JICRQzF4TrMSiZ2JzoWv+GGvuuVD3gp3s
	GFkrwxP18JZMrHM16C40aZzgNxDLKr9Gm2
X-Google-Smtp-Source: AGHT+IGSNRfvLjFEXAInnB8l6ldFbQYzChFmwbwqPk6HadnQpmlxEh5sdnsUVhwHYCk40xOrIzguwF6HW6261jjezjg=
X-Received: by 2002:a05:651c:1447:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-326b8837842mr2639631fa.21.1746653355499; Wed, 07 May 2025
 14:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506165227.158932-1-ubizjak@gmail.com> <20250506165227.158932-3-ubizjak@gmail.com>
 <CAFULd4Z6Np=_zUUFH+Jys1VxyCAp6omgnMH9OL7iCKM1Si4q0A@mail.gmail.com> <20250507212807.568551f2@pumpkin>
In-Reply-To: <20250507212807.568551f2@pumpkin>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 7 May 2025 23:29:04 +0200
X-Gm-Features: ATxdqUHAL1Urm-hxqsM3s0SA2tu-ZOOnt-So-QmWc6EO83C3YzMBIO1jwes52JU
Message-ID: <CAFULd4ZaVMgNi7fHC1JzyAiq9bNmXF9aB4Us8X_zU4nMLct=FQ@mail.gmail.com>
Subject: Re: [PATCH -tip 3/3] x86/asm/32: Modernize _memcpy()
To: David Laight <david.laight.linux@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 10:28=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 6 May 2025 19:34:34 +0200
> Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > On Tue, May 6, 2025 at 6:52=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> =
wrote:
> > >
> > > Use inout "+" constraint modifier where appropriate, declare
> > > temporary variables as unsigned long and rewrite parts of assembly
> > > in plain C. The memcpy() function shrinks by 10 bytes, from:
> > >
> > > 00e778d0 <memcpy>:
> > >   e778d0:       55                      push   %ebp
> > >   e778d1:       89 e5                   mov    %esp,%ebp
> > >   e778d3:       83 ec 0c                sub    $0xc,%esp
> > >   e778d6:       89 5d f4                mov    %ebx,-0xc(%ebp)
> > >   e778d9:       89 c3                   mov    %eax,%ebx
> > >   e778db:       89 c8                   mov    %ecx,%eax
> > >   e778dd:       89 75 f8                mov    %esi,-0x8(%ebp)
> > >   e778e0:       c1 e9 02                shr    $0x2,%ecx
> > >   e778e3:       89 d6                   mov    %edx,%esi
> > >   e778e5:       89 7d fc                mov    %edi,-0x4(%ebp)
> > >   e778e8:       89 df                   mov    %ebx,%edi
> > >   e778ea:       f3 a5                   rep movsl %ds:(%esi),%es:(%ed=
i)
> > >   e778ec:       89 c1                   mov    %eax,%ecx
> > >   e778ee:       83 e1 03                and    $0x3,%ecx
> > >   e778f1:       74 02                   je     e778f5 <memcpy+0x25>
> > >   e778f3:       f3 a4                   rep movsb %ds:(%esi),%es:(%ed=
i)
>
> Hmmm....
> IIRC you really don't want to be doing a [1..3] byte 'rep movsb' there.
> Some cpu will run it quickly - but most of those will do a 'rep movsb' fa=
ster.
>
> It would also be interesting to try to measure the cost of the 'je'
> being mispredicted.
> I bet a beer or two that at least one cpu can't abort the setup cost
> of the 'rep movsb' - so you take the full hit.

The intention of the patch was to keep the existing functionality, and
modernize/rewrite the assembly to use inout constraint modifiers. In
passing, some parts of the assembly were converted to plain C. At
least to me, the source code is much easier to read this way, and also
enables some compiler optimizations that result in better assembly.
Perhaps functional improvements can be implemented as follow-up
patches.

Uros.

> I do need to rerun my 'rep movsb' performance measurements using data
> dependencies (not lfence/mfence) to synchronise things.
> The 'before' data dependency is easy: count +=3D (clocks & volatile_zero)=
.
> The 'after' one can be done the same way if using the performance counter=
s.
> It is probably enough to use the updated value of %si or %di rather than
> doing a read-back of the last memory write.
>
> I've done that for a different function and can see how the clock count
> for divide depends on its arguments.
>
>         David
