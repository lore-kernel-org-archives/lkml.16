Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC03D270EC0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744221771; cv=none; b=L4vyQZAlaMKeIQVprBFfmK+Pc4cCV2hVYJ3V5joZox8SeyBUMS/iUS52qxBohPrpqunEnJ4kSsR4GqOQJdzzUrx/UL1eryq64Uo9qJCeyNsOVJD2nhNqBhjDdgnJMjd9TCwBoJfb1p+wcB5jvX37dKR3n/W6C10C2jHmBH/OT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744221771; c=relaxed/simple;
	bh=rw9zpv1DnQzC20rG+h3qdgCl4K9t7ANELij3BfGZjOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bov/Azzk86qiHZX0v5ajSLPQ+ydVNQLl86P/pfinhf4+gu7M6T/Y138pWGO9E8ftVFmNZbbk8YBVHpbrP4BcMbciqVBlxLSzMGiSyzh4FS5d/ssXq8LO2PDF3EPxMklk6iXOXhS4IaFbmwnC/wMRXcCThu+GRDTdursjFsTOOdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bRNPAXbO; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bRNPAXbO"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso951365366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744221768; x=1744826568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3qFFLqcADuEgBjUtPWCyjtkh5UNIkTkxSF7xerxyso8=;
        b=bRNPAXbOwUkhs/QQg2C6ql6fTUR20G4EVXpF1IuMI+iahlE48sUND9sJcThM+z6JNS
         WyaXL8q+m7bM3g918qtjVBzcY2y7ONhOT31xH9TQSUC3u6AKHoorzGq01klOlm/7V32t
         sosAksWVQIuRoZW7tDwvlITl8SLi2lBpqY1KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744221768; x=1744826568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qFFLqcADuEgBjUtPWCyjtkh5UNIkTkxSF7xerxyso8=;
        b=VqcqjXrKRprABagDYxNABA4iinAR5NtjP5k1mN3papbZB0+/C6g9S7BfYVbqA1Shm5
         DmZTJX6YleeeFSIWIE7W3d2SSbAkCaVFBs+rg/0qLIdj7RspK0yYmSClkI3SIFGyDg+J
         2rSCDqRFrZDuF24TM9ek0AKEtJv/UQ/iIGvFQDFWZ2o4NFnU+5RQrrIIj/sRWpxMzFAz
         z0vRenWc9emDfuIFfSfjgj7dDuzGRmHUp6VT7/3Qlms5qq9J/vHbE5YdDox2LP9Rk83/
         dB35uK7rIQVnNxJHCrLXr4qQdFTZ6LuT1nFJeQh4aZoSYku+t98ZOu8gHoO5oytLaG8x
         6jAg==
X-Forwarded-Encrypted: i=1; AJvYcCUgh4l2B5UvrP3RH8SFdHr3C/lc6bo1Qmp56jQc3/67HUInp9sdQtJi1zBHxsHI+H3f+2fk7meBnz9Bn+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWVkreqMTMHbGssxa57O+fR3oj3lE/ekZAo/dw7653irSHWb1k
	uZgJc9Oj6w8+Mrn72NCCUC7vZAEgW2SUU0PMToJRczGBlLp2Z1xnv3o+8qlABKJE4LLD+jrze23
	NscA=
X-Gm-Gg: ASbGncun18VgNlacpYc4PLn+pAQYFVwUmJuXF0joXCRK4Kil8xB0aVlioE+iW3a6v87
	OVd0NAZ7ddky7HBIoABzTEJOkdcqtkBKMBPhEowUyR+M256d5eAiujBjFgKDOMnkzg08313lGzw
	nhA8YfdgsvmkkebS7R8HI7KYxQcNbwBsoi2vPS/N4+AVRRie1/LMWrw3cUcLZ2wtilr3YL7twni
	73xS8g+0htrdKVLFVQ/X3+/AXA//UrD95wSAVeo0YLF3DnlwigaR/mBZH66dLSS0SCspJUV1KrU
	t8mUTkoZ1/52ozPiLpEdcdxYe0EWyY/SrjsrdQSQrOx0RqFkS0uogiwzSr1yp6VZacm9x3SBrjn
	dRUyQB032/V3Pp7k=
X-Google-Smtp-Source: AGHT+IGRwjQxg5RXmDW8l0AL9t1uMpBqKhdd6IVlt5jQgK7QcmmlrhUV6ImnVgkpZrP0LycdJMj6tA==
X-Received: by 2002:a17:907:6094:b0:abf:4bde:51b1 with SMTP id a640c23a62f3a-aca9b65e5d9mr416164166b.21.1744221767468;
        Wed, 09 Apr 2025 11:02:47 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc0b791sm1091597a12.28.2025.04.09.11.02.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:02:46 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac29fd22163so1249245766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1J/Rru3zZNG2LgG2heVVu6ciMw4b9NFJWCPLKsrVWXniDHx5ET2lzLgj51yMyw8y/Lk/uqSc/z9auAxg=@vger.kernel.org
X-Received: by 2002:a17:907:3f8d:b0:ac7:75b0:67d9 with SMTP id
 a640c23a62f3a-aca9b614bf9mr434720066b.4.1744221765925; Wed, 09 Apr 2025
 11:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744098446.git.jpoimboe@kernel.org> <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>
 <20250409143821.GE9833@noisy.programming.kicks-ass.net> <4q77jakv67gmglrcbzojngyutbfi3pzgsjayrymkg7dhkxo4hl@mczk3gots764>
In-Reply-To: <4q77jakv67gmglrcbzojngyutbfi3pzgsjayrymkg7dhkxo4hl@mczk3gots764>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Apr 2025 11:02:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whAtuMohKpzrzt0HFLP0RdU=KB-_4fu25gG6O4R=+PXvg@mail.gmail.com>
X-Gm-Features: ATxdqUFOiQ_tKOZcS5TVEGSjmAumzjAXnWYRgOmio6YnZvOB9gSoEEfVMNS1s34
Message-ID: <CAHk-=whAtuMohKpzrzt0HFLP0RdU=KB-_4fu25gG6O4R=+PXvg@mail.gmail.com>
Subject: Re: [PATCH RFC 4/5] x86/alternative: Improve code generation readability
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 10:41, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> I actually think the compactness of putting the entry on a single line
> is really nice.

Yeah, I think the noise with size calculations in particular is stuff
that I never look at, and making it one long line is better than
multiple lines, I think.

That said, for some of the alternatives, it would be even nicer if we
could make the noise more compact by just hardcoding sizes. Our
generic alternatives macros do result in some *very* verbose output
that is entirely illegible to humans.

And yes, we need that generic case for most of them, since the
instruction size will depend on register choice and the modrm
addressing details etc.

But some of them are kind of pointless.

I did have something that just knew that 'clac'/'stac' were three-byte
instructions (and it was very obvious indeed back when we encoded them
as such, using the ".byte" syntax).

And that avoided a *lot* of noise in the alternatives section, and
removed the subsequent ".skip" part entirely because both sides would
just use the right size without any calculations.

I can't find that hacky patch of mine, and I didn't keep it around
because it *was* hacky, but maybe I'll try to resurrect a cleaner
version of it.

There may not be very many people who care, because yeah, it really
only shows up when looking at the compiler-generated assembler output,
and I agree that that isn't exactly _common_.

              Linus
