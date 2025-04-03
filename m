Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002872417C3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666225; cv=none; b=Ps5nw7JzJpVy+3QSV0cNOkcBygS47N2OY/Etl4w5gDVOo8jXLdEVtPEGU3csICXKcxEBELzHzYmc7yKLbE8uqfgxcD3o2fwoPElb0NFLElZt64Bl+rHnas/BGg0aThDVrTLAMyeMKmfS+hOkFS3EX/FtkrVdPbei+ht8b16DLZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666225; c=relaxed/simple;
	bh=ue9hNhNOozCETPHl4JJ0z5NQFudLWVCIz5gBxU5/Y0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6lfJ8CwfsqDQ0GNdp5v5exO0u2oQTroCbBQjZxlC3QJbu1VkoI7aGj5IH3tDaoawjk3ESKEDHaEvLMGxhKuc1DGC7XoB6z7JzhhATkA88Ai6Pznzj03x16Jm42OSNOfJ56+OMjG3anlSPOY5nEEWYxvD+W6pheL5Oseg4NGu74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vegq8j8B; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vegq8j8B"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso2878985e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743666221; x=1744271021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZpyhtXuLo3xH2Sml68WjXK8wPrHfMMIBvsDm+q1RIU=;
        b=Vegq8j8Baf/g+LF8Cm29IM/UNilU22Ctp910Vg8YD5yjaRY00WgwmGuf1/u3nTIXIo
         r0AL8UnYs1uQsJ69fWBmdV2QaeH+Zks306q72Rrbg7bEnuQo7cmmk/ldb9LchlpbVGyu
         mwwuzgCAh0/5BfqZTZZ641IrN8Ar92ZeDIvi1Iv+TZlSM5pJ8LKa6AuMNPubZ9Jk0QmU
         1K5BvoJerlCjC/NeY1eIeRPC6LujNdd/Xu2TNZ97lP9J+2MRschOH1Tnj6Acula3nzG5
         pD8ebgiVPPH2Enzy2cM6RQE3ku1H32hCC43Vsrm8jHS2UeN9i7Tld9vOZP0ICF3CjrB2
         zlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743666221; x=1744271021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZpyhtXuLo3xH2Sml68WjXK8wPrHfMMIBvsDm+q1RIU=;
        b=gP4VkbFR9Ty43+IEZtp4ZVKA2dTb64UsIz7v1lyec6zPCJCcvULEZU1lcJF1qtFoUa
         gWVjsD5QnAUFygUBq7hR7Ik78V0x7uYRqa1BNix3Zypi/qZ88+B5sZZQLdkPCAV0Nclb
         XWKZm1dLvHzNioAw4rtej3TXC6DvwyqF1ECczxppYzFd3K2kwCToUpJA3qjkV1qOYUH4
         VynkAbTF8/1ojf3crM/Y8dxhmLwJMRBE4W8BwilSaMw3hGXiLk0ATcSHwDx40nitTnKl
         pUoN2e5RBG09927xGi4GOF0DyF0uRKeEkq0ejyST6ZYNb3MMpMkxQAtzqs+priqiWqZ8
         0+xw==
X-Forwarded-Encrypted: i=1; AJvYcCWc7tg48Y2nLafTaQzFN/02t1K42SiBl3460tBLK+quDD/XIxCUL5hcVBMy+SVYJF6nNCj8fjRM6yCDTzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSInzgwKuokxEpZrFemiCP3Nt4rPnjcA1mzKaUpW9eUNB2sZq8
	f8cqiL+1fAhCKFSRbu14GmzZQICCwUBR15GhZCXgnPM03Sp3NnfXSZEtepZY2kM=
X-Gm-Gg: ASbGnctcc1sjs3bMuRZd1OAzNY3w6kf7GzVSjcg4GwWd0J+8lJi1SEqoDyJtUDkXZup
	vxHFMyar8geURrn4vcxi7C3jPiH8xb8OYNR/AAv2DuEQ4BDyjAffF+/lOfvdoMPPceKvcVmeoo+
	1GLGAAEZI9xLtCCVppVlq0VaJzn6jzp34yiJo5ig/eJaqPoYL6JiuY4CaO36Py28T0ME2Flv+jr
	Y37qEC4+aWXvM7v/4yaVqC2x1PmublXNS6ftA7Kl9JCSz7Bvo8zw/kbjBK/gMxbjaaXoDKrD6e9
	Oy2EWJBPR/OQdag3hq0AOZ/89r1zUX11jJGtJtAcCrf8mtNca9pJURU=
