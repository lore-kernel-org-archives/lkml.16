Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DD52EBB85
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965788; cv=none; b=EheILNKpzmGIHJCLtt2orduKNPlpNkYQn0S/BGUvBNIJyqfZuReggF+qs1NkqRwc8aA5dKTx1mS15k04q2yxkTIjJ31Mp/sdRVsPDFlXmiViQ9N2Mmb3/TCJ/vJE4N+ayNpqwR43ffDcvQin8RU3lAmIJ1GbSLMy6W52v40IPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965788; c=relaxed/simple;
	bh=B864Kl2+y9t9p4Uw4FsNqFDBuqfVVZy0f/fsL3U3UFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvGJK8MFBAnhWQTKXJdthBR6p3quR8BJ4W2kNEgdDL1jHJOr1H6FIsWozlBkR9bz8YKp9UkkPXuotkAb+stHMzMJjAWt/qulahHgM5MfGvIFvtgeieWWU4eJTqlifghPSxUpdlF2Cm0j6btFY6XrhVfEmOb7wEhG9MCgS6PqAMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=df7cb.de; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=df7cb.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bSpVn3C4pz9t7g;
	Thu, 26 Jun 2025 21:22:57 +0200 (CEST)
Date: Thu, 26 Jun 2025 21:21:32 +0200
From: Christoph Berg <myon@debian.org>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	"open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION" <linux-mm@kvack.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix do_pages_stat to use compat_uptr_t
Message-ID: <aF2dvKSoABbAuiNd@msg.df7cb.de>
References: <aFrBhyHQFffJ4xgX@msg.df7cb.de>
 <d42cc185-b774-4d5e-9a51-0581dd5f3962@arm.com>
 <aFwUnu7ObizycCZ8@msg.df7cb.de>
 <20250625133909.1a054c24d933cd97afd0027d@linux-foundation.org>
 <aFxltX73iZLT2HGx@msg.df7cb.de>
 <20250625141551.ca068f6bc901943559df6bdf@linux-foundation.org>
 <ff2421bc-fe91-42c8-af42-91b57824e312@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff2421bc-fe91-42c8-af42-91b57824e312@redhat.com>
X-Rspamd-Queue-Id: 4bSpVn3C4pz9t7g

Re: David Hildenbrand
> See if my proposal makes sense, and then incorporate+test it.
> 
> You can feel free to add my
> 
> Suggested-by: David Hildenbrand <david@redhat.com>

Thanks, will do. But it will be next week, currently busy with the ham
radio fair in Friedrichshafen.

Christoph
