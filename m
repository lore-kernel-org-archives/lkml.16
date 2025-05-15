Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38F1CAA98
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305566; cv=none; b=dilGBrzS6XpuEDMXv+aLOm5j/cFVqRCzcOB+LGZPTt/A1N1680WZjnsDfG8K69MlFXJSLPBUePLkJF1jY/B7J3ksQDIMLJzR9jjajGmRzxu2a06zs8CpgPgSPzH9UBpdg9hB4tb3BZd7rktI0TgqUVNMZJm5VYtAhoKwHb3u+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305566; c=relaxed/simple;
	bh=r+J64JoV4vdCGlNFfhDU7QfVANDDANZX+x8JjWFoess=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWQJMrr2YE0LLccly+rRo9lAbs6Kvz87diJUhZVaNFUhAA/S3oQEnOuio8m7HNn8VUw6SOmDDIbBvVfccUJJHBpaVKzkRmvaX9MkzN+BxyDqpTYCipsf/ec3NOpSiCcvpeGKSV4X3MmgyiV2pVuK7TmYwTsAe1h/YSm2d+I4IBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bBUYjEYa; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bBUYjEYa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A3D1740E0196;
	Thu, 15 May 2025 10:39:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vnqJM8Q6iN7O; Thu, 15 May 2025 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747305558; bh=KWlT5NkGTmjMlmW05urL+g81BXn1Wq0zoOAMk0rjW0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBUYjEYakB3P+5kGwbYjUcSBzBIasg8dSkFejMMwlO8wLex0ljvL2Gh2Bf2/YwxjK
	 raw8LfBPvgujoNhjrPRNl9bs6b9/kGsm5IkBbF0t61EjCJ7t2jIgsyt3Q1JjHUMb2U
	 4LjzNvhAtRxOi4jral4DjL2BNwWR4BrdqwUipOKY3n4vQj4GvIYOVb41qYUdqgSCUr
	 WuY3VOJizVj3e3YMJgVBvxxC2E5tsSJaadOoud2w0kgrAczvJrsKwfZNlR2DssxcO/
	 K9essWZ33uNp8UnIB63rHxBXBsgKg3aLV/AdmJ8gAiQgFsPnPEm5vpJphqvsSjIO0N
	 1yjHAzhNfQAmrhfhsy/umBSJsiNN8kK/3SXP1E8D9c5S5WBBEoNZGRMNYAqh0hwxlS
	 SHQZK9t0OpbYYS0e5mRaTWZz5ZOm3JClwiNTxmWqvcsTgyOi6bixJK/Rbdby33MaIW
	 cDUOE9TUZGwg1r5EvrucZlBFwDLLroUBBlzMmIiS734RGSsNipQOQ3nIxOj5VyScnk
	 b55miYoXJZ/TfJrQh3HZFwEgPXB1qhPNvyHa4L2jSc2oyCGwJ9m5FhRW+NIO1cykVA
	 8mXvpMl18RURYhcw4G3rzC+JI5GGGrjp4WLjKE8CcqVLQObMFTkyPx2a3GNvhvYYyw
	 hIOqN2cDLHKyzhg5RvIA1vHI=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 90C8B40E0222;
	Thu, 15 May 2025 10:39:11 +0000 (UTC)
Date: Thu, 15 May 2025 12:39:06 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250515103906.GEaCXESqcyPcQn6xlc@fat_crate.local>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
 <20250515095157.GCaCW5PRk1CTPjEtzJ@fat_crate.local>
 <CAMj1kXE0Ak9EgbQRCn+hCoO=Va-fpVrVEP=Bur_tUEthy+fs8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXE0Ak9EgbQRCn+hCoO=Va-fpVrVEP=Bur_tUEthy+fs8A@mail.gmail.com>

On Thu, May 15, 2025 at 11:17:47AM +0100, Ard Biesheuvel wrote:
> I'd lean towards not lying about whether the CPU is la57 capable in
> /proc/cpuinfo if we don't have to - this flag directly reflects the
> CPUID leaf.

We have a whole documentation about that whole "not lying" thing: short
version - use kcpuid or some other cpuid tool:

Documentation/arch/x86/cpuinfo.rst

> This is arguably the important one: as long as "la57" does not change
> meaning, we should be fine from compatibility pov.

Yes, those flags in /proc/cpuinfo should show that something is enabled and in
use. And it makes sense here. And you can't change that string anyway anymore.

Whether the hw is capable is not important for userspace and there are a lot
better means for it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
