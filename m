Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F024337C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159719; cv=none; b=Zqq4XcdUFSux6+iqH4BSJeVO7Crp7LpD/As49q/yqan298kgtYHECmSWDQEJqS8X/lxC1qvVr1lCqvvUUgrcUjkOdzHGxEPRmIx457V2M3J6KqDUksa1vRrtCfLlEigkojqkx3zARdys6QM0U89V4ip2vDRw1JQH9umHnwtjjM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159719; c=relaxed/simple;
	bh=V49+CJUSNLrpmYD8ZRk+gNndRvOLj21x2YuAjt/jfwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=IIa2tRuYZjuvpF7M1jgsc7Oe1huMQhbYEvZ0OitKfYATA6JDM3aA8fFtPv/y/Tg2QjbkIIb7OZT5Ar0MknJHgjoNbRydJ+9PudYpYuaRiDu88xg+qZ7OOoJOpyKVdtYyqSECGo+v71dRAIzF4qRBvfFKOllsstxDbZE7QWGDCTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RMvW3fEM; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RMvW3fEM"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250210035507epoutp02a0d6763db6b12b5b1cb742f6acbf37e3~ivIoOUcQL1950119501epoutp02k
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:55:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250210035507epoutp02a0d6763db6b12b5b1cb742f6acbf37e3~ivIoOUcQL1950119501epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739159707;
	bh=0wFRLSuDbuYGNnENHxJNVSB9NrjfAbmPgTwXEcNnYjw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RMvW3fEM2GKh3yEWx5qa3NdSeEBmUBQ4tZGmkRdIstfJZ3Qs8uGFYFZEfd8fXrpyM
	 8l+cUjD9x18BL3H8ZZohOQDgBkM2DkAricF8AIWo4WYcXq2VZQybLHNo9VQ4q9JzPt
	 DwCP4LP1/B26QHv2mqrh7BeAtSz/UZeId5qugdLw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20250210035506epcas2p312bf0a7b499ed155fc5293dce2160632~ivInZhQsH0586805868epcas2p3a;
	Mon, 10 Feb 2025 03:55:06 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.100]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YrrLx5mNVz4x9Pw; Mon, 10 Feb
	2025 03:55:05 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	23.94.32010.99879A76; Mon, 10 Feb 2025 12:55:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250210035505epcas2p45b97233c9099969088ae0f06e9074980~ivImdRwPQ1091310913epcas2p4D;
	Mon, 10 Feb 2025 03:55:05 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250210035505epsmtrp2bb34b171eecdab98251b9015f73ec1e4~ivImckGYJ0783907839epsmtrp2y;
	Mon, 10 Feb 2025 03:55:05 +0000 (GMT)
X-AuditID: b6c32a4d-acffa70000007d0a-49-67a978996ef5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	44.CA.33707.99879A76; Mon, 10 Feb 2025 12:55:05 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250210035505epsmtip11b5d29e355b91cb1699f1a152dc713b5~ivImRKO4O0906709067epsmtip1e;
	Mon, 10 Feb 2025 03:55:05 +0000 (GMT)
Date: Mon, 10 Feb 2025 12:53:40 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: janghyuck.kim@samsung.com, Christoph Lameter <cl@linux.com>, Pekka
	Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo
	Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo
	<42.hyeyoo@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: slub: call WARN() instead of pr_err on slab_fix.
