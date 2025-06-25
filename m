Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7C29E0E5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879399; cv=none; b=Hj/I5WYax8fKrZb2Ldat53ZXKWQE2LF8UEfsuTPiADLclPxGDdj1xAFMsp61JR/G98Y+mo/1nhN9ygPZ8pD8QXfX/dWIv7NYjvWE0gWj+YDlgMr8xH5ZxWbZIhMvg3GUOBRU8dSyPGrjFMMW6nzb3jTHW+7jywcqtNh1ro0/2dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879399; c=relaxed/simple;
	bh=q5DQBJ15ihN87WxOEs+WtvOD0bie9tS02mp0oHuaAXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cddq86+YBLdIO4zrpzQEbAltNB1+oQbYU7nMC+j1fv5AmaA8rdjUC985QaRdmEtl+wayOK16+KX/hihuDrsHZJSI+3Rf8b7LYzuIn0P0Oe3HR3CzudMqDnaym6S2e3G5AQqHYEZBTeV3hyzeBdwzurdDDccoDWtPcfTYEL3rsfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FarIudGd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FarIudGd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235ef62066eso3525165ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750879397; x=1751484197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WzO6Y3n7DOv4AVljmkC53x26oyxLjU3r+14Redn4wGY=;
        b=FarIudGd0Rl0mR++/kEvuH/poYf0I0awLlwEi7HTlWfmDoI+JpXZxoVYwfjtTD4Kml
         QP/xOrJhaIOpsL9WH4d/WbyxlGdMyJhLM3PwqQvc/zsAPse8dBxKJrcQ0+O38upyB97Q
         JdXXsAJnSElMbEZPIMWexQBC+OaI3ph//e0o0dMrgPDYW2B9kLfGf+clH1gHrRwlyjh+
         3a8Of74xpFqX9NwLlmjthSjWAKDzlatJEUKWHGsphe2lggJ+2kn/0Z4jnHWKBZK6EuxH
         rX2IUqCLkc0KhI98IXqw3l6ygRmjRvYDtPVCFU0eGRjs/BEfrhhk7I3PZQbnk0ia3zqd
         4kTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750879397; x=1751484197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzO6Y3n7DOv4AVljmkC53x26oyxLjU3r+14Redn4wGY=;
        b=uQ42+JCw8OPjOXM3eMYODEISUfV/m+cl6JJ/vjWGKcZ/EvpswCXLrVFY8QJ5Op13Zu
         P2bGbQda38J2LhzJOuAePdP55K5r2VGGRp3LPnIIK2pFg+NAxlq80f9dlW5VNUsFReql
         npK1HnLCDiI5sJnvd2n9tzjojSbySpCmruPyoGOEp65tdcZVkQ0uInrwyyR7tbaU3AiD
         C+8//9PglNV+gnDXuWCrNLi32WrCz9IQTs6DIaalsZTPeOpYgdXPSqUEz7jR8gbRAPtQ
         9Ocsx7OZlOIh4prB3qrm8WUdkPSMfcMbEF2pg7ujY1a3qsO1wPQFV11zjPN2vpwezeG5
         +AAw==
X-Forwarded-Encrypted: i=1; AJvYcCWXLiozAY7vx9Qi/XBuMiiLj0A1m0dfk7khX3cWP+YDmnJ6W0fPsHdrC4nP31P9UcRJjtxb0kM+FxQMA54=@vger.kernel.org
X-Gm-Message-State: AOJu0YytD1YCoYCVXhWC6xu0ESx4JXwW5PEO8PdRNRMTidvl3QguPuDc
	KTfsRFBVjL911UAwLh872A7fQIXtCVvkw9c7C/hxU69TVBNjHLxi/TXy
X-Gm-Gg: ASbGncvnfGCqmHBOKgwp9VW9+xVepU0HwLWYY68p93byjqOQ1oH2W+uBERkiiry4HG9
	H0q/2xwDZzFqtvm5JgjuvgNbWg+KKEemw7K/y5dTQ+0XcQfR/SrmP9Jse1HG6VXcRbSMyK74wWa
	7dvdxiISapUfDN7c5RkrATMYQIfVGhEAS1Y3azSG1yjtFLjl9yR+Pz/uTkNY41nWINEI2fOPqlh
	x1ETUIuijCVwlcAFrTd5QwRxIsbfUkqpITxm7gaPbp/4qNiWT/blyNv1gjpsXdmP77E88mDfygV
	/F8VvOmbKFuVSaqwlGOQvLVsJqRpjvKhQf8baWkKey/D4mLvyYvhk8T9MYh5KmOdHBQLJLCgcCp
	yKJM0jU60NQzrGmoKpA==
X-Google-Smtp-Source: AGHT+IElgJQKMbqFyl3J4hHwLcejBpcY02laJCtiJg94KBmUyqpQe0uSq+liyONwyokdu52sBOJsLg==
X-Received: by 2002:a17:902:c94f:b0:235:c9ef:c9e1 with SMTP id d9443c01a7336-23823f6d39bmr75541645ad.5.1750879396951;
        Wed, 25 Jun 2025 12:23:16 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860fb63sm139983845ad.130.2025.06.25.12.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 12:23:16 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:23:13 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Jordan Rome <linux@jordanrome.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH 1/3] mm/memory.c: convert __copy_remote_vm_str() to
 folios
Message-ID: <aFxMocs_POgbkcPt@fedora>
References: <20250625174841.1094510-1-vishal.moola@gmail.com>
 <20250625174841.1094510-2-vishal.moola@gmail.com>
 <aFw5NuCbgJOBmG97@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFw5NuCbgJOBmG97@casper.infradead.org>

On Wed, Jun 25, 2025 at 07:00:22PM +0100, Matthew Wilcox wrote:
> On Wed, Jun 25, 2025 at 10:48:39AM -0700, Vishal Moola (Oracle) wrote:
> > +++ b/mm/memory.c
> > @@ -6820,9 +6820,10 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
> >  	}
> >  
> >  	while (len) {
> > -		int bytes, offset, retval;
> > +		int bytes, folio_offset, page_offset retval;
> 
> offset_in_folio() returns a size_t so that we can support folios larger
> than 2GB (which is a real possibility here; hugetlbfs might end up with
> a 16GB folio on some architectures).

Got it, I'll change that.

> > @@ -6837,17 +6838,20 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
> >  			goto out;
> >  		}
> >  
> > +		folio = page_folio(page);
> >  		bytes = len;
> > -		offset = addr & (PAGE_SIZE - 1);
> > -		if (bytes > PAGE_SIZE - offset)
> > -			bytes = PAGE_SIZE - offset;
> > +		folio_offset = offset_in_folio(folio, addr);
> 
> Umm.  Not sure this is safe.  A folio might be mapped misaligned, so
> 'addr' might not give you the right offset within the folio.  I think
> you might need to use addr - (vma->vm_pgoff << PAGE_SHIFT).  But I'd
> defer to others here ... particularly when it comes to anonymous folios.

Ah ok, I didn't realize folios could be misaligned. I'll play around
with your proposed calculation.
