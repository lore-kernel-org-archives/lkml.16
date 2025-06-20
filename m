Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E6D22A7FD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406718; cv=none; b=oE30lAV/zqqqAaPQueuKtpUz7pcNDCFudsE/uFkkNeRINFV+r3dnTRN5k8AYhnoKnEukkm9YZTByZYRVLpjt39GIQugoozPMnamq/PSJJRGs2vgOqcBF4W6Ie6j8FWy/hrqUx3hjWiMuoEb93VnlVq2gWm2OlhXC/LOJDf6usYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406718; c=relaxed/simple;
	bh=5KC7JaBi27FJopmR5k6s/NBwaDLKbC0pWa+YTPzaINA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0u87XqgGIdnqfdZA8gxliuXANHeksBrziaUfLzLZr5u2I1RCktiRTYUTINTsYlWfq8q5rC9nVqjd+93EVhWniaFgJONzB/dMKV1zo4mS2rlSSptTreQHRBokQWmwa/6hwIr4NOw8rHVHePJ83xnfPNZAzxq6iHYWXRsoQ4xoHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XJaLQ0YC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XJaLQ0YC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750406715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZ6wdfT3r/PmlG/U6lgGdDA1+cv2EsGLU4a4QuReN6U=;
	b=XJaLQ0YCR4VDyc9THRHr0AfuHHNRtdq7NvYLw7MeCZ6eLQzKBa1seEM5H+lQjZhS9tU50P
	vyGad37jpHrphpxvSIqv8kmqpjK0C/0JRTWjofqi/G1qsNTsBAmdcd2Gw9wh1EegoKDp/X
	fU6Qp+xfQSdW1dApWdRW7cKxIMWo5uY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-30-dp5gH5tkOeeOVjixIIFxoA-1; Fri,
 20 Jun 2025 04:05:11 -0400
X-MC-Unique: dp5gH5tkOeeOVjixIIFxoA-1
X-Mimecast-MFC-AGG-ID: dp5gH5tkOeeOVjixIIFxoA_1750406709
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88715195608C;
	Fri, 20 Jun 2025 08:05:07 +0000 (UTC)
Received: from localhost (unknown [10.72.112.28])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 583F918003FC;
	Fri, 20 Jun 2025 08:05:03 +0000 (UTC)
Date: Fri, 20 Jun 2025 16:04:59 +0800
From: Baoquan He <bhe@redhat.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/28] mm, swap: check swap table directly for checking
 cache
Message-ID: <aFUWKzlSD9GKPuP/@MiWiFi-R3L-srv>
References: <20250514201729.48420-1-ryncsn@gmail.com>
 <20250514201729.48420-21-ryncsn@gmail.com>
 <aFPoiuJcBGl2E3sh@MiWiFi-R3L-srv>
 <CAMgjq7AoJ+m64e2rWFFjU943D8kCZoR_e+Hd8LnT3bAy=gTT_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7AoJ+m64e2rWFFjU943D8kCZoR_e+Hd8LnT3bAy=gTT_w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 06/19/25 at 06:50pm, Kairui Song wrote:
> On Thu, Jun 19, 2025 at 6:38 PM Baoquan He <bhe@redhat.com> wrote:
> >
> > On 05/15/25 at 04:17am, Kairui Song wrote:
> > > From: Kairui Song <kasong@tencent.com>
> > >
> > > Instead of looking at the swap map, check swap table directly to tell if
> > > a swap entry has cache. Prepare for remove SWAP_HAS_CACHE.
> >
> > But you actually check both the swap table entry and swap map entry in
> > this patch, or do I miss anything?
> 
> Hi, Baoquan
> 
> >
> > E.g
> >
> > if (!swap_count(si->swap_map[offset]) && swp_te_is_folio(swp_te))
> 
> Yes, the count info is still in the swap_map now, I'm only converting
> the HAS_CACHE check to use swp_te_t here. We'll remove swap_map in
> later patches and use the swp_te_t solely to get both info.

Ah, I see it now. That's why the subject is saying it's checking swap table
for checking cache. Then it's fine to me, even though it's a little
confusing. 

> 
> The reason some checks are added to check the swap_count is that:
> Before this patch, `swap_map[offset] == SWAP_HAS_CACHE` implies the
> count is zero too. So if HAS_CACHE is moved to swp_te_t, we still need
> to check the count separately. The overhead will be gone very soon in
> a later patch.

Got it, that sounds great, thanks.

