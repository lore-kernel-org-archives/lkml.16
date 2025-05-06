Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92EF283FE8
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551018; cv=none; b=ur0KYnJIURAoGu8vHgPZAeeY5Yii8CE5AaKOHsxtTkdkQaYpWo1kuX8iB4nw14NahI+twjtp61Ip4PrzfznIpCb1t4a+c4nBhMe4Gh8Bm2Z65HC3y6iy30iHGw9NJBUyDI0BhooO0SSqWupdfquXIpfnFmWKaCW6inITcGV6OXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551018; c=relaxed/simple;
	bh=S36e/AfvMii+zYLLY4uuHcRj6uHTGDzxO9akAzlMCEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnnBQcBNB7ryVXbSaItdQeXdIauiwKyZ6irAIWmyd3oW2+IL9qgQd7MzOInxuG39PyolmnNbWR0cU48Odb+lKKANmE+AqnlWUt00SjOrrg1GgUM/nbp707Tcf/j72Cm60orqvyR2fA0/zPkhqIVSMlk6JO7KY4PWwhHcQUqxs8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TGxcufOI; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TGxcufOI"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso937610466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746551014; x=1747155814; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9tsrXetGcHXhlhDD75jAH1r6uQJobxHanpR51VAuyMw=;
        b=TGxcufOIFLu0AI7Xg65mcYE0TOk8/HYSHJ6PuTKz3jPDBghs62fZypxYZcym2ynFuQ
         geQs4D+zyrDWXPYQqrC4+8kugxI7Vld5otIEsnisnXfVhdhsPAGEUf2j4LrgkPSmJCy8
         nLbdc6XligG0LXkLfWc/iwAYSb6nz7WTuyJFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551014; x=1747155814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tsrXetGcHXhlhDD75jAH1r6uQJobxHanpR51VAuyMw=;
        b=nxaDDmxIxkqX7wMmF0A/+HEY811Ypx4fZRvX5yuGqDkAAwaD6cWtsEc27rEsyC8uQa
         1MyIJjiR+2QoJmcHZXayOpV7TuOJ4/90BEtIoYNpSOaV+DPeLLYhbvsA8T+j1LfIAAZ0
         yTgCptw7kooacI/OHrQNCrjPSIplHA8xzYuJYOZa4KzzP/Z5aayrXZwGYzmmSeaq0Sks
         aDEXPJhRJkmh7MQJzEYxf5xrtv8mkwLR4JhXqkmMEav3BSgcQm131LiY9pUTou8kyxwx
         20+lio7iCN2P0EBzmirUryvell2NSKDx3TBtA1fnQYx1Fqh2wwaIEkTsDW0ntDs0YCpf
         PFBw==
X-Forwarded-Encrypted: i=1; AJvYcCVnhZfQLbxOOxjSDp6/XS6o4TBHlJgtyWVVuImS3LZ8yEHqEapTx8Ac1ISILOR+zhfzCxl6ZcVpBfd2Ihg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+Inm/nA4Ouy4SOpoqvhXHWiU5Dj7/vLpr88qkOy9aAAe9uL8
	57hXoUz3rshaWa9m0pWfIBDUkKClbcDS1cjny5Y+Y3Zq0cpKXBTnyTtDMVtxWipXKv51COnLIkA
	Ph/Y=
X-Gm-Gg: ASbGnctgN3GTtgzQL4XoppVBHxjiSxoHU9gfmwJyEtLuzlRvx12cXAwZSJcx9fPrWwb
	67lFrlPGDsGWOBkeMYHnBs69ZMWTfV2cFhP5rZ41EmUUTAI+jznvQZELiEmSLobzIVLb2tGwJOL
	w3EujGGhY2dvlyoTugwB/LwAKG48HR+CEVlRxikW61yH/KYA2QyIwwv5/+X0xSPGlkqhGcGGGna
	1TdveiNR/mr1V/RBsenpTYqcc6t0talVEHZAxZOP2ASfP6iFGCSImomKcOX4erYnlx6pOzXSVb4
	ZOx2VtnmSGQazsOW3R8tQcA7mwzRbKrv7UcawXFLPjv7xnYZcNBBNp7iofLQFwX2RWNQPIKfEAq
	QiRAUOMlCNW9GttMtQWewfEVi0w==
