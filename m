Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B8156C63
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743747470; cv=none; b=dLtGF4ItVHXP6HnXwxtEZwDLec6beureP9HmcJctb5gkxiU9x/nHVQv3UQ1eF2s43mDXNLGHtiokrTyr6KhHG0iSw5mcHvbpZzGXkkajsp08xgXZCcT9GtzVTG/SjqydeShecmkXwrRbV6ipb3VmNZI8ltC4lctBGc3vKsZC6hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743747470; c=relaxed/simple;
	bh=oKSuWu+MjHWxt6TW5beBSES51dfAZmwR3DNz8fGXXpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlWz1bHI1K+RcgIcxnjxne1mv3WWothx20vvu+jQDFYBeWgF5FiEKh0e5cWiKc2n3tiPKkP4m4tdpynLD+ChsCBY3Q/ZzzsKcgkfw+SiNI+8tOPpOOzV9wgJQsKY7wAp24pK6bG3bFlM6TnvGycOf0KHAvW0djOTxM/FESlES3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0A67468B05; Fri,  4 Apr 2025 08:17:32 +0200 (CEST)
Date: Fri, 4 Apr 2025 08:17:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: shaopeijie@cestc.cn
Cc: kbusch@kernel.org, sagi@grimberg.me, axboe@kernel.dk, hch@lst.de,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	gechangzhong@cestc.cn, zhang.guanghui@cestc.cn
Subject: Re: [PATCH v2] nvme-tcp: Fix netns UAF introduced by commit
 1be52169c348
Message-ID: <20250404061731.GA31237@lst.de>
References: <bd5f2f8a-94f0-43b0-af02-565422d12032@cestc.cn> <20250403144748.3399661-1-shaopeijie@cestc.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403144748.3399661-1-shaopeijie@cestc.cn>
User-Agent: Mutt/1.5.17 (2007-11-01)

I'll do another minor fixup for the comment formatting, but otherwise
this looks good.  I'll queue it up.

On Thu, Apr 03, 2025 at 10:47:48PM +0800, shaopeijie@cestc.cn wrote:
> From: Peijie Shao <shaopeijie@cestc.cn>
> 
> The patch is for nvme-tcp host side.
> 
> commit 1be52169c348
> ("nvme-tcp: fix selinux denied when calling sock_sendmsg")
> uses sock_create_kern instead of sock_create to solve SELinux
> problem, however sock_create_kern does not take a reference of
> the given netns, which results in a use-after-free when the
> non-init_net netns is destroyed before sock_release.
> 
> For example: a container not share with host's network namespace
> doing a 'nvme connect', and is stopped without 'nvme disconnect'.
> 
> The patch changes parameter current->nsproxy->net_ns to init_net,
> makes the socket always belongs to the host. It also naturally
> avoids changing sock's netns from previous creator's netns to
> init_net when sock is re-created by nvme recovery path
> (workqueue is in init_net namespace).
> 
> Signed-off-by: Peijie Shao <shaopeijie@cestc.cn>

> ---
> 
> Changes in v2:
>     1. Fix style problems reviewed by Christoph Hellwig, thanks!
>     2. Add 'nvme-tcp:' prefix for the patch.
> 
> Version v1:
> Hi all,
> This is the v1 patch. Before this version, I tried to
> get_net(current->nsproxy->net_ns) in nvme_tcp_alloc_queue() to
> fix the issue, but failed to find a suitable placeto do
> put_net(). Because the socket is released by fput() internally.
> I think code like below:
>     nvme_tcp_free_queue() {
>         fput()
>         put_net()
>     }
> can not ensure the socket was released before put_net, since
> someone is still holding the file.
> 
> So I would like to use the 'init_net' net namespace.
> 
> ---
>  drivers/nvme/host/tcp.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 26c459f0198d..9b1d0ad18b77 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1789,8 +1789,14 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
>  		queue->cmnd_capsule_len = sizeof(struct nvme_command) +
>  						NVME_TCP_ADMIN_CCSZ;
>  
> -	ret = sock_create_kern(current->nsproxy->net_ns,
> -			ctrl->addr.ss_family, SOCK_STREAM,
> +	/*
> +	 * sock_create_kern() does not take a reference to
> +	 * current->nsproxy->net_ns, use init_net instead.
> +	 * This also avoid changing sock's netns from previous
> +	 * creator's netns to init_net when sock is re-created
> +	 * by nvme recovery path.
> +	 */
> +	ret = sock_create_kern(&init_net, ctrl->addr.ss_family, SOCK_STREAM,
>  			IPPROTO_TCP, &queue->sock);
>  	if (ret) {
>  		dev_err(nctrl->device,
> -- 
> 2.43.0
> 
> 
---end quoted text---
