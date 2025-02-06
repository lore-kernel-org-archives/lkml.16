Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B9224AF5
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738822598; cv=none; b=GndOGan1/sUNLBbryU5h8/ws13nejVjYJDw0Ea3GGbitC1ZKlUkZxDqpO4/x0gcQX4Zhx0i3R8x3T2quHVFQfOlSgAp9od9uCycwJeQei3NC/5AiRBrnU+T4FGXQhqerHfU6a8T+HbKGmt0mFvOiuXZDL+wk2MvO2R/RKYlfo18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738822598; c=relaxed/simple;
	bh=D8lh2a9QdMZHjAa84YB3L9Aq5PJ8ae/7n/LmY64lLdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=djv97RzYYF9v20Z5DD7GbMOl7HaI9Yb/izoxSNjf2/6lilbXBWW9J+QN//enbF71BUXXMSAoPVk6iaN9czwjBiaIEh9xCwHoSfosvMnLVoKVYDejvzPVh4rCF7nTi4YCOU57sRrT92UK+BzAIUCBDB1wIH/UZEBWS7j0pfYfC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dZoCwMe6; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dZoCwMe6"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250206061633epoutp013c9b43f8863cd647d03d94c1b17df126~hie_ciOa31338613386epoutp01h
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:16:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250206061633epoutp013c9b43f8863cd647d03d94c1b17df126~hie_ciOa31338613386epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738822593;
	bh=lUQRKphIXsRlRGRDnP29bNeqxe268vglOzFFOe0i2l8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dZoCwMe65U+jL6Ws+uQeVEkyyTGNDAFSjW+mukjHL7AsM9NW8zDsIh3d2oPRjz4+e
	 Zpj+LrXRWyJ9br5AmGkzD8VoKAoBZD9llYh0dQ69DTEuAPV9iHOGsQuswE3r4UKZLQ
	 KkB4buVnyLEnlCFAOOgGXule5TdPdZ7MRO6UZo98=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20250206061632epcas2p3f9d638732af9d0cd1ae8cc00294b19aa~hie98VOEH2622526225epcas2p3Z;
	Thu,  6 Feb 2025 06:16:32 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.89]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YpRh01yd1z4x9Pv; Thu,  6 Feb
	2025 06:16:32 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	2D.29.22094.0C354A76; Thu,  6 Feb 2025 15:16:32 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250206061631epcas2p383094015f4573d421e55a316b0d539e5~hie9Enfxj2216622166epcas2p3F;
	Thu,  6 Feb 2025 06:16:31 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250206061631epsmtrp2f38c96dd37e91182a7885add8595f77b~hie9Dy78n1197211972epsmtrp2N;
	Thu,  6 Feb 2025 06:16:31 +0000 (GMT)
X-AuditID: b6c32a46-484397000000564e-9a-67a453c0c6a3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	21.2C.18949.FB354A76; Thu,  6 Feb 2025 15:16:31 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250206061631epsmtip2348131d1e81d60128a99629488ffa370~hie85ztbz0702007020epsmtip2y;
	Thu,  6 Feb 2025 06:16:31 +0000 (GMT)
Date: Thu, 6 Feb 2025 15:15:07 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: David Rientjes <rientjes@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, janghyuck.kim@samsung.com, Christoph
	Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim
	<iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, Roman
	Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: slub: call WARN() instead of pr_err on slab_fix.
