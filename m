Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D81E231D
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190812; cv=none; b=hsX3BUakS2crfU4TnXgltth1oTjy2RkaXtGxEtCDcAKzQPNVM2ovMITQJsnkddFoZeKWZR+iNDMx9MyKV0Fw342nNqKDaukk9kxAxwOfeyuoxP5N84Kvlunh7qQ7dVleTC02GYBiTf82ez6jHSaHly1xP86dCppfLzAa8amd4io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190812; c=relaxed/simple;
	bh=jM+JF1tuc0aPq+iNTEeRlvQCh0lTlkEWbnnMIMUHuqI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCvJxQEMUSyxzhvDgjCuMDswQUjgilqG5Ql6UKSVsT73bhMIbyT4MzuKkGY3/F4EmH70jIpTiwoQ5FwG4o2jJjVYjHnE/l0JfxXjHTcNJb9TTCHlbF6hGy3Rk3QJVAdiuMOQUpIEKKZ4IjW1HIwYtcU2b2OCtfQALX7D/B4T87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3kyPF0f; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3kyPF0f"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e06af753so74601f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738190808; x=1738795608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmvxfS/EO0PIn6aCNLLuoJebE/8xsvo0sCWW4T8X2eE=;
        b=l3kyPF0fsIwDq4fODUt8kYaP16yNpCnbRG2fkwNjjWg613jm3AgT/myBSEVd9THBR2
         2GfaMoXb61EPDFqTUsdH2SYKI3da1daNPPa04PNyc3wQIBa2pxqXAgZf1UVSYjJ/94Ot
         7SB4L0kdXSggTsqhqcwS5zNiiJhPkqLKDtEpiMd4UzT6vS/bzzEmedVBz0dmE4RWLyMn
         0ERa+w08hWw5QFJg9xDUWRUmROVFVStziNmCHOvp5gW1gqYcdeLeqNIjmQfwr45/saPH
         QErwenPAcO8Fs2714p2z5ymakx6SI5TyFycob7X/ePOWr8pkk28WNL9iAh/CGUQ4FmjB
         8ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190808; x=1738795608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmvxfS/EO0PIn6aCNLLuoJebE/8xsvo0sCWW4T8X2eE=;
        b=GWej8BVFgoOr2dBGL+kj1PGgTX/5pGcT02hChWenPla9eBtSlsRwxp9vYuSYHuT4IT
         9d/C5QVrHYdaTu+GEDwYqVq51tniuSguG2NE4Fz1cNFEUDZs3Ondv0xU1IQa2f5NhKMC
         +ramf9eXwuVu0LkGl/jU7LPKlFv3nS1J6EW7wp2m+XvgUw2kF72pi1pWEngEtMtcpGhG
         I+jAC6zhq9Plqmm0BAr3CCUqn8ejk8FjA9ak8629+mbzrATwh3dpx3WmRV83eDHkU4yx
         ai8A6+UiFnLpvY2+9Zm36MBiMoodvzg0cbqc/Q6PAEBhI5LHla8pqF75LQ/R/X3egUiY
         hcdw==
X-Forwarded-Encrypted: i=1; AJvYcCW9KWGYVYl8hynzMf89ExrZMv8qkB3qySz0fzxxkGkxymONB0SqctTOyC3e+WOh9f5C02V9JZq8EmWYo+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jzcvg6RPx96Ae/owYUavmJd/2c8bd3S3t8Za55vZRaHGBJbG
	1A7tuTh2YOChGvH5TYrCWgIp+uUTllqBFA16Ic3dfUSv1GS5XLwY
X-Gm-Gg: ASbGncu1zputxgXplnQUqDNIA18mUfG/BNcXcTyYQzcL94s3ix4jh8YGKUohaDz23A3
	ZS7ATsOW9uK2TM+EEAB5aOP/puUPKVZFl4D82PqWQjMLQrfcpyCuubW0iv0viDcqyegfxmHRwFA
	sPaaJFhGfNquBoFw170rV4Xn3ZBGk0I5zCXKkpdC0NDKPmKR4DDD4WeNTLxmODY6uU4XjxSU43a
	d1oqV1+v0UzG34KQZMX67Y7aJZHSZYvErVlf83Lo0Bt2y2i/w+gBd1IM/Ni7IVVq/YlEaP7b1Fl
	EvO90Z+LgXmaWlT+qci2UgPHFTnNh1h2cEc7acaefjVjOYQhZBxHqw==
