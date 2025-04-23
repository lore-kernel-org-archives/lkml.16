Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E121A0BC9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406801; cv=none; b=gESAyCNaIwUTqHvKVTZmIUhnaykV+CxXs76s74z5tMEo+mkHEZgHPcsQWaYDJy5JMbInCxMgpcFveFVnWYNCmx5k9Lna02ZxNCL420ypWsvOwfn4qNDR4tvnhX4ctt4lUbP6F9ZQDZtpynAQcdzxHqF2K2yCqlu4jvJCrutNjWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406801; c=relaxed/simple;
	bh=fA+f5UwY4/94EsfucC8UNHh1rFGwKUGh2EpB+I1y004=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUwER292y6+OKe0LbmXoL+qh6cLKTvseCbolnVkQc0FrJ/hQKkB3T2pQli2swsXldErhNOt8JeRHZeT1EtVRB2gqOGAqWtjz2B18rRrjAANrwJO/0FLMUjXxBuoqOenX6zDuMMg6ZW46gJ9hV6nii5GhnBxg+sYiy/qqqzxKcBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNaYzo/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNaYzo/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAD1C4CEE2;
	Wed, 23 Apr 2025 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406800;
	bh=fA+f5UwY4/94EsfucC8UNHh1rFGwKUGh2EpB+I1y004=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNaYzo/Y1hJLK99y9Ik0HJC+ABzoSS/XiSJFQSlgO+9qO+enerwNq4LALCmEnwhy8
	 Co8tNVVWkiFTEpZoW3EUE31ob8nczRas95qpZyo3oBT0UJ0nb6btLjk7DRn7FXxQbe
	 F5VaGjtsf9mQoKruHPmXH3mjkc9tFQ/lxB92GRFfVkW7htLuXKhZuJuc/GKRzIQ6VP
	 s2zN2IcfMVmWBR4qUaW/61daEtGeycH71JUHpSshm4AfSZG7v4HrXm7mMQoP3SZR3J
	 wQPY3sbRA6/oNJtcrxAhvvlGelPMfjo4qBLa9rjqgabaXqX8Ht7pT0MwDB2zA4HsnW
	 inALIxXeMAVNA==
Date: Wed, 23 Apr 2025 14:13:11 +0300
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
Subject: Re: [PATCH v3 5/7] mm, x86: Use for_each_valid_pfn() from
 __ioremap_check_ram()
Message-ID: <aAjLR4b6qsmzfRdw@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-6-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-6-dwmw2@infradead.org>

On Wed, Apr 23, 2025 at 08:52:47AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Instead of calling pfn_valid() separately for every single PFN in the
> range, use for_each_valid_pfn() and only look at the ones which are.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/x86/mm/ioremap.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

-- 
Sincerely yours,
Mike.
