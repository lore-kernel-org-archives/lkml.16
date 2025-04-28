Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5D7204C07
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876040; cv=none; b=NGAxzkj7/oe1RYubwbM6EDQRtulIb4lv9JpYunY2wSgMon9vHnx8e62bVEoqqF3KXvYoNgHfGwiDbaj9LVEfPLwHZxLEazgeoRYyLLM5MA61bEkiFa2CNwzrorJoIn7/DBK/0a5r/tXEGrC6EVcYzK0QqdzZR1fIV9btsCONAYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876040; c=relaxed/simple;
	bh=lAKNjlpr7LrSwKmUg4IbjlAzOHA0lfg4nZDBpi5w7f8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqWjtRf0s06/XzA5lQq80aWNua0sD/+SxxYchCUcuRvQrBgx0XwIz1dCfpF3d9PeNC9nnBRA/XS0MkzXTxxw1bkQHYRe0W1pDWOSYEBMbEQQ2QRxi2gnnJT20p20Wi7m0I0KvhsHOQHchkfxKbx678mmPzOkyI4PheTWw5l4dBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7PVpAdQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7PVpAdQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22435603572so60751705ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745876038; x=1746480838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y80dlApmP3WdHlVsCivNbxNkh24dV0wQ8ioMN0ge7FQ=;
        b=H7PVpAdQcSiQvMXqA0ksFu1YTqfRwuamkQTKlRHYAm/THnWOTjmRs1Quocs3dTyqlB
         86qJnkQxZhl24OAn0u1uOPS1rXIynrkfaFHgtW6hGIpq+AScbwrqA2c0u/plxEsJrRos
         FaAX0GU18P/XLLp31cfHWXtGEiFuqNF8J+TUYLrMwkUpGV0IGSXO0VE2SKQvqUa51HII
         SKYgQAGackp0YMcEY3x+lYHARnErwHvLXbapbAGjdrQr288vyJb39XDhUD/DKsX9ZuZ7
         vrOucxuh+7tgb6bQStICJDN9UiwL9v05SsI9fp7hJNp5S4UPO0ans7IQhCy9CknKqyzN
         oVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876038; x=1746480838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y80dlApmP3WdHlVsCivNbxNkh24dV0wQ8ioMN0ge7FQ=;
        b=UByW6PFWDACY4fckEvkC0sjW6hTQT9mFmOhx4qvkxs+qJg3pp/Z1kHULORg6dLDbvZ
         3o2doQFTXW2XEwI/okVPDIDBu8hItNrHsrWRb0NOGGO5meLG/6QIHa9WSrmfUKlWT8Sd
         vX0kaQRCCRaHnlriSJllv7C6pzd3MOa9vUjqWJ9hfXbIPGdz4DL7wx1I17fLMpmIBhBF
         P46+xj6yvZu3pLuzrkNSDm+V0d7DHjp3WGvQiBaJAXes/GrGCJTesVcwNSi15GoFkGkp
         OTMOFD+mjj6DcsxADIoLR49exkZGxhDRN45TxwFJvg00uheSdP21n18G+gCDajxqh+O8
         p+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5OAb3DNSvSjzn4tsY4zNDkBCToFYwYC11Ye7gPACXRl6lnMQ8Edke1Xk8mDHnStZzdZ+922FkHFRhMMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoyyLWkscvSBj9HfH4YlIzM8xkUS3KFlBraZnkZwnd5dadF7qo
	4gQSx90Wbo5GFLmZMXuZgLb0VRV6xN535cLTsigXtNQ5oZ7a9EID
X-Gm-Gg: ASbGnctoTd7gwKwhMfTw+zlDBnmSUbKaRvShGW3yHUColsBtIBVodo6ERa9NkAWUKfs
	Sj0+YctqShlMoQN5jnTw8ZHamFOQ/m0IaXps02vLRgETOh9yWWJS5oc/2sl+9rsj69cRB1hjzSH
	8LH8/t1Tj8oQoSNlsrra6Zp4J4qjuR0JqO547Hgjl8bRnMioi4SrQsiJA6vV+WoO2pu3k0GHKMR
	p8EDuY/Xq6N2M/FHokF+MT2BAG9HQ6NYzW2Al0kKq1RrfAeKKXMQd8rrha7zSKlXDOe2Zdpa/y+
	dNJYiQZ3NojJxWEpMUAUBDbtE1gBfNeIJMxJ
