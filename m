Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824232557C
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738517064; cv=none; b=JjRWbCg+/jM7VQi2G1Pkh8kWMIwxzseXI6faa+/9T++41QNvZOfccHgukqgJzDfg6SsF1x66EFNoWNZ+AXP2tlrLkuM/QfNICdum3UEnNOJcIiXIkXHWmzKLjpphnB+CgoqchcaqEdrVjgZUaIvt4LFXl/9dGTBzD1d7oc8hMLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738517064; c=relaxed/simple;
	bh=hwkKaepo4t3IXn/wXyJnLzXS/jKhTwNvUuFg+h5wCoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9GXzu6mcpWjnxzzA7n7MyeNUAlUYWcLu8cr7qUohWp+eryFR612H6LoXCvu908aUIWmaAschhk6VZNkEjyziZcoX83asK2kSMhZaXXlp9I4OfUZJb9lluJ3D+0FYIg6RpSxY/Ea+9MRCzeoc56VN8EJ984IYl0S+yjqhuK2pMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKruwH6r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKruwH6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2DDC4CED1;
	Sun,  2 Feb 2025 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738517064;
	bh=hwkKaepo4t3IXn/wXyJnLzXS/jKhTwNvUuFg+h5wCoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKruwH6rqL9gD5TiGxFaxdpiQjmfEDPahXOTUX33J9yv8YN9GfKVY8lBlLS2EgSL0
	 n7GlFa3zIYQ70txmKTVLdjvUtcpgBMnGnUC8yxNXEKHopFTq9/ApLGKBrDd3rq9BK4
	 +9ln+k9KwEj+TMCrEVkeEgDxHU8t0xVzOQ3Eb0mGzNmURSapK7hZFrKk8fWWcoIZtn
	 Fw77T9rB6MrDE/tok34GUUxvzqseYj6JuR8tzuiBwqE8tqBNkK2p/O0tJ6TEcdKm8n
	 MISwQAdljfNAGrG8m9Q7B3vmAxBUDZDZiatn9k9BLRRRD+WsoWIGFIfp0nIDul5G19
	 Pf1y5nfEVG6BA==
Date: Sun, 2 Feb 2025 07:24:22 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/11] sched_ext: Add an event,
 SCX_EV_DISPATCH_KEEP_LAST
Message-ID: <Z5-qRrk5nVC0cMUr@slm.duckdns.org>
References: <20250131070938.95551-1-changwoo@igalia.com>
 <20250131070938.95551-5-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131070938.95551-5-changwoo@igalia.com>

On Fri, Jan 31, 2025 at 04:09:31PM +0900, Changwoo Min wrote:
> Add a core event, SCX_EV_DISPATCH_KEEP_LAST, which represents how many
> times a task is continued to run without ops.enqueue() when
> SCX_OPS_ENQ_LAST is not set.
> 
> __scx_add_event() is used since the caller holds an rq lock,
> so the preemption has already been disabled.
> 
> Signed-off-by: Changwoo Min <changwoo@igalia.com>

Applied 1-4 to sched_ext/for-6.15.

Thanks.

-- 
tejun