X-Google-Smtp-Source: AGHT+IHfBIPOH1Mhz0IdEXlZe/sRjvpPG8DdHc1g9vaBkJEbUYMjBRvymcScZwZ/vEw6LkeTX74Fwg==
X-Received: by 2002:a05:600c:c12:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43ec150b3b3mr16744965e9.31.1743666221292;
        Thu, 03 Apr 2025 00:43:41 -0700 (PDT)
Received: from localhost (109-81-82-69.rct.o2.cz. [109.81.82.69])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a727bsm1021905f8f.27.2025.04.03.00.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:43:41 -0700 (PDT)
Date: Thu, 3 Apr 2025 09:43:39 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Chinner <david@fromorbit.com>, Yafang Shao <laoar.shao@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>,
	joel.granados@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH] mm: kvmalloc: make kmalloc fast path real fast path
Message-ID: <Z-48K0OdNxZXcnkB@tiehlicka>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <zeuszr6ot5qdi46f5gvxa2c5efy4mc6eaea3au52nqnbhjek7o@l43ps2jtip7x>
 <Z-43Q__lSUta2IrM@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-43Q__lSUta2IrM@tiehlicka>

There are users like xfs which need larger allocations with NOFAIL
sementic. They are not using kvmalloc currently because the current
implementation tries too hard to allocate through the kmalloc path
which causes a lot of direct reclaim and compaction and that hurts
performance a lot (see 8dc9384b7d75 ("xfs: reduce kvmalloc overhead for
CIL shadow buffers") for more details).

kvmalloc does support __GFP_RETRY_MAYFAIL semantic to express that
kmalloc (physically contiguous) allocation is preferred and we should go
more aggressive to make it happen. There is currently no way to express
that kmalloc should be very lightweight and as it has been argued [1]
this mode should be default to support kvmalloc(NOFAIL) with a
lightweight kmalloc path which is currently impossible to express as
__GFP_NOFAIL cannot be combined by any other reclaim modifiers.

This patch makes all kmalloc allocations GFP_NOWAIT unless
__GFP_RETRY_MAYFAIL is provided to kvmalloc. This allows to support both
fail fast and retry hard on physically contiguous memory with vmalloc
fallback.

There is a potential downside that relatively small allocations (smaller
than PAGE_ALLOC_COSTLY_ORDER) could fallback to vmalloc too easily and
cause page block fragmentation. We cannot really rule that out but it
seems that xlog_cil_kvmalloc use doesn't indicate this to be happening.

[1] https://lore.kernel.org/all/Z-3i1wATGh6vI8x8@dread.disaster.area/T/#u
Signed-off-by: Michal Hocko <mhocko@suse.com>
---
 mm/slub.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index b46f87662e71..2da40c2f6478 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4972,14 +4972,16 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
 	 * We want to attempt a large physically contiguous block first because
 	 * it is less likely to fragment multiple larger blocks and therefore
 	 * contribute to a long term fragmentation less than vmalloc fallback.
-	 * However make sure that larger requests are not too disruptive - no
-	 * OOM killer and no allocation failure warnings as we have a fallback.
+	 * However make sure that larger requests are not too disruptive - i.e.
+	 * do not direct reclaim unless physically continuous memory is preferred
+	 * (__GFP_RETRY_MAYFAIL mode). We still kick in kswapd/kcompactd to start
+	 * working in the background but the allocation itself.
 	 */
 	if (size > PAGE_SIZE) {
 		flags |= __GFP_NOWARN;
 
 		if (!(flags & __GFP_RETRY_MAYFAIL))
-			flags |= __GFP_NORETRY;
+			flags &= ~__GFP_DIRECT_RECLAIM;
 
 		/* nofail semantic is implemented by the vmalloc fallback */
 		flags &= ~__GFP_NOFAIL;
-- 
2.49.0

