Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66787248F74
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594859; cv=none; b=Z/hycGqwdYU+yvd8xX8+AEiMEDZfcg0xAeXh+oGbbYg3QBpuqIj3NI2JvvyCP7FJpmLb/sazxzAA01t55LfTEY8WsK1RRMYl21vgXno4SAdSbCAKzl3sV4Cp58JAGdvsm/+90C61xp09MAWPSS66nlHghR9BuQUejnK3Zo17J74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594859; c=relaxed/simple;
	bh=jlyfSfSzrknY1uCTUVKvRZfAhlzNn0GbXmNu2KVJivA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItoDPStbM6LHohIHyb+5SnkmdXCGBBYyRQIxz79ma5kStR1G0+LynKH8ZRGXnb6AgsuTzjDIaSRxvOI3O+Wmbz/MpjQciQWybhbUMD/rWwS6KgL8mO96dyIFBGPnmTEfUaCb6d4Cks5+mokjrzYfeeB+zO8H0BG0ibuyv5NWq5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ynh47y1u; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ynh47y1u"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a442a3a2bfso106407851cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749594855; x=1750199655; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g8Bytf44g5ahAkLfve403jgiYb+uxN9HvR9Tj8YMufg=;
        b=ynh47y1uf2Aca+/EQgsKMojgOCmp+TfVkl7zYAk+AKnyuoxCOXrCj9n2DV7QHRsf+x
         cdueqzoWEhMqV3ZnaP4POKki5bCP7c/je5HEvaDU1d4lzDiFJr4qhKIyS4CO8xTYQGZD
         X7hi34BGQVxDxH3O8yw5973RLhC9DOjRTbIUjJWyRbT2SDwIR8EQkRxYCb2A4jfcNMC8
         Yi3cfUZZHRWv62fuvBLavl/+aabYcU8NSYOdWRZ2Xl+0BQEZ+yb3pSxYOYSWXdZznBQD
         twjR6OlIJRcOO5ipKMcuMN1HM6EbLuPWpcTXgUIUxMpCuf10fRhcQFwz8U1OEChqwjTS
         SRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594855; x=1750199655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8Bytf44g5ahAkLfve403jgiYb+uxN9HvR9Tj8YMufg=;
        b=J/PfkmSaGT9/RPY7dBRab2Ixgej9f9HvkZX7gq6x81xdSEHugWGuwDtOgUdxicqL0S
         ucq6D00V+e4lpXVJE4QUhUMrk34CkZ+waFuolMJSoNXz3fT/xpq5tgolZu4jbj028eIb
         qWd2ixD6+0KytbEkjOAteYBlJVgAUEtpPxCddK1OxV47khcuG/bjmyAaVKrO2OmVrLk7
         ujnexb/6gBzcHaB9jMZII8Y9mtgIMqCdLJ+lSXev9z2ykxb85UF5QZN9zgLm9F54J5x4
         V08pc6QTBRGpN7QQyx0vn8MUFRco3tzL3Owr68VoStXEr387VWw3dHO6RWMzdN2yvnXk
         OSqw==
X-Forwarded-Encrypted: i=1; AJvYcCVNO9duFdKKD66EdtkmLlYzSw/FnGgF9MWhixwPhN+XRNUGFAyUlbgN8mDHfepJAIh4rJH2izlPXwYOamY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcF+Hbhf8P0fU5N0ukyBVEATE+cppmfYyPmd5GFAfhJyAnA6/t
	gVeZbeOf0EyqTSalbK3TqbEHHuUSszRgDYOyG/dvav19T7GZHb1oDqJhpFkus/D0MXJYfr9wR7V
	WGT0G3L164qntRMxWadNpKQQEhg/ABMTpSwrehRriDg==
X-Gm-Gg: ASbGncvdx1A8HVZzAbQeOXcHssdFqD0yZ4SLgOQi08To/Qq7GWQctB6yMIqzU90uAzc
	TaZAKLh+ePA/nZ8D5WdD4Ii33jJ0gQZgINHa/Jb9+DnqQqebWKOvi3dWkGZU70Sqw+eM4IY1Td+
	bO9Pfzljj8ZRBYMPhDB1FXwdvxgMzYGqfF9ifQcmHWT5KLCoALlKE=
X-Google-Smtp-Source: AGHT+IHSkj9Ox3qM4oxVyr5va+0+HoSbN/LLwfuLeFvYTxchuXt69sOnDinqF5sKYnwKgdPq/ii5HJ6fe9Jm7X41Znc=
X-Received: by 2002:a05:622a:579a:b0:4a4:3be3:6d69 with SMTP id
 d75a77b69052e-4a714c8d948mr10914881cf.41.1749594855242; Tue, 10 Jun 2025
 15:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605171143.76963-1-pratyush@kernel.org> <aEKhF3HcrvG77Ogb@kernel.org>
 <mafs0jz5osutx.fsf@kernel.org> <aEc30BoLE9HRxiZm@kernel.org>
 <CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com>
 <aEfGTXrsEL5-DuF1@kernel.org> <CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
 <aEhgNU80Dr9iRwoD@kernel.org>
In-Reply-To: <aEhgNU80Dr9iRwoD@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 10 Jun 2025 18:33:38 -0400
X-Gm-Features: AX0GCFtJcS6mAcxYKHzkPfp4Zf1aggcovv204XYP6gR6eeACW9WTRiEaZ4dYXr8
Message-ID: <CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios properly
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
	Changyuan Lyu <changyuanl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

> > > I think it should be the other way around, KHO should depend on
> > > !DEFERRED_STRUCT_PAGE_INIT.
> >
> > Agreed, and this is what I first tried, but that does not work, there
> > is some circular dependency breaking the build. If you feel
> > adventurous you can try that :-)
>
> Hmm, weird, worked for me :/

I am super confused, it did not work for me over weekend, and now it
is working. Even `make menuconfig` would not work. Anyways, I will put
it in the appropriate place.

>
> > > > We will need to teah KHO to work with deferred struct page init. I
> > > > suspect, we could init preserved struct pages and then skip over them
> > > > during deferred init.
> > >
> > > We could, but with that would mean we'll run this before SMP and it's not
> > > desirable. Also, init_deferred_page() for a random page requires
> >
> > We already run KHO init before smp_init:
> > start_kernel() -> mm_core_init() -> kho_memory_init() ->
> > kho_restore_folio() -> struct pages must be already initialized here!
> >
> > While deferred struct pages are initialized:
> > start_kernel() -> rest_init() -> kernel_init() ->
> > kernel_init_freeable() -> page_alloc_init_late() ->
> > deferred_init_memmap()
> >
> > If the number of preserved pages that is needed during early boot is
> > relatively small, that it should not be an issue to pre-initialize
> > struct pages for them before deferred struct pages are initialized. We
> > already pre-initialize some  "struct pages" that are needed during
> > early boot before the reset are initialized, see deferred_grow_zone()
>
> deferred_grow_zone() takes a chunk in the beginning of uninitialized range,
> with kho we are talking about some random pages. If we preinit them early,
> deferred_init_memmap() will overwrite them.

Yes, this is why I am saying that we would need to skip the KHO
initialized "struct pages" somehow during deferred initialization. If
we create an ordered by PFN list of early-initialized KHO struct
pages, skipping during deferred initialization could be done
efficiently.

> Anyway, I'm going to look into it, hopefully I'll have something Really
> Soon (tm).

CC:  Michal Clapinski, who was also planning to look into this problem.

Pasha
