Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A753085D8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274161; cv=none; b=pYXjecchh9plnmeGXSUAuALA/Pf6DRTyCoFfRJogDEDS11TMEKITmN/ySv2WL+aM5kJJeLKgIAhOTO+OlIltIWS5cIWagFI4j/Cckv9y8VTqaVpTSVfLQxKqqkQ1YW1Z5XW/0PwW7xXZB/vubpRHCgUnO4n8GnOit9MCZsSYia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274161; c=relaxed/simple;
	bh=MSuWLjtitgIj5nAn+GX/fn5LHc8A7Qn1F3MvYg2EG1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bF3pxiI0Og9GwuoMtoIrzhTa+w56ClFly68pfliuThirnsbI+NRFCd+M7vIoNdFtrOKn0tRc3WLcMra1tKPYkCYddCgw+YgxtS32UhdzaczI+4p9fBRWD0jHyX8WN00WQLuYhr0+v4KxC5dd171K7lkXE4w7hMbrsipYh9Q7svs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6Z8Lbrl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6Z8Lbrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750274158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kc0dVjUcpt5gqxs6qiFWYkQnsos+yMT/xtO6WjX53Bw=;
	b=K6Z8LbrlH+QbX70ZYNPKvWy1gZQaMZg5D2ZW0eYpx6MqUxfNj5ye8YLyJTE0A1ij5jcoli
	Hxt17276SsoxAJDRDqibJwhLSRyOWK0UOrpGnL2u45DpTNc9ffqecwJI6BrmI9tqx5576j
	To1icEnRIXWOEeStaVNcUrpy17Q+uRs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-Y9ksjwJRN_q8vrdxJj1Lkw-1; Wed, 18 Jun 2025 15:15:57 -0400
X-MC-Unique: Y9ksjwJRN_q8vrdxJj1Lkw-1
X-Mimecast-MFC-AGG-ID: Y9ksjwJRN_q8vrdxJj1Lkw_1750274156
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso33716a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750274156; x=1750878956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kc0dVjUcpt5gqxs6qiFWYkQnsos+yMT/xtO6WjX53Bw=;
        b=xEtc9AUzomO8Q+Vo9s7dqqfBwoLBuxEOkna0tjpzsrXYDs0c+ks+NgVr5IKdFUf/By
         JrYfLkfp5GJZCMfDDyaWbwuwHuXrd8ADJWLaThOn6gmycGHquB5ldKzN85ZILLdfEo57
         5CvgljEPvLSpeFWSMbovBIk7j6ad/IcfPRH5BQF/7YRdDHc9r+JfX62Y243E2BeY7Pit
         0qLFS7wYQDj/8gYya3eilIDtd/W24XBkfsSjTpYqo3oZ0YHdSfK56bsj5pbIfTz7U+3g
         Y4UGy+NawrSwVqz19moRH9SoT/ngKYNeoCn4MsNo5c7bfjawDekINjNTyrz6jbsaqlKJ
         qIIw==
X-Forwarded-Encrypted: i=1; AJvYcCWF/lxEgFegy8e6FpkmNo5+ZoVbp3Tr1gk2f9KVefJ7dzAG3ZXHbL7QjKUoCiu+xkVDnpfDXToxtUNmEn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN/5pXwfm1K7cs4G0ZEF8j05AvYAqJv8VmidRsBZpiAV90TPBW
	EM1roy6Pea+rKaolMRGBBfi2h8zZnxhC+FBSY5/vw95BVwU65F8dumhqXZ7TkM3uCfh9NubRbKc
	gf2faGydvmqK3k8mcdrcRp1X3+uKNcXdPerxe37UiPXGEwUNLdeFjH5gTA+R4hnzt2Q==
X-Gm-Gg: ASbGncv0aHZplGvEAalx9RDiMMmfkpzIGrXq6Z8yEZIB2staraMAjloFVgpnUUWb392
	qYxP+kcv01s6aG9QUDquFIwPeuHW0RPozAkBr5H1kfc0AM2JuTnf5SEeOhdOK8wxW8OneANhVnk
	ObAun/OlB4eTxwl/lAGP1W3FJ+x5YG2wJZ9K21Xnm2PgwAe+sj6luCaHgcI2VYB4WlF3nw9s0pK
	ls/6BzwoQNMW40FWL3UrMtCxdLxdUwNHkCM2SEXkNlEpd3kwU/XEVDDuJqvaSt6nwFKgONB6B69
	WPfVDaLVIUShLQ==
