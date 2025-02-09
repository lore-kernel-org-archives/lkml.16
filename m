Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85774C9F
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739086960; cv=none; b=CbcR/7hospOepZTxHug92lW7uSCPOXY6J3yw4axzWMjSGxBbWDLeTjS9QUJz8b+a9zD2GL0/IGQjG0/7CYacCTPQAlOxXUs5C97Hk/w4fGSPhQg1bqlHzXQ+AQQ5QaF1NS+s+BZ6J2iaFuTJ7Ie9PW5ZwAiAhRKj7tUBMLPTqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739086960; c=relaxed/simple;
	bh=org9M7ak50Cd8p3r9Gm8ivtZFNvf1Lae2oaf6JHCMW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUujvmg91d7aV6vplGUd+BsGkwroqEKz84IOpy4324ee0mVAaYJ0XSS9e4LrZFo0VnxbaitIWHyCeCA1dquKzP2pDLj+5PysyojJ4RdF2yRYl+iq8mK2XBvyyFSj66qgZOnGxX/Wd4JhgBnmPlt+Wiyy04RrUkAugwJIHERdk44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SEOfnC0F; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SEOfnC0F"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f48ebaadfso50760925ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739086958; x=1739691758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aj6VsN59qgaOA6zQ8JD8ppUJ1DALJ9Qq6JDs67X+QqY=;
        b=SEOfnC0FSDRLeFjsgpdBCblmrrNdSUUBwcbq13cH77CVQ6J2u8F33NyKF/VgOYHAPo
         JP6+Jlc2FX37BC2tCymbHLK/CGuaEH+cnZ2FWpvTEALNx/BrxVNdZ+HZHPvcCkUhUZX4
         HYDX+9OPSjZmXqWGcb9y1xP+2dENQWVPpG8Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739086958; x=1739691758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj6VsN59qgaOA6zQ8JD8ppUJ1DALJ9Qq6JDs67X+QqY=;
        b=wytR+aqnxJ0g8zBg/26xpLCultSRJPwrnsW4ugkXGfGkR39Q15+2ZzF8fhWSq8QLAm
         tl3fyUZc35JuFT4PgRtmID/LJNJ7q3uRlxcGQwIVGjtHw15MMJdsHy7xgCZMeZmM2LiH
         6VMnlFQfeCP2oKuFO+o/2vepUenGxPnC51mLXX43yQzIxwu+w5lAIHlJ9HMNQgCOQiDT
         oyrBiEIHBDWpdw/fH6kIM1rpJabj0PGu9lbd2HAjnJWHcXL8p3TF+xzxVFqpLJNWzDr7
         kcTSG/CJ8C635Mii0qnstHEa1vpAbTE6p3EslqbpGyqgR5R7iBOKFIy5FrctzTtJQDrF
         j0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjLFjt1Y9pAgLmNC1SAccx7ZwNeHEieORVM8jh9SjFoVdpiP0zS1cmqOmpXGNqvsPgH6tklUySvFCSWXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpcNWXYFoN5XLYUsxfIVXav4fXqaKGF5ziX4StKAtXS/SXDxi
	iiCPhxxYK3GLdq6IybOPLh3/vkrEvEpnvg0aGtltyryG4sGg/yz3gnysAu7DMQ==
X-Gm-Gg: ASbGncvBCIc1JfEmbzsPpG5Q66M6F2pzAaNNQb0TxkEndGe9KJ80fA6ygi316zNeG/I
	Udr9NrwdLspBXHqxWln7Ku4jnz3TK8DuKw1OT3yU/EONTnLWanBlh8FVPri2peOuGVU30UXPyDP
	uW+ZIginFoCpn23sgNCaZnmFoGfLa/cztBK32/glV6xw4txnISEB6xyvhurVYfJjPrmTQhDJgFY
	3RAcnW9ES1oyuU8fTW561blYVvruP1O3/ixlLxGgNm76WRhqb5xzIpItzeCaIDy+6L5h/B65SH1
	IdBmVJUv1SnRvnaKRs8=
X-Google-Smtp-Source: AGHT+IGKafUy2lk/Tg+WrVy4kxlkIRrKteWAhCn5lUBihsfbFLKTBctMtYyDooag6ND3Sqbh1nHJkw==
X-Received: by 2002:a05:6a20:8405:b0:1e3:e77d:1431 with SMTP id adf61e73a8af0-1ee03a8dbeamr15483369637.23.1739086958097;
        Sat, 08 Feb 2025 23:42:38 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:561c:e985:5563:fc48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d4c0sm5476326b3a.22.2025.02.08.23.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 23:42:37 -0800 (PST)
Date: Sun, 9 Feb 2025 16:42:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <hvnfal244vw42valllltcfvopsyp2yqle5kdyji3flfypgwhyb@c46zib6seixb>
References: <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
 <Z6TgSaYIf1DnOszP@google.com>
 <n3k4c6qurl7vuqenxhmtxtitkeszohrcpauobwxxc4cpgbfujg@jxrinduvof6p>
 <u2o6c2zgtsol4uc53tnvi6xeksmhjjgo7xwrs4vg4wade52mbk@3iss25tlosau>
 <Z6Z1_XxcoBnM9E2o@google.com>
 <kaprll3vfmf4vxy4zigkooytykz7my2pyf4jajyxf2m7fpygyl@wgs735yktho5>
 <ua66g45kizstwe3qphtt7vld3sbznj24olqrbt6qicxeylj66n@n6zamxpiwpsh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ua66g45kizstwe3qphtt7vld3sbznj24olqrbt6qicxeylj66n@n6zamxpiwpsh>

On (25/02/09 15:22), Sergey Senozhatsky wrote:
> On (25/02/09 01:20), Sergey Senozhatsky wrote:
> > So I moved lockdep class keys to per-zram device and per-zsmalloc pool
> > to separate the lockdep chains.  Looks like that did the trick.
> 
> Also need to indicate "try lock":
> 
> drivers/block/zram/zram_drv.c
> @@ -86,7 +86,7 @@ static __must_check bool zram_slot_try_lock(struct zram *zram, u32 index)
>  
>         if (!test_and_set_bit_lock(ZRAM_ENTRY_LOCK, lock)) {
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
> -               mutex_acquire(&zram->table[index].lockdep_map, 0, 0, _RET_IP_);
> +               mutex_acquire(&zram->table[index].lockdep_map, 0, 1, _RET_IP_);
>  #endif
>                 return true;
>         }
> 
> and
> 
> mm/zsmalloc.c
> @@ -388,7 +388,7 @@ static __must_check bool zspage_try_write_lock(struct zspage *zspage)
>         preempt_disable();
>         if (atomic_try_cmpxchg_acquire(lock, &old, ZS_PAGE_WRLOCKED)) {
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
> -               rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
> +               rwsem_acquire(&zspage->lockdep_map, 0, 1, _RET_IP_);
>  #endif
>                 return true;
>         }

I guess this was the point lockdep was making.

lockdep knows about strm->lock -> shrink_folio_list which goes to ptllock
via folio_referenced and cluter_into lock via try_to_unmap.  Then lockdep
knows about zram entry->lock -> strm->lock and, most importantly, lockdep
knows about cluter_into lock -> zram_slot_free_notify() -> zram-entry->lock.
What lockdep doesn't know is that zram_slot_free_notify() is a try lock,
we don't re-enter zram unconditionally.
