Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0002A221FBC
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 18:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555453; cv=none; b=FCDwPApygp8M1RKTPRi+Pg1DmeG1nxQ+6fLoB27Fr0+XqvKAx7D3WQrUEX3NTEULli0Uv26pPx3U4jvLQo3fJTAcAeSncDrQWY8sornSK+Srs/252nyu5DQ78TOviVGrLmEgQFpPxxAVCpjfat4hP+7v5eJo1L5CW3V5WWcdbyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555453; c=relaxed/simple;
	bh=y7Y9d+RzANox2+qqaCL+MzxUJmPb7O8ZAsLwLLyIZyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIp+lDem7qrrD8x263hXj/VJiLktWElzy/U8bpNnYK8XTlqNqYNA2qEmWJ46m090/mBrl8PygVOoj61UE/Tv+ugU9tIB0EAH1vDX3oX4VKJ4mrxMMkWthbusg77yDQGHwl7UN4i5KfLjUhKWyssQKbOZupj8EmuyaKxyfMozrMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TVudDeC6; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TVudDeC6"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso377858266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746555448; x=1747160248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FPIulgxlKuYRMZuK6xb/XllU+vIpireS36cyNGgbuCQ=;
        b=TVudDeC6Jk3hf7XB7WRNyL68HBT27bEEcTjisSfrfwo8be+ILtqyuonfAg3e6uzz52
         l5VGIMzv12XrOh7sk4PYJJ3MYkUIVhKebbKoWYgBthGRs+67w3tCl4hYM4TLKY5Pq2Gw
         oBeXDW4idy+YOoMyNehc6t1phB82wV1Tt/kWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746555448; x=1747160248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPIulgxlKuYRMZuK6xb/XllU+vIpireS36cyNGgbuCQ=;
        b=s1mINy2o2D8ElEjUK9EbBLp4vhANkFFz/BRlYVvJ58JPxShns33v8O5wmzYO1NvBQH
         INAG8xgC5W1X95/7cwUVWDYX6FqkCEpxtcQzCbmRGn1fNgi5bcO0gLzU77zbMs9BZcJA
         5m4h+FCoNomd14W2fWB0pTjFyWW1dBd7p+6tdxf1tONzqiCIcHIKQFP9f84iQV/yc4Dx
         1iQOQM6CPIsA8yiFQZN/4+PzMl8BDMc06v70QGzCSefE3FvZUhrA2kCXOFMSFHgnd9Fn
         NvyNFx4jcBH0FBh2wz9P4MFB/f0vgRK9WJLmoc3Vlh9mieV7zUD9eN5wi/w/5uQ6DXA/
         +Utw==
X-Forwarded-Encrypted: i=1; AJvYcCWF57PgkUjPheMWKmPJkUKjHeBciK8tr9RZf+fth3AlkA/XaBLfGTQWsuaiYmPLd96rZ45oBl//KZIzrew=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXxsyYn7X9V0xFv93KLpFp2I7qA5j3OwVbLguj83/JSq6nPx6I
	vyoW3BY2TD+Z5yCyPBvncCXZuo/XRGC7RMbloBgaawJgHZk3bLJy+9ZS1TdnI++YlWSsph4zTpp
	di4I=
X-Gm-Gg: ASbGncs1JH9Y993iHYxpJuZ3skZg5FpRwQswwzczYVhRrgaq5zrc1aigPYV3gJ3lu0b
	/SxvIAtEo+nXOQlW3KKlV6HuDVRKw9KEc79rsP8qBnRMkayVY6otHLwySj482WorO7jCAmewHB6
	HQ3Ytmgvy1VvPz6Vbb7C6H2m4U43vt7jtSULzXL3FlNnFnylfpHzSTYG5Ii4qxVS8A3Ygo3KYbg
	aPLaaD7zduJ29ApjzUzQ/TWjczWvnv+LDj6vPm7N8eFCCbM/OmUNVSxT0SiCvy+whIJK+ETqMW6
	I3/m8E3pytyPVkT+iSfBsFEMPq/tzGqk9KxtXrvkUfPcoYL/EHc/NZKuzkWp6wpHNhKZfXXVYjw
	rildx3JXbyHJINca6XN5SzUuROA==
X-Google-Smtp-Source: AGHT+IHsb17krWAFYm1+d8t8jZqsWwugqHrbdFZvS4xrwb6j+r4YWVY637BJOwRIpJ15TtDlBW02xw==
X-Received: by 2002:a17:906:dc8b:b0:ac3:b12c:b1f2 with SMTP id a640c23a62f3a-ad1e8bf70damr42494366b.35.1746555447721;
        Tue, 06 May 2025 11:17:27 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508afdsm749829166b.140.2025.05.06.11.17.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 11:17:27 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so1062758a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:17:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxYSBjYARMTYpkq3IdqgVKjWqpEj6ePYkdJXHgPV7CZtpv57dO1InGBvpUkjqq843XjNveWAdrp9HR3ME=@vger.kernel.org
X-Received: by 2002:a05:6402:26c6:b0:5de:39fd:b2f5 with SMTP id
 4fb4d7f45d1cf-5fbe9d77dbemr236721a12.1.1746555446640; Tue, 06 May 2025
 11:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
 <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
 <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
 <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com> <CAMj1kXEtW2bAQK4hN-S5C=Po5dk1q14+GJjzEJsjfz9OeOMoCg@mail.gmail.com>
In-Reply-To: <CAMj1kXEtW2bAQK4hN-S5C=Po5dk1q14+GJjzEJsjfz9OeOMoCg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 May 2025 11:17:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whRNPK7hTtPYh3SEe0WXEHR=aedc3bc-y_e08ujOxmgJg@mail.gmail.com>
X-Gm-Features: ATxdqUEG8NOjdijJRZScifQxyyYMRZQH35uZ19B1EyOlpH1dvcullkaUKFQgYZg
Message-ID: <CAHk-=whRNPK7hTtPYh3SEe0WXEHR=aedc3bc-y_e08ujOxmgJg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 10:53, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The very first thing we do when entering the core kernel is populate
> the page tables, and this uses all the macros and #define's that are
> based on pgtable_l5_enabled(). Alternatives patching occurs *much*
> later.

.. but that's my *point*.

If you depend on pgtable_l5_enabled() when you set up early paging,
you likely also depend on ptrs_per_p4d.

And if you depend on that, then you depend on having run check_la57_support().

And we should have some way to *verify* that, rather than say "you can
use pgtable_l5_enabled randomly early".

Maybe we could have a "early alternatives fixup" for this. I thnk
RISC-V does something like that, where it has separate early
alternatives fixup.

The early boot alternatives code fixup should be really easy - no need
to worry about IPIs and things like that.

Hmm?

              Linus
