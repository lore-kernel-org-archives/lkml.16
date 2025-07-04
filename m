Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7142E3713
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649020; cv=none; b=XlIJlCWgSWZ3eHMUP63uMTZhBuY6Ho7RnOBYIjHjnmpsCX4rzfPc4ExjyXjNlBDhxiVzZVk8WFFn1H/nQpIYd6TwpduzHkARxnghKSWaNEDj9risR+KQsbIYFUSHnq73cnufa7Tcuxt9iH/P2kOSgnUV3K7CnVbhbsCW/Vf5DWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649020; c=relaxed/simple;
	bh=zxrkdAiFk6+qSiSPGLL6JP9HtsVfhKzO6Gu1CDAueg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crhXfqFr8tsbGD0hWx0drgSvVQ9b+a9/2Q5kjwc+dp7Zh711ck9jjwITZbiiFc9XFpksqfF4tJ5ChbUNOMiQ+nyN9GpoVa1GpL/khN+y8BZd9jOfv5QLrLC+uRM2gJtj3yfnqXXOXfGoQIp8xIISxT7Bx2dcRt6HdVXA+eeA1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TaC04RWm; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TaC04RWm"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fabe9446a0so11065696d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751649017; x=1752253817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKBPSHNtfNO5LT8u0teRUOyyycsSMFwL+mt0ehbz6ak=;
        b=TaC04RWmCby1vIGdf1qxILnfiKYaGt+BOla1xi3Cn/QlWpm3YwlEZvOZJQ7hOmoPgc
         5a6sOiQK7f7UV9odOClzp5R3lCCMt01q67H7TXm//5hEG344p30C2+CW1bBzUXh8zrYi
         0sUCWHJCnjHQOXHtJlvdK45hdpAtZxiBpKps/xA6c/ySydt/4g01TnN8Dp5m/pjyTXje
         IV166//U/yi0niR36M6AuNHTy3SbCoW08odAVnRU7+m6pOeKFJv6zXEmhjO8n6uWuGmV
         fMPauOlbSnQElFl9wcS0Oj5c2r9rJ+IvWKFm4xWJBpXknFPZWp1tS+pl3gAq5wIL3fBz
         Mllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751649017; x=1752253817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKBPSHNtfNO5LT8u0teRUOyyycsSMFwL+mt0ehbz6ak=;
        b=q/j8u2urFWqB8np73rdLeBqFZO0VpwDPPKp9/ptnM/f0U9MRl/gGB1CCV/hsCPqNhI
         7o/UOKjxxwlR8Yb2ePPGGM+61CYsvRihpneHCvj/mc3l6BiyTqZq6d+FcKN0dCYvv5Kb
         /iT+RaWBGtx7ngDbUzVWohvxU5mjd/OJq3gOW4ClcNVxO3uHV/kibhtxc2c1AREKdDxX
         OLcSoL5Y/eP9/81Jqv3N7MPpp6WUPstxgulspJOxDoR2jJ8BaRr7cfy5ciPM3cTrMoDc
         LRnDy0WFydddrqjJj+NRD5vi+kbz/0m6A/FuKN1VA4QxNn2tRYJ1vHruZztWFQUCIKQg
         CmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7u7iJRb/FTqMuHmOGr24xBa09pGvIl1NyTDMUvu/JATYP+fWzrHryNZR3IsBp1Dhl4XBSAyz47a41928=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/WXCol6JVu3ksDlewIvBIzRysB0g5I/wQaAAsxbLsScPbvd8P
	LJQz07+6gDLr2fhXaoySShSYjmqPLyN2uBrMjSlmQa7LjukOgihpse2a+nBcGmaXvCc=
X-Gm-Gg: ASbGncvtoPUD76/DzC6neTlmH+fXxTJXYHSC7OwX/XWNRZ7ypaKnbThWUTvEXOyFydc
	bU7pvZGulZsfcS42EGCcbi2rzph64D2yKlOJYS5A1XWbYD+zKV0sD2IORbkmZhTE0ArtdAive3o
	WcXQWgLKFky2fMSk8duu5jQHFD95o2ObFqR9GdCjdvTVTmFzjFFtQ8ZtbJhqSuXmiqvk6iMLSZK
	uj6oXc7kM+DL1f0vT5nrQppKnMm9LlQWzGMs+0ch2wDbip0AWaJIkL4TMcHxCvJTjfoaLJfeVPT
	/8w43mihf9Oc4PmSfoj0GnliNOduICQqRAGc
X-Google-Smtp-Source: AGHT+IEg7qVP2CjAMDTbXuVFzsZsRb9dCmCxWXsJAWGCAwkfKa6vv6QYxuBKdxDoMFHisCmXbv0yQw==
X-Received: by 2002:ad4:5c4c:0:b0:6fd:26bd:3fe9 with SMTP id 6a1803df08f44-702c6ddb21cmr54827886d6.36.1751649017036;
        Fri, 04 Jul 2025 10:10:17 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d50e20sm15312816d6.72.2025.07.04.10.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:10:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uXjvT-00000005zBS-3bpa;
	Fri, 04 Jul 2025 14:10:15 -0300
Date: Fri, 4 Jul 2025 14:10:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: lizhe.67@bytedance.com
Cc: alex.williamson@redhat.com, akpm@linux-foundation.org, david@redhat.com,
	peterx@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 1/5] mm: introduce num_pages_contiguous()
Message-ID: <20250704171015.GJ904431@ziepe.ca>
References: <20250704062602.33500-1-lizhe.67@bytedance.com>
 <20250704062602.33500-2-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704062602.33500-2-lizhe.67@bytedance.com>

On Fri, Jul 04, 2025 at 02:25:58PM +0800, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> Function num_pages_contiguous() determine the number of contiguous
> pages starting from the first page in the given array of page pointers.
> VFIO will utilize this interface to accelerate the VFIO DMA map process.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  include/linux/mm.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0ef2ba0c667a..1d26203d1ced 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -205,6 +205,26 @@ extern unsigned long sysctl_admin_reserve_kbytes;
>  #define folio_page_idx(folio, p)	((p) - &(folio)->page)
>  #endif
>  
> +/*
> + * num_pages_contiguous() - determine the number of contiguous pages
> + * starting from the first page.
> + *
> + * @pages: an array of page pointers
> + * @nr_pages: length of the array
> + */
> +static inline unsigned long num_pages_contiguous(struct page **pages,
> +						 unsigned long nr_pages)

Both longs should be size_t I think

> +{
> +	struct page *first_page = pages[0];
> +	unsigned long i;

Size_t

> +
> +	for (i = 1; i < nr_pages; i++)
> +		if (pages[i] != nth_page(first_page, i))
> +			break;

It seems OK. So the reasoning here is this is faster on
CONFIG_SPARSEMEM_VMEMMAP/nonsparse and about the same on sparse mem?
(or we don't care?)

Jason
