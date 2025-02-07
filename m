Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCB84EB51
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738899793; cv=none; b=Z1U9VNrn5oUVfQeUsBNh8fjlvEEJNn0++Xjs20HAH6GbwwnkKtYTmKqTbYbKK8mOd8J9XZ8eujUuEmJdMfPfWPYJBjYtjaCJbNJqqOCHRquqGGjZR0v6UmJCVxVUsAWpbFU0ZkPfUNM7o2TV1aBTEDQry+4sFK58+te/CReakAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738899793; c=relaxed/simple;
	bh=dNgyOKU4YakkJRUTUsKRfmjeUkZdJwdNZMmJifDeGYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=eqIlChKbC7LkIE7BTKorzV1UzFbdQqVp0c4CGPv0Y5TaLXwDOVHV8VSCiYoLBCzdYUbtgDTSiFZqroPFOQhHeonIfvIklR1sBBepe7mepqlBwm8tGHucJ2bsQGeZZ236+tM10wFNm9dUUxTqdf7x6lDb5q5ajyYFQoHR6HP69G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=M8s8AMSm; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="M8s8AMSm"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250207034307epoutp0164fe8d03bf7404e0df319f3487e81070~h0CTdAUel1499814998epoutp01c
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:43:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250207034307epoutp0164fe8d03bf7404e0df319f3487e81070~h0CTdAUel1499814998epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738899787;
	bh=XzP4NKg91izVt81d0t10hKnI2+gFIJePspVeYoHJZY0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M8s8AMSmfeYzQlpWQaaJ0txE+mrftAkVHUt5gSEaEOCiHms3q3MlNoQ2ZoevO2wyM
	 SOgmoGjBYQvWs1Yz3Gwt7HXyJQUFsX6FdD4qTvmK3lwU0r8orb8V/HW+wWCvPa/qwA
	 d4CzSH4rBz/H2futVxniALzsBlgDA9TubYJPb5/U=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20250207034307epcas2p2c98375c72e4ddb4c911a29ade027029e~h0CSzT5Fm0055200552epcas2p2V;
	Fri,  7 Feb 2025 03:43:07 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Yq0DV4C09z4x9Pw; Fri,  7 Feb
	2025 03:43:06 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	D5.C3.23368.A4185A76; Fri,  7 Feb 2025 12:43:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250207034306epcas2p1e0fe6fc78b01fe7b3a55d19f1aaf24db~h0CRxgywb1436814368epcas2p1h;
	Fri,  7 Feb 2025 03:43:06 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250207034306epsmtrp2cc06bbaa6bdd99544a01168f616ca094~h0CRwonEc2049520495epsmtrp2j;
	Fri,  7 Feb 2025 03:43:06 +0000 (GMT)
X-AuditID: b6c32a45-dc9f070000005b48-52-67a5814a2dc4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	56.2B.18729.94185A76; Fri,  7 Feb 2025 12:43:05 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250207034305epsmtip2e17e29df9ef16e25f085ac43faaab771~h0CRhSyxb1232912329epsmtip2K;
	Fri,  7 Feb 2025 03:43:05 +0000 (GMT)
Date: Fri, 7 Feb 2025 12:41:43 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: janghyuck.kim@samsung.com, chengming.zhou@linux.dev, Christoph Lameter
	<cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes
	<rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton
	<akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: slub: Print the broken data before restoring
 slub.
