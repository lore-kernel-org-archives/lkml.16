Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E82231A55
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840809; cv=none; b=Qa0ZAbC/ku2CbVDpCIyZ6NPLgKgrIJhb0LUWdykBFiAwVT8yLy9lu0NyQjkm1rN/35kcW5Lo02Hvk4YiOflA5Imfv2AyKXZrx+uh/WG1CsWZx5PZ36f68Lpfe2DPTVEU/mT6K1jM8gHijjWSbhVgRShMK65qdC/KeAWgr4l1O4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840809; c=relaxed/simple;
	bh=Cjzm5zcRZnsOAuwyO76t9n9NJxkUtHR+IqjmAsTAsmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCP6wrK8JGn6dTZBWa72nX3l3hsc5lTAcQVf7NbpKafOmiV6GgWwgf1X/M0NU8Az5RzfAE93JWWVOYU0JHYA4rIWJefgjGU1CkCryWMS/LGOLV6klfHuU0HoWIFuF4dVYjvzqf2VllxIDEOR2Gt2Zv03s00fEd+FPe6V4nqvwCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXhis2Bo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXhis2Bo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749840806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gftgj3F7KbsxQl1OCCcu039clX1oCiOXcGuSy3kjDUU=;
	b=NXhis2Bohhjx35yIU7p1KrkiM6itgQeQF5GKDpWp+5jaOhSKhaDUNUn9J3AjBq2uqAxxpT
	pNfGWAxMVFozcWEjvfg73nSgeyDSBF5sk4ZsYAF4A7XMIgfuyucEMDp+RyNySdheqzswbg
	8PzurdxNveLTXoFPvxHTi9XBEKkZgcQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-G5hWuziCPW-5RqaxGq5Z0A-1; Fri, 13 Jun 2025 14:53:25 -0400
X-MC-Unique: G5hWuziCPW-5RqaxGq5Z0A-1
X-Mimecast-MFC-AGG-ID: G5hWuziCPW-5RqaxGq5Z0A_1749840805
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so341456485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840803; x=1750445603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gftgj3F7KbsxQl1OCCcu039clX1oCiOXcGuSy3kjDUU=;
        b=lrDtLxRENShrhHYeDZcUYTtd6SFeKUjfbrVR8JS+YITtsdkw7LMVDiQB1jX6C9Swn7
         DgNrxPjwuSHFBVsEBojOLlWF1XNsuWg3bvrWxXjCuQCUVtNlIDEsfLj9DMYf2LKKKODc
         /k8mEBSjxOnpo8XWWbHjDfKVBMsc594gQbFfFvaN7Mjo0WP7qke2ZtsFjTouY0vTUEpp
         zeWqnAo5Em5d2Ckfa0Bbj5MEVx7IpMuynz46ckAqsEgqqkdWOhWz7w+BoghU+VotufYC
         BRn1rZh7PNFyeayVvM34/9yM1BE8VMKYSbM4GF5oMFzwL2wW1gQkBtnetyh6cTWpKf1R
         TfyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2V45lc/+ivqbVc9j66eTaVSYowpCnbBsnecmUsbhtUbNB09tMoKzHzNvwa9mIh3PrD1K8GY5hzoizu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYHRh1HhmMfdCA6lfLKtNMBmjuuM+5kO+KqJAOuEW9d+yMpcA2
	RmE/kHeRRTo4oOIm7ThvOn+OD8RKXUVlPsDUW2hd9CYsDdb000kxunbeDBC2EyUJ5zGXAi4soEm
	bOFUiGU40XrbNbsCG500OiQq2SDkhVN/jYfZwBDkRunn+Mw/IhvS0DJyrGrAlC7+GwgVFHUlPXg
	==
X-Gm-Gg: ASbGncugB7ZPAVleL3t+bzclZY71SgJhYMM2OZv7iY3nw1cZeXBIjREed8/eyQYeIUN
	HNh464aK4/7wDR7WgfXwNzd+GUcaa4vjBRVj+apHagC0H+cAMNod4hn3C/6HslDdDahmbChJXym
	9TMsbjGaRQ++0I6d+QeVCUfhrZRAVwfj1D80JTV+MCEi6Ooij1jIVw0BDoHq68kauR0gdk5Bpp5
	KpSQx1nf6ZD733MUWHr22nTe2dZ91shZKhKmzdrymORO4hp1Y+eQeKofUtdp8Fbr5c5EpGQQx3G
	ZuTpNposZTKh5g==
X-Received: by 2002:a05:620a:29d0:b0:7d3:a6f2:74f2 with SMTP id af79cd13be357-7d3c6cff068mr94635985a.55.1749840802680;
        Fri, 13 Jun 2025 11:53:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXcJDc+6SfZZjG6WukyvvwVpmRG1A1uzOdQlYb7eX3XEFjC1NczC7Ki5Dki/oYEcd/wf85cQ==
X-Received: by 2002:a05:620a:29d0:b0:7d3:a6f2:74f2 with SMTP id af79cd13be357-7d3c6cff068mr94631685a.55.1749840802254;
        Fri, 13 Jun 2025 11:53:22 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dce692sm207001285a.14.2025.06.13.11.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:53:21 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:53:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Alex Mastro <amastro@fb.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com, david@redhat.com,
	jgg@nvidia.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, npache@redhat.com, ziy@nvidia.com
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
Message-ID: <aExzn1CFGpA9szrq@x1.local>
References: <20250613134111.469884-6-peterx@redhat.com>
 <20250613174442.1589882-1-amastro@fb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613174442.1589882-1-amastro@fb.com>

On Fri, Jun 13, 2025 at 10:44:42AM -0700, Alex Mastro wrote:
> Thank you Peter!
> 
> I packported this series to our 6.13.2 tree and validated that it does indeed
> provide equivalent, optimal faulting to our manual alignment approach when we
> mmap with !MAP_FIXED. This addresses the issue we discovered in [1].
> 
> The test case is performing mmap with offset=0x40006000000, size=0xdf9e00000,
> and we see that the head and tail (975) are faulted at 2M, and middle (54) at
> 1G. The vma returned by mmap looks nice: 0x7f8646000000.
> 
> $ sudo bpftrace -q -e 'fexit:vfio_pci_mmap_huge_fault { printf("order=%d, ret=0x%x\n", args.order, retval); }' 2>&1 > ~/dump
> $ cat ~/dump | sort | uniq -c | sort -nr
>     975 order=9, ret=0x100
>      54 order=18, ret=0x100
>       2 order=18, ret=0x800
> 
> [1] https://lore.kernel.org/linux-pci/20250529214414.1508155-1-amastro@fb.com/
> 
> Tested-by: Alex Mastro <amastro@fb.com>

Great to know it works as expected, thanks for the quick feedback!

-- 
Peter Xu

