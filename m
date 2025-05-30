Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E361E515
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748617383; cv=none; b=XRXvGWEFOsq2nKhakVa70g+/skBKBPXIXMoEj8nilyZVrtGEbRXym/FRvSIw3dP6u2pdTdXLdaKcmv4yynwQbyvgYzVO+4NJi9ThezMP/M6Q7XxAtdRFWXWCvO01kIuYdz0KUDGlYgXWqAseKC5zob/w50nf4/HT6oDOdm8Gf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748617383; c=relaxed/simple;
	bh=AVN1jwX7xSHkfOR2OSMtUKT04NIP2aC0DN9SYHwZe58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVTgKXUXLKYWhITbE0i/qIQTA+N3aoVLLjZatN1t2e3gVUbHjpLgbMeNDoTrXq9KypVeDaoSUi8r2TRcj36hGJII34B/eRWjiB580cIUeATx9CZapsER+8AqqeHc9m2ZujsZaEfdYA6gQ5i53eXVwtZxJ7oOlFw82B370wL9m1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OIqCxSoC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OIqCxSoC"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7426c44e014so1721760b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748617381; x=1749222181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2x6nqY/oJf6lym3dvzSlsh1P/GwB3GQSW2/esBdiqk=;
        b=OIqCxSoC3nqaRbO0UiKmtHprXH1hxcYPoMJXagMdApFZ9yFiq/lZwRnjYb2U4R07M2
         Y/fLk2FQDThiIH+bgQ7qlo7GijTNhkwJGcBqBQEgQGA+k5zuEMB2ZOoVNl5Gt6cZQ0iM
         78ceSKf4gMVjO727UOY3IrJhBHYyo6pdxCgGqg4gMhz2TSyKBBjeBdiNKhfsxY6BYO0G
         kmqR5HXzpYc1UqTXFnc4nybHdNWIXXuIW0f5/Veo0Yjyyqy2NoM5DpPpAmZwXfvzIvUU
         FJ1PsidFIEu672hGdloLZ/Gg3Do/ntd3P5yCfVGtKOL3CU0QOrl/pcGrX1bBcaUQCOzK
         p5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748617381; x=1749222181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2x6nqY/oJf6lym3dvzSlsh1P/GwB3GQSW2/esBdiqk=;
        b=oiSy/HoqQ+4I+9i95kFd0U1sT5ug2upBwvczQjzL9gEUKMD3OYHwdid2QYl77g44sA
         fT4YD1otRvhbqk3crTnUpv+gpEJ/3GY48XhqOfh3pTDJjgwgLGwisXYXl6oxxvCZe2Zj
         jkwC+3PEIl5KmU/5vu5Mz4GpOJXbOqKaiAI18injCK3dymx/nIA61/vssFH7LkXshwuS
         PnGCzISzLY7NsNXvpNTCDvwFozCjnKReqnd0wEEOIB/V7b4j7TrD14hYo26p/ebrTRVf
         rWQJjXQMkq4YvcLKbUozpemr90qjffjrrQ44FKvt1H0cKK0ayMIIfdbFb3UnSSNkcT7L
         fkTg==
X-Forwarded-Encrypted: i=1; AJvYcCWhdRYUKQ2eMcaGRcb13XmhW1G1f255RIs715rtCcYW0+4bGMhwrZgoQE5s+L+j46XrI/oRy262IJzCt1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWUmjLZ2fYPVO8VumE2P5lUl9xyWOQE9JhPC/PQRZAM7HF2Vda
	Egz5fyiifPHMISfNJruPlgEMRixptOHvtSMlRP6q3yrumm4MeiiHd3zSNO9btzSFpYE=
X-Gm-Gg: ASbGncv8eCxcHjWyDE++MLvhK4709XyjdzkP/oFW6oCdoo6Y/9wctqcmMFXbxxpkpOQ
	qIcZFa9ziKILsDoXY+hn2rfZjzUen3ctjvdEG4zDJk+0q6IYOTTGPxihAKSTo3+qcx4YaM38WZl
	iLfY8WIU0M+HChzzLTSrXihTIz+UdSe1JfiBmIwyJzFG+VIXBU4h6XB+KYQJtStOD9S8Ib9KfB+
	2Zys7luA+eL76Y+BMLw5RiscEm7mPnmp80+78i6UUE3YvMzAcrXsTfaq5ksRI5/1KlRr/Q7Xy3m
	fKvLAmj+XpDF458zhhdxqmu5n8w2Km5EqoSPVut5U8y3lxg6tmgInDfKMPE5RB6658iZAu1TWiP
	vSdiXOZDBE2xSHxifHHHK