Message-ID: <20250210035336.GA1868980@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4462a28e-b78d-4735-8aed-03cace80b24d@suse.cz>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmhe7MipXpBgsOaFhM7DGwmLN+DZvF
	9W9vGC1WdjezWWyeU2xxedccNot7a/6zWrR9/gcklmxkspi4RtRidmMfowO3x85Zd9k9Fmwq
	9di0qpPNY9OnSeweXW+vMHmcmPGbxePJlelMHgsbpjJ79G1ZxehxZsERdo/Pm+QCuKOybTJS
	E1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOAjlZSKEvMKQUK
	BSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGc0XnAt
	OG1bsfXdN8YGxjO6XYwcHBICJhK7P6l2MXJxCAnsYZSYeWYlG4TziVFi9aP1jHDO0V13mLsY
	OcE67i2cyApiCwnsZJT4toQDougpo8SeZVvAEiwCqhI/Xt8Cs9kE1CVObFnGCGKLCKhIPNpw
	lBWkgVngMZPEi8fzwaYKC/hILLxwlAXE5hXQk/j8aTI7hC0ocXLmE7A4p4C1xLOHvWAnSQis
	5JBY2/aGDeIkF4mXDfMYIWxhiVfHt7BD2FISn9/thaoplti2+DATRHMDo8TmjvtQ/xhLzHrW
	DtbMLJAhsfzlPGZIyChLHLnFAhHmk+g4/JcdIswr0dEmBNGpLLF/2TwWCFtS4tHadlYI20Pi
	yOxv0HCcxiTx5eRqxgmMcrOQ/DMLyTYIW0diwe5PbLOAVjALSEss/8cBYWpKrN+lv4CRdRWj
	VGpBcW56arJRgaFuXmo5PJKT83M3MYLTsZbvDsbX6//qHWJk4mA8xCjBwawkwmuycEW6EG9K
	YmVValF+fFFpTmrxIUZTYAxNZJYSTc4HZoS8knhDE0sDEzMzQ3MjUwNzJXHe6h0t6UIC6Ykl
	qdmpqQWpRTB9TBycUg1MZdukVyqZTPp9KtLvUI3eg9CtNeW77zcfeHRWTeX166i/W17PuaNn
	rtFms2e9/T7D925emXwT/4V/UAqRP7QwZcWD41HTikr4jJVVDQLWrOp1mPxFzKJpJausQZfI
	9RsNW8T2eZasm2dYGaX1Q6MvrGPRiclsPKsvrZStM3jyYNXEOUvL9frYZ2TxbetYIKz0roc9
	tu0Q19vF6nsnPE0uufJmRvZ71Z/d09c53jsufOWv7ZNMq01Suk7i217e0pP9xz+9e6fxP4MD
	U569nJP5/r/ltgPrUx4aZD+Ubww3rJy0T3/tu9/x3x88k9to8cD5oNkKb95Ut89MDdk8sj+a
	9n99tF1h4r6T1umN4Uv7hZVYijMSDbWYi4oTAcvkxfVQBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsWy7bCSnO7MipXpBnNnClhM7DGwmLN+DZvF
	9W9vGC1WdjezWWyeU2xxedccNot7a/6zWrR9/gcklmxkspi4RtRidmMfowO3x85Zd9k9Fmwq
	9di0qpPNY9OnSeweXW+vMHmcmPGbxePJlelMHgsbpjJ79G1ZxehxZsERdo/Pm+QCuKO4bFJS
	czLLUov07RK4Mtb+fctc0G1d8e3CJdYGxqXaXYycHBICJhL3Fk5kBbGFBLYzSvy8EQMRl5SY
	9fkkE4QtLHG/5QhQDRdQzWNGiSvfNoA1sAioSvx4fQvMZhNQlzixZRkjiC0ioCLxaMNRsAZm
	gZdMEqf3LGYGSQgL+EgsvHCUBcTmFdCT+PxpMjvE1GlMEg+uT4dKCEqcnPkEzGYW0JK48e8l
	0BkcQLa0xPJ/HCBhTgFriWcPexknMArMQtIxC0nHLISOBYzMqxhFUwuKc9NzkwsM9YoTc4tL
	89L1kvNzNzGCI0graAfjsvV/9Q4xMnEwHmKU4GBWEuE1WbgiXYg3JbGyKrUoP76oNCe1+BCj
	NAeLkjivck5nipBAemJJanZqakFqEUyWiYNTqoFpkWaK/kSB/2em2Sc9lZd991RIannGp+hr
	wa0Lj/I/frNcgulu+9HtF6IuMW+qc+B8mX/K4ur/9FA1aam4bT33ODNzZrPEJ12LDlxttiFr
	h+5hNZY78zRNPwk8c5ONrNs4+3ifg0fzotm9GVo1QkaKFgaOaznvXtjN88DgZdg2+2WsEuIS
	0+7EhnNtWsiS77T+9p58+0d2LM+m+ivkJPWZBL+IbomKi+pu2Gvb2rXM40TWiSxtHYHF625/
	+mCUxcG0ef9fnkP3OQqO7uWb1O30ftoipvkphp8FXkgJz5lw00Y9pX/TbHUv68lzROZc7Du1
	8Wi+2tIYprkBK6M/BSn+PTLl/Yus62s4NhnxWdorsRRnJBpqMRcVJwIA1ZrL6w8DAAA=
