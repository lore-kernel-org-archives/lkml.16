Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A072C9D
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738178562; cv=none; b=OiiRqmOWbMeCI6H+X87X4z9NQ6G4iGTMEzHHYJtWEQ0ZIonua9paCpHca1V7eJBc61PL1O60BsaclkU9ytm7/qo/DoUImNuUgxYBKzDDNtVdC8hFt3taWXmbTmTx4GecP6RwokFCI5Zl6JBSr5RkHL6z0ywUGVr6WXarRn7QSzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738178562; c=relaxed/simple;
	bh=4a1pYnaA7PlC0ZeFQl551wfXdoleT0fH8hRvIq6/EYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcpFjcJfhxVNl+5W0xlvjPsIdGyJIkhTkeNxXn9eyjRME6AFneUGA3Jn4kuJJVo9QUtu9seJ2htv914VfNtkyT2GUEdFYKmg52lmNuoWCNqGgPRtMe0knKZKLKKOyZ5hmAbDmwQ3L5HUYfFPYZ/tQoEJdi3ta9F/7NYf/BsUyYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h94XJfV9; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h94XJfV9"
Date: Wed, 29 Jan 2025 11:22:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738178553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xHx7NUaKl67feMKL1c6LfNBNfIUnKeNxzwJaogB1wFw=;
	b=h94XJfV9I/IQc8jD6BPy6IsmxjCrGQFtDn9MmwA5GpWBsvkNsUWrknHYHVOpT7SR/YrP3T
	7VgX2Xqd77DjqpM4MlbqncRg/dks4RBjM0ZLGg7Tm9XGbNm3mTEC4uBpaM0iwL4notCCS7
	2ybVSVyF8LwDymRABki/nhtBqx7SlD8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 0/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <y6xr7cpka4mvd7kwn7ajvacwby6rs6xj2o3zrkbcufkslcjqxn@ju7hi6ty4tnf>
References: <20250117013058.1843-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-1-sj@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 16, 2025 at 05:30:54PM -0800, SeongJae Park wrote:
> process_madvise() calls do_madvise() for each address range.  Then, each
> do_madvise() invocation holds and releases same mmap_lock.  Optimize the
> redundant lock operations by splitting do_madvise() internal logics
> including the mmap_lock operations, and calling the small logics
> directly from process_madvise() in a sequence that removes the redundant
> locking.
> 

You skipped the evaluation section which was present in the v1. If you
decide to post a new version, please include that otherwise we can ask
Andrew to pickup the evaluation section from the v1 [1].

[1] https://lore.kernel.org/all/20250111004618.1566-1-sj@kernel.org/
