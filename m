Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF829A0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598096; cv=none; b=nk5uRJbkk6hmVmHX4ngZJ+RBQpqfb71XpvaKagLh9wS/Q8v2VhYRSoO+8+axLvMg4ZSV254WJnDVXe6nHkramym3ToAiCzU/BP76dDq1galT+drOG7FbZ0P+VFPJXnw546z55krrLXu+TErdBqevVBNVXQA66bfWdtgq95zu1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598096; c=relaxed/simple;
	bh=g4nvhxTyxOvsu+c4Lti5TSIpl/a+nyGJc0hvXoRCZkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUhJxiNRl1UnnHzpmKH8u4IbBvgL/2EEolqFw7leWF9WifoN6FRU3Mx+PvEo8uEs9a/ZBgRVYqdJEjHbeIgtBUWh4SjgfEVqagFzXSSe0hOhCMt4eAoOxymVA2OmEQq+tpaLrQciXZGHIptJsnYbmtGmBvZpc7l5+rF4ZnPlJWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=brxdk7j3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="brxdk7j3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736c062b1f5so6737008b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746598094; x=1747202894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPLviMCblLtdTlmTDGOR7DqRoK221oLbVJ1Meb8wioM=;
        b=brxdk7j3tOT6Eq4hqPH3deYycWIqpsm+ttIwL0g2jq7yCa5VBnEDQWLhoaB/Vy99Bw
         AGz6YzqK0hcnNe1WgEqljvM3hJFM57UN+ekdCuAMy4GAcC7VA/EgX4lk+RVyAk4bDdJg
         cgguaVyqc1eaGn/GUYlaT1/A2tKMAsDrCQwOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598094; x=1747202894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPLviMCblLtdTlmTDGOR7DqRoK221oLbVJ1Meb8wioM=;
        b=bVJrxhh4USG4balpQrPePI4o93/7oUDTZ6uBQhFkUp3As1TIZlHvILcyNRokearxAz
         3Qu/dBFY4qD3J1RwPksOxiTUv9pBcTl2ZWstvc1aZjWspngwbJ3T/l8b1ykuSAwUP/fd
         48WNICGJzlHHxveSKTUZZutg6zREWOkSJpdxC/W9MHxf1XEqFLfSh8yIAm+NL37BgwsQ
         AmklOGVIB/VByLcfDQdkuLT73d5Hf/waCsn1n/+r9tZnEjhl8JuxneOg9v/dpFn5V36s
         jTkR2+YZiYvdZu2k6X3o67eQPscQtYGYdNhXE3XPZxWuZruy4B9EjxV1AMdGqDmrk+v2
         bKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfvZOZTudL8fvUO5z/R2aMrcTtJwDcizJyOzgaHMl/fySN23uu7XO2zoAQIScuEhJYYwfY+P1TvghzW2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEH2/1Py1y6WfXkzuqG8mciMAsNxYaQN8ZZqSszbQq81O4nQM
	9MFlTRkSmSXSNQnP1AOS7nU7PIB/T4mldvybEeAtHSxSGLdXLuOlZnV0LA4n2w==
X-Gm-Gg: ASbGncuBNPVkqFPeW7I8fQKD0WcflRqzf9QGeTwi7adKCvh+QDABWXhsSbfrZdEP2Di
	GUNIsyOi/oC4OIn6auU3fy4JHgrayYYgGgYCi887OB00/WuFiioBrujWqLZCBvQF3QGMiy9JuWt
	UsdIFb43gwEDxPrKvRgqF/9n5GStbTB/0yEsdfSSDGXCwp5Uj05xdjKiwHWrzsoMpKgMoqMYdQl
	g8ujwdrrTXzoAFCgxkHoK2yntELc1L2gK+3Bqi6PFit3MV0XCicOXK5yvAx6vpdreHbZbSN5yqc
	JWpVfGxcvN35D/ImIKrjNhxY07//5Z8yFrL/BrN6SiKW
X-Google-Smtp-Source: AGHT+IGk5iSUyLdcfQYnCzoPIL9eHF11OOkANIs0f4AL420z2NrtHDSKEOrCjzRea7U1wy7PxwcmMw==
X-Received: by 2002:a05:6a20:ce47:b0:1f6:6539:e026 with SMTP id adf61e73a8af0-2148bc133a3mr2769491637.15.1746598094289;
        Tue, 06 May 2025 23:08:14 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:284f:37bc:f484:cbc6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b7afd4sm7248326a12.33.2025.05.06.23.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:08:13 -0700 (PDT)
Date: Wed, 7 May 2025 15:08:08 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>

On (25/05/07 14:57), Sergey Senozhatsky wrote:
> On (25/05/06 13:13), Yosry Ahmed wrote:
> > If we can use vmalloc for zblock, then we can probably also use vmalloc
> > in zsmalloc and get rid of the chaining logic completely. This would
> > make zsmalloc simpler and closer to zblock in that regard.
> > 
> > Sergey, WDYT?
> 
> This sounds interesting.  We might get rid of lots of memcpy()
> in object read/write paths, and so on.  I don't know if 0-order
> chaining was the only option for zsmalloc, or just happened to
> be the first one.

I assume we might have problems with zspage release path.  vfree()
should break .swap_slot_free_notify, as far as I can see.
.swap_slot_free_notify is called under swap-cluster spin-lock,
so if we free the last object in the zspage we cannot immediately
free that zspage, because vfree() might_sleep().
