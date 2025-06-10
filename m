Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68E127FD73
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594169; cv=none; b=AEjKWe2dFypXpLN2vrP8taC7fzHSA39HdPXhJVNE/VJdriz2BbuF6DgdpUS6te4BqgPnA+E1EEXms+0qNXx2AMYOmV8ysFnmX69HSnJ5xRTZGhVgmjUUtC5byXcgztipXgkiSpiHQ31OISz/EXFwNgSkOLX2YI44OuzWlXahAfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594169; c=relaxed/simple;
	bh=XjgsdEhFvFB0B+RbA+5aNhRmFbtruOCW5OEOXUP/KY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0+4fYspyyqq3gc7LvUeMQDk4sL+3ipXLfKFUaaC5PrwtfP+AlO8dvnu7YSXRS/rgSNEkEWiQ9kj/c1JwSBc+q0mZeQq7AzROxlXBaPqebA2uPZUeIYY/VOeJOaiyeOif2sBDbPsMSbGDQOEf0hiaIz/IXTmqxsfNK2DhYmZu3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCHTEcO5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fCHTEcO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749594166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hLuQnm8GtR1mcurBIw5pIZijzYYYehwuFe+H/mrbon4=;
	b=fCHTEcO5pW9LwkRY5BIV0ozxL95f4kltQoSIfGqTUyeYuTrUwweYeEZS6DTK6mUcN70spl
	aEP/7/+dm9M/gCBsZ6wApSKV7CK++D5/LmbKldUVdMN/RZi6qBjaNssgCvvPvV/Hl23PAh
	m4eSU2C35P3qx6SsJnoXfKESMmfQ9Nc=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-IlGM5Ay0Nja6orgvnySxkQ-1; Tue, 10 Jun 2025 18:22:44 -0400
X-MC-Unique: IlGM5Ay0Nja6orgvnySxkQ-1
X-Mimecast-MFC-AGG-ID: IlGM5Ay0Nja6orgvnySxkQ_1749594164
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-60bf020e4a1so5117993eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594162; x=1750198962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLuQnm8GtR1mcurBIw5pIZijzYYYehwuFe+H/mrbon4=;
        b=pxqN+JaG6X4l5e84eITwRDf0gevfh/eRdoc/TppyrrKzgHdYh1Zhvt/pacWbzCCLqw
         tXlYNhUN+mYRdz99QByZy1o+A7ZF+5gDIJHujhtfSUx+AwLuGw3L0wpb85Jrbiw+kJPz
         qbDWOUxvSZv81tNJq4yXT5GfTsWlSolnC5aT9vZEhFUiVr43REYFc4NBNSzNMfNLC+l9
         B6ADKU2RaFqFOrf+xkz534iskaktTPyqi2VXMVF6YBDmwEajieXkvG/OrlazTYUWLXS/
         Xm3P/394gK+cHEBbf02Yq77wL3FBogbJJCNap8ZrnCIgttnekm3SNG+VBY7TUfC/MKY8
         4tKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnL8k0WteqEHCaGB/d39gLcbrsDwPaiIUd3QkVTEXHPIAD1REm9Ui6LJt18DsbYw/SwURfYu0U3AJ7zg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxi+K/Y97OkWyEl6CbI5oKyLxYqzvdfOiR43hNHY/vyI5M+4YZ
	JrO355gwEVCIEMfxkgzswT+xXnht+oKteuy6fXABtUY6ZdO6gLjR1gYe/vsVNrW32iyaV7PwIIR
	QHia2190i1UDXsXz9NqZj0mrOQz+XVRWNLLBBTHe+De8FKENtygYKotNxgtb8pA65PcBL05oHFg
	==
X-Gm-Gg: ASbGncuOnf7hvmgwZvdOXDhLyPFrWmFzgDEZOMrMRmHGG7KakzKH3byCA47TFyRCgc8
	KC7vciGB0r01LT1VPmtcrTzfXre4gkVx15UQotSPoneFw/DrS+LMhCaja5O9f+XScGQU728zdlY
	fkzagnmiC2JMCNgIWUEzwspWGhW2gIA7fOXyn1CHxmFTHB7Zmo+Gi2G7WRcGU9MXOnCodFluEwI
	cq65qG77WXz2F0GoArcJuUWSPPHo0eZ5/YjdT2hNp4+G7zTf1nZvCssP4/XOfgQjWrQHFW4Z4iB
	MidXmzxdIC72MQ==
