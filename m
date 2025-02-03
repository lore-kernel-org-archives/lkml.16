Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E519D1F4275
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618503; cv=none; b=UC2zJRFCI0EADFfxYEdhykAZEdecxzTEi/zyJx4K4eoFGYWqmAEHZ446BkNOPPmkOKUYkGlvasB0L3QeM4n05zVftiKdsEnHB1am0C2zDtTXKN7w6uKsseO3SlRvQlWFv4nizD/OfDcuJ4lOpNYHDPyXCKMBxbtBnnH57GWGN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618503; c=relaxed/simple;
	bh=MCb5j+oSeHVmI+eUEl3JT4D+775hG8GZKMdFdEvsyjM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hQQeFUU/pI9mIyYipdCencBZSrDM7FIPTb209TH+XqRyZfnKsUZzgW7Y31kMmlAsjf7vW+0cqwBoc7nfU2R703kF/Hwmy5sJt/Pj0IVBT8nwoGk56fAxrJ2uhldUz1a5IQ8mPGcdDQM84rJFPSI81W54v8M6lrri8ZP+XY9LSgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=Rl1I1La8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="Rl1I1La8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2589595f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738618500; x=1739223300; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVYSR4bTXlgQ7T8K6H5ODWPt2kh41i9bq2tVocO56SE=;
        b=Rl1I1La8eZT6HxK0SjcWYwLnDqzs/5qTEl/nlcFEH3M0TN1NSjN+cPc+FMRTHyMfS5
         W6K4bHzIdbGy4NPbut7BvObkbeA/RBk02VXXdkZnwGj9+RosQmbMlmx4Z3qaCLN/Ung+
         y1HKgSotiWbW67rpXGYy9ZvDydCyrgCSFIWVlMCSOLSUb0qXajx5HAblcgGNz6qCp1nS
         Vgo996TnxnPfE8Bf/VSWtHi4hnWO4RFy7c4b3ILfJddOw7LmMHDnofgkCPzgkFzlHu6z
         +YknTTAcSWeXH76csgJAT3AcpaJa89Rz80EcicflkWI4Lbogs1GI8z3bO2/xqG8EnEhD
         RykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738618500; x=1739223300;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVYSR4bTXlgQ7T8K6H5ODWPt2kh41i9bq2tVocO56SE=;
        b=wHyo4Fl4hXk0PT/IzRwvUpEjS6BjsC8g+mG08gPeTsBhVD31/2naKJv1ZoRb5b7TXn
         H2BR8/joJf7GAPycwBr3LcBOHOic5gyxQvORJ4grsKQYjjdnQop+WgqPK1MqMbEDuM/l
         PPilP00PLT8zzKOIZRmq+qXwwJyKhyqQogdi8MYT9Gl1T5KwfdDe0XNGB56omU/CUpeT
         KJ9DlzgFx10VPd7ydXfoJZiHvla1XOtwmHOPQ6MAK8cAuMhEh96CpUupT+z08WEg4I8d
         Osq7iEahsSaMq//bHRT+F/FZAl+ssdIgQAImXYzNVgOilifFh4GYIPfwn8Y4X43KeS6e
         lp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUl2coI9oLEc/nJ2roOoq0cgPOOYugj5CvAtiR2xTlxmkDZW3eJCLpzQBdbLS9XTj4Y9Aa2Xv+tRuFFJ2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNVDV24tFd18kEZD9+09D+jQbOahnOV/qEgKJYNYs7q0CkK325
	3BBOlOpyo0FHrKDuFcdZ027QvvKlKJ9RSeJgkQUg+1449tRBVbw6cmIP94KuC+U=
X-Gm-Gg: ASbGncvxTqbOJHjK4732z797fU/KXWaimZrl2+eFva1njQztIGKZBPuDm2itP6LtHuJ
	pBoRa1HO+YU4FY+pat7LVEUlWbaZdKYHsVm7rdOBS29DZjhDJOAgVcqRyT3jJ4wQ/+eVRZZRsbg
	HASjI9abgZdZEbgaq57//vpnEEwzNIfHOXkNS6QOqeW8KXXs4frwbI/ytmmeRmdvNrR5mt1Oxta
	UuIuzRzTTuDZHFJCfzZHEFMHOZ8xTJsO8i9fPf8o2XSrWOjtdgVowfvARt/ySmn52m03whWCIes
	OL4XRQqiYRstcAcA+VMFEeuDPrW3
