Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9B1259C9D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052391; cv=none; b=RsOUoWVUm7/MXRMW5GqzP2ILiqyip2x5c6RR4OY8FdUdE1pvWCt6nQUqB3lg3tJ3S7UTduZAg7OtdfgnMygjJoGLc44ptxm19ky4nxawCMJCHUxblaU394c9M0Pg5UVxQ4Cj+dRVgqCUc2dsFDNknnF52FyU4m4I88Y6kmfiz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052391; c=relaxed/simple;
	bh=eaNf30YMHU7BcMuCAMDNJprm7z6isxLdGxhhr3Wr8Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZrQWMfEI/fY5q39tP6tx1dVN3IG8jrzLgIytqo/Q2mXD9CVl4uHQVzRaKUbIIA8NTlkdNR7k9mVIzxA0EDElfkhsNcIQ/wsec1MrLBdQo/t9LiyysxF4m1YC7MgkLkbEFWGn3sNiuhHtM9AMG/2ai1YPfD8nB2oj/u1i8n+XjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ikd64YAq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ikd64YAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AFDC4CEE9;
	Mon,  7 Apr 2025 18:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744052391;
	bh=eaNf30YMHU7BcMuCAMDNJprm7z6isxLdGxhhr3Wr8Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ikd64YAqfbipeTl6hXDFg9UtK1ahIqbijdiME7QobH7eGGfFYEDkcTbIA96k/5RbK
	 dZxLtRnW7kn5GPqkUWVOAClRXMXcARNivPZIfTrRYsZpl2hC2LeiO8VRdnmHLcTBvo
	 79awVyWWeU/0Y847Cheh8sRU0tRALEq1jrwyTc1CGEKOQCnREC939Poj/ZYam5BCqI
	 kw5HRw9OIM7NfnsvVd0FHjs2eUNOolNSSjRmk8Aqf83OPOdTAhhWUkXIzhr3AjxU4X
	 odNLLyxa9m9ilw8E4jY8ndnncqhcqS9YgGJCt9O6CYifyGRrNYQcNvcKyX70+vniky
	 KASmKhk5gMbEg==
Date: Mon, 7 Apr 2025 20:59:44 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
Message-ID: <Z_QgoB381ltKBdbG@gmail.com>
References: <20250404124931.2255618-1-david@redhat.com>
 <Z_K5uW2eu7GInRxs@gmail.com>
 <630caa8e-2ee2-4895-9e4e-8bf2fa079100@redhat.com>
 <Z_QCYzEJXTnd97Sf@gmail.com>
 <4961949a-75db-4071-a478-fdc543c1dd28@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4961949a-75db-4071-a478-fdc543c1dd28@stanley.mountain>


* Dan Carpenter <dan.carpenter@linaro.org> wrote:

> > least for non-struct variables. Even for structs I would 
> > zero-initialize and *maybe* allow a non-initialized opt-in for 
> > cases where it matters. It matters in very few cases in praxis. And 
> > don't get me started about the stupidity that is to not initialize 
> > holes in struct members ...)
> 
> Everyone sane uses CONFIG_INIT_STACK_ALL_ZERO these days.

Good, although why is this compiler option named so weirdly in Clang:

  CC_AUTO_VAR_INIT_ZERO_ENABLER := -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang

Hopefully it is named thusly because Clang has adopted GCC's 
-ftrivial-auto-var-init=zero?

Thanks,

	Ingo
