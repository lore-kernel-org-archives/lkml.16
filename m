Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B9A282F1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292812; cv=none; b=INu8y/pl8tPUBroo8F1fZhpFPXUh61ibPwIcJnzLizfywJjUTdC2fKDyHIR7BJJKob5qbKjSPTmg1TQXz/CT1QHokfK5YkVnEz1E7vl0FAV0kfP+sYkteJ5UXxFJtzsIpV/J2xfABsnGWV4/pvNqjn/aqR3tLo67yzSObn2uoF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292812; c=relaxed/simple;
	bh=FqhhP9BuISrdWUtW7sIr4JmzsRFYmoCzpS8Ra43qoKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUwDt0l6tNlWhFKdlemCJUBsuX/joAbjzW5GPoglpSQ1MGbj9LuHSGU8lTKl7/h4QfJpsuWX02/QQQHO4VSIuY4HCkYbfxKQdyl8WuHL3tXPd9ksfmYBO3elNx7PNAPNfQIMklGhn1O7Nj5E6Z20ZySn7h3BbY9g8VbVMSJ3sbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITdXUMKE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITdXUMKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027A3C4CEE7;
	Thu, 15 May 2025 07:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747292811;
	bh=FqhhP9BuISrdWUtW7sIr4JmzsRFYmoCzpS8Ra43qoKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITdXUMKEkEyoBlMn7ZHsVtK7QBY8+ygbw25WUPWf8LeqvAIuBqqA9J8+VkGZzAcI8
	 grIDC4a2PQtLLpk6p0MNDFp5xeGfbMVuNysLUIn1/h2Mc/GUR2EQmYpifhYdl3tis8
	 pvTOctuknlbux2zyMhzZJXpGcwKa5e3uovt11qUoN6V1PbSQYFZSqBVJoZuJGvDHVe
	 GuNDlJRcBHdvIPx+CQFQBgeVOrSyG9Hs756YnAev35ZpjqRr5haUMqghXh6GtwFmWE
	 JLPwEcoIzfGzKXYAW1Jt4LU8AE9UNGJhWdE+1/OUkZ/Fvne5hy6cNI0OmTk2uZ/zKn
	 Igyuv3dbt2ktw==
Date: Thu, 15 May 2025 09:06:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <aCWSh3P3RgoEkhqO@gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514104242.1275040-10-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, the LA57 CPU feature flag is taken to mean two different
> things at once:
> - whether the CPU implements the LA57 extension, and is therefore
>   capable of supporting 5 level paging;
> - whether 5 level paging is currently in use.
> 
> This means the LA57 capability of the hardware is hidden when a LA57
> capable CPU is forced to run with 4 levels of paging. It also means the
> the ordinary CPU capability detection code will happily set the LA57
> capability and it needs to be cleared explicitly afterwards to avoid
> inconsistencies.
> 
> Separate the two so that the CPU hardware capability can be identified
> unambigously in all cases.
> 
> To avoid breaking existing users that might assume that 5 level paging
> is being used when the "la57" string is visible in /proc/cpuinfo,
> repurpose that string to mean that 5-level paging is in use, and add a
> new string la57_capable to indicate that the CPU feature is implemented
> by the hardware.

So the new string ended up being "la57_hw", not "la57_capable". :-)

> -#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
> +#define X86_FEATURE_LA57		(16*32+16) /* "la57_hw" 5-level page tables */

I fixed the changelog and kept la57_hw.

BTW., I too was considering these variants for the new flag:

	la57_support
	la57_cap
	la57_capable

	  - These are easy to confuse with 5-level paging software 
	    support in the kernel, ie. the name doesn't sufficiently 
	    disambiguate that this flag is about hardware support.

	la57_cpu

	  - While this makes it clear that it's about the CPU, the _cpu 
	    postfix often denotes something related to a specific CPU, 
	    so it's a tiny bit confusing in this context.

... and each had disadvantages, as listed, and "la57_hw" seemed the 
least ambiguous in this context.

Thanks,

	Ingo
