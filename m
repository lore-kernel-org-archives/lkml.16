Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05627F747
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751395457; cv=none; b=u1mLK8YD3Fs55mjZw/zxvFxD4QMkB6BEPdYCaV8/CLXnkyNzmmnS6+RmdRTWoz2pKb4VLq/Z6q9DJUcvQIboHH1c7AOGflO8hUI2ppwODRrjvtyloFSkVvVTJMVNLfJL8kHU31Ht/IRPb+rUGwvzYMrbCynX62rRPh0xlJe0hB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751395457; c=relaxed/simple;
	bh=XxCfSEjtjaSZltUbpvXMesU1QT4p0E2tGxP916QxpmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhGb0QQQOuxB7MrP+XHtHmAL89IeGBRcHbi9p7LGjtWIZd8lc3nsOrQVNwcJjbWC33GKXSqS20XCRpuQoUdLMY5rnY5Wge0Pogiv9vH3kZFXZpvlihYoYyk+5r3BxZvH/i370Q1m07fhC+M7vid5D06m4BDg7sA+yXu10V0JCdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gP3MHXRl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gP3MHXRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751395454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tsMA9sGyXoJcpDwV8x7Yni+aEwSr6H4VqX6EoaMsSq8=;
	b=gP3MHXRlfVyrZBCQdW9QkyqUY+NYT7/z2IZKuXzZvUYAjvJ4cfKfYRGC0UF2TJlqFvbVVu
	4u7v6mWiy4DNTcvwETx0To/JggezkJykJd9CaMcH0+hf5TQb5AmwLflThnLqJx1m4D1/V7
	es4+O97eAAlL8m/17q0mCPqjteumg6o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-pAboNCu8OIWRL6_UIiwF2Q-1; Tue, 01 Jul 2025 14:44:12 -0400
X-MC-Unique: pAboNCu8OIWRL6_UIiwF2Q-1
X-Mimecast-MFC-AGG-ID: pAboNCu8OIWRL6_UIiwF2Q_1751395452
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso1697101f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751395451; x=1752000251;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tsMA9sGyXoJcpDwV8x7Yni+aEwSr6H4VqX6EoaMsSq8=;
        b=fSwDx+j8GPghcNzMhWGFP//sIManSvkXvObft/iV+SKMDUTPqrtcH1ThYopUj1EofK
         tAK6yFwndPyv3aavamc51Zd1vgeCmbMmSxStoRusXQW+6h4haVoZYFOvuATXZSmLujNQ
         kKSyqYTg7kGPQTRVPhjOahv66mubBY0ihsQK/jYOoKf12nfiwCi9UMUP1+x48KHC04L9
         buGQk26oUyFBwmTRJEhxpmIOoEtpz1e6aiFx1uORf2GOdn5ey6q0uDFi8gEna3emzEEa
         RdQo80Yd0OLRW4UE44OkYIUpmK3DvvEfwvEAA4XA4Qar73VDB6PzNPp6yRSCtSGYBpzh
         4vag==
X-Forwarded-Encrypted: i=1; AJvYcCVAsrilEzbLcfMK0R6ryTgfRbZWwbzwf/deD7u9x9b44WsqpdQAC8MJJ+fzgdSjfJcLO1+mcU/+t5OR2W8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyum2awQWFtByUrFlvr+KgUqQoift5L1rjcxdQhA69dALHJznEQ
	OHaHOtF31Z7+cb62bc/8GYnEsw8s3grkQRZfAgrZcCAEkeqGPeZuHeE/i75g9XyqunsEW4ITM2V
	+Of5BFpO0b2/sDh65lWPSI2K3yheaTT9XLMXQWBAksnlcl39xMiSLQBRu4kTNfaKL7msVgTVojf
	Ns
