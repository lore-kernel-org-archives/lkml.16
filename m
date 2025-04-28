Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB9A4A21
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745810075; cv=none; b=oVj4n6ZfA2b/Ko9akEeBcOhyyGAb0SQBWjwuAb0S2OAkBbqMfuuiA82UEpWSeRCW6cf49iuwaCTiXG+qSrGx91YbwNDlwA5S0fLJvlJf9+oXmYMf9hCgapRyDbyGxSstOTdpVw3KrYlkHApGIV9rVZQoBhKAP3p8q1PP7L5HRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745810075; c=relaxed/simple;
	bh=ztmQyQcXgyi68pKABdZSMS7g8lmmxmSOLCCyAwhTSBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/nF6PCRL/a3xmsqf9+YKKb6wI8aidzp+C5Xj8ja8qXpQ6W18uQ21QBJ7YkMojhHiayC6uIxeTPkXbCGwP2fRb3BWstorZr/NoA4vI2MsYiwd+lHBgvBLdBa7CZMTeZ1rKckID7bWrR+9MEg/I3vLJZS1hVV7FrTbqXmT6i+DXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHG7mCJe; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHG7mCJe"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso43930241fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 20:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745810072; x=1746414872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srTtWDqh3kQMLPOwQAdxuFWSFY3XFs9WRxLvh2UhnqA=;
        b=VHG7mCJetMfdolCrrM55SyOoPWmMYuHMdyErB/afK1SgLZSQ059eU4PcM8Nrx6yCpU
         hCYcykI3iqO5AqRLX2eNgxI9bUJZ2WVzfu0xf7Oy71X6fLG+OJNHMIx9foaA+Lr1Wn/S
         qtqIepHuUqNXHgHlnA0TrOAngiSUk2LyrfXjkLf0OGd9x40/u6ouKsc2JdMgzwu1o+5u
         ZF9PoIBHU+4CVCYngYEgv0hsD5jrkphNTxZj1mOifGHd2bz9AD2wTCFcPf+roT0yO2zb
         9rqqJ1xDEkBoVYRhmsrqre75q6Tuuj9HE+9mmYyZl9RveBl4HMTDExnHXvNzJwcRMXFT
         KurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745810072; x=1746414872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srTtWDqh3kQMLPOwQAdxuFWSFY3XFs9WRxLvh2UhnqA=;
        b=s4ZPDAZGFZjog/lJZBnrDqkDZgz0YD1GQANW6wCQUnqAXriolm2iQA9BJKcKQ4Fei5
         CV7sptqoKVLxsq4mYWWADC01rOKDiKNTVS+V1E6y/cMtb5Ij7Bt2VRkguJpkcpW9DOdP
         IqB66IWr0Z3F4d5CPIikguFMLPSRby4lyuNV2U/MQUH0u2ZQ8KyzKJL6OiaiUFLQF3/F
         hPwQL4HBeSON7GmCcGwPhJSCbwmE/C2A1/QsaYfJxSjcOdZutmXPXEg3GENZlcNsQqQ9
         qbHnzxk1hBwy5FVN5ZjOFEwNl0KPRoGbAvTjgbyWpSp3aR7rzcIotYJswOro3ugD1EKt
         V6RA==
X-Forwarded-Encrypted: i=1; AJvYcCWKzrB70c+mOHU7cD/KXfKnB73GDLsOY0PQikDQ7M0jyB8y06utrIGiKii00sljvPX/t16PoaJ+iYSlY6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFFJFMjDY7U2u0CRCvY5dU7LSCjDgpx5ypREdgTdXSyFfqoVR2
	FdUnYtAVjyV6DvqUD30EbPQDWAFuMDNJbp4BTlyhm3xuOi7OJRF9Uj1UuhlEdYXcw+SiWGxu/L2
	adJb78afXZfDw1muyEgA8TvNs46/by/AUINU=
X-Gm-Gg: ASbGncvl0K+NB1hacBO6+Ghnn2cR2LvYer82qgi78Xvj3Hwrc0yASY0+OzJJPQGj1xJ
	qqdEL/jpqgoh6DO9GKBnlordHHAYQPUUMTsC/Vz5WGLeFL0IRqA/tno5Nmhtmd73QJYpqOiRZKy
	+9SpKBYt3dh4p4Ez5oaL6aog==
X-Google-Smtp-Source: AGHT+IEn2HjgQ3MC/kCQOvqNKw6rj+pLRg6NeOktYXf6W95x5dyt4F/WVGM7D4lMAWpiUTq8RIO2muGQG3pluCH5GMs=
X-Received: by 2002:a2e:b8ca:0:b0:30b:ef8f:cc94 with SMTP id
 38308e7fff4ca-317cde057bcmr38431301fa.16.1745810071641; Sun, 27 Apr 2025
 20:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427185908.90450-1-ryncsn@gmail.com> <20250427185908.90450-6-ryncsn@gmail.com>
 <aA7ElItPhzNi2hCe@casper.infradead.org>
In-Reply-To: <aA7ElItPhzNi2hCe@casper.infradead.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 28 Apr 2025 11:14:14 +0800
X-Gm-Features: ATxdqUF4tu_yJM4m3azkj-yEQyWmTm-bxfC_1US0-DDxYPavH7Z79hfpBJQBsQ4
Message-ID: <CAMgjq7A6j6-XTqgkTOUwmqXf_AtvEb8sXOwoPe6JeVyDhCm+QA@mail.gmail.com>
Subject: Re: [PATCH 5/6] mm: move folio_index to mm/swap.h and remove no
 longer needed helper
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 7:58=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Mon, Apr 28, 2025 at 02:59:07AM +0800, Kairui Song wrote:
> > +++ b/mm/swap.h
> > @@ -50,6 +50,24 @@ static inline pgoff_t swap_cache_index(swp_entry_t e=
ntry)
> >       return swp_offset(entry) & SWAP_ADDRESS_SPACE_MASK;
> >  }
> >
> > +/**
> > + * folio_index - File index of a folio.
> > + * @folio: The folio.
> > + *
> > + * For a folio which is either in the page cache or the swap cache,
> > + * return its index within the address_space it belongs to.  If you kn=
ow
> > + * the page is definitely in the page cache, you can look at the folio=
's
> > + * index directly.
> > + *
> > + * Return: The index (offset in units of pages) of a folio in its file=
.
> > + */
> > +static inline pgoff_t folio_index(struct folio *folio)
> > +{
> > +     if (unlikely(folio_test_swapcache(folio)))
> > +             return swap_cache_index(folio->swap);
> > +     return folio->index;
> > +}
>
> I think the build warning can be cured by moving this outside
> CONFIG_SWAP
>

Thanks, I will fix it in V2.
