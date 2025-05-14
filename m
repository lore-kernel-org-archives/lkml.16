Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE2E13AA2A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260967; cv=none; b=SyU/nlhwKIP6kOnAPA5nQ5AEYyclRso8C/EhHgU56m7pSRIGCd3ojmmwYbia3Q9hJzskhjF23p/yj97f7XOSkixGLfY0H0fyBC3l9RqYnRoarrey7bUtEhQ7bMrNdQiT0NJRMMMqCngp/+PzgcnGpAXyFUoz8jQzdtsQdSQ57cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260967; c=relaxed/simple;
	bh=UO2MmGTydoe751te+oHea4aOogLDHSfHT6+QxXXrueo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oDI3xPBmzUXWFQj9HmWg3+qaJ9+FqggbTq1z2xmcehZ6aEBb9QlJp+cNRkuejgStDV2/4SvneoWccRq8hJQUfEZSlLUA6lvF+eFuslxcaI2t6hx3amqMHBZFTWFxAWP0oK/Pst5FHwkrzxK1KdqCgpozHpGjlnuv4hYN/AwG4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XZp2s/AM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XZp2s/AM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB69C4CEE3;
	Wed, 14 May 2025 22:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747260966;
	bh=UO2MmGTydoe751te+oHea4aOogLDHSfHT6+QxXXrueo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XZp2s/AM1dGvqIHQ9mI/4kp0dK/+5pFWKwx+r4/6Lm0qxkKlxXkuHrnj8DYS1GWdJ
	 3qvmXmZumk7URPl5bg5wRhSxOjOuQi4DTN0+eVHW8SWNgXCL7b6zW45JzU2DNTJ0TF
	 nm0EvuAiq4hGqfBLzSbGyNTbKo+Wy4fvhthoPjXo=
Date: Wed, 14 May 2025 15:16:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jared Kangas <jkangas@redhat.com>
Cc: willy@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] radix tree: fix kmemleak false positive in
 radix_tree_shrink()
Message-Id: <20250514151605.9a07943954737f52e2895b05@linux-foundation.org>
In-Reply-To: <20250514180137.363929-1-jkangas@redhat.com>
References: <20250514180137.363929-1-jkangas@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 May 2025 11:01:37 -0700 Jared Kangas <jkangas@redhat.com> wrote:

> Kmemleak periodically produces a false positive report that resembles
> the following:
> 
> unreferenced object 0xffff00000db613b8 (size 576):
>   comm "systemd", pid 1, jiffies 4294987015
>   hex dump (first 32 bytes):
>     00 22 01 00 00 00 00 00 28 1c d5 c5 00 00 ff ff  ."......(.......
>     10 e4 6c c0 00 00 ff ff d0 13 b6 0d 00 00 ff ff  ..l.............
>   backtrace (crc 520d6e1c):
>     kmemleak_alloc+0xb4/0xc4
>     kmem_cache_alloc+0x288/0x2b0
>     radix_tree_node_alloc.constprop.0+0x214/0x364
>     idr_get_free+0x3d0/0x690
>     idr_alloc_u32+0x120/0x280
>     idr_alloc_cyclic+0xe8/0x1b4
>     __kernfs_new_node+0x118/0x5a0
>     kernfs_create_dir_ns+0x8c/0x1fc
>     cgroup_create+0x1cc/0x8a0
>     cgroup_mkdir+0x13c/0x90c
>     kernfs_iop_mkdir+0x108/0x184
>     vfs_mkdir+0x3c8/0x5f0
>     do_mkdirat+0x218/0x290
>     __arm64_sys_mkdirat+0xe0/0x140
>     invoke_syscall.constprop.0+0x74/0x1e4
>     do_el0_svc+0xd0/0x1dc
> 
> This is a transient leak that can be traced to radix_tree_shrink(): when
> root->xa_head is set, kmemleak may have already started traversing the
> radix tree. If this has happened, but kmemleak fails to scan the new
> xa_head before it moves, kmemleak will see it as a leak until the radix
> tree is scanned again.
> 
> Mark the new xa_head as a transient leak to prevent this false positive
> report.
> 
> ...
>
> --- a/lib/radix-tree.c
> +++ b/lib/radix-tree.c
> @@ -509,6 +509,14 @@ static inline bool radix_tree_shrink(struct radix_tree_root *root)
>  		if (is_idr(root) && !tag_get(node, IDR_FREE, 0))
>  			root_tag_clear(root, IDR_FREE);
>  
> +		/*
> +		 * Kmemleak might report a false positive if it traverses the
> +		 * tree while we're shrinking it, since the reference moves
> +		 * from node->slots[0] to root->xa_head.
> +		 */
> +		if (radix_tree_is_internal_node(child))
> +			kmemleak_transient_leak(entry_to_node(child));
> +

There is only one other caller of kmemleak_transient_leak().  Makes me
think that perhaps a more fundamental fix is needed.

So I'll queue it for testing for now, but I won't proceed further until
some further examination has occured.  Thanks.

