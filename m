Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3076E2D3213
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749751356; cv=none; b=BcWlq6Pi5tu+ymKXAKBXDR1LcUsH7Gwp4/XV6UiWTxXMPdWbQQENfhb8lCx3zaxCU3Izh6rtMRGJhrkBQ7ajaxyIENsT4BYwBmoRV9ngJmTePN/AO7qmsPRiL1y4qod5j4CGK4+d4d2O7x0Uph9QimmHIvCn2ICA9vQCROcQoyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749751356; c=relaxed/simple;
	bh=S7r59/PIWkoTLIG07/E/jEWrNmZtWKxEaHN/jiSuqUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESXpoEvqf9R9q2Jgpwoy2E1CmRZm0rfJr8l/inKlWOlgcCYZpLefIvve08ea1WefzBOwlEGqZtKck8ps75R4hgmVXDR20dFpdyVmbgyxvE5pgqqFkJNFmRPiSaih8/xlzC9khSc1AIfrslLJYpA0ByK6T5tftcSYgTb8K223GhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WaeDzmsz; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WaeDzmsz"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476a720e806so11570481cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749751354; x=1750356154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Men1Nv7TOAnztTuH0H3iBJJYmyP24ktCmwcSSGXFev0=;
        b=WaeDzmszRAUHVlAnIJEbJ8onMxOApOo0ScZYPiD9U0sp4i3kGK4rR/wYq+9q600hWi
         wwzNvXI6cE4z5jBOlKo2j0HbxaFj/R71YuKgrBw+NfVyeOR+TR16XxiQxVXE8dvaVp/p
         s/IY5ogw+cSZIRwmoC+SblvVqFzsXTA2f+iQM/xxQIFd8VtLm9iNWA+U4Q9Bwr6tuEZe
         yr1cPg4emPNKyRbubdbNi506auJDQuA7+eoACeDY19e0kvrBU1sf9FfQu8S4yaMv67Z2
         upL/OSFmI95stNikn9VNvWK+5oZmJuyEUpkBqK7r12a7+7Ntinde/HcjV+8vOuMidkEZ
         LgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749751354; x=1750356154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Men1Nv7TOAnztTuH0H3iBJJYmyP24ktCmwcSSGXFev0=;
        b=piG3aYHMWmj9tFNeQvWhonvY39fEtj6+i/vUiA2PhvNC4FbAgyDcymA1qSGNe/yL6a
         /00NYOTTFe2akEfcZy+fxqeTF7V4l+D4JMBiz9qHbBucPp4Ri3wMnY3C6ExRg316r1eF
         gIkIz/Z8ZBTUlIwzdr7Lnf4vONJBUt3VoIWMzcJkJJBzkGLqVcVxTQyJIXp4tmCs4/r5
         PWLOPg2pracTzbcAb3LnoycbcK/0cVy3swGtPLwy7CPXduHwsINNznUIB5a7uclRyD2x
         8H5de1+UJWevDOmqiAMn6/ozYIt/359mkRnhz9skTfIiUy3Fi5hP09M/OQcip+i8Wsyr
         JBWg==
X-Gm-Message-State: AOJu0YxZGZBpliqcQkSqwP1QWtIehXyC9hPz2IJARaUkiVDox//Vr8aN
	jMWsjHlcab89+GYoq/MifIXslpW637M0kyigC9e0ZfVihZdKv54DFbdi2O5wAtO7KtM=
X-Gm-Gg: ASbGncvFg2+GrcSpOhbSkceeLKjTg1osJbh+mtXhYlkLq0Hqr+yYu3WtVy1Sv6FnjLk
	+wi5iLcJTd7WF+G7XkvqomRI6lnr46dnVgkFkdQzgCgBI1UkjxBrQNxtdWoAz0jmfhtpEGc1q4e
	OhJXoj1zes7tKHrP7UtDPGpReQe38GUJM+kpv4DPKXXxRGUS4WgIFcmOzqo2Fz3U/VGW+Bs02oF
	J9rwrxcGOWCi9v886s6FTpUmH89TwQlADnyTCcn7tKXl2ornzdd52uMVt08pLm01WtZrsxnmsZd
	a6ZPCbVHBZYG3KlxCyNqZkshR8U9iPaUNxCglcn8Fzfsr4DMI+bMoCfVEGc6+U1bwYJWS6lLNsQ
	kSlTZO8SnBQzLdGuzTUTDArPtWotQiDgK5akZSQ==
X-Google-Smtp-Source: AGHT+IF2gHZ0WFh5VXAMyx6YiN8EJ/UWCFphfLEXmh1c3StoJxVby1YEDKi6l0heE4IvQIvOlyk6VA==
X-Received: by 2002:a05:622a:1f91:b0:4a4:3079:55e7 with SMTP id d75a77b69052e-4a72fe7a666mr2315081cf.17.1749751353871;
        Thu, 12 Jun 2025 11:02:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4b0cb9sm6750981cf.50.2025.06.12.11.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:02:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uPmG0-00000004kgF-3F9r;
	Thu, 12 Jun 2025 15:02:32 -0300
Date: Thu, 12 Jun 2025 15:02:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 2/3] mm/huge_memory: don't mark refcounted folios
 special in vmf_insert_folio_pmd()
Message-ID: <20250612180232.GB1130869@ziepe.ca>
References: <20250611120654.545963-1-david@redhat.com>
 <20250611120654.545963-3-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611120654.545963-3-david@redhat.com>

On Wed, Jun 11, 2025 at 02:06:53PM +0200, David Hildenbrand wrote:
> Marking PMDs that map a "normal" refcounted folios as special is
> against our rules documented for vm_normal_page().
> 
> Fortunately, there are not that many pmd_special() check that can be
> mislead, and most vm_normal_page_pmd()/vm_normal_folio_pmd() users that
> would get this wrong right now are rather harmless: e.g., none so far
> bases decisions whether to grab a folio reference on that decision.
> 
> Well, and GUP-fast will fallback to GUP-slow. All in all, so far no big
> implications as it seems.
> 
> Getting this right will get more important as we use
> folio_normal_page_pmd() in more places.
> 
> Fix it by teaching insert_pfn_pmd() to properly handle folios and
> pfns -- moving refcount/mapcount/etc handling in there, renaming it to
> insert_pmd(), and distinguishing between both cases using a new simple
> "struct folio_or_pfn" structure.
> 
> Use folio_mk_pmd() to create a pmd for a folio cleanly.
> 
> Fixes: 6c88f72691f8 ("mm/huge_memory: add vmf_insert_folio_pmd()")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/huge_memory.c | 58 ++++++++++++++++++++++++++++++++----------------
>  1 file changed, 39 insertions(+), 19 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
