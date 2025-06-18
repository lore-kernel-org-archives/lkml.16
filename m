Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50C3594C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247194; cv=none; b=pDBl0AKb+LYRt2WfoWxT0bLHH5rmhKXP34HS5am+HsLAPBYYTv1ncozExlzPGtAlwYS3GUV7T2T70ogQy7fCS294yv311hJbXlypTMl2OHDVo18YCX5k1eMU1tyqf3yiA0Q/bRgKt6LEItPsCif1qVMRe75HKoy5EFkNZMi5Ug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247194; c=relaxed/simple;
	bh=BQPuT5fv8iLkb6eIPg3WGtds6HKhuEhOQB+fBvWc7VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLbdqv1Tu2Lk+KHUo8EwjQHU4jocEuLMtnejj7p49h/1jrS3SFQeiU2zygvQexbwwGDXqLVy50FeMORjrLe34y1LLwJTkMY/0c2k0YjaeBTK012MmNe5JSzFA2mEzbgbrIJ2bGMPerQDn5YZW5x37oraSGVgSLClOx7BUytZtAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QGUzTAdI; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QGUzTAdI"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5f720c717so68346785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750247191; x=1750851991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wxDAXtg4Qo50atD2TXEt4R3fx9+/jlU++z8cat2peU=;
        b=QGUzTAdI694LBdh1Ms/xu3bgW4MI3f7zx6lpx09zu5EcDpyR3HZdQvGe8E1W5Q5or+
         IrIrH8Q8C6llD4p+LeNNmm3iDa74WtKHwNq1hFNo/EL1Z+gH7EiZn9mTsWtjcBgtFhl7
         5MTdrD+WQ1nczjRs2CzRxM6CIG3w3xZ+igJHuRkYFgSlZsqnzTOGUSLZ0fTy8KiWQzdM
         81SLxaha1fYT9i2Fz95sO/EK2oYncpT4mqKiRzWeI6RiItHq7+0T9XDA0HsBVG8VPZ/d
         Fb9UjrwAJ1WwNF8ypcfLFfgld7sf53s3MEldKOtk+qziOeOxk+xkMHUWd4144FrRR74b
         C1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247191; x=1750851991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wxDAXtg4Qo50atD2TXEt4R3fx9+/jlU++z8cat2peU=;
        b=xLaRhZxCILv8l9//n0JZpcAVyXDNwVR5qbK7wzzURbCtZ6eEaObaqCvAa6MiVPdwRD
         Hxk2269DCSjrHhADji9MYPZSQRdar3zfLHpTlf74C0tlV9KKEzarOYqlrbYDWfX4S8js
         R7v5cH/RYxYk4jpjiR7T1Y6s0QMy5sI/ZaVulJ6Gd3ZGxtD7bj1b4Gj/lFXauk3seFpF
         MEEVmBGPmVFDwAMVibZhHXGAGknJn+RFx3MLnuq7CH5qj5IReoiudlnmS6wgKVcc8gnV
         ZlztlnwU6KdOrAHub54lT1NVudxfdcYAEjLxHY8bwbvohQPDzsMzeIKAWZXFoRrTGE0U
         ZY7g==
X-Forwarded-Encrypted: i=1; AJvYcCWMle67wG2JArE4wJSjfUtCW2al4mDSmDYvcmbJGCpaNTX5fVAHwbegmAUco+/Nj/lFXqv1Xqy7bX+MsZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVjchAqlQ/nRUkNCuwbKA+hnQf6SjDFat/XlUu57xqUiZvfjt
	RM7ReMHpYduxSrCFVcxWZsczlevQ+tk3QPwH0HcrPVWQSiPCWRwUbHKRZcl78AkXsu8=
X-Gm-Gg: ASbGncsT+sZSGrBYnqXRJZPZmg/TG8nn+fFUPPhe2KZXG+O0OngV6YaaEe9uDpCJF+2
	bDU0ffovZ0Dm0DoRaAsGvl5Cy6CMjBuddeKCHmn2S17RrSsmNtXTmLJSLHBIHYNdPWznbzs1Fca
	8trvgITWs8YSOrAlgsi/ppGPRbtHTxoDqj0lrZzYM0ZKGJGB+llBpInz9IXAROr/blt4sNhDcDQ
	s8f29WJATpwauUy8jqu77QVAz50XvHSARoODWV0k+rGI3Cb8Mdl6EJGxBRnxmhFV0PvrhIBnAvO
	YinJCF55fTgt3Oz3a+cWpOL2XJtYrVhIrFy1FbX7t+H2nTxIHaF0DjylXG64CSV8oEsO74mvIf/
	mbVuaI4H+sxlA6r83sTy/c5GI6QSL7MfCfn95aA==
