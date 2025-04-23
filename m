Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989B16A395;
	Wed, 23 Apr 2025 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414812; cv=none; b=qrYQ/GgbzaT2ccYfvPLGHjfdak9cKWzBTO5jVDjOuDxhcfbOxdNcY93Htt29gIuCGfk6uw5BJg1bDjYdOP+bATKinlIMnUAY/oH4s0tgeuS0jaqjyYCGIWo6LMZJaBtBp1ydki7hM+8Rr7mFvAqjlicexOvDt5Y4QPb4/SKtUs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414812; c=relaxed/simple;
	bh=ZVqzRttcfT44U4tb9DruvPTg3zDxigqmf/1pQtxNob4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sf8iUqmhdjhuXLeq2cCFVNT2KsogWQogRiiGZQ0hxDVbdpbEHIij7l71ghNkpF0f0xR17BMyo2UCkrMpUTpsvwJTHS64zdzfQ596Q2aT0CwygI3akMWz8m5AAoOBYAmiR7bsm8Dmk/c+ouRUnBf8n3n8L1/q0sVLVjE8BzwAkY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gd0qip6b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gd0qip6b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69C7C4CEED;
	Wed, 23 Apr 2025 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414811;
	bh=ZVqzRttcfT44U4tb9DruvPTg3zDxigqmf/1pQtxNob4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gd0qip6bI1Bq9LNJD/Aw9V2BfbakRZsUYw5CqG33bAT4vMhhvzcoUtB/w59Ii49HP
	 HQg6N+2VR8GFkMJCvwtpqaPnD/radDXkuNlOudBirh01JEhBfoQ6xvTewPlK12tZJe
	 OoYXscb07cFV4zMCrFkIR4tA1Add4x8jYx2mCPy8Lmo+GH8nLN6/Zm109wgygQAiIJ
	 NX+ZQGTd+foa1cq4F5zdngK9XTb9E4rTKYOnzNkk0NLFNIgjUf+1vaHRX+G6GPVKLV
	 nfFxkjvUfHOfEbnndPbJAxgHG53ErS0wNzYAYS8x74wp+JkCQqx1M+jriVWzFmD/AA
	 9UhxZOoD8btTQ==
Date: Wed, 23 Apr 2025 16:26:45 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 next] driver core: auxiliary bus: Fix IS_ERR() vs NULL
 mixup in __devm_auxiliary_device_create()
Message-ID: <20250423132645.GI48485@unreal>
References: <aAi7Kg3aTguFD0fU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAi7Kg3aTguFD0fU@stanley.mountain>

On Wed, Apr 23, 2025 at 01:04:26PM +0300, Dan Carpenter wrote:
> This code was originally going to use error pointers but we decided it
> should return NULL instead.  The error pointer code in
> __devm_auxiliary_device_create() was left over from the first version.
> Update it to use NULL.  No callers have been merged yet, so that makes
> this change simple and self contained.
> 
> Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Originally I just updated the check for auxiliary_device_create()
>     failure and returned ERR_PTR(-ENOMEM) but obviously the
>     auxiliary_device_create() and devm_auxiliary_device_create()
>     functions should return the same thing, NULL.
> 
>  drivers/base/auxiliary.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leon@kernel.org>
