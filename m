Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA523185F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514875; cv=none; b=D1BgNj2XJH7btqX6zBpwjQTaCCIZer07JAdSe60StapPdxzy3JDLcIThKTtY1SgqbwHUePTrYKhm7pCw80lglUT6j/37Ib6jhCZ+YZ2E12aTUwlN6OSDqiDRhNJM6YqJSOGSdfJj6yDgRvpYvWh77TszRhfKOuQAEWIhSQlIrgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514875; c=relaxed/simple;
	bh=HHfHW5GhdKi77KdDlkccgY6Pi8ovtd+IN5UHjbuu1Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdEdgOGMx65QQZ37MG2K4MFDlXYh8ngCe71h/uWwuTbA3NoUfvjWwTRg8a7zpHRolu8/yW/7aZ02FJcHbSpJ4qEVjA8z04u2lOog4mB/SCzFJ8aQUJPOOaRh09n+oggwP0PNiafzeDpDLwz/K8tFZbFuIkSpDBeMtvLWMnlbFPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GP8I1bfb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GP8I1bfb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313a188174fso455997a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751514873; x=1752119673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2iq5gFZkiJ1lOjd6+JzlpZeux9dqvre0Y7nukAvnik=;
        b=GP8I1bfbuwfQpX7tvplZH/w4HLYufvZvgcV4Gs4CRA4Xq2Yb4OY+TpNTEgx1dyIrnN
         2T10H0JHOwl+t2tURJhAf4ZD28KjdDn+xQ6aJmui9WwrdFjv1jjn6MO0M+yhbyZDyJfR
         090yEwgzW7qfr97I3oyXP2RB9sYe6DODdW8y3zjZt9mAVN8My+iYC+DNBLFgcuxE+d/e
         FcjUikG52GrjLlH9Bh6MaIEw0f/k9YC6SBxxlrKzoLByo/9QqWlMnZ0rq4fMcZrMdQpa
         Zf2TVMmDqLmq9fwin8o1AUx8COuHdElulXgrJaAiSCfiM9V1+jupdiMGGCiz22v0FPoA
         H6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751514873; x=1752119673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2iq5gFZkiJ1lOjd6+JzlpZeux9dqvre0Y7nukAvnik=;
        b=hIqwjmkvUTVQckv2O8LuK4/n2d8HS4RF1reUSFmRJtBF/JFzuha+96Hs60R/6mxCKO
         lnB/v5Kp/VZkF05jApCtUR+XxKuZ46XkwZjbzmSNg/Jn6M9QiGU+x9KvOPmAsRAa/9dN
         M7fboDaO2f+flD9ifYSnT2PcSGOX6WXt2/orr3nbVsEsxPia0nqSCY8p43TU5v+untwY
         ZpGBJ7OKPiEhp5RGXsJBK1jGcjQuwiYhXvya32yP1IFkQ9lmpteiOWrIGlCN7FhMOH6x
         gXbznwOHnAz1ETc2CyWbD5aSUD58pvH/kVTGTx4R9dr7ENTqL3L4LA609B0JO5ajF3PB
         mLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkXIZa4RZjwFcMt8C9XRNhncq/NWkhUMjw/mMEVVYQn8LIaKKOmr9EmkHbGL7gFbbDbyNnGP1aWYQ4g0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+GWQubtNqNgZTjR6VwgT3ZQ6Wir9Wf/EBFavTMr2Jioqeab1
	lZMvjfPVCDjXYwgr0vqnBtovyq6Uo0hyYiLi1rkAbcrlRoFGHPh7WUJBb+nCWl/tDzM=
X-Gm-Gg: ASbGnctFm1peF39n4uO967HiBSN4gdIPVw2Mw+x/PvEDVsEr+hgr+INnRCawYARyp23
	6U/h43Icc289E6MKo8nEX1XGN5Q64fKvCo6QLo6bhkqp039t/KtPtNIGGLM3xU+Rw/naTYZss4k
	6JazpA/cFeN0ndxb8jF5PVYHnQAjptKWCuqUPJ9JOMsfQ1nmBnORaMz/rAHrTRJW1spDF1SMr+n
	35Tc0X2KazBcy606T+drDGtCrK7G93noXdALNRekMNvevUYDYTlsEvw/wPM2jmMkNEfcezk4XV1
	s4GhsXdryCnTprAqiXd+VI6fQAgwlDwg1uVJgp0PrVu+BJitDXlwyb9WJbQF03dj9CGWJXRFKxp
	TQS07ffx2XeBa
