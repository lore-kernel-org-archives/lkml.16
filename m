Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C261C8634
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710406; cv=none; b=LliPIzNDRHVwZjU+0nen+TrAlVlMFkBUxdQ5XhWIr8QP7UHoeV/cf27B3YqVBmKc/q+/EloUdNl7jRCxo6k/Hcwfe6/NwiRQprPBqSCgOIZlhvk5QsuqHGFnwybpmJp5+RrGmFIKXBr9B/1aM7NxDddtVHjjWhFY+LRcTcwg4js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710406; c=relaxed/simple;
	bh=ubJuCgEktYeJEwKzyfDHYPMVDAymZjfYVt5jrt9RCgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvPXyygWP6dVBT9RvHYZ8+3Zs+ucaX8RvTIMJMluAZHZUlmpy9LpsfbBoxQFpKnePfwQfojcb3FhvGrUQiza7HKl9Luv5HRx4P0YJwF4ogy2pXbwdCmM+CezR54hUan4VLeDDIal5/wCN63cQ89YPZliKkktsoqY1JwF5kkwS6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHOwiFK5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHOwiFK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998E6C4CEDD;
	Tue, 15 Apr 2025 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744710405;
	bh=ubJuCgEktYeJEwKzyfDHYPMVDAymZjfYVt5jrt9RCgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHOwiFK58QsfAjPzjHIg+oH0ZYQngiVsdrzsdtT78pukFUHkW/mo0akv2YvuiYP/6
	 uc4CZkIOOXIlI5UZUsys964/wx90L0lBq5uobZDXpzpa/1pHkXcG7zi9dkXTHGzj2f
	 +iLZ6CqNDUYknfoXLrNpMuwu+3gdtkU89gLzw4xesdg7GugZGW6RSyyd8dKo+VoIsr
	 qKHzpkdlC5ZOvtvjBDOc6C6ERot8KlhM7oChdWDBPUFcGWZv8rTm49vi/eI0IAPBGh
	 eMssZ890SgtE8jJXTasxvlBbuGRR/xj+WyCb+aMGl9hGoGr6ZoGM5l1E3+Chmi6k+3
	 e+GOR7GoeNFSA==
Date: Tue, 15 Apr 2025 12:46:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 2/2] base/node: Use
 curr_node_memblock_intersect_memory_block to Get Memory Block NID if
 CONFIG_DEFERRED_STRUCT_PAGE_INIT is Set
Message-ID: <Z_4q_1TEJgcvlUlr@kernel.org>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
 <d10d1a9f11e9f8752c7ec5ff5bb262b3f6c6bb85.1744175097.git.donettom@linux.ibm.com>
 <Z_d8T3QtnZVeH3HF@kernel.org>
 <d982df07-e7d1-4d4f-a2c3-857901ccc0d0@linux.ibm.com>
 <Z_j2Gv9n4DOj6LSs@kernel.org>
 <736ca451-8adc-4c5c-b721-6b78eaeb4699@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <736ca451-8adc-4c5c-b721-6b78eaeb4699@linux.ibm.com>

On Fri, Apr 11, 2025 at 05:06:55PM +0530, Donet Tom wrote:
> On 4/11/25 4:29 PM, Mike Rapoport wrote:
> >
> > It might make sense to use for_each_mem_range() as top level loop in
> > node_dev_init(), but that's a separate topic.
> 
> Yes, this makes sense to me as well. So in your opinion, instead of adding
> a new memblock search function like I added , it's better to use
> |for_each_mem_range()| in|node_dev_init()|, which would work for all
> cases—regardless of whether|CONFIG_DEFERRED_STRUCT_PAGE_INIT| is set or
> not. Right?
 
Yes

-- 
Sincerely yours,
Mike.
