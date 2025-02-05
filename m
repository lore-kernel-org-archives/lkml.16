Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA10F189BB3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770598; cv=none; b=X/TNBJ0PHzi6vXnQGRCcNPG3zBGbvMw4BvAVam7ORZjKbmLnkTmcZ/p5Qw61iDoIEFGglKq4AL6IBXzHCHRNo9V8qwHu4YIs4+eSNx3yJLpuOpuFH0XpiqTrs323RtZOWKgc2q3Bmtl6E1WOKGT0WUj6wXzsV5U3LOKBiTN1PPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770598; c=relaxed/simple;
	bh=xh0JfPNdCk3SUlTzfhFGTuctjvre3Qgml80oJAUg178=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=qevp21c3KFUN+vh8+fSwapRNWVJi01Cur/oQxVvu8mi8QHSfHP7iQGX8wF95QerP6woLVbkAtlCKpFWsDQtdxY8IW6bRK8i5hvQSTA4GEcNQnWkKJ94HDAqsnV5kmYWkYMCQsOeexG0kJe8fl6X3VYj6wAxlKTDqABbvfaNjxfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=sZg7LUpZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="sZg7LUpZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f2cfd821eso3666065ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738770596; x=1739375396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEF5l/p5C324GLPPrgYPBLACvzIojLaAWSwDxUoWGzM=;
        b=sZg7LUpZGzGrF8w4a3YQym/nkZGDn9sXkw3jnp99kv1MxDSr/uDckkrKuf7LW2hpOK
         p3YflRZ25aPWW4J/0/v5PH5rQiFNDroE4oKOVtr8bONb9fnGxatr4q5Qf+biWh99Od7F
         FV4ExsLwsnIXPKGZh5Fys7Lx1xk7DJPUpJzEMxO4INjWchcZ/5u32OcdVv+zBaUB4gzN
         y+2S9rISONAJQfd48fTYbQiU7Vhp9igYdflKWtTY40jlPsS2vjIbkS1aMx0+IwelTfLo
         jk2bZ1idsK8U9McPi0SooKND8grhk0o4hIsvRmZzpiEDS1AVTI1MJ7QbkQNxwZQqwGyN
         EJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770596; x=1739375396;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEF5l/p5C324GLPPrgYPBLACvzIojLaAWSwDxUoWGzM=;
        b=i5HBu4fIJf1RfNLmBSb5+w2n9bmnuGXs2irWBn/BXrvMqQaTJ6a9MAHcQPkr/L54YG
         TQovoP7e2PbPJJ+I0Bf6nGxslZhpIHb4C22882aM2PGUwYlh2UjfxIF+zu24l8lLvrXk
         Q4pBf6kbxGOviF3dQW+CLI6XLqkxBt3WveKQpnB4vXTt4pLvZqi+r/Z1UZ4SdnCzn74X
         ySkGLJ1Jg49FyiGh3OyAtqmD3q3ApZrImtmqhzCFJp7iFh83A0H9uJjrFaSq/+NG7Qo6
         Tc03GRItSgnjkX+uGxoAA5RqLN4SgGwgUcbwkWbOl8vof/uUL3s6O6dgNEfuPzsYMAq4
         Qe9g==
X-Forwarded-Encrypted: i=1; AJvYcCW/AYkcnNedAqKEsOQjZbELWji1MuHikzooCU2craE7Q2uDB3ifeppJzTkU9rhEHMdZZq4lZOwDU+fvIEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUo98vUEqVITuEOE8MixwIQRkYq9ua60ockIPw87KYwtEu5sv
	hDwlIBLHU8Tc5AQd8lfvH1DfC0ZhEnnH1PEY2zl7gPzp7xo0Re0/O2yljrRR3vs=
X-Gm-Gg: ASbGncsWkmH+WABIJE8smivz3BS4J4ygG4+75GA4LGan8y/nueq4pph2sjtn8jlAzDL
	9432eHffi/Mw+4saC/cETx/PCLCpLOjmLnJ9rAdGehyFkjm436zl1AvcHAuS2RaaZ3+roYk1YiB
	FdbotY/bXyXm5NwHzF0petaMFW56nwIAHWYaOUMCDwbqtLFu5igBmWUShfgssZP+RlL7qU6tCAS
	ib9TP57c+j8/p3BtYsAViPLs1XyJpVMcU5eokGTh5zcbBY/PnVUkxt8skFL2DbyWzY3P6yvJ1dL
	UuJ4oowfyDN2
X-Google-Smtp-Source: AGHT+IHUmrYCzENxX4gtpHt6Z7EYDLhXL5NzJJrm70zCOwtBKMkO6XCbLWbJF3K01CHLL2vXmPs+9Q==
X-Received: by 2002:a17:903:22cf:b0:216:4c88:d93a with SMTP id d9443c01a7336-21f17f30666mr53671915ad.48.1738770595971;
        Wed, 05 Feb 2025 07:49:55 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f018162e2sm36808905ad.121.2025.02.05.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:49:55 -0800 (PST)