Message-ID: <20250207034143.GB491394@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0d4360b1-0010-45b4-a6d9-94941be89107@suse.cz>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRmVeSWpSXmKPExsWy7bCmua5X49J0g1kL5Swm9hhYzFm/hs1i
	45lPrBbXv71htFjZ3cxmsXlOscXlXXPYLO6t+c9q0fb5H5BYspHJYuIaUYvZjX2MDjweO2fd
	ZfdYsKnUY9OqTjaPTZ8msXt0vb3C5HFixm8WjydXpjN5LGyYyuzRt2UVo8eZBUfYPT5vkgvg
	jsq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAG6XEmh
	LDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQ
	nbHx0Hemgg7jigk3rjM1MB5T72Lk4JAQMJHYe4Oti5GLQ0hgB6NE265fzBDOJ0aJjt0dUM43
	Rom7l+4ClXGCdfx/9YsVIrGXUeLZl3XsEM5TRolLv06zgFSxCKhI/Nv0hBHEZhNQlzixZRmY
	LQIUf7ThKFg3s8B/Jom1VzawgySEBQIkbp49CFbEK6Ar8X/yNShbUOLkzCcsIMdyClhLHP2h
	B9IrIbCFQ+J0625miJNcJA5O+cAKYQtLvDq+hR3ClpL4/G4v1NnFEtsWH2aCaG5glNjccR+q
	2Vhi1rN2sGXMAhkSJy4uZIKEjLLEkVssEGE+iY7Df9khwrwSHW1CEJ3KEvuXzWOBsCUlHq1t
	hzrBQ6L52GwWSKAcZJSYNLODZQKj3Cwk78xCsg3C1pFYsPsT2yygFcwC0hLL/3FAmJoS63fp
	L2BkXcUollpQnJueWmxUYAiP4eT83E2M4JSs5bqDcfLbD3qHGJk4GA8xSnAwK4nwTlmzJF2I
	NyWxsiq1KD++qDQntfgQoykwciYyS4km5wOzQl5JvKGJpYGJmZmhuZGpgbmSOG/1jpZ0IYH0
	xJLU7NTUgtQimD4mDk6pBqYlq6Zd3/+pKsjhnqznnI67ygHLc06Jyhr/81W41Dwv5pXGXMuj
	oh9PLFRKu77j8sd/7vrBU++zVq3cnx8hnevCV6rFx2Kya8HD7vz/EVuOMiXk37e4tiXK/cDH
	FeVvnVzCi6e6LIqVW2eV+CrpeduE3ku8PNtvv5wsfWbT2S1TleucNnbsieHtbjzgsPzsnuOy
	SzkmJ9w+OMW5x71QbpLrMRHTYjWDy0mbklasfM4pIjtfl++tueZG1ebDdRxWueyvcj9Zbmn0
	kI434Xnu4iYe/mOCSbnsOf+42S8TqyZ0Bss/vuPxjvX9my8FLgx8lwsFyjVPMnxyZJ17ft6O
	5UzlWbu31+/J47LZGzGpxV2JpTgj0VCLuag4EQB4HgprUgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42LZdlhJXtezcWm6weY+S4uJPQYWc9avYbPY
	eOYTq8X1b28YLVZ2N7NZbJ5TbHF51xw2i3tr/rNatH3+BySWbGSymLhG1GJ2Yx+jA4/Hzll3
	2T0WbCr12LSqk81j06dJ7B5db68weZyY8ZvF48mV6UweCxumMnv0bVnF6HFmwRF2j8+b5AK4
	o7hsUlJzMstSi/TtErgylr7bwlxwwqBif0sfawPjfNUuRk4OCQETif+vfrGC2EICuxklpk42
	hIhLSsz6fJIJwhaWuN9yBKiGC6jmMaPEzGWXmEESLAIqEv82PWEEsdkE1CVObFkGZosAxR9t
	OArWwCzQzCxxcPsisISwgJ/EnIPfwWxeAV2J/5OvMUJsPsgo8eGGNURcUOLkzCcsIDazgJbE
	jX8vga7gALKlJZb/4wAxOQWsJY7+0JvAKDALScMsJA2zEBoWMDKvYpRMLSjOTc8tNiwwzEst
	1ytOzC0uzUvXS87P3cQIjictzR2M21d90DvEyMTBeIhRgoNZSYR3ypol6UK8KYmVValF+fFF
	pTmpxYcYpTlYlMR5xV/0pggJpCeWpGanphakFsFkmTg4pRqYir684VMw2qX1Jv/06osZ//JO
	9qZECzm3f27vTi8z6ww0PMhUPrPiyHTxlesd+2u2zdjMxHChndPQi/+ZnTzj9Z7Ny2PybZdf
	36ud1Gmkv0IyW2Jt5aYnW16EXMjY8/xrj+emOvfO2Kc2JjnMlvuXnn4VKePDk7G5aU1VhGrN
	iktKa4IlNH/tfbK2krd40oKYHF6Of7Gup/4LOE7/7Bz1iqdjvce8Y7J/XQUCZX72mHYZ3Zpy
	+/zh5bOZnXfGNHnpbhGKusLCN6P24P3HNeVf3U4H3L+4gi1FdjLbqifGmiLOws8VxeMmBb3X
	i3t/On6+64cLL29s//5Qf4KOdqL9g+SZ8815A6pKuGNMyhSVWIozEg21mIuKEwEdTxIiFgMA
	AA==
