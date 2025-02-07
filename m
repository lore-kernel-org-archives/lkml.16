Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F2D154C05
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908787; cv=none; b=ij1/76GUPCfYWJxrnHg1phxGGKut8MM4i+LQiup0XK0H1vMspW508h7vEAdySzQugF0B7q3bein50E9lnkQIaKoHiLIJrc7lTHgZta8s33LYsNVmSFIFX2KGuYwVyI36Kpf1yeRseZ/f61PNoxLr9dQQepocrQQEIj/0RFzb11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908787; c=relaxed/simple;
	bh=vPndlmynpoWcaId0O2M8HKAa+MKh/nIXthv8x/uy+xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2W41UPBz+Cy/snGTRMuae6rBrLNKrag/vcBGSKwFzJeCXMdYb23Mx+EZ3w5IfOMONAhMkOL+2kMZ6E/GULLYodtOP8dlJJirNeQZsKD7QmXkqW8AqaTDjHn1bdnNE1Am7asUdreKL35FlEi14/QIZuYvJFe5aOV3mYAIrmVLFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iy8GlqKE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iy8GlqKE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f2339dcfdso26992575ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738908785; x=1739513585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nbpgu7G4waRbMTZ8SCs1eO+mbMfqiFXDYAZSWlhLh8A=;
        b=iy8GlqKEwFNaee+AgqCgDUVyxXbeCpKxhfKuRCK9LBsJhyrJnuzikbZJEV482xkb4I
         itjwcP4PuDdhOSX76aSQGct5U8MZ++FU1jlWPgtniMZL4Sm9gcSeK6eXzzqB9FVDMhyc
         fzN7OYZW7bdf4y2Qs92ByptMLgqLYF6eUDFlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908785; x=1739513585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbpgu7G4waRbMTZ8SCs1eO+mbMfqiFXDYAZSWlhLh8A=;
        b=UJbrUAhM8oLMEHJ6ZMqy4teedg+7GxRneiuD52bs+K5LMHQrfy6QKUJ84F1Nu6GRvJ
         a3ygXm9L6Q6GNyNy41YXGlfTd2weqkD+LOnoOxNoTOjY5WI8u6wZsmjAguaajll39MnC
         mrYQceukjTi7ERPn1D59pFM2Z09nhCwbV5EGLuHx+H8kaGLbdpGHQ61WbcNH3OMYbKRV
         7Yax6RaN13vr0qv1ab/8MgQWX0w/D+Nd2rLBy8+ffqyVYLPQ5Hi5F3XzFTJCZSj+8ysT
         NA20COXtxPvEs/pXo17XWjhgBw9+jS2sU9sAmek0nD3UzRx4ap9o+AECqb9UhZwkH4sC
         xJOA==
X-Forwarded-Encrypted: i=1; AJvYcCXV7bVYdisi6UR+hCh+I+FvYNzh+qS3Oc7tymN/rwU3dnzLka1ZU+38B4UV9dknS3AWKJYtxQXMX3PX7h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnWiS1b5qwVf69tzpn6+oJsdarjZVUq4lYkf2WUBWNNAFyrJvR
	LbWWQwkB9WmmBa75sByA+67PWtcZ+bM1dcOGUmyMzS6z483aTLN8DHan23AXfQTjRltUCl7VoGY
	=
X-Gm-Gg: ASbGncvOPz/GxG7fBRiWdPul/GFKGEedJH7/r4biXrYIJW3RYXjHJzRVycGfUHjzHIs
	4G27fjUFVrmBBsQ/hq+dTFbJECG0Uhe+llLdTJq5TYmq6jaBa1HCAxqurmDU813Oob6z/Q1irXf
	FGNfYmPbZQbVx21p4a3gcDsCNGPwDClmiRX6IYy+IKdz/3SIPXq23T7i7Hkd+2KOKqbCquuNaIt
	hlPWvXiyU8R8pwFtRIO/7SoDBNgQ3tsdihAOsDU/7uJtx29LCIjUGhwT6BW4uKwRamUhnW7aaEw
	y5QpIoVgk0wXf0XANw8=
X-Google-Smtp-Source: AGHT+IGy7yTB9iK9HdDcKvVjGOD/W1ScK3E/K0xremHJT47ssRDDtg5qjD5vk+9oVudqqsZWrB5Szw==
X-Received: by 2002:a17:903:2b0c:b0:215:7287:67bb with SMTP id d9443c01a7336-21f4eff38cdmr37129805ad.0.1738908785391;
        Thu, 06 Feb 2025 22:13:05 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:ed81:aca8:eee2:aa0b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d8ffsm22636775ad.150.2025.02.06.22.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 22:13:04 -0800 (PST)
Date: Fri, 7 Feb 2025 15:12:59 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Kairui Song <ryncsn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <u2o6c2zgtsol4uc53tnvi6xeksmhjjgo7xwrs4vg4wade52mbk@3iss25tlosau>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
 <Z6TgSaYIf1DnOszP@google.com>
 <n3k4c6qurl7vuqenxhmtxtitkeszohrcpauobwxxc4cpgbfujg@jxrinduvof6p>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n3k4c6qurl7vuqenxhmtxtitkeszohrcpauobwxxc4cpgbfujg@jxrinduvof6p>

On (25/02/07 11:56), Sergey Senozhatsky wrote:
> struct zcomp_strm *zcomp_stream_get(struct zcomp *comp)
> {
>         for (;;) {
>                 struct zcomp_strm *zstrm = raw_cpu_ptr(comp->stream);
> 
>                 /*
>                  * Inspired by zswap
>                  *
>                  * stream is returned with ->mutex locked which prevents
>                  * cpu_dead() from releasing this stream under us, however
>                  * there is still a race window between raw_cpu_ptr() and
>                  * mutex_lock(), during which we could have been migrated
>                  * to a CPU that has already destroyed its stream.  If so
>                  * then unlock and re-try on the current CPU.
>                  */
>                 mutex_lock(&zstrm->lock);
>                 if (likely(zstrm->buffer))
>                         return zstrm;
>                 mutex_unlock(&zstrm->lock);
>         }
> }
> 
> void zcomp_stream_put(struct zcomp_strm *zstrm)
> {
>         mutex_unlock(&zstrm->lock);
> }
> 
> int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
> {
>         struct zcomp *comp = hlist_entry(node, struct zcomp, node);
>         struct zcomp_strm *zstrm = per_cpu_ptr(comp->stream, cpu);
> 
>         mutex_lock(&zstrm->lock);
>         zcomp_strm_free(comp, zstrm);
>         mutex_unlock(&zstrm->lock);
>         return 0;
> }

One downside of this is that this adds mutex to the locking graph and
limits what zram can do.  In particular we cannot do GFP_NOIO zsmalloc
handle allocations, because NOIO still does reclaim (doesn't reach the
block layer) which grabs some locks internally and this looks a bit
problematics:
	zram strm mutex -> zsmalloc GFP_NOIO -> reclaim
vs
	reclaim -> zram strm mutex -> zsmalloc

GFP_NOWAIT allocation has lower success chances.
