Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06F928B4E6;
	Wed, 23 Apr 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422507; cv=none; b=fQqlpeOSatVUo9UPDpCBMGldSZIyXmt03Gyje7WDvkFUJfuGtzEnUrJ/JeGpcKCxZZ6tricLSrxCpmRmte4+pSf3ukfFhsH73Ky83/bhwLqwaKXf0o1ihIGHS3IadxaK1UV8/9ZX+shzTqjZYBSkNSIWdJhVdvtsjT8UZK2HoUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422507; c=relaxed/simple;
	bh=MMIH4c9f3R0GEKAXxJujBZ87iFYId9rJoLzBcxhINgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmeu9yebBnexeKO3kkeYfa9nMhfvxgF0nerJEliZg3ownEy7ENAZJDYqoDVGLdeBrwYmF8ylmCJyOCtbMDK5ZJCR8Dys9u8YjAYMsz37ICPYM93ZcfqVUIBi+dGwPkC11caUwyTwDLrtUth6inGWu5CGqTwzTD8rgpq4Zj4GZqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVs5btwD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVs5btwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21ABEC4CEE2;
	Wed, 23 Apr 2025 15:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745422507;
	bh=MMIH4c9f3R0GEKAXxJujBZ87iFYId9rJoLzBcxhINgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVs5btwDpqmTwjTLKB5WWihojmdkZEl/iZjp4WhTpIt6wjy+w3FotUaK87jWMyLb7
	 cVZIhXpBwkzOFjDrq7ZRC1lmdjofLrDlrca+tuuyxDUT2Hyjr7QDm5kQg6geHF/od8
	 T8i/txQACIlXw4GYxmaWeCs2ijxJpFIYT8zRK+21IAiZYtJB0TR8qAx+3iAbaTrkvZ
	 XtwxjDel/oIiTkz1hWBUvQdTbg3Ief7jaYuTse7m/gdmxtqgfpb5ydrs8C9oZD6vNJ
	 kU/3kyC3osgBBzAUGWm5tTdHUzeE3GgFd0RZQa/bWihkQEortmFYkGreO3Bxj4oHi7
	 G9Gf7EPkhUdhA==
Date: Wed, 23 Apr 2025 10:35:05 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Message-ID: <20250423153505.GA561193-robh@kernel.org>
References: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com>

On Fri, Apr 18, 2025 at 07:24:25PM +0400, Alexey Charkov wrote:
> APC Rock is a development board based on WonderMedia WM8950 SoC
> released around 2013. Paper is the same as Rock but lacking a
> VGA port and shipped with a recycled cardboard case.
> 
> While at that, put myself as the maintainer, given that Tony is
> unavailable as of lately.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Split the series from v1 into separate bindings patches so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> Changes in v2:
> - kept single-valued compatibles in a single enum (thanks Rob)
> - dropped the empty overall description node
> 
> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com/
> ---
>  Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Do you want me to apply or you will take via vt8500 tree?

Rob
