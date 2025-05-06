Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482552882BC
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746497614; cv=none; b=ERl7cdsZR0goEEn/moKh8T523yhWEIh6xCJnVRUgRWqNIDrXq97URxgmPhL4fRSxpSUwJC41Y1vrFPznELtogzXDlqqDPGPiXd5zofY+qyI5bYS8Q6Pn3A7RPeDfvIijj9vfu7tygIBMmfaRBu/lg9MP2ugffQXcZ89cNQSke+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746497614; c=relaxed/simple;
	bh=TjKaamys5tfj1/y8Wbp8cDjnbPajut/oz/96KewBhDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsVDzFaAHBjq7zY+SRusTAprXbzGUn9QpgWAGcTOMjBHrt14Vp4GUd1VIKOxmwjqoiEjElET3/3P54LzvSyKk5ytOcVHn1BTv9ah7C2k1Ok0BvAdwcgVGeWGKVuPzYozNfZMN8Z/gpWLSsgBrHnik1JKhZcVQ6bSPPhl4fw0ZKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dlollNxf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dlollNxf"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74068f95d9fso2278174b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746497612; x=1747102412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xMLIEqGfOzm0YYGILU4uDjHdyt5U0kB2OQhIe5Xv/tI=;
        b=dlollNxfQkjSZ+HnzaPunWFhFmF4iP/Nq8dq/OQsbeqoi8HgKPuZEKaHyUP6t79AuL
         oyW7v7UX9dZwHHWZm2hlqkAtpRk7MERRLA/CQuDpsTaYPYEZsIhRXtEBagU0MFyOLwWd
         nO+BHZFOMzia25AUprFuNsXaBmSXJVgsFo71I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746497612; x=1747102412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMLIEqGfOzm0YYGILU4uDjHdyt5U0kB2OQhIe5Xv/tI=;
        b=P/DUjLPyx21Cye1FSLbhfgfyIEyYyNKr1e4+m8oCkheVult+PxyQ3H7L9PqEBAJFQV
         PTXwJj7Na4OXTRyEpnczQQrT2dWtN7TsQ07dArzZlWxF3tAOpt//ok0RbbvJVKsEDtJH
         1fbcDCavJb6JsYPGT0oisFuIZx/QeSyEY4APFOrERo94j7TxjgNCR6ECbFyI++hdA2VT
         /WzVc8BaQZi67+BFz/t9XFjOpWiAQrKf6rE7Hkc0uAn3ZFJcYSxSLiU++4RvP/obsgA/
         p64nWXfgXIX+vcD15dQfpM686/JSHT32RWBfhwyo0bD/gWYazNzIei9iUbp8oapnLrgA
         di/A==
X-Forwarded-Encrypted: i=1; AJvYcCXB+NXY2KnzFbEA0GGR1map3cvwchwmdAiFSZPZAo4eN8WOldYNil/IlxG2/5kQA0EtdvLIVEldBX0wfmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtlVcZB/8pa3z42JugDVP17Fkp7odz96dlWYPfHS/59YWlM9fo
	p/3/A7yhiQrcXdh7dUd/ldbf+0zPMg5MuSAhBnPSK85XklaUoH5PH0P/8pz8Rg==
X-Gm-Gg: ASbGnctUHL10bQQFgjvz0szpFJKWk2XNjPEzxtOTKKr1L85v0dSJ2Rza+6E+GVfHlc6
	3TBDWNXigViC3zlp7SPddDVRiY4J5f1nHM0LSGi6KexoYDQw2Mv+t9Sau1z9zl8lZFLcQLQSfZD
	dsEGDN5HTSOOmXv50gJHVDimcgsutbSB3yP/wp2X55A4A/BeWjdp6eU4T9UENgz0CmDbH3gFEin
	RJiCHN37JiEcgfXzk+J8OcR+YS+kXJFgTfDKd6fQoA3uhCdc9B6TzrDgX30ECJrEHJl4EvXDrrC
	6x3eMtLRnWnScYKd2dqoOOY9ITLTSyU36LUwNj1maKX/
X-Google-Smtp-Source: AGHT+IEQVeqqIQDZUu+Q1GCjvpvnxvMpU92zElefblNq0IFwm5LHHiti0J7zMIKFuwG93HIrp+UUwA==
X-Received: by 2002:a17:90b:3a05:b0:30a:255c:9d10 with SMTP id 98e67ed59e1d1-30a7c0806demr2416920a91.8.1746497612367;
        Mon, 05 May 2025 19:13:32 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4dd5:88f9:86cd:18ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471effasm12638224a91.10.2025.05.05.19.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:13:31 -0700 (PDT)
Date: Tue, 6 May 2025 11:13:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, 
	Igor Belousov <igor.b@beldev.am>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <itnqbldahxd46zzwh5gq2iijcfrgyubp626bmr4jezpu43rkui@wal7n6ti6jq7>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <fddf0457275576c890d16921465cf473@beldev.am>
 <83CB359A-955E-48B6-B0D9-DD4F2E1146D4@konsulko.se>
 <20250505140812.GA30814@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505140812.GA30814@cmpxchg.org>

On (25/05/05 10:08), Johannes Weiner wrote:
> I've been using zsmalloc with 16k pages just fine for ~a year,
> currently running it on 6.14.2-asahi. This machine sees a lot of
> memory pressure, too.
> 
> Could this be a more recent regression, maybe in the new obj_write()?

This looks like a recent regression.  In the old code we'd something like

	__zs_map_object(area, zpdescs, off, class->size)

which would use class->size for all memcpy() calculations:

       sizes[0] = PAGE_SIZE - off;
       sizes[1] = size - sizes[0];

       /* copy object to per-cpu buffer */
       memcpy_from_page(buf, zpdesc_page(zpdescs[0]), off, sizes[0]);
       memcpy_from_page(buf + sizes[0], zpdesc_page(zpdescs[1]), 0, sizes[1]);

So we sometimes would memcpy() more than the actual payload (object size
can be smaller than class->size), which would work because compressed
buffer is huge enough.  In the new code we use object size, only for
write() tho.

read_begin()/end() still use class->size, so  I think in some cases we
can "unnecessarily" go into
	"object spans two pages, memcpy() from both pages a local copy"
even if the actual object fits on one page.  We may also want to pass the
object size (which we know) to read_begin()/end(), this potentially can
save some memcpy() calls.
