Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A661A76BC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812940; cv=none; b=H57XCwNrDyJie2pnTFUHsxIhliYwzUYuq9cR8NaR5VSLP5zn2tGCZp289oAUS6cr0DYuTA9/wD0+oP1gkqQODUfvEdeb4oXu9ORCRV0W3xN4ycfR6jAHgdGn5+DqeRRstTmAjPaqUL1FaoAEWuGIgURvld3N47H1Qq8yz7BvTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812940; c=relaxed/simple;
	bh=AE17+lGajlVNkMivht2iQBeMrcmdEkLw98UVOWG9Wdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+dCQUwCepFoEJeAKw/o0bAmr3wHlBwQIs6nDjA60+4ZH7sU4OeQevNkorVuzgQn+ErOYBdXW1WPhtN6/N+QOP0cjATbkZtWDgW0nDnHQIQmyMNhD33i1hwJRPT+bNaRySxFMc02Fhx2Vez8/XuWq3OJFGLBcAIYVWJEBtzg0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=bAkEX7aU; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="bAkEX7aU"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c59e7039eeso937674685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744812936; x=1745417736; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cKdHsgr+iFIgXoIw8sEEZtMyA3jDEAoy2LzI3UQ5/s=;
        b=bAkEX7aUdIriHkCTS+kqeGPRVHm3UT5AELFvhXmQF99xS1Se9XyrB4dL07QTuDmGt9
         EXEZ/WdQ6zPL+zYRB9xRwizLATweC81dmLS/EeNGV69Jrr+xKdB0jckfJWedFfV+a4cD
         oZkr0MuoSHtx/6iPqeVqCemzKTLqcxCp0E3sha5udVoDFfYNsbxp2nphh7RMXn4FEP1X
         7pZRCDdKt/Wg6qErPtBuhLnsNt0kJj5DucfOAEYA8Uv9TTVE/vB7x9oC8K6ZQF4yw6jS
         yNL+ComotqysYrhREil6Zz9KBWYa2jGPY0xxE7L7+jV41Cep3KT7zQJSwM7S2/C8BhFM
         Aiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812936; x=1745417736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cKdHsgr+iFIgXoIw8sEEZtMyA3jDEAoy2LzI3UQ5/s=;
        b=NMFe6KUevjK5gt2Nd4HV/rStODZCE/XAFAD43/AZ3ZMe1NiLGEVcgaDMW0HptbKtV5
         deM6hoougDTdW7ZrNnlSp6kpBn1DKYyStOR5iZ2x5LmYAH650eicoSTZUt4KysO9qV1X
         aeo1GUEbgB8SXTyIGJSQ7HwlLbgdayFBpIeLa+y2LDpCiFM6uk6m9Nkt0yECjxlMZPrW
         MEk7xAOJpqOC1SH8PF0B+dw+ZBlfz/64RUYgi4JsqxLjTaPnLjcKSGiGj36TkRgmTjp4
         uU6kwpKTr4drkxjnsSuVtnAMk/KObE2sTTw2in2tdzOjouH5URyHhr9sm4xZezxdM8Z6
         Qruw==
X-Forwarded-Encrypted: i=1; AJvYcCUwbyTAV8q7hI4hvIHaDGdCVpxY8xWpdDX2LYuUopy7MHQNlxegCY/OPIMmjyoXAMZ42Xx/2BunC72JuUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0UBbIuUyoyu6xjbzzwMR2DP6wQI9DNrwN4WZFFK8ouVjdRJK
	mXj1yR35JmGnfnBpP8LFcI+8yvUuynujMaFcZKfQBFp+REbcWFR64WMkbVZmPsY=
X-Gm-Gg: ASbGncuESMUtIWxXzWJL2sDELM3HOqEq9bIKTVg9QISuioiA8DrkD9cJFwHvlPE7CoI
	XOWZw9RE1PgQ/O3qmth4ZZc9HlestM1qwoxJEtDRhk6GmebHEIPb73fVv5qQDANDwzh82cwJC3M
	8mMoT/Ug55wsl+NUCe11K51LiRmFUIPjWNc5mjfmyVIpzk9uHpFYK96BHuHcWp0MMfEWX/z+eiH
	iwOW3FEWf74BAEML2HQvkoQzmTYwdUCFkuSloyOaySHZOy40t0cqfIyEwOygNglaW09DYqLw3cL
	+78eU+gImntkrX9dICPeDLBxwv3OnYdypbI4rvk=
