Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB261917D6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743570354; cv=none; b=lDevi0cljSnKv4GZXWrqYTI0IBeUjqjbRJd8a1YrrdnsartfMyCyrxB8yZlpTJp8PDquftodoYmG//ArMvW4jB++8uZmd1I3f28OjgaAa9Wej0Q3/9bC/JtK4KgixhrT6EvqqvZD6fca6njIgkYprwMdhPeMNer3lFC9xMBjOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743570354; c=relaxed/simple;
	bh=ToBtS/Fq7DMHoT1e2iY+L0xTZeqkApz5pB3d7f0G3bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwDcGQ6jPx0f7djo6zwCz0t58aO4BwQmJdO+zIYIDUkagfRwRMtA4JWqy/Y6JCnzc/uJS9HbnWclJThIf0k5Bu3Q+rtFRRFykBe43laZCZpSA9NCVGKW3UsCOyFqNgSj++JFbH1mUT0FYGLn0zYSquG43dhRsXNs+lKN7+uGte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Qww3K6ZN; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Qww3K6ZN"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-477296dce8dso62118781cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 22:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743570351; x=1744175151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=46m3GPuzo/ijq2+XYsa68t/WcXGozC1h1ijATq7sgg4=;
        b=Qww3K6ZNKTrMfzyFEZdddf7/sAC2VlxiuI612xh2s4rrwgUJcrI+ID6Tw7Z+5Aoagc
         GKOVdoClgKV+WpvsgPYeB6/+/IDL6TixBRf6MEdcNA1tgUgr4ZQueUXe/KL4JL10PyJJ
         0U0gXp0AEf+lHg1sigeS1xLofhqJZTAhIeZIAVcrmc5GJCx7JdGBntZhN8HhToNNOLvt
         /Mzs6uFTfQiK5bCwfIjB5RxjR/vpGs0MWMA+sJ4FHDikTYlK/WKXTVWu8c7pUaxHP8/N
         RaHd9rqpEBgGReZng1KVGVy0sBY++7TAMJ/FuzEiKzWMULHxd1SA1l5lkyVavufN8B/L
         gf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743570351; x=1744175151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46m3GPuzo/ijq2+XYsa68t/WcXGozC1h1ijATq7sgg4=;
        b=rzNFMA8pgWPZWf9jyy2/aLM+Jt3nqPoiNUlhJu4EgSE1FI3vjbY6ADc8+xF4OddesX
         0khKzcvLaDmNSAhx0AXORvZreePwHygKc1MjsMIYxwYxGHvFmDmM+CfGcfYHjhNDLjhH
         eyPn7p1RQmTGLTs3BCUHsHFgSQA0rOfhM7CC+DZdgAIKyvKVVZNrrXLpRoDwxMGPGByG
         Pnp2QlFHQBHWDWAjrf9/SdE8hqUzADKW6XArhsaIRhucdGEyWTwvB8QEiUFnXXIOnKD5
         E7z+J5I1WYpfpm3BowFbNkRsJSeNh3Fg25anwFMMQcb25tZ3/aqr8aNHDc8wbONDcam+
         0Ggg==
X-Forwarded-Encrypted: i=1; AJvYcCX1LADqyYwrQC3G0xqck+XnPtvVfcbXYiyFf4aWkS1yCwrpKKuENhIp7gyg2m3+hwkV2pGual1FE72WMRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnoBpbHerFWfF53qlN0nrC/1NkduLoznfNC0Bxbcd7R9LHkFz4
	5o7ANzh8qE67AHWLU3FH9qFtZcy8zJs8anjg5DR3SNVwgpvcdnokakVowoXygeY=
