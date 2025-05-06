Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06B141A04C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746491297; cv=none; b=br0PjERba5ipHgZ8pytw/hWM4KZLitkrHajhETDap4lYOPKpFVM/76Lq0qRnoxcyJWtbOm8JyD7D930ti+SplRbGDHCNUjEpA/PaHeG5yEouQo31A/5SWM2PA/uccW3mWqpqTB2645wDXO80hirxG95xrvxjncL7JzhWBX2B/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746491297; c=relaxed/simple;
	bh=mQjcSWXrYmkl7Twom4W/YYd1ZCn+aco0xVfANaVeuBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdJd6QnmHKZRXcTzUywOHA6DjJJ6vPCTVCX0gTgNYRU55Qy4tQG0vo4kAcaxx2dExsjgsFJbmhvewMABGHXuAL6UMLZvfjyzYoOweSkSTX0Y+Ic5f0PHbvMjN78ObKRdmVVllvgWiwjhTwLZ1GpV3zlmLW5Ryejj2tnVTJvzkj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TuiD+9YA; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TuiD+9YA"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-48b7747f881so73741cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 17:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746491293; x=1747096093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy72gz7BkdTupt7lwSehvFyBx0hxLF/ZczFwTE53HNQ=;
        b=TuiD+9YAB6Ks9sDgv3XVmGVcYMKCYHx5XrBeSyNJqV6FNlEIMFzoY8XqkBa31gXm29
         dkwFxoQSZvzw4fPDzYi0T/yVQGYKbT8C5zGKs9B+6mYrGVaCiFJxkDsjn+NsbqErcSC5
         sbujXA/fpoNmRPvnWqNmDQLQSbWHjMLASFv0R0yaF+MD6jsdnVOaaq+HVwcR37F+xnrk
         FPHYQoQlXnxW3eo1gm0F9su+FuOIy57st6YDORGPxUz0zx/ToLEPDDTFphpF1+NIaf4V
         5tbpsgLI8tm+BuMkLSBHNP2uwbIMza5GwL+ZvOfWN2lgo3d3a/Bmb4JkFtofQsYPvAtx
         T7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746491293; x=1747096093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gy72gz7BkdTupt7lwSehvFyBx0hxLF/ZczFwTE53HNQ=;
        b=aYzdzza6NFL116xNhZnO1KYiKRJZV/UyytyuVBzDMid/arvTtgTvNxPfNUjsRunU2F
         SohVeVE9bVKMtZfJqKZIp81G4rpMo5Hh8GTjHePmNFxK3+yxmRi2bbyEGFROw3J9UHAi
         8g4FCEfdx9SMJEaNKbnXWbUirLTOF3zbYg/Ne+gls5L/4HOeELVvLRenW3NsuMih24yV
         oeZbAcoLPLi60tlSD/IN6SmISCcPcy/gS2S62+YHL+4NjZJ3YaEg4vcwtC4zbvoNDRw6
         wb20khL90gC2yUhHtJM8JN9xNaLDvFPNj28996bj8xK3/usUCB2/EbK5Rtp3DObOwE2F
         Selg==
X-Forwarded-Encrypted: i=1; AJvYcCUGJmHd0Lbcv1T4pcOzNlMB71vM4GmXV1wRKtSiL5m34vqc3+q7isQHC4MFwYAezTqsP/uqhFC93mZjFgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxENpnM7ZUg+MqpMp6n+kcTMPWoaR7+xKeP2yko0D9MzQ4x+uhg
	4s/CReGHFXAsRxbVZqnrtGpYIV1Z8c5ZiENCMsT9oJrgoNAWMc+TjqNSC5kspOUwDfT0bbjVAzB
	lI2TKGGECBsgTMB5b9GtmaxPD4VZnGn8TGXbg
X-Gm-Gg: ASbGncvOOVorV9S/T4tAGDJbP+2/jpEkEvHyb/b9Iqm07qV8KaygSi1HykPB9iRS6O8
	jeWS7ss3mpdd2a98QONJPjtqeKw4AxgvldpdkXritRaRyqn7FDYB+Sam6Vys1oLIjcLV879FBlx
	Xtn3ygBomz1QRjwEWvB377QCopwufAnXEcRs75wry86pQnhVbK4T2G+Sg=
X-Google-Smtp-Source: AGHT+IEzNzwtMpw0ak4BnC5/aECrxVBAC8ctyO1ioeLdEWQkCTIKbPFUc7QuRFMJnrKW/g98BAgaRG1cX4q+SScFjR0=
X-Received: by 2002:ac8:59c5:0:b0:477:2c12:9253 with SMTP id
 d75a77b69052e-490f4c1292cmr1619021cf.16.1746491293370; Mon, 05 May 2025
 17:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505185642.2377724-1-jyescas@google.com> <aBkXvB2jcxVf95uN@casper.infradead.org>
In-Reply-To: <aBkXvB2jcxVf95uN@casper.infradead.org>
From: Juan Yescas <jyescas@google.com>
Date: Mon, 5 May 2025 17:28:02 -0700
X-Gm-Features: ATxdqUFoGXZ_gkx3ceuSKYDuT6fwhmHmdBxGlaOENbPfzOY0jRlPH5_CbTHCLlc
Message-ID: <CAJDx_rhi_-ovE8AyxeC317y9vCV2NGEs1ffAcN2rWP2P7qA-xA@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page
 block order
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, tjmercier@google.com, isaacmanjarres@google.com, 
	surenb@google.com, kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 12:55=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Mon, May 05, 2025 at 11:56:21AM -0700, Juan Yescas wrote:
> > Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
> > allows to set the page block order in all the architectures.
>
> ... but it's no longer per-ARCH, so this should not be in the ARCH_
> namespace.
>

Good point. The changes are in [PATCH v3] mm: Add
CONFIG_PAGE_BLOCK_ORDER to select page block order

> >  /* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
> > -#define pageblock_order              MAX_PAGE_ORDER
> > +#define pageblock_order              PAGE_BLOCK_ORDER
>
> You need to update the comment too.
>

Done.

Thanks
Juan
