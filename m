Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED07C2C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190574; cv=none; b=sUOzjz+hHHhyDWSe6uYIcf1iBXYw6xuBaKC7vgXnVKpQEwHebG8BHme7IUIaxQkK6DdyZWvX5xoOFZphRCdvVfuiODHCgixVl89+epjrtU99EqYRphQuRfWJfww03U4WlPRwjr0vh0S1ZBzps/ur+pjYnMPzKD47Xhpyla/5Np8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190574; c=relaxed/simple;
	bh=j5CWRWEzO5vuVFiXTf1YZ5CXD0FOTZIr5AyE46KhJKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI5BTeyi13AkJP5kNT+BqNQoleWz1iZrtQRK83xrXXa6COF+XJPK8oRacmRy4fYQ4tiS7vHme9fE5okZD3u1U6QzLbleHcQKBEfSyd+w0ioPFgH9r45cjjxP672f8RnsWMxRJukpPTGMeCoEaEc+vwqY5pDEv4fNKZ+qIZx4/g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-fa-682403258f26
Date: Wed, 14 May 2025 11:42:40 +0900
From: Byungchul Park <byungchul@sk.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	byungchul.park@sk.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel_team@skhynix.com
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <20250514024240.GA39248@system.software.com>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
 <aCQBJEDWBhFsc7O-@harry>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCQBJEDWBhFsc7O-@harry>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsXC9ZZnka4qs0qGwevV0hZz1q9hs9h1I8Ti
	6/pfzBb3lz1jsTi+dR67xeVdc9gs7q35z2pxctZKFotvfdIWs4/eY3fg8tg56y67x+I9L5k8
	Nn2axO5xYsZvFo/e5ndsHh+f3mLxeL/vKpvH501yARxRXDYpqTmZZalF+nYJXBkzZ+YVTBCu
	ePbdo4FxNn8XIyeHhICJxJt/j1lh7MkTz7OD2CwCqhLTn58Ci7MJqEvcuPGTGcQWEVCReHvs
	EFsXIxcHs8A8ZomHJ/+CFQkLOEkcunwRrIhXwELiw9F3QHEODiGBaInONm6IsKDEyZlPWEBs
	ZgEtiRv/XjKBlDALSEss/8cBEuYEWnv6+16wKaICyhIHth1nAlklIfCaTeLa0y1MEHdKShxc
	cYNlAqPALCRjZyEZOwth7AJG5lWMQpl5ZbmJmTkmehmVeZkVesn5uZsYgfGwrPZP9A7GTxeC
	DzEKcDAq8fBa6CpnCLEmlhVX5h5ilOBgVhLhvZ4FFOJNSaysSi3Kjy8qzUktPsQozcGiJM5r
	9K08RUggPbEkNTs1tSC1CCbLxMEp1cAoHhIs6t1xeKLWvrgPYYp3b6w449m86LPE4lPyral8
	60V1jfgTp+6Zxc9zwimb+2zM9Jxl+jkmZh+F1HfecM536jabYP55otYdw5ePym6/FnkzJUHo
	VYXz10OBYf0u/El7zkjPjLl34nvFGYeX890tCuc+lLfdqP1g64Utl1vv+2wS8z46zUBSiaU4
	I9FQi7moOBEABWDbY4MCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsXC5WfdrKvKrJJhcKuVz2LO+jVsFrtuhFjs
	+PuR2eLr+l/MFveXPWOxOL51HrvF4bknWS0u75rDZnFvzX9Wi5OzVrJYfOuTtjh07Tmrxeyj
	99gdeD12zrrL7rF4z0smj02fJrF7nJjxm8Wjt/kdm8fHp7dYPN7vu8rm8e22h8fiFx+YPD5v
	kgvgiuKySUnNySxLLdK3S+DKmDkzr2CCcMWz7x4NjLP5uxg5OSQETCQmTzzPDmKzCKhKTH9+
	ihXEZhNQl7hx4ycziC0ioCLx9tghti5GLg5mgXnMEg9P/gUrEhZwkjh0+SJYEa+AhcSHo++A
	4hwcQgLREp1t3BBhQYmTM5+wgNjMAloSN/69ZAIpYRaQllj+jwMkzAm09vT3vWBTRAWUJQ5s
	O840gZF3FpLuWUi6ZyF0L2BkXsUokplXlpuYmWOqV5ydUZmXWaGXnJ+7iREY+Mtq/0zcwfjl
	svshRgEORiUeXgtd5Qwh1sSy4srcQ4wSHMxKIrzXs4BCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
	eb3CUxOEBNITS1KzU1MLUotgskwcnFINjP1Fajsm/HbxCp0lMzv694aXdrtSPiQ/nDw/7/1/
	o2iHL2zij7//37aRl/fd1fAD6dKzLX9d/uZxK6NgD9v6pS9WvlLinuT8cvbXN18m/4oOSFXh
	2uzQaB314KBKTfmORVv3FBxgW/irIi9m1b2yudzfiv8HH57bdeyQepJOzd+WGXvVfAumH72n
	xFKckWioxVxUnAgANb1OYngCAAA=
X-CFilter-Loop: Reflected

On Wed, May 14, 2025 at 11:34:12AM +0900, Harry Yoo wrote:
> On Tue, May 13, 2025 at 05:00:07PM +0100, Lorenzo Stoakes wrote:
> > As part of the ongoing efforts to sub-divide memory management
> > maintainership and reviewership, establish a section for memory policy and
> > migration and add appropriate maintainers and reviewers.
> > 
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> > 
> > REVIEWERS NOTES:
> > 
> > I took a look through git blame, past commits, etc. and came up with what
> > seems to be a reasonable list of people here, if you don't feel you ought
> > to be here, or if you feel anybody is missing (including yourself!) let me
> > know :)
> > 
> > David has kindly already agreed to be co-maintainer for this section.
> > 
> >  MAINTAINERS | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 80aa09f2e735..29d73593038c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> >  F:	mm/gup.c
> > 
> > +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	David Hildenbrand <david@redhat.com>
> > +R:	Zi Yan <ziy@nvidia.com>
> > +R:	Alistair Popple <apopple@nvidia.com>
> > +R:	Matthew Brost <matthew.brost@intel.com>
> > +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> > +R:	Rakie Kim <rakie.kim@sk.com>
> 
> Maybe
> 
> R: Byungchul Park <byungchul@sk.com> ?
> 
> Although his LUF work hasn't made it upstream, he has a solid understanding
> of migration and it would be helpful to have him involved as a reviewer.
> 
> Of course, only if he has interests and the capacity to review.
> 
> Byungchul, what do you think?

Grateful.  I'd like to contribute as a reviewer on it.

Thanks.

	Byungchul

> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +W:	http://www.linux-mm.org
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	include/linux/mempolicy.h
> > +F:	include/linux/migrate.h
> > +F:	mm/mempolicy.c
> > +F:	mm/migrate.c
> > +F:	mm/migrate_device.c
> > +
> >  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
> >  M:	Andrew Morton <akpm@linux-foundation.org>
> >  M:	Mike Rapoport <rppt@kernel.org>
> > --
> > 2.49.0
> 
> -- 
> Cheers,
> Harry / Hyeonggon
