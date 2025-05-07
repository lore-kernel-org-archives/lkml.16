Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C0628A1DC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631643; cv=none; b=aZw4wmXDlr2qMjYKnT1ie5hser50gFfTCVvS07M6Q8ViO9+lNc+Cm2Fql6rerc2BS7y2l0uAPFxkwjjnHVitgh5uv4B+Qr+XajgKsQRP9Dge3xN+OsGKEF3t86654S2muMXtUVZcrV9m8MjEgy1jmmMXzrSYQOp2NS0mJZwIYus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631643; c=relaxed/simple;
	bh=RB5x+S+YxBY2uweoaKwC9lZHlxnJE1L0fDzjyErwVXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DC8L58d+VK6xjom4RKA+xfnSaHAOAAbmDhP5Effc9oTLkZ0oZ9/WZznjIDpAwjdsqwzM4YwMr8DmLBqQlY5ylT5LcGPr7LwMfqab3S89hF+WwtBxoJDM4SENmcksqfniNmjxl/FTYdEeZfiJju/CwmJie9u7Vwbs2xbkwNeHalc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dDHoGGe8; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dDHoGGe8"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442cd1c4f95so1201005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746631640; x=1747236440; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UVScMaJsNdWzXaWbUOC+RQZonS9hMcxETO6CXiEAlRw=;
        b=dDHoGGe81xeVWC+Vb0KXA/9SDFUEPSfekrIlVM+A6nut81P5jEVSeCVQA7WOs1y09u
         +kwGqjvdsyPZhZ3WQKxUKihj2q31wVbgiAaeHQWPFuncKcaFle0Qwc7uGDTSna1bppMS
         AJEoxCKfOInD/HpDZeTtjgcUM7hwdQiPDbzy6P6r9FsBHkKfBsEkCh64dLU/3KQERfM7
         Oo6PKaS9+32byZJcg8oEQA3ynTsCUdUHiA0uT8sU+BX+YuMcBXjzE9zqEgzHiIGqxASj
         7ethR2nmkl0qSpjizruWH/ExI1IwnoDv3Ol//x5eCTIVp3jnUPg3LTVbT2/YDOsJlDBT
         Eu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746631640; x=1747236440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVScMaJsNdWzXaWbUOC+RQZonS9hMcxETO6CXiEAlRw=;
        b=A88Ol6mE0I7EU37tn+WbMd5oMlPQMgK9VJHctKBnzaGEf37ZG9aJEUid7/9aCr1SQC
         RpdpscwhcFyB6kXuJmb6PmzOhgdlqRCnaAWG1AKNoNQ30+zr/Epi1nE1KT2Ab1Jbl246
         Kq2gOK3M3U1dzI9kq+hpcZ0dIBiAgFZuB423o8BIaTW9r9rNK7DqWApxrgGZPb+I9y+X
         hXEQ9pQbmYl4naswjlLRT3WdIMTiy6hUysI2yktxbNGa9pa9IsJPRlw1I9EQaug+0Gfj
         GQNuxC9DkijmVtlYO79W+xoLWcYF+5122XFSeOQPhqJRfX3ZYGzxctSiiVgqTAMeWdq7
         lDsw==
X-Forwarded-Encrypted: i=1; AJvYcCUfqEn39ftjS+3oDhq1jhfx1ZDKeesvRnIxtsLRKXto2P+1qV396YSnC6Zujis6rAHwYUibngoCSkUQmYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw8R8bBZMn5HYFTBZvGE4+2+lbK6fEIct6ChE06VSR0OI5y2ju
	ZOR9UTTS6sx+nlvN6VS6retPt5tmPa1Oxq9CWqRLfdlB5BWRvy1HB/Wi4ayZMsRkJNawYfVZqZp
	Wg5sz8Tg4zw==
X-Google-Smtp-Source: AGHT+IFbv1gkzIUlafRoPSulkZnF0yX8hhTbcTrPKkzq/6eQOecLcqYYtCLGIV57zt9Rt/Zmw0wGOrsHsd3dlA==
X-Received: from wmbeq6.prod.google.com ([2002:a05:600c:8486:b0:43c:fd99:1b7e])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5122:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-441d44dc257mr25363515e9.25.1746631640335;
 Wed, 07 May 2025 08:27:20 -0700 (PDT)
Date: Wed, 07 May 2025 15:27:18 +0000
In-Reply-To: <hqd7h7elpou6mohkdr2rqcz6u7xuanezuq3ti56ibsnccsb2d2@yokitckdkwqo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
 <20250506112509.905147-2-kirill.shutemov@linux.intel.com> <D9P3X0NLQMW5.1J74MJ7FDRBFB@google.com>
 <hqd7h7elpou6mohkdr2rqcz6u7xuanezuq3ti56ibsnccsb2d2@yokitckdkwqo>
X-Mailer: aerc 0.20.0
Message-ID: <D9Q18PJT3Y7R.5Q9X3BZ0ESYU@google.com>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
From: Brendan Jackman <jackmanb@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: <akpm@linux-foundation.org>, <vbabka@suse.cz>, <surenb@google.com>, 
	<mhocko@suse.com>, <hannes@cmpxchg.org>, <bp@alien8.de>, <tglx@linutronix.de>, 
	<david@redhat.com>, <ast@kernel.org>, <linux-mm@kvack.org>, 
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue May 6, 2025 at 1:34 PM UTC, Kirill A. Shutemov wrote:
> On Tue, May 06, 2025 at 01:20:25PM +0000, Brendan Jackman wrote:
>> On Tue May 6, 2025 at 11:25 AM UTC, Kirill A. Shutemov wrote:
>> > +	/* Bailout, since try_to_accept_memory_one() needs to take a lock */
>> > +	if (alloc_flags & ALLOC_TRYLOCK)
>> > +		return false;
>> > +
>> 
>> Quick lazy question: why don't we just trylock it like we do for the zone
>> lock?
>
> It is not only zone lock. There's also unaccepted_memory_lock inside
> accept_memory().

Right, but my lazy question was why can't we "just" trylock that too?

But anyway, that's no use because if we win the trylock we'd still have
to do __free_pages_ok().
