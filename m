Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FCD25A35F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739230139; cv=none; b=uCDfvOWej/80jcA0MsTQ8lezS9p0BEFVue2APD33UZI5p7fX1v9Cr78DByv9BoAk6ETsnUJPWPeK0sy9ImsxxUyrRdS7b8kaqg0WyjSWEZtPOScOU4ek/0Y5lPe9Kk5YACQ5LXG/N3pZjI3l9dyG78S3Yuvq+WYdtuI6vg4bLSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739230139; c=relaxed/simple;
	bh=VWwKenO3pHoeNahD4JXaMTHRRxYv4FgRe0zy5LWl2TI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Hg99DgHXX5SB3Rtx//PICgcrLUFqU9nSDDCYwz5TIyeALdEjbfAdDKYEscABDwmOs+7kqtIakYxoyy9H8U3BS2+tsLFsdUyFx1oUdl76OWIivgFavCsq1hWt3aK6kBUmDGv0nEga7tiZTU43ob2+nKi8OE3DTkgLZAFxEz43ErM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U6FpgS1h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U6FpgS1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB34C4CED1;
	Mon, 10 Feb 2025 23:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1739230139;
	bh=VWwKenO3pHoeNahD4JXaMTHRRxYv4FgRe0zy5LWl2TI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U6FpgS1h8JWx6/e7lpOWx0bk4AAxwgyk5CQXyRU/412J5S2J9cMfDWBmNjqMAd3CH
	 /LuxvmXfFZNsX0dp2Bc5+WXjD0pJ5zCHBZgCDJtN2fESjTIFb9Z0GevkysNM8dUany
	 wH0Sza9cbH4H7Km7VsEjwA5q8nA5VptULEK6V/Fw=
Date: Mon, 10 Feb 2025 15:28:58 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, muchun.song@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 usamaarif642@gmail.com, joao.m.martins@oracle.com, roman.gushchin@linux.dev
Subject: Re: [PATCH v3 00/28] hugetlb/CMA improvements for large systems
Message-Id: <20250210152858.58e6ac26b9cd6e2a36aaac8f@linux-foundation.org>
In-Reply-To: <CAPTztWYD09A5rJBPNtjDa07uMswxFHutYGwBR54ByfMchd6YKA@mail.gmail.com>
References: <20250206185109.1210657-1-fvdl@google.com>
	<Z6pH_9X-kFhwPz2-@localhost.localdomain>
	<CAPTztWYD09A5rJBPNtjDa07uMswxFHutYGwBR54ByfMchd6YKA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Feb 2025 10:56:50 -0800 Frank van der Linden <fvdl@google.com> wrote:

> > Hi Frank,
> >
> > While I plan to keep reviewing the series, I think it would make sense
> > to split this patchset into two smaller ones.
> > The way I see it, we are trying to deal with two different problems and their
> > solutions.
> >
> > 1) pre-hvo at boot time
> > 2) multi-range support of CMA (only used for hugetlb)
> >
> > I did not go through the entire patchset yet, so I ignore whether the
> > respective patches to tackle these two problems are really dependent on
> > each other, but I think that would be very interesting to consider a
> > patchset per solution if that is not the case.
> >
> > IMHO, it would ease review quite a lot.
> 
> Hi Oskar,
> 
> Thanks a lot for reviewing this series.
> 
> I certainly could split it up, but here are the dependencies (it's
> actually 3 parts):
> 
> 1. Multi-range CMA (used by hugetlb) (patches 1-4)
> 2. Pre-HVO for hugetlb bootmem pages (patches 5-22)
> 3. Enable hugepages= (and pre-HVO) for CMA (patches 23-28)
> 
> 1 and 2 are independent. 3 depends on 1 and 2.
> 
> So, I could post 1) and 2) simultaneously, and 3) would have to wait
> until 1) and 2) are resolved.
> 
> Andrew, do you have any thoughts on splitting it up?

I don't see much trouble with the above dependencies - we can consider
the three series to be an all-or-nothing thing.

Such a splitup would be the same patches, packaged slightly
differently.  The main difference would be the presence of two more
[0/n] cover letters, presumably also repackaging existing material.  I
don't see a lot of benefit personally.


