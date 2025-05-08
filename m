Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D72B8C1E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746679125; cv=none; b=d6dDhuEz+q52BpbtVAHOQuNPuq2XPLIjEQwM9i8tZODDReVY3cLXjnr+wEnTfex3e5dls+d/NWUKVuhW3XZwZRN9ea4yTmZqFnFCdlH0TYZf7DbEfZKmY+i4Rt8Ab1/RQmsrSM1LrsFqQhmGj5pxexBCarxgZU/+4/gyRrFVZJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746679125; c=relaxed/simple;
	bh=25F9Wk1wh0L/9vN7D2CO1XgDgsiHRMiJDSvxCKq+tfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1mBF/1xGe6vH41nTv6/PIIFaJcNhmAc2acaPumYhKWcFyzz388/WvaEBQS4fwPuvDmr6kkDO+OrOSsROCHWdfKxd1oTWBDJPN8v2q87igw4u3QhLJUoFXUEeoVlanSUf5fjPU+9ZJy9s5nPDNQU/XWMRP8sQOwuN0J7OpOc8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=a8cdUKc7; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="a8cdUKc7"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476977848c4so7238711cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 21:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746679121; x=1747283921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1cqTOyiEDcgpIamZxdiHYiIDNncwGcTc3EyIyp1gE8o=;
        b=a8cdUKc74UP9w7hrFJmTjT0OasiGADdJDJ+Z6ypO8liUbD+rwE6B4RQfUeqO5XLfrN
         0IMxpuUGFkO+xqa/N4nvXNZKvF9T0M09otnKrj7KeWphgTHHOkwlWYtv+5AApMPM4hpA
         Fsg14cNNfy71uxgRLOb2W+IQ+FKW2lF6MwYcD8mlCMN5GGfZUL9GwoWaBlnJfYG1svDe
         Y5AVh2Z/msv+b0PejxDfb3twQjZAUjMVsAgLOouDtNMys84A0KAlOGi8CyKNkZcDtOz8
         NdCzN2JBrnfD2hjK5RsqYdpPsxJbY7C5dyM7bkMEOe9r248OSdg2GjR/UA6MbGl0fKYp
         Pnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746679121; x=1747283921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cqTOyiEDcgpIamZxdiHYiIDNncwGcTc3EyIyp1gE8o=;
        b=PV+vb6RbrbYB3B/F6KlbJiwyNwrG7is2L2rk7SojWZLmAKdpQWicBW5b5PXFlCqKSC
         TtQHCgGBz61h7c19FbFWSL9g/UP3P673RxM4fpWcEikqsd5SyYf2W92VQiwI1rGP+ytq
         duQqItkQ3UT0yFy8vcS8FiV7L+SUskRKTZ9dGh+jnWKw7dkKKIwXDMovU7QQI/nNZogb
         Skc7S9gafnsODdh4GQyyeGuIwRVlj6tyQxdgSh9RLlybd64MrT3LGTx2iXONEGKajQe2
         ngDjTmCaulf0giMSu07X3Q01AZgNf8V9LhRvLz9dlOpR+u3QrdvBCCzDHeg1ghegPKrw
         h5XA==
X-Forwarded-Encrypted: i=1; AJvYcCU/bph0eSL9vzJxBSP1PWyblCokFN6FplpZNJSR7lp+ZAT2taXBb3hyrrl0W4NJn53LH0Ko5kkuBL/0JOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwweioWA1B3ZZfTpcP+nrcNyIgmk6ykYxDYea70MPCsYO69yM3e
	OrABqGK5yAJ84L7yKQwQeYDhP2jNZDkaf/Cc43PEd+cbhvTVzRJvbHOLPWr+Tcg=
X-Gm-Gg: ASbGncvj5ca7mJAjDs+DP9M66qoh4bT70nBK2JiemdfooPxwnMQL3hUg68DoLtQ4pK/
	wuocPVQX+VWFl+6lXB+kllF/l8KXhwxIliwldzaolDPYepcXQS6ECyCevqFDURhKNd1MKzfU67V
	CeOX7tBV8mq4waaUiWXHNmZXpsmQI8mikhNWtBbIDI7LO0k49r7szeB1AMbKBsrJte0mP3+JsEc
	ISsCVGxdR4Ja4k+AbiECjObuHaBESRJSPxcZKcSwIFq3gdQj1caOUvjOI+TH85MOt7HnDBbSw7L
	2g1BTvblv44N3klp+3IAbPA53aBPRut1gUedRC8=
X-Google-Smtp-Source: AGHT+IG9SXx3+szVrANw7iRh1ucZW6wHm68iT4qY9p9QukDYzSxLw6oMm5attLANpOpVo2taKiUizw==
X-Received: by 2002:a05:622a:354:b0:476:8296:17e5 with SMTP id d75a77b69052e-494495ba88fmr28566081cf.17.1746679120854;
        Wed, 07 May 2025 21:38:40 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-49223457d50sm27837941cf.71.2025.05.07.21.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 21:38:40 -0700 (PDT)
Date: Thu, 8 May 2025 00:38:35 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Make MIGRATE_ISOLATE a standalone bit
Message-ID: <20250508043835.GA320498@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507211059.2211628-1-ziy@nvidia.com>

On Wed, May 07, 2025 at 05:10:55PM -0400, Zi Yan wrote:
> 
> Hi Johannes,
> 
> I incorporated all your feedback on v2 (see Changelog below), except the
> "decoupling enum migratetype from the pageblock bits" one[1], since all
> 5 migratetypes (not MIGRATE_ISOLATE) are just values and
> "#define PB_migratetype_bits MIGRATE_TYPE_BITS" would take 5 bits
> for migratetypes, which only requires 3 bits. Let me know if I
> misunderstand your suggestion. Thanks.

Right, it's better to stick with enum values. My main worry was that
PB_migratetype_bits *usually* correspond to an enum migratetype, and
MIGRATE_ISOLATE being the precarious exception. But I think it's much
clearer with the special-casing in get/set_pageblock_migratetype()
instead of the lower pfnmask functions. Thanks for moving that!
