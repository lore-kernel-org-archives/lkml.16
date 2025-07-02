Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6F2BE659
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751488694; cv=none; b=AQLS7Z9Vt3wC/ErmtxUK23Oq1PzDjoTIxqeSFR15qiEM2zb0NqinK2/bmSAsXI87Q+NXblnc4j45TKKVpSX+y7qJBheWh/T7ULYpYwOPOp8PJY4ekvvHYbZJPms/adefwWjPvL4rThJ2dZYogDffpd81MTvcwdBHDndrUEy7WQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751488694; c=relaxed/simple;
	bh=IarNg8qlUyaN/zlFiCqhIt5EZu75PubAy+ABEGPJJvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpr27wbVoaoJ7+9puyC+Y+SK+fwe9yQtz9ASXWNJ/0as2D59Z/fDhn85ClzUepBtEMpxjwajCQuP4dN/FVWKMtU9lmItItL5UNn3idHZZb4NQ+Tf6GgtnTFuXMKuyp6uRt9burHqIUpJY16VPQ4t26wt8QAMfURicv39FY8Ln30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OoHzHsiJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OoHzHsiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751488692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oly5ZQ2+eF4YcMPWn15EEV0ajlmQqBU4UwuVPpiZtmw=;
	b=OoHzHsiJCLM0k72xBIfwEes6mfULRlVpi9TJz/mtzxDdQyH7ipvW7jZ2d8f4C/QqV+EwpI
	5WbS/FLYHA1hjMpw+/f3hRgjTJeYMGB6Qltil0hrsR5Ve/LKX9OZq0CL5qf+0SfQZQ6bvz
	XEz5JqeuGU8qNNfEQXVuABvYThm9qMU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-oGxI2zLAORSvKDvAYMynow-1; Wed, 02 Jul 2025 16:38:11 -0400
X-MC-Unique: oGxI2zLAORSvKDvAYMynow-1
X-Mimecast-MFC-AGG-ID: oGxI2zLAORSvKDvAYMynow_1751488690
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d44ff55c98so969343085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 13:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751488690; x=1752093490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oly5ZQ2+eF4YcMPWn15EEV0ajlmQqBU4UwuVPpiZtmw=;
        b=hTfXKGXwfVyEODZZ8FO6buByt0Gade1+bWilOQGIsi5hhdle2JqCtzlUBFZb65bxdR
         jor4i/FBX4F2+3w7xnAEzSappQQurhvtS+siOSB19JfxggvBZNlXRdUTBsYKOkN41nn6
         N/CPlHJGFcGPrNzyH/9cGeglAbuR+SUxXaESxP9cwYNRHJ934bzD9a3Sq0xzvUL321XQ
         SX5J1C8NgbKzACFN4Heh8PLFL56PMW10mK8Wyd1Yo7Z5r+HtvnMv8cBG0zCz1iCJ+xYd
         15SCa0gJoZFgCwUBKYL88qpl7A1wvBJwKkAQ75JUTusARp9Msj/vArbl6dO5lw2BaPfk
         A0vA==
X-Forwarded-Encrypted: i=1; AJvYcCXul/05yx3R6MpvoI+fegA0Dw65rOJVKxb+L+uj9+jY5Pa5Q/vLLNVQwkvu6HT8YjdHF7F9hEYFacvOp1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmRRigUWm/6pT4hI1a+671hqhsZ7ogBAw7ydv3vqA9YG6PwKL
	xnbtERymD0WU2NH6oX5JmOx8CEM8Qudg2YG4wJHN13bdhSnGC1Xd95njtLYXmARwLxxizggdorO
	qLXyg/UgVqyR556UjqpYwDsyCjskQt2SKGK6vJByvoSS/13wZT0GMjEcoyav6MaSnjw==
X-Gm-Gg: ASbGncsq+jAFv9lTo+e8/w5psX1CPeefLYFkNmd4L3x6rNRQGloMADNeFOabC/1Mofu
	WlE5NOEuHL8v48h4lAfe/HXi74tGTLMJxBUGa/SxvGuTe42G1MummJ1sYIDTg63VJLDBPlZx+Dv
	eI5fkAZvbRVTySUsByNn0HW0vrSzhX5yJOpSx8mihz7aPO1A0Aewc0oBhH1a6Wa3w/S0ZoqC6+c
	kvI+BVEpRENM4P4ugbwkXLPbw9MgVdoIHhTSD/YYKOuJEBNFi/rvNiy2kLz08KgtdoariQ5SNEJ
	/40SkXaKHXrabQ==
X-Received: by 2002:a05:620a:46a8:b0:7d2:284f:e471 with SMTP id af79cd13be357-7d5c478e4c5mr618536385a.33.1751488690353;
        Wed, 02 Jul 2025 13:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg9rDsOnDdQfr8hbXVLmBbDwC94mU5hTrS99xRgYOcTc+6ei90hAfdRAMYJSP1J/RUmFYj1Q==
X-Received: by 2002:a05:620a:46a8:b0:7d2:284f:e471 with SMTP id af79cd13be357-7d5c478e4c5mr618532385a.33.1751488689959;
        Wed, 02 Jul 2025 13:38:09 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443139b31sm1003759285a.7.2025.07.02.13.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:38:09 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:38:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 4/4] mm: Apply vm_uffd_ops API to core mm
Message-ID: <aGWYrrFJCg219Y8R@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-5-peterx@redhat.com>
 <aGD_fyBSy6hwIHHk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGD_fyBSy6hwIHHk@kernel.org>

On Sun, Jun 29, 2025 at 11:55:27AM +0300, Mike Rapoport wrote:
> On Fri, Jun 27, 2025 at 11:46:55AM -0400, Peter Xu wrote:
> > This patch completely moves the old userfaultfd core to use the new
> > vm_uffd_ops API.  After this change, existing file systems will start to
> > use the new API for userfault operations.
> 
> Maybe:
> 
>   Move userfaultfd core to use new vm_uffd_ops API. After this change file
>   systems that implement vm_operations_struct can start using new API for
>   userfaultfd operations.

Sure.

>  
> > When at it, moving vma_can_userfault() into mm/userfaultfd.c instead,
> > because it's getting too big.  It's only used in slow paths so it shouldn't
> > be an issue.  Move the pte marker check before wp_async, which might be
> > more intuitive because wp_async depends on pte markers.  That shouldn't
> > cause any functional change though because only one check would take effect
> > depending on whether pte marker was selected in config.
> > 
> > This will also remove quite some hard-coded checks for either shmem or
> > hugetlbfs.  Now all the old checks should still work but with vm_uffd_ops.
> > 
> > Note that anonymous memory will still need to be processed separately
> > because it doesn't have vm_ops at all.
> > 
> > Reviewed-by: James Houghton <jthoughton@google.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I'll take this for now, thanks.  We can finish the discussion in patch 1 to
see whether we need to refine the API.

-- 
Peter Xu

