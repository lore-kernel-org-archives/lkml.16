Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB427B4EB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705386; cv=none; b=E3lK5LXuvAamguu0f5hk1QMxiS2CcRy+vR6J9XNCy/tY45TQcqXrUwcO5J7NRqskAC8i0ENiY9f9+MYqqvDysv9ckH+dRnHARoS83cbuwB3eVTetTqoumJ6Sga7KSgJzkKo4BvZd6oCMIcPwmniRd7pHbUnbFXiJjv98WPVclWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705386; c=relaxed/simple;
	bh=Dz3deLNLN3oZvkNLqJb3jcDfHAZu//1vDQgs5sL83i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kl26Bf4mfXsWsTw9VtKbqV2NqAMeeyOtqXtudSvvH0Aizx4S1XWZoV/U0hnwuhpvVoOoljx2wmigGUDYgFp2Heq+FAfRbis9fZGBaiQ2bPFOX7QgKebbT63kRAMj8TLpbXhqkbZums7BGPKv0uA5rQmetmQLlNdzeZr/+XqJ9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJgoIVOh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJgoIVOh"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so684058266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744705383; x=1745310183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LM0HUav2Q1fMOW7qgC0lCajEm80166T7aqg0cBB8wI=;
        b=eJgoIVOhTvPNFLm9apPzKwI579yYDpRL6W3YIAVxJbJsk0bfi33iHQV736xzWixtw1
         JV571VW7ZY2v/2H6nxIpuLWwmLRLXkw7DUa1ldIoix7AtJ2VN4OFvoJN5MoWsprByREO
         QNkSowFG78FyKVKpZpbtIXRaxoAnsxjjo+Thm5yOmBPKbSmcJdvRTIf/AeOZp+7v1uvv
         PRkaEMJ2SOL8hK2mpjTvyNLXDw5oDllAemXMYR2RfdKGg1WSBptnrT6VWUSlesi/d3MB
         onXldWMW0d65Qhfw6u+jNW+Rt2c/XSVMr+SkRG88r40jUjn503HJWGUWW47gf9q3DAKG
         +yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705383; x=1745310183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LM0HUav2Q1fMOW7qgC0lCajEm80166T7aqg0cBB8wI=;
        b=sY6RnhrIVqc8ajMMdy2rh9uvxSLp9Yi1iBier4lPiCJj/UJVP24/211178nHwK4Q+7
         Xetoi1h1CHjVEoPP5y/bEBVfwnQjG04KdLuRn9s+9XnKThdF83daQ2+cv1jaSvxSHkXv
         lM1LcXQXvYQHgzYcgm0qHIlG5HNb1HCpSLeKSjyAcAbeTYKLH8NdeqNfD8pyQ8I+E77D
         E3RUrGIvOlvGYI+mcjqK+gB4vmomPY8KniZvn49iT1AneFtnZtJNHKMVmVxiSw4heaZv
         ezytNodcF7lDQu35kwprGRRZcOvpyAXthMzzOogePDcp0beyVHOmV/20ZTNGO7+ix82C
         l6iw==
X-Forwarded-Encrypted: i=1; AJvYcCVv+fHYuXayThHAAjqpkn7YfHiSwCiyPxej1aw2TGbJzeKmA99hNKg5uaoLQCOdconFsSiyE6FezAqRZNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9UehQ2KOc2gZYQrkPTgALjs3F1/Ze4lU9GjrEm/6rfm6WWVcp
	dHeea45a4MoRX2d86D5ltMvi/acO46GJE/00OyRwj9txjMoxuHgrW52u+b9hhPXlihJ2KGKNIn8
	gYE6WfhsJzZX9+iqE8TqGqcpaW8U=
X-Gm-Gg: ASbGncu7nRuqlDPpswpUCmlp9EQaw9Rxpj5NYo48Qjak/7N1JkgvStiExePgp55yAt8
	RjgxnLqYYt6Obin8GW2KOYho1KMJ/Z7pUJb/OIhF8lzESEqRtj44kgJjjjCbM/GCkIM3H49YDah
	G358Ne45lqgnToDiRQZ7cd
X-Google-Smtp-Source: AGHT+IGmJm7+/cXuw85SmGRSK0S3YA9Ht9fEozVXJMo7CTZAfp8f0dGRISMbljGaOD4NKCRW3mxaHiTqI8Wez43aFq4=
X-Received: by 2002:a17:907:3f14:b0:ac3:47b1:d210 with SMTP id
 a640c23a62f3a-acad36a5447mr1265724266b.39.1744705383211; Tue, 15 Apr 2025
 01:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com> <Z_yr_cmXti4kXHaX@gmail.com>
 <20250414110259.GF5600@noisy.programming.kicks-ass.net> <pf2p3ugs3blztd5jtxuwrg3hc3qldc4a7lfpigf24tit5noyik@67qhychq2b77>
 <87h62qymrp.fsf@oracle.com>
In-Reply-To: <87h62qymrp.fsf@oracle.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 15 Apr 2025 10:22:51 +0200
X-Gm-Features: ATxdqUFQ1i_IPYBsSskFI2am1yWynFM-guwYl0usRugAki6GwXw2jDG7ZVdFH6s
Message-ID: <CAGudoHE2DW86hsx5H6iBwMUuKT=onTNd_OnBBCbv5dCpqvHjUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, mingo@redhat.com, luto@kernel.org, paulmck@kernel.org, 
	rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org, 
	jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 8:14=E2=80=AFAM Ankur Arora <ankur.a.arora@oracle.c=
om> wrote:
>
>
> Mateusz Guzik <mjguzik@gmail.com> writes:
> > With that sucker out of the way, an optional quest is to figure out if
> > rep stosq vs rep stosb makes any difference for pages -- for all I know
> > rep stosq is the way. This would require testing on quite a few uarchs
> > and I'm not going to blame anyone for not being interested.
>
> IIRC some recent AMD models (Rome?) did expose REP_GOOD but not ERMS.
>

The uarch does not have it or the bit magically fails to show up?
Worst case, should rep stosb be faster on that uarch, the kernel can
pretend the bit is set.

> > Let's say nobody bothered OR rep stosb provides a win. In that case thi=
s
> > can trivially ALTERNATIVE between rep stosb and rep stosq based on ERMS=
,
> > no func calls necessary.
>
> We shouldn't need any function calls for ERMS and REP_GOOD.
>
> I think something like this untested code should work:
>
>         asm volatile(
>             ALTERNATIVE_2("call clear_pages_orig",
>                           "rep stosb", X86_FEATURE_REP_GOOD,
>                           "shrl $3,%ecx; rep stosq", X86_FEATURE_ERMS,
>                           : "+c" (size), "+D" (addr), ASM_CALL_CONSTRAINT
>                           : "a" (0)))
>

That's what I'm suggesting, with one difference: whack
clear_pages_orig altogether.

--=20
Mateusz Guzik <mjguzik gmail.com>
