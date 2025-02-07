Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8366C238D20
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940341; cv=none; b=WWxOA4YVhwlSaV9mpkJxlHvWWtk1ostD22Pk4PdVsRX7MnWpGRMASrYSLcPwdPdTL5sb9Db2AMsX/KzTAA0XHx2LrF/fgWf/dJsJxB7/NCxoUbC9o7RaxvGEdO0r75/Sgb58qtjOGeHU+ACjrJzZLFgJJJuxUnt7RJ2Qs5xU7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940341; c=relaxed/simple;
	bh=i9CKeB+XfrWpQq7i8mHZmhwLBDP4pruyNo0uHrMgtbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E40f0ScRv4xZvR/424k0lhXT7QD87Jk2XaJHG+FTzIUYnNG2NHTGnXtq7Apn+bxHwNTTC43fMSVa/vlvfqj1kb+iACxwd1P/5b/JBskeFRU5WyIMeme4HQXSOLA1qQAWMJ6ZwHW2X90jiedJ65AljE7T4apTxhEPKYb2icxrdO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ur0X6sr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ur0X6sr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF05C4CED1;
	Fri,  7 Feb 2025 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738940341;
	bh=i9CKeB+XfrWpQq7i8mHZmhwLBDP4pruyNo0uHrMgtbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ur0X6sr6Et2Hi2aaNUIVFYQNjeC4cRof9bKRYSIE6vpmcvxVWWRXsQrjBaDFP6ef+
	 lfK9WLYVVAbgXXjB/um4zEnwlrqdaCSfUXVj0UJqXdT6WVVB32c8TFjAYyGUsn8L5D
	 QO+qsD1pHFHwgLhhrJMXR0T9IBO8fw7d8kdSMkDtyCBsLxJarwngv8E9PsqfRtxIMC
	 0UtlIhrVhXkZ62hFvIrqej4KDAMXXuBfjyS2pDsk1k6GNbqgc+0WxjBiBKwvUBijA7
	 Gjs/n6JCUUqP2Jd/nQPtUEE2WRKyuz7gJ3nLmFsCqOqBuphKJhiCT4NxSeeM+GUMvm
	 urcdasQs5wVYA==
Date: Fri, 7 Feb 2025 16:58:49 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Stephen Eta Zhou <stephen.eta.zhou@outlook.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: optimize memblock_add_range() for improved
 performance
Message-ID: <Z6YfqcOx5FACtvae@kernel.org>
References: <BYAPR12MB32059CFEB36A5FC7D859B69FD5F72@BYAPR12MB3205.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR12MB32059CFEB36A5FC7D859B69FD5F72@BYAPR12MB3205.namprd12.prod.outlook.com>

Hi Stephen,

On Wed, Feb 05, 2025 at 05:55:50AM +0000, Stephen Eta Zhou wrote:
> Hi Mike Rapoport、Andrew Morton

> I have recently been researching the mm subsystem of the Linux kernel,
> and I came across the memblock_add_range function, which piqued my
> interest. I found the implementation approach quite interesting, so I
> analyzed it and identified some areas for optimization. Starting with
> this part of the code:
>
> if (type->cnt * 2 + 1 <= type->max)
>       insert = true;
> The idea here is good, but it has a certain flaw. The condition is rather
> restrictive, and it cannot be executed initially. Moreover, it is only
> valid when the remaining space is (2/1) + 1. If there is enough memory,
> but it does not satisfy (2/1) + 1, the insertion operation still needs to
> be performed twice.

The code in memblock_add_range() is very fragile, and many attempts to
remove the second pass that looked correct at the first glance failed for
some corner case.

Unfortunately, it's impossible to capture all possible memory
configurations and reservations in the memblock test suite, so even it it
passes, there is a chance the kernel will fail to boot on an actual HW.
 
> - Before the patch:
>   - Average: 1.22%
>   - Max: 1.63%, Min: 0.93%
> 
> - After the patch:
>   - Average: 0.69%
>   - Max: 0.94%, Min: 0.50%
> 

These numbers do not represent what's actually interesting: the boot time
speedup.

-- 
Sincerely yours,
Mike.
