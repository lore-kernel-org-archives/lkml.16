Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F68126C398
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406760; cv=none; b=QsDFly7To8HhMaIl2qIIiCi0hPSew1LlYkz2zPXNHov5oBgVftOgj5Kc+jOU1JcZ9VYqCa2Dpi4UTkmdDo4IcXSKY4m/XzGHPi5qW67E6hsKEXlZ1scwQmeN9LVkQ7aEJwAWMLhBj9ouB7Rl5KMeAFPV0ga6QzjRL6TWby2fvCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406760; c=relaxed/simple;
	bh=Fv5TS4xMmfeWcV7l671CjJfLu8DhprFRLLXeresKHUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1S7HUAjOR/sMLPL3Ps2I5EDw4vXkkPKpaNWkW/vqBX/w1bAcKKAUBqPLyNZDfl89RpvYYI9p8M3sgkWJd2dR5E+u1sn7klWxSodd09LE+FNjclLI/2Z11YckdsJVFyrj6NaRrCedHovv0TWfGEsgtSLXuT7tVQ92SyUhe0qh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9ByRV4I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9ByRV4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82F6C4CEE2;
	Wed, 23 Apr 2025 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406760;
	bh=Fv5TS4xMmfeWcV7l671CjJfLu8DhprFRLLXeresKHUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9ByRV4Io+e5UaXQhF/o2OWhKsnIxqOOO4OmJ/Z9SgDUD7CJfW6TJ6koC0MCqXagn
	 FnYW3sLXMXhr7Mwg/xaSbw5QWA4AxvoDWlfxyJsOaoxi9mBGZAwUoQyLK+8PYOQG9a
	 kB3jkpuSrz2y/5ZZpMbS5BkdC2nxk2F2rtIq2mKjFwstF4QAv38Di4zhIyquBso2tE
	 y5+lyG9uC0u82Zw4dcn0l0OHmNWIiYpvnkiBpojE6hxGYLZyb/5spB/BOIoHMzmHiZ
	 YUSi+DhYrC3vQaw/hF/pdbRrXS/gtoFahrbt36cdQahfk/K3WIYxkLOh2H3VJEooqg
	 wi9nhH0ebLwCw==
Date: Wed, 23 Apr 2025 14:12:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v3 4/7] mm, PM: Use for_each_valid_pfn() in
 kernel/power/snapshot.c
Message-ID: <aAjLHscwOECGda90@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-5-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-5-dwmw2@infradead.org>

On Wed, Apr 23, 2025 at 08:52:46AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  kernel/power/snapshot.c | 42 ++++++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
> 

-- 
Sincerely yours,
Mike.