X-Received: by 2002:a05:6a21:3283:b0:21c:fea4:60e2 with SMTP id adf61e73a8af0-21fbd50703amr31919631637.3.1750274156187;
        Wed, 18 Jun 2025 12:15:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkUR7lr6JS/+B3qk3OAHsRiYcnhO1km+mxn8h2hyzqyJAbV+OPjD7TSfxxaVIoV5qwzJHRrQ==
X-Received: by 2002:a05:6a21:3283:b0:21c:fea4:60e2 with SMTP id adf61e73a8af0-21fbd50703amr31919582637.3.1750274155792;
        Wed, 18 Jun 2025 12:15:55 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748f649d15bsm487986b3a.65.2025.06.18.12.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 12:15:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:15:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
Message-ID: <aFMQZru7l2aKVsZm@x1.local>
References: <20250613160956.GN1174925@nvidia.com>
 <aEx4x_tvXzgrIanl@x1.local>
 <20250613231657.GO1174925@nvidia.com>
 <aFCVX6ubmyCxyrNF@x1.local>
 <20250616230011.GS1174925@nvidia.com>
 <aFHWbX_LTjcRveVm@x1.local>
 <20250617231807.GD1575786@nvidia.com>
 <aFH76GjnWfeHI5fA@x1.local>
 <aFLvodROFN9QwvPp@x1.local>
 <20250618174641.GB1629589@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618174641.GB1629589@nvidia.com>

On Wed, Jun 18, 2025 at 02:46:41PM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 18, 2025 at 12:56:01PM -0400, Peter Xu wrote:
> > So I changed my mind, slightly.  I can still have the "order" parameter to
> > make the API cleaner (even if it'll be a pure overhead.. because all
> > existing caller will pass in PUD_SIZE as of now), 
> 
> That doesn't seem right, the callers should report the real value not
> artifically cap it.. Like ARM does have page sizes greater than PUD
> that might be interesting to enable someday for PFN users.

It needs to pass in PUD_SIZE to match what vfio-pci currently supports in
its huge_fault().

> 
> > but I think I'll still
> > stick with the ifdef in patch 4, as I mentioned here:
> 
> > https://lore.kernel.org/all/aFGMG3763eSv9l8b@x1.local/
> > 
> > The problem is I just noticed yet again that exporting
> > huge_mapping_get_va_aligned() for all configs doesn't make sense.  At least
> > it'll need something like this to make !MMU compile for VFIO, while this is
> > definitely some ugliness I also want to avoid..
> 
> IMHO this uglyness should certainly be contained to the mm code and not
> leak into drivers.
> 
> > There's just no way to provide a sane default value for !MMU.
> 
> So all this mess seems to say that get_unmapped_area() is just the
> wrong fop to have here. It can't be implemented sanely for !MMU and
> has these weird conditions, like can't fail.
> 
> I again suggest to just simplify and add an new fop 
> 
> size_t get_best_mapping_order(struct file *filp, pgoff_t pgoff,
>                               size_t length);
> 
> Which will return the largest pgoff aligned order within pgoff/length
> that the FD could try to install. Very simple for the driver
> side. vfio pci will just return ilog2(bar_size).
> 
> PAGE_SHIFT can be a safe default.

I agree this is a better way.  We can make the PAGE_SHIFT by default or
just 0, because it doesn't sound necessary to me to support anything
smaller than PAGE_SIZE.. maybe a "int" retval would suffice to also cover
errors.

So this will introduce a new file operation that will only be used so far
in VFIO, playing similar role until we start to convert many
get_unmapped_area() to this one.

> 
> Then put all this maze of conditionals in the mm side replacing the
> call to fops->get_unmapped_area() and don't export anything new. The
> mm will automaticall cap the alignment based on what the architecture
> can do and what 
> 
> !MMU would simply entirely ignore this new stuff.

For the long term, we should move all get_unmapped_area() users to the new
API.  For old !MMU users, we should rename get_unmapped_area() to something
better, like get_mmap_addr().  For those cases it's really not about
looking for something not mapped, but normally exactly what is requested.

> 
> > So going one step back: huge_mapping_get_va_aligned() (or whatever name we
> > prefer) doesn't make sense to be exported always, but only when CONFIG_MMU.
> > It should follow the same way we treat mm_get_unmapped_area().
> 
> We just deleted !SMP, I really wonder if it is time for !MMU to go
> away too..

Yes, if this comes earlier, we can completely drop get_unmapped_area()
after all existing MMU users converted to the new one.

Any early objections / concerns / comments from anyone else, before I go
and introduce it?

-- 
Peter Xu

