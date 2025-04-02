Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE831DE2B4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743578142; cv=none; b=t8h3ArsHA6glxlTvKkt+DHrul4CBHy36NN9eRabAV8xFUwXsOTbLg/0nmha0y+lle6kv+2k5Vd9DFxx5Oxd8DIZRtGPIUZNb091lnQIF6Hs6YwkGZKbH6Fd9h8Y4RJ2o9yKXBL8ijvMPqUUUe9kXtwzKml3GtoQQEAth17vy04A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743578142; c=relaxed/simple;
	bh=BaORJd87iosHDx5WZG548sN40CiZNIpNfnw1sc8oOxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/jNCEgKVMnDAJKnpr32nB6/jycwlmEzF3egWIU6co/lB+hxdqpSoviob7DMplrG9oMql4gQiZ7fKDxUQUv4rtrBzfr3fXUcfXzcM2NtE42SvhY/V4pP9dqqx+KMFJD0l9WvJP2i3CwkX9xI+b1lOuUFKkG5/G1DNWJ5zRhcYHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnWT0KA4; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnWT0KA4"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a04so64774431fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743578139; x=1744182939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iELwSMTJst/HopIoh1adTYSb4YehYsi3gJ2CHq3CnqM=;
        b=QnWT0KA459fcdC5GFViUEuYPMtz8pC4Ozpa1e/q23PdNEE0Zp6FiceYM5fxXfuvrht
         3TumUmyP2j1L7THhYVoWcBGqNZVFy/6KJWf3PZBsr8fs2NCc4yTbX4u1yZxqwnzyFnvk
         251vXsMxxkF3RlZMB9wHg9sUp8iYOTQwR12Zp1NYqf5t3boXwxFsbtR40p6udCEB+ocX
         gYlVVZkvCTwVoe1IsJBxSEOaQcYyy3Q7RT8g+PRMSwibK+l+xNKU7jvW4M5ph8oqurq4
         Eio4N/EDD+M0WIr46eFw36TdMv48EYHVHjdqjEhWA5Am9xokHQQvkfwFjBZ67ruJd5pK
         Miag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578139; x=1744182939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iELwSMTJst/HopIoh1adTYSb4YehYsi3gJ2CHq3CnqM=;
        b=HgbOG7lAmy8ExI/ugX65Y/QE0q7baKuepCEWX+ceXTWrWPea8WDvi4GJOp5nBRE4f5
         3VvlHpv/iVHv24t+1BQn1Q9OLIiBK3AGLWmeKLwDNGcSkhdCFx7B/JW1t6rnpBF/+1iO
         EaHGYqXM22OCflc+lypoc9I3IKkjQTV2gXE2cvkgfZ8pf+yCald3o9pETAvBcooygsoG
         8owInMfBzUqmoLgPJSOTL1Te+PRG4NkBL7L+/F17BanUxYptx+vxCcjrtgTP0GaIdEc5
         CzYsmHpgBvM5c2jz5wC7crH84Rf/mgkqIsITaaJ9VSX9+jKAIDRXAx4wsLQtXpMwlxh1
         hOQg==
X-Forwarded-Encrypted: i=1; AJvYcCUDcYj9xK8PmRFeia2lOvn9ZZ12Gz1HvxKPXhaO6RkDR1ibXtYz5COEl1O7NFtHr9tbjNLSdvH2t7rSPkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc1YEkRtNQwGUj7MoZoh4WgWX7bN6ovmJLzRZkMt6qcsErwNNT
	qIZNQ7gQcbPyv+nv504V+u2l9cpdYWF/0kK8zWNguBzuTK0oyVzf9wz9awAuFVWbzGymC4frnjO
	AZp2XPaWINhprqvunoEb/HVkVwy8=
X-Gm-Gg: ASbGncts8Z8brjQa232x2j8SjBbnJ1l11pb9y/ISfYUKmnNYpWZu/FJ7RdUs0R/bBmH
	Lvzv+lE4xZF95llwEI3cRIZgI3L0+lD3UfYgeyxRtjcNE+uiX4Q/S70G6AhCQg2c9wLwLV8iUo3
	1u3ykEl6aTkFnE5/fch6hdC/wrQg==
