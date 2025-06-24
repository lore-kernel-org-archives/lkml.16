Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F53595C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 20:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750798396; cv=none; b=qUq5tHPALbjsUcLJ4sFscTTCeTVtBXLmhx8aRyXAPERwFmeAobvZTt5xCjYQLXXQA9b6gfvAQO4MsJoEqITYdkOWXgFYpM3qXQAWi0D++VIMn3vowIr6TzyVKf12SQa6w0kitEsQqheP+RFlYA21sOEx/ckJ7Ycf3bzNwxYanQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750798396; c=relaxed/simple;
	bh=kM/IfC/U8zaIW8FhwAjzCQVFNIYN0QjG4pYF0m7Ihgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoIZ9HOJSj6DowKFgBmCvahlG+AZIzN5uXbf8NTXWZKEfKX7D3/kNxVnw0anSn+/CmD5JSJu0O0rWSUzb4BmktA8DCakaZXPGwFG2MpPnIJT8xf5DcGwPX9IQFMDn7CNQ+pTzUakqu3DHMNnASoRZK5vzxtW2YGn4KxVjqx2Tm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LowicbtJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LowicbtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750798388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J11ds042ECzs7H3dbgHbcrEw+iFqu0r/26P/J9h7Qko=;
	b=LowicbtJLXfayoHA+m+u3AIH/VtwEOkY707zjtYLCxjlu91xCu1xM60Wx4XfZ9ILEzgUaf
	K1m5RkWiI/BpGZQYw7DPcc9RDgLOoFuK1WoZp/JiwDWhxlhMzmTN/ZVhGqV8bXkRgaSfFa
	MLBS03P4nTvupXNmxDn12LzwYeNWiME=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-yEZ8IQw2P0SuplnaPVr37g-1; Tue, 24 Jun 2025 16:51:17 -0400
X-MC-Unique: yEZ8IQw2P0SuplnaPVr37g-1
X-Mimecast-MFC-AGG-ID: yEZ8IQw2P0SuplnaPVr37g_1750798277
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so43409185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750798276; x=1751403076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J11ds042ECzs7H3dbgHbcrEw+iFqu0r/26P/J9h7Qko=;
        b=XqydBFx+GGTbb+XVQ7t69oa6ZnVhbwLQZ3tWtUdV1SGZO7aPId/6ClQ3VI77uByWf2
         dM/ta+kZGK2SKBtslwTHQ2dSVz5vAF5SExFAsNWILf5NVxeEmESMRQ+PXdnqHRYxFpFt
         9hHQE8mNar0nV24w21M2SkGM08YC9bNN4GL3ocj85b2gBjDyXuvzkUxA1f0smVjmH9lT
         AD/HIRmOUjLplIJGJwvMJ3nnZSOCtZ1O3/rmCzQKi2WqsaHhSWZPVLJ1ZLT0wkZUouff
         +OVDen329wjt0MkkDgEZ1OKUAQkU/R5c+4TxX6tBbMU2rl1Y8TYib605F5GO8TGUpBfR
         euLA==
X-Forwarded-Encrypted: i=1; AJvYcCWjnLTh9BT7hBjLfDSYvFz+Dt+JbvBJRJchHLud8DzHU7bmGYC2WkGJH2mpgf/K4kW/on68H+xRNL3HOAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmh9Ccz+pRsXPuIw6FClzi6cl1SWTb3YF1Dv3nHaoIYQmcWv8
	IwJaiPJL9sX1GtX5iOvIdD1WBcoK3ZBAzZTgxXTFlBUKOUMEvCyxo0HudTQD4j0c1lqkrAXgzHR
	IlRST97wcjcX/qPVnCMwV0EX8DiZWFbOZOKq6Uk1VL/U00mLeKR7deaKStTPxVUsb61vR+zNiLA
	==
X-Gm-Gg: ASbGncuc4Ht0Tb8jR4/f3rU99lfR6zPS3vGJrgi6/ckP1//d+YNod9IP/QcTw/udjt+
	VA46+moiJ10O/7z4KbZO2QJP6cswoD96Z3trw9wrQ7MTQehDd0xgDr8WOWIonWP7vrajEe0BtX8
	pLxBoTz8BL40GI2uJC3rs+sVZK4JG6bZh8WpSkiq7iX2jnPiaDOcoiEswY4w2pf6rLT31NoClOW
	eTwqSlWZSI0/niN856L5mniVpx7giwZpUOWmAUTsBbDzqPD0JIVoFKBwABRsmJq3Eb5cQgUBNY7
	VzL9esQFr/LaAA==
