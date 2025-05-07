Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567A1C5D5A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649698; cv=none; b=bNI74+5r9rgZo1RbqpOPYULfa/d3phZUQxGi8aRdY93Y5vMC/tMVNCG4IU5/wg09GzuM3GrkCv0GL0VVJ0xvNCI13U8LFoLFVe14VGI2GyvlIv+cw3b2rYHtQ6Tfl5kolq6t8o/OZRDAt5dkXvg2thrX0NG7M7x1pS+CEUDZk3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649698; c=relaxed/simple;
	bh=mf9zl460fVwgNd/Xzx+sgR2Ul5ayHK8J9uHI5yI4eFA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Psivab/LJFa35Wgykn3DZneyygtz7wh0QtqEq3Xgxb6oB3ZZXym8q5vsDGHodgEMqDrxMuZ+MAqcQAwzv7nvHB3o8w2nrsIBwpM77lLcs3MiJSrsg+TfhA7ekk2wFIvUN7hLm6dWTjW9GOB4AtX4DEeHJakBstgB0Sgqv59A5V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHVE3PNW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHVE3PNW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so2515845e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649695; x=1747254495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGf8Q9ccd3iDZuWgtfak1WQeYMZj/2GPzE2SYSX8Ifw=;
        b=UHVE3PNW5be9kymZx3KXYj/8+2WCDR+VQJBfewSDIgQpvYXTKf6MYPlJeTPZwazc8r
         gVaFP+gOYwo+3qpC1w5Huh67Cg8Z4JHdoz7uzqSttQUVmHM/bI9IfPxJt18N7jGNqrBz
         VZM3m1dpEk6Djztcj9vn2gwhbwP6M9ygXP98v1J4ZkmA7BglpztoilBQrY4muRG6JYUR
         /xHmubBUQvKI3B98R0lUmqQhB0Gcz9N7W9zxpYUsBBVq0Itp4wsO8V2R0by6LD9hTl0l
         /zghYXsVY0pvrR+V5v9oXQ5aJfwdsOM8TEOrX/53eLwJyrygBIGN40zzr3+evUNx34bQ
         Fupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649695; x=1747254495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGf8Q9ccd3iDZuWgtfak1WQeYMZj/2GPzE2SYSX8Ifw=;
        b=KGNgu+6WlLyXkOTTXb4H3gM8gBdZ+/mgVyvFuvimz3PYiKVb3Su54w9HEpGfxzJ9u5
         qSgbvxul7In26+kKzctaCAUBid6sdMRd3Sb1QCUD7v27N6Ozzr6NP+YjYqUZOmyeqPWZ
         cdKiObx2VK3w2saEnEzfzUpQQ2LCNt8Tv2nmIkaUB1E6gF3LIPgZP8Jw5l68b9mFWMH8
         96y5JYWFVUOfdKhKARLkAj+SpofPbuJ3yFprRvw+gAVk4spGIdN41uTKTXMgC8A8XETb
         YgSSCsc+4yOGuDsjsBaWnKqrTg+a8x+fjWVtcwHCHOnWy1A5lTUvj20jp/6fUaDDWvhh
         422g==
X-Forwarded-Encrypted: i=1; AJvYcCUSTi4NCdeYI5uQI8pZUe3dsrMdw9drHwY8wFFbc+d6Yb6SfVX8Y686DR4bCOtox6qMbE42bgdVdxBxJnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLn/FWuVgJV7//XS890c/N4vNsJsYTQyw+JcevzmAVKOP9B1w+
	WIetBWpLzl+SEbRHqyOWoIYUM7Bvxa3CUQ2TwQOwdOj1fL5QOFsalGgYtQ==