X-CMS-MailID: 20250210035505epcas2p45b97233c9099969088ae0f06e9074980
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----m7PZ4BT1ldTQPVcONAqyTj2Zy1CXq_CO7oNb.DekQ57E.lpM=_9961e_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64
References: <CGME20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64@epcas2p3.samsung.com>
	<20250205004615.1253389-1-hyesoo.yu@samsung.com>
	<47de9f52-e66a-4ecd-b561-6b97d2eab671@suse.cz>
	<20250207032828.GA491394@tiffany>
	<4462a28e-b78d-4735-8aed-03cace80b24d@suse.cz>

------m7PZ4BT1ldTQPVcONAqyTj2Zy1CXq_CO7oNb.DekQ57E.lpM=_9961e_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 07, 2025 at 10:08:20AM +0100, Vlastimil Babka wrote:
> On 2/7/25 04:28, Hyesoo Yu wrote:
> > On Thu, Feb 06, 2025 at 12:35:22PM +0100, Vlastimil Babka wrote:
> >> On 2/5/25 01:46, Hyesoo Yu wrote:
> >> > If a slab object is corrupted or an error occurs in its internal
> >> > value, continuing after restoration may cause other side effects.
> >> > At this point, it is difficult to debug because the problem occurred
> >> > in the past. It is better to use WARN() instead of pr_err to catch
> >> > errors at the point of issue because WARN() could trigger panic for
> >> > system debugging when panic_on_warn is enabled. WARN() should be
> >> > called prior to fixing the value because when a panic is triggered by WARN(),
> >> > it allows us to check corrupted data.
> >> > 
> >> > Changes in v2:
> >> > - Replace direct calling with BUG_ON with the use of WARN in slab_fix.
> >> > 
> >> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> >> 
> >> Hi and thanks for the patch,
> >> 
> >> I wonder if it would be better not to change slab_fix() but rather
> >> slab_err() and object_err(). It wouldn't then require to rearrange the fixup
> >> code. Also I think some error reporting paths don't go through slab_fix()
> >> and we still would like them to become a WARN too.
> >> 
> >> Basically it would mean the last line in slab_err() would be a WARN and we'd
> >> drop the dump_stack() as that's redundant. Same in object_err() (no
> >> dump_stack() there). It would be a bit noisier as a result, but hopefully
> >> acceptable. The slab specific debugging info would still be printed before
> >> the WARN hits (and potentially results in a panic) so anyone investigating
> >> the crash dump would have that information.
> >> 
> >> Hm but I see some places print stuff after slab_err(). slab_pad_check() and
> >> list_slab_objects(). We could create slab_err_start() and slab_err_end() for
> >> those, and slab_err() would just call both at once.
> >> 
> > 
> > Thank you so much for your review.
> > 
> > That's a great suggestion. Following your suggestion, it seems possible to use
> > WARN on all error reporting paths. For some places print stuff after slab_err,
> > print them as follows,
> > 
> > +static void __slab_err(struct slab *slab)
> > +{
> > +       print_slab_info(slab);
> > +       add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> > +
> > +       WARN_ON(1);
> > +}
> > +
> >  static __printf(3, 4) void slab_err(struct kmem_cache *s, struct slab *slab,
> >                         const char *fmt, ...)
> >  {
> >         vsnprintf(buf, sizeof(buf), fmt, args);
> >         va_end(args);
> >         slab_bug(s, "%s", buf);
> > -       print_slab_info(slab);
> > -       dump_stack();
> > -       add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> > +       __slab_err(slab);
> >  }
> > 
> > @@ -1316,11 +1322,13 @@ slab_pad_check(struct kmem_cache *s, struct slab *slab)
> >         while (end > fault && end[-1] == POISON_INUSE)
> >                 end--;
> > 
> > -       slab_err(s, slab, "Padding overwritten. 0x%p-0x%p @offset=%tu",
> > -                       fault, end - 1, fault - start);
> > +       slab_bug(s, "Padding overwritten. 0x%p-0x%p @offset=%tu",
> > +                fault, end - 1, fault - start);
> >         print_section(KERN_ERR, "Padding ", pad, remainder);
> > 
> >         restore_bytes(s, "slab padding", POISON_INUSE, fault, end);
> > +
> > +       __slab_err(slab);
> 
> Yeah but move that above restore_bytes()?
>

Yes, I will.

