Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DAD4B1E73
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685239; cv=none; b=omY52Ei8wQcVssIUjxt5nOhNbfcZdbfIFk14T18+WVanSrP+3Wl4W+NAook6nN1BH58oFMVp7jFOuc5wYamLNKwQRilPy4gENEKQPULynBO+s8oWUReDQcy8lplXD1dzxO7DKprvkE9Ap3cuUw4mylI4bA2qrDZ4SIyjhgPOg9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685239; c=relaxed/simple;
	bh=B2F+Ua7VDSX4AzoX/fkP3GTbLwt1pZxQXMCOkrEubHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEJCADG/gHbijPlnP/ggZRWM2Z2yWSIZaPR5G+iA9QFkJKdTNLvYUs8ZpG38xfGFwVHBiujWwZDI86e6oqSz138/AdvtYwKPFNg7Mn7JjJ1ia6d05gAh3u9gYLYON02vmoEmhmuos//uWyjV/tTwhzp0L4LgiHjxtlkuihezLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+PoFzZo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+PoFzZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F8CC4CEE4;
	Mon, 19 May 2025 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747685238;
	bh=B2F+Ua7VDSX4AzoX/fkP3GTbLwt1pZxQXMCOkrEubHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+PoFzZo4oLi17eF68NopsNnUYXBXrg0D2L6h26/Pjr2Gy1dFqnT/gOoqXTgMqHhP
	 7rPp0NUbdi00TrEOaMAeOmRkZc+I6K8ymzun9uEpIJ686fV6KVOW1t1NcxbUu+/ZkD
	 jm9UYzfnyB+8g5C57OCzXozPkuEkHq5ObiktxEMS4qOFfoiMajpfJZZnEf414n33in
	 FAokQ/Fqm3dNxKBo1xMeNr1FByYQh6Cx5icTdzhUEIHZ325wc7P/uo4GzY+GE40nqm
	 onb1/NULYg2WyXVuRLKdIcaG2JOJZGpFHDaEmFhd+vbfPvjaL7l9LzFHnl0LTn9LSP
	 syna2UzzOQdnw==
Date: Mon, 19 May 2025 10:07:17 -1000
From: Tejun Heo <tj@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>, jiangshanlai@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: show the latest function name in
 /proc/PID/{comm,stat,status}
Message-ID: <aCuPdY2fbOIOoKx6@slm.duckdns.org>
References: <8A1F225D-714C-427C-A0ED-1DE5D93DEAD1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8A1F225D-714C-427C-A0ED-1DE5D93DEAD1@linux.dev>

Hello,

On Fri, May 16, 2025 at 12:44:19PM +0800, Muchun Song wrote:
...
> Monitoring tools like atop can indeed record comm of processes. When we
> encounter issues such as high CPU usage, these tools can help us identify
> the problem. For instance, if kworkers are consuming most of the CPU, we
> can use this information to pinpoint which specific function is using
> the most CPU.

You can get more detailed information with `cat /proc/KWORKER_PID/stack`.
The problem is that last_func can be stale most of the time and can be more
misleading than useful.

> Another use case is when we use the isolcpus= command line option
> to isolate CPUs, we want to make sure that no kworker threads run on
> those CPUs. But sometimes, kworkers might still get scheduled there, causing latency
> issues. By using this information, we can figure out which module's
> function ran on the CPU before and then dig into the code to see how to
> stop it from happening.

Can you explain why `cat /proc/KWORKER_PID/stack` can't be used for that? If
the worker runtime is too short to capture, you can easily use tracepoints
or bpftrace too. What are the benefits of showing last_func?

Thanks.

-- 
tejun
