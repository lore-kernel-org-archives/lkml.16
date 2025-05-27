Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474511E5B7E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375581; cv=none; b=s/ferkiTSUK8Lt02dfzISz2CUT7MkI5vC/cSD5TArYF6Rw3zoc9kux2uz4vIFmRvjq3KtkOUL2YHIZOkTTGx3H8XkZhnsox1cqdR+K0Y/e8q96uEwq01h220rDnEjgJgkAEFRsfC/2M9N3JEb3aiCyztmgVPmGyAxCfKoEzXBLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375581; c=relaxed/simple;
	bh=wfzeSjnOBYwtdi+NXoz1WKe00UzyiBoHRf4/F/o8/KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8g/SXePecD8uKZmEeZcXNM0zZT9HHDF+W7Wi+UJVqQAKg40eXzdFjX8+WCznaXNI9pVX9Lk/+lgqptgtoEThYjK0Wh9c6+OUQEgyfZ3hNOts1v8XI9JcaXXOM8R3v7edFrmkfMm2U9Y+TQ8jMcG+6fVc5e/d+gLMZ/hfnusi10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y44kX8gr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y44kX8gr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748375578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B23w+mJte2hrlc+HDv7vWttucz96qnGXmWVqDZu9hNY=;
	b=Y44kX8grWtrOKUQd9SXBDiw06TdY+cOIK2hTnUo4/RCIScEXD93Z81aAAiH50EcBW7gCTl
	VRfXPTHSSBSBxuDPVlKEUMrIXKdPYjOwpcvDuEMwpzlfurdoB23zrFJ63ZTUh6hHr/uKHe
	dTzp07deKLNdElwg6UfuoSu8Mjq4Jlo=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-Sx6hk0HjMPqQut_JvcQgcQ-1; Tue, 27 May 2025 15:52:56 -0400
X-MC-Unique: Sx6hk0HjMPqQut_JvcQgcQ-1
X-Mimecast-MFC-AGG-ID: Sx6hk0HjMPqQut_JvcQgcQ_1748375576
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dd77a1db0bso6169435ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748375575; x=1748980375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B23w+mJte2hrlc+HDv7vWttucz96qnGXmWVqDZu9hNY=;
        b=P603WVcgjNtx6hlPQkH6O0IeM0mgRGqSbMrjn47yZr6TSHlXS6475MMrtzwgmR9PUg
         8rcnl6VW3tRXI3XoPO0ErnXdCIf4jq0KYvPSi7li5xhSE61BR6vUg+lZphNSiAlqyirU
         QA2hg+zPKI5y4+c3TL+PotG2efxgINc8cjj876Oj5ovwuVfWhgq5XvCG73n0ChCZrCf5
         eOvuop8ed4KI1IY4ul0GpzbWVwOksNjwgMh3iOINQP2MNdnT0dThr0J4C2Aaj5aur8ds
         hVLkwKTYnuufn5X/SCaG+32uH7cY9GUsu43HfuHx+fpkolb/zO5G2OSQCDtEsje7EpsW
         McLA==
X-Forwarded-Encrypted: i=1; AJvYcCWnDHC9WdbBQJyn+tHDjyDA46aVFZTpZ4Cqi29kYz4nedazptCnPLDeYm8HigESHuFBeKBxTJke8g2cEn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq7bpyCPcxUSfujdGKYf5xAS55CBpEr4sCZnpeFTfqIL5oyQmn
	3MU1T5Y4/MRkSUNXWYstYxVuSZ4ktIKS1Y2gJl4LvZaYFdBRSZbCJ9dE7ZDhMG9zqsuG6LWIFkz
	RATH4PxtH4Wztse73WDBwgS4P5HCP/OpHKczLIh+bIZlFRIsiXhpWYXMUSpjIDQ7tBBNGnYmyaw
	==
X-Gm-Gg: ASbGnctvhxLCbNwaNGttxbhFjdmLShoMYewWVaaM/IBbMuoG8+gHIJHTChPUPox78zb
	AqHkSwHgWajx0MVFOdgLm1z9AEucekq6d/ErsC2eEqvoO9yZdE8RDZ5wahu5N1A+V3MpiBD9DWS
	hfK/FsKDxmYPCq5inXKS93JszC7PmW8yBE8mOJshbokOBUNlkE59iB+ntf1QcplEP1PQlQWXcqY
	oTvt9hnlBfJ09zd2De86+iFnH0thYTQFgTbRpf6WkoR6MJKbvoc4/2fzRt5yJsUEtKiDXDkY+eE
	3DR7M9tmAut7jno=
X-Received: by 2002:a05:6602:1592:b0:85e:5cbc:115 with SMTP id ca18e2360f4ac-86cbb7c12a6mr408931939f.1.1748375575349;
        Tue, 27 May 2025 12:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwLNJ6eHdjPMMmyY13xYb6/ka7gGKjM7dod1+4Ss+jcvL7ApAlSOoRyr0utVN0EwkffA5hMg==
X-Received: by 2002:a05:6602:1592:b0:85e:5cbc:115 with SMTP id ca18e2360f4ac-86cbb7c12a6mr408931539f.1.1748375575011;
        Tue, 27 May 2025 12:52:55 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdba684ad9sm17771173.82.2025.05.27.12.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 12:52:54 -0700 (PDT)
Date: Tue, 27 May 2025 13:52:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, lizhe.67@bytedance.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for
 huge folio
Message-ID: <20250527135252.7a7cfe21.alex.williamson@redhat.com>
In-Reply-To: <20250526201955.GI12328@ziepe.ca>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
	<3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
	<20250520162125.772d003f.alex.williamson@redhat.com>
	<ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
	<20250521105512.4d43640a.alex.williamson@redhat.com>
	<20250526201955.GI12328@ziepe.ca>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 May 2025 17:19:55 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Wed, May 21, 2025 at 10:55:12AM -0600, Alex Williamson wrote:
> 
> > This optimization does rely on an assumption of consecutive _pages_ in
> > the array returned from GUP.  If we cannot assume the next array index
> > is the next page from the same folio (which afaict we have no basis to
> > do), we cannot use the folio as the basis for any optimization.  
> 
> Right! I was wondering why this code was messing with folios, it
> really can't learn anything from folios. The only advantage to folios
> is during unpinning where we can batch the atomics for all the folio
> sub pages, which the core mm helpers are doing.

I *think* all we're gaining is that comparing page pointers is
slightly more lightweight than iterating page_to_pfn() and that we can
skip checking whether we've crossed an inflection in pages considered
reserved within a folio.  I'm curious to see to what extent this
optimization is still worthwhile.

> Which brings me back to my first remark - this is all solved in
> iommufd, in a much better way :( I continue to think we should just
> leave this type1 stuff as-is upstream and encourage people to move
> forward.
> 
> Lots of CSPs are running iommufd now. There is a commonly used OOT
> patch to add the insecure P2P support like VFIO. I know lots of folks
> have backported iommufd.. No idea about libvirt, but you can run it in
> compatibility mode and then you don't need to change libvirt.

For distributions that don't have an upstream first policy, sure, they
can patch whatever they like.  I can't recommend that solution though.

Otherwise the problem with compatibility mode is that it's a compile
time choice.  A single kernel binary cannot interchangeably provide
either P2P DMA with legacy vfio or better IOMMUFD improvements without
P2P DMA.  If libvirt had IOMMUFD support, XML could specify the
interface on a per-device bases, and maybe even allow opt-in to a
system-wide policy choice.  Thanks,

Alex

