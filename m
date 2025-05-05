Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC59268FD5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464053; cv=none; b=lUS4S9mo35fVOEUPnKECel8SAcN2uajxpQlm8EAEgfecOJexAHed83y5P46rXG8AM+nvYTYR0aaP6dip/P6jktV8/j8FD3CbuXyJQtdC51SlDMvZfgvcfR6j7nHdaZFTtKw3/UrSyf/uw9pwx22VMRJc9oQ7iRNOp+dM8lqcULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464053; c=relaxed/simple;
	bh=RsOwvsOf1dtwYMPYCup7z8yztSB7dT4IWuAMmQDF6eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRLep4ftWlxBc9A4b357ZpBJmNCR6jtQc4d9bvrdihCswwQL2WyDo+0YZuHwS3fSJpU57gsoWItwcAL4I/eSzYCCh8Oh1w0PpKIepDBJ9XlaurcNEiwBMgXBa/0HSdBkp4vdjoYB/ADbmh7i+aI34SVWX5BuaPTuYDgHFPgaK8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R9NJHaYj; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R9NJHaYj"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47666573242so8251cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746464050; x=1747068850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvkwbBAAy51gwoOy2GdGqciR4ki2e9eLZIkUV7w/43I=;
        b=R9NJHaYjsJbvpjiR+aZqkswJC1V53ynxoOM/zt20m+uVDc8HU0jR737zkB9XODQzME
         W7BXzEiJEtUd/AL1W6lnjymAnjzAjCtELO1JP3ssyl45WDLN1knzK2axvKwloLFmKHKc
         GILeKboxwtKFd97YqAb10HmmFaxHGbwIJlR70Omh1CO02OMAWOW1RmdOWXqaR6C3e1cf
         QYCP9Ji0CM3UC9pYkCpGfaP/Cjbjzr7hbHITUjojuH0AiDp32cFbo44gCfRPIgGI6GA1
         ASJ3NMqo/ToJKzh3/tfdlF3enEkmujhmqgPMHRFHMQtxfJ/xFYwiwUnC69Aow5yViH8b
         oWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746464050; x=1747068850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvkwbBAAy51gwoOy2GdGqciR4ki2e9eLZIkUV7w/43I=;
        b=Tb+eHgy+8llq2hvoEQubAudeKLVMSIPO3jWvvn5/9KZLaruiSnZ2zMtfLzjxSF6pkj
         zUHcXgfhT6PRiN3Xjz3pg5DfoyN9g6lWe3vrIUVcd6M9V/YtK9TJauBAD1mUENoMiEb1
         DSZGiv67cxzp37JCrNGjcfabZVlb0DFxRJSI0qycbwirH3VfddmQq8K9IgRqmZGS9w1l
         BpSCaRuU/cM7iRa1ScvdlRWissaWnXQGm9+yf143M55OT7ks0cFkpbfRvhMOzMHuL4Dq
         EdUxFrnhaEyjTuATiHkXIeztMFdDhu8JDK8l51wuuyKb2cLfaoBWZlr75+5X2ZTk89CV
         9xuw==
X-Forwarded-Encrypted: i=1; AJvYcCWQj8U+4m9cPbeaUeUCFAo41/DjALEIMaFpmIrS2QxNqPydaINZncyAYofYGPjx/FivPBJEVSZEKZFfMfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyC3Rc5jAI6MuWlb0awnZYsh0FWttuSIW8lw4H0uOF3AhsNTp2
	xUH5rnMFuFreZF9enxQiuWVpY5enY+wCsK2Vo/qXgBRQlVS7x7a4eBx/p362nARxnZvZ8PA+oSJ
	wpro6tZPWruwdZatm0CWjozICbPDbmI0canPL
X-Gm-Gg: ASbGncswR8ue37NwZAyGSnFLH9yZc+UbX23Xz8FihzITSDQo/gp/m9oDpZjxjummQ/g
	bk2pjwDnXMVq5J8kemYqKgUNjv7scqZzgSXLgdjs1GeHqQ40K8OaO+KUHFfjeP17lZ0FIE1/MKI
	KnQwX+5BYyWaVNeSVSNJNa
X-Google-Smtp-Source: AGHT+IFYImIoddN52fXijvNt5y6xVdVxVQ9f+9nrzOlBgiGz/IPyWvzu/ePbKaCOYpESVtCd6w3BF/y++SOQRaJqoG4=
X-Received: by 2002:a05:622a:1aa2:b0:479:1958:d81a with SMTP id
 d75a77b69052e-490cbca1fdfmr634351cf.6.1746464049875; Mon, 05 May 2025
 09:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504061923.66914-1-00107082@163.com> <8edbd2be-d495-4bfc-a9f3-6eaae7a66d91@suse.cz>
 <1da43908.3afc.196a0db7dc3.Coremail.00107082@163.com> <0feb4309-431f-4b74-83bf-e16198798c30@suse.cz>
 <CAJuCfpHS9obp7yoxRUPoj3Yp8KkkYWCnnoXwtmAOxfynnq8aug@mail.gmail.com> <3be93014.40dc.196a153f521.Coremail.00107082@163.com>