X-Google-Smtp-Source: AGHT+IH3UFcDDuJqR4l0+gbFXCOuCElF8Kzn3pslBk7S1KZFd6OX/vWed0KC6MFjnEGqKBsXsum02A==
X-Received: by 2002:a05:620a:468c:b0:7c5:61b2:b84 with SMTP id af79cd13be357-7c918fed5afmr265722985a.19.1744812935816;
        Wed, 16 Apr 2025 07:15:35 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8969cdasm1063935085a.57.2025.04.16.07.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:15:35 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:15:31 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: David Hildenbrand <david@redhat.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
Message-ID: <20250416141531.GD741145@cmpxchg.org>
References: <20250412085852.48524-1-21cnbao@gmail.com>
 <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
 <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
 <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
 <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
 <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com>

On Wed, Apr 16, 2025 at 11:40:31AM +0200, David Hildenbrand wrote:
> On 16.04.25 11:38, Barry Song wrote:
> > On Wed, Apr 16, 2025 at 5:32 PM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 16.04.25 11:24, Barry Song wrote:
> >>> On Wed, Apr 16, 2025 at 4:32 PM David Hildenbrand <david@redhat.com> wrote:
> >>>>
> >>>> On 12.04.25 10:58, Barry Song wrote:
> >>>>> From: Barry Song <v-songbaohua@oppo.com>
> >>>>>
> >>>>> Promoting exclusive file folios of a dying process is unnecessary and
> >>>>> harmful. For example, while Firefox is killed and LibreOffice is
> >>>>> launched, activating Firefox's young file-backed folios makes it
> >>>>> harder to reclaim memory that LibreOffice doesn't use at all.
> >>>>
> >>>> Do we know when it is reasonable to promote any folios of a dying process?
> >>>>
> >>>
> >>> I don't know. It seems not reasonable at all. if one service crashes due to
> >>> SW bug, systemd will restart it immediately. this might be the case promoting
> >>> folios might be good. but it is really a bug of the service, not a normal case.
> >>>
> >>>> Assume you restart Firefox, would it really matter to promote them when
> >>>> unmapping? New Firefox would fault-in / touch the ones it really needs
> >>>> immediately afterwards?
> >>>
> >>> Usually users kill firefox to start other applications (users intend
> >>> to free memory
> >>> for new applications). For Android, an app might be killed because it has been
> >>> staying in the background inactively for a while.
> >>
> >>> On the other hand, even if users restart firefox immediately, their folios are
> >>> probably still in LRU to hit.
> >>
> >> Right, that's what I'm thinking.
> >>
> >> So I wonder if we could just say "the whole process is going down; even
> >> if we had some recency information, that could only affect some other
> >> process, where we would have to guess if it really matters".
> >>
> >> If the data is important, one would assume that another process would
> >> soon access it either way, and as you say, likely it will still be on
> >> the LRU to hit.
> > 
> > I'll include this additional information in the v2 version of the patch since
> > you think it would be helpful.
> > 
> > Regarding the exclusive flag - I'm wondering whether we actually need to
> > distinguish between exclusive and shared folios in this case. The current
> > patch uses the exclusive flag mainly to reduce controversy, but even for
> > shared folios: does the recency from a dying process matter? The
> > recency information only reflects the dying process's usage pattern, which
> > will soon be irrelevant.
> 
> Exactly my thoughts. So if we can simplify -- ignore it completely -- 
> that would certainly be nice.

This doesn't sound right to me.

Remembering the accesses of an exiting task is very much the point of
this. Consider executables and shared libraries repeatedly referenced
by short-lived jobs, like shell scripts, compiles etc.

MADV_COLD and MADV_PAGEOUT where specifically added for this Android
usecase - the rare situation where you *know* those pages are done.
