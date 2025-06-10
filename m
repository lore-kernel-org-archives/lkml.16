Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C8B299959
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561088; cv=none; b=KWTCE3rbbEHjiOrIyexBGCEE8Mrd1mQ1GiG14Xd2KkWPv3KMVWcT+hWMiJPoQCFSosDjvDqimhJeRXn9K43gyHscN2sUrYrBZ/acXPXolHQRmDrUh7n/XG0hIDrumlG7bBR0RXBpmOLb5RsBogHOi4KZluM0SgIHUHExgSDRhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561088; c=relaxed/simple;
	bh=MYPUHwF67Fearz+rOgxVPcNJW3AHAjWJJ8so8yTInSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTs9QfG1tNe9p73Sy68oUKUaUbP/K2qdRxTvR/e+cLZy8wJ8FbqnME+AL3GUulSkpQ6PZ5I6RaH5BJ5YbpfzfVEU+5tCxkjoXFpPTflm5DTrsMTEnG900/lOezktSr+P7nypPipQSDy15J9akLzPyoukvXAshHkx10x4uVE4uqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NqcNGqmJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NqcNGqmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhqS06saP1LVqx4PfgAfErKznxSNHLACuFCn7pP6egw=;
	b=NqcNGqmJ0Uvr25lwP0jgyD8qud5rHSOZXJyfdestcdJ+AZNVmOt9dHeUnvvy8UaKFA+fvY
	qNKv5hTd9kAWNwoXn+MkqTcYxs+2MEn174NQStRuutTx1iNvMyhMS5EYOT0CToyestRxXq
	/2qLUEwztki0q2DVk1JiKmC2EEfKkAE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-a2Pb_BqkMFGVoYd0o68BDg-1; Tue, 10 Jun 2025 09:11:24 -0400
X-MC-Unique: a2Pb_BqkMFGVoYd0o68BDg-1
X-Mimecast-MFC-AGG-ID: a2Pb_BqkMFGVoYd0o68BDg_1749561084
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d2107d6b30so708554785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561084; x=1750165884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhqS06saP1LVqx4PfgAfErKznxSNHLACuFCn7pP6egw=;
        b=i06EGs6Og8R7f9k+Gqigw9Bxmhe3msRSTWK0L+woPACQxCoKIw64dQsrO6hTEp9LHf
         bDbv7tHygBeybclVJBPN0jjzu/EfwB5nX3x9icYTo8RGfQaexiKUOA4ZRTExvqUEBnl6
         haMWLDmjWEJ2gRndrXQtKEe+C5XrMzmONRa6rFwWxEsedk8SIfNPQ1NmmsheY9esIxD7
         gwmCGVg5qmrtGbYhxXGzNM7VMBDKkvc5GoYmM8QynsxOzbxYeUj8mjQ5pu3KaBuf8hqf
         jjMa/ThBy2fdKbM6+usEjA17MnxFKhQhHT/g58oghAEs97J0mMsCLrguZHWu0suSpOx8
         K+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXfOVrgt5e3qn3Nl/A3V0v96hiqZKTbwJTCJcIkuitmugjOgayFmJrsMEPhpSJrXXdMsMnWEJwz+2ny+i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyKQgzS+V2g+J6LKgZUVoENPtu6FPhix1q/qLYo3DHMSat55FB
	nHszxEq4XFwnbf8iqjXCAKncXqCZmtSZas7rPWVFp2ag26e6b3w2+ckgPjbkjOK4EkRMI3FRdda
	Xz7hNmGWjZS6MamQl1qpJ9UIdGCGBdl359G8gS5rM6fZPp7TnUhhsUgNP1qck+Zek2Q==
X-Gm-Gg: ASbGncvbW8vWbf9aNSE9Ak+HP2ROEl+iyULd79lGzv+GP0csdR4uJNCSrrUkJZZDQr/
	fMytNJUcmzBXgjTCW5busxkkwcDmiNhzZGKsPyObdww5GyytCPd2ferexizcQf+D3xhSRZs2wQu
	T3HrwNdwKX4GKaEQCGrgANxXTsmnpXgHkq4QM7O5q2zXDC96EigyoM8woibtDf7/I/K+faI0fbN
	Y4vUY2uvp/1ruKHI3+bvW10XoBuFDV5zGHHkrj1OzR9Mb4UoxIq/943Vgm7DpzuFW5QVIDkey4f
	JLRrVryC76hxIQ==
