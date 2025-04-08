Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E7E22A1E9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128134; cv=none; b=n979vMS2JUIJ3ZWqKCrGsBcIT39W4KkTTIZW47nyBHQ5oPZv78bNWFdgaeSWBcvWEXiIuKZUe71OM1S5JYP3KiN9RriWzmjJbX7S1vhEgWWjk4NhOgXMx7vYR1usU3hukC0f51vAISICnisRJqB1qdZhiVZbKVdIpWx1exsh2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128134; c=relaxed/simple;
	bh=ua35gafZF1A4K0YG0eEnwnnKvsW+nl+s7nsdGhtouvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2AQjXn+AmndUa2vuPQhUDLrYvqJr6PlAT+Vvamyx+jtUHh0QWQ5EXF3nMn67NvohHW3kn0GlMl18IY2p6miBU8xCWQzjzdXo4iUN8aVrNtBmYqedBDpJWRa4MMAqf/oLpD3Ey9FOTJxV46p2ADO4HpWK+NCf28jEPcHGSt2OY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=CuWHE3l9; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="CuWHE3l9"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so67521966d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744128130; x=1744732930; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bCjGmw1vXl9thWoRbkSC+uB4IS67BhRqqql+mnE2/qs=;
        b=CuWHE3l9iV/ksVPlbUsaHMDVFHJKOB5FsH64ZshZHJKR0rz96nAyehk7b71dtmvMT/
         lTqHGy2iiptdxtWV/BCSxmbczR4/QB+ws6JW9zZIKX488WMtuf4spL0tt3dSyybKz3H9
         lqgnVbxUIAbc2OlRGhhOWQXEcV6egI+S2maKY9V0Ub2tJF5BKe/Ezw0dOMJGA5DZ/iF6
         qWXhnAcEs1DoBCtJ5tkeKqcE5kJarNvSH2ZtZ6f7b+00smr908eIK9q9nSAM+RsLguN4
         v1KT32Z7PD9/it7rv3UsKdSweSc47bQQpZMyeFshZQ9XM7fWvSENJFfPKXYUNex9NCXk
         OJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744128130; x=1744732930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCjGmw1vXl9thWoRbkSC+uB4IS67BhRqqql+mnE2/qs=;
        b=iSg+/pwfgLVdXE8LK93OxRxXL3b2WmQ+AFhaS6zbcyYqRJl7EW3OH0dIDk/oh1vvoj
         Xsc3t3rawTvBA51+nowZStoB5atcjk+uF5z7uVRjbGfqsPWaGe8MX23PQhhOG+HYp0XS
         u6RpNEMv5DYBUj/U6090tycNhYxQx+Q0PhGs9NnV6YYafhsmQOUJhwaVsCHO3l2JvFag
         ax+CmL6y4vOb3i4DNTVa6GANsrfGBQTMofRUKRedBTfClIhh1qgTs1TyCGCZTc9+62e4
         e/0PClnRkyEhmpWqvtBaBloiB+HK5+qth9NZWHNsd1JfP0UX9oc9bVKrxUtTVGH7IHYh
         949Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9Y5BtV9z2x4Typ76n43AyI3Ecf3ETdxewoJBhO2ujyiqPCYHlFQSdiIHo1E0wSpgjNzS9GLVLJo8EJ4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzopMX8RHxVw2RqssOpH7Ea/mxwjy/5nj3G3fbSz+Gmc26hFoky
	8ETRfftWGDcnhtZFnZB0WiBZlN5KrE1hEdr7HiNuEV8g1e2gF0UNThRkz0IuUjg=
X-Gm-Gg: ASbGncuEP6s5yXFSDy62tCUFI5/90yknw5NUmPizS/VEQgZFvhXcr/mavSK/pWlHJHE
	8GiJOFiySvbzUv7H1806/cS/qGfJbQlht0lliaKs5rdZOn+3/6GQflZ304aknGZWTuU0AMIUAch
	ZHxpaC+H6FSvTDJ0sfvjBZiJQKwJBSECyy3K2VKKY29Yha1OapR0/RMDNBxPQ8CDrixAWYIu8HJ
	PSqo/whE3kMxRGBQ60b08wIhKQjVpqwiMvsyTHoZRtNGLjqJceiIksfWgQqozQJB0rGGiuACARe
	5wkgSljsN4Q+AuaHJaDsiRM6qIDLdWGsSXLVxAZZ7K0=
X-Google-Smtp-Source: AGHT+IGDcXxOmi0/rDvqnBIwEOyIVIbiIx9MiviNaB4LFUm08hStl7PcyrU2RNIcA6KEjVahDlPwtA==
X-Received: by 2002:ad4:5f0a:0:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6f00dfa2c08mr309611376d6.19.1744128130436;
        Tue, 08 Apr 2025 09:02:10 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f139490sm75420316d6.93.2025.04.08.09.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:02:09 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:02:05 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
	willy@infradead.org, david@redhat.com, 21cnbao@gmail.com,
	ryan.roberts@arm.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
Message-ID: <20250408160205.GD816@cmpxchg.org>
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <282545E0-5B66-492D-B63F-838C6F066A22@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <282545E0-5B66-492D-B63F-838C6F066A22@nvidia.com>

On Tue, Apr 08, 2025 at 11:29:43AM -0400, Zi Yan wrote:
> On 8 Apr 2025, at 9:16, Baolin Wang wrote:
> 
> > When investigating performance issues during file folio unmap, I noticed some
> > behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
> > For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
> > folio as having seen activity, but this is not done for PMD-sized folios.
> >
> > This might not cause obvious issues, but a potential problem could be that,
> > it might lead to more frequent refaults of PMD-sized file folios under memory
> > pressure. Therefore, I am unsure whether the folio_mark_accessed() should be

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

> How likely will the system get PMD-sized file folios when it is under
> memory pressure? Johannes’ recent patch increases THP allocation successful
> rate, maybe it was not happening before but will be after the patch?

It's not so much about whether the refault can construct a THP again,
but whether we should have evicted this data under pressure to begin
with. It's more about IO and paging. And it's the same consideration
why we transfer the young bit for base pages.

Sometimes file contents are only accessed through relatively
short-lived mappings. But they can nevertheless be accessed a lot and
be hot. It's important to not lose that information on unmap, and end
up kicking out a frequently used cache page.

> > added for PMD-sized file folios?
> 
> Do you see any performance change after your patch?
> 
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > ---
> >  mm/huge_memory.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 6ac6d468af0d..b3ade7ac5bbf 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >  				zap_deposited_table(tlb->mm, pmd);
> >  			add_mm_counter(tlb->mm, mm_counter_file(folio),
> >  				       -HPAGE_PMD_NR);
> > +
> > +			if (flush_needed && pmd_young(orig_pmd) &&
> > +			    likely(vma_has_recency(vma)))
> > +				folio_mark_accessed(folio);
> >  		}
> >
> >  		spin_unlock(ptl);
> > -- 
> > 2.43.5