In-Reply-To: <3be93014.40dc.196a153f521.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 5 May 2025 09:53:58 -0700
X-Gm-Features: ATxdqUHI1cER8ebejXFC0ZlXWgWhayyDJtXaCo0vHjoz4cOy8TogE8Lp7Fok_sE
Message-ID: <CAJuCfpHKcDkce=no0Uu3UO2ua2GkgkKMZxnctMuDbOqQNKj_KA@mail.gmail.com>
Subject: Re: [PATCH] mm/codetag: sub in advance when free non-compound high
 order pages
To: David Wang <00107082@163.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 9:43=E2=80=AFAM David Wang <00107082@163.com> wrote:
>
>
>
>
> At 2025-05-05 23:33:50, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Mon, May 5, 2025 at 7:55=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> =
wrote:
> >>
> >> On 5/5/25 16:31, David Wang wrote:
> >> >
> >> >
> >> > At 2025-05-05 21:12:55, "Vlastimil Babka" <vbabka@suse.cz> wrote:
> >> >>On 5/4/25 08:19, David Wang wrote:
> >> >>> When page is non-compound, page[0] could be released by other
> >> >>> thread right after put_page_testzero failed in current thread,
> >> >>> pgalloc_tag_sub_pages afterwards would manipulate an invalid
> >> >>> page for accounting remaining pages:
> >> >>>
> >> >>> [timeline]   [thread1]                     [thread2]
> >> >>>   |          alloc_page non-compound
> >> >>>   V
> >> >>>   |                                        get_page, rf counter in=
c
> >> >>>   V
> >> >>>   |          in ___free_pages
> >> >>>   |          put_page_testzero fails
> >> >>>   V
> >> >>>   |                                        put_page, page released
> >> >>>   V
> >> >>>   |          in ___free_pages,
> >> >>>   |          pgalloc_tag_sub_pages
> >> >>>   |          manipulate an invalid page
> >> >>>   V
> >> >>>   V
> >> >>>
> >> >>> Move the tag page accounting ahead, and only account remaining pag=
es
> >> >>> for non-compound pages with non-zero order.
> >> >>>
> >> >>> Signed-off-by: David Wang <00107082@163.com>
> >
> >Thanks for reporting!
> >
> >> >>
> >> >>Hmm, I think the problem was introduced by 51ff4d7486f0 ("mm: avoid =
extra
> >> >>mem_alloc_profiling_enabled() checks"). Previously we'd get the tag =
pointer
> >> >>upfront and avoid the page use-after-free.
> >
> >Right, sorry I missed that.
> >
> >> >
> >> >
> >> > Oh, you're right. I forgot to check history......
> >> >
> >> >
> >> >>
> >> >>It would likely be nicer to fix it by going back to that approach fo=
r
> >> >>___free_pages(), while hopefully keeping the optimisations of 51ff4d=
7486f0
> >> >>for the other call sites where it applies?
> >> >
> >> > After checking that commit, I kind of feels the changes in __free_pa=
ges are
> >> >  the major optimization of the commit....
> >>
> >> We could have both pgalloc_tag_get() to use in __free_page() as before
> >> 51ff4d7486f0, and keep __pgalloc_tag_get() to use in pgalloc_tag_split=
() and
> >> pgalloc_tag_swap().
> >
> >Yes, we can add back pgalloc_tag_get() which would call
> >__pgalloc_tag_get() if mem_alloc_profiling_enabled() is true and
> >change pgalloc_tag_sub_pages() back to use tags instead of pages.
> >__free_pages() is the only user of that function, so that change
> >should not affect anything else.
>
>
> Adding back pgalloc_tag_get() seems just reverting 51ff4d7486f0.....

Not quite. pgalloc_tag_split() and pgalloc_tag_swap() will still be
using __pgalloc_tag_get(), so would avoid the extra checks.

> Do you want me to do it or you take over and make further adjustments?

The change I suggested should be simple, so take a stab at it and I'll
review and ack. If you prefer me to make the change, let me know.

>
>
>
> >
> >>
> >> I think __free_page() didn't benefit from the stated purpose of "avoid=
ing
> >> mem_alloc_profiling_enabled() ... which is often called after that che=
ck was
> >> already done"
> >>
> >> > What about revert that commit and make optimization by condition che=
cks,
> >> > similar to what this patch did?
> >>
> >> The downside of the condition checks is they make the code more comple=
x and
> >> might actually increase overhead when mem_alloc_profiling_enabled() is
> >> false, as those checks add non-static branches outside of the static b=
ranch
> >> that's mem_alloc_profiling_enabled().
> >>
> >> I think __free_pages() before 51ff4d7486f0 was quite ok.
> >>
> >> - pgalloc_tag_get() is done unconditionally, but its code is all insid=
e the
> >> mem_alloc_profiling_enabled() static branch so that's a no-op when pro=
filing
> >> is not enabled
> >>
> >> - pgalloc_tag_sub_pages() is also all behind the static branch inside.=
 Also
> >> it's a very rare path anyway, most freeing should go through the
> >> put_page_testzero() being true.
> >
> >Yeah, the main goal of that change in __free_page() was to make
> >__pgalloc_tag_get() a local function for alloc_tags and limiting the
> >direct use of struct alloc_tag in the core mm code. Obviously I
> >screwed up forgetting why we had to store the tag in the first place.
> >An additional comment in __free_page() is probably a good idea to
> >avoid confusion in the future.
> >Thanks,
> >Suren.
> >
> >>
> >> > David
> >> >
> >>
