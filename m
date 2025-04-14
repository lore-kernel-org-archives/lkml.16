Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5F28A1D2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651643; cv=none; b=NPHcddNzCoP7ggktBjBn01X/Rj8X4yEszmCP3WTciQvAOWFdyeyB1Pyzn5UC5Qjz1I0EBT8CaxubQjkv64HqAxbVWDToNcui5l3vx2oBPynQ9rtHmEEdu1blebfOIbRW8iEOoGoj2XqPQ7yzeZMuXt4DWL7EUUhSmBZITrx0U2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651643; c=relaxed/simple;
	bh=EEdRrRZBcs+KJE5ICeJFRqz8rHUrjtG4lB0+IqJYsTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpVaRud7LT9dyE0FWwaJuE2psZDi/hECDtVGJ5QTEBPK847Kctu2JRVmrYnWcNErUeOSDLB3pZNTneq/zl8mBfUtO7LTGZyC7Bi4my2AtA8gBmbLr3/GBICRk4qFXW5Dc8CQ3SOvXur4f3LqYAx1vP3Xqruh9Dg4pWnarcAan2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/sp1Vje; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/sp1Vje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71DFC4CEE2;
	Mon, 14 Apr 2025 17:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744651642;
	bh=EEdRrRZBcs+KJE5ICeJFRqz8rHUrjtG4lB0+IqJYsTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/sp1VjeHfrmjNuQcspU9pRz46eO61UK30jCAVryVpkmJKlHIaKOaURswUmB7AGiu
	 /1kPm9byj1t+5mQZ2WINi+BRxF/9toeSU3XJdWsLDmgZRbme5cdi4wwWMThMJCUEI5
	 4fqzvplVxjHHor1uu/UE+wB9HugCzO6uN4t6aG4CTNpGitmnxoFmENRq7uYRI0cCBn
	 tl318rmL6m6q/yrEfuacCr/54lMaOOL2TkbhY9G+Esxwl2T+2+p0XRBEf9TJXRTOB1
	 0nRpbtaS7+oF3x1x6pBPVT5CMdIl2PKQS/9ufqXfdZx0stdhugZyCd9aj/wq2CSk4O
	 SIpN2u/NFfstA==
Date: Mon, 14 Apr 2025 07:27:21 -1000
From: Tejun Heo <tj@kernel.org>
To: alexjlzheng@gmail.com
Cc: gregkh@linuxfoundation.org, alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernfs 3/3] kernfs: switch global kernfs_pr_cont_lock to
 per-fs lock
Message-ID: <Z_1FeW2XQTLFGGbV@slm.duckdns.org>
References: <20250411183109.6334-1-alexjlzheng@tencent.com>
 <20250411183109.6334-4-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411183109.6334-4-alexjlzheng@tencent.com>

On Sat, Apr 12, 2025 at 02:31:09AM +0800, alexjlzheng@gmail.com wrote:
> From: Jinliang Zheng <alexjlzheng@tencent.com>
> 
> The kernfs implementation has big lock granularity(kernfs_pr_cont_lock) so
> every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> 
> This patch switches the global kernfs_pr_cont_lock to per-fs lock, which
> put the spinlock into kernfs_root. Of course, kernfs_pr_cont_buf also needs
> to be moved to kernfs_root.
> 
> Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>

I don't think this one makes sense. There are lots more things that are
globally synchronizing in the printk pass. This is necessarily a really cold
path and it doesn't make anything better to split this lock.

Thanks.

-- 
tejun
