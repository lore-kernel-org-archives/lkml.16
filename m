Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC5C215191
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885827; cv=none; b=A8N/4h5h5d+pfo3LNycNuXL8OFwnkrBHiJQH9ypklSTsGHs9lbXZjLOVnb62l5FiLjj4Fwi8EkOrC5ky8gZbypTcd49J8U7qbrNAf9gvUBxs2BpT5W2sPDW4t4nikhxJJjnbfhy2sasLwYwynsRd9zyU2oMHWA8YJ5TbzVUnSno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885827; c=relaxed/simple;
	bh=r4jn9tHz+MXvWO4G3rsiHj29sNyqHiwasPsKLfcihTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQqFuJe1t9XfnusnTMAsYMK7hcLXIL+fekVx7yv3Nn/dg1pfKO0I8BBzL3a3pHRrUVUgxV6S6nOi6sNo6RgwcYjGqrQXjYVFVdHOju/fJfONc3MFWmkjF6a6Qgxb2PgTaV0jFvaouCb+2vGpOnQJCC1TTElDoDuDLo4uXdvHDy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=df7cb.de; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=df7cb.de
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bSDx467Cxz9tkL;
	Wed, 25 Jun 2025 23:10:16 +0200 (CEST)
Date: Wed, 25 Jun 2025 23:10:13 +0200
From: Christoph Berg <myon@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	"open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION" <linux-mm@kvack.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix do_pages_stat to use compat_uptr_t
Message-ID: <aFxltX73iZLT2HGx@msg.df7cb.de>
References: <aFrBhyHQFffJ4xgX@msg.df7cb.de>
 <d42cc185-b774-4d5e-9a51-0581dd5f3962@arm.com>
 <aFwUnu7ObizycCZ8@msg.df7cb.de>
 <20250625133909.1a054c24d933cd97afd0027d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625133909.1a054c24d933cd97afd0027d@linux-foundation.org>
X-Rspamd-Queue-Id: 4bSDx467Cxz9tkL

Re: Andrew Morton
> I'll update the Subject: as David suggests and I'll add a cc:stable,
> thanks.  I'll also add a note that David suggested an alternative, so
> please let's advance that option.

Sorry, I'm new here. Do I have to do anything now? The above sounds
like the alternative coding by David would be preferred, but the other
mails say the patches have already been pushed to a hotfix branch? Or
are we doing both, i.e. stable gets the simple fix and next the pretty
one?

Christoph
