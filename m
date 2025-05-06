Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F09199938
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553669; cv=none; b=UPGfcx24lejtsbn26TFhyJUTXkoHzm6wuL075T+PKZ5WYxs6voEy++c+8fsjXisa1jh32ZnurJLQlq7KuDPx4+P3Y91jx3ctROR2Mi5xZn6LgemKUy3qC+GTOKnI1MV3pYLHlasts8Q085bJ38bdD2XSdSKtPIn/FF/QanEJTtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553669; c=relaxed/simple;
	bh=PSgxPp4MJsKixicUbP1+bdkRVIIg5gfWQctrU31xEzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQSrPut9USgFgp2YcDHTJ8xwr6+hbKiQbToUeYCK/8xiMEKMPSt8c/pUc0UP+JzI9f7Zr1SU2znMeSKOjwKjq0m+3BhbfCVo58bqf267f0SBgArajuIhku85tvY6tjetX+uTdvrkg/eAlSZGrauiTNVHeFRZ3T5+xq6ByA8ChTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtYQJjFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtYQJjFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E4CC4CEEB
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746553668;
	bh=PSgxPp4MJsKixicUbP1+bdkRVIIg5gfWQctrU31xEzI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gtYQJjFoEOyXMnNC6cDNFM8SjMMu5aoCBX/Sv1UInGNgZpmYLBInwpg/PuiUqlDa6
	 QMkalAITFQYbCuR+N+sNOL21nKD5AQ6UklYs1VOZxP7m49ah3nooOWOxjwXiy+5Rba
	 xX+6md3Rs4URHMBlCeJprLSktW+2Pvex404ru0WdB7Uq9DsGXKHtpl0S5ZuLWZ473W
	 ijPHs3dXnHK3RzorvbxWMdMMM4J5L1p+mGD4enarCDJ5K3dzIlBo16Uhl5C2I2vvxu
	 3iQFILcP03UYBNDfU5tVrtoJsqqdNBnVTONFYF1ZXfxyfe7+p78v5mLPpWPXTs/QtF
	 isN1mM4C0FlRA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30db1bc464dso54132521fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:47:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFMfbaS0ooLsXq+wd9K/WhGSbcTgNsRmXSkVsFT5DurGU+/Ki8BJKRHri68hMj+IkSYiAW1jz17tvnPAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2W8eNdJ8vPUNLvyB7sJ96r9+0THRcAJ4Em8tZHU8VzQWphn1
	9RTZGK6tQDjEMfYM9M9Lliph+7V8ZMYdOm2HJiMjqqh/vwRPDuKB4dynMtQLpnFIIt5EqRpYv4F
	Te5+XCN8HnRX9MwLUTcgCrBxVBHI=
X-Google-Smtp-Source: AGHT+IF8ln0zMGQFQyksiJa9iiRRhe33XJ16W0k5Na8/nmZQ7cFLplxGno1SzlGjBLb5l0ZE8vmNDbuBeodIW+xO6Mk=
X-Received: by 2002:a05:651c:516:b0:309:1e89:8518 with SMTP id
 38308e7fff4ca-3266cb09d54mr15438271fa.27.1746553666879; Tue, 06 May 2025
 10:47:46 -0700 (PDT)
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
 <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com> <aBpJV7fJNyfb7tSx@gmail.com>
In-Reply-To: <aBpJV7fJNyfb7tSx@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 May 2025 19:47:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHWHvBUnceOjpw3HeqsVLJLAp0bVE35pkCnnB0cmp2xVg@mail.gmail.com>
X-Gm-Features: ATxdqUEHyI_BcUL_QSgDR7_l31UCiWBQhgX08cbo4rVnTCUFcb4Qx8gE16VoUXM
Message-ID: <CAMj1kXHWHvBUnceOjpw3HeqsVLJLAp0bVE35pkCnnB0cmp2xVg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 19:39, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > > All of those change depending on
> > > whether we do 5-level page tables or not, so the whole argument that
> > > "pgtable_l5_enabled() is special" is just wrong to begin with.
> > >
> >
> > In my original patch, which is the one Ingo objected to,
> > pgtable_l5_enabled() is unambiguously based on whether CR4.LA57 is
> > set.
>
> So I didn't really object to the simplification aspect - I was
> criticizing the current state of LA57 handling, regardless of your
> patch. In fact in that thread I supported the simplification aspect:
>
>   > > Anyway, I'm not against Ard's simplification patch as a first step, and
>   > > any optimizations can be layered on top of that.
>
> But in hindsight I can see how my first reply came away as
> disagreement...
>

OK, so at least we all agree that there is plenty of room for
improvement here :-)

> > In the light of the above, care to comment on the previous approach?
> >
> > https://lore.kernel.org/all/20250504095230.2932860-28-ardb+git@google.com/
> >
> > That also uses the ALTERNATIVE_TERNARY() so the CR4 access gets
> > patched away, and I'm happy to take suggestions how to improve that.
>
> I still think we should introduce a LA57_ENABLED synthethic cpufeature
> flag or so for the MM constants and all the late facilities, and go
> from there.
>

It would be nice if we could set this CPU capability early on. That
way, we could just use cpu_feature_enabled(LA57_ENABLED) throughout.

I.e.,

--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -26,7 +26,8 @@ static inline bool check_la57_support(void)
        if (!(native_read_cr4() & X86_CR4_LA57))
                return false;

-       __pgtable_l5_enabled    = 1;
+       set_cpu_cap(&boot_cpu_data, X86_FEATURE_LA57_ENABLED);
+
        pgdir_shift             = 48;
        ptrs_per_p4d            = 512;
        page_offset_base        = __PAGE_OFFSET_BASE_L5;

but this requires some tweaking of the CPU feature detection code.
(Complete patch here [0])

The use of a separate feature bit is kind of orthogonal, though - it
would be a nice cleanup, but I don't see it as a prerequisite for this
change.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=la57-early-cap
