Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239321D47AD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612208; cv=none; b=nTcD5naLXAfDH1zXISctdaiDlUlY3ygxgGmtrJMjHVOJCrSpQ1vrcwHMAXcBRnAfTWoD+4BvxK99fOfjsUAe6mHEsPlPvS/G7DOLzUj97KwwMwDiHdc+YVdA555ciECjXuh86tG5XL1JWj9NO/NiCXymmL5U9Dkam+06jOF+0Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612208; c=relaxed/simple;
	bh=gclRStCHsv5L1K7SyfbAP9R/C91W3CfnMHQl5kZ0UJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zh7zRo/njZKbOZfW5h2cpjJan+jRMrDS/Viy48FYtJZ8Z91wbjUh2aPWWPMMqN4CyJ9rduIO7/gxuHbzrGiy3iLE2UsRjnhY14lEWVNX5SPFFak07iiOIsVHBMi+f/M+Q0o2zJfXCGbCZdwKA5bsnp3+jxi2LW5BPoTbNNs77bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=G8Ooq4GD; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="G8Ooq4GD"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-216395e151bso58075925ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738612205; x=1739217005; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yFHGqbxIEoUkwsAnPlyxex2jjkQB0xBfGkX7c+zLGSM=;
        b=G8Ooq4GD1eetRp/+0eKgR+FOuoRk6cbYbFg282xiDsTfP4b56EmhkO+LJtF7De/OT3
         ReG6TfpSzdwaoWGFc+XHDPZf+6AD/aRW8ERIU//h/9kfGsBLwp7e4JMNfUU9yT6b/jon
         GsB1bm1DuTGGg9Hu5Q05APn0nSxNXgr95d50b1VuXVUNqPL8WfPQfU9IAeQZZ9TsJNUL
         HoDuFEpTOt4araP4d4CjL7kmq7QMJO/3KPdv5OvjvocYUg2ed/Yz0aKHxjwtauP1DhWx
         TTQTnSUGnkxfAsTkuB61yfJE+DC1ktT3mW/7FK4NJADcfn0EOx7iejd8D4HPAWmrSIQQ
         Fq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738612205; x=1739217005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFHGqbxIEoUkwsAnPlyxex2jjkQB0xBfGkX7c+zLGSM=;
        b=eFWYYGSrClJ4qEJCrcIeQJaRgv0CkF93eYFNvDX6RECc2YNUcektPwEWwefhMpnOMm
         rp4Y1XmKe5Isw5vyF9luAtNBaVPLc4+SQXbcWtcGzmHYXGUJHrPafJS0SDJ1R+MO9n3L
         +2wdkpALetihQ078byMEjgx+BttSKbv4agfid+y73/SBRyN2MgV3BwOa3wF0mOvPUOkJ
         GYo/jft1wkgvSnBYlFZVE/9uDTdyIyznLYECsKnJJf2jSbK5i+EZXm1UZjJH5igNQWLy
         BYbGz9ACCML1xeEjzkEExkaNtNJY73JuA9jZSo4FPzY7lp0ZBRer0arBFDcMzxOgf1j1
         9a+A==
X-Forwarded-Encrypted: i=1; AJvYcCUWU91cQkFfe5zzsFCIhzv2HEnZ34o7aSbfSgsILN5S3llDCjjPnpolCErIDfQNpXFbeYPbtpwUAHI/hb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0KP8j3lDZZWRIO0ZlaSF+QCLj4M6MfMfztUk6jjXymIzPAGzX
	ODjzxZnMQ4LMbJgYwHc/u0zzPg1PDxCrl72O/tqfc0/BFkqSeJNNIx84ntdqI2A=
X-Gm-Gg: ASbGncuoqAyiNGtO23sEwConALlbvcorbJ/lU4hM3bT2OZg/XNoM0YelYFsI4zZUoTg
	olKxO/8FLm3InSgjzq4MyHRZBkwR5W6Cdk3uBGju1lmt91JtJuiv+ABnPrR5BQWwLrhnFShOueg
	rA4v9VECedYkHhV+GPiUmzxD4cWvAkQF9Ir22zL4vkFVtqYmRaOFhjPqM7RmLXQbekemD08Z5mW
	D6cidbzzsKoNvcOadub/OhOJwMQnlem2VwVit5G0bShwju/q2oBSSu89k0C5IVux1OXd0N72ABI
	6+dvxDWV/QE=