X-Received: by 2002:a05:620a:2894:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d22978d152mr2576821685a.0.1749561084045;
        Tue, 10 Jun 2025 06:11:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5Kg4madu7LuU/8MhY9BTy7JYlDFWkE0RIx1LsqTkElbqQyUnF78engArSsUFzoomYY/zZkQ==
X-Received: by 2002:a05:620a:2894:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d22978d152mr2576816985a.0.1749561083551;
        Tue, 10 Jun 2025 06:11:23 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d38e0b379dsm416030385a.117.2025.06.10.06.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:11:22 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:11:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	David Hildenbrand <david@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] userfaultfd: remove (VM_)BUG_ON()s
Message-ID: <aEgu-DA3pgKSYHRK@x1.local>
References: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
 <20250607-uffd-fixes-v2-2-339dafe9a2fe@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250607-uffd-fixes-v2-2-339dafe9a2fe@columbia.edu>

On Sat, Jun 07, 2025 at 02:40:01AM -0400, Tal Zussman wrote:
> BUG_ON() is deprecated [1]. Convert all the BUG_ON()s and VM_BUG_ON()s
> to use VM_WARN_ON_ONCE().
> 
> While at it, also convert the WARN_ON_ONCE()s in move_pages() to use
> VM_WARN_ON_ONCE(), as the relevant conditions are already checked in
> validate_range() in move_pages()'s caller.
> 
> [1] https://www.kernel.org/doc/html/v6.15/process/coding-style.html#use-warn-rather-than-bug
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/userfaultfd.c | 59 +++++++++++++++++++++++++-------------------------
>  mm/userfaultfd.c | 66 +++++++++++++++++++++++++++-----------------------------
>  2 files changed, 61 insertions(+), 64 deletions(-)
> 
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index 22f4bf956ba1..80c95c712266 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -165,14 +165,14 @@ static void userfaultfd_ctx_get(struct userfaultfd_ctx *ctx)
>  static void userfaultfd_ctx_put(struct userfaultfd_ctx *ctx)
>  {
>  	if (refcount_dec_and_test(&ctx->refcount)) {
> -		VM_BUG_ON(spin_is_locked(&ctx->fault_pending_wqh.lock));
> -		VM_BUG_ON(waitqueue_active(&ctx->fault_pending_wqh));
> -		VM_BUG_ON(spin_is_locked(&ctx->fault_wqh.lock));
> -		VM_BUG_ON(waitqueue_active(&ctx->fault_wqh));
> -		VM_BUG_ON(spin_is_locked(&ctx->event_wqh.lock));
> -		VM_BUG_ON(waitqueue_active(&ctx->event_wqh));
> -		VM_BUG_ON(spin_is_locked(&ctx->fd_wqh.lock));
> -		VM_BUG_ON(waitqueue_active(&ctx->fd_wqh));
> +		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fault_pending_wqh.lock));
> +		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fault_pending_wqh));
> +		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fault_wqh.lock));
> +		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fault_wqh));
> +		VM_WARN_ON_ONCE(spin_is_locked(&ctx->event_wqh.lock));
> +		VM_WARN_ON_ONCE(waitqueue_active(&ctx->event_wqh));
> +		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fd_wqh.lock));
> +		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fd_wqh));
>  		mmdrop(ctx->mm);
>  		kmem_cache_free(userfaultfd_ctx_cachep, ctx);

I didn't follow closely on the latest discussions on BUG_ON, but here I
just stumbled on top of this chunk, it does look like a slight overkill
using tons of bools for each of them.. even if the doc suggested
WARN_ON_ONCE().

David might have a better picture of what's our plan for mm to properly
assert while reducing the overhead as much as possible.

For this specific one, if we really want to convert we could also merge
them into one, so one bool to cover all.

-- 
Peter Xu