X-Gm-Gg: ASbGncv9xyvH7Gs4+MQBaLffYFFLd8spqQx/wDy4Sow9akNoJIFxvvMsa/6pCaqJzxk
	XZjy+2vkVcUXfyXeARO3jPwdslAxmU0jk5v/92Zycsxfn4pQQ/3KX99l+w1GTQoL48zTONx+bXz
	YJmgM7+Jm0lxoVw7yBFYvoCS+SYKIn3UebejSrzbBVC/AXuaqcj2xCJ0tpIKQsGnQIWXHKhkBDw
	gb9DhRa5tY16rtTDJQjzn+ASGf/DYA8phmDI7WrcFkOy0cxCNnE5VbsJGxOTJN46FF4l9Sb+xPh
	FaQi98lTXSfePghfECFQF2MGBEoHzuDUe08xYKNvTTBztia5DXF/tfaOQBlgkl+9fFbc4UAyC3F
	Z72E=
X-Google-Smtp-Source: AGHT+IE2zG7igwd9NAyWCEtqop4ZEXNBrXquUegBACkobWnJrCa03IgYtDVnYsHO8Kw/povHrD47sQ==
X-Received: by 2002:a05:600c:35d4:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-442d034be6fmr5881415e9.32.1746649694859;
        Wed, 07 May 2025 13:28:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b6e52796sm2213833f8f.37.2025.05.07.13.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:28:14 -0700 (PDT)
Date: Wed, 7 May 2025 21:28:07 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH -tip 3/3] x86/asm/32: Modernize _memcpy()
Message-ID: <20250507212807.568551f2@pumpkin>
In-Reply-To: <CAFULd4Z6Np=_zUUFH+Jys1VxyCAp6omgnMH9OL7iCKM1Si4q0A@mail.gmail.com>
References: <20250506165227.158932-1-ubizjak@gmail.com>
	<20250506165227.158932-3-ubizjak@gmail.com>
	<CAFULd4Z6Np=_zUUFH+Jys1VxyCAp6omgnMH9OL7iCKM1Si4q0A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 6 May 2025 19:34:34 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

> On Tue, May 6, 2025 at 6:52=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wr=
ote:
> >
> > Use inout "+" constraint modifier where appropriate, declare
> > temporary variables as unsigned long and rewrite parts of assembly
> > in plain C. The memcpy() function shrinks by 10 bytes, from:
> >
> > 00e778d0 <memcpy>:
> >   e778d0:       55                      push   %ebp
> >   e778d1:       89 e5                   mov    %esp,%ebp
> >   e778d3:       83 ec 0c                sub    $0xc,%esp
> >   e778d6:       89 5d f4                mov    %ebx,-0xc(%ebp)
> >   e778d9:       89 c3                   mov    %eax,%ebx
> >   e778db:       89 c8                   mov    %ecx,%eax
> >   e778dd:       89 75 f8                mov    %esi,-0x8(%ebp)
> >   e778e0:       c1 e9 02                shr    $0x2,%ecx
> >   e778e3:       89 d6                   mov    %edx,%esi
> >   e778e5:       89 7d fc                mov    %edi,-0x4(%ebp)
> >   e778e8:       89 df                   mov    %ebx,%edi
> >   e778ea:       f3 a5                   rep movsl %ds:(%esi),%es:(%edi)
> >   e778ec:       89 c1                   mov    %eax,%ecx
> >   e778ee:       83 e1 03                and    $0x3,%ecx
> >   e778f1:       74 02                   je     e778f5 <memcpy+0x25>
> >   e778f3:       f3 a4                   rep movsb %ds:(%esi),%es:(%edi)

Hmmm....
IIRC you really don't want to be doing a [1..3] byte 'rep movsb' there.
Some cpu will run it quickly - but most of those will do a 'rep movsb' fast=
er.

It would also be interesting to try to measure the cost of the 'je'
being mispredicted.
I bet a beer or two that at least one cpu can't abort the setup cost
of the 'rep movsb' - so you take the full hit.

I do need to rerun my 'rep movsb' performance measurements using data
dependencies (not lfence/mfence) to synchronise things.
The 'before' data dependency is easy: count +=3D (clocks & volatile_zero).
The 'after' one can be done the same way if using the performance counters.
It is probably enough to use the updated value of %si or %di rather than
doing a read-back of the last memory write.

I've done that for a different function and can see how the clock count
for divide depends on its arguments.

	David
