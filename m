Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3E285C9C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297979; cv=none; b=LASUoPDDh9Ru+srhfmWm6U7u42TpsJ/I+Jo1KBYjF2HFVxchITMu76qJS0vUgwOCxExgMRQZKkv0Bjz5gE/wuekcB2LsGCUl+dAN462E5zL9TqFNmEntw/DNlXv1Tz5mlWTQK6SWA3n5ShEFZXCz2FoZlPJm/YE5kbG1cqBNs3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297979; c=relaxed/simple;
	bh=9orveUJsCVDz4Fd2dDgRKdCC4tyMGMB9YCVR77Wq3gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNF35TI1jd8q/5ecqEIs7pieKXxjSUtvB/VuK4h1wQ64ZvdFiTyn/7FVlzsIAXuoqpNuRlL/Twor3vPx9XnnKZA578U94xmfqNiSVox716qsRI2Vw6c0ZWliP9+/gALyMWiyBgigYQnleojQ58Fbi3hEsbobExI/D1316yC7Smw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILY4O/4Y; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILY4O/4Y"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70f94fe1e40so61100707b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751297976; x=1751902776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0be5qLAVyxVsqlJv6V/4Pef2SAWqToJNDc4Rx5m5nkQ=;
        b=ILY4O/4YkfrRlF2dlPijUfMHJwX9qflH68L17IVM3t1WCw3Rwss9+JWrBwoyiIOGf/
         DgDGIe50TF1aYuiYKsbxPle6nW1lQ1p0gTcMz6ZGBGqLQVviY3f0y/TtWQXZmUxQqfRw
         bEgr2CVmWQyuEy32btLdle34cOM2UJPJGyreBxQhguAdS1Gn5O44XmeE9iWiZsxL0x9Y
         87tvCBP5TXUP14VcTZjRJ/5rcs/WsJnsaEq/Fbl6n3Sb2OG2sSMLkHGSj/R4k/3WsUPL
         bnOgG90svxZDgCwOe7eZRdsAQgO0Gklano+jfb17AkFCXB8W3Jx42sQstqSS2Fk0zdhR
         bwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297976; x=1751902776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0be5qLAVyxVsqlJv6V/4Pef2SAWqToJNDc4Rx5m5nkQ=;
        b=PAuhSGnKOI3fV8+hymwb113nyBajUtJMskfYuLkp8+XgD9+cB95cpCeaLpTAheu/51
         ZduDdRYWBwjoJdRi6ENaEcpVv44RQdcYCqWmOfvA6xAspT9oz4EjtHkfqn0AM2AL0ltC
         b+uNIyUPgKDAZLyMeqEiwSbQe+/oyzecrNdb+BHj8aqWDvIc7m9JuFGpM15nmUEQYFil
         RxM49/bohhD8Rp1vStAa95l5cf0K5PH85rYArHmLiEAVpU1morUxYHwmt1q/QtAV7hRW
         emsB2D0oErqSaW+irOHp93nAjjua23DbZFsucrnTyhlM20+y2YDR5VY7H0AcXVpS8rdx
         5MVw==
X-Forwarded-Encrypted: i=1; AJvYcCULnnQkxA9S9KmxZRjz8Cp6xDsQ7HrjM/q9hpTX8InZuxBkzDiBnGBG5EBsmp1T4QAKkBm7rV1z1LP5Yns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWTJ6/367ea1vO6rjKLLfP24XyVRr23ZaIereBwuLSgP0z/5ca
	ARzQdLVBqer4OofgnZl4qSjbj4r+RH4goyZ1pVdbYs1+1B+McGEDtxjb
X-Gm-Gg: ASbGncuyX/1GrsUK4PGevW3DD4PuvC8ur9N+7GyQf/JWOLj3MFE36TWP1yPiVjIYKGL
	xngovQ7173GN9MUhV6gZGH6TelsoGWrL369u4aPg+D0CcZpJnkTcSWacAtxxH2y9pMi7iN0fBdH
	cV9HivbB6ZT2eGp4iWU2YB5Gs5+vtkpANQ9j7T/JzbyKzFehop+hBxdBR0SwOm+NkRq6D5oVJp9
	KRh3r0hBISQn++DQde4cPULLNBU99TSwcRvwkBl4Eo2tmNUzEV1me8t3OKKNlYrRUp7CItnAuzH
	3NrPeOPhTJgh3/xsSnQkZGpRQgg08AXAq9pblDeo1Zl2/U3wEKEZZOuiOikmfA==
