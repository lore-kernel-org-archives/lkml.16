Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99CF28EA54
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707587; cv=none; b=tDsq3bgSUivPIfrZ/dyVofcEYJJV0H1hG1lPIbHjoKJgUyfOmoMK12mRvSTEKR1VqSOBjhne1m3pLssXwupP/HwvpxNuOPspwvlYJPSO0wTjo++VM0IHxO2rTiuOUg/BqtH1bitT4fsE0rXO49jLx4IeS90OzkO6HbSpRyslNu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707587; c=relaxed/simple;
	bh=DbQZj3JwGAdj20SWOXAblI0aDuUNvukEyzfYAfj8eEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyT/xsLoAqKXmbUCoLi9g7LPiEJBLApK5x/f1F86R3QjuNfS1e1mhyVyseEv+J1GmYd4DW4LA+QMCrLZ4YYZmcNyg5YAz2CXwRYCyxPA4n6U/IcoIMqtyHYFte2QL5ImkWTFQJV74KAZm1Ms2LhLQ+cH4juhhrz1wvC8ubmtrbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ftTv/OlA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ftTv/OlA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac7bd86f637so183828166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743707583; x=1744312383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XtCul1Tpt2j+XuZeXAiQDSWQLc4c/tPNMr6zsbIbp7M=;
        b=ftTv/OlAonajvuKdrZqrE5i6LYbuMjZsE7UjiHVxnb3q5GoKfsQMvKQ04KYSYWi2lC
         RbyJAYNTquK+T4ivJP6+ex5rH83N7QnxW9+SOZee4yZu7B9eh+KXGA53N+UeJNS5quTy
         kmZB80FGLSMfGDdJZ0Ss3kpEw9Gx7WydmQdds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707583; x=1744312383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtCul1Tpt2j+XuZeXAiQDSWQLc4c/tPNMr6zsbIbp7M=;
        b=rhboxl5kMWBTqUW6zGSEb0h8H6MgflrBs8pqSNUuD8WSMcAk6ChYwZomf+/v0DOCyp
         2qsNPlCN/PBKjWOPQfif80dAXdATwDNXX0SGY6xj2IXi234U6z39T65x5LBFd1CXfNjR
         9g910U1guBJyTEpUcGh3LkRp5zRA5vhwIIvEvWTQZ1lgR4L6Mqf0UfbxwQAukyhsBnmA
         Ih+2CsA5RMPvG/lGr376mTSrAnXgEjX/c1vjVK3CG8/aAjAfXA/N2oDoVgAcvYh7nf1A
         EWl+uElfE1yhuRbgDlX3mkeeZoJAc+ruRj+24lvxcmVpiGCLhX2g1dfxIhiRzsx/NC2G
         f1/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbZU1XuDl48m6XdmTvwoACddgoJ6Dbuq8AzHWSOUQT6fMXx32Q0SPKJR8p8L/lNDzlvUoaau+ZAYuarJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym0BdwaUF+CGbC+KPBQGN5foyCuZyGU90Lc9WwIK+4BS2VH+0Y
	dr9+ERGuyTY0aWW4U6dWC3dGCDxN54zdzAsRgcQsZGfgHciHxXdEZ3PGWjlMIWDAyOF4PZetcLX
	O3f0=
X-Gm-Gg: ASbGncv8Ja+esBcInkUtKxnVTVoHW1B6l8uJkV6jedruMo2bq2uAPUorftkkmkQHpo1
	0nJ/4JvC3qILvnKMne7CdRwT/S2Jt/Y6NLnIFdrIrXOdIMhJR4wOV3UcP6xOzksyvVc703OlCK8
	OOkdyUUBzLypsacacPF+c7c4QWHO1h3lRA0bSw/I/HIz7RsCb7QYTWIOoP4ixpIzQ1xnWlG+Ya6
	vClXe4cj6S6FeVIA9Xpak/ezlduPj+kE0z3HHqqAblOyv+r7k5UqPAsoBs84HvyyfB0Lb7DTXBB
	0HQhsIWu+Awl+zwqfJcu8gwx1RjKSkebJA9pFAd3/QM7+Dg5z2IxerLLtL2oLXLGNx64NWd3A8B
	b9xTU26HS76J3cke2MXA=
X-Google-Smtp-Source: AGHT+IH6ZoMcw6yPGKg1z6R94vOV90osHfdf+Wz1nud7f70n2tJLdyszp4PxpF9whHteuZwe8qO6zg==
X-Received: by 2002:a17:907:2d93:b0:ac6:fc40:c999 with SMTP id a640c23a62f3a-ac7b6b2b016mr438072366b.6.1743707583080;
        Thu, 03 Apr 2025 12:13:03 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe996easm137718666b.55.2025.04.03.12.13.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 12:13:01 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2aeada833so246012466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhiOHSS32jRl6o93weeI+Wivx7c6We8S4bvKT9ZPgIwUs1tNxu2VdiUKmlrSpvnbF8thoCaAs1jKXKUPw=@vger.kernel.org
X-Received: by 2002:a17:907:9816:b0:ac7:b494:8c0c with SMTP id
 a640c23a62f3a-ac7b6c62d68mr439185566b.16.1743707581418; Thu, 03 Apr 2025
 12:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-xFKa5hiQ5urVwS@gmail.com> <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
 <Z-6gyQk2WlHc4DNw@gmail.com> <aanudixqjhm7asrp5tzsx5vc7pctei5bskdhdxk5up2g6gvqbz@z7owxfn6krgt>
 <sqn3nlc6q26h5dnwnrsikg3mthxv4o7litoilsgufq4sdhcfqd@hp4goo43hdof>
 <CAHk-=wh2WtMskQ7ASnDJ_n0ZJs4hueEXsurwQpEvzmx-aZKFag@mail.gmail.com> <mp26sywwsgekejs7fvsjhym3zunh4y42z2mkw5txi37dolas3l@zup3ny7bceaw>
In-Reply-To: <mp26sywwsgekejs7fvsjhym3zunh4y42z2mkw5txi37dolas3l@zup3ny7bceaw>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 12:12:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wixtChqkJ_NmORGMnq1pmD0x45HFgML54G2Dm-bRYAyWg@mail.gmail.com>
X-Gm-Features: ATxdqUFU8RfuTJ8KFi1ovIwijewgDOS6mUuy8vELhrDYjaHRNPWqj25ixxJvXh0
Message-ID: <CAHk-=wixtChqkJ_NmORGMnq1pmD0x45HFgML54G2Dm-bRYAyWg@mail.gmail.com>
Subject: Re: [GIT PULL] objtool fixes
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 11:24, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> There's also smap_save() / smap_restore().  For the latter we'd need to
> look for alternatives with "push reg; popf", which is definitely not
> SMAP-specific.  So we'd need to start reading feature bits again, which
> ends up even worse than what we had before.

Now, I agree that smap_save / smap_restore might be worthy of an
annotation, to show that "this is just a push/pop, but the intent is
to save AC".

Would that be ok?

Because I want to have *less* noise for clac/stac, not more.

The reason I noticed this immediately is that clac/stac are literally
one of my "top 10" things I ever look at.

The optimized user copies (so the masked_user_access_begin() ->
unsafe_get_user() -> user_read_access_end() path) and the dcache are
the two places I look at almost constantly, because it turns out that
those two things are the ones that show up the most on my machines.

The dcache doesn't do the clac/stac part (well, 'strncpy_from_user()'
does, but while that's related to, it precedes the actual pathname
lookup), so it's not like clac/stac is *all* I look at, but it really
is important to me.

             Linus
