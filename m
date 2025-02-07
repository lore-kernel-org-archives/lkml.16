Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39F217E45B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738899007; cv=none; b=jIC/UWNRczf1mk3WzxEFn5DXfC1fdu3JuYkHAysTjUJze9Stjd2syGOOwsvK2BbLj6rgvIv4MW0JRYwUEdBADllWXqCLqYVp0exfNP2nEeicZot2CSf1bSYc6nQHj8vmtY4kt1XFQXxel8tZrpEH7yPhYzsnWchpfXYtOO9zqG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738899007; c=relaxed/simple;
	bh=3X9lLSf+EQeagJctO8PdFO/I83npZFhPUkWVITjpciI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=fcjE0OX10FXAGpH8RqGPdcYBoDeKAnPwMwfUn/UqHMiw/aNNYSfncOg3CFNCy05E1zsC27l65ohkaMUr/eQwqwHSd8xqVdKOks3YZdKyYI6mNstEfPBG93KG5X1U867DfAGuwprVkfN+1B9boBO6hHeJTx5+olplJgLd0pvN5ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rpprSy7Z; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rpprSy7Z"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250207032956epoutp01466917efabd1b15578f8124ef7e1def0~hz2yozxcz0355903559epoutp01Q
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:29:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250207032956epoutp01466917efabd1b15578f8124ef7e1def0~hz2yozxcz0355903559epoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738898996;
	bh=ATcz+ZHVWAtcKNeqL14A7T6/Rmj/oxzQcgh/790a5WY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rpprSy7ZccGhcBNz+OQnKI2UqyGKvKh3TTj7Ji07oVsIM5IOQ63lSxhvzXUOgy2xc
	 oxuUkY0zaDfDIyqvBlOu7gIcPUk4ORkRstpgzW0fTdeuFA3y2UlyDgMlBRm7Dlp3Ds
	 jqj//ssCwk42tYhYK/dsksKH0hROEcRbiYpQsHIg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20250207032956epcas2p4da37904da0b170baf913ce582902fcdb~hz2yJhlkZ0990509905epcas2p44;
	Fri,  7 Feb 2025 03:29:56 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.89]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YpzxH4YvLz4x9Pw; Fri,  7 Feb
	2025 03:29:55 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F4.4F.23368.33E75A76; Fri,  7 Feb 2025 12:29:55 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250207032954epcas2p4ec817ab6713cf7236987f16df6043637~hz2w9n4kV0990509905epcas2p4z;
	Fri,  7 Feb 2025 03:29:54 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250207032954epsmtrp1099eefd7ea6d4470140762d4784e018a~hz2w83Vhd0604006040epsmtrp1J;
	Fri,  7 Feb 2025 03:29:54 +0000 (GMT)
X-AuditID: b6c32a45-dc9f070000005b48-32-67a57e33fb22
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	79.DB.23488.23E75A76; Fri,  7 Feb 2025 12:29:54 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250207032954epsmtip2f3e88a6a4faa296d8e957a094cd62a28~hz2wwfKCQ0457804578epsmtip2D;
	Fri,  7 Feb 2025 03:29:54 +0000 (GMT)
Date: Fri, 7 Feb 2025 12:28:30 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: janghyuck.kim@samsung.com, Christoph Lameter <cl@linux.com>, Pekka
	Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo
	Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo
	<42.hyeyoo@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: slub: call WARN() instead of pr_err on slab_fix.