X-CMS-MailID: 20250207034306epcas2p1e0fe6fc78b01fe7b3a55d19f1aaf24db
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----RdGIdtKpq9gE1V3j7PuPL63Cok.9YsQMFtrTWahmlx-pp0Iy=_7fe54_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250205004552epcas2p43c15afa1e9c3e290693bc4921d46b6f5
References: <CGME20250205004552epcas2p43c15afa1e9c3e290693bc4921d46b6f5@epcas2p4.samsung.com>
	<20250205004424.1214826-1-hyesoo.yu@samsung.com>
	<0d4360b1-0010-45b4-a6d9-94941be89107@suse.cz>

------RdGIdtKpq9gE1V3j7PuPL63Cok.9YsQMFtrTWahmlx-pp0Iy=_7fe54_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 06, 2025 at 03:08:48PM +0100, Vlastimil Babka wrote:
> On 2/5/25 01:44, Hyesoo Yu wrote:
> > Previously, the restore occured after printing the object in slub.
> > After commit 47d911b02cbe ("slab: make check_object() more consistent"),
> > the bytes are printed after the restore. This information about the bytes
> > before the restore is highly valuable for debugging purpose.
> > For instance, in a event of cache issue, it displays byte patterns
> > by breaking them down into 64-bytes units. Without this information,
> > we can only speculate on how it was broken. Hence the corrupted regions
> > should be printed prior to the restoration process. However if an object breaks
> > in multiple places, the same log may be output multiple times.
> > Therefore the slub log is reported only once to prevent redundant printing,
> > by sending a parameter indicating whether an error has occurred previously.
> > 
> > Changes in v2:
> > - Instead of using print_section every time on check_bytes_and_report,
> > just print it once for the entire slub object before the restore.
> > 
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > ---
> >  mm/slub.c | 25 ++++++++++++-------------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index ea956cb4b8be..7a9f7a2c17d7 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -1182,7 +1182,7 @@ static void restore_bytes(struct kmem_cache *s, char *message, u8 data,
> >  static pad_check_attributes int
> >  check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
> >  		       u8 *object, char *what,
> > -		       u8 *start, unsigned int value, unsigned int bytes)
> > +		       u8 *start, unsigned int value, unsigned int bytes, int slab_obj_print)
> 
> It would be better to redistribute the arguments among lines to fit each <80
> chars. The previous line is underutilized. Also could the new argument be bool?
>

I used interger to make the types match, but it does seem like using a boolean would be more
readable. I will change it to a boolean and modify it to pass !!ret from check_objects().

