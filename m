Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70DA28C011
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634187; cv=none; b=LXHLJMvESpM5G1L8HzaLxwKyxI+pDDJKJXn9FF2sAV+u6JAsaWsqsSUXkagg3JI2EMkAfuZPvGq9X96DO+Fpd4t6iZBzV67f/bFynwKRRWgnrBAVdAMpRnJau+paq7IqQ3AHiHZgU8mjGWOgtZvs3PHeKBlsV7mc0Y+pqzhs9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634187; c=relaxed/simple;
	bh=ZD/l0k64hFI2nkdAKAdLu/sz13KeSlCX4Syc+oYBfO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nusqOq0lsqS38UqnvnHb57p/K/sp3iJSgTwACoEyNtbEq/ek+DfctXNtIjAt5bexvvfsCuDbCBji4809W2BopbrhG662rc5USz5GR1h6CPRd41u3On20i82AUaEBNkbXz/D1CCWGhSWx+vJYKWo4R5HGmuLq2c3dKYwbPhu5UUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eUhAAXhp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eUhAAXhp"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so112032a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746634185; x=1747238985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLejrPG7PIJ7PYQPHe6WOHWJ36xN91BpiH0KdWoRz34=;
        b=eUhAAXhpBui1VrNniZ1DtQnqRDZosn3/XW0LpncgsTElY07HAF/T16EJYKwND0Vmpl
         e9UmFY/k1c6dcfPhSoezrou/QEUVgmak82cHD0g64dsg8KUAXS86NGV0OVcC6k8fwFWw
         vNfhXVIzKgwgZIyGZ/RCnizpawUBJ5X8JGsNhwDzAHUauXwHpqY46KiCFi4AzUg5pnJK
         jt6lD5mI80HekdJ+FBQa4HgMF9PGpg9E56Qaw1YBqDwsz6rsMlIAkBhgFbHKl63bDJzI
         tu9aXpkKP1zjmVF4BmUftg9oIwW8/rfucK4Xpj+raOFkF3M2QqANp+G5xJlqH/7ENbkV
         dRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634185; x=1747238985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLejrPG7PIJ7PYQPHe6WOHWJ36xN91BpiH0KdWoRz34=;
        b=u7a2BwKBcaiyIVsVepodya9sip3RuwWU8kg39ZGdP7ApCNRs5j4yQOG1F2zX/Pznja
         u6h7G86Jc9qe09a0QLg+4geVajcWEaHogtEk2A1PTTmL6XMKULXfvgwgL+8ISW6RmW8g
         Btu5j1URNPdHYz18o9Re9jBJ9+wn2n+TMkrDc2DB3eyGaH2eVaGDBSrTnufP+5n7qcXc
         HAPl7oNGRthee5A2Cu4MTApVC4DQx69IViqFJ98cdfun/wtHrUtRJuU0wmJG8Uu3nANs
         lCqlIAhe6KSjvi0ibMTULj27LbkilVhsU3mq1bbbnTrE55QW7iorAB4LnmoWvf0+dWwv
         gazQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh548neMfibspf0Eh4Hc1NJGhTNA7hygm22UUkJVOdLFyT4KbuWT0qASU51f0XzwEY/akejo8LfQFmwdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPvOqv3FDsQYQ0CgF7AWQaGfxYyLj1cecIjouApFNjh18G8Z9
	g1BpgKoVBqxpp40ZSc/BiY48N/fpliS83W44K21FxS2rBjA8z+dfubTLGgFSYOHTO/tLAiSSpVZ
	HPfgptQRRj7PM+FaY+NAs1RoMS4h5LA3hH94HGPW6xBQBbWoyDjIE4gk=
X-Gm-Gg: ASbGncsKyA+QK7jTi1pQ6duA/bPZEGlQLOQLYBWlzqcBgMNOBHw0ggEULls75+jDByj
	rsTY/4VDaDeePCEnJjxUtBs1lCGLDJZ6FOHt5hh51lpIoYjRIk27BlN5LggVoz6pEY+7RdFIQOz
	tEHUfYPFHvz1O1udNyGpPFqirkMwexiBBB4739DCNT2L3QH8yWyA9Blzy5oMp0gsPN
X-Google-Smtp-Source: AGHT+IFTeSax/McVJZ5dd12bzpLMP5+ygFEmaJboNwHKB5nogFvtAp9RWtd8nztgLqnvcG9ib+Lq1PRWrYzcKYYqhJc=
X-Received: by 2002:a17:90b:1d82:b0:30a:4d18:c71b with SMTP id
 98e67ed59e1d1-30aac1adf44mr5603903a91.20.1746634184658; Wed, 07 May 2025
 09:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com> <20250507160012.3311104-2-glider@google.com>
In-Reply-To: <20250507160012.3311104-2-glider@google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 7 May 2025 18:09:08 +0200
X-Gm-Features: ATxdqUEUF2xw2fcMp5Sns9UdG5E_bP8PREEb_uX1l1rQb7kTDEN8klIAHon6RUU
Message-ID: <CANpmjNMUFmnVweY5zCkkszD39bhT3+eKk1-Qqc0LZTUdPN0x=Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] kmsan: fix usage of kmsan_enter_runtime() in kmsan_vmap_pages_range_noflush()
To: Alexander Potapenko <glider@google.com>
Cc: dvyukov@google.com, bvanassche@acm.org, kent.overstreet@linux.dev, 
	iii@linux.ibm.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 18:00, Alexander Potapenko <glider@google.com> wrote:
>
> Only enter the runtime to call __vmap_pages_range_noflush(), so that error
> handling does not skip kmsan_leave_runtime().
>
> This bug was spotted by CONFIG_WARN_CAPABILITY_ANALYSIS=y

Might be worth pointing out this is not yet upstream:
https://lore.kernel.org/all/20250304092417.2873893-1-elver@google.com/

Also, for future reference, feel free to dump the diff here that added
the annotations that helped you find the missing kmsan*runtime()
calls. I'm sure it'd be of interest to others. At one point we may
upstream those annotations, too, but we'll need Capability Analysis
upstream first (which is blocked by some Clang improvements that were
requested).

> Cc: Marco Elver <elver@google.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Kent Overstreet <kent.overstreet@linux.dev>
> Signed-off-by: Alexander Potapenko <glider@google.com>

Acked-by: Marco Elver <elver@google.com>

> ---
>  mm/kmsan/shadow.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> index 6d32bfc18d6a2..54f3c3c962f07 100644
> --- a/mm/kmsan/shadow.c
> +++ b/mm/kmsan/shadow.c
> @@ -247,17 +247,19 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>         kmsan_enter_runtime();
>         mapped = __vmap_pages_range_noflush(shadow_start, shadow_end, prot,
>                                             s_pages, page_shift);
> +       kmsan_leave_runtime();
>         if (mapped) {
>                 err = mapped;
>                 goto ret;
>         }
> +       kmsan_enter_runtime();
>         mapped = __vmap_pages_range_noflush(origin_start, origin_end, prot,
>                                             o_pages, page_shift);
> +       kmsan_leave_runtime();
>         if (mapped) {
>                 err = mapped;
>                 goto ret;
>         }
> -       kmsan_leave_runtime();
>         flush_tlb_kernel_range(shadow_start, shadow_end);
>         flush_tlb_kernel_range(origin_start, origin_end);
>         flush_cache_vmap(shadow_start, shadow_end);
> --
> 2.49.0.967.g6a0df3ecc3-goog
>
