Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3EB1DB366
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990871; cv=none; b=Jq7Q6gRYPywkjZmgIXEPfS0XQ/59EfoGkL1RPlupWiOO2seoERemfU5EXKaIijgJ9NZURw9tTE6bOJc4CMFlmLUn5yzUJFrFUuEwrSQ+oerVS2qMdhmbxD/EvC0vqPPyhzqowzSBJYg+/tP0vWb2GyflOID5aify+nt4OpmnP2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990871; c=relaxed/simple;
	bh=6AD71GZ1oJAgToKv63EU9Cvf388e1iJs65ueGm/PeYg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k0dctW385vH0o/4Plel7WMygHiPqchH4UUbmV3CBmqYavs5bWwlfYC/eEBKsFi5IVuT1NJb1Ul+bD0kEUzL3DnqZh85OIB6VJEpCaQUGwYbZtTrgU6BgLXdsL/z9dcJC3Hg9gdigl346FDWztRJO65PT66Hfyx1cQs1qA2au+NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hP9TFbWg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hP9TFbWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747990867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W9137AuC1JXl/uRnv3Q7irr3oyxG/GyI+XTAgsgelrk=;
	b=hP9TFbWgSuC4evXTGoYuZ5DdbKmI7+YCFf6g7Z3WUvh/xiF2MnbHhAAumEObhhXpRY6fMm
	jBvWl9I4QKXBbKeWh73GNWBulfZAC+JyzjCA5jRVu0ONJAd2OQBttAgv3kft3fPk/t70Zj
	ln8bwle63CR090vEmNTGzomN8CRpyR8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-GulIpx3KNrK7FfBJd2H5_Q-1; Fri, 23 May 2025 05:01:05 -0400
X-MC-Unique: GulIpx3KNrK7FfBJd2H5_Q-1
X-Mimecast-MFC-AGG-ID: GulIpx3KNrK7FfBJd2H5_Q_1747990864
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-327fffcbf86so21313961fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990864; x=1748595664;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9137AuC1JXl/uRnv3Q7irr3oyxG/GyI+XTAgsgelrk=;
        b=XQz6/xT9kE65N4E0Q2fOFAAauy5QtnfEyfrBorRGIB6eCOYRhZyW0sNcYm5RkSqd8J
         2Zsrw/fjnDnCGJ7TRlnzdTQX28mmEekQYHY+Z97KN1WtqgMuSqd6RrIPGf5JeLba8Irv
         93oGK8M3gbTVcW2zcLWzM7eucsYirzSJlkX/p6MjvEK8FwsY8szwyLY1FAU9O3Y6gLXk
         xMUWsx5FIBk/N1B/bTOxUFFLN97oSpppgt0LildTqF3+8N8Y5WnfO3EiDAEnkfbKIytw
         JJL2H03ZCu2+xIcSG1LhlFJNWt2kk1xKv8EJkwOCRU3YvtwUt6YJmchi/hsyQ+MLntsl
         gM1w==
X-Gm-Message-State: AOJu0YyoCOvdTMZA/Ujzcm9PYhInwtIU+PUDd+M7uO8EAHVuVvu/JYR6
	FzkYOegOB+RZNOznivcWNojKhwQFssa7qjRI7t/2cBj2U1f0pPFjIpgXuOcxnKt24g+NjQRqQ27
	xqloKYFcoDUWjrHgnBvWrcTU78XdlghKKBrMd0C7wyra33/Ph/hLYT6FPU6h2dRbNcg==
X-Gm-Gg: ASbGncvo//AkHU+Fq/u9YhD2xwzeBOodnU1/+jQSyb5+h/fCLu61+gMTGBdzGCtIeen
	3DSvP9vDcSWMWvAdN//ptUsFwBgyxKYTa7b6sDLCHyS8N7bZ215E6CdWdDN9/e+sSLxri/g3Ds6
	xOHgtpnm1WpZ+k/dvzxxd0UDSyiWBa1ttPHMlchSOpzb1mHKV9HT0JIijBdZ9n63egN0lfemYaA
	R9FrIhMngOYe+rk94Z9HeKM2wjTir4VwCZurlRweCc54gHv9FI9B4zdflDNQb8tWWF3YmGtcs/E
	omM61K5H
X-Received: by 2002:a05:6512:3d05:b0:549:4bf7:6463 with SMTP id 2adb3069b0e04-550e98ff25dmr10391790e87.44.1747990863803;
        Fri, 23 May 2025 02:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZQSs+uyNdVjrDhVHs2IglUPHTshvnWvanx+qtFny8cuAL31NdNk4CU+Vw4AmeBNf/utBp3w==
X-Received: by 2002:a05:6512:3d05:b0:549:4bf7:6463 with SMTP id 2adb3069b0e04-550e98ff25dmr10391773e87.44.1747990863352;
        Fri, 23 May 2025 02:01:03 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f606sm3782184e87.238.2025.05.23.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:01:02 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 957971AA3B8F; Fri, 23 May 2025 11:01:01 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Byungchul Park <byungchul@sk.com>, willy@infradead.org,
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kernel_team@skhynix.com, kuba@kernel.org, almasrymina@google.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com,
 andrew+netdev@lunn.ch, asml.silence@gmail.com, tariqt@nvidia.com,
 edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com,
 leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Subject: Re: [PATCH 01/18] netmem: introduce struct netmem_desc
 struct_group_tagged()'ed on struct net_iov
In-Reply-To: <20250523032609.16334-2-byungchul@sk.com>
References: <20250523032609.16334-1-byungchul@sk.com>
 <20250523032609.16334-2-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 23 May 2025 11:01:01 +0200
Message-ID: <87bjrjn1ki.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Byungchul Park <byungchul@sk.com> writes:

> To simplify struct page, the page pool members of struct page should be
> moved to other, allowing these members to be removed from struct page.
>
> Introduce a network memory descriptor to store the members, struct
> netmem_desc, reusing struct net_iov that already mirrored struct page.
>
> While at it, relocate _pp_mapping_pad to group struct net_iov's fields.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  include/linux/mm_types.h |  2 +-
>  include/net/netmem.h     | 43 +++++++++++++++++++++++++++++++++-------
>  2 files changed, 37 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 56d07edd01f9..873e820e1521 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -120,13 +120,13 @@ struct page {
>  			unsigned long private;
>  		};
>  		struct {	/* page_pool used by netstack */
> +			unsigned long _pp_mapping_pad;
>  			/**
>  			 * @pp_magic: magic value to avoid recycling non
>  			 * page_pool allocated pages.
>  			 */
>  			unsigned long pp_magic;
>  			struct page_pool *pp;
> -			unsigned long _pp_mapping_pad;
>  			unsigned long dma_addr;
>  			atomic_long_t pp_ref_count;
>  		};

The reason that field is called "_pp_mapping_pad" is that it's supposed
to overlay the page->mapping field, so that none of the page_pool uses
set a value here. Moving it breaks that assumption. Once struct
netmem_desc is completely decoupled from struct page this obviously
doesn't matter, but I think it does today? At least, trying to use that
field for the DMA index broke things, which is why we ended up with the
bit-stuffing in pp_magic...

-Toke

