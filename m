Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910CC2517B5;
	Thu,  3 Apr 2025 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743704531; cv=none; b=b/3wDFn6VVdHexIAHCpPIatf8JE82QPuwPjGCA8Ei9LwXJJj8IIXY1ANAZJZACjWfn33yed434mApwgKjEddHPgp6Rrla82uvz+hTZTWnSf3ZbmIin+8sVg8HpDZuAa6Fn/P9aDMZgLgq3st1XycBB0ya/GQOX+E3BaGK+b9c30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743704531; c=relaxed/simple;
	bh=dpmf/tvaFa1UnF86V9qToJN08i22YlUcXNGfDcdl/B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPEi9xBPzoHRz5HCfrxhbqNz22O6LWNV+hMukhiIwGxwyIfZZJdmR4bj7o66pW+x8lbW/4G9Lq5tZS45UVg4ukRIsOEZ6VBD+KDhvdeS87WEIPZV29VVeDifyvxyHOrBOW66FmV8tXpUfXXyPPkhOKVkfmle9AkNIeVX10apJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=ttXfk71o; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="ttXfk71o"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZT97K4Qxvz9tCK;
	Thu,  3 Apr 2025 20:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1743704525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uq27JMiTJIa5r25K1CbROwKYLHM43JGVKOiIpJ5rqG0=;
	b=ttXfk71oSpE/n07q4y88Uu+EdqXVL6GDvVu75W6YWmgCO+wqZG+A2enve1aQDWJtY0+37c
	IiGtmpp4iCrB/Pp19fqo/3PNN6CCjvkb0tkNxD+sw8onP8cS68HDQUTzIhf2Zlt9I3JULM
	ceIX5Mn6kI33dnEQuACHDvQ4TdGtB2pVTh5/adMS2Za3yF/aJZTioEMSwWVA4Zj2m0aW01
	xASH3TnNkZ4fNLyYl46Eol7Eq2wQFXJK0P7VZI3ajr3EZiY77JmTVM9jOksW3W7O/5/+rP
	17/On4GDG7Ke2MNIuFmSDIJ+gJxmFAihPnfhCTCGdh4x6vAXjl9qGD2ZefVHSw==
Date: Thu, 3 Apr 2025 20:21:19 +0200
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, willy@infradead.org, 
	linux-mm@kvack.org, da.gomez@kernel.org, mcgrof@kernel.org, gost.dev@samsung.com, 
	linux-doc@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH] docs: update THP admin guide about non-tmpfs filesystem
 support
Message-ID: <midpuwlrt6tllgk2lpcntariyyt7msp7uyv32syfwne2p662yg@ux2zb7flcam3>
References: <20250403103805.173761-1-kernel@pankajraghav.com>
 <77b19486-28ca-47e1-b506-6de604f6ec0a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77b19486-28ca-47e1-b506-6de604f6ec0a@redhat.com>

> >      in the examples below we presume that the basic page size is 4K and
> > @@ -463,6 +463,10 @@ fields for each mapping. (Note that AnonHugePages only applies to traditional
> >   PMD-sized THP for historical reasons and should have been called
> >   AnonHugePmdMapped).
> > +The number of PMD-sized transparent huge pages currently used by
> > +filesystem data (page cache) is available by reading the FileHugePages field
> > +in ``/proc/meminfo``.
> > +
> 
> These changed look good. Do we also want to talk about FilePmdMapped?
> (PMD-sized THPs in the page cache that are mapped in to user space using a
> PMD ?)

I am a bit new to this subsystem, and it took some time to wrap around all
the different terminology used :)

But sure, I will add a new commit to talk about FilePmdMapped. I can
give it a shot with what I understand about FilePmdMapped, but please feel
free to add your input.

> 
> Do we have to distinguish it from below? (shmem also uses the page cache)
> 
> >   The number of file transparent huge pages mapped to userspace is available
> >   by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
> >   To identify what applications are mapping file transparent huge pages, it
> 
> Previously here, but: this reads rather odd. "file transparent huge pages".
> "PMD-sized THPs specific to shmem are tracked separately ..." ?
> 

I totally agree. Reading "file transparent huge pages" confused me even
more. I will fold these changes as well.

Thanks, David.

--
Pankaj
