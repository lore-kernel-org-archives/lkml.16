Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C911CD15
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744950429; cv=none; b=YSXECdg8dqVBLHF4uyq/lYJXcq8/TfNzSpjjleJMTLE0IieUJu7hg8pQM7TqTUVTnQQo4OWLREppNTPQ6DMbG7/4Mc9MGGuFM5v6NnI8x2PavLn7j47FBW9mXKu88SUQg1QsAfM4V1eUXqVEEI+mlY4Ok4a8DPTzWJk187HaEAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744950429; c=relaxed/simple;
	bh=A3gIrCwXbdqFwLupEPmJBpxZvsWs4ItMt0mkkux4Wm0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYtzSX6scf+BAkq9ZaFPtf8Zo51vPEg394sA01ilXdLKmnduh/RKNj1llk/nea7WdxBeXy07CdP4+iPCJRT1Ni0Qvm5j15/ilN3L6eY9TDXcRfN9QuqWZ7UHisnDRsGZ5McgoYfP16VcUF4rr1GQNyci/Wa1IhAfCZ02VQjyv4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ27p7QU; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ27p7QU"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30828fc17adso1446063a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744950426; x=1745555226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uvh6EcREOhk+tZ2ig1dYWFCZtbIMCQishByXGMuTreU=;
        b=QQ27p7QUxb28zt9EA7jzmI9hIBkIE3Uix8MSB6FK3x8DnHl1+//gFNaa/4U/bp8q/x
         VvuSAEoSXJv4MPDpvX3n1vYtOO42WilDke5pqiwULfDuXj3Emmr1XkqSHYo66KDA85GH
         AZbARcFkmrd7tVy1/UewcbjlAyM4D/1YHgiMvL5lyfF17h8qU0B5ACuvhzvbANhj3f2u
         R/5NR8kzRY1c8Q4+cT6ZP0jNhW6MBwt8a61BEtDQ0aWt0uDrtDmFOyhLTYaIzXXo2Zk4
         cjE67mNlp9nk2gcY1X3nv0U+B+NSQfyncz9607Mex9TexZiu5oAwJeH6y3Ttaz+tkkAp
         mECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744950426; x=1745555226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uvh6EcREOhk+tZ2ig1dYWFCZtbIMCQishByXGMuTreU=;
        b=fnt2pnRzIlwS+6BiL7zD1FELVXJbrdFjy9G/mDYLFn8cw6JzWdi5VzoQIXu6jKHt+n
         Q7knZkXv4K726HreFc5fij1WqAe/qSzaKEOfIOB1tLZ/yg7YXrt8Qj3kqZxKElRzyBnx
         lxpu8+WkCTQVCpGvArD7pTp+E6X6tNWNoW8IDuuwErmaExqhif82h0aNM1cboiyJP01P
         nQs8szheBuLXzmQqIT1UcOJt3o51rz0TmRGzRnf26IiXBqHhbeBaS79LkbIWIkIyG6EK
         mywy5hVtzIUjZrjDqY3+eK/9E16pWqaPwVVBh+Ry1wnm9wlfhcPMAsgQONc13JRKHD7Z
         dgSA==
X-Forwarded-Encrypted: i=1; AJvYcCUW3+c2M1Ps4idpexQ6D/eWUPd+wbtNbQz4UOq/iTRtJEoXva40vOWKc1ULkhNS/DH189QxYb0k4tC7Jqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKOzrTAjhZNyjCoXIlhs8joaM9/+gyWD0ZgV7HhAKqfIPQ9V+
	L0CtwwtMZgC83EXSyCQ1NmqX4P3pnI4c6DTGcb7990ILgeW/gcqz
X-Gm-Gg: ASbGncuHyh6N+92SvocOnkBAqzXFCt6QuLdb6bBZ3OX3uiM4zPvoFppZQnoXuCbxCMH
	r8e5D3wgYD9pL9R7DUibfqW8zLFJV8lhldmyr6n0hFty4N4yFc5G8q4pXWHkuiu1suW80WWp+uX
	osnC2UisHes6/w/2w4H8dLL9ekMx8q+5rit2XXZjXWt7ZBzS9qSUd8sVx65qg58NdjYP404jtyB
	ZvTv7DkKpsShGJZm1cU+ORSBVZPdg/E0D/zhJ64sOVU86ODgbhwQ+s/Ty3yh0i3eYp//F2Nk6m7
	b4BpYlFu+vniQGVpavgRtOlz0No9/9KCb8D2
