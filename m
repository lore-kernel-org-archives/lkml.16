Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD1E155725;
	Tue,  1 Jul 2025 02:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751335607; cv=none; b=Pz4R+uo+1//REnyip1TboZbdUVPmvpSbVz8CSloA62/5KCobxFm0m+NTr90EzP9PARVsuGequyzxhJWJYBeEo121fwk/Ik8YMOFdN4hxzOLgI7Bp9O+4K0NEk+0V0dZbexQJBw6jZZRmojeZNDDccw4LMW9+ZI7PvBH0nhYbph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751335607; c=relaxed/simple;
	bh=jjdeV77YRjJRdpCL6TzaNWPsTnTXTv9+xqV6FCjiGPA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeXDkMFUdD7+qumhciUfTVG4w9fT5KBYFlz8vUr5/SHTXWadNkTd0BSNULHAniOdBXJmzg0dGRs35Y52Ei1EeUkudtsLXA8yFBlSmjStGaHT0pQWloyC3QIC0V3cCVSgYTMg4a1CCXO35bX3h+y8b2OsRUq4OzbeBRyd5iLIGmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMiM0iFB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMiM0iFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E2FC4CEE3;
	Tue,  1 Jul 2025 02:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751335606;
	bh=jjdeV77YRjJRdpCL6TzaNWPsTnTXTv9+xqV6FCjiGPA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BMiM0iFB1m8KyDdY9lYt142u0ARB4gj/Wc2i+M2iE6oO1ZJdHf1Xke9//essG7QOY
	 zoKTIDMk0mkG1fY9jG+V/tnpyLysZ+MjQR/ntdr1TXUwkgIsQn9tlpFvy8pGCSU3Bd
	 D7vedNO/pNHJHZUiXXmhtDrnoJfh/K4vECF9xPMoUvvLJox4adzIPCN0+y5zJAgDdN
	 pHCH+9lhhV16EhVAHyUTHqJ9mhEAvc4oCuWnP/8KBdsmKpItdfdiIiUJNmRNz+ArAS
	 9hYFN+ndX7keVVhTpnu77XYbtCSioelKmMP3+89+ZVfjknUrihXbDrUbySBDBSdFOQ
	 OjUKn/rzUY73w==
Date: Mon, 30 Jun 2025 19:06:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: netdev@vger.kernel.org, jeroendb@google.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 willemb@google.com, bcf@google.com, pkaligineedi@google.com,
 joshwash@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] gve: make IRQ handlers and page allocation
 NUMA aware
Message-ID: <20250630190645.5423949e@kernel.org>
In-Reply-To: <20250627183141.3781516-1-hramamurthy@google.com>
References: <20250627183141.3781516-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Jun 2025 18:31:41 +0000 Harshitha Ramamurthy wrote:
> -	rx->qpl_copy_pool = kvcalloc(rx->qpl_copy_pool_mask + 1,
> -				     sizeof(rx->qpl_copy_pool[0]),
> -				     GFP_KERNEL);
> +	rx->qpl_copy_pool =
> +		kvzalloc_node(array_size(rx->qpl_copy_pool_mask + 1,
> +					 sizeof(rx->qpl_copy_pool[0])),
> +			      GFP_KERNEL, priv->numa_node);
>  
>  	if (!rx->qpl_copy_pool) {

kvcalloc_node() exists for more than a year now.

nit: when you respin could you shift the allocation so that the empty
line appears before the kvcalloc_node() call rather than between it
and the error check?
-- 
pw-bot: cr