X-Gm-Gg: ASbGncu3YFDx/TM43qhyCyNrvbjDcGfFYQlEHxzMlpP3dSQRKWhEL9KGSONq0ODJq6n
	CPQBOsYty/I+ek4t9eIcj2B4dWAuTk2OPni4xNMkzckPcScwA3n1ueSBIX3NKWPVq5PXPzcdkmV
	8vE1rsmLhDdDr/Gxj1/k20sn2tJL1eJgF/wC+71xR8tgC8nVaqcvyuIReZkvMKa0/Vkmau7Idfk
	7pCmNDIK8GRiUIQyi8QywGYU/Sa47dqOJwn3WrlvBeYZiJQlX8UszTI78Cj+4ngtFWqaovcicM3
	k0Rp2txeMtoMHvGRzZ99yAURflOxsDTTB9XkqNZBlAK453TIXrwtpcTb1VVs5fDe1XtKXX2P+eF
	wJgcLkd/F0f2uR82OOAJTL7EfvXBwSk8sELQAEBzpZq+WNqZA8g==
X-Received: by 2002:a05:6000:25ca:b0:3a5:8abe:a267 with SMTP id ffacd0b85a97d-3a8fe5b1cf7mr15494575f8f.29.1751395451439;
        Tue, 01 Jul 2025 11:44:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEiu+HOO7ZqRFhiw6UbQJa//RpfFGsa7LtdJ3czOqqBBu2XbznnQzAzb+rNgDsMM+/c4IrcQ==
X-Received: by 2002:a05:6000:25ca:b0:3a5:8abe:a267 with SMTP id ffacd0b85a97d-3a8fe5b1cf7mr15494553f8f.29.1751395450897;
        Tue, 01 Jul 2025 11:44:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59884sm13666285f8f.80.2025.07.01.11.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 11:44:10 -0700 (PDT)
Message-ID: <fa3a6258-5304-40b2-bb58-e6081ed845d1@redhat.com>
Date: Tue, 1 Jul 2025 20:44:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] fs: stable_page_flags(): use snapshot_page()
To: Luiz Capitulino <luizcap@redhat.com>, willy@infradead.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com, shivankg@amd.com
References: <cover.1750961812.git.luizcap@redhat.com>
 <ede227784078c4c619582c2c69aee1d8450edf12.1750961812.git.luizcap@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ede227784078c4c619582c2c69aee1d8450edf12.1750961812.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.25 20:16, Luiz Capitulino wrote:
> A race condition is possible in stable_page_flags() where user-space is
> reading /proc/kpageflags concurrently to a folio split. This may lead to
> oopses or BUG_ON()s being triggered.
> 
> To fix this, this commit uses snapshot_page() in stable_page_flags() so
> that stable_page_flags() works with a stable page and folio snapshots
> instead.
> 
> Note that stable_page_flags() makes use of some functions that require
> the original page or folio pointer to work properly (eg.
> is_free_budy_page() and folio_test_idle()). Since those functions can't
> be used on the page snapshot, we replace their usage with flags that
> were set by snapshot_page() for this purpose.
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>   fs/proc/page.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/proc/page.c b/fs/proc/page.c
> index 936f8bbe5a6f..a2ee95f727f0 100644
> --- a/fs/proc/page.c
> +++ b/fs/proc/page.c
> @@ -147,6 +147,7 @@ static inline u64 kpf_copy_bit(u64 kflags, int ubit, int kbit)
>   u64 stable_page_flags(const struct page *page)
>   {
>   	const struct folio *folio;
> +	struct page_snapshot ps;
>   	unsigned long k;
>   	unsigned long mapping;
>   	bool is_anon;
> @@ -158,7 +159,9 @@ u64 stable_page_flags(const struct page *page)
>   	 */
>   	if (!page)
>   		return 1 << KPF_NOPAGE;
> -	folio = page_folio(page);
> +
> +	snapshot_page(&ps, page);
> +	folio = &ps.folio_snapshot;
>   
>   	k = folio->flags;
>   	mapping = (unsigned long)folio->mapping;
> @@ -167,7 +170,7 @@ u64 stable_page_flags(const struct page *page)
>   	/*
>   	 * pseudo flags for the well known (anonymous) memory mapped pages
>   	 */
> -	if (page_mapped(page))
> +	if (folio_mapped(folio))
>   		u |= 1 << KPF_MMAP;
>   	if (is_anon) {
>   		u |= 1 << KPF_ANON;
> @@ -179,7 +182,7 @@ u64 stable_page_flags(const struct page *page)
>   	 * compound pages: export both head/tail info
>   	 * they together define a compound page's start/end pos and order
>   	 */
> -	if (page == &folio->page)
> +	if (ps.idx == 0)
>   		u |= kpf_copy_bit(k, KPF_COMPOUND_HEAD, PG_head);
>   	else
>   		u |= 1 << KPF_COMPOUND_TAIL;
> @@ -189,10 +192,10 @@ u64 stable_page_flags(const struct page *page)
>   	         folio_test_large_rmappable(folio)) {
>   		/* Note: we indicate any THPs here, not just PMD-sized ones */
>   		u |= 1 << KPF_THP;
> -	} else if (is_huge_zero_folio(folio)) {
> +	} else if (ps.flags & PAGE_SNAPSHOT_PG_HUGE_ZERO) {

For that, we could use

is_huge_zero_pfn(ps.pfn)

from

https://lkml.kernel.org/r/20250617154345.2494405-10-david@redhat.com


You should be able to cherry pick that commit (only minor conflict in 
vm_normal_page_pmd()) and include it in this series.

>   		u |= 1 << KPF_ZERO_PAGE;
>   		u |= 1 << KPF_THP;
> -	} else if (is_zero_folio(folio)) {
> +	} else if (is_zero_pfn(ps.pfn)) {
>   		u |= 1 << KPF_ZERO_PAGE;
>   	}
>   
> @@ -200,14 +203,14 @@ u64 stable_page_flags(const struct page *page)
>   	 * Caveats on high order pages: PG_buddy and PG_slab will only be set
>   	 * on the head page.
>   	 */
> -	if (PageBuddy(page))
> +	if (PageBuddy(&ps.page_snapshot))
>   		u |= 1 << KPF_BUDDY;
> -	else if (page_count(page) == 0 && is_free_buddy_page(page))
 > +	else if (ps.flags & PAGE_SNAPSHOT_PG_FREE)

Yeah, that is nasty, and inherently racy. So detecting it an snapshot 
time might be best.

Which makes me wonder if this whole block should simply be

if (ps.flags & PAGE_SNAPSHOT_PG_BUDDY)
	u |= 1 << KPF_BUDDY;

and you move all buddy detection into the snapshotting function. That 
is, PAGE_SNAPSHOT_PG_BUDDY gets set for head and tail pages of buddy pages.

Looks less special that way ;)

>   		u |= 1 << KPF_BUDDY;
>   
> -	if (PageOffline(page))
> +	if (folio_test_offline(folio))
>   		u |= 1 << KPF_OFFLINE;
 > -	if (PageTable(page))> +	if (folio_test_pgtable(folio))
>   		u |= 1 << KPF_PGTABLE;

I assume, long-term none of these will actually be folios. But we can 
change that once we get to it.

(likely, going back to pages ... just like for the slab case below)

>   	if (folio_test_slab(folio))
>   		u |= 1 << KPF_SLAB;
> @@ -215,7 +218,7 @@ u64 stable_page_flags(const struct page *page)
>   #if defined(CONFIG_PAGE_IDLE_FLAG) && defined(CONFIG_64BIT)
>   	u |= kpf_copy_bit(k, KPF_IDLE,          PG_idle);
>   #else
> -	if (folio_test_idle(folio))
> +	if (ps.flags & PAGE_SNAPSHOT_PG_IDLE)
>   		u |= 1 << KPF_IDLE;

Another nasty 32bit case. At least once we decouple pages from folios,
the while test-idle in page-ext will vanish and this will get cleaned up.

-- 
Cheers,

David / dhildenb

