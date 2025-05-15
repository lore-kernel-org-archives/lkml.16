Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11929282F1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747293009; cv=none; b=uuyRz4IPOVw3OXp/1oMgzxk8djR7LlJaJggAnrF0M3XotqZz0OZySaOnR+7kUz2PPeIK6SyGbzliCoAupt4GVUEv7tO5qQn0VWBjznxHkxMUkQRCS8qp6IAqVbdBi3YQcEj+z4L1EJ2fqqzzyKHCJ7+Z8HEJEkqFRbCLpSOOomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747293009; c=relaxed/simple;
	bh=LRN6FMzbnDEj1ADshmDBDPTRxdz8aU6gwjhm8EoqBG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKvQXyG+z4wbf46Bcv3wAUL88jv06/fIhG1XRJNXOlhTF3nygvtU0zeoWEQo2xosZ6nHhU/CvGXXmmM3NetMpgby2aihq1oPYEC64eyuK2AlnBWWXf4mjzfl2o9o2kukRVJ2vT3+5a93UWOzraOvnywMnstJJYUWWSKmKH8CfGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzpvl5Iu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzpvl5Iu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5247C4CEE7;
	Thu, 15 May 2025 07:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747293008;
	bh=LRN6FMzbnDEj1ADshmDBDPTRxdz8aU6gwjhm8EoqBG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzpvl5IuJkJFnnTrAKyLUhvQVg9gKol97d6BgIcw5t7auHOjRbGVuC7cSAs1KYnyL
	 hMrzLhCkcKA3qKi6iGM2ipmXVlIL0mfKNyxDNaf0j7x8w1WhTLyjkIsL4z92sTUmaA
	 Ig3YsoXDM18rJNVTjUylZcJKf2UX3shvdnTax7FfkriyLb4M1Tag1d31ya1OMMGNdy
	 AcPh08/dUiLCSvmk5pszrHSw0EzF5D4ntZ/J7VI+gzCAPPrjO67pn8LoWKih7NJirm
	 vMs3b8F3Oa4qV9NmgdJVNyrV5vg0klVpodqHXbeZWxNjM1rh6F4mbCe7H5YGu35x1Q
	 8FYyYilEIgXUQ==
Date: Thu, 15 May 2025 09:10:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 3/7] x86/asm-offsets: Export struct cpuinfo_x86 layout
 for asm use
Message-ID: <aCWTTEsEsv3NRmgd@gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-12-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514104242.1275040-12-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Expose struct cpuinfo_x86 via asm-offsets for x86_64 too so that it will
> be possible to set CPU capabilities from asm code.

Note that this title and changelog is slightly inaccurate: we don't 
really expose 'struct cpuinfo_x86', only certain fields of it. Most of 
the fields are not exported, only those that are used (or will be used) 
by asm code.

I fixed up the changelog.

Thanks,

	Ingo
