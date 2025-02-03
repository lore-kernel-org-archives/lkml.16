Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A985F25A656
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611054; cv=none; b=ppo8I0gFb/o6q+vOml8TsynHDg7nlAEF2Hnn3v7SBZ0q+SFS1l63cRRIvDOd50kwl2Fr1oSLe4EwgnVmdcIeBAep6bEUrmHgRz6lZr17nRLPXDk9J8Uy2PBEvO4SQeZKORbMdDR7SVDPgU51/56+UjjArQqNJzvuBx+VVI0BHEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611054; c=relaxed/simple;
	bh=iH/DywYf7bv1qq5TRClN03em8mKs90BYicsgX7IqNl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6inFvq81o3B/womDSdMU/UL1sKJOZM29u+Ox/lYU1Uf7uZ3w9FCry7YQzhiI8oI7bSG8epkCChIAu7DASdAPR/cTElJCG5B/sBivDYgUxGIe3Z5fPtVwU2uPx6hTCvxan5t/WeI99q3WkcmwNqHfVsgCJTkhTH0vdGT/AiE2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=RzKPxGuY; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RzKPxGuY"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3cfc8772469so16528445ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738611052; x=1739215852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=668K+R2E5Th67DzQSufp3lAZyns5vzsbC/BEn5KLY64=;
        b=RzKPxGuYJR/ft4oHjWcs67GCt2OrWX5vJTsEELiCBjZENkCK34uBHK0+c5wjy/4zAT
         ZLRorrencq9YvtHBp9JiVpI/DjDs/9ErR24ay4AhOv6e4FreSn8vOWeQHm83eywneTYu
         hk8dtESc3v6Ne2R3B5pBAX7eQlO/5VhCRMCr0Bgan0VziIQBwEooHsM+/vilsIlBIA3P
         gN42hZEZZ5vNAEc/xoozt1rbbsKTaZcxef00PfeMUPXoTNTAn6RmnaZ82OZ291/5BZSL
         SMzhYa/Osm3csm7VS6vFFezpGkwxl4A1u5vByJ+T3EvQ1IgH1ziKDJJg7VWgqNAGSHLQ
         Lalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611052; x=1739215852;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=668K+R2E5Th67DzQSufp3lAZyns5vzsbC/BEn5KLY64=;
        b=WEjM2nyKBm5GRmJxBdkZTw6qSWXLpkE8fONadGK6GsBrxyxDqzxyKqHHVXj0DwrBTL
         pqK9uV6rpEH6XuF3GbpfsWAw0JaVbwC5Dw+vDizxknTZ6L0ku5cSPSLPKf6nwFHGZZG1
         FIoLrE5jnp1FEtROtdPguWPyAyW1tAxO/lL6IfXk/1p81T1DmboZvqsJiD6+r+ZvSwac
         p5LGq+lfaxiXKvzrwYFL0rOfIL2oyQb2Jw4aCqvEHY84fM9p4ClZP/R+eXwAWMxeHDJZ
         4d2LRkHZK2cVaDIvFaVfmNADxyA2AH3t3L9CL0mmMk/xweitmpxj8WA650tmF6j27PDf
         p62A==
X-Forwarded-Encrypted: i=1; AJvYcCUbqa2EDG7qwwoJHN7xe8hd0vGGfNV8g0cclkTUlZHEBfQo4kXN6QFE10CDCcM4gJnSS4NNDdzYt9DEA00=@vger.kernel.org
X-Gm-Message-State: AOJu0YwELrKHeriwKjtovYGMEl8cfOXy7heL84UNKMfoeiUSIYjcNR9i
	NJIQ5l3+3LE0wPkyOdgvz3kjAKQfD9Y021IkMTNaJRmUa7maudvZw2Yms72hwQI=
