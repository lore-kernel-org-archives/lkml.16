Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A278462
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743111234; cv=none; b=qLeJGgwqhvz646kNfx5hkO+Pp2H92znmPtWkLTKxAzgd6H4KZjc635AyS0MCI/LgOloBLjJ457vnI+qtcj2gKZ7hMFVczKs/BdOBQWYDJTBVysxHNWPVs2UGelRdzbKyqmAKTt4U2fBEtDTG6p6Bx7ML6QSVZxaIrTiAyJJmoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743111234; c=relaxed/simple;
	bh=XnSf5bBKcZljvQtcenFGviP5nm/INfujlsSv/zoNEcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOzp0f5x5hqKOSQHsV9fuq9oy0ul2I5e9E1Q8iTZRdTTpAlPylsN4XRkIFXp158KwOYsnfiL2SdRGIw02W6eZWEUOisj7xpi2g3DYfWDxiYBMYpvV3atj7uMaudrzUhiNd4R+LjLc87gtPWQWV/eEaxjNAyObszF7fDjdiT8QZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cw7JWbje; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cw7JWbje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A03C4CEDD;
	Thu, 27 Mar 2025 21:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743111234;
	bh=XnSf5bBKcZljvQtcenFGviP5nm/INfujlsSv/zoNEcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cw7JWbjeSexGLa+8NE0fX2sqBp0o+sri6t7JlagjwPHFwPcNM/1hvC1KLU6hnCem+
	 lyIfsTQKbcfChdyrs66xIZzHgv+8pLd/MH91JC1tq3bKjNxRTWHbef3brZ2Fp5a7KD
	 o+QzAKW8SpInOQUovBhoNkYAtgtUtHEopsaDC182d1XkPQXk7m8uIyOxcJRICM3aa2
	 5FLbgfD7+12uhz9GY2bW4+T1aBDZJded1Z7Uxjr0KDxe88sde2ixFH+rXDUJjNKUbb
	 ibEECudYr1hyXejJy0AmyOpgkpWN+hm1cVsRv34n0eE1Nt8w5cWjqYtc7VqKdTPJ9O
	 8CPzlZbEntwMQ==
Date: Thu, 27 Mar 2025 22:33:49 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com
Subject: Re: [PATCH 0/2] Clear AMD's microcode cache on load failure
Message-ID: <Z-XEPVvEDhC5vzR4@gmail.com>
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>


* Boris Ostrovsky <boris.ostrovsky@oracle.com> wrote:

> Drop microcode cache when load operation fails to update microcode.
> 
> Also make __apply_microcode_amd() return correct error.
> 
> Boris Ostrovsky (2):
>   x86/microcode/AMD: Fix __apply_microcode_amd()'s return value
>   x86/microcode/AMD: Clean the cache if update did not load microcode
> 
>  arch/x86/kernel/cpu/microcode/amd.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Should these be Cc: stable perhaps?

Thanks,

	Ingo