X-Gm-Gg: ASbGncuvQvCiaiKYpF7MHWDdXPy4FqfHe3eUWc6mxp6fTyWau3SCHMrdrQgZxJMo9Xn
	kkiu7q7dmd+kwWwAVfDnt2oWLbZ/ZObdFE3ZTDZQ1oUCGOqCLJ8BBJ123TwbjSU3adtp+bdAjzT
	QdCQc8ZLyRf5eUPviD1+TPZlVCwGHQtOedKedt0YGFZ2us3O8VCrPD/tUZmYItPW0l7RgHFqQBv
	O0KPsPXi4RlGhPEyXFpDdfbsru4IIuM4eBVRfXakV9qRRgRpvr9EK4SZ1CxCTLJOVkYKdzdp1De
	mhxZH1Fg4u91P/lPTtXq8+7wwoXJMhlqmA2HWAYOLWltmsqej29iMqZ7h9hDVaOyvZghoWaw3mn
	02EgJxgL5/dfGzC7KlCI6pvEDB68=
X-Google-Smtp-Source: AGHT+IHTe1SVUeuYXh0ubFlwsbzJ9Pp8B2+0OWLUKDSPQ4T5nDWaqnAyykP7ESnbJY9Hs/1MKNXpWw==
X-Received: by 2002:a05:622a:592:b0:471:cdae:ac44 with SMTP id d75a77b69052e-478f6d6b005mr69196541cf.47.1743570351163;
        Tue, 01 Apr 2025 22:05:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-477831a65a3sm74670621cf.79.2025.04.01.22.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:05:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 01:05:48 -0400
From: Gregory Price <gourry@gourry.net>
To: Dan Williams <dan.j.williams@intel.com>
Cc: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Robert Richter <rrichter@amd.com>,
	ming.li@zohomail.com, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH 2/4 v2] cxl/core: Add helpers to detect Low memory Holes
 on x86
Message-ID: <Z-zFrBqZHc4UWvMb@gourry-fedora-PF4VCD3F>
References: <20250114203432.31861-1-fabio.m.de.francesco@linux.intel.com>
 <20250114203432.31861-3-fabio.m.de.francesco@linux.intel.com>
 <Z4ccKD9Fc-Egc6EL@gourry-fedora-PF4VCD3F>
 <67ec4d61c3fd6_288d2947b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z-xdYvxD6yz3fMiE@gourry-fedora-PF4VCD3F>
 <67ec7814ea055_73d8294e0@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ec7814ea055_73d8294e0@dwillia2-xfh.jf.intel.com.notmuch>

On Tue, Apr 01, 2025 at 04:34:44PM -0700, Dan Williams wrote:
> The platforms with this condition want to support CXL mapped starting at
> zero *and* the typical/historical PCI MMIO space in low memory (for
> those PCI devices that do not support 64-bit addressing). If the CFMWS
> blindly followed the 256MB*NIW constraint the CXL window would overlap
> the MMIO space. So the choices are:
> 

If I'm understanding everything correctly, then I think this is intended
to work only when EFI_MEMORY_SP is *not* set for these particular CXL
devices - so it comes up as memory in early boot and we're just trying
to wire up all the bits to let the driver manage it accordingly?

If that's the case, then ignore me, i'm just bikeshedding at this point.

I can't imagine a system where the memory at 0x0-4GB is intended to come
up as EFI_MEMORY_SP, so I hope no one ever tries this :D

> > (Also, I still don't understand the oracle value of <4GB address range.
> >  It seems like if this is some quirk of SPA vs HPA alignment, then it
> >  can hold for *all* ocurrances, not just stuff below 4GB)
> 
> The goal is to get platform vendors to define the rules so that an OS
> has a reasonable expectation to know what is a valid vs invalid
> configuration. A hole above 4GB has no reason to exist, there is no
> resource conflict like PCI MMIO that explains why typical spec
> expectation can not be met.
> 
> So I want the subsystem to have an explicit set of platform quirks
> ideally backed up by updated spec language. That allows us to validate
> that the Linux implementation is correct by some objective source of
> truth, encourage platform vendors to update that source of truth when
> they create new corner cases, or even better, be more mindful to not
> create new corner cases.

I follow, seems reasonable.  

~Gregory