X-Google-Smtp-Source: AGHT+IEbSYgs45yP9EJTHXCEAefVhvoqi93ox6SrknNujMMfPZNhkkoVVNCC3OTz0vXhIcm0FcEENg==
X-Received: by 2002:a05:6a00:99c:b0:742:3fe0:8289 with SMTP id d2e1a72fcca58-747bda0929amr4750597b3a.20.1748617380979;
        Fri, 30 May 2025 08:03:00 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab4acsm3147922b3a.43.2025.05.30.08.02.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 May 2025 08:03:00 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: akpm@linux-foundation.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH] gup: optimize longterm pin_user_pages() for large folio
Date: Fri, 30 May 2025 23:02:54 +0800
Message-ID: <20250530150254.52362-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <6f5e3238-9750-40db-8fe1-88d28655a988@redhat.com>
References: <6f5e3238-9750-40db-8fe1-88d28655a988@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2025 15:08:06 +0200, david@redhat.com wrote:

> >>> diff --git a/mm/gup.c b/mm/gup.c
> >>> index 84461d384ae2..8c11418036e2 100644
> >>> --- a/mm/gup.c
> >>> +++ b/mm/gup.c
> >>> @@ -2317,6 +2317,25 @@ static void pofs_unpin(struct pages_or_folios *pofs)
> >>>    		unpin_user_pages(pofs->pages, pofs->nr_entries);
> >>>    }
> >>>    
> >>> +static struct folio *pofs_next_folio(struct folio *folio,
> >>> +				struct pages_or_folios *pofs, long *index_ptr)
> >>> +{
> >>> +	long i = *index_ptr + 1;
> >>> +	unsigned long nr_pages = folio_nr_pages(folio);
> >>> +
> >>> +	if (!pofs->has_folios)
> >>> +		while ((i < pofs->nr_entries) &&
> >>> +			/* Is this page part of this folio? */
> >>> +			(folio_page_idx(folio, pofs->pages[i]) < nr_pages))
> >>
> >> passing in a page that does not belong to the folio looks shaky and not
> >> future proof.
> >>
> >> folio_page() == folio
> >>
> >> is cleaner
> > 
> > Yes, this approach is cleaner. However, when obtaining a folio
> > corresponding to a page through the page_folio() interface,
> 
> Right, I meant page_folio().
> 
> > READ_ONCE() is used internally to read from memory, which results
> > in the performance of pin_user_pages() being worse than before.
> 
> See contig_pages in [1] how it can be done using folio_page().
> 
> [1] 
> https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/T/#u

Thank you for your suggestion. It is indeed a good idea. I
initially thought along the same lines. However, I found that
the conditions for optimization here are slightly different
from those in contig_pages(). Here, it is only necessary to
ensure that the page is within the folio, rather than
requiring contiguity.

I have made some preliminary attempts: using the method of
contig_pages() still gets an optimization effect of
approximately 73%. On the other hand, if we use the following
code to determine whether page_to_pfn(pofs->pages[i]) belongs
to the range
[folio_pfn(folio), folio_pfn(folio) + folio_nr_pages(folio)),
the optimization effect is about 70%. I sincerely hope to
hear your thoughts on which solution you might favor.

+static struct folio *pofs_next_folio(struct folio *folio,
+		struct pages_or_folios *pofs, long *index_ptr)
+{
+	long i = *index_ptr + 1;
+
+	if (!pofs->has_folios) {
+		unsigned long start_pfn = folio_pfn(folio);
+		unsigned long end_pfn = start_pfn + folio_nr_pages(folio);
+
+		for (; i < pofs->nr_entries; i++) {
+			unsigned long pfn = page_to_pfn(pofs->pages[i]);
+
+			/* Is this page part of this folio? */
+			if ((pfn < start_pfn) || (pfn >= end_pfn))
+				break;
+		}
+	}
+
+	if (unlikely(i == pofs->nr_entries))
+		return NULL;
+	*index_ptr = i;
+
+	return pofs_get_folio(pofs, i);
+}

Thanks,
Zhe
