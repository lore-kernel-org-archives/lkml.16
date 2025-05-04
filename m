Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046315D5B6
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746394524; cv=none; b=IwHCSSfX2wdlUecfK1iJNYEYFBxYGYhc0yYXXt56btYYzXG5OKyho2pzhNhFiEIv3cb5UHARkpewemr7OrWF5uWGMXFayp0B9JARfb6zqIvFVNT+ENHoYz8CIOJg6omy6hwydA3VRpjtg1wJV5jrsLlQfuSAJoEbpaFHGPSWFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746394524; c=relaxed/simple;
	bh=EcHzPKrPScCiVGsLIquXR/P6J026cFF7t0VVG6l+Kto=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dtg2Fp5BZD2xzbPUv9uPsrDjNiqstItv1g/V7KmlsbbIEJ9ZBWi/bWyeaIMe8s+RZcuvZ6EPYHjKBcAbZPeGap3lPUsGu5LWk9oOPs5H38s8f8+2Zf+v9/Nszoa8bLGxzdcxqhs8QSLgVGRL7CqI4613rm2ltWW0OiRlR3lt+Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLT4oEfH; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLT4oEfH"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3827178b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746394522; x=1746999322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LxqAQ4qa4aQrK+Slwlwin69lCuzL8oj2mCF2hCGkFIM=;
        b=KLT4oEfHnlYlc69q9VxQBKfHMPl+nGWcHryfmSbHUDzzh+Olc3gcM7f0lRywo1bjY6
         1omOTjgXZyr0ygrdx2Gn4TqgReRvt3iqFlI1XmKvMotV7YG4w21DuiucI+m01fnZPF+J
         OTEFtPKPHQVoXhy8LXcREc6QODcTMNDhwmyZaafJrMoCRRwUF2mamxtU8LS3j1DdWhcf
         kdXo6oldPJNpH8jwgMUrslAVB5oVtVmQ63rtksFXJqY7WzjRhtJSVLwup7b3Qr2dDWyF
         GVxQDsseN5gJ0I86DKsUzwDjyfrPmHUt+1HS7Cyi4AeTNd916d8f+8IiS0PbIeZQAZNF
         h2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746394522; x=1746999322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxqAQ4qa4aQrK+Slwlwin69lCuzL8oj2mCF2hCGkFIM=;
        b=FKCFfEaqnF3aQk7d2JpgcrH/EhqvG2/C0TYPSzj75dAnXBFyABvb8gVUZ901wpQwxI
         s/A577+B5Ko9oyMSngisTH5y5ADrEWR9iGS+N4i3/2Edr+bNdeWrRG+Q41/aGYgSJfuK
         QVX1UpqDbXEywFlk+Ws1wChkmYuYDO+cwuGRcOC6gf2SFRt5A8xAs5ztb4t5pJ7M4ey8
         g6bDBFQ73uE4oCWDs5IY2awGGPVzRIFKyINrspMATNj9dANaaOzSozCz+OlEbAI8M4cu
         btowiedGMc8Y036Q7AjqRh3J3fJX8zb1DsW/0AfTEBx/Uv3mRLfGW62c45TFbsWFLkIK
         XHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvthR76TvuMDjQ17hTiB/eBRyauo9WBYkOf9jrE6gzAHFo38vugxZtKudw6FLUhtJgFg6zsZ0NF1HAe6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2MiN9fTnR94ZXo6lZdb5bWp4XRvOn/eIpTd6+ixHvxwqhE5z
	nmSEL5K7aeJ9bfX32y41UuLBHER4BFAvyS+hz0WRsaMx4zoCPqxA
X-Gm-Gg: ASbGncuOgyg6Mq+qbe+Teh2j/YDQVcXAMPApNFgzzSE7t2/OWns1SoaicbmUfywFpt/
	NchcBSq9XtHT5r4ReoasViMIKh+AowzUUUhNUxz+jtIOQ6SH03WFon6YjcatBmynzGoEcbHm5Ho
	2X9+E7gYGS44niWhNtJCKmpLFeqU7T7LjL5Kjl7teLhvnyMO48U8e14QVx44DxBFxkXk8GUEEUU
	hKpUCvMaRMFY+6YlpyLpommle+X3QWpcq9qdqLh+TiDjAXm24N4NhORGk4KjYzmMOXDhXrFfa4N
	6/xF4R6pYGVCVZxt2UIBmR/b6CDyNldCTuOZ2QacpqnZDJcp9navbd/+8Pdo
X-Google-Smtp-Source: AGHT+IGh5yw3mRysgad9nxCWDBGbwLoP/iHNRJ5xeJHHf3KeS8OsUZAhtBm7YdHaIidMoULCdiEQ9Q==
X-Received: by 2002:a17:90b:5252:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-30a4e6949a3mr17963223a91.33.1746394522091;
        Sun, 04 May 2025 14:35:22 -0700 (PDT)
Received: from lg (lib-07-subnet-18.rdns.cenic.net. [205.154.222.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a474921c3sm7292168a91.29.2025.05.04.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 14:35:21 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Sun, 4 May 2025 14:35:18 -0700
To: Oscar Salvador <osalvador@suse.de>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org,
	mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to
 take folio instead of page
Message-ID: <aBfdls-Sw4VpMWQY@lg>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-6-nifan.cxl@gmail.com>
 <aBHYK3mqUyvqrGm2@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHYK3mqUyvqrGm2@localhost.localdomain>

On Wed, Apr 30, 2025 at 09:58:35AM +0200, Oscar Salvador wrote:
> On Mon, Apr 28, 2025 at 10:11:46AM -0700, nifan.cxl@gmail.com wrote:
> > From: Fan Ni <fan.ni@samsung.com>
> > 
> > The function __unmap_hugepage_range() has two kinds of users:
> > 1) unmap_hugepage_range(), which passes in the head page of a folio.
> >    Since unmap_hugepage_range() already takes folio and there are no other
> >    uses of the folio struct in the function, it is natural for
> >    __unmap_hugepage_range() to take folio also.
> > 2) All other uses, which pass in NULL pointer.
> > 
> > In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
> > take folio.
> > 
> > Signed-off-by: Fan Ni <fan.ni@samsung.com>
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> 
> But:
> 
> >  void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >  			    unsigned long start, unsigned long end,
> > -			    struct page *ref_page, zap_flags_t zap_flags)
> > +			    struct folio *folio, zap_flags_t zap_flags)
> 
> I think we are kinda losing information here. ref_ was a good hint
> and...

Hi Oscar,

Thanks for the feedback.
Since the sugguested change here is minor and does not affect the
function, and we do not have a aligned opinion here.
https://lore.kernel.org/linux-mm/b23ef51b-1284-4168-8157-432c3e045788@redhat.com/
I will leave it as it is until there are more pushes for the change.


> 
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	unsigned long address;
> > @@ -5885,8 +5885,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >  		 * page is being unmapped, not a range. Ensure the page we
> >  		 * are about to unmap is the actual page of interest.
> >  		 */
> > -		if (ref_page) {
> > -			if (page != ref_page) {
> > +		if (folio) {
> > +			if (page_folio(page) != folio) {
> 
> You have to update the comment above, since we are not passing a
> reference page anymore but a folio.

Will update in the next version. Thanks.

Fan

> 
>  
> 
> -- 
> Oscar Salvador
> SUSE Labs
> 

-- 
Fan Ni