X-Google-Smtp-Source: AGHT+IEchQZJ+49I8J5Gk0AWuiHX7StzWjiS1tUolkAZSGk0Th2flkDcybEtCm4KVdc/Y9uGIZeKPQ==
X-Received: by 2002:a17:902:d50a:b0:215:9eac:1857 with SMTP id d9443c01a7336-21f01bfe998mr1628735ad.5.1738612205293;
        Mon, 03 Feb 2025 11:50:05 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f63:f9d5:2cbd:2947])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f8344sm80007255ad.75.2025.02.03.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:50:04 -0800 (PST)
Date: Mon, 3 Feb 2025 11:50:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrea Parri <parri.andrea@gmail.com>,
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	Eric Chan <ericchancf@google.com>, linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
Message-ID: <Z6Ed6gYzdKhQQQVM@ghost>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud>
 <Z6EVIPc_t6zMU9qb@ghost>
 <6cac61f1-cf6d-4a43-836c-e83a0b0da096@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cac61f1-cf6d-4a43-836c-e83a0b0da096@sifive.com>

On Mon, Feb 03, 2025 at 01:30:48PM -0600, Samuel Holland wrote:
> Hi Charlie,
> 
> On 2025-02-03 1:12 PM, Charlie Jenkins wrote:
> > On Sun, Feb 02, 2025 at 08:08:50PM +0000, Conor Dooley wrote:
> >> On Sat, Feb 01, 2025 at 01:04:25PM +0100, Aleksandar Rikalo wrote:
> >>> On Fri, Jan 10, 2025 at 4:23 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >>>
> >>>>> From: Chao-ying Fu <cfu@mips.com>
> >>>>>
> >>>>> Use only LR/SC instructions to implement atomic functions.
> >>>>
> >>>> In the previous patch you mention that this is to support MIPS P8700. Can
> >>>> you expand on why this change is required? The datasheet at [1] says:
> >>>>
> >>>> "The P8700 core is configured to support the RV64GCZba_Zbb (G = IMAFD)
> >>>> Standard ISA. It includes the RV64I base ISA, Multiply (M), Atomic (A),
> >>>> Single-Precision Floating Point (F), Double (D), Compressed (C) RISC-V
> >>>> extensions, as well as the as well as the bit-manipulation extensions
> >>>> (Zba) and (Zbb)"
> >>>>
> >>>> The "A" extension is a part of "G" which is mostly assumed to exist in
> >>>> the kernel. Additionally, having this be a compilation flag will cause
> >>>> traps on generic kernels. We generally try to push everything we can
> >>>> into runtime feature detection since there are so many possible variants
> >>>> of riscv.
> >>>>
> >>>> Expressing not being able to perform a feature like this is normally
> >>>> better expressed as an errata. Then generic kernels will be able to
> >>>> include this, and anybody who doesn't want to have the extra nops
> >>>> introduced can disable the errata. A similar approach to what I pointed
> >>>> out last time should work here too (but with more places to replace)
> >>>> [2].
> >>>>
> >>>> [1] https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
> >>>> [2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/
> >>>
> >>> So far we haven't found a way to do this using errata.
> >>
> >> You mean using alternatives? Not implementing A, but instead
> >> implementing Zalrsc, is not an erratum. It's a design decision.
> > 
> > We could do the same thing we do with misaligned access detection and
> > run some instructions to determine if these instructions are being
> > emulated.  If they are being emulated, patch all of the places to use
> > zalrsc.
> 
> Is the implication here that the riscv,isa-extensions list passed to the kernel
> will contain "a", even though the hardware does not support it, because AMOs are
> emulated in M-mode?
> 
> If that is not the case, there is no need for runtime detection. The alternative
> entry can check RISCV_ISA_EXT_ZAAMO (which would be implied by RISCV_ISA_EXT_a)
> in the ISA bitmap like normal.

That would be much better! I was under the assumption that the usecase
for this patch was that they were passing in "a" and wanting to only get
zalrsc. We should be able to check
RISCV_ISA_EXT_ZAAMO/RISCV_ISA_EXT_ZALRSC to get the information without
runtime detection.

- Charlie

> 
> Regards,
> Samuel
> 
