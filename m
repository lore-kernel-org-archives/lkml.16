Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E819A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 00:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743811297; cv=none; b=S1Wxu7dwuwqR5B0NIrhI9FgeZmur9RCxP13WcZu39fJyy+QGCZL8olVLvyNktKfSNHkHZrhTcjCJ9r8uU6qL/HhuoF3GPWt96D8qGjqiwv1ZCIpf7Esk3ahQ9ogbRXnSFKCmCI+KESPHAtnPOq3AT4OPJHBJk0jFUA9EvZvs9M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743811297; c=relaxed/simple;
	bh=bs9njDxfO/UPuD4IumQI6a3fniuB7rskHCC70+8QjJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbuEvkRX+eBF2XGzs4a2J6logx8nVcGG5jTdeP78SkDBg+J9YrQZ30ofLjUGyVIzMCrDqeUBsgK2pRjIowOyfUwSHMUKXToZ8+Yy0FcF8PmM9FvCwEB2rd+i2Oi/dmJTz9GPM7YHuifnAMrSyTLox5m0z5OdKvuQ5TuWxMVsSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iZcV3Yw+; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iZcV3Yw+"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47666573242so163761cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 17:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743811294; x=1744416094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bs9njDxfO/UPuD4IumQI6a3fniuB7rskHCC70+8QjJ8=;
        b=iZcV3Yw+X6DIAXnoGjQv9dC3QqpKQetBrP5i6Od8VoBNlUyHdV1iuGLpZ6E/xW4ofK
         JOkhb4uo18RohqPlN+J+Y7XpXYUeESUvhLCDui9rqZ7N2s0xhCb5KpMzTewpbEsVou16
         wRPKiNjXl/vVkjtGr3ecLRzR3IoD8H1oDVVeT7dJgO65sfX/wLRC6t9PP6nfJKvL5mvI
         BAgXEA7e7tqhGdTyLZ7ugZBfDw88ZhLsPPRCvqUbvIz894WzmEpgaJ0s2zurMxhG6ab3
         28MS1s20y0GswpzreVsu9Bm8WTGhjyeO0xd6h2V6ud03/a7O/HdkSz0jpDjl4luowREJ
         IE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811294; x=1744416094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bs9njDxfO/UPuD4IumQI6a3fniuB7rskHCC70+8QjJ8=;
        b=IYpFOsxnn8v/ShG5GaTGb0EvpBcdkGjVXZ15VEslIVn+Z5JZDXS9ipblt4mpqeRBaR
         No3edVIiX7R0AsAg//yDSmrI0ucbShIcQEpRHv+v0uNYHqks6WMj5Uvvp8RYS28ziJXx
         F9D3pQURUADow5redbnwbHP+96EU2H6afAy/yAHL0CIFky7Y5Vrgpq0/k+7KPDSvKE0Q
         lSYuysg816IigYjmdUQXlkSApOOrp9jVM0mywJ4O2gGU8FyhdYT5MzWCIvpE7puCovma
         Ulp6pP2YxPfEYBgIWbajomRR0OXeXvN0ygyZHvLSs2urFBbwRdTKJBNokZGV8S4wGNgc
         9EUA==
X-Forwarded-Encrypted: i=1; AJvYcCWiL9f8hQ4pv24ogxApGeCPJy6fewI/Q7wjpt8OWzazxV/QcUnceQa7fn/Pugd5sy1q6LbvuF/LUthqADw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5PHkFYaFxNA9rK31Di8K+mmqHmhV/RRMT+EJzjOmPzR0RD6y
	J7sBonRRFuZ4LqmmL75AqvXgHiqtxG4RPtOneklRNrtZpt4Q9+0S/8jrF4DDqTwqaA/D4CH3m35
	93C2P3vrNAXKrMku6iLoBK329w4n6/eXquGT3
X-Gm-Gg: ASbGncs7voRey5r226ijD5eX+7k48bT8De9c/UvD674HQeBLmltJXVdTa8TUEIoZRWP
	9lQBWDajaFCZbnB/qwilSgHDEZB79wnP1FM0MKAzPgs4FU8KcjSiERJfvexNTKLTCQvMk9arHAX
	46mTDKKFJcVj1wdZQRCdjBH6JwOM0+EYdGlfM7GNXeN+GJ87WiE65ZKhqZ6+4=
X-Google-Smtp-Source: AGHT+IG31MySeEuDpRESn7yDe70KztZLDYHNiWJTHLqTScxeoaWWTA9NWscHpg9wUOdriSga5X/vaYScrXoyeoYYsl4=
X-Received: by 2002:ac8:7e82:0:b0:467:8416:d99e with SMTP id
 d75a77b69052e-479333a2c5bmr745071cf.21.1743811294445; Fri, 04 Apr 2025
 17:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404220659.1312465-1-rananta@google.com> <20250404220659.1312465-3-rananta@google.com>
 <Z_BksUn4JiPPGc4G@linux.dev>
In-Reply-To: <Z_BksUn4JiPPGc4G@linux.dev>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Fri, 4 Apr 2025 17:01:23 -0700
X-Gm-Features: AQ5f1Jq0s70hCQMi54jnhNNYSQm6SIED-nce3BxiWWVuRKa9bdstap1Vc309pC4
Message-ID: <CAJHc60y6pTCS+4qtQmT0ttMK1ZOH36tCXpU+yc2DytgKc=AiPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: arm64: Explicitly set the page attrs
 to Inner-Shareable
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver


On Fri, Apr 4, 2025 at 4:01=E2=80=AFPM Oliver Upton <oliver.upton@linux.dev=
> wrote:
>
> On Fri, Apr 04, 2025 at 10:06:59PM +0000, Raghavendra Rao Ananta wrote:
> > Atomic instructions such as 'ldset' over (global) variables in the gues=
t
> > is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
> > DEFINED fault (Unsupported Exclusive or Atomic access)). The observatio=
n
> > was particularly apparent on Neoverse-N3.
> >
> > According to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte load/store),
> > it is implementation defined that a data abort with the mentioned FSC
> > is reported for the first stage of translation that provides an
> > inappropriate memory type. It's likely that the same rule also applies
> > to memory attribute mismatch. When the guest loads the memory location =
of
> > the variable that was already cached during the host userspace's copyin=
g
> > of the ELF into the memory, the core is likely running into a mismatch
> > of memory attrs that's checked in stage-1 itself, and thus causing the
> > abort in EL1.
>
> Sorry, my index of the ARM ARM was trashed when we were discussing this
> before.
>
> DDI0487L.a B2.2.6 describes the exact situation you encountered, where
> atomics are only guaranteed to work on Inner/Outer Shareable MT_NORMAL
> memory.
>
> What's a bit more explicit for other memory attribute aborts (like the
> one you've cited) is whether or not the implementation can generate the
> abort solely on the stage-1 attributes vs. the combined stage-1/stage-2
> attributes at the end of translation.
>
> Either way, let's correct the citation to point at the right section.
>
Ah yes, DDI0487L.a B2.2.6 seems to be very close. OTOH DDI0487L.a
C3.2.6 explains why we see an abort in EL1. I can cite both to get a
full picture.

Thank you.
Raghavendra

> Thanks,
> Oliver