Message-ID: <20250207032828.GA491394@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <47de9f52-e66a-4ecd-b561-6b97d2eab671@suse.cz>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmqa5x3dJ0g+3zFS0m9hhYzFm/hs3i
	+rc3jBYru5vZLDbPKba4vGsOm8W9Nf9ZLdo+/wMSSzYyWUxcI2oxu7GP0YHbY+esu+weCzaV
	emxa1cnmsenTJHaPrrdXmDxOzPjN4vHkynQmj4UNU5k9+rasYvQ4s+AIu8fnTXIB3FHZNhmp
	iSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlARysplCXmlAKF
	AhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjOe3LrJ
	VPBQu+JH0zHGBsbzil2MnBwSAiYSP7ZsZe1i5OIQEtjBKLHp+xUo5xOjxKtH19ghnG+MEtMn
	3mKBabk07zIzRGIvo8S3/tdQzlNGicOTf7ODVLEIqEjMm7eJFcRmE1CXOLFlGSOILQIUf7Th
	KNgOZoHHTBIvHs9nBkkIC/hILLxwFGwFr4CuxNKbC5ggbEGJkzOfgMU5BawlGlb1gt0kIbCF
	Q+LdvkVMEDe5SGw+vwrqPmGJV8e3sEPYUhIv+9ug7GKJbYsPM0E0NzBKbO64zwyRMJaY9awd
	7DxmgQyJtm9bgAZxAMWVJY5A/MwswCfRcfgvO0SYV6KjTQiiU1li/7J5UGslJR6tbWeFsD0k
	jsz+xgYJlYOMEvcfzmOfwCg3C8k/s5Bsg7B1JBbs/sQ2C2gFs4C0xPJ/HBCmpsT6XfoLGFlX
	MYqlFhTnpqcWGxUYwuM4OT93EyM4GWu57mCc/PaD3iFGJg7GQ4wSHMxKIrxT1ixJF+JNSays
	Si3Kjy8qzUktPsRoCoydicxSosn5wHyQVxJvaGJpYGJmZmhuZGpgriTOW72jJV1IID2xJDU7
	NbUgtQimj4mDU6qBqTu8Sogtsjzruf2fBatlHr/+JiDmG/CF/e23lfEMoevqfty4zvpHY4O5
	wpN/8W/nR8bem3JJ+eSldPtF7+Z/McyIjdlwIHp2/Gbb6epeYfPc6+1YjB8lTXzdEJ5/aPVG
	jpDKuWfO/RX5FTN1ntLO7P2nnmXfS63OZxVfrpz3v3rLsewkg8DMbDuxmdy91WH/bEp0LRoX
	KPFZvK49rtH+L8qr/W5Qw613f2S3uqbP0f++O27/isuL9gganfIJKzvTnXDl6/4NH38y1d73
	55ydGun46Wav0eF3L0I9p6xyDmutMWC4Fe71WWPC1H+P+ic3MyxUvc/zyzonY++/XXpaS3wD
	lGbOYDk6k4e74MalR0osxRmJhlrMRcWJAPeiJWpPBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJXteobmm6weU9xhYTewws5qxfw2Zx
	/dsbRouV3c1sFpvnFFtc3jWHzeLemv+sFm2f/wGJJRuZLCauEbWY3djH6MDtsXPWXXaPBZtK
	PTat6mTz2PRpErtH19srTB4nZvxm8XhyZTqTx8KGqcwefVtWMXqcWXCE3ePzJrkA7igum5TU
	nMyy1CJ9uwSujJ7dF9gKFmpWPLx2gL2BcYV8FyMnh4SAicSleZeZuxi5OIQEdjNKzJh3iQUi
	ISkx6/NJJghbWOJ+yxFWiKLHjBI7V99kB0mwCKhIzJu3iRXEZhNQlzixZRkjiC0CFH+04ShY
	A7PASyaJ03sWM4MkhAV8JBZeOAq2gVdAV2LpzQVMEFMPMkp8vbKICSIhKHFy5hOwImYBLYkb
	/14CxTmAbGmJ5f84QMKcAtYSDat62ScwCsxC0jELSccshI4FjMyrGCVTC4pz03OTDQsM81LL
	9YoTc4tL89L1kvNzNzGCY0lLYwfju29N+ocYmTgYDzFKcDArifBOWbMkXYg3JbGyKrUoP76o
	NCe1+BCjNAeLkjjvSsOIdCGB9MSS1OzU1ILUIpgsEwenVAOTvGGL5ANfhl+Hau5cbQm8wbhA
	7giH6fQULV/789Mcb0hVV9v8F3m4IVX794np9XtncpSdEBJ0ucfasaz05OfAd29KuY8f/1Hh
	aGo5Wzv86+WNijMEv9c/WPnPKfjxXOVMaXc5t9ucmueU8+Rjw7dKNEtsmvD6xrngvyHJT38d
	CvYVUOqe3Ns+W+V6uU/TEub8/SW5u1RylT7ufrXGVXDBP2mJK98C/nAovi+9HKV4ZrrVO5/T
	nw3Xdrk8+lsU8tpC06mtq421P9/uI4eL9tLfTfPut7N3CjMf0J2wh8F7wZ+CYwvnqtt+1MoW
	D9CcPCHONbEjfLaMZ97JO3ecEjYvMU82rAy++Wfth3NJj6cosRRnJBpqMRcVJwIAjkYMKBQD
	AAA=
X-CMS-MailID: 20250207032954epcas2p4ec817ab6713cf7236987f16df6043637
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----7MjMDun-wBTKD0aJGk8MrTq1WBha5gge0B_F3lDBYtizvuhb=_7fa5b_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64
References: <CGME20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64@epcas2p3.samsung.com>
	<20250205004615.1253389-1-hyesoo.yu@samsung.com>
	<47de9f52-e66a-4ecd-b561-6b97d2eab671@suse.cz>

