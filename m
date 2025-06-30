Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6312AF1B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751256161; cv=none; b=sGutSiRFYYnDQu5E/POTVczAbXHfT9unzPEldNF294wExblZxzyP+oLbNW9NZhSz9pUsNLXTJTYOaGiyM2YovtImRib8JyMCjMEj4fTE3L7U9cRVmSFJK8Bu8w4pcTMfQPV1XVrUF9/gRaQm6UCrVNMkXJZzcCUD3Dap6RnExHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751256161; c=relaxed/simple;
	bh=2PH4IfqxjRoYODDt4w8REX+19hyHE9DD889qk2Up7TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXeXrTp+WHhZJ7R6csxAFvpGYvra9ReVLKOOJp/Ql5+x7iVDHDVaO6oKeKpOcjEzvUuFej7g36Pm87TEO874kihMpMsDQNtlUkaHhoxWLhtxmy8UAQ9hSePaUVvy9x10Ilvw3l80F6AhRsULwkCsuzqVStv9aan+SN96Jv82fSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=B0mAtT8e; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="B0mAtT8e"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a58c2430edso44424711cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1751256156; x=1751860956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ccyGNOG4mThDYRScrKYSg+jRSybzBPlkASokJM1l1qQ=;
        b=B0mAtT8e/qEsXlVI+9kUS2H6qv5tMD9dedvyJUepa+BBYgq4DaT0RRHiAE3peQoDGI
         x/aS24e4D7bnzprAdgbJnnBhfAT2dlpg4VpM8hRxIKyFYgTJUKfUAtD0uspaSxJ6hSMq
         L8+J607CZMxdbVe5CzBriXWExnueBi4DqIgkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751256156; x=1751860956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccyGNOG4mThDYRScrKYSg+jRSybzBPlkASokJM1l1qQ=;
        b=nlPXTQMrkkM1ZUZW/7XvokUn6o9NxZV4n6bt9FQSmEDwAcDWPt6uMY3y4DQYDRxZmm
         O8VVjpdFH81CKcoDMtlhvkQt+W+q5JUdE9M/I4hu024PXIurjcd5gPHbRqfKoWxLlFBK
         aIJbJLBpq+/lMw6UA6LTTuKNLyQs1Q+FJEZ9h0VSPVxyHG5Kl1c3pvYE4lFrUM4v/c9I
         VZMJ6jbRVGzr0eftITsHKDM5MLW/eV1MVm9DOtZwI52KSvMDFbhRlhH1C2MJPPYLmgCy
         rcZ6NxQNfKsFNjg8ADQ2YwAycs4AcxWHCqEU/qle3HnSI1pjbj5tgOOe+B5ECy3ZBktW
         gArA==
X-Forwarded-Encrypted: i=1; AJvYcCWQIl/aWeeWutIWr68zrq66kM8EJ3INxvS1CBPZYNvwk0F4+rCReX9i7y64QNf7TqZ3dJImf7xS0h2c3to=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBDqQFd1kogLyXZlTWiBWy/3+IiwVkhRLWIXhcki+A3nSamA9u
	gPgw4/XArpbzHZ4UOzscnYargSisHt7k+MTz47nmYFF1s/PWokCkTaGvx8zC17EI+264CaKgH3U
	vN/ZUjjxceV7reYJUP1+BzIHlONSc09rhdsb7HakWzQ==
X-Gm-Gg: ASbGncu9LXoicFCzE/u5ck6QpDi7a3YTPDmuDuslA7WSJzDYhaelxAO+ZOBTe3n6OvW
	yTaxx7+Jm/kIzNDgKzZEarFdZ9XpphuaNfMrITdI8o6u85MLl3f677LPG6X2QjUIzh+V1+RUB3l
	ZajrXjAGT5LV815xduncxJL1UcbZsNSuVXVHnprD7xxNLDsvYEej4tvS93iyWJ9OCyiBzf7iAIw
	jkU
X-Google-Smtp-Source: AGHT+IGEA1Bx9EXMdm+tpafIIY/Ry9x0MSRRz2Z+QvxjDqOWaMdXDs4EnsATAsakAQqy0QCkLK0OokY4z73m/rZNDBU=
X-Received: by 2002:ac8:5c93:0:b0:4a6:fa39:63a4 with SMTP id
 d75a77b69052e-4a7f2db5dc1mr273364231cf.2.1751256156071; Sun, 29 Jun 2025
 21:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-nr_writeback_removal-v1-1-7f2a0df70faa@suse.cz>
 <CAJnrk1YcA9MBC+KQdLE7B-CspoO5=xjkAf78swP6Q6UPijJaug@mail.gmail.com> <rr2hxi5dxoh6n4pbx5pcyelquvotbksfy2d2m5ycydafog65j4@rcekxluoecrr>
In-Reply-To: <rr2hxi5dxoh6n4pbx5pcyelquvotbksfy2d2m5ycydafog65j4@rcekxluoecrr>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 30 Jun 2025 06:02:25 +0200
X-Gm-Features: Ac12FXyOwr0llO8hHixJAlK1VoG5y6j39_v-eU55NPgRFJeCqE-U8vJRqvHmIrA
Message-ID: <CAJfpegtk9AEtj3kxivM=tm-DgSTnGqkv46HdNFcG34omJ2qVLw@mail.gmail.com>
Subject: Re: [PATCH] mm, vmstat: remove the NR_WRITEBACK_TEMP node_stat_item counter
To: Jan Kara <jack@suse.cz>
Cc: Joanne Koong <joannelkoong@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Tejun Heo <tj@kernel.org>, Maxim Patlasov <mpatlasov@parallels.com>, 
	"Zach O'Keefe" <zokeefe@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, Jeff Layton <jlayton@kernel.org>, 
	Miklos Szeredi <mszeredi@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 09:01, Jan Kara <jack@suse.cz> wrote:

> Regarding the comment, I'm frankly not certain how strictlimit solved
> NR_WRITEBACK_TEMP issue because NR_WRITEBACK_TEMP was never included in any
> computations there AFAICS. It just helped to limit amount of outstanding
> dirty pages for FUSE mappings and thus indirectly limited the scope of
> NR_WRITEBACK_TEMP issue. Anyway I think the sentence is obsolete now and
> deleting it is indeed the right solution because FUSE writeback is now
> properly accounted in the dirty limit.

The question is how much fuse can overrun the dirty limit without strictlimit.

AFAIU the strictlimit feature was added because temp pages were not
accounted as "dirty" as opposed to writeback pages which were.

Header of commit 5a53748568f7 ("mm/page-writeback.c: add strictlimit
feature") has more details.  But I don't fully understand all of that,
and strictlimit may still be useful.

Thanks,
Miklos
