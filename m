Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBB91B043C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868188; cv=none; b=HubtCa6T7FDzmG46WbccUFONLerwX8rLppIILvmSynhg12LD3rNBwu4jBMGnu7iVdyo1bE904Oa05cc/aJfYT36d7rPpD3rAxHSf0pWprUD65Z60i/asBob59PibcLauw4Xil5/MvhccwkyL3gFreQzp4fBbSDYkWuP2wb34MRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868188; c=relaxed/simple;
	bh=bJjDby/9sZrijN+ids6A58NLkAwjWoyw3fhTfNm3dp0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pvv6nHMKKc7Fjitf+GGdNthBc0s4ZFZWWMzMJz3ZEPusjWPMSlQmUpIzKU0DCeGTz7g2Q7+4oOL55hnr50ZeXhaIXExM57ztFKZjANfkOR4J6R7tEdTTeyK6PuG2RWdtH16cVlxXL8Gz4GdCK86PZZESKw5uSbSb13FfrOvkM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PKif0DD/; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PKif0DD/"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-601fcbff303so180632eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744868186; x=1745472986; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rbAxcGwpoL1a/w6FaoeJcZ41p0yQgucNaRioNQZI0nQ=;
        b=PKif0DD/JEPD13VFfoXpAURvY11ir5KHvBltcMHdfaozUytmXKoeB3GZ2Fn1i2K5CW
         Svx0WzpK+5aOtHjzvYbT32BGGT7m/WxSDXg8i10/YGvH+aYLJbG6CNSz80CY6jpfIRbP
         8J54W0PGPZJxS9eN6bEDOqGNZ0c1ZR8Yz2OhBMLEAz/lqjqEJcoEZN3ehi5F9YizZUUe
         j4P+l9TLP6LQvA1qZblMzrgipUUCaYd17EkxiDyNAcCnmFQKbGwRpcuX4B49S3QtJmZB
         AAnt+WXeBP80FVdDd0vpmWMbBgkXrEIbFfzEE1u959hk12dqIXRtyPqzflFHaT5es3E1
         qrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744868186; x=1745472986;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbAxcGwpoL1a/w6FaoeJcZ41p0yQgucNaRioNQZI0nQ=;
        b=FjhAm17f5Ej1R/9TZLOdQ8gmpFcTnOlg748tE503I1zHryet8W9NMEFnjGjGpAcUIi
         Yn0hInwZbLVIxNqzTdaksigwPIaSd++v1ETb9E5WxHHUo8AnJZJTu1Py70ccYatNwtIu
         f7ZgB1hKJWclX9O/hlIaNgy6DDMLb34FWuenlqUu/1TfEbMnFa5fWxaAo9iZIzi/8iTF
         TbwXMb6LlUbvnbYohyqT8j1IpBmZ9OF3Rjk0UhZc+orkpJYxuKAPpuJXFFhUYbvHAxnA
         kz1heP0G+uxoO9YJDe71T6HPBilv8eb3C6r9ZvNUUr1K8JlFXSa98MSt6UNkvhVKGZYE
         3utw==
X-Forwarded-Encrypted: i=1; AJvYcCWIeWWEPMz9i1Vw1fMhjsE+OUwAqZoH92FAe11S8pOtFr92R9yfd5Vew/KMn7fJPTS0GVPg63UWIq1mWGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVkkgsU2T9GcBXs4VDiBWppIhuxwRLA96o0FaZzF6LnnscF0+
	zcE712Nn5F61gsncf2yOJvM42V0l+u5I1lo42fxLkjfENOSzGqSF4wZareF0xw==
X-Gm-Gg: ASbGncsqWH2dvQnv2t8ppLE/4vZm13e98lmr6knf8g5XT9gxjiwT+kv0nr6EREEJIi+
	VifCeswkLOXVqmEnvrM0DXH9oz0YHYl+Mou8cEFJJ7J0bVSYxDbXBDHMzuduwYRcXnRK7IMD8kY
	VL0y8aKWv2qzbSTheyOTMlJ1efvsNWOryNRqpeW26YaiPDclBZuNhF1HI7OlYv6lgoKjehMHp1g
	S85RKedGTaOuaLjf059+L7+ryaTrH9kpqsiNKN8Ow5TMm16aqBhJqJJ9kcB+ggKcTn3+XPq2f9G
	0Q6dGkl/LCZTxrG3gHLPswOozdk0Ep0drXLmtJhZgDuW996lfb6dG3GSUvPTfoCASHVYFT5EoE/
	Re78LWFOs5h9oLXsNTJ44y0PEzusJFAGWf/g=
X-Google-Smtp-Source: AGHT+IHlY4uh4tg72MBZCncFUC4exIqngNyCqdf/5lSaKqmLEKhl+cIGqkzQ7/LtQKu1vqtXnBQMzQ==
X-Received: by 2002:a05:6871:7420:b0:2c2:b85b:71ff with SMTP id 586e51a60fabf-2d4d29cca06mr2569333fac.8.1744868186033;
        Wed, 16 Apr 2025 22:36:26 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096a20194sm3745837fac.30.2025.04.16.22.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:36:24 -0700 (PDT)
Date: Wed, 16 Apr 2025 22:36:22 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: David Hildenbrand <david@redhat.com>
cc: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org, 
    akpm@linux-foundation.org, willy@infradead.org, ziy@nvidia.com, 
    linmiaohe@huawei.com, hughd@google.com, revest@google.com, 
    kernel-dev@igalia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
In-Reply-To: <27d13454-280f-4966-b694-d7e58d991547@redhat.com>
Message-ID: <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com>
References: <20250414072737.1698513-1-gavinguo@igalia.com> <27d13454-280f-4966-b694-d7e58d991547@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, David Hildenbrand wrote:
> 
> Why not something like
> 
> struct folio *entry_folio;
> 
> if (folio) {	
> 	if (is_pmd_migration_entry(*pmd))
> 		entry_folio = pfn_swap_entry_folio(pmd_to_swp_entry(*pmd)));
> 	else
> 		entry_folio = pmd_folio(*pmd));
> 
> 	if (folio != entry_folio)
> 		return;
> }

My own preference is to not add unnecessary code: 
if folio and pmd_migration entry, we're not interested in entry_folio.
But yes it could be written in lots of other ways.

Hugh
