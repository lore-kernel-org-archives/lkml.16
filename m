Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D0C4B1E7D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729039; cv=none; b=HISJs+cx6Hx3/VBJ7FgOoRiWs6/hLy8jTh430UciG3hp67MeA98L6kiD+ThrjUIs9GRftdCcpiy2mvReQ4igS4mipsPZxjkOZWi6XxVn09Zg7t0CL19u2H107TyzfVfS2q3G4caHFzMhBjlQfBtJFiv3+TnK5xZyumTzlA/YQ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729039; c=relaxed/simple;
	bh=V17CjNbh5XszcwExhM4NzjUKeGuYpBfGx6I3FYFrMuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhxMVO6EOWBEpQVFS0GKfR5FS5vatdIKRknPFwnWrOpo66HjkVSdB5ryl6xOCjzybJF+rEra4ruSC0gGcZjK7cKVabJBBS4ZjRIAEfYAEa6U1LxvsEOK6gcrA3//f4c7926n+qOP/51hDVRXCY2UvgBeN+oTGc6Hqy3ZoS+PfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wdPTfFww; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wdPTfFww"
Date: Thu, 8 May 2025 11:30:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746729034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/nJPl8Ge2IvLFiCs6/TB1SsXH6mxOfrpnBplVM574lI=;
	b=wdPTfFww2nBK5xA9DQCStl8WWWi9mvVQIVqDN8OD9zMBpIUDikFVbgnIr5CKWjSptR7J9D
	SpAp7DqbjbREW2SVL+JaRxTYLk3KxevyU0G8krN8FFoxThuOpyrYrgVsPWOq08bDOns1C7
	C9LZ/KNlPd+F72/ErChko+lE2G/5cIA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@redhat.com>, 
	Michal Hocko <mhocko@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
Message-ID: <mhnz33dwwd3npj2re7dn7invntzk6dk7u75ue2pzg35vdappjd@tgqlccmoydar>
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
X-Migadu-Flow: FLOW_OUT

On Thu, May 08, 2025 at 06:37:35PM +0100, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a reclaim memory management section and add relevant
> maintainers/reviewers.
> 
> This is a key part of memory management so sensibly deserves its own
> section.
> 
> This encompasses both 'classical' reclaim and MGLRU and thus reflects this
> in the reviewers from both, as well as those who have contributed
> specifically on the memcg side of things.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Seems fine to me, though I would put Johannes as M (if he is fine with
it).

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
