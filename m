Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED962475E3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805362; cv=none; b=mJZJPIi6BjNFyuHB8ShWbeSb0AH6HSa0zxYauzkj38K0Hlbz6/G4gpVVerMT6S+Fb9IaZclCB7wcqPyGMKUfqNFycgaE3iez9ewxyyGx3NOOl9D5B5ssY/GwCcbrsQmoxDE7N/HYqC6vkiuDC8hFfqyEg9mvnQZYurOTPTMS5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805362; c=relaxed/simple;
	bh=KJJV0neF/4tqhTDqAouKn+H+V0G3xU2LiQrJGxzK1q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyIy4OIJsJC86u/c2w8YyuXEMP97OvKHX4D9Fvho3sG+qbPcJ4UNX7PoJZUGCsWLKuA1gMhDZaPLVYMft0wWdWjYGjaPYuqBYw7kb33FWYgCZcJ5PrbrpFEp3aR7tOHFm46JQ5IJPAS+m1rHxvIq5pkHSwJDOeCUMDnIwwmD/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=ehGd2WyV; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="ehGd2WyV"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47663aeff1bso59171561cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744805358; x=1745410158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1olKEULH3TLy8R5wbLrrPNwtY1HPqywCtfc8xVQ228=;
        b=ehGd2WyVf/DwmHX9Odf+kejEnrZOv/fMaKHtC3siJttkkGAfMWsoKv4aMw2PmPLw1a
         yzIPN/sXZtWNVHj/OnEdthD1CcNpqG1fgdzka99osbda36enH5ozF+XkXSGAUZ7kst8I
         MquupOMOCRS2ZpmjgGObSqc/ToDsE6xIjmQmfgygzByT/9a5hes5wZewINoSCliUug+M
         7UUa9XaFMlELebrmD453dSXyND8B87wSCK06ORgPmfaOmt1DMIOXP8OvgB1WPvesh782
         MP6gOjVjNPubIV1Dv0MJc25IVg82dGCnDAjTHDWqt+JVaiHw9uUU+Tnsr3eL/1bw26Hu
         WuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805358; x=1745410158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1olKEULH3TLy8R5wbLrrPNwtY1HPqywCtfc8xVQ228=;
        b=SJWiY+ieBelsDjpUNrvn51ufNmWWfTWeV3fRt/UcHFtkDej6F/gTcSPCY/E09EbKV4
         OgEdAfyoFTs3LJKnn9Mu8jABlLePJsUjUQbhAYcwCYU4CacRdZHGV9GyzTw5qZ87sSVt
         wZdN45NHvooYyGh8RV8NBu2jaWxfCBfkbwIy9aFW5EhhqtYxnMBQm1Do1k19euFQpgDg
         DIJiYl4r5mV8dElK2Ghc8YS5KSJ9d70iN4sfGmRHUI5Nr+Mglsew2wBpUtzWWf4e3VRr
         iB0myf1pTSrOjgkeIus2yQJg/545Q3SkazF5I/qfMpF1l6o7lRnmL63XxnAJAW7NXaUM
         uNlw==
X-Forwarded-Encrypted: i=1; AJvYcCVnDRddbolfqWdCjh+W+aNbiLN481xF8hNi+MH1dg7iW41n0DXNobtjMq8ZVC6XikUnu3LfmrbiH+C57bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDiPoHWoe3uZ7GLG1ZszlFJrjofIaNV1+IK4BDHtDl9Pdfu0b
	B3XGVAtYDH27x0SHjYMYvFVPGZChb2DMiAXnG/w58itZr6SwJPZOBfnGYB683rQkBWU4xd2J/ye
	E
X-Gm-Gg: ASbGncsmLAoLDevDpcScv+kxouZAzTvSfSxWgPQ+vnehtaMxobQvZ5/ZpDGM+sFKlzv
	xb30fSOHIJB97vuXliwCgBuCT3l2MDuIFI9yaeM57rRg2Ma9XHqS47SptLlW4y/UVq+ayE7JvOc
	U7Lb3olYe4lKZj6tOL5SqzdTcuck10F1bDnufNNf7dO7ocy0UgaiOvcBsSHHhvdQWy2JX2Ur5BV
	fPRu7RQwyXORYvrL6PiHi9I1URQrsAv/KzikEm2uZIavSD8fvbltNMFdONVcf9dcgi7C9JFjm+S
	roDnhEpKmGhg5n7WNjCt1X1bl3LJW4U0cZ54BKQ=
X-Google-Smtp-Source: AGHT+IF+gigl59GNjmhrqIV00i6oQSPe5kBPMIghLrWW++oW9RPjrNgCG4rFzudnQ0ovyUGjj3eDCw==
X-Received: by 2002:ac8:580c:0:b0:477:64dd:575b with SMTP id d75a77b69052e-47ad8131a95mr18061491cf.45.1744805357803;
        Wed, 16 Apr 2025 05:09:17 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4797a21aae7sm88641051cf.16.2025.04.16.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:16 -0700 (PDT)
Date: Wed, 16 Apr 2025 08:09:12 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH v4] mm: add zblock allocator
Message-ID: <20250416120912.GC741145@cmpxchg.org>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412154207.2152667-1-vitaly.wool@konsulko.se>

On Sat, Apr 12, 2025 at 05:42:07PM +0200, Vitaly Wool wrote:
> zblock is a special purpose allocator for storing compressed pages.
> It stores integer number of same size objects per its block. These
> blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
> 
> With zblock, it is possible to densely arrange objects of various sizes
> resulting in low internal fragmentation. Also this allocator tries to
> fill incomplete blocks instead of adding new ones, in many cases
> providing a compression ratio comparable to zmalloc's.
> 
> zblock is also in most cases superior to zsmalloc with regard to
> average performance and worst execution times, thus allowing for better
> response time and real-time characteristics of the whole system.

Is there a reason not to use this allocation scheme in zsmalloc then?

I'm curious what others think, but I'm still not convinced a second
allocator makes sense. It's maintenance overhead, a permanent struggle
to match feature parity, and it fragments development and testing base.

Not long ago several slab allocators were removed for those
reasons. Likewise, we just deleted zbud and z3fold because they didn't
get any attention and bitrotted, but not before years of inflicting
pain through the zpool interface, users accidentally making very
suboptimal choices, reporting the same bugs over and over again etc.

If you discovered a better allocation scheme, that's excellent. But I
don't see why it warrants forking the entire allocator.

I also don't buy the fragmentation argument. Even if you are better at
packing during allocation time (although, citation needed), the
workload can unmap swap pages such that they leave partial blocks
behind indefinitely if you don't have block compaction.

Then there is the migration support, which you said is planned, but
which would presumably require the same indirection between handle and
the backing pages that zsmalloc has. How much will this eat into the
performance advantage?

I'd much rather you'd focus on making zsmalloc better. Improve the
packing scheme, make expensive features optional/configurable etc.
That would be easier on developers and users alike.
