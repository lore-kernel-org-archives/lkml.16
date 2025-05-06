Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A3B158538
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746559400; cv=none; b=WoQhkjW0QSiRk88hBBbJNXALfsxZOOGMPdCdrsOc/ok8/efMt5TO3lmhp930NdX8g0GP0n687Jd+DE161TFCzPYQDde5zAI2lMHae+Pylku4KgaVyR1iLLHXe3MS0cOgt2DCedt3GTXYm14fajxtRVCwfEoR4ZC/WvbD8emhYqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746559400; c=relaxed/simple;
	bh=JXwvNmUGY5Rp9nbfjwRP1kb0d04rlCLFkc3CvzDIZXg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doczRapl6csGZky5OC4+iz2iD42A7mas1rbJvyKYg0XjqHwr5JGirZqBpvrk3B9nweMWB+vx+QeEsjiLWlT+WIOJi2DejZHVdl/ofxHPoV8zksd37k7tdY/5l8wbwgns6SKOFHuvPZSOWqIgq8W5hb6IjLTyRstLI8sIgqcHqEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSgNP7Wn; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSgNP7Wn"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af50f56b862so4256536a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746559398; x=1747164198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1C8SA1mk9A5OP3mj+vvhNYYeMx2fYijbXtLOmpd6G8U=;
        b=fSgNP7Wn0/ma3jidXZcqjDJdXMzl52ub2xiVbFeZr68CeGg/xb88YTeJCg2K3C25UL
         GDaScKCqjt4Xota5VN6W2Ht8ho5Oyhz3+xvR50KhhXB/Nj75PbxX1a5OFh9LYGtrnsv2
         u9fDhQQpeBYzWGKj6LvjoofkqlTRlBBwEft91HHwKXRsZ0LAKnxnRzuTh4rf02gupcdq
         U5hcFTbI8cvQnSgOBTRFtolD28NVZz5OiGksQc5tpBpUbKRF0ObeSWUeyn15vz5cXayy
         y9LcJoB4ohlF68mUJrRLDAaLN8qZfWunIHjBBVEez0Fq9igY2UOJu66Ablsy9vBg4xl+
         5xBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746559398; x=1747164198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C8SA1mk9A5OP3mj+vvhNYYeMx2fYijbXtLOmpd6G8U=;
        b=eJutwitLDTMPNTJ9RdVGBL4GJowPvRlTqLRz2Rbh/NuVGaMzBQnWAtIA4BAZoU00LX
         +f9OnKzLdZJ6eYV4W41FePlM/YjAjfs2mU70nDP6db6FOZoZlMKCDxL1EtcWpdOG5uBX
         avH+/uk4HDf8pwZoJ4hCa8Zoq33UlazR/VCz0MqPUEdrLaNMEwx8b2xVa1RRKpR+hKfq
         EWNrAXhdWW0Wrn/xd79nK675TZvUkk79DsFE0pEFGETL0sNkuZHa/SXTOUHQqdHCjaME
         Q+9+epzPud3c1/z4750HwF1RZVhLxQSZKhHxhZ+R7U0Nn0jL80lzjBxlGYioToQpfjd4
         bAug==
X-Forwarded-Encrypted: i=1; AJvYcCU/UjZX/EpsQtrs546v8vuAY0cwKpsfg2NKEUrpOm8grWwVKMylfzDRJ8kfXAKr3b6G0sU0+wV8owfui4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI8KjMtsXwFClX1ytPcmEgNt2fNsaa5lvot1r5Y73LBCL1aa3d
	zaVjAhuezohDPFH8PhJxbw1TzujxFHj2QCbtwFBbuSuiuDy5jNmo
X-Gm-Gg: ASbGnctctmjjX3ZVtL1EBgap5dSjox++MZ47e2LxDtIs+EFc3fA3oBWez7O8dAhRqNm
	0bfl9GJTR6nHcYMEVivz6NcTMEaqE8Zg3VM6GYX2KihNKpMklbu+MH9tdBXSUCss4ZJaGRBKo+n
	HCB8Gzk//Xu+lo1b+tUDTe8+B3n1RT8fqi4a88q/dgQoj2hU2q+K/d3beFVCcJQnwz1/RK5REFq
	25q//FS01xyrkh7OWEs9oH7idKZhieFvosvg17lF87nKYvaCiu5wsOMYslf/+0dLXd8hnj+wUMM
	qqnTiOnmLZNR84u36VlaR8toShbD71g=
X-Google-Smtp-Source: AGHT+IGslbzQxQPOsnF7iVmmTW83x3b8B6TmcHa49T+CWfLk80V9sI8dKCWCYWqY9ayQbfuJ6snOHQ==
X-Received: by 2002:a05:6a20:3941:b0:1f5:6e00:14c4 with SMTP id adf61e73a8af0-2148d891a92mr492719637.42.1746559398069;
        Tue, 06 May 2025 12:23:18 -0700 (PDT)
Received: from lg ([2601:646:8f03:9fee:3afe:d39d:8565:ed44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d0desm9647634b3a.137.2025.05.06.12.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 12:23:17 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Tue, 6 May 2025 12:23:15 -0700
To: Matthew Wilcox <willy@infradead.org>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, osalvador@suse.de,
	mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/1] Convert is_migrate_isolate_page() to
 is_migrate_isolate_folio()
Message-ID: <aBpho6pICFz-0Mbw@lg>
References: <20250506184155.587070-1-nifan.cxl@gmail.com>
 <aBpeR5E6XoneDcEj@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBpeR5E6XoneDcEj@casper.infradead.org>

On Tue, May 06, 2025 at 08:08:55PM +0100, Matthew Wilcox wrote:
> On Tue, May 06, 2025 at 11:38:28AM -0700, nifan.cxl@gmail.com wrote:
> > From: Fan Ni <fan.ni@samsung.com>
> > 
> > Sending out this patch per Matthew Wilcox's suggestion 
> > that we need to convert is_migrate_isolate_page() to use folio
> > https://lore.kernel.org/linux-mm/Z_XmUrbxKtYmzmJ6@casper.infradead.org/
> 
> That's not what I said!
> 
> This is what I said:
> > >  
> > > -		if (is_migrate_isolate_page(&folio->page))
> > > +		if (is_migrate_isolate_page(folio_page(folio, 0)))
> > >  			continue;
> >
> > I think we need an is_migrate_isolate_folio() instead of this.
> 
> > However, when looking into the code, I have noticed that among the uers
> > of is_migrate_isolate_page(), in most cases the page passed in is from a 
> > a pageblock. 
> > I am not sure how we should proceed with these cases.
> > Should we deal with pageblock or just leave it as it is and only do the page
> > to folio conversion for the pages within?
> 
> Neither.  Add a folio_test_migrate_isolate() in addition to
> is_migrate_isolate_page().  Don't force a conversion as it's a
> legitimate question to ask of pages as well as of folios.
> And some of the pages you want to ask it of may well not be part of
> folios (they may be part of a slab or some other memdesc).

Oh. I misunderstood "we need ... instead of .." :-(.
Thanks for the the clarification.

Another separate question.

We have a free_frozen_pages(page, order), which have two types of users
1) head page and order directly from a struct folio; or
2) page pointer that does not neccesarily be the head page of a
folio and order that may not be directly related to a folio;

Does it make sense to introduce a dedicate function like
free_frozen_folio(struct folio *folio) to handle case 1)?

Fan



-- 
Fan Ni
