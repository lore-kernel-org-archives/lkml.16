Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E1E1F152D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126910; cv=none; b=Q0QQa3Dn4+2YNfd37hj3vhKE1EZv0FzRAOZe791PzvyBfD2g+yAkxudPCc4jjFH62P6/Ltygus1wVG6L0Z20JZNI2fMHbOvjq6LFQXc1M69xpoahQ/PdNh/Q8TSlE3+m3Dn5hgORpukI1kisnwR845IsuZLHRBlF69xiQDKEmf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126910; c=relaxed/simple;
	bh=U/i4uH3kM+S6kLe5afS1kAMvVcBjM8ybM/fDaH8kgrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5HYseIJ1C11dZxOQCRqm3Jk6ZX1v4xPnHawd8A+3eAxY1FVyaE/o1a4rUrO1wMNpdKRvKXJBD7fYAh0xzUC7frSJpMkLgY2P7Rh2UqTqZ7AQi8u6xoIxJ0Z9E9jGKplBGsJ5MC3+9krNHmDicm+zv7+kY+0d/s/NFXpKp4+6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IH9+AJjU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IH9+AJjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747126907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UnQUH5Q5eCGDI90Yhe6HTJFrwvTqtj4aMBSVt+pggLc=;
	b=IH9+AJjUntYgCpVHCdKAficS+ULiesDpi5GtWipRl3diXp+qehFNup/pnXVsTxdXQWHkKI
	g3BW4WRjKlKigTiBkkZViLOuw2UjLonDjVgivF1DsT5qI8fNP/0j/dUy9UK3r99mI7QCiP
	38Xzu0tlkNBjqrqa8/ragrD5Eqvm/Hk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-zLM1lPSAMCOAKhLvI_9Tlg-1; Tue, 13 May 2025 05:01:44 -0400
X-MC-Unique: zLM1lPSAMCOAKhLvI_9Tlg-1
X-Mimecast-MFC-AGG-ID: zLM1lPSAMCOAKhLvI_9Tlg_1747126904
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so17155095e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747126903; x=1747731703;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UnQUH5Q5eCGDI90Yhe6HTJFrwvTqtj4aMBSVt+pggLc=;
        b=wVOFCrsee7QH+TkeKnELyLV10nOHLBBvdpuk/GdzTOciNPDMim2suf1ekI6oxB/Aoo
         pGZAjdtVTWphdZk98rpABaS2UFCGHzTeIRcYdlIIal6mFiNoDBwo4PiKqrg95qIq2YDK
         j09Ex51EzwGSoWJ195PIWGQl1UNw36Dxj5gdap+SdWdnMx8UiGkV/u0L47L5Iq5mp8IG
         OBA4w2p6ozOaesLdoFB1zozS904bEnkSgBgCARFEZT7Jz9VJF2Zi9IiwkCk+c7ocVuDs
         CnAzeN6Sh0KHo9RxUEVmQrrjLPfWITtjX1PZNgJZWwut4SWuYj1qsO+q5FuOEwV7ydxM
         WiaA==
X-Forwarded-Encrypted: i=1; AJvYcCXFVOdEeTHHZBAmr37utpvTy/YjsrBJXE1Y4NFJiqoOhwvgJwf0ezzAKBek9GxeMBdHuNoVh4VtLxH9w7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgjafToP67okIfEhd/xEMTts/Hc0vzM1r12Id6BJNsvMRi0AxQ
	5xrlCh+Y8DbkUdwV+DPwcE0MjICK1XKR4rDbWJ+JT3RkmxUOnHwAQ2QKsGUPq160B43FsL0nSP7
	yUEHGCxkkeeAJhpw61ty4UzBeaT35IWyo1dLswC7AWVow3At/U+Xhau0SWLDkXA==
X-Gm-Gg: ASbGncsNxrfrEPWTcxnFQS2QEhmRtWxJJottXvwb4eYrlGyZUbkmMNUDskVxhB7SfQ9
	uoEClNS5MKpD5KyyDpln5Zj93bcWFNFvzef0h6UCRhmZ2cSb/ava730qvkN5zIP8vDXUT4WIVSv
	bv2jHS1HE65YRN/fUIjaKP7g6zpEbwDzNALTPvkqvELoVwebMasJlVTAiisGjI6TG3cetSt1LdY
	IDM0OGe/okIbN6DIeZeSZFPPuMbg00t664VekdYa0EiaLRuZWrBPSMMPwteWr/iHpIISndgJmQR
	/q4hO+Q+p0KODvj5+Jf4jSJwLMKTK3gUWUbDHZ48pQZ+/kgTAt0vtI313ykP1RxQCzOqhSRzxT5
	DJ6XDnnASngekQYPJkuIVFrN1CgIk5RDvi88yM00=
