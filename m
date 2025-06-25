Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4955212B18;
	Wed, 25 Jun 2025 21:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886450; cv=none; b=HNU4+kvuv0JFmC6nMnTP5PyeGI1tVnnL1saDpcLKftX+rjJ9dTLISVToNjq3Bi1r8a3qidEGx1dUvFy7XU8YIajguIJwPQBUbp0Wsqrdgz2kQDeJ6erTHOtHWlGKCNCI+PlKaikekkzFlOJ4HiyAhIHyJgTjHvQXjWbHash1zc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886450; c=relaxed/simple;
	bh=jaEaUREuzMuC5seMYA2kH2kmVEdWlk+bd+X3Rgvrw8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t50GBCh+qsGgQLnRNqjKLJtUboW/zkLYM4dxXwIUGYouYWw6spzw+EDJOH3GY03wmskkBDaLdJ6siLwlhCHH2Br7xNc3YjrVvRP+Nr0oeO2xsbLgBJNkU51ntcRe7/WCmzPXYtUa+jjjmNccmI9FvEDtdz93qLci7thJENpiwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRld4P6j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRld4P6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDB1C4CEEA;
	Wed, 25 Jun 2025 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750886450;
	bh=jaEaUREuzMuC5seMYA2kH2kmVEdWlk+bd+X3Rgvrw8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRld4P6jF7T04X9wSeWFhBBwNj6QUtV/4SXtSKV6LDTMWlGwjF2cAuGj4OXJXt/rB
	 cSDcQSfHsUZCJrMO0cdAi3JDt0sbsQhlrV8JpQB90swv/zznx7e1yftxEvZQIbnkC/
	 GcQNudTXjDWmuM2gJeVqmMusK4PJixMvpvyxkHDaQrN/s68bz3VhU1HLPYoz5GXFHz
	 T4lBzfsCZ5hiy6llbrjeglF8N0XKMJ0PeLeuo0FVLaZGqLll4QPsdFy+qiSgpCad6w
	 s0NxnZMYWtZb/oFDeLiZw4EwCPEKhVZSfbAQ6du3R4vvAEtSDCpofaima/AfyPDIK5
	 71CKuC1e68uQg==
Date: Wed, 25 Jun 2025 23:20:45 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: support align and NUMA id in allocations
Message-ID: <aFxoLQnfZ8LbNpYF@cassiopeiae>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063026.3379921-1-vitaly.wool@konsulko.se>
 <aFxGQWG_81Peu7mP@cassiopeiae>
 <aFxI-rjvktSe3h8M@cassiopeiae>
 <C349F54D-348D-44FE-A02F-E75C78608734@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C349F54D-348D-44FE-A02F-E75C78608734@konsulko.se>

On Wed, Jun 25, 2025 at 10:22:36PM +0200, Vitaly Wool wrote:
> I can move this logic to the Rust part, too. My point here is, for Kvrealloc with a large alignment we’ll just make the decision to use vmalloc, period. We can indeed do that on the Rust side.

That's fine with me.

But please also make sure to properly support NUMA nodes for all allocator
backends.