X-Google-Smtp-Source: AGHT+IGfcRtMRByBzZxTaFRUHxC3xpANXdzXNyeVyJ8yNcQnBA/HItQ1vM7lHolX3Koa2U1xbxfF/g==
X-Received: by 2002:a17:90a:d44f:b0:313:d342:448c with SMTP id 98e67ed59e1d1-31a9f81fad5mr831350a91.17.1751514872547;
        Wed, 02 Jul 2025 20:54:32 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a4904c9d3sm3382238a91.0.2025.07.02.20.54.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 20:54:32 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: alex.williamson@redhat.com,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH 0/4] vfio/type1: optimize vfio_pin_pages_remote() and vfio_unpin_pages_remote() for large folio
Date: Thu,  3 Jul 2025 11:54:25 +0800
Message-ID: <20250703035425.36124-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <c1144447-6b67-48d3-b37c-5f1ca6a9b4a7@redhat.com>
References: <c1144447-6b67-48d3-b37c-5f1ca6a9b4a7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Jul 2025 11:57:08 +0200, david@redhat.com wrote:

> On 02.07.25 11:38, lizhe.67@bytedance.com wrote:
> > On Wed, 2 Jul 2025 10:15:29 +0200, david@redhat.com wrote:
> > 
> >> Jason mentioned in reply to the other series that, ideally, vfio
> >> shouldn't be messing with folios at all.
> >>
> >> While we now do that on the unpin side, we still do it at the pin side.
> > 
> > Yes.
> > 
> >> Which makes me wonder if we can avoid folios in patch #1 in
> >> contig_pages(), and simply collect pages that correspond to consecutive
> >> PFNs.
> > 
> > In my opinion, comparing whether the pfns of two pages are contiguous
> > is relatively inefficient. Using folios might be a more efficient
> > solution.
> 
> 	buffer[i + 1] == nth_page(buffer[i], 1)
> 
> Is extremely efficient, except on
> 
> 	#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
> 
> Because it's essentially
> 
> 	buffer[i + 1] == buffer[i] + 1
> 
> But with that config it's less efficient
> 
> 	buffer[i + 1] == pfn_to_page(page_to_pfn(buffer[i]) + 1)
> 
> That could be optimized (if we care about the config), assuming that we don't cross
> memory sections (e.g., 128 MiB on x86).
> 
> See page_ext_iter_next_fast_possible(), that optimized for something similar.
> 
> So based on the first page, one could easily determine how far to batch
> using the simple
> 
> 	buffer[i + 1] == buffer[i] + 1
> 
> comparison.
> 
> That would mean that one could exceed a folio, in theory.

Thank you very much for your suggestion. I think we can focus on
optimizing the case where

!(defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP))

I believe that in most scenarios where vfio is used,
CONFIG_SPARSEMEM_VMEMMAP is enabled. Excessive CONFIG
may make the patch appear overly complicated.

> > Given that 'page' is already in use within vfio, it seems that adopting
> > 'folio' wouldn't be particularly troublesome? If you have any better
> > suggestions, I sincerely hope you would share them with me.
> 
> One challenge in the future will likely be that not all pages that we can
> GUP will belong to folios. We would possibly be able to handle that by
> checking if the page actually belongs to a folio.
> 
> Not dealing with folios where avoidable would be easier.
> 
> > 
> >> What was the reason again, that contig_pages() would not exceed a single
> >> folio?
> > 
> > Regarding this issue, I think Alex and I are on the same page[1]. For a
> > folio, all of its pages have the same invalid or reserved state. In
> > the function vfio_pin_pages_remote(), we need to ensure that the state
> > is the same as the previous pfn (through variable 'rsvd' and function
> > is_invalid_reserved_pfn()). Therefore, we do not want the return value
> > of contig_pages() to exceed a single folio.
> 
> If we obtained a page from GUP, is_invalid_reserved_pfn() would only trigger
> for the shared zeropage. but that one can no longer be returned from FOLL_LONGTERM.
> 
> So if you know the pages came from GUP, I would assume they are never invalid_reserved?

Yes, we use function vaddr_get_pfns(), which ultimately invokes GUP
with the FOLL_LONGTERM flag.

> Again, just a thought on how to apply something similar as done for the unpin case, avoiding
> messing with folios.

Taking into account the previous discussion, it seems that we might
simply replace the contig_pages() in patch #1 with the following one.
Also, function contig_pages() could also be extracted into mm.h as a
helper function. It seems that Jason would like to utilize it in other
contexts. Moreover, the subject of this patchset should be changed to
"Optimize vfio_pin_pages_remote() and vfio_unpin_pages_remote()". Do
you think this would work?

+static inline unsigned long contig_pages(struct page **pages,
+					 unsigned long size)
+{
+	struct page *first_page = pages[0];
+	unsigned long i;
+
+	for (i = 1; i < size; i++)
+		if (pages[i] != nth_page(first_page, i))
+			break;
+	return i;
+}

I have conducted a preliminary performance test, and the results are
similar to those obtained previously.

Thanks,
Zhe