X-Received: by 2002:a05:600c:3b17:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442d6d08c20mr127487915e9.5.1747126903634;
        Tue, 13 May 2025 02:01:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQh8vWmwSFoYbxUWYTJYfH/WUlgqiMI4bo91LfCTJvKVbB+20aP3M+QcIqpVB1vVzK5XwHTg==
X-Received: by 2002:a05:600c:3b17:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442d6d08c20mr127487585e9.5.1747126903215;
        Tue, 13 May 2025 02:01:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34? (p200300d82f4d1a004fdf53e21a36ba34.dip0.t-ipconnect.de. [2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebead502sm18259775e9.6.2025.05.13.02.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:01:42 -0700 (PDT)
Message-ID: <cd003271-73fd-47f4-9c32-713e3c5a05fc@redhat.com>
Date: Tue, 13 May 2025 11:01:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mm: introduce new .mmap_prepare() file callback
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Wilcox <willy@infradead.org>
References: <cover.1746792520.git.lorenzo.stoakes@oracle.com>
 <adb36a7c4affd7393b2fc4b54cc5cfe211e41f71.1746792520.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <adb36a7c4affd7393b2fc4b54cc5cfe211e41f71.1746792520.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.05.25 14:13, Lorenzo Stoakes wrote:
> Provide a means by which drivers can specify which fields of those
> permitted to be changed should be altered to prior to mmap()'ing a
> range (which may either result from a merge or from mapping an entirely new
> VMA).
> 
> Doing so is substantially safer than the existing .mmap() calback which
> provides unrestricted access to the part-constructed VMA and permits
> drivers and file systems to do 'creative' things which makes it hard to
> reason about the state of the VMA after the function returns.
> 
> The existing .mmap() callback's freedom has caused a great deal of issues,
> especially in error handling, as unwinding the mmap() state has proven to
> be non-trivial and caused significant issues in the past, for instance
> those addressed in commit 5de195060b2e ("mm: resolve faulty mmap_region()
> error path behaviour").
> 
> It also necessitates a second attempt at merge once the .mmap() callback
> has completed, which has caused issues in the past, is awkward, adds
> overhead and is difficult to reason about.
> 
> The .mmap_prepare() callback eliminates this requirement, as we can update
> fields prior to even attempting the first merge. It is safer, as we heavily
> restrict what can actually be modified, and being invoked very early in the
> mmap() process, error handling can be performed safely with very little
> unwinding of state required.
> 
> The .mmap_prepare() and deprecated .mmap() callbacks are mutually
> exclusive, so we permit only one to be invoked at a time.
> 
> Update vma userland test stubs to account for changes.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   include/linux/fs.h               | 25 ++++++++++++
>   include/linux/mm_types.h         | 24 +++++++++++
>   mm/memory.c                      |  3 +-
>   mm/mmap.c                        |  2 +-
>   mm/vma.c                         | 68 +++++++++++++++++++++++++++++++-
>   tools/testing/vma/vma_internal.h | 66 ++++++++++++++++++++++++++++---
>   6 files changed, 180 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 016b0fe1536e..e2721a1ff13d 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2169,6 +2169,7 @@ struct file_operations {
>   	int (*uring_cmd)(struct io_uring_cmd *ioucmd, unsigned int issue_flags);
>   	int (*uring_cmd_iopoll)(struct io_uring_cmd *, struct io_comp_batch *,
>   				unsigned int poll_flags);
> +	int (*mmap_prepare)(struct vm_area_desc *);
>   } __randomize_layout;
>   
>   /* Supports async buffered reads */
> @@ -2238,11 +2239,35 @@ struct inode_operations {
>   	struct offset_ctx *(*get_offset_ctx)(struct inode *inode);
>   } ____cacheline_aligned;
>   
> +/* Did the driver provide valid mmap hook configuration? */
> +static inline bool file_has_valid_mmap_hooks(struct file *file)
> +{
> +	bool has_mmap = file->f_op->mmap;
> +	bool has_mmap_prepare = file->f_op->mmap_prepare;
> +
> +	/* Hooks are mutually exclusive. */
> +	if (WARN_ON_ONCE(has_mmap && has_mmap_prepare))
> +		return false;
> +	if (WARN_ON_ONCE(!has_mmap && !has_mmap_prepare))
> +		return false;
> +
> +	return true;
> +}

So, if neither is set, it's also an invalid setting, understood.

So we want XOR.



const bool has_mmap = file->f_op->mmap;
const bool has_mmap_prepare = file->f_op->mmap_prepare;
const bool mutual_exclusive = has_mmap ^ has_mmap_prepare;

WARN_ON_ONCE(!mutual_exclusive)
return mutual_exclusive;

-- 
Cheers,

David / dhildenb