X-Google-Smtp-Source: AGHT+IHzZeRn7Cp9KHkkJ7sj9fF4rhKTnNt/RZSDFZ/SelLCV5QB17xfO3NFNfYD9wL+NPir0D33OQ==
X-Received: by 2002:a05:690c:6b0c:b0:70e:77df:f2f9 with SMTP id 00721157ae682-7163ef1e89fmr130527b3.15.1751297975464;
        Mon, 30 Jun 2025 08:39:35 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:40::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515c04195sm15804927b3.37.2025.06.30.08.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:39:34 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Gregory Price <gourry@gourry.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip extra call to __alloc_pages_bulk in weighted interleave
Date: Mon, 30 Jun 2025 08:39:33 -0700
Message-ID: <20250630153933.3942464-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250627161318.1898633-1-joshua.hahnjy@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 27 Jun 2025 09:13:18 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> On Fri, 27 Jun 2025 00:28:33 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> Hi Gregory,

[...snip...]

> > I will say that, at least at the time, I took the core math and
> > validated the edge conditions in a separate program.
> > 
> > If you get it wrong in the kernel, you'd either fail to allocate - or more
> > likely just get the wrong distribution of pages.  The latter is
> > non-obvious unless you go looking for it, so it might be good to at
> > least add this test result in the change log.  It's hard to write this
> > in LTP or kernel selftest unfortunately.
> 
> I think so too : -(
> 
> One test that I wanted to do while developing this feature was to see if
> I could figure out how many pages are really allocated from each node. The
> difficulty in doing this (as you pointed out above) is that because there are
> other ways that move the round robin forward (without necessarily calling the
> bulk alloc function), it's hard to directly attribute the page allocations.
> 
> If this was the only place that we were modifying these values, then a
> correctness check would be equivalent to just adding a printk of each node
> and how many pages were allocated on it, then adding all the numbers up to
> see if it matches the weight ratios in sysfs.
> 
> So I think I will do what you did as well -- I think that performing some
> tests, at least on the edge cases in a separate program will help give
> some confidence that the code works as intended. I'll also continue to think
> about if there are better ways to be testing this instead.

Like you suggested, I decided to run a simulation just to see if the number
of nodes allocated from each page lined up with the old version, and if the
numbers made sense for both cases. I found a few issues with my version of the
code:

The math is just incorrect when rounds == 0. Let's say there's a 2-node machine
with weights [10, 7]. We should start allocating from node0 with 7 remaining
pages, and we want to allocate 14 pages. Here's how the new math goes:

- First node should allocate 7 pages, let carryover = 7
- Then remaining pages = 14 - 7 = 7
- Allocate rounds * weight + min(weight, delta) + carryover:
    = 0 * 10 + min(10, 7) + 7
    = 7 + 7
    = 14

This is incorrect, since we will be allocating all 14 pages from the first
node, and the real distribution should be 7 pages from the first node, and
7 pages from the second node. I think this can also lead to some overallocation
issues.

So there are a few options now:
- Change the addition to be:
        rounds * weight + min(min(weight, delta + carryover), weight)
  and adjust the remaining math accordingly. But this looks very bad and
  is not intuitive at all, so I don't like this idea. 
- This can easily be solved, if instead of figuring out how many pages have to
  be allocated as we iterate through the nodes, we do one pass and figure out
  how many pages must be allocated. The problem here is that we re-introduce
  another loop, which adds to the code complexity and may actually be a
  performance decrease instead. So again, I don't think this is the best idea.
- Skip this patch! This is a small optimization on performance, and I think it
  simplifies the code, but turns out the original math to do is just much harder
  without doing two separate calculations. I'll keep this running in the back
  of my mind to see if I can figure out a way to solve it later...

I also think it makes sense to drop the first patch as well, since there's no
optimization included with the cleanup. But since it already got a few reviews,
maybe it makes to keep that one : -)

Anyways, I really appreciate the review Gregory! Maybe I'll have a brekathrough
idea on how to correctly do the math here sometime in the future.

Have a great day!
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)
