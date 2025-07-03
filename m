Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9424254B09
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751564400; cv=none; b=VGWUndEY/3h1V+rCC6vWnw6IwPTz4e2AwowfD4OAOndwtLDUZJi1gtPBWJEkX1+ZewpTeB/vXJFSTM+EWOLcTY0tU9EzNg7nkMMP/X7Gxwn4rtzIBzZPnLHYYujxB5KS5VOrWeU+ux40kSyMl+9pxQAsbM60srsdc9HrLktZ+Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751564400; c=relaxed/simple;
	bh=gnhRdoBqmj6KhJnNFLyhuYleC/b7hyy97lBX6384hkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC1hEOqqNrRCgDIUXteldsxTAv6XIPNX8xuGpV1kYhaqVAce7dwelCnmdsSowlzTXzPIcDYkJCMUn+HXuxC2A9cuteCv2EMfJSSmL7TsasPgWh08p4e8SoVBS8Raxq92lUoTdSk3Vb33Po/4x+U189dLzoxnZAWBoW5/FOKMXo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=df7cb.de; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=df7cb.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bY3tf5XyCz9shX;
	Thu,  3 Jul 2025 19:39:54 +0200 (CEST)
Date: Thu, 3 Jul 2025 19:39:50 +0200
From: Christoph Berg <myon@debian.org>
To: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	"open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION" <linux-mm@kvack.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] mm/migrate: Fix do_pages_stat in 32-bit mode
Message-ID: <aGbAZs4eb8sLT8hj@msg.df7cb.de>
References: <aGQTtCkgH4kQTNlp@msg.df7cb.de>
 <25EB3C6C-4D6D-4946-BF0B-9B322E7DC16D@nvidia.com>
 <aGQhBRM9DtTZ22Z_@msg.df7cb.de>
 <069a44c4-754e-41b7-9a42-7c2b77afdd37@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <069a44c4-754e-41b7-9a42-7c2b77afdd37@redhat.com>

Re: David Hildenbrand
> > For arrays with more than 16 entries, the old code would incorrectly
> > advance the pages pointer by 16 words instead of 16 compat_uptr_t.
> > Fix by doing the pointer arithmetic inside get_compat_pages_array where
> > pages32 is already a correctly-typed pointer.
> > 
> > Discovered while working on PostgreSQL 18's new NUMA introspection code.
> > 
> > Signed-off-by: Christoph Berg <myon@debian.org>
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Fixes: 5b1b561ba73c ("mm: simplify compat_sys_move_pages")
> 
> Hmm, still not sure if 5b1b561ba73c really introduced the issue. I think it
> only messed with the "pages" pointer, not with the "status" pointer?

"pages" was the broken one. "status" isn't affected by compat mode.

> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

Christoph
