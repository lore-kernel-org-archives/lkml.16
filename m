Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7DA2EF9A7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186751; cv=none; b=jZCH3VrvuFj6GQ66CFltmIQQhWFgSLnZDGl2qcXMW4c5KVtdrGSzKLwO3guiou0wPlcaI18e6G8X5p3NrVZBu3XJpUMXnhQRvUqTqbYxTKSesn01EJeAgVgEazidP8yJL0inI6G14614eLLlrbTtvp3z9QxJTZAYpfQ8y8CzEfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186751; c=relaxed/simple;
	bh=5F3LpL6vunuAVxOK1mb3LnEq8KY8+KGsx4Ei/gymlXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftFMUAdirDzLOXqUROlzvNVBi/FWPHeNFqdP2qUtIpM9/rvL/Oh2iDDR/Vz08ourUcrD00hPfQEd15Pw9PVL7odWEeakoSUgYqaOhWm+gAoQq+LCehOua9+u6/kvn/dsjBgTj6T3D4k28GgbsdCodrdxYuJW3KMsF2FBwZb5IFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnihIsaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnihIsaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FE6C4CEE3;
	Tue, 17 Jun 2025 18:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750186750;
	bh=5F3LpL6vunuAVxOK1mb3LnEq8KY8+KGsx4Ei/gymlXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pnihIsaSlo0Bz5E4fKbs65+AnKyfOtvvV4LzpyeDHfAJvmzf5/7PJJ8dro8yGWT7s
	 axIJwdmkqFwnZmtV8QXdiNlgVqEu8QNbsCRVl36+bHgJHJuTdMs+UOnmmuVki9hTgk
	 CWjSY/kJEyu5iJ6BJz61UAZjAzIBbs3Xd9+y5xt17QzbDHSuSHfWbg0STIJyIw3x3x
	 TDIRtA6L08T/NwawvHInagT1jFXld4KSuUSOYuvSg+dvcY3yyVzLun2osvwjtAKlpB
	 vNafLqcjzKxg1gYIt24DOImS8oC+pFSgj12sklCWKVB7HZ8YHxmYpUxBU3RAKxCe6/
	 irUeRFbRqq5WA==
Date: Tue, 17 Jun 2025 08:59:04 -1000
From: Tejun Heo <tj@kernel.org>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: longman@redhat.com, jiangshanlai@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: Initialize wq_isolated_cpumask in
 workqueue_init_early()
Message-ID: <aFG6-Jk4A7BwGmSU@slm.duckdns.org>
References: <20250617044216.1401878-1-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617044216.1401878-1-zhouchuyi@bytedance.com>

On Tue, Jun 17, 2025 at 12:42:16PM +0800, Chuyi Zhou wrote:
> Now when isolcpus is enabled via the cmdline, wq_isolated_cpumask does
> not include these isolated CPUs, even wq_unbound_cpumask has already
> excluded them. It is only when we successfully configure an isolate cpuset
> partition that wq_isolated_cpumask gets overwritten by
> workqueue_unbound_exclude_cpumask(), including both the cmdline-specified
> isolated CPUs and the isolated CPUs within the cpuset partitions.
> 
> Fix this issue by initializing wq_isolated_cpumask properly in
> workqueue_init_early().
> 
> Fixes: fe28f631fa94 ("workqueue: Add workqueue_unbound_exclude_cpumask() to exclude CPUs from wq_unbound_cpumask")
> Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>

Applied to wq/for-6.16-fixes.

Thanks.

-- 
tejun
