Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F62C9D
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738178317; cv=none; b=KtHi3lop5mceXsiLhw9Mwl7cfXQTnaoRgJID0rxuwvwVmyFFbLQ6fOKqrDXtri47WnxC3ojDeC2GHzzwIYbMq8UGl4WhTkkOIyZZRePySSiFaEo0DyM4AuaF6OjS6l0NYKQDUnLEMCnWrX2NwsBHhphcl+8l7Mt+g/wpjIbKcOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738178317; c=relaxed/simple;
	bh=MkpPnsZ6WAbBpAN1yVbArRNfkL/ycorTWOBfdfe+5YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xd0nSM23ZRHCZRsOqP8Ytcfrf4sLJOeFMGMnUpep59rx0vUk/5v6b+G+tEtKsSRn4Fbxf/4q9pU0JhYHfvEkXTs6NIJcMLQuBeZVWPSg7iJlUUMSPY9N1dXqvO8j9/pY7UwIWGBD4wcpZ10cGd14xh3yUWPUKhk6DR/djvYoeUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JvNYtIwY; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JvNYtIwY"
Date: Wed, 29 Jan 2025 11:18:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738178308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hez7VgV0DhIZvmJREE/LaghIkVK+nndSLTjm+3f9MLA=;
	b=JvNYtIwYM+yG0ZJhDPdpr3DzCqhn50s2W4UPNx3OB+J2ufspyDwTchK69oZJx7kVR6OByK
	FfpW2/+5B9PMbFfbyFflKYGl9ikW1QjfEpeK80APnUJmvxjwm5mPQHOuUlw+Rc7LxDi7uE
	Pyh1kiVhuaf4RrDcHESFiKP6vEBGVxg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 1/4] mm/madvise: split out mmap locking operations
 for madvise()
Message-ID: <oxfyhyykypb7mzpqlwq3fuy2hyvt37ykrjvcsndbljgzm6eysa@ieyq7xykk364>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-2-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-2-sj@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 16, 2025 at 05:30:55PM -0800, SeongJae Park wrote:
> Split out the madvise behavior-dependent mmap_lock operations from
> do_madvise(), for easier reuse of the logic in an upcoming change.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
