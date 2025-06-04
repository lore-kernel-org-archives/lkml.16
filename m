Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1BF1DED6D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038423; cv=none; b=egNNt0waHhDR3OJj/no+y9k3qAswl0xt8QDur0OP8nnD0X+ZVhsEgJVfdE2CFK6EsMhUsue4DBhgtSKNZY2AGAIxO0H3YasECEmdjwbv9phzc0TCxnzOCGKFnAKVlEkEanJCJapb6MTupcXU9DNu9MFcsuAHjegtC2Tm+mPaxq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038423; c=relaxed/simple;
	bh=zVY9XzhhWcHzqUqNnnyNii3ba4FGUocj04/QVzLzR3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euhoPA8hGHpdBNzWrrlvDeljPwjWDId+5g1zuaBumNwKKRlGYJ5QWnvXfIVEij9wukT3KlLYesrnvZHac86nAOuSiDsOPovTiNrLYndCy1rqX9xfuaWQ244iu3+Il0ytMSk/DzudnX1/GGv0Tac9t/yNjJOdQ685JYEuSu1Xs+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=FhEX+H60; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="FhEX+H60"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1368557f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1749038419; x=1749643219; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+nqsQ82kt+Zea8zn/pb02YPbww1gbCosRGb705bohss=;
        b=FhEX+H60z8jWIs2AbbU6bw8uIkILhdOwG1gFlrg1+OnmO3NXv4zOuK0bnhW2GwJoHC
         +REFawsff3Ve3aOavihdXmVVF/ioSL61U6pARlJfb8t8VbVzeKdmRMjOuRnTu90Qw22q
         zplpJOGhpSlDCHZNpG2Imj1HXecpvqzScqeABpxli+KhDUM81F87ppbiSbBrHaS2dfU1
         jkKpRFre9M95/0t4Z/3qsrFn/ZmCp0oK3DaZpSx5Z8D1ee5un+utuVSY8wEUeh/cr+gY
         3td7k+9+nxIiBMyQQvbgMO9GJJTDx7AUSlxtwr847qAjpDyHxzbyV3X9edEB+AXN44Ho
         8wFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749038419; x=1749643219;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nqsQ82kt+Zea8zn/pb02YPbww1gbCosRGb705bohss=;
        b=IjDbdht1WiFVQiHfH9IEAwFR4NZEtbKHsgrvBiZZGSn4Ym9DH+9+JqKb9PgUqQA1/T
         ygbd4r1ujvpwm2Nwvx66ubF9ouLnK2qV9FzUAByirUglIgPmrsGgh38I9BwQdRUOq4+x
         txVWKFCtCkuMUBHCtl+dVYWukd53l6d08e9YZHNwZPfV5UWXZnAiL+Q2/DijyjPFkivk
         UfeqeKOjZh2iOrVvbYOIIJlmS4nuwFvNN1Z8qAcWXjA9z+5X6wRqgLWudobxaCy9j1c4
         RDRHRz9bz3gtw3sM1olVqYkES+bPcAZ2NjV1Y1uAOZe58fcuS9Et3hDs6djFxxhOUCjn
         NPrg==
X-Forwarded-Encrypted: i=1; AJvYcCUzcD+I/TE7e47iOyuQng3b8reeeqJKC3q1e/SRgkarb0PzXVmHi9/QleZFGWI7ZcobDBJSVXkQCJLxNYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnJBzzV06oZLIi2I0hWE6vJXsFkp9GDIB6BcJ58XtmJAi16cBu
	x2oAe6IPPd/KekKSly28QtZE6yHknYfzuFRYvkL+6k0zg0kjYCINbpBlLXRPF/pnXwI=
