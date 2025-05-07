Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D71FBCAD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658285; cv=none; b=LTjSoYFzzecoG4nyWIy0ZfTOOLUuSy8mM9p9qzGZs7SrZZiT9SToZNJt8bXMwgCfSEfSHq1b0sL3/rKAuar/M8ndhI5pokeHd4nIkKuyEKlvjmY6FCX/B2hGJhOZF9QUlAJWiU4dgUQv4dINnw0F3LdIpcrJXNi+hDh/k+BsOkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658285; c=relaxed/simple;
	bh=Bctlw/1fOsJIta1eRL7h91jxm0osjK1lAY09a063p5c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tJbFcSVqS428XR/lYHAb1qdg0U5aCviNe+MeSK4Y6VPlQ4XB91ujSNMCJ9fwQShCrBtlcSzF2dM1XuV/6YW6wQilycxQx0K64uOOCBAWce/JE/yW5tlGchJFN6/dKMxd4yMDbKsKtmyxJz2SlsYXJNNznAlcsbQc1KO6vULK9QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A+UhL3sV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A+UhL3sV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8F8C4CEE2;
	Wed,  7 May 2025 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746658284;
	bh=Bctlw/1fOsJIta1eRL7h91jxm0osjK1lAY09a063p5c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A+UhL3sVc5gIJB7Tb/fyR+1oqmCAcyc7DqKW8AC++39/5gLz6Zxq5Hlb3zZeZm0Kb
	 gd9ZOzKBSArNuwDTo1B15ZVeP5lRr/yGP2YCCo65lvrhWPhuz3+IpEgUXUFbDbznO4
	 SFhgXJ3vDLWAs4AP3YYtuBD89dMDH+jGL1h3jwoU=
Date: Wed, 7 May 2025 15:51:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Florent Revest <revest@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 broonie@kernel.org, thiago.bauermann@linaro.org, jackmanb@google.com
Subject: Re: [PATCH v2 0/4] mm: Avoid sharing high VMA flag bits
Message-Id: <20250507155123.6ae8ee544182dc9cf1137a05@linux-foundation.org>
In-Reply-To: <20250507131000.1204175-1-revest@chromium.org>
References: <20250507131000.1204175-1-revest@chromium.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 May 2025 15:09:56 +0200 Florent Revest <revest@chromium.org> wrote:

> The first patch of this series is a straightforward attempt at fixing this
> specific bug by changing the bit used by VM_UFFD_MINOR. I cc-ed stable on that
> one and I expect it to not be all too controversial.
> 
> The rest of the series however is a more zealous refactoring and likely to be
> more contentious... :) Since this bug looks like a near miss which could have
> been quite severe in terms of security, I think it's worth trying to simplify
> the high VMA flag bits code. I tried to consolidate around the current usage of
> VM_HIGH_ARCH_* macros but I'm not sure if this is the preferred approach here. I
> really don't feel strongly about those refactorings so this is more of a
> platform for discussion for people with more mm background, I'll be more than
> happy to respin a v2!

It's best to avoid combining backportable bugfixes with regular
development patches, please.  These two categories differ a lot in
their timing and version-targeting.

I'll queue the [1/N] bugfix targeted at 6.15 and -stable, thanks.
