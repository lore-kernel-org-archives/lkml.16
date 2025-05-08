Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F31FF1A6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738845; cv=none; b=ZQvlGG7SdtmBfvl+t0pAoqhkLDGnuUYmfCogrjuLGVYbVB5utuR1Ovyki3AF2HEnY0xmUh80/syL8nrZdJLFAJGiAiaYVG/+1XSQMWe1nQONABZB2pwQT2rCs/2Lhh9w8YnGmwK5FtdVAjRUjl2j70izEKW++kVPgbwoWcf6QhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738845; c=relaxed/simple;
	bh=3cv6ZrlFJ/maRjtjOZVnEex5kiV5Rlf24wXMNXE+IMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5c+17p50jrlaQD6TLQUnEEz/dkSf/2jk6Mjl9OYlROaKziU0DloorktTadM0+ZryekdKaqLDFX+QrGZRYgLeo4rtpHQ0MhNBvIw9mVvBQ5ShQ81USuUdxlwGweG7DNK/09wGQLcPv8oVEIl2k2gcjpYsnufzjen9AH9ec1scuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=04mdS6ZQ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="04mdS6ZQ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476ae781d21so15469931cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746738839; x=1747343639; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbSEs5i9JI6kyVWaKILrcS+cPrKL+TnrdLE+teJclrk=;
        b=04mdS6ZQxY5ApYhwQhHsUnTcX+ifjCW+5F58QDR4uvhVoZ6OzjBd1yhvf/8vbqqCEp
         jxkiqU1MK5O+u0iHh6Dk7TTPUandVZVFVGLHtzIIGK7bAKEYozW9QwfvnJR/giNijRJe
         KC+IBstzmOMDrCL9wPDJqlID+odPQ2sOh2PrzFR+DJZiwcP+g3E0qylPOCOFNx65gobB
         wv/wCqSpwJdiPlqyKm/sKDUs07igEQwdPNCrD4eIrLbEBkQ6b0TfhqiRJvoUd3PtHgrH
         8XJcZptHYiKDat0LpPzUNnrjVaxYz7ZS578XTCszHUQRSdC5SZJfUhLAQfUj369eyENb
         CsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738839; x=1747343639;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbSEs5i9JI6kyVWaKILrcS+cPrKL+TnrdLE+teJclrk=;
        b=L9rbu/e0THHmliE4hRMpilj9DTTyTJUB3IaV+GYtAC6F3XjxMHgx0/7HoudDnw2Z4G
         F4Rv3aUpUxrcCH8N6AKOXtPfXHH83uADAhwAtUIgBg8THtezC6ulbketZT21n7Pm0eqZ
         hdmGVfm7AU7i2ycZk1+97FOHCBip6JfeBuJo3KnAimhAAadZcUwIioNGc7rWlVa0/rkJ
         a4D+hJ50NXt0OM3PRS766PXpA1HeljpByfxEOp1gEt/cLBIVWtBAmhBM42e2NEWw5e3K
         9RnmWsp6LdfGxpWqTL70vWoRXE9YS41RgMmrGYOKdrzBV9laricV1ioRIi3pH7a1gOWE
         CDfg==
X-Forwarded-Encrypted: i=1; AJvYcCVDpDqGGveAHxbL7K5H2aHfKWJYdcPOB41Tb4KhkpHfz6ChWuuUs9Lp/+dRA466fCNvEREODrh4EuNRfEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXKzhRBQfJ/BykaoRwv+Bj7admhJnw/pB5TO7dBQA01CNxJAtf
	BEwU29mrsNnIDolXGsQx4ojrkAhTQyWUYhcJ1xF6IQrBDjM8oHfHptfItc7+dWE=
X-Gm-Gg: ASbGncsV78cbMVuA8fW4LG9V7L9WvJFFnXsslouyylqhb0tuqxfCpTRFgUBKhv+YxYP
	EDSHp5UWWcVAZqurMY3BHzDetowgVt7cqOYsvKAt+uZxKMtBOGSCaB6zsrYtdjkxwJ/ntD4L0YM
	H4zFit9kuO/eqRl4NlEsozC9DIMl3jkSCFHCTYBMaU5elHMUAwrMSed2LoVTKnnhPVii8T8m/Ss
	msVP8GaPmE6PKYR58zQJbDjV/tMop+mpNIq2bX0E54ANu8r1j0zHohFc+ETZjWUxG9OAOX+zcYx
	baUtyna8YNvRRjqZb2YjFG7SMmuh/9D16oM2qnk=
X-Google-Smtp-Source: AGHT+IFNfVRGOCDTGD5f7kzrdDnm/pknN1mDWYFshHPxof/afMsFf7sZViFjDfUmWlKz4iK4AuBqPg==
X-Received: by 2002:a05:622a:5518:b0:478:f76c:191d with SMTP id d75a77b69052e-494527f4418mr16695871cf.52.1746738839059;
        Thu, 08 May 2025 14:13:59 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494524bbc53sm3172241cf.47.2025.05.08.14.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:13:58 -0700 (PDT)
Date: Thu, 8 May 2025 17:13:57 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Message-ID: <20250508211357.GE323143@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
 <50BB00FF-746E-4623-8F48-F74209EDBD0A@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50BB00FF-746E-4623-8F48-F74209EDBD0A@nvidia.com>

On Thu, May 08, 2025 at 04:22:43PM -0400, Zi Yan wrote:
> On 7 May 2025, at 17:10, Zi Yan wrote:
> 
> > During page isolation, the original migratetype is overwritten, since
> > MIGRATE_* are enums and stored in pageblock bitmaps. Change
> > MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
> > PB_migrate_skip, so that migratetype is not lost during pageblock
> > isolation. pageblock bits needs to be word aligned, so expand
> > the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit 7.
> >
> > Signed-off-by: Zi Yan <ziy@nvidia.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

> > ---
> >  include/linux/mmzone.h          | 17 ++++++++++----
> >  include/linux/page-isolation.h  |  2 +-
> >  include/linux/pageblock-flags.h | 33 +++++++++++++++++++++++++-
> >  mm/page_alloc.c                 | 41 ++++++++++++++++++++++++++++++++-
> >  4 files changed, 86 insertions(+), 7 deletions(-)
> >
> 
> Here is the fixup 1/3 to address Johannes’ comments.

Thanks!