> BTW I think we could also do this?
> 
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1162,7 +1162,7 @@ void skip_orig_size_check(struct kmem_cache *s, const void *object)
>         set_orig_size(s, (void *)object, s->object_size);
>  }
>  
> -static void slab_bug(struct kmem_cache *s, char *fmt, ...)
> +static void slab_bug(struct kmem_cache *s, const char *fmt, ...)
>  {
>         struct va_format vaf;
>         va_list args;
> @@ -1263,15 +1263,11 @@ static __printf(3, 4) void slab_err(struct kmem_cache *s, struct slab *slab,
>                         const char *fmt, ...)
>  {
>         va_list args;
> -       char buf[100];
>  
>         if (slab_add_kunit_errors())
>                 return;
>  
> -       va_start(args, fmt);
> -       vsnprintf(buf, sizeof(buf), fmt, args);
> -       va_end(args);
> -       slab_bug(s, "%s", buf);
> +       slab_bug(s, fmt, args);
> 
> 

I guess the args is not initialized.

Do you want it to be modified like this ?

Thanks,
Regards.

-static void slab_bug(struct kmem_cache *s, char *fmt, ...)
+static void slab_bug(struct kmem_cache *s, const char *fmt, ...)
 {
        struct va_format vaf;
        va_list args;
@@ -1137,15 +1137,14 @@ static __printf(3, 4) void slab_err(struct kmem_cache *s, struct slab *slab,
                        const char *fmt, ...)
 {
        va_list args;
-       char buf[100];

        if (slab_add_kunit_errors())
                return;

        va_start(args, fmt);
-       vsnprintf(buf, sizeof(buf), fmt, args);
+       slab_bug(s, fmt, args);
        va_end(args);
-       slab_bug(s, "%s", buf);


> >  }
> > 
> >> > ---
> >> >  mm/slub.c | 10 +++++-----
> >> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >> > 
> >> > diff --git a/mm/slub.c b/mm/slub.c
> >> > index 1f50129dcfb3..ea956cb4b8be 100644
> >> > --- a/mm/slub.c
> >> > +++ b/mm/slub.c
> >> > @@ -1043,7 +1043,7 @@ static void slab_fix(struct kmem_cache *s, char *fmt, ...)
> >> >  	va_start(args, fmt);
> >> >  	vaf.fmt = fmt;
> >> >  	vaf.va = &args;
> >> > -	pr_err("FIX %s: %pV\n", s->name, &vaf);
> >> > +	WARN(1, "FIX %s: %pV\n", s->name, &vaf);
> >> >  	va_end(args);
> >> >  }
> >> >  
> >> > @@ -1106,8 +1106,8 @@ static bool freelist_corrupted(struct kmem_cache *s, struct slab *slab,
> >> >  	if ((s->flags & SLAB_CONSISTENCY_CHECKS) &&
> >> >  	    !check_valid_pointer(s, slab, nextfree) && freelist) {
> >> >  		object_err(s, slab, *freelist, "Freechain corrupt");
> >> > -		*freelist = NULL;
> >> >  		slab_fix(s, "Isolate corrupted freechain");
> >> > +		*freelist = NULL;
> >> >  		return true;
> >> >  	}
> >> >  
> >> > @@ -1445,9 +1445,9 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> >> >  				set_freepointer(s, object, NULL);
> >> >  			} else {
> >> >  				slab_err(s, slab, "Freepointer corrupt");
> >> > +				slab_fix(s, "Freelist cleared");
> >> >  				slab->freelist = NULL;
> >> >  				slab->inuse = slab->objects;
> >> > -				slab_fix(s, "Freelist cleared");
> >> >  				return 0;
> >> >  			}
> >> >  			break;
> >> > @@ -1464,14 +1464,14 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> >> >  	if (slab->objects != max_objects) {
> >> >  		slab_err(s, slab, "Wrong number of objects. Found %d but should be %d",
> >> >  			 slab->objects, max_objects);
> >> > -		slab->objects = max_objects;
> >> >  		slab_fix(s, "Number of objects adjusted");
> >> > +		slab->objects = max_objects;
> >> >  	}
> >> >  	if (slab->inuse != slab->objects - nr) {
> >> >  		slab_err(s, slab, "Wrong object count. Counter is %d but counted were %d",
> >> >  			 slab->inuse, slab->objects - nr);
> >> > -		slab->inuse = slab->objects - nr;
> >> >  		slab_fix(s, "Object count adjusted");
> >> > +		slab->inuse = slab->objects - nr;
> >> >  	}
> >> >  	return search == NULL;
> >> >  }
> >> 
> >> 
> > 
> > 
> 
> 

------m7PZ4BT1ldTQPVcONAqyTj2Zy1CXq_CO7oNb.DekQ57E.lpM=_9961e_
Content-Type: text/plain; charset="utf-8"


------m7PZ4BT1ldTQPVcONAqyTj2Zy1CXq_CO7oNb.DekQ57E.lpM=_9961e_--
