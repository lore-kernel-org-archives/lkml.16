Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2013E191484
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864777; cv=none; b=lHiFtnKRW1DKoTko5DxtyLKy5TJSeEAJ2sy7iQUtjOLTcRlhdn3EK7IhEX2i9o4EknF3eMI1LkoUKXHcV5tE52z2jbCBQAgpZEYsPKlDa9Jt4FaatKCsHL1o500aSrFZkduo9uunsh7qYZgZkGjS/CE1s8I9Gu4A11iwuN0gG4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864777; c=relaxed/simple;
	bh=gOZswUr/0gfMN403bqGB4SBkX8CcVO2kW55GfZrG6XI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ko+L4GTkW77ztu/OcBeEXBQM9c2fo7trVTSTn8SIJeC3K4zOlYDDMNYseM8Wb2Sd/fNi2Lty34PWF+OpAVhRwMBAVH9swSsdmTB7ZaGSSHvmw3f1WfY1g2Ej+d6F0eSvAdQDRoOJ+Cedzvdwjxvj1MS6JfXsNQAD4spq+t/iWPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0yPFKoSK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0yPFKoSK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21625b4f978so5625ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738864775; x=1739469575; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WJ8YPkOMUO80cyX2dVP3JLGw5LXCqDVZtBhpVk7cKgA=;
        b=0yPFKoSKFRrExjcXef23WgaLniiQ8DSF+uDSPYUrGg16G9plm+4AaLuat7AHr+1+K3
         WwpZguLcHCSwITFGZbRScoQa5kzfhcMa1X0yCK27NhDLvalKZNoTRCxfnRajpOohaasS
         ozw7+4wl/Hu6Qaop5mode+hp7aJqhhc4d2pxmi7h4OgA6rakXeQTfdQU+nyiP4IUK3nt
         ymoW1mbaYZ1eo3M7XVq16s7OGJ6x4JryWLTAsQDrvHmqoWKsYMJc2PPn6uk++rk8d/j6
         oVuxSRRdawY3a+9Vrf1MqtkngHG0jen1M6Kb/VkxcUNOdvtI7g2xLjHfLTxEadyAU5ux
         B1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864775; x=1739469575;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJ8YPkOMUO80cyX2dVP3JLGw5LXCqDVZtBhpVk7cKgA=;
        b=BzzD7KTXk3cHDyK7ZiRryFuYVjOQSRwCyXDqC3bvRTNeueJ9nsRk22hOrHDQ/aV2e2
         RNsBTn0ExCXzXpgeAPaPnPbHrpRaNKTPkoFhHfmcCEakM+smMKu4AcYmELm5wX8tATZt
         hRKhuwMayf14Hoa6rrfImtmAz7uxZtC9bBvBt07Yqc3pehXxGayok3fO0bQ02Y+YWXlW
         5+dpjk/V/PES0bih0WNOm8RyI8RlIZoDeHI2kOaqqPbZN3VtN7DamIWmfMyo3+7Mci1Y
         GZaJUBL9dnK5uM70GYdaF/cPHYILrOQDQT/LBaZNw83eopBfWXrKBX8Cx4PjBYjPb0gz
         Of7w==
X-Forwarded-Encrypted: i=1; AJvYcCVgjvTzBLle3DdpYN/wXvrFPcXQj3uvVIn61OibA8FuQXKYvPTCIcLKp5bJD+PFNzXm4hFJ9dB5DJBlff8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bh+CRsaScb3vQs+3+9D1y5np2nGZzuIgg+7we6o4+HMAXj3r
	Qv0TYpP6vPqmvh+M1RgYrp7NRRsfLSrMAPXFto9Bk6UziO9yEQ1vthVTZPHAag==
X-Gm-Gg: ASbGnctwK1f0Cv5+6HkIF2F/FjJ7qy3WX642Ovh80yd9JlYgTTG44H4y2+9a9Qh55pA
	Qvl5enSEIxaENu4qKhujyw1kSCRnURcx0cRRbMraaL5L+1g6ktich4ljicvOLv6si4LogrwcSdq
	L92QiVgobE/KTWgJoLQOkjaufUw+IZQ31lnIX8DdwPhJn4/SKJkcArkoB3WdJ/iZujbnkU6FbNA
	IyDf8p4MaGQEpadFWL2nUG4QzJqSmZ28SVUWQekdfzO6aEAwy7LS4IhXHJgs7NFHVHA9A2rXMGX
	wCzXEguh6reloOngGEDCCzGHGxB+U8GsAMClVz++JdQbjZ0ik+LLeX6m5uc5NXLb5CFcIENCgaM
	6KU7z/6qPEA==
X-Google-Smtp-Source: AGHT+IEN/Y0NxcItL47cvZJJoEqFsp2piQSpMBfdLfPIfzK96cWROUKdUK6zxEOm5Ig3xp/wn81yxw==
X-Received: by 2002:a17:902:76c4:b0:216:6ecd:8950 with SMTP id d9443c01a7336-21f4c51c6b2mr388115ad.19.1738864775015;
        Thu, 06 Feb 2025 09:59:35 -0800 (PST)
