Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BFD156F45
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746480420; cv=none; b=VqMh7SSmIoh46AMMW5LFqndLdXvHqKbpeREi0OE0MHnH9uqggQeEd8KZM31+G9QiOWW4IguX7ao+s5+ya/x+nWScI+SLxHdFJXl1UlFh+y6IagSb4UvBWFKoop/aVzjAb2nlBs+5veZpWJeo6guxQ+yP7B2A5all1ASaf/z1aUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746480420; c=relaxed/simple;
	bh=8tIV1iyrJQBLcayr0q2mWHnEzttQRdpT4PvsD60taOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWj4fDAHhFlOAw+15GeABcXUWpHewd95KPTeHVoRv+hdhM3dP8y1n0SDzu4Y9YuvoXPjLLZyS95OC8uMVxgt8cL2XvRU/lT9ldzySBjzZVsShDoHqFtKKxdVEnl/ZtBDDbwDTNb+Nr9a1R0AJ0HoPEuVfLl/bLdaP8/okfFjhe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Zg6B/WN4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Zg6B/WN4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ace98258d4dso706894166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746480416; x=1747085216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qXgSUq4mwPPXkiPTyjzaOpkSyMaUC7J+gL7QQfgAQ34=;
        b=Zg6B/WN4vykSfusH3GUZwUay+pTZFEFhoKc9kFxN7015ROufcU7Cqyv7TIxcyaFGdV
         oBsVWUdSnPCSvgzKVTwkHs0OnBgpdwOhyiQI064lJXckCh0kkNXQKnm9SruIjzu00RtQ
         t6ubVnsZkum/yAGKIoIewjKgkh3mpFKJ1R3ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746480416; x=1747085216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXgSUq4mwPPXkiPTyjzaOpkSyMaUC7J+gL7QQfgAQ34=;
        b=t3Me9PbiEoc59zxBVtb3KO7oEL/UCY+5BhXINij4OK5LJbLsH3fIIRFxwgHM+asF4S
         WI2B4WVZoZ13IeO8M0K/WRfq6A3Y94Vz79c0PZiLr3j1Qlyyzm/FxKtV1xL0Mc0R/+81
         M420nn72bg3R+dXkMBBprxXIYd9L4zwCt8+Gf1JurDj5SWuR251TFavJRDTCWw/DyMeG
         hmsaAoGtPNlIM/oxOcLbUP8UsfHdP/dATj2iezTAqlOhIkUnY7fRgRbYTZ0s1Tn3NU9B
         TBXCAv7y6qcTEgh2nF1IDsw50b9MY0VZPpxPLwi/PuXsLL7WpkmdBxYAzNnzZiAF88rB
         /pQA==
X-Forwarded-Encrypted: i=1; AJvYcCVAwcJIuM7F5g6LNYVri3AweUMeJpEq8q6fVvQh87kyo1nn0RSF7YYYZF979k7QjZeqgvCY/I906Zt+ikE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHSZAstEstHW7Hv7Rv7ihmAEkMMO1QYno9cR9Ra70rUQfGhLmj
	ETiIx9b+wmH/eUwSbw14XdwUkJRx/44yIE5lmoSDlM60fnYr2EoElJ2NE7eASggoyhT63RtJ8zn
	ItM4=
X-Gm-Gg: ASbGnctdyzpnwVeJNcWXBSoOl0Jfd63MbFDngRNicZVpggZ22W4tpxSY26jLwR0ren3
	2n/1FXAV88H32yHSb4tv9DSovIcTvjgIcnsm7cJQoqhxhtWO4wrpj5TuRBfDUoxOcXWG4T2qtki
	BggTPYFSQpox8tsEvZ3Se+MWpFE9IBQoaf4Kur2yE9S6AorX2lsbsqpDPmDpe+gxqAiPvxaS8lk
	Og2wi25EgMfQSSJVyDUlJR9+mzLHSho8/ddtJ4efN4hlllwrPbaKdTd31+Dus7djfJOh8xHQLXJ
	SFpK/HkWPg0RkFP4/BF0czurdwtzfqFwqKkMq4u5bhMaWhUyG7THAPK4atFf7rTXOL8/HKi8RUW
	tNJGw+crPsBNeI3M=
