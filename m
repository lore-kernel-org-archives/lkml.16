Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101D284669
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194843; cv=none; b=JuuHnxh6c77amsT1YDDzDZy6tH5nel3OSX/z6kYzI/wVVy9n6Oye0grzRHcgTmT1CHv13CVz7BmiQoIXnVQQq7yy8zDB04yQSbovggPbJoU0RW2GsbDHcq+cfSOb4PiHazAuxm0fV63bHTV/IYvDWx1uRPms4ttkqYss2ijAKu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194843; c=relaxed/simple;
	bh=UI2I9LoycgSiYOyWi8BqE5aunp/uM8wRrV8+vwUfE4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQDFuMUsO9k2FyDrkzhQ3WnaRo160X/ZKFtHlVRlTTuhDxDN+eNtjDFwmSJ64dYarTWYBXvCURktrGBKc9XjH+s2Z9KY3jbsXslQm6Q1iIjFUOhknxLQWr1zoK0fOauKgWeQJwHnGuZbkrsKM5CdHNpwTETVLeMzgchNunfnA8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V001zAK/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V001zAK/"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-551fe46934eso2007807e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749194840; x=1749799640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/o+qe3wNhym0p9DzNOUXY5xtI2335qhvaIsxmIqtNg=;
        b=V001zAK/KzwhAjbaUXnsabfDXj93iZmAPlgqBJQrI6c154SXKgy+b/ta08hjUxmwSn
         ripb+Thbr2boNwEuQWhYvF32VC6S1wWZFsTmTnvxhDanyO9H+KjiRuSJtQMBybbrqxnC
         bkGt9/EsatT/YExBcJRS/JIR0jO4/koHLbK65yTKrEq/fsofBSqaIDja+acmMWwP6SAq
         aUEpb9UPsK024skOu/KQLeKqeVN/cSFZNzsr0owQOueZG0xrGX4XprWk5I5O/xDRl7Q6
         z1e17LXbL3eVIhKoS6A37oBUsravmwWO1fG97sTFEMqOm10XJnB4KzpsTMgbYPLMbYQC
         Jw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194840; x=1749799640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/o+qe3wNhym0p9DzNOUXY5xtI2335qhvaIsxmIqtNg=;
        b=td2IUWvizH5f+xQKrtf2SLcjdkO13oBVnL/72mjr2AaulZGXCYXxoCBMYu1kMgH+JP
         f24XJId6Av+dTUnWwSCe1l8EmG2Iy6N/mH5pjVzjb1geoL+BG41AgGptKQBkfpjn1wHq
         DdY/VIFe0s+HBKciRYFqkgi4C91Vujk9taDhmLr6IAoz/xPLnqFUM/2tITEOtajc8JUG
         nNhR3xSi/t5iFppFn4NY3D4mSRFEkwTjhYTFcc95ULvyEAfU4rRXCFQ8Brcp5s7Utyg8
         lwwnukmlGuC3iSryykkmlysAnYS/+56R2QQudkphOxOkpr1o8RexlmZfyCIXfCtXUcgP
         QrzA==
X-Forwarded-Encrypted: i=1; AJvYcCVu+2m4jlwvL/sSQP/XP1qF0GdRJ8T5Bq/n4qd5c55WIje8T5tLL/bV21184pa/QNOBD6z+jngT95MmUAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKrBZdJVkLbgc+wz3ehBzldZwE//6eE2/ZZ6oAQNc8A4UfWXo
	GQhQSe6xUFc4qDvarciP85TaU2cS86dvwioPQR0uECiG2tOA4j6gaAw2Y/sK0WkA6eY/n2puyFX
	Q+6Z0hX0cOjQ0siK762C7ukfG63EWmEM=
