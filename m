Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3B1A0BC9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406829; cv=none; b=uH7yVgCF86VIIMwgn668BYNwGLlTqFykSm/cbkoxkcSLqnryBTYFTbB7OAsyL3pydIuDI5fWrDI5whb9aLN/2UbknNCRyTkB1jM7G+v/eYY4laMXssJ/lgqi850JKV1NNfDXCa9hPoiCdk9OJyveYBlN59K9SSTJ693cxO1XeRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406829; c=relaxed/simple;
	bh=pXCQGX5nUtGpLsWmjOKKvNGQiR+MHDqo+m0Hz0rKI58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gu3cW4Jxi5B4CFN9JphEESmpeaxB1ghvX5RULUcqK9pPR/l2T8t0DQLanb7Y5OgCE/qCnfbouvt59Hzf/pBUzxawCINBcF3bz6NjqbuuS0z2OS8EIX0sdYUPXvCUAQWaPJ9xFm3dODe4wTOvu/QTNDprNT11aLxKOyeCSDZRDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsvQFAeW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsvQFAeW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62658C4CEE2;
	Wed, 23 Apr 2025 11:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406828;
	bh=pXCQGX5nUtGpLsWmjOKKvNGQiR+MHDqo+m0Hz0rKI58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsvQFAeWQ3RJSr/LAESbdU+ldT3e3CEGD9e+RmMG3zSo9cDmG1xpflrNvKhbTqxrs
	 iVwQqH29spWr6FHI8DMOGTYv48wpkHiqxDklDg/p2w3/OUlbxwMFqC6AoD1UNqSYlE
	 U9PD74S9rFRxMDcO8bj/BjKMy5U9v1t9m8OWL8iNODERBNP9lE7km8Yu0qW/dKQi/6
	 LCjVYsm69ew/hiS35Gx7zutm9Y1sqDhudUVdfC5uLl6lrG1Hq69dD736hGPX7sTVFU
	 v00EQup8WF7H6eY/UMGJBTp29rhLllT7lrCCdnxQYQXUjakTw/VmtVDj7kbhxboGTJ
	 /ObFmfpRDM37w==
Date: Wed, 23 Apr 2025 14:13:40 +0300
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
Subject: Re: [PATCH v3 6/7] mm: Use for_each_valid_pfn() in memory_hotplug
Message-ID: <aAjLZFdz7cE8i9dc@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-7-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-7-dwmw2@infradead.org>

On Wed, Apr 23, 2025 at 08:52:48AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/memory_hotplug.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

-- 
Sincerely yours,
Mike.
