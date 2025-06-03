Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D8618FC89
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748937771; cv=none; b=aGNxv2C3X8xSpdbSOisUR7T2T56yyqaaLLgeaV2GUH3FywA3YZoSvMJoDl29jVL6/I5GSczgJS+1a2ZrelUIvyiDkax1XgOo5eFkACGybmfG1/7Mme+wjSmH/kAcrlCMT2RPGv52QjfahzWLOkPiC0j7ulw4Ghdo7hGAd+RmsQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748937771; c=relaxed/simple;
	bh=LshEQKPIrp4vjxhxjjQN1XZLm7tcnFkV9gL4J0xXzUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iFh5pJSodvtLuP1whwiGWATmH33a7wJ4TKIRc8I8Hu7a5Ns5gIW7OzHdDhuf6N/YesTtoEEE4deI8Pjbh8fkuLFirfQ6jBSj8FbkARYKv9talqCAoWQB8lDI4HkteEtjuWAIp+Xpq4DvjYNEQNvrtFq6jJgJR4FWyMqakanGwvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yMNWBcTc; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yMNWBcTc"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-736f1953673so745532a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748937769; x=1749542569; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HLBYGlpww/+1MzmEKDqq4eaV65jEM2T+DRCw/0ZE+4=;
        b=yMNWBcTckUWe44FSq2uAOms6U7vAgwQXGUCM4Ef8VxbVpk49FLDJ22ozTrR2TbpLoo
         fPJToW6tEAjN1FL+EsrRDj9mO8nMcqOkaAL6VphqAKU7QxTHupmhY+9XaWZXRLm6YMpH
         PM9SgUPUb7e7F7wEeCc2rcfew5je2PubzfMpWL9v4cey7wdrZudG0asr22vSsvWlTrOW
         z+SRT53hxhzURvPGTIQ/vdweGZ8ic5iDmPkL/qE+v2Xo7s1Bjs4BDeyatypsc5iXmRVD
         1PptZo72X08XybNGM+bhPNIL8GI7xTh0L02r2PUJbb/ItaZrREiOUTpewmW7AvK6y/oU
         x6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748937769; x=1749542569;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HLBYGlpww/+1MzmEKDqq4eaV65jEM2T+DRCw/0ZE+4=;
        b=VcFJGYlhMek4C1YVFjQIRAIn8hQsZSANnE10aLPlN/HNQhuZMlObG02XliDn7j/X9f
         XWsYofCnUiBC0+q8ay6+h/AdOrRVrT3w7hGLBU9Mr/7XqFgCGbCfBbHXPQeRU2zYkSNF
         ahjde3qK+cKE/MZRG0oPsK8RrDgoS/nfNta5d3PmToUiL6GK+JLvnZpNpTpl7sMtD4b1
         amSsJgBCjsspBITH0UdJrk/LfwaEsXmWjnyW6Oxf6cxJicgdrDSTv1x30JAKbwS5YOuV
         E9NZteMukD2AkmNwlmW45TR1UiaxKzsETHn+gHd9IaBSRmuNSrvud4LF4bHo8B5BIT0E
         6lnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy3U9RatF7Pl6X0306qymB/eOlEvXiwlZa8IlAGDFwMl4jlkjx5/JFKbXMz2InT/e/Alx+ygOoV3SxfNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDsch5mKm+hr3d+x6zxL22Xpb209r3spWr6wVZW0PkW1Ieavyy
	qnm9knB3vDnflmhW1c2ilAlEOrSSjAlZeiWpy0zewllQALAiZiZ9P0lmEh7+IUHApBOKHbd3BTY
	21sIQdQ==
X-Gm-Gg: ASbGncuftVzEx9ivXmK6VYsXj4BraNlQ1DeZTKlzAr6GUXLv0Xj+aK5+o2CWo6NKxfP
	Iezay1lhf4mhbcvBpZw6vxXTRT/UpxdxoxoFE4fGsRxu8cz/I85QbFoGZqrGunTd4fFWyNqPGdd
	Nbv43ybfqg0OuJ4O7snAkxnxK8pqVAp9vI+aWolAfjHaa8v9Tc0tzeIPVAfzNFLiZfmQyKtBEgI
	UUyHPg1d5lHqAfIHsp7BJIyKeIojF5Vpm4k6EClGtJCGdrmRzxrOJFefWrAOXJkiDp2GxwcIMgE
	YYrfkMTn7KPLJKlFc4Osy/C5/CZws7vlmqp8SL+iDmVdWJXG5RRkjRbOf27KWK5ryGH2reKthMI
	Y1ggbgwsTie963bzBR/la5BOfHx0Qk33ScrvHJFGp+URnrA==
X-Google-Smtp-Source: AGHT+IEf/pvdRCc0yPxQTyamCWZqTN07/uE+fxpl7sTiXcCkaFOeFqsFX5EIoAjgjN+C0geyBSZbqw==
X-Received: by 2002:a05:6830:a8f:b0:734:f5e2:8cbc with SMTP id 46e09a7af769-736ece491c2mr9433737a34.18.1748937768868;
        Tue, 03 Jun 2025 01:02:48 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af9ef459sm1805058a34.61.2025.06.03.01.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 01:02:47 -0700 (PDT)
Date: Tue, 3 Jun 2025 01:02:36 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Matthew Wilcox <willy@infradead.org>
cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-mm@kvack.org, Hugh Dickins <hughd@google.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
In-Reply-To: <aD4boBrdZXtz_5kL@casper.infradead.org>
Message-ID: <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
References: <20250602170500.48713a2b@gandalf.local.home> <20250602171458.7ceabb1c@gandalf.local.home> <aD4boBrdZXtz_5kL@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Jun 2025, Matthew Wilcox wrote:
> On Mon, Jun 02, 2025 at 05:14:58PM -0400, Steven Rostedt wrote:
> > On Mon, 2 Jun 2025 17:05:00 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > 
> > > From: Steven Rostedt <rostedt@goodmis.org>
> > > 
> > > When CONFIG_SHMEM is not set, the following compiler error occurs:
> > > 
> > > ld: vmlinux.o: in function `ttm_backup_backup_page':
> > 
> > I'm not sure this is the right fix or not.
> 
> > > +int shmem_writeout(struct folio *folio, struct writeback_control *wbc)
> > > +{
> > > +	return 0;
> > 
> > Perhaps this should return:
> > 
> > 	return swap_writeout(folio, wbc);
> 
> I don't think so.  ttm_backup_backup_page() gets its page from:
> 
>         to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
> ...
>                 ret = shmem_writeout(to_folio, &wbc);
> 
> and if you look at the implementation of shmem_read_folio_gfp() does:
> 
> #else
>         /*
>          * The tiny !SHMEM case uses ramfs without swap
>          */
>         return mapping_read_folio_gfp(mapping, index, gfp);
> #endif
> 
> so I would say that if anybody is actually using it this way (and 99%
> chance they're not), they literally cannot write back the folio.  So
> I think your initial patch is fine.

Agreed that ramfs does not use swap, so calling swap_writepage() would
be weird.  But, thanks for the build fix Steve, but it cannot be right
because return 0 says shmem_writeout() successfully sent the page to
swap, and that has unlocked the page (or soon will do so).  It should
return an error (-ENXIO?), but I haven't checked what the callers do with
that, nor whether they need the folio to be redirtied.  And wouldn't it
need an EXPORT like the real one?  Sorry, can't keep up, there are many
many things I should have looked at but have not... Tomorrow?

Hugh
