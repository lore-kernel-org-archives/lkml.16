Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601182222D1
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521596; cv=none; b=uvmnNWaXencGU91/I5Fb6o+2sDcYvQGfjpTdx03ngdff2TCVRC6AvRpFnC0KetnhjYmnbjE6sDFm2TVj091A14ILJgV5Q2Az+bWOvN5jqAY/U9Z7thDkp6iSN1MLDlAw+0xd3i5MEmYYzHIDbnsAtQoXrl9LAZcDczfK3B6u65k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521596; c=relaxed/simple;
	bh=Ips1ThzCTMC8otSrSexkSl52EhOw+XP3ODuE7HnPRFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cINEGLsFsDegUuvVFXzKpphff/jg4wAelavsuHCx0e2U0ervL+tEEo5ZVTcVRsJ8zZfuKXzf2+yY4UCjk8sKmg9Mes0ou9rbUBhQQA/x8JYEHJC9AhDzoDsZ8ebfJGw/BjH1cSw42YxrnnIUNUC0p2krtk3nVLAU6PSd0Ahk21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X8BfYew9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X8BfYew9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ede096d73so6596125e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748521592; x=1749126392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iawn1vCo/HSjOc7UESxgkG0YCsSSV1rH3zlvPOdpZLI=;
        b=X8BfYew9qPqP7APwScHBwh6y7TadnEOOMw492X7v9O5n3YbYox5C1D1y/Gcv8vn82M
         h5P4y4fWBBwgaY+lXTqF8Ig1TK2h+jnJtKxPpZGWcNYVH17B3k5Qu5K66ufz872c48wL
         xITDyj7qVgJC0gscZHGq7agOvzH5uefzOUx0U6bfM+zDxyBNzzLhPZ/CrrvyQlJUQ7jG
         5W9vMUfZ6baiIN6TMTG8lsmQIAUrQo481qqVOKgIl19+YoVHT5XxBB2xmKPVjTWTW0+4
         UxrI7t4RdNnab4rcVXQyanQJAoY38+9k72Gw8jv/2h0dztXmf2sK3VpOvSK9RDgPi9Ra
         E3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748521592; x=1749126392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iawn1vCo/HSjOc7UESxgkG0YCsSSV1rH3zlvPOdpZLI=;
        b=Bh3VUxEqd9Atw6Tx9LJqOm6P57kbbf4Yzq0hloWck2Wwqq/y3LSY208/90PFJ61uWG
         YGtbUPGSdt9IE/nF4Mlw51VDd22Vg0jrkLQDeRQrfS3ekVSFjLwBclzOX2UZHpLh1kVv
         9e7Uxcc4ClHxiBQfSGvOjDQl4N0ptvmOjSHCUcTqU7MaSOVMIWcnRjK3KggLjoJNxoRQ
         /0u+nae2wwURIqz+OJ6JSvfuTwSdtNnV2h13Sw8VKMJNVIpBsFaYOleZOT/e3p0MJeT3
         ogocfoT6tknGbcBwO3uUnAZMDB+Q/mPcOhfkh4B8CGMME9ZmkIoUtKBTX+6NVyUw7m68
         prAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwsbfTQDmoGkCP3GTJVB/5Dqt8ryB0AOrby8luiYy+vvkRLd8ZILiujwrcLUzOKYN/hB4r3iYYP/H6GeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUQ1u5ZHYRH1+eceTkUyRNwwdrgdlRCt6M88pkcCI9+N9xBAV
	raAkZT5/QMvJXDtU6+GeY1mvYF9WIyaNQGr5ajSa3qu39YeNqDg7rH0GtAP4soa36YM=
X-Gm-Gg: ASbGncurg+nxJ50QTVyujun3XFqPrXOUaccjKh7IPY1puchltxr8dcBgbFLM/IcWI7F
	5N9VwqlQeIhBksLFumzI0oM7uwxz9RNl7Ff1jJJEIwOnF2gq1v0MSDfzDSzGGWtfL8/7atNFrfi
	t9miEMLwLNAvrbGg8rpyj8yOZhce08erO5zDFPXNnVHPgewCBEt/galwToP9uGre7PLo5kUa/rv
	n4s5OWyWht6Dd03Ghz/8kKX9ohq+8wAaB+nu92viDGona3BHBAyFhmwcTzi38/d9hApV/52IaVC
	XUpfJ9SgouFdI4x7xHyB5XPKWdJWwy3KgEezYWCMjwV1XgxZqc0iBbIxsKebKG2mawv01sDCfOA
	=
X-Google-Smtp-Source: AGHT+IHXrBW9wsWcyYeTvN6V5sLeEne3uGLtPZraC+YCMYBnXf21jqTUKNAyRc5UNx5R4SMvt/BHHg==
X-Received: by 2002:a05:600c:1d28:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-44c9141d817mr185395945e9.6.1748521592539;
        Thu, 29 May 2025 05:26:32 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfbf42c1sm19208575e9.3.2025.05.29.05.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:26:32 -0700 (PDT)
Date: Thu, 29 May 2025 14:26:31 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Konstantin Khlebnikov <koct9i@gmail.com>
Subject: Re: [PATCH] mm: Strictly check vmstat_text array size
Message-ID: <aDhSdyzMD_e80zn5@tiehlicka>
References: <20250529110541.2960330-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529110541.2960330-1-kirill.shutemov@linux.intel.com>

On Thu 29-05-25 14:05:41, Kirill A. Shutemov wrote:
> The /proc/vmstat displays counters from various sources. It is easy to
> forget to add or remove a label when a new counter is added or removed.
> 
> There is a BUILD_BUG_ON() function that catches missing labels. However,
> for some reason, it ignores extra labels.
> 
> Let's make the check strict. This would help to catch issues when
> a counter is removed.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Konstantin Khlebnikov <koct9i@gmail.com>

LGTM
Acked-by: Michal Hocko <mhocko@suse.com>

Not sure why we have gone with the current check TBH.

> ---
>  mm/vmstat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index ae9882063d89..0903adace423 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1867,7 +1867,7 @@ static void *vmstat_start(struct seq_file *m, loff_t *pos)
>  	if (*pos >= NR_VMSTAT_ITEMS)
>  		return NULL;
>  
> -	BUILD_BUG_ON(ARRAY_SIZE(vmstat_text) < NR_VMSTAT_ITEMS);
> +	BUILD_BUG_ON(ARRAY_SIZE(vmstat_text) != NR_VMSTAT_ITEMS);
>  	fold_vm_numa_events();
>  	v = kmalloc_array(NR_VMSTAT_ITEMS, sizeof(unsigned long), GFP_KERNEL);
>  	m->private = v;
> -- 
> 2.47.2

-- 
Michal Hocko
SUSE Labs
