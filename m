Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D791F3FE8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151842; cv=none; b=Ml6/DWsSHwKWxKtpzncTbNQxK62oOSZM7vziCYCFZjY9GFU0JcztdiSnRN683Hx2U3C1VN18B1AEY0MT6pDOrhgUbsfragxTrz5o2/xaQ5mtOfp7GjmIM2wm1405sUjffbASZqOEtwamEkqvABRHoi8fKL+fIUr4UkUQDb7yFz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151842; c=relaxed/simple;
	bh=4bez/oFMMRphE1ZaETQJAwo7TME+jkXPNxEhPzOy0tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQbozdWZwZBuJXqrtPiCmtqZrBSGFYGZuZB/kNjZCvqCl/J0klv0DZXRv9nOfe7iUPWMoKENegfg/aZ2IsrMM9sg6guQ/DzqXobhRf7w4/WzjseonRRP46X58aZ32iiFqcoJ8zZLES9XhRnP10OZ0eVLFAHJ1Smtmg2a7/rAFgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cEHuK3ai; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cEHuK3ai"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235ca5eba8cso35235ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749151840; x=1749756640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pN1olzhc8CpHBBm4iUpbGCBLbnl4LANGlw1FJXE83E=;
        b=cEHuK3aiwA/A1+KqbfY/WFSEgi7u361u5VWWDTfmz/p1dN/lCysLAL1SjxVOZP65Wd
         jsLlMgJ8mfNAzj+nbgajmcM4iRBWfigVF3HHCyYxmLapP1EDo6grpm/hGVFH1asV2+EA
         Q9zG3bnLxe98/ljK+QUVxmC+50MPmgpPptreCkygvHcPUK6CtuQS/wTOJMiFrwJFxpV5
         UpS6RqfpAFnLEacdMZaUnS8ny36Ie9ilDy/A60yc96POh6KKIrIBUe8QRZdsJwZ1CAmH
         oDrsHDWwLUx3Qe1I9PdgswTflPAZPZszd4Yt0eheY/w5AETidHIu4zitRorrRII2lchA
         qQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749151840; x=1749756640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pN1olzhc8CpHBBm4iUpbGCBLbnl4LANGlw1FJXE83E=;
        b=ErdT4gJizv7V6otzoUMtP8vGA72TOcrzpJV4HNa86kBvoWiuSlMyggeJiptulJtU7o
         J9fxVj15MhF0Xa0WAvrzdxc9y3DOFwj/RzKiy6ofanHiIcZKMJlk1FAYQwncWejR7U86
         ONs/xqIZAXK5Kg29b4KYwjqmsnJ8dBmaiYRjWzz2RoqqY1XZghcaTYH5kgu9UcKVYbw4
         k3ra2lqK+gDsSuuR4AR0KiZuRZb1HSFdOOeKmQvA4SuclPVREAYXss67RwKqvYCjXMrk
         EtKDNBFhcY9il6J8APEaDuRH9vx5IZLniklGTixpijO0nZrdoUayhj6wNVwsScM7j1+M
         BA0w==
X-Forwarded-Encrypted: i=1; AJvYcCUdNHaTEAL/MdY/IsF3v8QXRuUnoNhhiC9Ww8UUM+wjwAeZjEs/3RZpBzc/VD/GlGpK2UpwE1Dpor8ivWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJf7vvR3nUxwb1gLoeuhqcoa+bDheRwpr2GeNVUZOcvjK36loa
	ZyR4F5lCCZPKK5ryJbPdGr8yOkgHKgpA17zDGuNBKmgTzELrcUdNvF7KQ0tFdmqOAweI5FunoO1
	dtwm2ovvhz5WO/i17lUrhAI27rnHthZsBpPJe6epi
X-Gm-Gg: ASbGncvhiUzmgkm8kenIicrWvZ6NuDb9TE0A6ZhKRil8YESssG07qfxaYd4AQhSy/rZ
	kSwZx/x/p7p2T0k9UtXdpjrJxyycL7Pb0mMi7BhCZNnbXl49TANjGtAJlT3Q8rlvP3aKH48z5NE
	TkNz8Uk78sTIAWtKCb0UdcoLcbMou9C2633Xr2IqLXoC3W
X-Google-Smtp-Source: AGHT+IEZUo2qBBR9yZ8J8CWB7wPiYJhomLFn0SMyc3wIzCJ11kpp39ohznAmygfJ0IG/GUGi77IY7bYTMNdUf1wHq7Q=
X-Received: by 2002:a17:902:e747:b0:216:7aaa:4c5f with SMTP id
 d9443c01a7336-236024df8e3mr312825ad.3.1749151840320; Thu, 05 Jun 2025
 12:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHS8izMMU8QZrvXRiDjqwsBg_34s+dhvSyrU7XGMBuPF6eWyTA@mail.gmail.com>
 <770012.1748618092@warthog.procyon.org.uk> <1098853.1749051265@warthog.procyon.org.uk>
 <1099957.1749052763@warthog.procyon.org.uk>
In-Reply-To: <1099957.1749052763@warthog.procyon.org.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 5 Jun 2025 12:30:26 -0700
X-Gm-Features: AX0GCFtaQpHTxx8RriEcyQWAS8xO0zGQ8-djOws2dAzyDrQGK3gSIIJKsqf3Vq4
Message-ID: <CAHS8izPOonh6E3B+xHRSsfXpo_jHXymVyNOZOUc_1LjOtT9wow@mail.gmail.com>
Subject: Re: Device mem changes vs pinning/zerocopy changes
To: David Howells <dhowells@redhat.com>
Cc: willy@infradead.org, hch@infradead.org, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 8:59=E2=80=AFAM David Howells <dhowells@redhat.com> =
wrote:
>
> (Apologies, I accidentally sent the incomplete email)
>
> > I think you need to modify the existing sk_buff. I think adding
> > a new struct and migrating the entire net stack to use that is a bit
> > too ambitious. But up to you. Just my 2 cents here.
>
> It may come down to that, and if it does, we'll need to handle frags
> differently.  Basically, for zerocopy, the following will all apply or co=
me to
> apply sometime in the future:
>
>  (1) We're going to be getting arrays of {physaddr,len} from the higher
>      layers.  I think Christoph's idea is that this makes DMA mapping eas=
ier.
>      We will need to retain this.
>

I would punt this to a follow up project. Currently the net stack uses
pages extensively; replacing them with scatterlist-like {physaddr,
len} sounds like a huge undertaking. Especially with the conversion to
netmem_desc happening in parallel with Byungchul's series. Just my 2
cents.

--=20
Thanks,
Mina
