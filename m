Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A36225D7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745543498; cv=none; b=RjeuhN87Z7i8WyXiq+dg00pYVLpUSIrm3vvNDxx4Po97WZNyh7JcNSqQizLQKZg9L1MSe7vyo4EcCdCCS7xXjKKycqUCGNyd87Iulia6aGd+cpR05oeXQS5K/t0BMQllYgkyRDDu4otxwuQ83SMeuVmvRR+j2u7yhID1V7pkn78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745543498; c=relaxed/simple;
	bh=xo7zxC5To+/bZCG0FZOpmLM3UquRzGHdwAxy1ZIlh/M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2BYNkoQ9Earv9LKxmaPMW4Jje+4kiNwlY0T1HMUhBEfo+cxVTvkGLFBu1LZ5Y4LAzLzyisrgjo6qL+OzIMFDdT5stjhRGQ9ZtQldCEczIS9RunI/xL6XAcvJX6WfHMEAsmENcH9CmbRS7g13QHHZW5+6hI25UGCy1BWrtvvuSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmabnQVj; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmabnQVj"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736c1138ae5so1651335b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745543496; x=1746148296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ge8Fe+xXUeyc8wI+dZ+opA/vYyipM6Dv3T3b1JEHI1Y=;
        b=OmabnQVjqv8ZWxN8PCZ7xGdp1kHBJ62iNqoEFDD2fWZWsQk6B7Nll5T7NGm3Q2/7AW
         S35/ez/fnfVGEHswYzmPjcGmjO9iuDMtmnFvXT2+ESl6Nxp8dnG9qqEZOjBCG9ZNJ+1D
         a2Ogon+F9bJT+W+xZBdSrCehf6+O5grOxeGUh2e2D3nXF9NT+p7pMCCxINqm+sRwG2Jm
         hVoDxF8i8cCvz6OAvul2G2JkdJTzYpOYTHRZFi3QVBGCqTNgyF8YVkEsXpfmAawzvltj
         mzO6z1lWREmdMUdN7wpyYTkk/mkGUph5qE/s2Qw8KACpg3Oq4Iw645vNgelR2vmT/Z+C
         LKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745543496; x=1746148296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ge8Fe+xXUeyc8wI+dZ+opA/vYyipM6Dv3T3b1JEHI1Y=;
        b=uoWDQvGAr1KpCFVxOvF0B6vgwSLYLGYR8hfE/o8cWfvaz7+ZdbVkNiHKBBhNHEEWhC
         8IkDXK3ZZFOmtO3bvxDtaDYH3ZRtBrmBMROoFqhqdnp/E2WpHOS0ia4pIu99byMgxise
         RCpcayaZkDh+lZux+hBpCZIZc4DmiPCXFQg4mNMJ/1WHluuuuPqy+oLsfhMQV4X1bjzZ
         ypnNNY9z/EoVwd7v4AyEfxqnZJZrgPoVc8Vvr23h86iCdVcI3Xdbu2Xguq2JojRzDNka
         hqc3A6BgUajbksEhKnwnVqfYZOCVt1cyvTUpbW5mkYYSFNychBxbp9YhVwJ6M2SY/353
         FBFA==
X-Forwarded-Encrypted: i=1; AJvYcCXsIpZnLWhxKT/FBEomQ0eenQfp3yVTZ3TTeS7qE6Hq5YV2dTtH+YikCj3yRZH+IQUnV4chMGfPtfksU2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxup3D/85Sc/MazkOvXmBxR7AQKHfWemCDTDmRGtDUA53pWvb+/
	0lzLynkx6Gv3o9CQQJPmOXa4fiPyM3JFkBMmNxgUfIVmox4wQNhv
X-Gm-Gg: ASbGnctVhqM9P5CpR1D5FhWLnwXIghZe1agAGO+iV+bp7VWgEtBdOPUnSwnWQdoEJ/e
	Elz5y+Wh90bjCc3Age6AYN0ja83PZKAjSoqT2eZn772qB8SCp+0H3gIOa4nbEu3kuJx/OBg8nq3
	b/NcAHEmJr3PvGLynDlsxtGhGGHN5D7RaNv4/GAWwyltlN29auJoDWKf2nWVGZzYbbExp5uHBUP
	HMq0cAH8lgAmAdixVwVaaqWUjrOkhPGa9EN8btjcvFXMxXcQpUnt2rsSwmyCYxxRGjNmcFhuomK
	s/7uEDxcXr7P7Ml6So+fJnh4QMPLw1iujFLf
X-Google-Smtp-Source: AGHT+IEku+l/IAsrFLZrckNIk23qa9ncCWxvsS8RMhYBbtiMTQqeoYXstndm8reR/eyupZgVm+GazA==
X-Received: by 2002:a05:6a20:12ce:b0:1f5:6b36:f56c with SMTP id adf61e73a8af0-2045b9f19bcmr467470637.39.1745543496340;
        Thu, 24 Apr 2025 18:11:36 -0700 (PDT)
Received: from debian ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa908a40sm1868105a12.47.2025.04.24.18.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 18:11:35 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Thu, 24 Apr 2025 18:11:33 -0700
To: Matthew Wilcox <willy@infradead.org>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v2 1/4] mm/hugetlb: Refactor unmap_ref_private() to take
 folio instead of page
Message-ID: <aArhRYiP2Veii-3s@debian>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <aAhbxQxMFAvsOrx0@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAhbxQxMFAvsOrx0@casper.infradead.org>

On Wed, Apr 23, 2025 at 04:17:25AM +0100, Matthew Wilcox wrote:
> 
> With regard to the Subject: line, you're not "refactoring".  You're
> passing a folio to the function.

Hi Matthew,

Thanks for the review. 

Are you suggesting something like "Passing folio instead of page to unmap_ref_private()"?

We do not change the behavior of the function, but only the interface, it
is kind of "refactoring" to me.

Fan

> 
> > @@ -6108,7 +6108,8 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
> >  		 */
> >  		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
> >  			unmap_hugepage_range(iter_vma, address,
> > -					     address + huge_page_size(h), page, 0);
> > +					     address + huge_page_size(h),
> > +					     folio_page(folio, 0), 0);
> 
> As previously, use &folio->page here.
> 
> 
