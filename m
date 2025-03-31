Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624F3C47B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458197; cv=none; b=Ctz40ZAjKuzKziRbuxsumzeVUr9aymA0QTFItpvFvF+smHRsSD9NxPo/cHorvN5DL/FXsHUDMYfiFNIdnJSSePlK5qaYyQwCh6atsVt2cFm0Hszz2Y5OUNR2HDO9yurlRp4Ip7327IHTQnDQ50kNsMyceCfc7i9cNv0DM01ekxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458197; c=relaxed/simple;
	bh=o3KmvHJBThEI/KuZiyZ9uKvvAH1R0o5nVSMM7YKW1YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrbClExgs1KEejeQG8KHiN34zQfz1cMDGqkEmOFrDTVWiHKgUcGaG5lXHaNRGNqcoIdvgJ/DjamgWFFEM9zCSBglKq5QSDPjSk/17w+/rPxk0OBbVqp6yy0hBkqcouoWqVTcIWG8vwvKxmcXJ1zH52X+HwTgy18UXjhaedv/SCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErJMsOh8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErJMsOh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EA7C4CEE3;
	Mon, 31 Mar 2025 21:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743458197;
	bh=o3KmvHJBThEI/KuZiyZ9uKvvAH1R0o5nVSMM7YKW1YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErJMsOh8/mnIuNRWJsRAN7IYY1BVMvi/fcozIBMdXUtYs+493iHOXBGt0kWLa4Hkd
	 bAs9T/A/AD7Kc6uAU74b/yc392gMYjlEX23aG9CKdxdRnUnrKi9PBmhq56QJEMr6dk
	 kzkAWeF7HcWizlT13dvvP0Z225mwunAXD/xp8ik9bse25zi0HalgcwAUV4oABMkyv0
	 JngnDfCUaMU1lFMY/ZLIMb/2RG95CoRF9GtdFgGpc2UnLZ+uYFnu7KeE29R38rSoBY
	 Z1g1xmRd7/6H52MAAD38mu8xkY4S+AUb0tCPyrD0RRItuEyVz2zOuI4N/BMYGWOg+d
	 0t0mhl8G8E0yA==
Date: Mon, 31 Mar 2025 11:56:36 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] sched_ext: idle: Accept an arbitrary cpumask in
 scx_select_cpu_dfl()
Message-ID: <Z-sPlB3ih10SS9w0@slm.duckdns.org>
References: <20250321221454.298202-1-arighi@nvidia.com>
 <20250321221454.298202-4-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321221454.298202-4-arighi@nvidia.com>

On Fri, Mar 21, 2025 at 11:10:49PM +0100, Andrea Righi wrote:
...
> +	/*
> +	 * If @prev_cpu is not in the allowed domain, try to assign a new
> +	 * arbitrary CPU usable by the task in the allowed domain.
> +	 */
> +	if (!cpumask_test_cpu(prev_cpu, allowed)) {
> +		cpu = cpumask_any_and_distribute(p->cpus_ptr, allowed);
> +		if (cpu < nr_cpu_ids) {
> +			prev_cpu = cpu;
> +		} else {
> +			cpu = -EBUSY;
> +			goto out_enable;
> +		}
> +	}

Would it be better to clear it to -1 and disable @prev_cpu optimizations if
negative? Not a big deal, so please feel free to push back but things like
wake_sync optimization become a bit weird with @prev_cpu set to some random
CPU and down the line if we want to allow e.g. preferring previous idle CPU
even when the sibling CPU isn't idle which seems to help with some
workloads, this can become tricky.

Thanks.

-- 
tejun