X-Gm-Gg: ASbGncuAL9kjktHd5qzdFNsAkJUnvfZQOOnto6eVDbBq6OUNFK4gES6uSLlK+IAKGa6
	p6gJI3qDrTYP+EcKWjPK+GPPkhMM6shkly/3SA0KrrFpq3BlDa9q0qSXF1haCpRzbABUc6gEk4O
	3fGSKA45fDW1lZEPfWWzWG0i1X482bHpvNyPIQ4vcwpFA=
X-Google-Smtp-Source: AGHT+IGKKoPovUonPGLJigvqNkCK8HnmNGF5bMcozum4VgQxVYy6aWAl4Vwuk2gsQS5hmzRJ+is4k9lXovUjgbzIfDA=
X-Received: by 2002:a05:6512:220b:b0:550:e50a:bf49 with SMTP id
 2adb3069b0e04-5535d92b53dmr1895962e87.19.1749194839786; Fri, 06 Jun 2025
 00:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
In-Reply-To: <20250605190054.GH30486@noisy.programming.kicks-ass.net>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 6 Jun 2025 09:27:07 +0200
X-Gm-Features: AX0GCFs_MuHJJlyB5w1uRpYA3b1g9De4MxN0yaWM9KiX35Fbz_Bugu6uZjj63vQ
Message-ID: <CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, torvalds@linux-foundation.org, mingo@redhat.com, 
	x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:00=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote:
> > gcc is over eager to use rep movsq/stosq (starts above 40 bytes), which
> > comes with a significant penalty on CPUs without the respective fast
> > short ops bits (FSRM/FSRS).
>
> I don't suppose there's a magic compiler toggle to make it emit prefix
> padded 'rep movs'/'rep stos' variants such that they are 5 bytes each,
> right?
>
> Something like:
>
>    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)
>
> because if we can get the compilers to do this; then I can get objtool
> to collect all these locations and then we can runtime patch them to be:
>
>    call rep_movs_alternative / rep_stos_alternative
>
> or whatever other crap we want really.

BTW: You can achieve the same effect by using -mstringop-strategy=3Dlibcall

Please consider the following testcase:

--cut here--
struct a { int r[40]; };
struct a foo (struct a b) { return b; }
--cut here--

By default, the compiler emits SSE copy (-O2):

foo:
.LFB0:
       .cfi_startproc
       movdqu  8(%rsp), %xmm0
       movq    %rdi, %rax
       movups  %xmm0, (%rdi)
       movdqu  24(%rsp), %xmm0
       movups  %xmm0, 16(%rdi)
       ...
       movdqu  152(%rsp), %xmm0
       movups  %xmm0, 144(%rdi)
       ret

but kernel doesn't enable SSE, so the compiler falls back to (-O2 -mno-sse)=
:

foo:
       movq    8(%rsp), %rdx
       movq    %rdi, %rax
       leaq    8(%rdi), %rdi
       leaq    8(%rsp), %rsi
       movq    %rax, %rcx
       movq    %rdx, -8(%rdi)
       movq    160(%rsp), %rdx
       movq    %rdx, 144(%rdi)
       andq    $-8, %rdi
       subq    %rdi, %rcx
       subq    %rcx, %rsi
       addl    $160, %ecx
       shrl    $3, %ecx
       rep movsq
       ret

Please note the code that aligns pointers before "rep movsq". You
don't want this code when "rep movsq" is substituted by a call to some
optimized "rep movsb" type memcpy.

Let's use "rep movsb" (-O2 -mno-sse -mtune=3Dskylake):

foo:
       leaq    8(%rsp), %rsi
       movl    $160, %ecx
       movq    %rdi, %rax
       rep movsb
       ret

much better. Now, to use function call instead of "rep movsb", you can
use -mstringop-strategy=3Dlibcall instead of some objtool substitution
(-O2 -mno-sse -mstringop-strategy=3Dlibcall):

foo:
       subq    $8, %rsp
       movl    $160, %edx
       leaq    16(%rsp), %rsi
       call    memcpy
       addq    $8, %rsp
       ret

Which IMO is what you are looking for.

Uros.
