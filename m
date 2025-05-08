Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D961FCF7C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746679666; cv=none; b=HE563OUGhAlsnkY7nQZuGVfejoVJN9bZuZETQkz7CNrMA9l1kEIJZGkcNtBF/+etDpC+7Af3s7e47dn7odt96AtCwoVBVuZw1QemxKKkcJakDhUI8iG9VVyg3/kRJz4HxkDk46LmQBgfz0oXaSaRJxVasmRWmHcV1T2tXS59DD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746679666; c=relaxed/simple;
	bh=ChncmAHv2MsD0NgeK6fwWmgIb7GpT+fLoM6kmAdau3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4B/b1nRnqFZPv8U3LsnoC0OdVyP4zAGwWozzDdvebCF+jKTaQwggB4pJX8ihmiluyNEeSONc4pYCZZ88PgFcDQKpeiJW8QiiQnheqnSt9H+mnFBQ+BzOhJ1BUFTl0CKFSTCzAZrvziD01RZ8SumUyxQYWateZ59QUNldUUGaHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bfmiq5i5; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bfmiq5i5"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30a9718de94so601774a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 21:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746679664; x=1747284464; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X2W4E+E206TPeQz0Gg8peXL5wASK6C7fNQHKs+qGsPs=;
        b=Bfmiq5i5vIGDEymrkljLoySUTpg5ZuVuCtsejRjDqzbqol0VgS5VFGuJtDZOtmZkeh
         yNVd/CMwZ5rMpTgdhFAQ8PlIIXlW3xPzqG5XDcj4epTrnu9ygbWcK8gmjwFAUIdtH91s
         T01gmabc/LmuvjndEfhKPhNijmTpYtEBNCBC17zUKWeqI5LrrGPCiL56w9R4JehVTMX9
         8jyaR+s5k2m0/eFWCuseDAby/n3EuP2C/tRgmOTXjzogK4GELLDDYpHIdJHDDaGVNOrI
         /+VT5LUyLYsW+wq6f4bTQX+OFwyh4voUWDKlFW8sE46xgjjXGMuw3GlhUPxke7avKDLa
         jeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746679664; x=1747284464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2W4E+E206TPeQz0Gg8peXL5wASK6C7fNQHKs+qGsPs=;
        b=BQQ5RLm57103LRt2TWNuwaXwGnx/8ttsMesLKbWsPypMPvp+YC6IUl3ZVYA5AUamV2
         RIEYLUPLIYnBS08y/iy3tUvGy6g9DEwdLsgrtiiHqUXvI9bjGPi4bw8gTo6FKwgTS6gZ
         60Iqb1raZ9XsKw1KvEqwkFM7+l3zUuyw7oYGre309z68fgQ9ULmb9SmEH6hj1GvL9Frw
         kpXkLD+FzTE+szez3zA10U0/Na+mo5v0Li2Zz5MsnP8FMtx5vRAQaBl6lpWXmouwsZh8
         zcoAWpBDRSKKNPHpIsc/koUXb4QKMVJ61epe/oQHnjLAq1Y66qBpeXcCHcE431PvfdA/
         HCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6zz2j7IpboVOVqAGlu5h8tSJVMIg5JoOJDcfu7IK+J3gfq3xksJIxHSgAmbrNr7pyiDqkd6fNI/BNwdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUMYFwwypM2987brd0JPOCs8j/jeD9s6okEnZZeOJazuXf1U56
	1NnnrbetJjfejRnhAqnJ1WcGo4WEIRjQY36ofXvrVGfwrv41XhVdHfFZkdy3JLsj+VxSUbYFZ9p
	njPh8KY2b5Vjz8YAzBdYgu/9CnmY=
X-Gm-Gg: ASbGncuBkWbEOU9OykFQ4Q88Q3b3MGF8ekNU5mAtEJaLLTBdPPXRSxd8Q+ZEYGK1DOj
	GjGMhl3yaScudbD+Z1m76TRzX+BMiKQKBOqPRGVcLeGzDL7maTo5YS3f8pDuZV40ar+BRscpztM
	MuKrdUjMvFSopf7YoZzv2kJQ==
X-Google-Smtp-Source: AGHT+IGn0YxzjRhYInxhZtobUnfu8EVoeL6K/f/7FuGYolQyFAj4Iiby+/yTGlujnYXAXZcIIwoaq4a+SCIludNnFSM=
X-Received: by 2002:a17:90b:164e:b0:2ff:6bd0:ff26 with SMTP id
 98e67ed59e1d1-30aac25c713mr7278789a91.34.1746679663794; Wed, 07 May 2025
 21:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507142552.9446-1-aha310510@gmail.com> <20250507153325.48726051dbbff4f3936a83ff@linux-foundation.org>
In-Reply-To: <20250507153325.48726051dbbff4f3936a83ff@linux-foundation.org>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 8 May 2025 13:47:32 +0900
X-Gm-Features: ATxdqUFEsSOnWPsEnSbopEwhDYTZiEYfrxLptEw3ochwi3pXNJrneqnI3VfNaFQ
Message-ID: <CAO9qdTEL1xhBOXbSR4KHgmh0vpEeiia5ii9Ae959ahFHLVycRQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm/vmalloc: fix data race in show_numa_info()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: urezki@gmail.com, edumazet@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed,  7 May 2025 23:25:52 +0900 Jeongjun Park <aha310510@gmail.com> wrote:
>
> > The following data-race was found in show_numa_info():
> >
> > ...
> >
> >
> > According to this report, there is a read/write data-race because m->private
> > is accessible to multiple CPUs. To fix this, instead of allocating the heap
> > in proc_vmalloc_init() and passing the heap address to m->private,
> > show_numa_info() should allocate the heap.
> >
> > One thing to note is that show_numa_info() is called in a critical section
> > of a spinlock, so it must be allocated on the heap with GFP_ATOMIC flag.
>
> GFP_ATOMIC is unfortunate.  Can vmalloc_info_show() allocate the
> storage outside the lock and pass that pointer into show_numa_info()?
> That way will be more efficient also, less allocating and freeing.
>
>

That's good idea! Definitely, if you modify vmalloc_info_show() to
allocate the heap before taking the spinlock and initialize the heap
to 0 at the beginning of the loop, we don't need to use GFP_ATOMIC,
and we only need to allocate the heap once, which is much more efficient.

I'll send you v4 patch that reflects this right away.

Regards,

Jeongjun Park