Message-ID: <20250206061507.GA3959749@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6c45ced8-3a01-0905-0d2c-f0e7b7acc2df@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmqe6B4CXpBkdv8lhM7DGwmLN+DZvF
	9W9vGC1WdjezWWyeU2xxedccNot7a/6zWrR9/gcklmxkspi4RtRidmMfowO3x85Zd9k9Fmwq
	9di0qpPNY9OnSeweXW+vMHmcmPGbxePJlelMHgsbpjJ79G1ZxehxZsERdo/Pm+QCuKOybTJS
	E1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOAjlZSKEvMKQUK
	BSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGfsP7KH
	rWCPesXTbReYGhiXynUxcnJICJhITH58hqWLkYtDSGAHo8T7U6/ZIJxPjBLn761hh3C+MUqc
	nvONBaZl695drBCJvYwSbzYeYIRwnjJKXLn0nBGkikVARWLp/V+sIDabgLrEiS3LwOIiAhoS
	bTP+g+1gFrjPJPGx9RwTSEJYwEdi4YWjYCt4BfQkFlxZAWULSpyc+QTM5hSwk/h+pQlsm4TA
	Wg6J9n2LGSFucpHY9OoIlC0s8er4FnYIW0ri87u9bBB2scS2xYeZIJobGCU2d9xnhkgYS8x6
	1g7WzCyQITFhTSvQNg6guLLEkVssEGE+iY7Df9khwrwSHW1CEJ3KEvuXzYMGi6TEo7XtrBC2
	h8SR2d+gAbmSSeLLofnMExjlZiH5ZxaSbRC2jsSC3Z/YZgGtYBaQllj+jwPC1JRYv0t/ASPr
	Kkax1ILi3PTUYqMCI3gcJ+fnbmIEJ2Mttx2MU95+0DvEyMTBeIhRgoNZSYT39PYF6UK8KYmV
	ValF+fFFpTmpxYcYTYGxM5FZSjQ5H5gP8kriDU0sDUzMzAzNjUwNzJXEeat3tKQLCaQnlqRm
	p6YWpBbB9DFxcEo1MJV+kN90xu+2cPrmgvv7zqoFPfo0Yeb9Yxc6iife1arwcXw8+81SXvWn
	N48bu1QkmU6NTZAr5P2r4d0zLzLt3jVBWS23/vuFTKyVr5Xc7u37XGE76fTk+7t9xVo71Ncn
	7ja9vOHiljscOsXmWrv77lxqSFV+ln1evTrmbpn84j0zimz7TCeuOhe28LHftYpPvn+vXd2W
	2/hbeNU7jreV1pvqW6O4TX4p+4pfd0r595Jfjz2Nf5Jww/7aZb+jNvJcX63mbJka0ybUu0xu
	i3vWp0BHm7S088Ls2750XwqbxycnnSB06uu7jrv/J3P78Lln7a2ubyzPm7G5g4nt7Da9R3GK
	ehEG8o0Cj56pNG3lV2Ipzkg01GIuKk4EABHwKU5PBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvO7+4CXpBqsbjCwm9hhYzFm/hs3i
	+rc3jBYru5vZLDbPKba4vGsOm8W9Nf9ZLdo+/wMSSzYyWUxcI2oxu7GP0YHbY+esu+weCzaV
	emxa1cnmsenTJHaPrrdXmDxOzPjN4vHkynQmj4UNU5k9+rasYvQ4s+AIu8fnTXIB3FFcNimp
	OZllqUX6dglcGR9mb2Ap+KNScXTfZOYGxn/SXYycHBICJhJb9+5iBbGFBHYzSpw+7AQRl5SY
	9fkkE4QtLHG/5QhQDRdQzWNGiXXXnjODJFgEVCSW3v8F1swmoC5xYssyRhBbREBDom3GfzYQ
	m1ngMZNE58skEFtYwEdi4YWjLCA2r4CexIIrK1gghq5kkjh4uAUqIShxcuYTFohmLYkb/14C
	XcEBZEtLLP/HARLmFLCT+H6liXECo8AsJB2zkHTMQuhYwMi8ilEytaA4Nz232LDAKC+1XK84
	Mbe4NC9dLzk/dxMjOI60tHYw7ln1Qe8QIxMH4yFGCQ5mJRHe09sXpAvxpiRWVqUW5ccXleak
	Fh9ilOZgURLn/fa6N0VIID2xJDU7NbUgtQgmy8TBKdXAlKw6Z5HSNB4dP82F+/LEZioeP+J2
	/n98paNOToH+mltfa9gyZsusvnjKMFbyZJx7SFX/8q8dbFyPd3gKz7rhoS3O8SunkPXkwT+X
	S/gLnv494hXu+9DuwY4n6osvLWa9L7Z8Qn41q4cs98fvAQLLWy5YL2b0WnbtldScTbzpgVt0
	v5m7V29k2s5lvHZxwX+ONK5DExex/w3KCvlnF7BpnqPodMZ9OX6f4lYby5Z5GTb9+1F6sCj9
	DU/Zp7LyP6xGXlya2hJn1FM0vNrlNM2TPZvc/29JfCFh+K1kp29y4qJr0hwvPrb7Sl/Ykt/I
	rsZx79GMcr8Zj+4zhnw8v+vROp09bRpJ5S8TH0/N/FyixFKckWioxVxUnAgAHysm8hIDAAA=
X-CMS-MailID: 20250206061631epcas2p383094015f4573d421e55a316b0d539e5
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----7MjMDun-wBTKD0aJGk8MrTq1WBha5gge0B_F3lDBYtizvuhb=_74bdb_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64
References: <CGME20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64@epcas2p3.samsung.com>
	<20250205004615.1253389-1-hyesoo.yu@samsung.com>
	<55522d9a-7fd2-1df0-19df-1552644b009e@google.com>
	<135f5cf7-6853-4715-bd7f-41c7f554ec31@suse.cz>
	<6c45ced8-3a01-0905-0d2c-f0e7b7acc2df@google.com>