X-Google-Smtp-Source: AGHT+IEbiT0NntEOD+phSpXzHaEDeog5yXd+fKeNamOBs2OoNyYQ2pruZWg7BKcGdm/hSVEfYQUk+A==
X-Received: by 2002:a05:6000:1788:b0:385:ef39:6ce9 with SMTP id ffacd0b85a97d-38c5194c69amr5482326f8f.21.1738190806495;
        Wed, 29 Jan 2025 14:46:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244f38esm1406115e9.26.2025.01.29.14.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:46:45 -0800 (PST)
Date: Wed, 29 Jan 2025 22:46:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Bart Van Assche <bvanassche@acm.org>, Ivan Shapovalov
 <intelfx@intelfx.name>, Andrew Morton <akpm@linux-foundation.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, David Rientjes
 <rientjes@google.com>, David Hildenbrand <david@redhat.com>, Joel Granados
 <joel.granados@kernel.org>, Sourav Panda <souravpanda@google.com>, Kaiyang
 Zhao <kaiyang2@cs.cmu.edu>, Johannes Weiner <hannes@cmpxchg.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mm/vmstat: Fix a W=1 clang compiler warning
Message-ID: <20250129224644.0f7228db@pumpkin>
In-Reply-To: <a4dc3313-b9b7-4075-b082-7232b3b7717b@suse.cz>
References: <20241212182425.ad1f7894cd0f00b2e34bbaed@linux-foundation.org>
	<20250122015818.3308696-1-intelfx@intelfx.name>
	<6a45a521-71a3-4087-9320-b8aeecea205a@acm.org>
	<a4dc3313-b9b7-4075-b082-7232b3b7717b@suse.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jan 2025 11:22:00 +0100
Vlastimil Babka <vbabka@suse.cz> wrote:

> On 1/28/25 22:36, Bart Van Assche wrote:
> > On 1/21/25 5:57 PM, Ivan Shapovalov wrote:  
> >>> Spose so.  One always suspects that adding a typecast is a sign that we
> >>> screwed things up somehow.  The relationship between enums lru_list and
> >>> node_stat_item is foggy, and I'm unsure whether this is the place to
> >>> make the transition it.  Perhaps lru_list_name() should take an
> >>> `unsigned int' arg instead.  
> >> 
> >> All of these *_name() functions do seem to expect arguments in range of
> >> the corresponding enums, so perhaps keep those args typed as a form of
> >> self-documenting code, and do this instead?  
> > 
> > If nobody objects I will submit this patch for review after the merge
> > window has closed:
> > 
> > Subject: [PATCH] mm/vmstat: Fix W=1 clang compiler warnings
> > 
> > Commit 30c2de0a267c ("mm/vmstat: fix a W=1 clang compiler warning")
> > suppresses some but not all compiler warnings that are reported by clang
> > when building with W=1 about NR_LRU_BASE and NR_ZONE_LRU_BASE. Hence
> > revert commit 30c2de0a267c and instead make NR_LRU_BASE and
> > NR_ZONE_LRU_BASE integer constants instead of enumeration constants.
> > 
> > Cc: Ivan Shapovalov <intelfx@intelfx.name>
> > Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> > ---
> >   include/linux/mmzone.h | 22 +++++++++++++++++++---
> >   include/linux/vmstat.h |  9 +++++++--
> >   2 files changed, 26 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 9540b41894da..92ed919ea99d 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -135,10 +135,19 @@ enum numa_stat_item {
> >   #define NR_VM_NUMA_EVENT_ITEMS 0
> >   #endif
> > 
> > +/*
> > + * NR_ZONE_LRU_BASE and NR_VM_ZONE_STAT_ITEMS are often added to 
> > enumeration
> > + * constants of another type than enum_zone_stat_item. Define these 
> > constants
> > + * as an integer instead of enum node_stat_item to prevent that the 
> > compiler
> > + * warns about enumeration type mismatches when these constants are used.
> > + */
> > +#define NR_ZONE_LRU_BASE	(1 * __NR_ZONE_LRU_BASE)
> > +#define NR_VM_ZONE_STAT_ITEMS	(1 * __NR_VM_ZONE_STAT_ITEMS)  
> 
> Seems an acceptable approach, dunno if this multiply by one is any better
> than casting to int?

I'd probably use (enum_value + 0) rather than a multiply.
And, if you are going to use multiply, I think it should be (value * 1)
for the same reason that 'if (1 == x)' horrible.

	David

