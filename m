Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465421C9EE
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748607613; cv=none; b=Uxaibj2uoD08oRA+AbtkZ099H9YrqhR/keI4mQYcTQP0cE7LgnsgFnP03NsSHqfkeMquBD5NcH7NMeV7jzAIrklsY0ZUieFPUe9CyAEcXoFohs5Z1Vh7buyAOJKDy+4ZQ3y44PDRJS7aNkzjow3fhydPyv4M5iD5WPAe1leE9iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748607613; c=relaxed/simple;
	bh=Jn4kRM73bkmQ53+JkTUDGYTN55oniv/gib2YYcJqFtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMg8FUNLrp46yqtLcGT4acBXi4CzzKgUv18ip/uZTGW1nb5T6m1o+I2oR/Wd0KXldgcan1Tp7sy2TWi1vzlZWbyefdI/tPUaHo1WfIBvvaEn/chUYAsIbGLp6VHru3PRrLEpU+EAgYHD+/yNr3Hrs5svb3PhApmgDuwcF3v7GGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=doZt437b; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="doZt437b"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2350fc2591dso12095995ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748607611; x=1749212411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVX/fq17IZ0Mm65tm69m9qikaxT2MG0++vNA13gmJdc=;
        b=doZt437b0e3j8mwFNRbtMLOXsbj+8AMhmDgXQBNFJzp3L5sydEaf9n+RQsSoDANd0l
         8pFPM24+nDK7L4d5oADb+KBiqeF7/A02GcMWoZDeVqM7uc0NA2xAuPM9WPQ93jrOqQQl
         QMMC+ukuKil6uCG2YtxtB4hqU75xnmduKKOoYRpVw6P79bQBYGXpqzjN4icmKAMhWhju
         hncsj/H0+W9pqtOIiPm9iRJb6wvfOJ56JtVtFbIXVjSTtzCyUzfGzXTirYX8OlOdYTmH
         ojxjx9/IkzuGxB3RK425q/6Z4i86Vn22PSAK4f1X5u9YxSe1U/cDvG2a1bFSULniAniK
         Splg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748607611; x=1749212411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVX/fq17IZ0Mm65tm69m9qikaxT2MG0++vNA13gmJdc=;
        b=Yn2mQ6/FUUrt1Oj3IfvoYEoyxXFix7qsyGJ4vEukte96QxlPMkzqLWaHfzZ/5Shi5Y
         T1oMUXsxH0yNuL+fKsDE0i1bm3ubLh1h33lKwCLeBHZcriimJX5B7fL8n3WK6c+PeLmT
         /QhaImqQENZi4r1qEdt91i06MBKTeyD3QEs5XNDWKGFcrOikHG4r5DX/sZmKvpfM7O7A
         fwRzvm/QHjoHgmX7p+KzURe4Y1ZfDf3fcXPnXjRK86EZGmnatdcVqBdzjDS/ADxBhCbh
         v4MMChDGeStxF0rXjPHpmX1XlGByGzK8w6st38TyBf2jvAfwmm4jm2btMIwYdKCTfsOd
         a7BA==
X-Forwarded-Encrypted: i=1; AJvYcCWuNctn2d+5KXvB+Bg14BafsTAS1f6oCc5mJZRsYrBAWONa57nX+fI2u0dJTfUwvjDoJcaU9fGZ87v/Ttw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6F7xolB4aoncrSKEsYUtzOmXLwINp7uFBjZRqFpDfYQyTrwBa
	nMcgfkGtVhXis3BPBvqnj/6DouJULsxFMvlVINUKQW+m9AnVZUEfjb1nN7Go+KKd+4tCARIjZOy
	76YdFtDo=