X-Gm-Gg: ASbGncsiFgPr14ItqhWqXmKNvKUGFbmnE43gR8mwuNb79cmNQGWDs/xTRieT85JAylR
	p09oYANkvHZ2XbIhuCh8twCQwAQrrDtCfmGIlAlbm+5jMdmXVqbsZneAN2vPTt0o765BTLKzRTm
	I5HYJMkOL6T9OHobca9DHaGd/thJcDU7VDDeaLMDX0e9ZRcVks9si0sHF4ui/UaZ04q6+nQOju8
	xpigLb7R+3Kmdv6FnKvL6cNbeW+SPeGD3BykezDDg4F9PZLqnBU7DYSgBvak9r6foy54hMZkdBe
	ydNB9uwEbtFF1DfZhXO+xHzUYO0mFHTPVHJCjs88p1rK/hbG
X-Google-Smtp-Source: AGHT+IEMm/wavbNrVrfyOME8tFK/mY4+K5X1c4/6nmOVfXnr2qJvVXbyJyEJqELmggltmokAdLxjpw==
X-Received: by 2002:a05:6000:178a:b0:3a5:1266:e9ce with SMTP id ffacd0b85a97d-3a51d96cfffmr2078263f8f.36.1749038418886;
        Wed, 04 Jun 2025 05:00:18 -0700 (PDT)
Received: from localhost ([2a02:8071:6401:180:da11:6260:39d6:12c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7f92585sm210408665e9.5.2025.06.04.05.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:00:17 -0700 (PDT)
Date: Wed, 4 Jun 2025 08:00:13 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Barry Song <21cnbao@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	SeongJae Park <sj@kernel.org>, Usama Arif <usamaarif642@gmail.com>,
	Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, Pedro Falcato <pfalcato@suse.de>
Subject: Re: [DISCUSSION] proposed mctl() API
Message-ID: <20250604120013.GA1431@cmpxchg.org>
References: <85778a76-7dc8-4ea8-8827-acb45f74ee05@lucifer.local>
 <aDh9LtSLCiTLjg2X@casper.infradead.org>
 <20250529211423.GA1271329@cmpxchg.org>
 <CAGsJ_4yKDqUu8yZjHSmWBz3CpQhU6DM0=EhibfTwHbTo+QWvZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yKDqUu8yZjHSmWBz3CpQhU6DM0=EhibfTwHbTo+QWvZA@mail.gmail.com>

On Fri, May 30, 2025 at 07:52:28PM +1200, Barry Song wrote:
> On Fri, May 30, 2025 at 9:14 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Thu, May 29, 2025 at 04:28:46PM +0100, Matthew Wilcox wrote:
> > > Barry's problem is that we're all nervous about possibly regressing
> > > performance on some unknown workloads.  Just try Barry's proposal, see
> > > if anyone actually compains or if we're just afraid of our own shadows.
> >
> > I actually explained why I think this is a terrible idea. But okay, I
> > tried the patch anyway.
> >
> > This is 'git log' on a hot kernel repo after a large IO stream:
> >
> >                                      VANILLA                      BARRY
> > Real time                 49.93 (    +0.00%)         60.36 (   +20.48%)
> > User time                 32.10 (    +0.00%)         32.09 (    -0.04%)
> > System time               14.41 (    +0.00%)         14.64 (    +1.50%)
> > pgmajfault              9227.00 (    +0.00%)      18390.00 (   +99.30%)
> > workingset_refault_file  184.00 (    +0.00%)    236899.00 (+127954.05%)
> >
> > Clearly we can't generally ignore page cache hits just because the
> > mmaps() are intermittent.
> 
> Hi Johannes,
> Thanks!
> 
> Are you on v1, which lacks folio demotion[1], or v2, which includes it [2]?
> 
> [1] https://lore.kernel.org/linux-mm/20250412085852.48524-1-21cnbao@gmail.com/
> [2] https://lore.kernel.org/linux-mm/20250514070820.51793-1-21cnbao@gmail.com/

The subthread is about whether the reference dismissal / demotion
should be unconditional (v1) or opt-in (v2).

I'm arguing for v2.