------7MjMDun-wBTKD0aJGk8MrTq1WBha5gge0B_F3lDBYtizvuhb=_7fa5b_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 06, 2025 at 12:35:22PM +0100, Vlastimil Babka wrote:
> On 2/5/25 01:46, Hyesoo Yu wrote:
> > If a slab object is corrupted or an error occurs in its internal
> > value, continuing after restoration may cause other side effects.
> > At this point, it is difficult to debug because the problem occurred
> > in the past. It is better to use WARN() instead of pr_err to catch
> > errors at the point of issue because WARN() could trigger panic for
> > system debugging when panic_on_warn is enabled. WARN() should be
> > called prior to fixing the value because when a panic is triggered by WARN(),
> > it allows us to check corrupted data.
> > 
> > Changes in v2:
> > - Replace direct calling with BUG_ON with the use of WARN in slab_fix.
> > 
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> Hi and thanks for the patch,
> 
> I wonder if it would be better not to change slab_fix() but rather
> slab_err() and object_err(). It wouldn't then require to rearrange the fixup
> code. Also I think some error reporting paths don't go through slab_fix()
> and we still would like them to become a WARN too.
> 
> Basically it would mean the last line in slab_err() would be a WARN and we'd
> drop the dump_stack() as that's redundant. Same in object_err() (no
> dump_stack() there). It would be a bit noisier as a result, but hopefully
> acceptable. The slab specific debugging info would still be printed before
> the WARN hits (and potentially results in a panic) so anyone investigating
> the crash dump would have that information.
> 
> Hm but I see some places print stuff after slab_err(). slab_pad_check() and
> list_slab_objects(). We could create slab_err_start() and slab_err_end() for
> those, and slab_err() would just call both at once.
> 

Thank you so much for your review.

That's a great suggestion. Following your suggestion, it seems possible to use
WARN on all error reporting paths. For some places print stuff after slab_err,
print them as follows,

+static void __slab_err(struct slab *slab)
+{
+       print_slab_info(slab);
+       add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
+
+       WARN_ON(1);
+}
+
 static __printf(3, 4) void slab_err(struct kmem_cache *s, struct slab *slab,
                        const char *fmt, ...)
 {
        vsnprintf(buf, sizeof(buf), fmt, args);
        va_end(args);
        slab_bug(s, "%s", buf);
-       print_slab_info(slab);
-       dump_stack();
-       add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
+       __slab_err(slab);
 }

@@ -1316,11 +1322,13 @@ slab_pad_check(struct kmem_cache *s, struct slab *slab)
        while (end > fault && end[-1] == POISON_INUSE)
                end--;

-       slab_err(s, slab, "Padding overwritten. 0x%p-0x%p @offset=%tu",
-                       fault, end - 1, fault - start);
+       slab_bug(s, "Padding overwritten. 0x%p-0x%p @offset=%tu",
+                fault, end - 1, fault - start);
        print_section(KERN_ERR, "Padding ", pad, remainder);

        restore_bytes(s, "slab padding", POISON_INUSE, fault, end);
+
+       __slab_err(slab);
 }

> > ---
> >  mm/slub.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 1f50129dcfb3..ea956cb4b8be 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -1043,7 +1043,7 @@ static void slab_fix(struct kmem_cache *s, char *fmt, ...)
> >  	va_start(args, fmt);
> >  	vaf.fmt = fmt;
> >  	vaf.va = &args;
> > -	pr_err("FIX %s: %pV\n", s->name, &vaf);
> > +	WARN(1, "FIX %s: %pV\n", s->name, &vaf);
> >  	va_end(args);
> >  }
> >  
> > @@ -1106,8 +1106,8 @@ static bool freelist_corrupted(struct kmem_cache *s, struct slab *slab,
> >  	if ((s->flags & SLAB_CONSISTENCY_CHECKS) &&
> >  	    !check_valid_pointer(s, slab, nextfree) && freelist) {
> >  		object_err(s, slab, *freelist, "Freechain corrupt");
> > -		*freelist = NULL;
> >  		slab_fix(s, "Isolate corrupted freechain");
> > +		*freelist = NULL;
> >  		return true;
> >  	}
> >  
> > @@ -1445,9 +1445,9 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> >  				set_freepointer(s, object, NULL);
> >  			} else {
> >  				slab_err(s, slab, "Freepointer corrupt");
> > +				slab_fix(s, "Freelist cleared");
> >  				slab->freelist = NULL;
> >  				slab->inuse = slab->objects;
> > -				slab_fix(s, "Freelist cleared");
> >  				return 0;
> >  			}
> >  			break;
> > @@ -1464,14 +1464,14 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> >  	if (slab->objects != max_objects) {
> >  		slab_err(s, slab, "Wrong number of objects. Found %d but should be %d",
> >  			 slab->objects, max_objects);
> > -		slab->objects = max_objects;
> >  		slab_fix(s, "Number of objects adjusted");
> > +		slab->objects = max_objects;
> >  	}
> >  	if (slab->inuse != slab->objects - nr) {
> >  		slab_err(s, slab, "Wrong object count. Counter is %d but counted were %d",
> >  			 slab->inuse, slab->objects - nr);
> > -		slab->inuse = slab->objects - nr;
> >  		slab_fix(s, "Object count adjusted");
> > +		slab->inuse = slab->objects - nr;
> >  	}
> >  	return search == NULL;
> >  }
> 
> 

------7MjMDun-wBTKD0aJGk8MrTq1WBha5gge0B_F3lDBYtizvuhb=_7fa5b_
Content-Type: text/plain; charset="utf-8"


------7MjMDun-wBTKD0aJGk8MrTq1WBha5gge0B_F3lDBYtizvuhb=_7fa5b_--