Date: Wed, 05 Feb 2025 07:49:55 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 07:49:53 PST (-0800)
Subject:     Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic functions
In-Reply-To: <17E9A830-AE5C-41F5-AC07-2BD9C70739BB@jrtc27.com>
CC: Charlie Jenkins <charlie@rivosinc.com>, samuel.holland@sifive.com,
  Conor Dooley <conor@kernel.org>, arikalo@gmail.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Will Deacon <will@kernel.org>, peterz@infradead.org,
  boqun.feng@gmail.com, Mark Rutland <mark.rutland@arm.com>, yury.norov@gmail.com,
  linux@rasmusvillemoes.dk, parri.andrea@gmail.com, leobras@redhat.com, guoren@kernel.org,
  ericchancf@google.com, linux-kernel@vger.kernel.org, djordje.todorovic@htecgroup.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jrtc27@jrtc27.com
Message-ID: <mhng-50508e34-b5cc-4dad-b4d4-7d2bac5a74d8@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 03 Feb 2025 13:34:48 PST (-0800), jrtc27@jrtc27.com wrote:
> On 3 Feb 2025, at 19:50, Charlie Jenkins <charlie@rivosinc.com> wrote:
>> 
>> On Mon, Feb 03, 2025 at 01:30:48PM -0600, Samuel Holland wrote:
>>> Hi Charlie,
>>> 
>>> On 2025-02-03 1:12 PM, Charlie Jenkins wrote:
>>>> On Sun, Feb 02, 2025 at 08:08:50PM +0000, Conor Dooley wrote:
>>>>> On Sat, Feb 01, 2025 at 01:04:25PM +0100, Aleksandar Rikalo wrote:
>>>>>> On Fri, Jan 10, 2025 at 4:23 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>>>> 
>>>>>>>> From: Chao-ying Fu <cfu@mips.com>
>>>>>>>> 
>>>>>>>> Use only LR/SC instructions to implement atomic functions.
>>>>>>> 
>>>>>>> In the previous patch you mention that this is to support MIPS P8700. Can
>>>>>>> you expand on why this change is required? The datasheet at [1] says:
>>>>>>> 
>>>>>>> "The P8700 core is configured to support the RV64GCZba_Zbb (G = IMAFD)
>>>>>>> Standard ISA. It includes the RV64I base ISA, Multiply (M), Atomic (A),
>>>>>>> Single-Precision Floating Point (F), Double (D), Compressed (C) RISC-V
>>>>>>> extensions, as well as the as well as the bit-manipulation extensions
>>>>>>> (Zba) and (Zbb)"
>>>>>>> 
>>>>>>> The "A" extension is a part of "G" which is mostly assumed to exist in
>>>>>>> the kernel. Additionally, having this be a compilation flag will cause
>>>>>>> traps on generic kernels. We generally try to push everything we can
>>>>>>> into runtime feature detection since there are so many possible variants
>>>>>>> of riscv.
>>>>>>> 
>>>>>>> Expressing not being able to perform a feature like this is normally
>>>>>>> better expressed as an errata. Then generic kernels will be able to
>>>>>>> include this, and anybody who doesn't want to have the extra nops
>>>>>>> introduced can disable the errata. A similar approach to what I pointed
>>>>>>> out last time should work here too (but with more places to replace)
>>>>>>> [2].
>>>>>>> 
>>>>>>> [1] https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
>>>>>>> [2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/
>>>>>> 
>>>>>> So far we haven't found a way to do this using errata.
>>>>> 
>>>>> You mean using alternatives? Not implementing A, but instead
>>>>> implementing Zalrsc, is not an erratum. It's a design decision.
>>>> 
>>>> We could do the same thing we do with misaligned access detection and
>>>> run some instructions to determine if these instructions are being
>>>> emulated.  If they are being emulated, patch all of the places to use
>>>> zalrsc.
>>> 
>>> Is the implication here that the riscv,isa-extensions list passed to the kernel
>>> will contain "a", even though the hardware does not support it, because AMOs are
>>> emulated in M-mode?
>>> 
>>> If that is not the case, there is no need for runtime detection. The alternative
>>> entry can check RISCV_ISA_EXT_ZAAMO (which would be implied by RISCV_ISA_EXT_a)
>>> in the ISA bitmap like normal.
>> 
>> That would be much better! I was under the assumption that the usecase
>> for this patch was that they were passing in "a" and wanting to only get
>> zalrsc. We should be able to check
>> RISCV_ISA_EXT_ZAAMO/RISCV_ISA_EXT_ZALRSC to get the information without
>> runtime detection.
>
> In LLVM at least -mcpu=mips-p8700 enables the full A extension...

So then I think we need some help from the HW vendor here.  
Specifically: do these systems implement A via M-mode traps (ie, with a 
performance penalty) or is there something functional erratum in the A 
implementation.

If it's just a performance thing then we need some benchmark justifying 
the extra work, which means some hardware we can point at to run the 
benchmark.  Probably also best to shim this in via alternatives, so we 
can keep multi-vendor kernels working.

If it's a funtional issue then we need to know what's actually broken.

Either way this should be exposed to userspace.

>
> Jess