X-Google-Smtp-Source: AGHT+IH9ampaEvML5kl4q5XP1ejBHxic8pQJ9EplcrH4aE8+2qiZ3Q+h0D+ADETOd0AZ5S0xxE/VJQ==
X-Received: by 2002:ac8:7d4f:0:b0:4a6:f6e6:7696 with SMTP id d75a77b69052e-4a7645dd6bamr37752941cf.26.1750247190820;
        Wed, 18 Jun 2025 04:46:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4b148esm72211971cf.40.2025.06.18.04.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:46:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRrFN-00000006l9d-25JO;
	Wed, 18 Jun 2025 08:46:29 -0300
Date: Wed, 18 Jun 2025 08:46:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: lizhe.67@bytedance.com, akpm@linux-foundation.org,
	alex.williamson@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Message-ID: <20250618114629.GL1376515@ziepe.ca>
References: <20250617152210.GA1552699@ziepe.ca>
 <20250618062820.8477-1-lizhe.67@bytedance.com>
 <20250618113626.GK1376515@ziepe.ca>
 <9c31da33-8579-414a-9b2a-21d7d8049050@redhat.com>
 <a1d62bf1-59e5-4dd5-926a-d6cdddf3deb5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1d62bf1-59e5-4dd5-926a-d6cdddf3deb5@redhat.com>

On Wed, Jun 18, 2025 at 01:42:09PM +0200, David Hildenbrand wrote:
> On 18.06.25 13:40, David Hildenbrand wrote:
> > On 18.06.25 13:36, Jason Gunthorpe wrote:
> > > On Wed, Jun 18, 2025 at 02:28:20PM +0800, lizhe.67@bytedance.com wrote:
> > > > On Tue, 17 Jun 2025 12:22:10 -0300, jgg@ziepe.ca wrote:
> > > > > +	while (npage) {
> > > > > +		long nr_pages = 1;
> > > > > +
> > > > > +		if (!is_invalid_reserved_pfn(pfn)) {
> > > > > +			struct page *page = pfn_to_page(pfn);
> > > > > +			struct folio *folio = page_folio(page);
> > > > > +			long folio_pages_num = folio_nr_pages(folio);
> > > > > +
> > > > > +			/*
> > > > > +			 * For a folio, it represents a physically
> > > > > +			 * contiguous set of bytes, and all of its pages
> > > > > +			 * share the same invalid/reserved state.
> > > > > +			 *
> > > > > +			 * Here, our PFNs are contiguous. Therefore, if we
> > > > > +			 * detect that the current PFN belongs to a large
> > > > > +			 * folio, we can batch the operations for the next
> > > > > +			 * nr_pages PFNs.
> > > > > +			 */
> > > > > +			if (folio_pages_num > 1)
> > > > > +				nr_pages = min_t(long, npage,
> > > > > +					folio_pages_num -
> > > > > +					folio_page_idx(folio, page));
> > > > > +
> > > > > +			unpin_user_folio_dirty_locked(folio, nr_pages,
> > > > > +					dma->prot & IOMMU_WRITE);
> > > > 
> > > > Are you suggesting that we should directly call
> > > > unpin_user_page_range_dirty_lock() here (patch 3/3) instead?
> > > 
> > > I'm saying you should not have the word 'folio' inside the VFIO. You
> > > accumulate a contiguous range of pfns, by only checking the pfn, and
> > > then call
> > > 
> > > unpin_user_page_range_dirty_lock(pfn_to_page(first_pfn)...);
> > > 
> > > No need for any of this. vfio should never look at the struct page
> > > except as the last moment to pass the range.
> > 
> > Hah, agreed, that's actually simpler and there is no need to factor
> > anything out.
> 
> Ah, no, wait, the problem is that we don't know how many pages we can
> supply, because there might be is_invalid_reserved_pfn() in the range ...

You stop batching when you hit any invalid_reserved_pfn and flush it.

It still has to check read back and check every PFN to make sure it is
contiguous, checking reserved too is not a problemm.

Jason 

