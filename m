Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB0418EB0
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682145; cv=none; b=INznHoYp1cUybMttW+16D39oY9t/MjgNbGgtsRrQyy/5DutVxCIaNtEQ4gmijrnldCBzpygcJ21ir4SIZjOj9TqrKc5ecqodPtMYGZdWI2/7bkOFGAC7PyA6VeGiVIXOJQ2NLcngrNLHQ4znjfC2iiaK2kn0xAhNMeDlb/AqCUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682145; c=relaxed/simple;
	bh=c6eHPWm98seUhROhMn8PJklL21VAlhwldY4HG7l2Yu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3VO8oVSxGmKvCjkYo8bx8XStQdTgbtHaPV0KBWAWxwJj244DIwonBMdY5yoPCoU9S73WwhNyio1SieDxRlvtbrJsQdfwoK99Vkqo8Ts/L9pvC6AlVTlqH2k+8iiNlFVYFu2N/SA+jLCynkYK35GCvqp0YpPjytITgo1/h+sTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY5JzQ7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY5JzQ7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36073C4CEDF;
	Tue,  4 Feb 2025 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738682144;
	bh=c6eHPWm98seUhROhMn8PJklL21VAlhwldY4HG7l2Yu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aY5JzQ7NBRgd/p3biGVlgKVnhY5LjoQJcbXTrnqlyN+JpbRkgX6OK1tIaE8f92tH4
	 /h4J54wiMFAToqfcwIkuMUQkQVDR2Eg8sreD9xO1vus9bLBwEKolFz1WRxOVs/MAZ8
	 r3nA18ErNXXpTqTTLwCjZb9oz+wGEqa5vwiEgI2SwXIdOwfa5eZN3vBr56SHxwA8GR
	 f49qeUgx8DXlfWFwvJZP7beT6XKORI1hhgAQ/BbtYpeWFoknN82y6R8wcBLeT3okvM
	 MEveW3mBpBNrSD3Y0Rb8EY192JklNR2OowWc/80w/YdpsY+kKu8yJhf2OSM8odkYkf
	 Wdb4yKkk3SZvw==
Date: Tue, 4 Feb 2025 07:15:41 -0800
From: Kees Cook <kees@kernel.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Chen Yu <yu.c.chen@intel.com>,
	linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] kthread: Fix build warning variable 'ret' set but not
 used
Message-ID: <202502040714.0E55ACBDDB@keescook>
References: <202501301528.t0cZVbnq-lkp@intel.com>
 <20250204090838.214647-1-d-gole@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204090838.214647-1-d-gole@ti.com>

On Tue, Feb 04, 2025 at 02:38:38PM +0530, Dhruva Gole wrote:
> Fix the following build time warning in kthread:
> 
>    kernel/kthread.c: In function 'kthread_affine_preferred':
> >> kernel/kthread.c:861:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>      861 |         int ret;
>          |             ^~~
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---
>  kernel/kthread.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 4005b13ebd7f..f730b1413d13 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -859,7 +859,6 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
>  	struct kthread *kthread = to_kthread(p);
>  	cpumask_var_t affinity;
>  	unsigned long flags;
> -	int ret;
>  
>  	if (!wait_task_inactive(p, TASK_UNINTERRUPTIBLE) || kthread->started) {
>  		WARN_ON(1);
> @@ -873,7 +872,6 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
>  
>  	kthread->preferred_affinity = kzalloc(sizeof(struct cpumask), GFP_KERNEL);
>  	if (!kthread->preferred_affinity) {
> -		ret = -ENOMEM;
>  		goto out;
>  	}

This seems wrong? This is an error path, so removing this causes "return
0" to happen. I would take a look at the commit history to figure out
when this mistake was introduced and adjust it correctly. I would have
expected "int ret = 0;", and "return ret;" at "out:" to be the fix.

-- 
Kees Cook
