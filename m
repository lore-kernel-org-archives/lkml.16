Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427282563
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739082167; cv=none; b=Lr4CTOsoVfYtsbcCMgb6p7Dj+z9ffrW6hSvDahEIT11e2mwe1jcZ5muSO/1cdlNB5mBRoXGR/Ns2sp0BAZHsRXcSg3TGm8FsM3FmI1BkGAmJZ+7IlWfKklY98ypxR80B37DiFE4A49Zadm6W0fqHa4+zFwMtB1kCojf+c2e4Q7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739082167; c=relaxed/simple;
	bh=xLBkS+VubHzMoTujQILhrmSz554T+tZspCvP7bQGyxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEPJWtNkiGyQkiQa+wIH0+/yfYnJZfchaLVmOeR+hcsrsgBdKHxfFGhpDj2tMXRuXg6IDx+vmHudum0jYDh0Ff09/HJPyD1K7mpifFxoZfTeje1fQeELXWP0WgCv4jkjQ4CwkDQfWxm5EjSycG6lM4bmVDe/bpRVlaAzzYSxU54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ho9ITlrs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ho9ITlrs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f6a47d617so13215855ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 22:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739082165; x=1739686965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldV95G1DAQLsASCDmDTeiPF4TswAK7F4G69xf6PYBcs=;
        b=ho9ITlrsMY+jEOg3qJM4Ts7a9nuBZFzFxGNJCA3UamtIBaZOx+hBAp0trhpeSYLGnt
         1BvQgz1g/mAeDlshKkUco5kLuBu1oSPsHWfYJ+fBwnRj9usQhy6ixa4fl7C5bdxLj6g8
         /do6DrvPjZElBuRbYiLG/XzpPM6NDS+PNgeGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739082165; x=1739686965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldV95G1DAQLsASCDmDTeiPF4TswAK7F4G69xf6PYBcs=;
        b=TdHWcKeXJGVOUl4ZVAPJ/wOXKTFxJtszw74eLgts2ufDLRGRGEeJ7JNl6JCkzTi+wR
         YGSiXy3Fina0jTWIbH/1u2wCkea7x0TGmsHjzow7+KGo/Udv7ZOY7djLO/n/t8uVpYXT
         FUm75OAfHonlXWnC29I3jmXmHIq76lj8UyuGDFy0z1iR6uZUi1W+IHRl0wzpPgBErQdZ
         jpfW+vn5L3aO7rKcsp1+QjRFdFsW9g4JoXSxAZ0ykZ18067aPs9BYNQBZXT65mtZqeXr
         i50oN+Nwv7iEDAvwP6/bHZY33QQQuFcMECQvMh1tYtCsU+KZPfK/tY6/Ptj6Ka4XdYqD
         Sylw==
X-Forwarded-Encrypted: i=1; AJvYcCVwNwnkL94eWNBxWRlVzDimTtjyFQlinF3n8tcYPVpYpANzpv0DUxT2O2DWaYY7egfTGoKQeDPEEtUc0AM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy6exfhS82dIZiT2mp9rTTystzvoVPyxv+EtzHT/zcGL8DtP9B
	c6iE4AXtEJ6VrBZYsTG7e6rFyCyusGPzlpdaPQigjhNmk//b1My2goe3xkGXNg==
X-Gm-Gg: ASbGnctvgsFpsasg2SkVphqXoAVta9qkZphykgfRi3B5th2ysjcE99m1F6UJpM6fjlU
	n47uR0Nal+VBScE8QnOQT2ZTq/6ccPatjDjBvNH2969a9xekQ//WLG4ecAqGmzxnM2SLNaZVbVC
	GQ7QmOFwCEimBDRNdc7/V3fqpasRmMLAoH+YsE/KRIx0pKCwMgQbZ/AtBR0xpZLDtT13YnZH/yE
	BIdz6IrsGHdMyaaqlkTePkdNViJYDHsig6Nh/TZyiyUCMwlRbJrozKPpFJ8kMXtZzz7VZ+TGyJQ
	Ru4etUQy50iXbbNA/EA=
X-Google-Smtp-Source: AGHT+IGei+zlK9G69QXNPORRGEu03xaUFQMvZa7TNr7n0U+BM/TBrxaUAjDJO+CbGVVD6isxE8/odg==
X-Received: by 2002:a17:902:db0b:b0:216:7d22:f69 with SMTP id d9443c01a7336-21f4e7799abmr155816005ad.50.1739082165445;
        Sat, 08 Feb 2025 22:22:45 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:561c:e985:5563:fc48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36511237sm55668885ad.2.2025.02.08.22.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 22:22:44 -0800 (PST)
Date: Sun, 9 Feb 2025 15:22:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <ua66g45kizstwe3qphtt7vld3sbznj24olqrbt6qicxeylj66n@n6zamxpiwpsh>
References: <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
 <Z6TgSaYIf1DnOszP@google.com>
 <n3k4c6qurl7vuqenxhmtxtitkeszohrcpauobwxxc4cpgbfujg@jxrinduvof6p>
 <u2o6c2zgtsol4uc53tnvi6xeksmhjjgo7xwrs4vg4wade52mbk@3iss25tlosau>
 <Z6Z1_XxcoBnM9E2o@google.com>
 <kaprll3vfmf4vxy4zigkooytykz7my2pyf4jajyxf2m7fpygyl@wgs735yktho5>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kaprll3vfmf4vxy4zigkooytykz7my2pyf4jajyxf2m7fpygyl@wgs735yktho5>

On (25/02/09 01:20), Sergey Senozhatsky wrote:
> So I moved lockdep class keys to per-zram device and per-zsmalloc pool
> to separate the lockdep chains.  Looks like that did the trick.

Also need to indicate "try lock":

drivers/block/zram/zram_drv.c
@@ -86,7 +86,7 @@ static __must_check bool zram_slot_try_lock(struct zram *zram, u32 index)
 
        if (!test_and_set_bit_lock(ZRAM_ENTRY_LOCK, lock)) {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
-               mutex_acquire(&zram->table[index].lockdep_map, 0, 0, _RET_IP_);
+               mutex_acquire(&zram->table[index].lockdep_map, 0, 1, _RET_IP_);
 #endif
                return true;
        }

and

mm/zsmalloc.c
@@ -388,7 +388,7 @@ static __must_check bool zspage_try_write_lock(struct zspage *zspage)
        preempt_disable();
        if (atomic_try_cmpxchg_acquire(lock, &old, ZS_PAGE_WRLOCKED)) {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
-               rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
+               rwsem_acquire(&zspage->lockdep_map, 0, 1, _RET_IP_);
 #endif
                return true;
        }