> >  {
> >  	u8 *fault;
> >  	u8 *end;
> > @@ -1205,6 +1205,10 @@ check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
> >  	pr_err("0x%p-0x%p @offset=%tu. First byte 0x%x instead of 0x%x\n",
> >  					fault, end - 1, fault - addr,
> >  					fault[0], value);
> 
> Hm we have slab_bug() above this, not slab_err(). So this is another place
> that would need to take care a WARN is called with your other patch.
> 
> > +	if (slab_obj_print) {
> > +		print_trailer(s, slab, object);
> > +		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> 
> I guess we could do the WARN here. If panic_on_warn is enabled it will not
> report all problems that check_object() could find and panic on the first
> one. But that would have happened too with your slab_fix() approach
> (slab_fix() called from restore_bytes() below). I think we can live with
> that instead of needing two separate reporting and fixing rounds from
> check_object().
> 
> Could you send the two patches as a series in v3, as they are
> inter-dependent? Thanks.
> 

I guess we can call object_err() here. That would include the WARN() from other
patch. I will send the two pathces as a series in v3.

Thanks,
Regards.

> > +	}
> >  
> >  skip_bug_print:
> >  	restore_bytes(s, what, value, fault, end);
> > @@ -1268,7 +1272,7 @@ static int check_pad_bytes(struct kmem_cache *s, struct slab *slab, u8 *p)
> >  		return 1;
> >  
> >  	return check_bytes_and_report(s, slab, p, "Object padding",
> > -			p + off, POISON_INUSE, size_from_object(s) - off);
> > +			p + off, POISON_INUSE, size_from_object(s) - off, 1);
> >  }
> >  
> >  /* Check the pad bytes at the end of a slab page */
> > @@ -1318,11 +1322,11 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
> >  
> >  	if (s->flags & SLAB_RED_ZONE) {
> >  		if (!check_bytes_and_report(s, slab, object, "Left Redzone",
> > -			object - s->red_left_pad, val, s->red_left_pad))
> > +			object - s->red_left_pad, val, s->red_left_pad, ret))
> >  			ret = 0;
> >  
> >  		if (!check_bytes_and_report(s, slab, object, "Right Redzone",
> > -			endobject, val, s->inuse - s->object_size))
> > +			endobject, val, s->inuse - s->object_size, ret))
> >  			ret = 0;
> >  
> >  		if (slub_debug_orig_size(s) && val == SLUB_RED_ACTIVE) {
> > @@ -1331,7 +1335,7 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
> >  			if (s->object_size > orig_size  &&
> >  				!check_bytes_and_report(s, slab, object,
> >  					"kmalloc Redzone", p + orig_size,
> > -					val, s->object_size - orig_size)) {
> > +					val, s->object_size - orig_size, ret)) {
> >  				ret = 0;
> >  			}
> >  		}
> > @@ -1339,7 +1343,7 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
> >  		if ((s->flags & SLAB_POISON) && s->object_size < s->inuse) {
> >  			if (!check_bytes_and_report(s, slab, p, "Alignment padding",
> >  				endobject, POISON_INUSE,
> > -				s->inuse - s->object_size))
> > +				s->inuse - s->object_size, ret))
> >  				ret = 0;
> >  		}
> >  	}
> > @@ -1355,11 +1359,11 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
> >  			if (kasan_meta_size < s->object_size - 1 &&
> >  			    !check_bytes_and_report(s, slab, p, "Poison",
> >  					p + kasan_meta_size, POISON_FREE,
> > -					s->object_size - kasan_meta_size - 1))
> > +					s->object_size - kasan_meta_size - 1, ret))
> >  				ret = 0;
> >  			if (kasan_meta_size < s->object_size &&
> >  			    !check_bytes_and_report(s, slab, p, "End Poison",
> > -					p + s->object_size - 1, POISON_END, 1))
> > +					p + s->object_size - 1, POISON_END, 1, ret))
> >  				ret = 0;
> >  		}
> >  		/*
> > @@ -1385,11 +1389,6 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
> >  		ret = 0;
> >  	}
> >  
> > -	if (!ret && !slab_in_kunit_test()) {
> > -		print_trailer(s, slab, object);
> > -		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> > -	}
> > -
> >  	return ret;
> >  }
> >  
> 
> 

------RdGIdtKpq9gE1V3j7PuPL63Cok.9YsQMFtrTWahmlx-pp0Iy=_7fe54_
Content-Type: text/plain; charset="utf-8"


------RdGIdtKpq9gE1V3j7PuPL63Cok.9YsQMFtrTWahmlx-pp0Iy=_7fe54_--