X-Received: by 2002:a05:6820:c83:b0:60b:d676:b666 with SMTP id 006d021491bc7-610ef71ebd1mr503240eaf.5.1749594161763;
        Tue, 10 Jun 2025 15:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZPFHzLV7Sg4ZkCQBoFbsxw1VThpMG4z5lPpBVju0VP9CmUB6NZzQ74WH9fhjymqKd3HA8wA==
X-Received: by 2002:a05:622a:a18:b0:494:b924:1374 with SMTP id d75a77b69052e-4a713c4544cmr20646161cf.43.1749594147540;
        Tue, 10 Jun 2025 15:22:27 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a611150cb0sm78624171cf.11.2025.06.10.15.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:22:26 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:22:22 -0400
From: Peter Xu <peterx@redhat.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: akpm@linux-foundation.org, pbonzini@redhat.com, shuah@kernel.org,
	viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev,
	hughd@google.com, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, jack@suse.cz,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	jannh@google.com, ryan.roberts@arm.com, david@redhat.com,
	jthoughton@google.com, graf@amazon.de, jgowans@amazon.com,
	roypat@amazon.co.uk, derekmn@amazon.com, nsaenz@amazon.es,
	xmarcalx@amazon.com
Subject: Re: [PATCH v3 1/6] mm: userfaultfd: generic continue for non
 hugetlbfs
Message-ID: <aEiwHjl4tsUt98sh@x1.local>
References: <20250404154352.23078-1-kalyazin@amazon.com>
 <20250404154352.23078-2-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404154352.23078-2-kalyazin@amazon.com>

On Fri, Apr 04, 2025 at 03:43:47PM +0000, Nikita Kalyazin wrote:
> Remove shmem-specific code from UFFDIO_CONTINUE implementation for
> non-huge pages by calling vm_ops->fault().  A new VMF flag,
> FAULT_FLAG_USERFAULT_CONTINUE, is introduced to avoid recursive call to
> handle_userfault().

It's not clear yet on why this is needed to be generalized out of the blue.

Some mentioning of guest_memfd use case might help for other reviewers, or
some mention of the need to introduce userfaultfd support in kernel
modules.

> 
> Suggested-by: James Houghton <jthoughton@google.com>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  include/linux/mm_types.h |  4 ++++
>  mm/hugetlb.c             |  2 +-
>  mm/shmem.c               |  9 ++++++---
>  mm/userfaultfd.c         | 37 +++++++++++++++++++++++++++----------
>  4 files changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 0234f14f2aa6..2f26ee9742bf 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1429,6 +1429,9 @@ enum tlb_flush_reason {
>   * @FAULT_FLAG_ORIG_PTE_VALID: whether the fault has vmf->orig_pte cached.
>   *                        We should only access orig_pte if this flag set.
>   * @FAULT_FLAG_VMA_LOCK: The fault is handled under VMA lock.
> + * @FAULT_FLAG_USERFAULT_CONTINUE: The fault handler must not call userfaultfd
> + *                                 minor handler as it is being called by the
> + *                                 userfaultfd code itself.

We probably shouldn't leak the "CONTINUE" concept to mm core if possible,
as it's not easy to follow when without userfault minor context.  It might
be better to use generic terms like NO_USERFAULT.

Said that, I wonder if we'll need to add a vm_ops anyway in the latter
patch, whether we can also avoid reusing fault() but instead resolve the
page faults using the vm_ops hook too.  That might be helpful because then
we can avoid this new FAULT_FLAG_* that is totally not useful to
non-userfault users, meanwhile we also don't need to hand-cook the vm_fault
struct below just to suite the current fault() interfacing.

Thanks,

-- 
Peter Xu