------7MjMDun-wBTKD0aJGk8MrTq1WBha5gge0B_F3lDBYtizvuhb=_74bdb_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 05, 2025 at 06:57:14PM -0800, David Rientjes wrote:
> On Wed, 5 Feb 2025, Vlastimil Babka wrote:
> 
> > On 2/5/25 18:10, David Rientjes wrote:
> > > On Wed, 5 Feb 2025, Hyesoo Yu wrote:
> > > 
> > >> If a slab object is corrupted or an error occurs in its internal
> > >> value, continuing after restoration may cause other side effects.
> > >> At this point, it is difficult to debug because the problem occurred
> > >> in the past. It is better to use WARN() instead of pr_err to catch
> > >> errors at the point of issue because WARN() could trigger panic for
> > >> system debugging when panic_on_warn is enabled. WARN() should be
> > >> called prior to fixing the value because when a panic is triggered by WARN(),
> > >> it allows us to check corrupted data.
> > >> 
> > > 
> > > I think this makes sense, but it doesn't document why the other changes 
> > > are being made, like moving the setting of *freelist to NULL.  This is 
> > > presumably something that you want in the crash dump when 
> > > kernel.panic_on_warn is enabled.  Probably best to call that out, but to 
> > > also indicate what you're relying on in the crash dump to make forward 
> > > progress on in diagnosing the issue.
> > 
> > Well the last sentence of the changelog above says exactly that, no?
> > 
> 
> Sorry, I should have been more clear.  It's unclear in the code why 
> choosing WARN() here is helpful given the stack would be known.  It makes 
> sense to enable kernel.panic_on_warn this way for debugging purposes, but 
> thought it should also carry a comment in the code on the rationale (and 
> the state we're trying to capture in a crash dump) so a future change 
> doesn't go and unravel this for us again.
>

What do you think of this comment ? I will add it in patch v3.

/*
 * slab_fix indicates that the value would be restored even if an error occurs.
 * Or, it is possible to trigger a panic without restoring using WARN() if panic_on_warn
 * is enabled. This can obtain a crash dump at the point of issue to debug.
 * It is advisable not to restore the data before calling slab_fix() to check for corrupted
 * data in the crash dump.
 */

Thanks,
Regards.

> > >> Changes in v2:
> > >> - Replace direct calling with BUG_ON with the use of WARN in slab_fix.
> > >> 
> > >> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > >> ---
> > >>  mm/slub.c | 10 +++++-----
> > >>  1 file changed, 5 insertions(+), 5 deletions(-)
> > >> 
> > >> diff --git a/mm/slub.c b/mm/slub.c
> > >> index 1f50129dcfb3..ea956cb4b8be 100644
> > >> --- a/mm/slub.c
> > >> +++ b/mm/slub.c
> > >> @@ -1043,7 +1043,7 @@ static void slab_fix(struct kmem_cache *s, char *fmt, ...)
> > >>  	va_start(args, fmt);
> > >>  	vaf.fmt = fmt;
> > >>  	vaf.va = &args;
> > >> -	pr_err("FIX %s: %pV\n", s->name, &vaf);
> > >> +	WARN(1, "FIX %s: %pV\n", s->name, &vaf);
> > >>  	va_end(args);
> > >>  }
> > >>  
> > >> @@ -1106,8 +1106,8 @@ static bool freelist_corrupted(struct kmem_cache *s, struct slab *slab,
> > >>  	if ((s->flags & SLAB_CONSISTENCY_CHECKS) &&
> > >>  	    !check_valid_pointer(s, slab, nextfree) && freelist) {
> > >>  		object_err(s, slab, *freelist, "Freechain corrupt");
> > >> -		*freelist = NULL;
> > >>  		slab_fix(s, "Isolate corrupted freechain");
> > >> +		*freelist = NULL;
> > >>  		return true;
> > >>  	}
> > >>  
> > >> @@ -1445,9 +1445,9 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> > >>  				set_freepointer(s, object, NULL);
> > >>  			} else {
> > >>  				slab_err(s, slab, "Freepointer corrupt");
> > >> +				slab_fix(s, "Freelist cleared");
> > >>  				slab->freelist = NULL;
> > >>  				slab->inuse = slab->objects;
> > >> -				slab_fix(s, "Freelist cleared");
> > >>  				return 0;
> > >>  			}
> > >>  			break;
> > >> @@ -1464,14 +1464,14 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> > >>  	if (slab->objects != max_objects) {
> > >>  		slab_err(s, slab, "Wrong number of objects. Found %d but should be %d",
> > >>  			 slab->objects, max_objects);
> > >> -		slab->objects = max_objects;
> > >>  		slab_fix(s, "Number of objects adjusted");
> > >> +		slab->objects = max_objects;
> > >>  	}
> > >>  	if (slab->inuse != slab->objects - nr) {
> > >>  		slab_err(s, slab, "Wrong object count. Counter is %d but counted were %d",
> > >>  			 slab->inuse, slab->objects - nr);
> > >> -		slab->inuse = slab->objects - nr;
> > >>  		slab_fix(s, "Object count adjusted");
> > >> +		slab->inuse = slab->objects - nr;
> > >>  	}
> > >>  	return search == NULL;
> > >>  }
> > >> -- 
> > >> 2.48.0
> > >> 
> > >> 
> > 
> > 
> 

------7MjMDun-wBTKD0aJGk8MrTq1WBha5gge0B_F3lDBYtizvuhb=_74bdb_
Content-Type: text/plain; charset="utf-8"


------7MjMDun-wBTKD0aJGk8MrTq1WBha5gge0B_F3lDBYtizvuhb=_74bdb_--
