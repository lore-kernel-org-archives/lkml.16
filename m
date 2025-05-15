Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4022A299AA8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314703; cv=none; b=shqeBaRFAlPbHRW3vfHfeJ4W33Uivnld7FV86eZ5OjQb0JSmPCxEWfphO/fCl6J4G1xE6NJ6E6/svJlcYxBPGP8OZuI4CCU06qv1nDBbv6K5zZXWe57mdnSC5FpZfaCMEuxyMjmeNRflyr6pvwG0Fp44c7Ec6DOQ2UVDhB+Usvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314703; c=relaxed/simple;
	bh=IeZxOUuTdRg2oRELq1nsDSjcnLl7j8dE8i25f3ZZZ7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBkrXk+ivie2rom7jyWBshlGsJcEmgFoWQ6HCrqS9hPXdVcqI6+YYseSriCLJYrfTCCWdv/1eV0Mp8e9cdYsTqYoH4sXemB1eH6pdRYJVRtyxo7lQHyOdkpHhpXq6O+JCzsY3w6B/BnTcybfovy0iDz7s/aBKebFE4e2HyYvbkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JHaKayfX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JHaKayfX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0FE8740E0222;
	Thu, 15 May 2025 13:11:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AfOXMrQ-LDhC; Thu, 15 May 2025 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747314695; bh=DNzkVSvkMD2cnCuUamE15QjDAhJkL5bbahyGfynpyMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHaKayfXHKJA7nvYCLjTZsbhSfqC/dGb8Zwcf+LpevKEG4lmo4/S05GNG0Z+CchpB
	 VzlVKoaV8PgK25NtQnX2FHscgTW5lNq8Tog/toYsvfDiWnQMrAsw3hU0qMEQgjPzbv
	 nSlNMca1EigDrnfZeWURIy4KTX/7APf8VCCL2U1Ve4Kh4ZRC5lQW3BELjsGwFWR/S5
	 faDN/80CvKxiJsAac8pg+K/t3sb8zMKJRr4geRJM2sfk2YP29rg1WMBNmX8x0lDqdq
	 3Vkvl0oLhxjtzoxv/SNayQdwFhdbZ4Y/WfCpUrV7PyQG6lpGWDYMiT29R+U3hOS6nA
	 7F771Fd2k8mhwEL7D+5FkIrsUQ7gbRvNjaL/GleTU0lrWPPOH1rkX1fxS+YGYp24xj
	 OfB6j45AJGQbK7Z1Tz3bScH/SGu/kDeU37zqMOySTR4lDwLptQ/4gaw4uCpO0+KOpn
	 gRPXtbPlJWPZ/v/h/q0a1RlV/khyewOcorOU+KKZ44UD32etDKqt5ZvTl09fYSJU6h
	 x36n0HJZGA1QMdLdi+0j564tMvkqgb3vz89EnhdYnK844iE6Rbn4VPsijwSgcABDTI
	 EMLDTRROHeU0eIWJyyeNybY8DFrfM1R7/LWlByyc08iCT/3CVN9FP9bUsyrHca3s2s
	 WQsan3JZRgjoZdx7TbMEVHZ0=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 60F1240E0163;
	Thu, 15 May 2025 13:11:26 +0000 (UTC)
Date: Thu, 15 May 2025 15:11:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb+git@google.com>, Shivank Garg <shivankg@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Rao, Bharata Bhasker" <bharata@amd.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250515131120.GCaCXn-E8zQutUqKLn@fat_crate.local>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514104242.1275040-10-ardb+git@google.com>

On Wed, May 14, 2025 at 12:42:44PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, the LA57 CPU feature flag is taken to mean two different
> things at once:
> - whether the CPU implements the LA57 extension, and is therefore
>   capable of supporting 5 level paging;
> - whether 5 level paging is currently in use.

Btw, that gunk:

We had started simplifying the whole 5-level crap:

https://lore.kernel.org/all/20240621164406.256314-1-kirill.shutemov@linux.intel.com/

Shivank, I hear the performance issues got resolved in the meantime?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