X-Google-Smtp-Source: AGHT+IEQ/Biz8EfdED6IIumEpHqFb2nvr2P/lGlfLXCMlTOxPSdv9RbvLpNCcn+KyaUf1fRenvRa8w==
X-Received: by 2002:a17:903:1107:b0:224:191d:8a87 with SMTP id d9443c01a7336-22de5fdcd88mr15595845ad.26.1745876038014;
        Mon, 28 Apr 2025 14:33:58 -0700 (PDT)
Received: from debian ([2607:fb91:20c0:f614:98be:8f32:92e7:f9cf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51026dfsm88565485ad.170.2025.04.28.14.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:33:57 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 28 Apr 2025 14:33:53 -0700
To: Matthew Wilcox <willy@infradead.org>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
Message-ID: <aA_0QZFxrIt-uGIH@debian>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <aA_ssINhIDuxCYP6@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA_ssINhIDuxCYP6@casper.infradead.org>

On Mon, Apr 28, 2025 at 10:01:36PM +0100, Matthew Wilcox wrote:
> On Mon, Apr 28, 2025 at 10:11:43AM -0700, nifan.cxl@gmail.com wrote:
> > From: Fan Ni <fan.ni@samsung.com>
> 
> When you're sending v2, send the same cover letter as you did for the
> first one; don't make people go and look at v1 for the cover letter.
> 
> Put what was changed in v2 after it, so they have some idea what to look
> at when reviewing.

Hi Matthew,

Thanks for the instruction. The previous version of the series (v2) did
not have a cover letter, so I only attached a link here.

I will keep the rule in my mind for future sending.

Fan



> 
> > Changes compared to v2,
> > 
> > Patch 1: 
> > 1) Update the commit log subject; 
> > 2) Use &folio->page instead of folio_page(folio) in unmap_ref_private()
> >   when calling unmap_hugepage_range();
> > 
> > Patch 2:
> > 1) Update the declaration of unmap_hugepage_range() in hugetlb.h;
> > 2) Use &folio->page instead of folio_page(folio) in unmap_hugepage_range()
> >   when calling __unmap_hugepage_range();
> > 
> > Patch 3: 
> > 1) Update the declaration of __unmap_hugepage_range() in hugetlb.h;
> > 2) Rename ref_folio to folio;
> > 3) compare folio instead of page in __unmap_hugepage_range() when folio is
> >   provided when calling __unmap_hugepage_range();
> > 
> > Patch 4:
> > 1) Pass folio size instead of huge_page_size() when calling
> >   tlb_remove_page_size() by Matthew;
> > 2) Update the processing inside __unmap_hugepage_range() when folio
> >   is provided as sugguested by David Hildenbrand;
> > 3) Since there is some functional change in this patch, we do not pick up the
> >   tags;
> > 
> > v2:
> > https://lore.kernel.org/linux-mm/20250418170834.248318-2-nifan.cxl@gmail.com
> > 
> > Fan Ni (4):
> >   mm/hugetlb: Pass folio instead of page to unmap_ref_private()
> >   mm/hugetlb: Refactor unmap_hugepage_range() to take folio instead of
> >     page
> >   mm/hugetlb: Refactor __unmap_hugepage_range() to take folio instead of
> >     page
> >   mm/hugetlb: Convert use of struct page to folio in
> >     __unmap_hugepage_range()
> > 
> >  include/linux/hugetlb.h |  8 ++++----
> >  mm/hugetlb.c            | 39 +++++++++++++++++++++------------------
> >  2 files changed, 25 insertions(+), 22 deletions(-)
> > 
> > -- 
> > 2.47.2
> > 
