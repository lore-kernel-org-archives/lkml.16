Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF277256C9D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778194; cv=none; b=Glfv2/dMv7FpBojdtgvQpxBt0os1AbhtzPE2cdL+TmyhGmzDZFJ05RcyBVLaYqHgpo474VOYHPs4rVsgGvdXeclCLVOdQJazK7zkrhxTcqH4uIMiIfbBDXEWptA1PPP3aM9Lzfeo1gNF7d8GHqnHrEDbiP08W3eU9iBhz0Obko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778194; c=relaxed/simple;
	bh=oWb5hAu/l5YSX8uJ039kggIhfQkxgNS/Ezdx1ZpAoFo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kokSAX5h1FNRWA5QhI3Aiuv5cbcxGCRIIj9X79NrbcRhEOflHhoBBAwn9m9NiRqW0xs178gYEfMpkGk9p9zGtSX+ZOC66nBtW0QYhqE/b9m8606A7QOw2i/oLgpgHC3x1J6WfDnBmVnP43ptZBwOYIoLt3zavFk0kkDfVOgLkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0Npc48k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0Npc48k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747778191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8I/zlDb7KnN1EE0TcCQ0JoPgED/9jrw+qsbSjcDT74Q=;
	b=F0Npc48k8SRwrGfZ1CZAr+fCXNoDm1hq+rqEXkX5hNwEfdcgwmIsZGmzjTfqgYMbyXYwzB
	C1VAlpgT+dblHo0EYRwVPywDdXnlSmyBTXciw89wGaEGkb33XFqTls0twzp7YJozjBy+TK
	v1sfunhHcqaUniMe+bEMlvXCGuYDvOI=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639--hD6tPz6MP-pdITBrx74GA-1; Tue, 20 May 2025 17:56:28 -0400
X-MC-Unique: -hD6tPz6MP-pdITBrx74GA-1
X-Mimecast-MFC-AGG-ID: -hD6tPz6MP-pdITBrx74GA_1747778188
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-72a48b91fbbso1190308a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778188; x=1748382988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I/zlDb7KnN1EE0TcCQ0JoPgED/9jrw+qsbSjcDT74Q=;
        b=nAAeZtBvt9HnHWTUDdzhu9nnkIaxl2CV5DAPOu3BBND9JoW8PJDFy9kP6DjqaEHRbU
         F1x44Kt9Ag+04v2E2Iw9s3Yrc6PPKMnGgZX7/v4NgRMGRDEJMVZOLNFnviHbCJTM7D1s
         qAOqt0X2B5RHPe44jkFYf5vkhgrxAPtVRZSath6iM3z0JJykamUJ3c+J/fILLa2x/n0F
         HnH502eiClr8qcX8oquyYpPHwneEwr1MlPTwfNToLyyUJ9trU8k84xdih/6HhMueFNSM
         AVvNUQ0lFUglUT4CZZauNUthqBgGiMpI44qxFkGN3fIDy1A/ILp9/e5AJsXsP13gS4o/
         Y7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVjkqS+0ZiYb5Htb0qC7Xhm/nboRqkF/z9TXJOhkXzTscd1Fzsp0OTaAwJD4okfUl7aapVx2oPbklpggz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpkhILssNCsXAcrqAiDsbI2RmjFi/hG2WWmUBQIzqpOtJnsmXv
	/Tuvg9lc2miVP3hQyR3xluspnAHDXJ1rCqEmCbSpZsoC6LEsKwAFwKqgjbt7Q0aFrF+rSe8/bCG
	+hrlSO9G4vMHzpHT0Azez1vHgFEPCFFVZbk0ScpgvsGqeTarD4c1rM9uyKhNiU+kiJg==
X-Gm-Gg: ASbGncs7npp5/wKV1jWmZ7ytqc1QG0bNCLOX+t3D5XDpOW/Pw9D8LYmSSbViRHtevWU
	5Panid8YDb80Jfkgc7BAbVX/GALlaLZvoVQnbmo0F7oJwCW+qU92KR479Izwry2AnY9AQkjkdME
	I0+HM+Qanf6tM9alKdtiDsOgsgjlawMTJJ4gyirG5SxajG8j8bZ1tzY6yIyFS1LNN2z7J8kbOtJ
	DJWkOk1hYCyWrV+w+E4/DhLzGT63DvrbdUyA84aY6sXPICKQAoPNu+xUnaJ1bppNJ5qAgYTA7ZJ
	nBgAlAaJCZUYUvI=
X-Received: by 2002:a05:6830:2b10:b0:727:3b8d:6b2a with SMTP id 46e09a7af769-734f6b91e7emr5189927a34.7.1747778187739;
        Tue, 20 May 2025 14:56:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk9JqMhUFPwxwAxuXj2yAnvft1vt3nStZWtHNmFycnDXM5L8C/WRYPVEXsZD3K/2UWIMr5xg==
X-Received: by 2002:a05:6830:2b10:b0:727:3b8d:6b2a with SMTP id 46e09a7af769-734f6b91e7emr5189917a34.7.1747778187411;
        Tue, 20 May 2025 14:56:27 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b3cbb4sm1971038a34.44.2025.05.20.14.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:56:26 -0700 (PDT)
Date: Tue, 20 May 2025 15:56:24 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, lizhe.67@bytedance.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for
 huge folio
Message-ID: <20250520155624.3d0fdc38.alex.williamson@redhat.com>
In-Reply-To: <8bd88c21-4164-4e10-8605-d6a8483d0aeb@redhat.com>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
	<20250520080719.2862017e.alex.williamson@redhat.com>
	<aCy1AzYFyo4Ma1Z1@x1.local>
	<8bd88c21-4164-4e10-8605-d6a8483d0aeb@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 May 2025 19:41:19 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 20.05.25 18:59, Peter Xu wrote:
> > Hi, Alex,
> > 
> > On Tue, May 20, 2025 at 08:07:19AM -0600, Alex Williamson wrote:  
> >> Peter, David, if you wouldn't mind double checking the folio usage
> >> here, I'd appreciate it.  The underlying assumption used here is that
> >> folios always have physically contiguous pages, so we can increment at
> >> the remainder of the folio_nr_pages() rather than iterate each page.  
> > 
> > Yes I think so.  E.g., there's comment above folio definition too:  
> 
> It has consecutive PFNs, yes (i.e., pfn++). The "struct page" might not 
> be consecutive (i.e., page++ does not work for larger folios).

The former, contiguous PFNs is all we need here.  We're feeding the
IOMMU mapping, so we're effectively just looking for the largest extent
of contiguous PFNs for mapping a given IOVA.  The struct page is really
just for GUP, finding the next pfn, and with this, finding the offset
into the large folio.

> > /**
> >   * struct folio - Represents a contiguous set of bytes.
> >   * ...
> >   * A folio is a physically, virtually and logically contiguous set
> >   * of bytes...
> >   */
> > 
> > For 1G, I wonder if in the future vfio can also use memfd_pin_folios()
> > internally when possible, e.g. after stumbled on top of a hugetlb folio
> > when filling the batch.  
> 
> Yeah, or have a better GUP interface that gives us folio ranges instead 
> of individual pages.
> 
> Using memfd directly is obviously better where possible.

Yeah, we brought up some of these issues during previous reviews.
Ultimately we want to move to IOMMUFD, which already has these
features, but it still lacks P2P DMA mapping and isn't as well
supported by various management stacks.  This leaves some performance
on the table, but has a pretty high return for a relatively trivial
change.  Thanks,

Alex