X-Google-Smtp-Source: AGHT+IHfpCIkZ4S+T60Xm+ShuyczBSeqMnQAFidKEp87h9uGDJX9GaMIdbY+W/cp0bHu0LZmOAbquA==
X-Received: by 2002:a5d:6d86:0:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38c5209395cmr22749650f8f.35.1738618500120;
        Mon, 03 Feb 2025 13:35:00 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de772sm166230485e9.13.2025.02.03.13.34.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2025 13:34:59 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Z6Ed6gYzdKhQQQVM@ghost>
Date: Mon, 3 Feb 2025 21:34:48 +0000
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Conor Dooley <conor@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrea Parri <parri.andrea@gmail.com>,
 Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>,
 Eric Chan <ericchancf@google.com>,
 linux-kernel@vger.kernel.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <17E9A830-AE5C-41F5-AC07-2BD9C70739BB@jrtc27.com>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud> <Z6EVIPc_t6zMU9qb@ghost>
 <6cac61f1-cf6d-4a43-836c-e83a0b0da096@sifive.com> <Z6Ed6gYzdKhQQQVM@ghost>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 3 Feb 2025, at 19:50, Charlie Jenkins <charlie@rivosinc.com> wrote:
>=20
> On Mon, Feb 03, 2025 at 01:30:48PM -0600, Samuel Holland wrote:
>> Hi Charlie,
>>=20
>> On 2025-02-03 1:12 PM, Charlie Jenkins wrote:
>>> On Sun, Feb 02, 2025 at 08:08:50PM +0000, Conor Dooley wrote:
>>>> On Sat, Feb 01, 2025 at 01:04:25PM +0100, Aleksandar Rikalo wrote:
>>>>> On Fri, Jan 10, 2025 at 4:23=E2=80=AFAM Charlie Jenkins =
<charlie@rivosinc.com> wrote:
>>>>>=20
>>>>>>> From: Chao-ying Fu <cfu@mips.com>
>>>>>>>=20
>>>>>>> Use only LR/SC instructions to implement atomic functions.
>>>>>>=20
>>>>>> In the previous patch you mention that this is to support MIPS =
P8700. Can
>>>>>> you expand on why this change is required? The datasheet at [1] =
says:
>>>>>>=20
>>>>>> "The P8700 core is configured to support the RV64GCZba_Zbb (G =3D =
IMAFD)
>>>>>> Standard ISA. It includes the RV64I base ISA, Multiply (M), =
Atomic (A),
>>>>>> Single-Precision Floating Point (F), Double (D), Compressed (C) =
RISC-V
>>>>>> extensions, as well as the as well as the bit-manipulation =
extensions
>>>>>> (Zba) and (Zbb)"
>>>>>>=20
>>>>>> The "A" extension is a part of "G" which is mostly assumed to =
exist in
>>>>>> the kernel. Additionally, having this be a compilation flag will =
cause
>>>>>> traps on generic kernels. We generally try to push everything we =
can
>>>>>> into runtime feature detection since there are so many possible =
variants
>>>>>> of riscv.
>>>>>>=20
>>>>>> Expressing not being able to perform a feature like this is =
normally
>>>>>> better expressed as an errata. Then generic kernels will be able =
to
>>>>>> include this, and anybody who doesn't want to have the extra nops
>>>>>> introduced can disable the errata. A similar approach to what I =
pointed
>>>>>> out last time should work here too (but with more places to =
replace)
>>>>>> [2].
>>>>>>=20
>>>>>> [1] =
https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
>>>>>> [2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/
>>>>>=20
>>>>> So far we haven't found a way to do this using errata.
>>>>=20
>>>> You mean using alternatives? Not implementing A, but instead
>>>> implementing Zalrsc, is not an erratum. It's a design decision.
>>>=20
>>> We could do the same thing we do with misaligned access detection =
and
>>> run some instructions to determine if these instructions are being
>>> emulated.  If they are being emulated, patch all of the places to =
use
>>> zalrsc.
>>=20
>> Is the implication here that the riscv,isa-extensions list passed to =
the kernel
>> will contain "a", even though the hardware does not support it, =
because AMOs are
>> emulated in M-mode?
>>=20
>> If that is not the case, there is no need for runtime detection. The =
alternative
>> entry can check RISCV_ISA_EXT_ZAAMO (which would be implied by =
RISCV_ISA_EXT_a)
>> in the ISA bitmap like normal.
>=20
> That would be much better! I was under the assumption that the usecase
> for this patch was that they were passing in "a" and wanting to only =
get
> zalrsc. We should be able to check
> RISCV_ISA_EXT_ZAAMO/RISCV_ISA_EXT_ZALRSC to get the information =
without
> runtime detection.

In LLVM at least -mcpu=3Dmips-p8700 enables the full A extension...

Jess