X-Google-Smtp-Source: AGHT+IHybhoKjrnyjI0qsqHHAfqJ2XX5sQZ/pqutbNqjnlq3XP2Yul9Y74lQ4sRNFJxBkF0PBeRasQ==
X-Received: by 2002:a17:90b:57e6:b0:301:1bce:c252 with SMTP id 98e67ed59e1d1-3087bbbccb6mr1831862a91.27.1744950425684;
        Thu, 17 Apr 2025 21:27:05 -0700 (PDT)
Received: from debian ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df05153sm325549a91.11.2025.04.17.21.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 21:27:05 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Thu, 17 Apr 2025 21:27:02 -0700
To: Muchun Song <muchun.song@linux.dev>
Cc: Fan Ni <nifan.cxl@gmail.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, willy@infradead.org,
	mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mm/hugetlb: Refactor __unmap_hugepage_range() to
 take folio instead of page
Message-ID: <aAHUluy7T32ZlYg7@debian>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
 <20250417155530.124073-3-nifan.cxl@gmail.com>
 <daaeffe6-f9b8-4923-a273-0dab573aa749@oracle.com>
 <aAEteJh4Gb8R7gPm@debian>
 <363E4489-76E8-4FD2-AD17-2E0B46160CAB@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <363E4489-76E8-4FD2-AD17-2E0B46160CAB@linux.dev>

On Fri, Apr 18, 2025 at 11:03:59AM +0800, Muchun Song wrote:
> 
> 
> > On Apr 18, 2025, at 00:34, Fan Ni <nifan.cxl@gmail.com> wrote:
> > 
> > On Thu, Apr 17, 2025 at 12:21:55PM -0400, Sidhartha Kumar wrote:
> >> On 4/17/25 11:43 AM, nifan.cxl@gmail.com wrote:
> >>> From: Fan Ni <fan.ni@samsung.com>
> >>> 
> >>> The function __unmap_hugepage_range() has two kinds of users:
> >>> 1) unmap_hugepage_range(), which passes in the head page of a folio.
> >>>    Since unmap_hugepage_range() already takes folio and there are no other
> >>>    uses of the folio struct in the function, it is natural for
> >>>    __unmap_hugepage_range() to take folio also.
> >>> 2) All other uses, which pass in NULL pointer.
> >>> 
> >>> In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
> >>> take folio.
> >>> 
> >>> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> >>> ---
> >>> 
> >>> Question: If the change in the patch makes sense, should we try to convert all
> >>> "page" uses in __unmap_hugepage_range() to folio?
> >>> 
> >> 
> >> For this to be correct, we have to ensure that the pte in:
> >> 
> >> 	page = pte_page(pte);
> >> 
> >> only refers to the pte of a head page. pte comes from:
> >> 
> >> 	pte = huge_ptep_get(mm, address, ptep);
> >> 
> >> and in the for loop above:
> >> 
> >> 	for (; address < end; address += sz)
> >> 
> >> address is incremented by the huge page size so I think address here only
> >> points to head pages of hugetlb folios and it would make sense to convert
> >> page to folio here.
> >> 
> > 
> > Thanks Sidhartha for reviewing the series. I have similar understanding and
> > wanted to get confirmation from experts in this area.
> 
> I think your understanding is right. BTW, you forgot to update definition of
> __unmap_hugepage_range() under !CONFIG_HUGETLB_PAGE case.
> 

Thanks Muchun. You are right, we need to update that.

Hi Andrew,

I see you picked this patch up, should I send a v2 for the series to fix the
issue mentioned above?
The fix is simple as below.

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index d6c503dd2f7d..ebaf95231934 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -452,7 +452,7 @@ static inline long hugetlb_change_protection(
 
 static inline void __unmap_hugepage_range(struct mmu_gather *tlb,
                        struct vm_area_struct *vma, unsigned long start,
-                       unsigned long end, struct page *ref_page,
+                       unsigned long end, struct folio *ref_folio,
                        zap_flags_t zap_flags)
 {
        BUG();



Fan
> > 
> > Thanks.
> > Fan
> 
