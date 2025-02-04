Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D2204F8B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696681; cv=none; b=c/DJg1Ic6QjcGiSz0Mh1BYeEsldMVxFaxznNAyFXn7+U3p8todIn0tQeBi3vbVwh7YqJvdjuT2PKOa90xZpv87FKQTNteqn+BcBifsbyfljgpgETuBgGiT5ow2Mjc8RhowGPjnjH5i6buAOe66IjCPERwFIpR7y/DjRSnIKR93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696681; c=relaxed/simple;
	bh=cNPFS1s2yIl1xXyVg65xDIZe867yvpK9zmlgcaWK2XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0H/HMjP7oMfZLqbzMkid2Wq9sWhxlVh81BbstsS9Z0P70RK1hKpf5ss5GhyMJTwdcSDQbkkzi7BGlZw1lnqErstV9BXixpoLrJ77qKB6Fy/T2nUK0MlTwrA1vb1BXNPnzE+OOLQhX6xohNxjv8+TWAT/OH9sQSpy7brS6nyUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2ZdumXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2ZdumXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD08C4CEDF;
	Tue,  4 Feb 2025 19:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738696681;
	bh=cNPFS1s2yIl1xXyVg65xDIZe867yvpK9zmlgcaWK2XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2ZdumXuCC2Ickvz/elbUFKuVpzu5GD1Aqr6a+q9qVWI4aK9ZX4/QfiwttXRbvNGS
	 C+FuR0tQb6r03nn9diICsZf5PkGu2T9+UadiZrtmuv9tvqCimvv9sY6HIchwS4YDtd
	 SRy6RGhHPslFzvp8WG+dxS+Cw6eh4qP49U02IDnOO9FCYfC2DjkF9DtkVH54O+S2Lo
	 WMKM4vkZZsyPySCZ93gZPhfTyQxbO03O3FcmoC3+GHYiOf9AZ9bNkeeQsFDa0gF3zY
	 JRs6UAfoupksIcCvTpFwUouI+HMBtvuaEMjnh6nAWDDWfIIghfLBvF7lcWtL87tShp
	 iOg8DrwgKwvqQ==
Date: Tue, 4 Feb 2025 09:17:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Imran Khan <imran.f.khan@oracle.com>
Cc: jiangshanlai@gmail.com, haakon.bugge@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] workqueue: introduce
 queue_delayed_work_on_offline_safe
Message-ID: <Z6Jn5wOcFKpSGFW4@slm.duckdns.org>
References: <20250204113635.298634-1-imran.f.khan@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204113635.298634-1-imran.f.khan@oracle.com>

On Tue, Feb 04, 2025 at 10:36:35PM +1100, Imran Khan wrote:
> Currently users of queue_delayed_work_on, need to ensure
> that specified cpu is and remains online. The failure to
> do so may result in delayed_work getting queued on an
> offlined cpu and hence never getting executed.
> 
> The current users of queue_delayed_work_on, seem to ensure
> the above mentioned criteria but for those, unknown amongst
> current users or new users, who can't confirm to this
> we need another interface.
> 
> So introduce queue_delayed_work_on_offline_safe, which
> is a wrapper around queue_delayed_work_on to ensure that
> the specified cpu is and remains online.
> 
> Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
> Acked-by: Haakon Bugge <haakon.bugge@oracle.com>

So, idk, do we really need this? Can't we just add a debug warning which
triggers when CPU goes down with delayed works queued on it?

Thanks.

-- 
tejun