X-Gm-Gg: ASbGncsfcX0Tz7IEOU3Lig2Fzz035jzRTD+VTEKdBXgw+SqGicf3sEleqvC3S2X3OSf
	RBxmGW53YDx++YQk3Uk0PqThyhKZi4M+85s7ezciW3fgFMoAY3lo8E4bC1lagMMpcwpI2i7piAf
	I+ybzAyY/8gRgmiHl4LcrSy5KSIo10UuzbGZzCwwiRDKywsZQtZWk5h89/6AJDbHR2LkUqm5eJR
	y/zmSxXGcWC8bh+aS1XT7NjH5SuKR+5iA8yhPI23UokMoiyWqw0EtA5kj6QOErGGM+mXogMPTD+
	GLpWUkKcd++GifeUj7ffUEY6XnqyQu6ANw==
X-Google-Smtp-Source: AGHT+IFbABpV8Uj9LIoKwwHpxBqQtyfAOfzmrEnef+d6XFjuyKUbHUDqoK4KXRXN7WCIv6jozSOc2g==
X-Received: by 2002:a92:c266:0:b0:3d0:1101:9d07 with SMTP id e9e14a558f8ab-3d011019f3cmr133245175ab.10.1738611051717;
        Mon, 03 Feb 2025 11:30:51 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d00c83afb9sm23354015ab.55.2025.02.03.11.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 11:30:50 -0800 (PST)
Message-ID: <6cac61f1-cf6d-4a43-836c-e83a0b0da096@sifive.com>
Date: Mon, 3 Feb 2025 13:30:48 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
To: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrea Parri <parri.andrea@gmail.com>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, Eric Chan <ericchancf@google.com>,
 linux-kernel@vger.kernel.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud> <Z6EVIPc_t6zMU9qb@ghost>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <Z6EVIPc_t6zMU9qb@ghost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Charlie,

On 2025-02-03 1:12 PM, Charlie Jenkins wrote:
> On Sun, Feb 02, 2025 at 08:08:50PM +0000, Conor Dooley wrote:
>> On Sat, Feb 01, 2025 at 01:04:25PM +0100, Aleksandar Rikalo wrote:
>>> On Fri, Jan 10, 2025 at 4:23 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>
>>>>> From: Chao-ying Fu <cfu@mips.com>
>>>>>
>>>>> Use only LR/SC instructions to implement atomic functions.
>>>>
>>>> In the previous patch you mention that this is to support MIPS P8700. Can
>>>> you expand on why this change is required? The datasheet at [1] says:
>>>>
>>>> "The P8700 core is configured to support the RV64GCZba_Zbb (G = IMAFD)
>>>> Standard ISA. It includes the RV64I base ISA, Multiply (M), Atomic (A),
>>>> Single-Precision Floating Point (F), Double (D), Compressed (C) RISC-V
>>>> extensions, as well as the as well as the bit-manipulation extensions
>>>> (Zba) and (Zbb)"
>>>>
>>>> The "A" extension is a part of "G" which is mostly assumed to exist in
>>>> the kernel. Additionally, having this be a compilation flag will cause
>>>> traps on generic kernels. We generally try to push everything we can
>>>> into runtime feature detection since there are so many possible variants
>>>> of riscv.
>>>>
>>>> Expressing not being able to perform a feature like this is normally
>>>> better expressed as an errata. Then generic kernels will be able to
>>>> include this, and anybody who doesn't want to have the extra nops
>>>> introduced can disable the errata. A similar approach to what I pointed
>>>> out last time should work here too (but with more places to replace)
>>>> [2].
>>>>
>>>> [1] https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
>>>> [2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/
>>>
>>> So far we haven't found a way to do this using errata.
>>
>> You mean using alternatives? Not implementing A, but instead
>> implementing Zalrsc, is not an erratum. It's a design decision.
> 
> We could do the same thing we do with misaligned access detection and
> run some instructions to determine if these instructions are being
> emulated.  If they are being emulated, patch all of the places to use
> zalrsc.

Is the implication here that the riscv,isa-extensions list passed to the kernel
will contain "a", even though the hardware does not support it, because AMOs are
emulated in M-mode?

If that is not the case, there is no need for runtime detection. The alternative
entry can check RISCV_ISA_EXT_ZAAMO (which would be implied by RISCV_ISA_EXT_a)
in the ISA bitmap like normal.

Regards,
Samuel