Received: from [2a00:79e0:2eb0:8:3f6a:24e9:5ba0:72c3] ([2a00:79e0:2eb0:8:3f6a:24e9:5ba0:72c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650cde8sm15999595ad.45.2025.02.06.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:59:34 -0800 (PST)
Date: Thu, 6 Feb 2025 09:59:33 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Hyesoo Yu <hyesoo.yu@samsung.com>
cc: Vlastimil Babka <vbabka@suse.cz>, janghyuck.kim@samsung.com, 
    Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: slub: call WARN() instead of pr_err on
 slab_fix.
In-Reply-To: <20250206061507.GA3959749@tiffany>
Message-ID: <c95fca1d-7905-502b-f6ef-e4c762285160@google.com>
References: <CGME20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64@epcas2p3.samsung.com> <20250205004615.1253389-1-hyesoo.yu@samsung.com> <55522d9a-7fd2-1df0-19df-1552644b009e@google.com> <135f5cf7-6853-4715-bd7f-41c7f554ec31@suse.cz>
 <6c45ced8-3a01-0905-0d2c-f0e7b7acc2df@google.com> <20250206061507.GA3959749@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Hyesoo Yu wrote:

> What do you think of this comment ? I will add it in patch v3.
> 
> /*
>  * slab_fix indicates that the value would be restored even if an error occurs.
>  * Or, it is possible to trigger a panic without restoring using WARN() if panic_on_warn
>  * is enabled. This can obtain a crash dump at the point of issue to debug.
>  * It is advisable not to restore the data before calling slab_fix() to check for corrupted
>  * data in the crash dump.
>  */
> 

Looks good, you might consider it to be a bit more brief, but otherwise 
looks to clearly document the intent here.

Was thinking of something like:
/*
 * If panic_on_warn is enabled to generate a crash dump, be careful to not
 * restore data before this point.
 */
WARN()

But I don't feel strongly.  Thanks!

> Thanks,
> Regards.
> 
> > > >> Changes in v2:
> > > >> - Replace direct calling with BUG_ON with the use of WARN in slab_fix.
> > > >> 
> > > >> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > > >> ---
> > > >>  mm/slub.c | 10 +++++-----
> > > >>  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >> 
> > > >> diff --git a/mm/slub.c b/mm/slub.c
> > > >> index 1f50129dcfb3..ea956cb4b8be 100644
> > > >> --- a/mm/slub.c
> > > >> +++ b/mm/slub.c
> > > >> @@ -1043,7 +1043,7 @@ static void slab_fix(struct kmem_cache *s, char *fmt, ...)
> > > >>  	va_start(args, fmt);
> > > >>  	vaf.fmt = fmt;
> > > >>  	vaf.va = &args;
> > > >> -	pr_err("FIX %s: %pV\n", s->name, &vaf);
> > > >> +	WARN(1, "FIX %s: %pV\n", s->name, &vaf);
> > > >>  	va_end(args);
> > > >>  }
> > > >>  
> > > >> @@ -1106,8 +1106,8 @@ static bool freelist_corrupted(struct kmem_cache *s, struct slab *slab,
> > > >>  	if ((s->flags & SLAB_CONSISTENCY_CHECKS) &&
> > > >>  	    !check_valid_pointer(s, slab, nextfree) && freelist) {
> > > >>  		object_err(s, slab, *freelist, "Freechain corrupt");
> > > >> -		*freelist = NULL;
> > > >>  		slab_fix(s, "Isolate corrupted freechain");
> > > >> +		*freelist = NULL;
> > > >>  		return true;
> > > >>  	}
> > > >>  
> > > >> @@ -1445,9 +1445,9 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> > > >>  				set_freepointer(s, object, NULL);
> > > >>  			} else {
> > > >>  				slab_err(s, slab, "Freepointer corrupt");
> > > >> +				slab_fix(s, "Freelist cleared");
> > > >>  				slab->freelist = NULL;
> > > >>  				slab->inuse = slab->objects;
> > > >> -				slab_fix(s, "Freelist cleared");
> > > >>  				return 0;
> > > >>  			}
> > > >>  			break;
> > > >> @@ -1464,14 +1464,14 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
> > > >>  	if (slab->objects != max_objects) {
> > > >>  		slab_err(s, slab, "Wrong number of objects. Found %d but should be %d",
> > > >>  			 slab->objects, max_objects);
> > > >> -		slab->objects = max_objects;
> > > >>  		slab_fix(s, "Number of objects adjusted");
> > > >> +		slab->objects = max_objects;
> > > >>  	}
> > > >>  	if (slab->inuse != slab->objects - nr) {
> > > >>  		slab_err(s, slab, "Wrong object count. Counter is %d but counted were %d",
> > > >>  			 slab->inuse, slab->objects - nr);
> > > >> -		slab->inuse = slab->objects - nr;
> > > >>  		slab_fix(s, "Object count adjusted");
> > > >> +		slab->inuse = slab->objects - nr;
> > > >>  	}
> > > >>  	return search == NULL;
> > > >>  }
> > > >> -- 
> > > >> 2.48.0
> > > >> 
> > > >> 
> > > 
> > > 
> > 
> 
