Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1E1F5617
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750710003; cv=none; b=Ev+GNgiujhRLaLJpRHQu93CNcmD9GgKXiXcSqPA3sBlSnNYfgJSUtQGw0dVEPQPFnVHOpJvtf2hvY1e1VTadCey/Kk78xqlONbMFHFivIOBBAoHmZSRRfXTo34ud7d5GZ3DYJqaltr6+NbfEcihlxQkcT1dMXKhaiAek5mwNwKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750710003; c=relaxed/simple;
	bh=yFEuTU9pYo/Ex+4VAEd2jxsQpXFnO25H/xgn5cagRwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5mfld089GdBhSW70Tl3ExowT0duD/abZWCCLsCB/C90NkQesFmOaYPVJr7+H+CVsgw0dkGZ1A+z7mql+kzYlDtRQ9IlbG4G2E+MuV5Dheo4nh+rpXizJlM3lZiR5AyDkg8eaIDyY/fglwc1YurhVQsQK9xBEmYFa+5J07SLLRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6wTUewF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6wTUewF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B7EC4CEEA;
	Mon, 23 Jun 2025 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750710002;
	bh=yFEuTU9pYo/Ex+4VAEd2jxsQpXFnO25H/xgn5cagRwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6wTUewFUDNCtHB4oJx0wXgrHT6YZuOllc6p2qDz8aBFO+y4pY6pHApSoHh0nvrsG
	 zYD3LfBRbdoqTBBamEoH8cnU8Mjvspc9ZaQXoka5BbHsNRFUhHMfr0nh1VUhz1ZJPN
	 52+8WrP7QfBXB9mceg6N2guNsszk8ctG4ZQe2SPdtHJAzFFPeTAGKlKHJfxvyJj/y1
	 wY7iEjdgD26AiUFr1WIDc4IcNBIGvGHiPQBqaB3kTeyAtKz5P8c0tWgJgs7jOxpQb/
	 2YrIlsJLo3tz7V07ytAgsdGVT/I57O3S5DacaLsGwXJLilRePpbhBXDN9TS+RnfTac
	 vSi7wHfJDFf9w==
Date: Mon, 23 Jun 2025 10:20:01 -1000
From: Tejun Heo <tj@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 05/14] sched/deadline: Return EBUSY if dl_bw_cpus is
 zero
Message-ID: <aFm28aLvL0Lu7LuH@slm.duckdns.org>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-6-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620203234.3349930-6-joelagnelf@nvidia.com>

On Fri, Jun 20, 2025 at 04:32:20PM -0400, Joel Fernandes wrote:
> -	if (__dl_overflow(dl_b, cap, old_bw, new_bw))
> +	// Hotplugged CPUs coming online do an enqueue but are not a part of any
> +	// root domain containing cpu_active() CPUs. So in this case, don't mess
> +	// with accounting and we can retry later.
> +	if (!cpus || __dl_overflow(dl_b, cap, old_bw, new_bw))
>  		return -EBUSY;

Maybe match the comment style in the file?

Thanks.

-- 
tejun