X-Google-Smtp-Source: AGHT+IGW3nUQ61EHoWRx47/Q+X3ad8kf3PBlobxEp6BgyQRfpYqrpGKa858qqapPzM8OsghVqDhUhw==
X-Received: by 2002:a17:906:f587:b0:aca:d4f6:440d with SMTP id a640c23a62f3a-ad1d4536fc5mr55099966b.17.1746480416046;
        Mon, 05 May 2025 14:26:56 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189509088sm558389166b.146.2025.05.05.14.26.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 14:26:54 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso3562695a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW61RdaJopWITKtTokRGOQJ04MePTw/x9UzL6pj7fnmkyyQQCI/Nr173wfO7mDFlJjtqOeuBFCe7maFzKI=@vger.kernel.org
X-Received: by 2002:a05:6402:2755:b0:5fb:3ad3:cfb with SMTP id
 4fb4d7f45d1cf-5fb70d52653mr415902a12.31.1746480412818; Mon, 05 May 2025
 14:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504095230.2932860-25-ardb+git@google.com>
 <20250504095230.2932860-28-ardb+git@google.com> <aBdwwR52hI37bW9a@gmail.com>
 <CAHk-=wiaEzS_7CBVTz3RYnDt5zJus_GsPtfSjojkqiiMU-vSHQ@mail.gmail.com> <aBkogDfWB14qkY4g@gmail.com>
In-Reply-To: <aBkogDfWB14qkY4g@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 May 2025 14:26:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjVfjzxBeR9ypA6Y5dRbyKpZvQO8nsAPcFRAABW8QVzTw@mail.gmail.com>
X-Gm-Features: ATxdqUHwQ7H4IdtWIpmw2YUesU-ykS1suBpDPxucG6m-nzzuBAUCBQodQRLW3FA
Message-ID: <CAHk-=wjVfjzxBeR9ypA6Y5dRbyKpZvQO8nsAPcFRAABW8QVzTw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 03/23] x86/boot: Drop global variables keeping
 track of LA57 state
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Kevin Loughlin <kevinloughlin@google.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 14:07, Ingo Molnar <mingo@kernel.org> wrote:
>
>  - MAX_PHYSMEM_BITS: (inlined 179 times)
>
>        arch/x86/include/asm/sparsemem.h:# define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
>
>    This could be implemented via a precomputed, constant percpu value
>    (per_cpu__x86_MAX_PHYSMEM_BITS) of 52 vs. 46, eliminating not just
>    the CR4 access, but also a branch, at the cost of a percpu memory
>    access. (Which should still be a win on all microarchitectures IMO.)

This is literally why I did the "runtime-const" stuff. Exactly for
simple constants that you don't want to load from percpu memory
because it's just annoying.

Now, we only have 64-bit constant values which is very wasteful, and
we could just do a signed byte constant if we cared.

(We also have a "shift  32-bit value right by a constant amount",
which actually does use a signed byte, but it's masked by 0x1f because
that's how 32-bit shifts work).

I doubt we care - I doubt any of this MAX_PHYSMEM_BITS use is actually
performance-critical.

The runtime-const stuff would be trivial to use here if we really want to.

>  - PGDIR_SHIFT: (inlined 156 times)

Several of those are actually of the form

   #define PGDIR_SIZE      (1UL << PGDIR_SHIFT)

so you artificially see PGDIR_SHIFT as the important part, even though
it's often a different constant entirely that just gets generated
using it.

>  - p4d_offset(): (inlined 60 times)
>    Here pgtable_l5_enabled() is used as a binary flag.

static branch would probably work best, and as Ard says, just using
cpu_feature_enabled() would just fix it..

>  - pgd_none(): (inlined 49 times)
>    Binary flag use as well, although the compiler might eliminate the
>    branch here and replace it with 'AND !native_pgd_val(pgd)'

This could easily be done as runtime-const.

But again, I doubt it's all that performance-critical.

>  - PTRS_PER_P4D: (inlined 46 times)
>    This too could be implemented via a precomputed constant percpu
>    value (per_cpu__x86_PTRS_PER_P4D), eliminating a branch,
>    or via an ALTERNATIVE() immediate constant.

Again, we do have that, although the 64-bit constant is a bit wasteful.

The reason runtime-const does a 64-bit constant is that the actual
performance-critical cases were for big constants (TASK_SIZE) and for
pointers (hash table pointers).

           Linus