X-Google-Smtp-Source: AGHT+IGPIKsvEgh7sw5SMZ/16w17PlDD+UOQc49o43ekkIQ6rUh/viHGLhnuea4GUHgfC+t1/P6+UmSijrElyReDE8c=
X-Received: by 2002:a05:651c:1148:b0:30b:d073:9e7d with SMTP id
 38308e7fff4ca-30ef91cf276mr4224881fa.37.1743578138614; Wed, 02 Apr 2025
 00:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401203029.1132135-1-mjguzik@gmail.com> <Z-xOFuT9Sl6VuFYi@gmail.com>
In-Reply-To: <Z-xOFuT9Sl6VuFYi@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 2 Apr 2025 09:15:27 +0200
X-Gm-Features: AQ5f1JroDinGeoU90qbUgWXBakmPjrMwHx9nRgYIQbHo8CWgSnhsHcoOnsKOARM
Message-ID: <CAFULd4YgiPA3+2zu67WrhASzad5W74MNbbE6sZyZrSFX8kA8Qw@mail.gmail.com>
Subject: Re: [PATCH] x86: predict __access_ok() returning true
To: Ingo Molnar <mingo@kernel.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:35=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> > This works around what seems to be an optimization bug in gcc (at least
> > 13.3.0), where it predicts access_ok() to fail despite the hint to the
> > contrary.
> >
> > _copy_to_user contains:
> >       if (access_ok(to, n)) {
> >               instrument_copy_to_user(to, from, n);
> >               n =3D raw_copy_to_user(to, from, n);
> >       }
> >
> > Where access_ok is likely(__access_ok(addr, size)), yet the compiler
> > emits conditional jumps forward for the case where it succeeds:
> >
> > <+0>:     endbr64
> > <+4>:     mov    %rdx,%rcx
> > <+7>:     mov    %rdx,%rax
> > <+10>:    xor    %edx,%edx
> > <+12>:    add    %rdi,%rcx
> > <+15>:    setb   %dl
> > <+18>:    movabs $0x123456789abcdef,%r8
> > <+28>:    test   %rdx,%rdx
> > <+31>:    jne    0xffffffff81b3b7c6 <_copy_to_user+38>
> > <+33>:    cmp    %rcx,%r8
> > <+36>:    jae    0xffffffff81b3b7cb <_copy_to_user+43>
> > <+38>:    jmp    0xffffffff822673e0 <__x86_return_thunk>
> > <+43>:    nop
> > <+44>:    nop
> > <+45>:    nop
> > <+46>:    mov    %rax,%rcx
> > <+49>:    rep movsb %ds:(%rsi),%es:(%rdi)
> > <+51>:    nop
> > <+52>:    nop
> > <+53>:    nop
> > <+54>:    mov    %rcx,%rax
> > <+57>:    nop
> > <+58>:    nop
> > <+59>:    nop
> > <+60>:    jmp    0xffffffff822673e0 <__x86_return_thunk>
> >
> > Patching _copy_to_user() to likely() around the access_ok() use does
> > not change the asm.
> >
> > However, spelling out the prediction *within* __access_ok() does the
> > trick:
> > <+0>:     endbr64
> > <+4>:     xor    %eax,%eax
> > <+6>:     mov    %rdx,%rcx
> > <+9>:     add    %rdi,%rdx
> > <+12>:    setb   %al
> > <+15>:    movabs $0x123456789abcdef,%r8
> > <+25>:    test   %rax,%rax
> > <+28>:    jne    0xffffffff81b315e6 <_copy_to_user+54>
> > <+30>:    cmp    %rdx,%r8
> > <+33>:    jb     0xffffffff81b315e6 <_copy_to_user+54>
> > <+35>:    nop
> > <+36>:    nop
> > <+37>:    nop
> > <+38>:    rep movsb %ds:(%rsi),%es:(%rdi)
> > <+40>:    nop
> > <+41>:    nop
> > <+42>:    nop
> > <+43>:    nop
> > <+44>:    nop
> > <+45>:    nop
> > <+46>:    mov    %rcx,%rax
> > <+49>:    jmp    0xffffffff82255ba0 <__x86_return_thunk>
> > <+54>:    mov    %rcx,%rax
> > <+57>:    jmp    0xffffffff82255ba0 <__x86_return_thunk>

Mateusz, can you please file a bug in GCC bug tracker [1], following
the instructions in [2]?

[1] https://gcc.gnu.org/bugzilla/
[2] https://gcc.gnu.org/bugs/

Thanks,
Uros.