X-Received: by 2002:a05:620a:2907:b0:7d3:f8b8:b1ce with SMTP id af79cd13be357-7d429964b36mr55473485a.27.1750798276423;
        Tue, 24 Jun 2025 13:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXB0NjNPJFhxsKe8ZP75Mk2G2kMyPcL9xehXKcPoe5G89surWH97a5ZybNtffg/Gvuki7iBg==
X-Received: by 2002:a05:620a:2907:b0:7d3:f8b8:b1ce with SMTP id af79cd13be357-7d429964b36mr55469885a.27.1750798275985;
        Tue, 24 Jun 2025 13:51:15 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999c07bsm548154585a.4.2025.06.24.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 13:51:15 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:51:12 -0400
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
Message-ID: <aFsPwLB41_3VDvtY@x1.local>
References: <aFHWbX_LTjcRveVm@x1.local>
 <20250617231807.GD1575786@nvidia.com>
 <aFH76GjnWfeHI5fA@x1.local>
 <aFLvodROFN9QwvPp@x1.local>
 <20250618174641.GB1629589@nvidia.com>
 <aFMQZru7l2aKVsZm@x1.local>
 <20250619135852.GC1643312@nvidia.com>
 <aFQkxg08fs7jwXnJ@x1.local>
 <20250619184041.GA10191@nvidia.com>
 <aFsMhnejq4fq6L8N@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFsMhnejq4fq6L8N@x1.local>

On Tue, Jun 24, 2025 at 04:37:26PM -0400, Peter Xu wrote:
> On Thu, Jun 19, 2025 at 03:40:41PM -0300, Jason Gunthorpe wrote:
> > Even with this new version you have to decide to return PUD_SIZE or
> > bar_size in pci and your same reasoning that PUD_SIZE make sense
> > applies (though I would probably return bar_size and just let the core
> > code cap it to PUD_SIZE)
> 
> Yes.
> 
> Today I went back to look at this, I was trying to introduce this for
> file_operations:
> 
> 	int (*get_mapping_order)(struct file *, unsigned long, size_t);
> 
> It looks almost good, except that it so far has no way to return the
> physical address for further calculation on the alignment.
> 
> For THP, VA is always calculated against pgoff not physical address on the
> alignment.  I think it's OK for THP, because every 2M THP folio will be
> naturally 2M aligned on the physical address, so it fits when e.g. pgoff=0
> in the calculation of thp_get_unmapped_area_vmflags().
> 
> Logically it should even also work for vfio-pci, as long as VFIO keeps
> using the lower 40 bits of the device_fd to represent the bar offset,
> meanwhile it'll also require PCIe spec asking the PCI bars to be mapped
> aligned with bar sizes.
> 
> But from an API POV, get_mapping_order() logically should return something
> for further calculation of the alignment to get the VA.  pgoff here may not
> always be the right thing to use to align to the VA: after all, pgtable
> mapping is about VA -> PA, the only reasonable and reliable way is to align
> VA to the PA to be mappped, and as an API we shouldn't assume pgoff is
> always aligned to PA address space.
> 
> Any thoughts?

I should have listed current viable next steps..  We have at least these
options:

(a) Ignore this issue, keep the get_mapping_order() interface like above,
    as long as it works for vfio-pci

    I don't like this option.  I prefer the API (if we're going to
    introduce one) to be applicable no matter how pgoff would be mapped to
    PAs.  I don't like the API to rely on specific driver on specific spec
    (in this case, PCI).

(b) I can make the new API like this instead:

    int (*get_mapping_order)(struct file *, unsigned long, unsigned long *, size_t);

    where I can return a *phys_pgoff altogether after the call returned the
    order to map in retval.  But that's very not pretty if not ugly.

(c) Go back to what I did with the current v1, addressing comments and keep
    using get_unmapped_area() until we know a better way.

I'll vote for (c), but I'm open to suggestions.

Thanks,

-- 
Peter Xu

