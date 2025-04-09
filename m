Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DF3D76
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 04:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744171459; cv=none; b=ZrH0YWOcJmBghWZ14OEqz3TPkCvC1/w3cRZZgMhX/I/4tejIECDuecgSEsyavGg7sEtp2S/XCjs8pql5Ibn3+LdWLiHYr3AqjQo/CUaddJcaALPgKO3mhzl9REgxxc5Jeb6Yk2Bxp4uKEIb012r5KF/UZgpFaYjiCRhuFlYmgyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744171459; c=relaxed/simple;
	bh=ofr4ghqn1KYuF0Jz/nGiXbID7SqxRuuYSm3RylC7oCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TItlcz/B/OJhqT0qVsJVFC4aL4WhyzQljxyXWCzjnACT8KV7XGmu9MMo9Qbexq3CitL7hFw+ZVRXq4Nk+yFd+l8/HolIgbYvHYnE37d8Tfy/qNShuxTEaPpTiNk8bzb429vhSdLFFMyGPkGkot+Nbvw/nEiynejmamE+loDrcDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0LgcqVu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0LgcqVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BE7C4CEE3;
	Wed,  9 Apr 2025 04:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744171457;
	bh=ofr4ghqn1KYuF0Jz/nGiXbID7SqxRuuYSm3RylC7oCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0LgcqVu7DokmWrRbcut1kdqTyGqH/VNB0WEwnzw34SDEshC0zGcObra7HjIiyy/M
	 vXtR/grxocQVcGnwodXpWutgLK/kWM0VhOEJv6m4mXTLcqzJ8DALTDphQlk86I3+hj
	 WkBPRUAsFLU4TeElSciuWcryCQNdITFCThk6QM43b5HOtngIswAJ1yNIrb63gX3coR
	 jiHT0RKdgZnlIHY7V4Z4xaMbq2aQxLvZi0AEWQchP76X8XeSVg8/1YjKQ5PK/WdzIb
	 6C1FjmbvOf47Nii/+nL3rCqnigwb/KzN4VOC2vusjRGU2jr26NuHOzqfXwenHMh5tq
	 //JnVBPoJktzg==
Date: Tue, 8 Apr 2025 21:04:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet-tcp: switch to using the crc32c library
Message-ID: <20250409040415.GB4424@sol.localdomain>
References: <20250226062841.60688-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226062841.60688-1-ebiggers@kernel.org>

Hi,

On Tue, Feb 25, 2025 at 10:28:40PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  drivers/nvme/target/tcp.c | 92 +++++++++++----------------------------
>  1 file changed, 26 insertions(+), 66 deletions(-)

This patch never got applied.

- Eric