X-Google-Smtp-Source: AGHT+IHZeIn3M0qVUoOcEY4wQg34jzIBzbFf6CIdav704+eg2jdwa3X94HFVPXlGN46HOTZX6hEgOw==
X-Received: by 2002:a17:907:3f92:b0:ac2:6910:a12f with SMTP id a640c23a62f3a-ad1e8cd6ab6mr23745966b.46.1746551013699;
        Tue, 06 May 2025 10:03:33 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c024asm722439066b.117.2025.05.06.10.03.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 10:03:33 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso937604566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:03:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVQdbFdxxv2M3WD4OV2GHQJkzWss9/tLE/UekXZSSXPPjj9Jf10trpJwf8GFh4SqzG9ZPFLJ/ohiqY8DQ=@vger.kernel.org
X-Received: by 2002:a17:906:ba90:b0:acb:63a4:e8e5 with SMTP id
 a640c23a62f3a-ad1e8b92457mr27316766b.6.1746551012621; Tue, 06 May 2025
 10:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com> <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
In-Reply-To: <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 May 2025 10:03:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
X-Gm-Features: ATxdqUEevwtOmN_Ygu0D9Ha17vaJcrOoRxli3ahIdE2x69cQoMke62jq9Birbdk
Message-ID: <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 09:35, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I think the first two patches are important, though, as they are about
> robustness/consistency rather than optimization.

That first patch already has another copy of that insane inline asm
optimization.

Let's fix this properly, not this disgusting way.

Let's get rid of that USE_EARLY_PGTABLE_L5 crazy case entirely, and
fix the few places where it is currently used.

That code is bogus *anyway*, because your argument for these patches
is "one single truth", but the fact is, there's at least *SIX*
different values that get set depending on this value: pgdir_shift,
ptrs_per_p4d, vmalloc_base, etc. All of those change depending on
whether we do 5-level page tables or not, so the whole argument that
"pgtable_l5_enabled() is special" is just wrong to begin with.

Any code that makes pgtable_l5_enabled() will fundamentally then just
have *another* inconsistency, namely the inconsistency between that
"is_enabled" and all the other values that L5 paging actually
modifies.

So I don't think your patches even fix anything. They only paper over
one very particular issue.

For example, as far as I can tell, the only real reason for it in
arch/x86/kernel/cpu/common.c is *one* single use where we do that

        if (!pgtable_l5_enabled())
                setup_clear_cpu_cap(X86_FEATURE_LA57);

in early_identify_cpu().

And then we have __early_make_pgtable(), but that's the SAME FILE that
has all the magical special __pgtable_l5_enabled logic anyway. So that
damn well could just write out the actual real logic, instead of using
that "is L5 enabled" helper function THAT IT IS ITSELF INITIALIZING.

So I reall ythink this whole issue goes much deeper, and is much more
broken than your patches imply. And I think your patches in many ways
make it *worse*, because they may make that pgtable_l5_enabled() be
set up early, but that just hides all the *other* issues that aren't.,

As a very real example of that, just look at what happens in
arch/x86/mm/mem_encrypt_identity.c

It does all that page table setup, but if __pgtable_l5_enabled hassn't
been set up yet, then all those *othger* values that go with it also
haven't been set up yet, so now it uses the *wrong* value for
ptrs_per_p4d etc.

And I just checked: that code very much does use ptrs_per_p4d,
although it's hidden by

                memset(p4d, 0, sizeof(*p4d) * PTRS_PER_P4D);

so I really think this is all papering over things. That code CANNOT
WORK before __pgtable_l5_enabled hass been initialized in its
*current* location.

IOW, I think your patches only make things *less* consistent, not more.

               Linus