X-Gm-Gg: ASbGncvz6zY6e8rzOFvHmn30QOKKCQ2pXrB3EG4a74BZLemVYDSHR1+nC1ClBZwEHwN
	j5kuZwXkIZ3K1uS6cub0cER6FvZnq8oOpHhwcCa0uSugSOayZRybiBDvh30XubM6qOgE7W4s0BA
	EN3+oS+ts/iRN0L2MWIyGAOEGs3Vq9qlo+OsDlbovW1L9Xu82A+Wjv3XNNyBg7wJ0JNfwXSdKp3
	GFBQk6y/CaRSTANrZAKC5vIzLylAuUHrg94Pud2/eqO+6df/FSvpW2wVg35dgSDE2EcAuBh1/nR
	aNN6NVMSyCYWpoWq7lYiiszfZHSO4uSaWwhjnLpg+rjAgfnoJbpy48LtC94vhzA336w0d5GEjfF
	a3uQ=
X-Google-Smtp-Source: AGHT+IFyawdNLxKKpOA2yzMb22+sXYnk0MR0MJj7pdjyGbLyRuPeq/XfzsI6szDaRh1omT087EqOTw==
X-Received: by 2002:a17:903:2a8e:b0:234:2d80:36 with SMTP id d9443c01a7336-234f68dbb53mr120049685ad.14.1748607610592;
        Fri, 30 May 2025 05:20:10 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d209f5sm27146855ad.252.2025.05.30.05.20.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 May 2025 05:20:10 -0700 (PDT)
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
Date: Fri, 30 May 2025 20:20:03 +0800
Message-ID: <20250530122003.44555-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <a98bc945-0020-40ce-a650-47dcd0274001@redhat.com>
References: <a98bc945-0020-40ce-a650-47dcd0274001@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2025 13:31:26 +0200, david@redhat.com wrote:

> On 30.05.25 11:23, lizhe.67@bytedance.com wrote:
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > In the current implementation of the longterm pin_user_pages() function,
> > we invoke the collect_longterm_unpinnable_folios() function. This function
> > iterates through the list to check whether each folio belongs to the
> > "longterm_unpinnabled" category. The folios in this list essentially
> > correspond to a contiguous region of user-space addresses, with each folio
> > representing a physical address in increments of PAGESIZE. If this
> > user-space address range is mapped with large folio, we can optimize the
> > performance of function pin_user_pages() by reducing the number of if-else
> > branches and the frequency of memory accesses using READ_ONCE. This patch
> > leverages this approach to achieve performance improvements.
> > 
> > The performance test results obtained through the gup_test tool from the
> > kernel source tree are as follows. We achieve an improvement of over 75%
> > for large folio with pagesize=2M. For normal page, we have only observed
> > a very slight degradation in performance.
> > 
> > Without this patch:
> > 
> >      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:13623 put:10799 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:129733 put:31753 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > With this patch:
> > 
> >      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:3386 put:10844 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
> >      TAP version 13
> >      1..1
> >      # PIN_LONGTERM_BENCHMARK: Time: get:131652 put:31393 us#
> >      ok 1 ioctl status 0
> >      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > ---
> >   mm/gup.c | 31 +++++++++++++++++++++++--------
> >   1 file changed, 23 insertions(+), 8 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 84461d384ae2..8c11418036e2 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2317,6 +2317,25 @@ static void pofs_unpin(struct pages_or_folios *pofs)
> >   		unpin_user_pages(pofs->pages, pofs->nr_entries);
> >   }
> >   
> > +static struct folio *pofs_next_folio(struct folio *folio,
> > +				struct pages_or_folios *pofs, long *index_ptr)
> > +{
> > +	long i = *index_ptr + 1;
> > +	unsigned long nr_pages = folio_nr_pages(folio);
> > +
> > +	if (!pofs->has_folios)
> > +		while ((i < pofs->nr_entries) &&
> > +			/* Is this page part of this folio? */
> > +			(folio_page_idx(folio, pofs->pages[i]) < nr_pages))
> 
> passing in a page that does not belong to the folio looks shaky and not 
> future proof.
> 
> folio_page() == folio
> 
> is cleaner

Yes, this approach is cleaner. However, when obtaining a folio
corresponding to a page through the page_folio() interface,
READ_ONCE() is used internally to read from memory, which results
in the performance of pin_user_pages() being worse than before.
Could you please suggest an alternative approach to address this
problem?

Thanks,
Zhe
